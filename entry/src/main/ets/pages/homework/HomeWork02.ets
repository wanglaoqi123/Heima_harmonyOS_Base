@Entry
@Component
struct HomeWork02 {
  @State caidan: string[] = ['一人套餐', '特色烧烤', '杂粮主食']
  @State foodtag: string = ''
  @State daohanglan: string = '0'
  @State allList: AllKindsFoodList[] = [
    {
      "tag": "318569657",
      "name": "一人套餐",
      "foods": [
        {
          "id": 8078956697,
          "name": "烤羊肉串(10串)",
          "like_ratio_desc": "好评度100%",
          "month_saled": 40,
          "unit": "10串",
          "food_tag_list": [
            "点评网友推荐"
          ],
          "price": 90,
          "picture": "https://zqran.gitee.io/images/waimai/8078956697.jpg",
          "description": "",
          "tag": "318569657",
          "count": 1
        },
        {
          "id": 7384994864,
          "name": "腊味煲仔饭",
          "like_ratio_desc": "好评度81%",
          "month_saled": 100,
          "unit": "1人份",
          "food_tag_list": [],
          "price": 39,
          "picture": "https://zqran.gitee.io/images/waimai/7384994864.jpg",
          "description": "",
          "tag": "318569657",
          "count": 1
        },
        {
          "id": 2305772036,
          "name": "鸡腿胡萝卜焖饭",
          "like_ratio_desc": "好评度91%",
          "month_saled": 300,
          "unit": "1人份",
          "food_tag_list": [],
          "price": 34.32,
          "picture": "https://zqran.gitee.io/images/waimai/2305772036.jpg",
          "description": "主料：大米、鸡腿、菜心、胡萝卜",
          "tag": "318569657",
          "count": 1
        },
        {
          "id": 2233861812,
          "name": "小份酸汤莜面鱼鱼+肉夹馍套餐",
          "like_ratio_desc": "好评度73%",
          "month_saled": 600,
          "unit": "1人份",
          "food_tag_list": [
            "“口味好,包装很好～点赞”"
          ],
          "price": 34.32,
          "picture": "https://zqran.gitee.io/images/waimai/2233861812.jpg",
          "description": "酸汤莜面鱼鱼，主料：酸汤、莜面 肉夹馍，主料：白皮饼、猪肉",
          "tag": "318569657",
          "count": 1
        }
      ]
    },
    {
      "tag": "82022594",
      "name": "特色烧烤",
      "foods": [
        {
          "id": 3823780596,
          "name": "藤椒鸡肉串",
          "like_ratio_desc": "",
          "month_saled": 200,
          "unit": "10串",
          "food_tag_list": [
            "点评网友推荐"
          ],
          "price": 6,
          "picture": "https://zqran.gitee.io/images/waimai/3823780596.jpg",
          "description": "1串。藤椒味，主料：鸡肉",
          "tag": "82022594",
          "count": 1
        },
        {
          "id": 6592009498,
          "name": "烤羊排",
          "like_ratio_desc": "",
          "month_saled": 50,
          "unit": "1人份",
          "food_tag_list": [],
          "price": 169,
          "picture": "https://zqran.gitee.io/images/waimai/6592009498.jpg",
          "description": "6-8个月草原羔羊肋排，烤到皮脆肉香",
          "tag": "82022594",
          "count": 1
        }
      ]
    },
    {
      "tag": "98147100",
      "name": "杂粮主食",
      "foods": [
        {
          "id": 4056954171,
          "name": "五常稻花香米饭",
          "like_ratio_desc": "",
          "month_saled": 1000,
          "unit": "约300克",
          "food_tag_list": [],
          "price": 5,
          "picture": "https://zqran.gitee.io/images/waimai/4056954171.jpg",
          "description": "浓浓的稻米清香，软糯Q弹有嚼劲",
          "tag": "98147100",
          "count": 1
        },
        {
          "id": 740430262,
          "name": "小米发糕(3个)",
          "like_ratio_desc": "好评度100%",
          "month_saled": 100,
          "unit": "3块",
          "food_tag_list": [],
          "price": 13,
          "picture": "https://zqran.gitee.io/images/waimai/740430262.jpg",
          "description": "柔软蓬松，葡萄干和蔓越莓酸甜适口",
          "tag": "98147100",
          "count": 1
        },
        {
          "id": 7466390504,
          "name": "沙枣玉米窝头(3个)",
          "like_ratio_desc": "好评度100%",
          "month_saled": 100,
          "unit": "3个",
          "food_tag_list": [],
          "price": 13,
          "picture": "https://zqran.gitee.io/images/waimai/7466390504.jpg",
          "description": "",
          "tag": "98147100",
          "count": 1
        }
      ]
    }
  ]

