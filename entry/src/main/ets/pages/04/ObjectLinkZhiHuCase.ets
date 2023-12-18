import image from '@ohos.multimedia.image'

@Entry
@Component
struct ZhiHuCase {
  @State commentList: ReplyItemClass[] = [
    new ReplyClass({
      id: 1,
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: '偏执狂-妄想家',
      content: '更何况还分到一个摩洛哥[惊喜]',
      time: '11-30',
      area: '海南',
      likeNum: 34
    }),
    new ReplyClass({
      id: 2,
      avatar: 'https://pic1.zhimg.com/v2-5a3f5190369ae59c12bee33abfe0c5cc_xl.jpg?source=32738c0c',
      author: 'William',
      content: '当年希腊可是把1：0发挥到极致了',
      time: '11-29',
      area: '北京',
      likeNum: 58
    }),
    new ReplyClass({
      id: 3,
      avatar: 'https://picx.zhimg.com/v2-e6f4605c16e4378572a96dad7eaaf2b0_l.jpg?source=06d4cd63',
      author: 'Andy Garcia',
      content: '欧洲杯其实16队球队打正赛已经差不多，24队打正赛意味着正赛阶段在小组赛一样有弱队。',
      time: '11-28',
      area: '上海',
      likeNum: 10
    }),
    new ReplyClass({
      id: 4,
      avatar: 'https://picx.zhimg.com/v2-53e7cf84228e26f419d924c2bf8d5d70_l.jpg?source=06d4cd63',
      author: '正宗好鱼头',
      content: '确实眼红啊，亚洲就没这种球队，让中国队刷',
      time: '11-27',
      area: '香港',
      likeNum: 139
    }),
    new ReplyClass({
      id: 5,
      avatar: 'https://pic1.zhimg.com/v2-eeddfaae049df2a407ff37540894c8ce_l.jpg?source=06d4cd63',
      author: '柱子哥',
      content: '我是支持扩大的，亚洲杯欧洲杯扩到32队，世界杯扩到64队才是好的，世界上有超过200支队伍，欧洲区55支队伍，亚洲区47支队伍，即使如此也就六成出现率',
      time: '11-27',
      area: '旧金山',
      likeNum: 29
    }),
    new ReplyClass({
      id: 6,
      avatar: 'https://picx.zhimg.com/v2-fab3da929232ae911e92bf8137d11f3a_l.jpg?source=06d4cd63',
      author: '飞轩逸',
      content: '禁止欧洲杯扩军之前，应该先禁止世界杯扩军，或者至少把亚洲名额一半给欧洲。',
      time: '11-26',
      area: '里约',
      likeNum: 100
    })
  ]

  changeLike(obj: ReplyClass) {
    if (obj.likeFlag) {
      obj.likeFlag = false
      obj.likeNum--
    } else {
      obj.likeFlag = true
      obj.likeNum++
    }
    const index = this.commentList.findIndex(item => item.id === obj.id)
    this.commentList.splice(index, 1, obj)
  }

  addcomment(item: ReplyClass) {
    this.commentList.unshift(item)
  }

  build() {
    //组件内元素，后边的可以贴到前面的组件上
    Stack({ alignContent: Alignment.Bottom }) {
      //使用Scroll可以有滚动条，但是子组件只能有一个，且不能设置高度
      Scroll() {
        Column() {
          HmNavBar()
          HmCommentItem({
            item: {
              id: 0,
              avatar: '/assets/test10.jpeg',
              author: "老高",
              content: "dgrehgsffghdghjhfkhjf",
              time: "12-17",
              area: "北京",
              likeNum: 90,
              likeFlag: false
            }
          })
          Divider()
            .strokeWidth(6)
            .color('#f6f6f6')
            .width('100%')
          Row() {
            Text('回复7')
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .height(40)
          .justifyContent(FlexAlign.Start)
          .padding({
            left: 20
          })

          ForEach(this.commentList, (obj: ReplyClass) => {
            HmCommentItem({ item: obj})
          })


        }
      }
      .padding({
        bottom: 60
      })

      ReplyInput({
        add: (item: ReplyClass) => {
          this.addcomment(item)
        }
      })

    }

  }
}

//评论回复组件
@Component
struct ReplyInput {
  @State commentStr: string = ""
  add: (item: ReplyClass) => void = () => {}

  build() {
    Row() {
      TextInput({ placeholder: '请回复～', text: this.commentStr })
        .backgroundColor('#f4f6f5')
        .layoutWeight(1)
        .onChange((value) => {
          this.commentStr = value
        })
      Text('发布')
        .margin({
          left: 10
        })
        .fontColor('#56b4f5')
        .onClick(() => {
          if (this.commentStr !== "") {
            let obj: ReplyClass = {
              id: new Date().getMilliseconds(),
              avatar: '/assets/a.png',
              author: "坏坏的老高",
              content: this.commentStr,
              time: `${new Date().getMonth() + 1}-${new Date().getDate()}`,
              area: "北京",
              likeNum: 0,
              likeFlag: false
            }
            this.add(obj)
            this.commentStr = ""
          }

        })
    }
    .width('100%')
    .height(50)
    .backgroundColor(Color.White)
    .border({
      color: '#f4f5f6',
      width: {
        top: 3
      }
    })
    .padding({
      left: 10,
      right: 10
    })

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
  @ObjectLink
  item: ReplyClass
  build() {
    Row() {
      Image(this.item.avatar)
        .width(32)
        .aspectRatio(1)
        .borderRadius(16)
      Column({ space: 10 }) {
        Text(this.item.author)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
        Text(this.item.content)
          .fontSize(16)
          .fontColor('#565656')
          .lineHeight(20)
        //底部
        Row() {
          Text(`${this.item.time} .IP属地${this.item.area}`)
            .fontColor('#c3c4c5')
            .fontSize(12)

          Row() {
            Image('/assets/like1.svg')
              .width(12)
              .aspectRatio(1)
              .fillColor(this.item.likeFlag ? Color.Red : '#c3c4c5')
              .margin({
                right: 5
              })
            Text(this.item.likeNum?.toString())
              .fontSize(12)
              .fontColor('#c3c4c5')
          }
          .onClick(() => {
            if (this.item.likeFlag) {
              this.item.likeFlag = false
              this.item.likeNum--
            } else {
              this.item.likeFlag = true
              this.item.likeNum++
            }
          })
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

//export是导出文件的意思
export class ReplyItemClass {
  id: number = 0
  avatar: string | Resource = ""
  author: string = ""
  content: string = ""
  time: string = ""
  area: string = ""
  likeNum: number = 0
  likeFlag?: boolean = false
}

@Observed
export class ReplyClass extends ReplyItemClass {
  constructor(obj: ReplyItemClass) {
    super()
    this.id = obj.id
    this.avatar = obj.avatar
    this.author = obj.author
    this.content = obj.content
    this.time = obj.time
    this.likeNum = obj.likeNum
    this.likeFlag = obj.likeFlag
  }
}