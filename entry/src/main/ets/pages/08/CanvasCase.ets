@Entry
@Component
struct CanvasCase {

  //显示声明 画笔对象
  context: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true)) //抗锯齿处理

  build() {
    Row() {
      Column() {
        Canvas(this.context)
          .width('100%')
          .aspectRatio(1.2)
          .backgroundColor(Color.Grey)
          .onReady(() => {
            //canvas已经准备好了
            // this.context.lineWidth = 4
            // this.context.strokeStyle = '#fff'
            // this.context.rect(0,0,100,100)
            // this.context.stroke() //完成绘制框的渲染
          })
          .onAreaChange((oldValue: Area, newValue: Area) => {
            AlertDialog.show({
              message: JSON.stringify(newValue)
            })
          })

        Row({ space: 20 }) {
          Button('画线')
            .onClick(() => {
              //闭环隔离 开始绘制--结束绘制
              this.context.beginPath()
              this.context.lineWidth = 4 //线的宽度
              this.context.strokeStyle = 'blue'
              this.context.moveTo(50, 50)
              this.context.lineTo(250, 250)
              this.context.stroke()
              this.context.closePath() //结束绘制
            })
          Button('画圆')
            .onClick(() => {
              //闭环隔离 开始绘制--结束绘制
              this.context.beginPath()
              this.context.lineWidth = 6 //线的宽度
              this.context.strokeStyle = 'red'
              this.context.fillStyle = 'blue'
              this.context.arc(150, 100, 40, 0, 360, false)
              this.context.stroke()
              this.context.fill()
              this.context.closePath() //结束绘制
            })
          Button('画矩形')
            .onClick(() => {
              //闭环隔离 开始绘制--结束绘制
              this.context.beginPath()
              this.context.lineWidth = 6 //线的宽度
              this.context.strokeStyle = 'red'
              this.context.rect(90, 75, 150, 150)
              this.context.stroke()
              this.context.fill()
              this.context.closePath() //结束绘制
            })
          Button('清空面板')
            .onClick(() => {
              this.context.clearRect(0, 0, 360, 300)
            })
        }
      }
      .width('100%')
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}