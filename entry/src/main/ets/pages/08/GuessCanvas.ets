import promptAction from '@ohos.promptAction'

@Entry
@Component
struct GuessCanvas {
  context: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true))
  guessContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true))
  drawImg: boolean = false
  //上一次位置的坐标点
  lastX: number = 0
  lastY: number = 0
  //记录上面的一块画布的坐标点
  pointList: PointClass[] = []
  //定时器
  timer: number = -1
  //下面画布的上一次坐标点
  gLastX: number = 0
  gLastY: number = 0

  @State
  imgUrl: string = ""

  //画线的方法
  drawLine(x: number, y: number) {
    this.context.moveTo(this.lastX, this.lastY)
    this.context.lineTo(x, y)
    this.lastX = x
    this.lastY = y
    this.context.stroke()
  }
  //开始绘制下面的画布
  drawGuess() {
    if (this.pointList.length && this.timer === -1) {
      this.timer = setInterval(() => {
        if (this.pointList.length === 0) {
          clearInterval(this.timer)
          this.timer = -1
          return
        }
        let p: PointClass = this.pointList.shift() //取出数组中第一个元素
        this.guessLine(p) //开始画线
      }, 10)
    }
  }

  guessLine(p: PointClass) {
    if (p.reset) {
      this.guessContext.closePath()
      this.guessContext.beginPath()
      this.gLastX = p.x
      this.gLastY = p.y
    } else {
      this.guessContext.moveTo(this.gLastX, this.gLastY)
      this.guessContext.lineTo(p.x, p.y)
      this.gLastX = p.x
      this.gLastY = p.y
      this.guessContext.stroke()
    }
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Canvas(this.context)
          .width(360)
          .height(300)
          .backgroundColor(Color.Grey)
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) { //开始作画
              this.drawImg = true
              //开始作画，是从这个点开始的
              this.lastX = event.touches[0].x
              this.lastY = event.touches[0].y
              this.context.beginPath()
              //开始记录坐标点
              this.pointList.push({
                x: this.lastX,
                y: this.lastY,
                reset: true //按下去意味着重新开始一段路径
              })
            }

            if (event.type === TouchType.Up) { //结束作画
              this.drawImg = false
              this.context.closePath()
              this.drawGuess()
            }
            if (event.type === TouchType.Move) { //作画
              if (this.drawImg) {
                //拿到移动的坐标点
                this.drawLine(event.touches[0].x, event.touches[0].y)
                //记录移动的点
                this.pointList.push({
                  x: event.touches[0].x,
                  y: event.touches[0].y,
                  reset: false
                })
              }
            }
          })
          .onReady(() => {
            this.context.lineWidth = 4
            this.context.strokeStyle = 'blue'
          })
        Canvas(this.guessContext)
          .width(360)
          .height(300)
          .backgroundColor(Color.Red)
          .onReady(() => {
            this.context.lineWidth = 4
            this.context.strokeStyle = '#fff'
          })

        Row({space: 20}){
          Button("清空画布")
            .onClick(() => {
              this.context.clearRect(0,0,360,300)
              this.guessContext.clearRect(0,0,360,300)
              this.pointList = []
            })
          Button("签字版保存")
            .onClick(() => {
              this.imgUrl = this.context.toDataURL("iamge/png")
            })
        }
        if (this.imgUrl) {
          Image(this.imgUrl).width('100%').aspectRatio(1.2).backgroundColor(Color.Green)
        }

      }
      .width('100%')
    }
    .height('100%')
  }
}

class PointClass {
  x: number = 0
  y: number = 0
  reset?: boolean = false //是否重新开始一段路径
}