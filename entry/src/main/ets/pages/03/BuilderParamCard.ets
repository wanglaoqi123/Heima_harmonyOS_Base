@Entry
@Component
struct BuilderParamCard {
  build() {
    Row() {
      Column() {
        HmCard2() {
          HmItemCard({ leftName: '员工姓名', rightValue: '张三' })
          HmItemCard({ leftName: '员工编号', rightValue: '1234' })
          HmItemCard({ leftName: '员工权限', rightValue: '张三' })
          HmItemCard({ leftName: '员工组织', rightValue: '组织部' })
          HmItemCard({ leftName: '员工上级', rightValue: '老高',showBottomBorder: false })
        }
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}

@Component
struct HmCard2 {
  @BuilderParam
  Cardfn: () => void = () => {
  }

  build() {
    Column() {
      Column() {
        this.Cardfn()
      }
      .backgroundColor(Color.White)
      .margin({
        top: 10,
      })
      .width('100%')
      .borderRadius(20)
    }
    .padding({
      left: 10,
      right: 10
    })
  }
}

@Component
struct HmItemCard {
  showBottomBorder: boolean = true
  leftName: string = ""
  rightValue: string = ""

  build() {
    Row() {
      Text(this.leftName)
      Text(this.rightValue).fontColor('#ccc')
    }
    .height(40)
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({
      left: 10,
      right: 10
    })
    .border({
      color: '#f4f5f6',
      width: {
        bottom: this.showBottomBorder ? 1 : 0
      }
    })
  }
}