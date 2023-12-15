@Entry
@Component
struct ExtendCase {

  build() {
    Row() {
      Column({space: 20}) {
        Text("测试2")
          .text2Style()
        Button('按钮')
          .btnStyle()
        TextInput()
          .textStyle()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text) function text2Style() {
  .width(100)
  .height(50)
  .backgroundColor(Color.Pink)
  .textAlign(TextAlign.Center)
  .fontSize(25)
  .borderRadius(20)
}

@Extend(Button) function btnStyle() {
  .width(100)
  .height(50)
  .borderRadius(15)
  .backgroundColor(Color.Green)
  .fontSize(30)
}

@Extend(TextInput) function textStyle() {
  .width(200)
  .height(50)
  .borderRadius(30)
}

// @Extend(Text) function textInputAll (callback?: () => void) {
//   .width(100)
//   .height(50)
//   .backgroundColor(Color.Pink)
//   .borderRadius(25)
//   .textAlign(TextAlign.Center)
//   .fontColor(Color.White)
//   .onClick(() => {
//     callback && callback()
//   })
// }