@Entry
@Component
struct StateStylesCase {
  @State textEnable: boolean = true

  @Styles
  pressStyles() {
    .width(200)
    .height(80)
    .borderRadius(40)
    .backgroundColor(Color.Pink)
  }

  @Styles
  disableStyles() {
    .backgroundColor(Color.Red)
  }

  @Styles
  inputFocusStyles() {
    .border({
      color: Color.Red,
      width: 1
    })
  }
  @Styles
  inputNormalStyles() {
    .border({
      color: Color.Red,
      width: 0
    })
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Row() {
          TextInput()
            .height(40)
            .stateStyles({
              focused: this.inputFocusStyles,
              normal: this.inputNormalStyles
            })
        }
        .padding({
          left: 20,
          right: 20
        })
        Row() {
          TextInput()
            .height(40)
            .stateStyles({
              focused: this.inputFocusStyles,
              normal: this.inputNormalStyles
            })
        }
        .padding({
          left: 20,
          right: 20
        })


        Text('登录')
          .text3Style()
          .stateStyles({
            pressed: this.pressStyles,
            disabled: this.disableStyles
          }).enabled(this.textEnable)
        Button('设置文本禁用').onClick(() => {
          this.textEnable = !this.textEnable
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text) function text3Style() {
  .width(100)
  .height(40)
  .textAlign(TextAlign.Center)
  .borderRadius(20)
  .backgroundColor(Color.Gray)
  .fontColor(Color.White)
}