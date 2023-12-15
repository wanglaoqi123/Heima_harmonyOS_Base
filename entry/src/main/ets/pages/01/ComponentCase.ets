@Entry
@Component
struct ComponentCase {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text("大宝只真可爱")
        Text() {//子组件只能放span
          Span("¥")
            .fontSize(12)
          Span("50.45")
            .fontSize(20)
        }

        Row({space: 15}) {
          Column()
            .width(100)
            .height(200)
            .backgroundColor(Color.Pink)
          Column()
            .width(100)
            .height(200)
            .backgroundColor(Color.Red)
          Column()
            .width(100)
            .height(200)
            .backgroundColor(Color.Blue)

        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .justifyContent(FlexAlign.Center)
        .justifyContent(FlexAlign.SpaceEvenly)

        Column({space: 15}) {
          Column()
            .width(200)
            .height(100)
            .backgroundColor(Color.Pink)
          Column()
            .width(200)
            .height(100)
            .backgroundColor(Color.Red)
          Column()
            .width(200)
            .height(100)
            .backgroundColor(Color.Blue)
        }.margin({
          top: 20
        })

        Flex({justifyContent: FlexAlign.SpaceAround}){
          Column()
            .width(100)
            .height(200)
            .backgroundColor(Color.Pink)
          Column()
            .width(100)
            .height(200)
            .backgroundColor(Color.Red)
          Column()
            .width(100)
            .height(200)
            .backgroundColor(Color.Blue)
        }
        .margin({
          top: 30
        })


      }
      .width('100%')
    }
    .height('100%')
  }
}