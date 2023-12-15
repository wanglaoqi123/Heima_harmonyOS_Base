import image from '@ohos.multimedia.image'

@Entry
@Component
struct ZhiHu {
  build() {
    Column() {
      HmNavBar()
      HmCommentItem()
    }
    .height('100%')

  }
}


@Component
struct HmNavBar {
  build() {
    Row() {
      Row() {
        Image($r('app.media.ic_public_arrow_left'))
          .width(12)
          .aspectRatio(1)
          .fillColor('#848484')

      }
      .width(24)
      .height(24)
      .backgroundColor('#f5f5f5')
      .borderRadius(12)
      .margin({
        left: 15
      })
      .justifyContent(FlexAlign.Center)

      Text("评论回复")
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .fontSize(18)
        .margin({
          right: 39
        })
    }
    .height(40)
    .border({
      width: {
        bottom: 0.5
      },
      color: '#848484'

    })

  }
}

@Component
struct HmCommentItem {
  build() {
    Row() {
      Image('/assets/test10.jpeg')
        .width(32)
        .aspectRatio(1)
        .borderRadius(16)
      Column({ space: 10 }) {
        Text('周杰伦')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
        Text('意大利拌面应该使用42号钢筋混凝土再加上量子力学缠绕最后通过不畏浮云遮望眼')
          .fontSize(16)
          .fontColor('#565656')
          .lineHeight(20)
        //底部
        Row() {
          Text('10-21 .IP属地北京')
            .fontColor('#c3c4c5')
            .fontSize(12)

          Row() {
            Image('/assets/like-line.svg')
              .width(12)
              .aspectRatio(1)
              .fillColor('#c3c4c5')
              .margin({
                right: 5
              })
            Text("100")
              .fontSize(12)
              .fontColor('#c3c4c5')
          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({
        left: 10
      })

    }
    .padding(15)
    .alignItems(VerticalAlign.Top)
  }
}