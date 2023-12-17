@Entry
@Component
struct PropCase {
  @State message: string = 'Hello World'

  @State num: number = 0
  build() {
    Row() {
      Column() {
        Text(this.num.toString()).fontColor('green').fontSize(40).fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.num++
          })
        Divider().strokeWidth(2).width('100%').color(Color.Red)
        Child({num: $num})   //@Link组件传值必须用$
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Child {
  @Link   //父变子变，子变父变
  // @Prop 父变子变，子变父不变
  num: number
  build() {
    Row(){
      Text(this.num.toString()).fontSize(40).fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.num++
        })
    }
  }
}