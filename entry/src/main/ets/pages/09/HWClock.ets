import router from '@ohos.router'
import { ClockItemClass, MyClockStore } from './ClockStore'
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct HWClock {
  myStore: MyClockStore = new MyClockStore()
  @State
  list: ClockItemClass[] = []
  //页面显示就要拿到闹钟列表，不是只有第一次才拿
  //用onPageShow(), 不是aboutToAppear()
  async onPageShow() {
    this.list = await this.myStore.getClockList()
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column({ space: 15 }) {
        Text('闹钟')
          .fontSize('24')
          .width('100%')
        //放置时钟
        CanvasClock()
        //放置n个闹钟任务
        List({space: 10}) {
          ForEach(this.list,(item: ClockItemClass) => {
            ListItem() {
              ClockItem({item})
                .onClick(() => {
                  router.pushUrl({
                    url: "pages/09/AddClock",
                    params: {
                      id: item.id
                    }
                  })
                })
            }
          })
        }
      }
      .padding(15)
      .height('100%')
      .width('100%')
      .backgroundColor('#f5f5f5')

      //添加
      Text("+")
        .width(50)
        .aspectRatio(1)
        .backgroundColor('#06f')
        .fontSize(40)
        .fontWeight(100)
        .fontColor('#fff')
        .borderRadius(25)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 50 })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/09/AddClock'
          })
        })
    }

  }
}

@Component
struct CanvasClock {
  //画布大小
  canvasSize: number = 252
  //定时器
  timer: number = 0
  //表盘图片
  panImage: ImageBitmap = new ImageBitmap('/images/ic_clock_pan.png')
  //时针
  hourImage: ImageBitmap = new ImageBitmap('/images/ic_hour_pointer.png')
  //分针
  minImage: ImageBitmap = new ImageBitmap('/images/ic_minute_pointer.png')
  //秒针
  secondImage: ImageBitmap = new ImageBitmap('/images/ic_second_pointer.png')
  //画笔
  context: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true))
  //画表盘
  drawClock() {
   this.timer =  setInterval(() => {
      this.context.clearRect(0, 0, this.canvasSize, this.canvasSize)
      this.context.drawImage(this.panImage, 0, 0, this.canvasSize, this.canvasSize)
      //画时针 分针 秒针
      const currentTime = new Date() // 获取当前时间
      const hour: number = currentTime.getHours() % 12 / 12 * 360 + currentTime.getMinutes() / 60 * 30
      const min: number = currentTime.getMinutes() / 60 * 360 + currentTime.getSeconds() / 60 * 5
      const second: number = currentTime.getSeconds() / 60 * 360
      this.drawPointer(this.hourImage, hour)
      this.drawPointer(this.minImage, min)
      this.drawPointer(this.secondImage, second)
    }, 1000)
  }
  //画指针
  drawPointer(image: ImageBitmap, angle: number) {
    this.context.save() //保存路径
    //如何让我们的指针指向12点
    this.context.translate(this.canvasSize / 2, this.canvasSize / 2) //将圆心挪到表盘中间
    this.context.rotate((angle + 180) * Math.PI / 180) //将画笔旋转180度的弧度
    this.context.translate(-this.canvasSize / 2, -this.canvasSize / 2)
    this.context.drawImage(image, this.canvasSize / 2 - 4, 0, 8, this.canvasSize)
    this.context.restore() // 恢复画布的位置
  }
  aboutToDisappear() {
    clearInterval(this.timer)
  }
  build() {
    //画布
    Canvas(this.context)
      .width(252)
      .aspectRatio(1)
      .onReady(() => {
        this.drawClock()
      })
  }
}

@Component
export struct ClockItem {
  item: Partial<ClockItemClass> = {}
  build() {
    Row(){
      Column({ space: 5 }) {
        Row({ space: 5 }){
          Text(`${this.item.hour > 12 ? '下午' : '上午'}`)
            .fontColor('#666')
          Text(`${this.item.hour}:${this.item.minute}`)
            .fontWeight(600)
            .fontSize(18)
        }
        Row({ space: 15 }){
          Text('闹钟')
            .fontColor('#999')
            .fontSize(14)
          Text('不重复')
            .fontColor('#999')
            .fontSize(14)
        }
      }
      .alignItems(HorizontalAlign.Start)

      // 开关
      Toggle({ type: ToggleType.Switch , isOn: true })
    }
    .height(64)
    .padding({ left: 20, right: 15 })
    .width('100%')
    .backgroundColor('#fff')
    .borderRadius(30)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}