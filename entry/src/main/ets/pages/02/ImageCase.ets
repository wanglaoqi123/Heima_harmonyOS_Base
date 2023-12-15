@Entry
@Component
struct ImageCase {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        // Image("/assets/a.png")
        //   .width(100)
        //   .aspectRatio(1)
        //   .borderRadius(50)

        // Image($r("app.media.test")) //最常用
        //   .width(200)
        //   .aspectRatio(1)
        //   .borderRadius(100)

        // Image($rawfile("test10.jpeg"))
        //   .width(100)
        //   .aspectRatio(1)
        //   .borderRadius(50)
        //
        Image("http://pic1.win4000.com/mobile/2020-02-09/5e3fc6434b9c0.jpg")
          .width(100)
          .height(200)


      }
      .width('100%')
    }
    .height('100%')
  }
}