  build() {
    Column() {
      //顶部
      Top()

      //中间
      Center({ caidan: this.caidan, foodtag: this.foodtag, allList: this.allList })
      //底部
      Bottom()

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
struct Top {
  build() {
    Row({ space: 10 }) {
      Text('点菜')
        .TextStyle1()
      Row() {
        Text('评价')
          .TextStyle1()
        Text('1796')
          .fontSize(12)
          .margin({
            bottom: 0
          })
      }

      Text('商家')
        .TextStyle1()
      Row() {
        Image($r('app.media.ic_public_input_search'))
          .width('20')
          .height('20')
        TextInput({ placeholder: '请输入菜品名称' })
          .layoutWeight(1)
      }
      .width(20)
      .layoutWeight(1)
    }
    .padding({
      right: 10,
      left: 10
    })
    .width('100%')
    .height(60)
    .border({
      width: {
        bottom: 2
      },
      color: '#eeeeee'
    })
  }
}

@Component
struct Center {
  allList: AllKindsFoodList[] = []
  caidan: string[] = []
  foodtag: string = ""

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.caidan[0])
          .onClick(() => {
            this.foodtag = this.caidan[0]
          })
        Text(this.caidan[1])
          .onClick(() => {
            this.foodtag = this.caidan[1]
          })
        Text(this.caidan[2])
          .onClick(() => {
            this.foodtag = this.caidan[2]
          })
      }
      .width('25%')

      List() {
        ForEach(this.allList, (item: AllKindsFoodList) => {
          ListItem() {
            if (item.name === '一人套餐') {
              Row() {
                List() {
                  ForEach(item.foods, (food: FoodList) => {
                    ListItem() {
                      CenterItem({food: food})
                    }
                  })
                }

              }
            }

          }

        })
      }
      .width('75%')
    }
    .layoutWeight(1)
    .alignItems(VerticalAlign.Top)

  }
}

@Component
struct CenterItem {
  food: Partial<FoodList> = {}
  build() {
    Row() {
      Image(this.food.picture)
        .width(60)
        .height(60)
        .margin({
          left: 5,
          right: 5
        })

      Column() {
        Text(this.food.name)
          .fontSize(17)
        Text(`${this.food.description}` !== '' ? `${this.food.description}` : '')
          .fontSize(12)
          .fontColor('#757575')
        Row() {
          ForEach(this.food.food_tag_list, (tag: string) => {
            Text(tag)
              .fontSize(8)
              .fontColor('#ff8607')
              .backgroundColor('#fff5e0')
          })
        }

        Text('月销售' + `${this.food.month_saled}` + ' ' + `${this.food.like_ratio_desc}`)
          .fontSize(12)
          .fontColor('#9c9c9c')
        Row() {
          Row() {
            Text('¥')
              .fontColor('#ff7700')
              .fontSize(10)
            Text(`${this.food.price}`)
              .fontColor('#ff7700')
              .fontSize(18)
          }

          Image($r('app.media.ic'))
            .width(15)
            .height(15)
            .backgroundColor('#ffc527')

        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .padding({
        right: 10
      })
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .alignItems(VerticalAlign.Top)
  }
}

@Component
struct Bottom {
  build() {
    Row() {
      Row() {
        Image($r('app.media.cart'))
          .width(60)
          .height(80)
          .margin({
            bottom: 20
          })
        Column({ space: 5 }) {
          Row() {
            Text('¥')
              .fontColor(Color.White)
              .fontSize(13)
            Text('0.00')
              .fontSize(20)
              .fontColor(Color.White)
          }

          Text('预估另需配送费 ¥5')
            .fontSize(10)
            .fontColor('#545557')
        }
        .padding({
          left: 10
        })
        .alignItems(HorizontalAlign.Start)
      }
      .borderRadius({
        topLeft: 30,
        bottomLeft: 30
      })
      .width(250)
      .backgroundColor('#222426')


      Text('去结算')
        .textAlign(TextAlign.Center)
        .backgroundColor('#ffc527')
        .fontSize(20)
        .width(80)
        .height(60)
        .borderRadius({
          topRight: 30,
          bottomRight: 30
        })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({
      bottom: 10,
      right: 10,
      left: 10
    })
    .height(60)
  }
}

@Extend(Text) function TextStyle1() {
  .fontSize(15)
  .textAlign(TextAlign.Start)
}

@Extend(Text) function TextStyle2() {
  .fontSize(15)
  .textAlign(TextAlign.Start)
  .fontWeight(FontWeight.Bold)
}


class AllKindsFoodList {
  tag: string
  name: string
  foods: FoodList[]
}

class FoodList {
  id: number
  name: string
  like_ratio_desc: string
  month_saled: number
  unit: string
  food_tag_list: string[]
  price: number
  picture: string
  description: string
  tag: string
  count: number
}