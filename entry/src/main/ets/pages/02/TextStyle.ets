import promptAction from '@ohos.promptAction'
@Styles
function commenStyle() {
  .width(100)
  .aspectRatio(2)
  .borderRadius(15)
  .backgroundColor(Color.Pink)
  .onClick(() => {
    promptAction.showToast({
      message: "测试"
    })
  })
}


@Entry
@Component
struct TextStyle {

  @Styles styleRepeat() {
    .width(100)
    .aspectRatio(2)
    .borderRadius(15)
    .backgroundColor(Color.Blue)
    .onClick(() => {
      promptAction.showToast({
        message: "测试~~~"
      })
    })
  }


  build() {
    Row() {
      Column({space: 15}) {
        Text("测试")
          .commenStyle()
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Text("测试2")
          .commenStyle()
          .styleRepeat()
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
    }
    .height('100%')
  }
}