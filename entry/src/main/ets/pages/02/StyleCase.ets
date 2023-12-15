@Entry
@Component
struct StyleCase {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column()
        .width('25%')
        .aspectRatio(1) //宽高比
        .backgroundColor(Color.Red)



      // Column() {
        // Text(this.message)
        //   .backgroundColor('red')
        //   .fontSize(40)
        //   .width(200)
        //   .height(100)
        //   .textAlign(TextAlign.End)

        // Text("像素vp测试")
        //   .fontSize("50") //1080像素密度 1vp相当于3px   375  1080  360

        // Row() {
        //   Text("左侧内容")
        //   Row()
        //     .backgroundColor(Color.Red)
        //     .height(50)
        //     // .width('70%')
        //     .layoutWeight(1)
        //   Row()
        //     .backgroundColor(Color.Blue)
        //     .height(50)
        //     .layoutWeight(10) //分配剩余空间的占用比例
        // }.width('100%')

      // }
      // .justifyContent(FlexAlign.SpaceBetween)
      // .width('100%')
    }
    .height('100%')
  }
}