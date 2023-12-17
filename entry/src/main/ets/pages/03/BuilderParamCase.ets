@Entry
@Component
struct BuilderParamCase {
  @State message: string = 'Hello World'

  @Builder
  getContent() {
    Row() {
      Text('插槽内容')
        .fontColor(Color.Green)
    }
  }

  @Builder
  getInput () {
    Row() {
      TextInput({placeholder: '我是第二个插槽'})
        .width(200)
        .height(50)
        .backgroundColor(Color.Orange)
    }
  }

  build() {
    Row() {
      Column({space: 20}) {
        // HmCard({content: this.getContent })
        // HmCard({content: this.getInput })
        HmCard(){
          Text('诶呀，好难呀')
          Text('诶呀，好难呀')
          Text('诶呀，好难呀')
          Text('诶呀，好难呀')
          this.getInput()
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct HmCard {
  @BuilderParam
  content: () => void = () => {}

  build() {
    Column() {
      Text('卡片内容')
      Divider()
        .strokeWidth(6)
        .color(Color.Red)
      Text('传入内容')
      if (this.content) {
        this.content()
      }
    }

  }
}