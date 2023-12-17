@Builder
function getCellContent(leftTitle: string, rightValue: string) {
  Row() {
    Row() {
      Text(leftTitle)
      Text(rightValue)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: 15,
      right: 15
    })
    .borderRadius(8)
    .height(40)
    .backgroundColor(Color.White)
  }.padding({
    left: 10,
    right: 10
  })
}

@Entry
@Component
struct BuilderCase {
  @Builder
  getCellContent(leftTitle: string, rightValue: string) {
    Row() {
      Row() {
        Text(leftTitle)
        Text(rightValue)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        left: 15,
        right: 15
      })
      .borderRadius(8)
      .height(40)
      .backgroundColor(Color.White)
    }.padding({
      left: 10,
      right: 10
    })
  }
  @State formData: CardClass = {
    time: "2023-12-12",
    location: '回龙观',
    type: '漏油'
  }

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(JSON.stringify(this.formData))
        this.getCellContent("异常时间", this.formData.time)
        this.getCellContent("异常类型", this.formData.type)
        this.getCellContent("异常地点", this.formData.location)
        Button('改变异常地点').onClick(() => {
          this.formData.location = '昌平'
        })

      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#ccc')
  }
}

class CardClass {
  time: string = ""
  location: string = ""
  type: string = ""
}