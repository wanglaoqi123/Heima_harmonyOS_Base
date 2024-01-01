@Entry
@Component
struct HWClock {
  @State message: string = 'Hello World'

  build() {
    Stack({alignContent: Alignment.Bottom}) {
      Column({ space: 15 }) {
        Text('闹钟')
          .fontSize('24')
          .width('100%')
        CanvasClock()
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
    }

  }
}

@Component
struct CanvasClock {
  //画布大小
  canvasSize: number = 252
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
    this.context.drawImage(this.panImage,0,0,this.canvasSize,this.canvasSize)
    this.drawPointer(this.hourImage)
    this.drawPointer(this.minImage)
    this.drawPointer(this.secondImage)

  }
  //画指针
  drawPointer(image: ImageBitmap) {
    //如何让我们的指针指向12点
    this.context.drawImage(image,this.canvasSize / 2 - 4, 0, 8, this.canvasSize)
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