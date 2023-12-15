@Entry
@Component
struct Index {
  @State message: string = 'Hello World3'

  build() {
    //子组件以纵向排列
    Column() {
      Header()
      Main()
      Footer()
    }
  }
}

@Component
struct Header {
  build() {
    Row() {
      Text("Header")
    }
    .width('100%')
    .height('15%')
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct Main {
  build() {
    Row() {
      Text("Main")
        .fontColor(Color.White)
    }
    .width('100%')
    .height('75%')
    .backgroundColor(Color.Blue)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct Footer {
  build() {
    Row() {
      Text("Footer")
        .fontColor(Color.Red)
    }
      .width('100%')
      .height('15%')
      .backgroundColor(Color.Yellow)
      .justifyContent(FlexAlign.Center)
  }
}