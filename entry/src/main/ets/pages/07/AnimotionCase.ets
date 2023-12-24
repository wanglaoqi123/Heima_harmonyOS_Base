@Entry
@Component
struct AnimotionCase {
  @State
  widthValue: number = 100
  @State
  heightValue: number = 40
  @State
  scaleValue: number = 1

  @State
  animateObj: AnimateParam = {
    duration: 500,
    iterations: -1,
    playMode: PlayMode.Alternate
  }

  build() {
    Row() {
      Column({ space: 50 }) {
        Button('属性动画')
          .width(this.widthValue)
          .height(this.heightValue)
          .animation({
            duration: 500,
            iterations: 1,
            curve: Curve.Ease,
            // delay: 2000,  //延时
            playMode: PlayMode.Alternate
          })
        Button('按钮变化')
          .onClick(() => {
            this.widthValue = 200
            this.heightValue = 80
          })

        Image($r('app.media.xihuan'))
          .width(60)
          .height(60)
          .fillColor(Color.Red)
          .scale({
            x: this.scaleValue,
            y: this.scaleValue
          })
          .animation(this.animateObj)

        Button(this.scaleValue === 1 ? '开始心跳' : '停止心跳')
          .onClick(() => {
            if (this.scaleValue === 1) {
              this.animateObj = {
                duration: 100,
                iterations: -1,
                playMode: PlayMode.Alternate
              }
              this.scaleValue = 3
            } else {
              this.animateObj = {
                duration: 0
              }
              this.scaleValue = 1
            }

          })
      }
      .width('100%')
    }
    .height('100%')
  }
}