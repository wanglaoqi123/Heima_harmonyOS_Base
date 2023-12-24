@Entry
@Component
struct AnimateToCase {
  @State
  showCom: boolean = false
  @State
  showImg: boolean = false

  build() {
    Row() {
      Column({ space: 20 }) {
        Row() {
          if (this.showCom) {
            Row() {
              Text('元素进场')
                .fontSize(40)
                .fontColor(Color.White)
            }
            .width(280)
            .height(100)
            .backgroundColor(Color.Blue)
            .justifyContent(FlexAlign.Center)
            .transition({
              type: TransitionType.Insert,
              opacity: 0,
              translate: {
                x: '-100%'
              }
            })
            .transition({
              type: TransitionType.Delete,
              opacity: 0,
              translate: {
                x: '100%'
              }

            })
          }
        }
        .width(280)
        .height(100)

        Button(this.showCom === false ? '显示' : '隐藏')
          .onClick(() => {
            animateTo({
              duration: 500
            }, () => {
              this.showCom = !this.showCom
            })

          })

        Row() {
          if (this.showImg) {
            Image("/assets/test10.jpeg")
              .width(150)
              .height(150)
              .borderRadius(75)
              .transition({
                type: TransitionType.Insert,
                rotate: {
                  angle: -360
                },
                opacity: 0,
                translate: {
                  x: '-100%'
                },
                scale: {
                  x: 0.2,
                  y: 0.2
                }
              })
              .transition({
                type: TransitionType.Delete,
                rotate: {
                  angle: 360
                },
                opacity: 0,
                translate: {
                  x: '100%'
                },
                scale: {
                  x: 0.2,
                  y: 0.2
                }
              })
          }
        }.width('100%').height(150).justifyContent(FlexAlign.Center)

        Button('滚进来/滚出去').onClick(() => {
          animateTo({ duration: 500 }, () => {
            this.showImg = !this.showImg
          })
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}