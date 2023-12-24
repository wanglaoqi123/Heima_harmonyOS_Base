import http from '@ohos.net.http'

@Entry
@Component
struct MeiTuan {
  @State
  list: Category[] = []
  @State
  showCart: boolean = false
  @StorageLink("user_cart")
  @Watch("updateCartJSON") // Watch必须放在其他修饰符下面，第一次不生效
  cartJSON: string = "[]"
  @Provide
  cartList: FoodItem[] = []

  aboutToAppear() {
    this.getMTData()
    this.updateCartJSON()
  }

  updateCartJSON() {
    this.cartList = getCarts()
  }

  async getMTData() {
    try {
      const req = http.createHttp()
      const res = await req.request("https://zhoushugang.gitee.io/fe2022/takeaway.json")
      this.list = JSON.parse(res.result as string) as Category[]
    } catch (error) {

    }
  }

  build() {
    //底部组件显示在最上面，使用stack堆叠
    Stack({ alignContent: Alignment.Bottom }) {
      //主内容组件
      MTMain({ list: $list })
      //购物车组件
      if (this.showCart) {
        MTCart()
          .transition({
            type: TransitionType.Insert,
            translate: {
              y: '100%'
            }
          })
          .transition({
            type: TransitionType.Delete,
            translate: {
              y: '100%'
            }
          })
      }

      //底部组件
      MTBottom({ showCart: $showCart })
    }
  }
}

//主内容组件
@Component
struct MTMain {
  @Link
  list: Category[]
  // @State
  // list: string[] = ["一人套餐", "特色烧烤", '杂粮主食']
  @State
  selectIndex: number = 0

  build() {
    Column() {
      //顶部导航栏组件
      MTNav()
      //中间主要内容
      Row() {
        //左边是分类
        Column() {
          ForEach(this.list, (item: Category, index: number) => {
            Text(item.name)
              .fontSize(14)
              .height(50)
              .width('100%')
              .textAlign(TextAlign.Center)
              .onClick(() => {
                this.selectIndex = index
              })
              .backgroundColor(this.selectIndex === index ? '#fff' : '#f5f5f5')
          })
        }
        .width(90)
        .height('100%')
        .backgroundColor('#f5f5f5')

        //右边是菜品条目
        //放置若干个菜品
        List() {
          ForEach(this.list[this.selectIndex]?.foods || [], (item: FoodItem, index: number) => {
            ListItem() {
              MTFoodItem({ item })
            }
          })
        }
        .layoutWeight(1)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Top)
    }
    .width('100%')
    .height('100%')

  }
}

//主内容区右边的菜品单项组件
@Component
struct MTFoodItem {
  item: Partial<FoodItem> = {}

  build() {
    Row() {
      Image(this.item.picture)
        .height(90)
        .width(90)
      Column({ space: 5 }) {
        Text(this.item.name)
          .fontWeight(600)
          .maxLines(2)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
        Text(this.item.description)
          .fontSize(12)
          .fontColor('#333')
          .maxLines(1)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
        Row({ space: 2 }) {
          ForEach(this.item.food_tag_list, (item) => {
            Text(item)
              .fontSize(12)
              .fontColor('#ff8000')
              .backgroundColor('#fff5e2')
              .borderRadius(2)
              .padding({
                top: 2,
                bottom: 2,
                left: 5,
                right: 5
              })
          })
        }

        Text() {
          Span(`月销售${this.item.month_saled}`)
          Span(' ')
          Span(this.item.like_ratio_desc)
        }
        .fontSize(12)
        .fontColor('#999')

        Row() {
          Text() {
            Span('¥')
              .fontColor('#ff8000')
              .fontSize(10)
            Span(this.item.price.toFixed(2))
              .fontColor('#ff8000')
              .fontWeight(FontWeight.Bold)
          }

          MTAddCut({ item: this.item })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({
        right: 10,
        left: 10
      })
    }
    .padding(10)
    .alignItems(VerticalAlign.Top)
  }
}

//顶部导航栏组件
@Component
struct MTNav {
  @Builder
  NavItem(active: boolean, title: string, subTitle?: string) {
    Column() {
      Text() {
        Span(title)
        if (subTitle) {
          Span(' ' + subTitle)
            .fontSize(10)
            .fontColor(active ? '#000' : '#666')
        }
      }
      .layoutWeight(1)
      .fontColor(active ? '#000' : '#666')
      .fontWeight(active ? FontWeight.Bold : FontWeight.Normal)

      Text()
        .height(1)
        .width(20)
        .margin({ left: 6 })
        .backgroundColor(active ? '#fa0' : 'transparent')
    }
    .width(73)
    .alignItems(HorizontalAlign.Start)
    .padding({ top: 3 })
  }

  build() {
    Row() {
      this.NavItem(true, '点菜')
      this.NavItem(false, '评价', '1796')
      this.NavItem(false, '商家')
      Row() {
        Image($r('app.media.ic_public_input_search'))
          .width(21)
          .aspectRatio(1)
          .fillColor('#999')
        Text('请输入菜品名称')
          .fontSize(12)
          .fontColor('#999')
      }
      .backgroundColor('#eee')
      .height(25)
      .borderRadius(13)
      .padding({
        left: 5,
        right: 5
      })
      .layoutWeight(1)
    }
    .padding({ left: 15, right: 15 })
    .height(40)
    .border({ width: { bottom: 0.5 }, color: '#e4e4e4' })
  }
}

//购物车内部菜品组件
@Component
struct MTCartItm {
  @State
  item: Partial<FoodItem> = {}

  build() {
    Row() {
      Image(this.item.picture)
        .width(60)
        .aspectRatio(1)
        .borderRadius(8)
        .margin({
          right: 10
        })
      Column() {
        Text(this.item.name)
          .fontSize(14)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
        Row() {
          Text() {
            Span('¥')
              .fontSize(12)
              .fontColor('#ff8000')
            Span(this.item.price.toFixed(2)) // 返回两位小数的字符串
              .fontSize(18)
              .fontColor('#ff8000')
              .fontWeight(FontWeight.Bold)
          }
          //加菜减菜按钮
          MTAddCut({ item: this.item })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
      .height(60)
      .layoutWeight(1)
      .padding({
        right: 20
      })

    }
    .padding({
      left: 20
    })
  }
}

//购物车组件
@Component
struct MTCart {
  @Consume
  cartList: FoodItem[]

  build() {
    Column() {
      //顶部标题
      Row() {
        Text('购物车')
          .fontSize(12)
        Text('清空购物车')
          .fontSize(12)
          .fontColor('#999')
          .onClick(() => {
            clearCart()
          })
      }
      .width('100%')
      .height(40)
      .justifyContent(FlexAlign.SpaceBetween)
      .border({
        width: {
          bottom: 0.5
        },
        color: '#f5f5f5'
      })
      .padding({
        right: 15,
        left: 15
      })

      //下部购物车菜品组件
      List({ space: 30 }) {
        ForEach(this.cartList, (item: FoodItem) => {
          ListItem() {
            MTCartItm({ item })
          }
        })
      }
      .padding({
        bottom: 70
      })

    }
    .justifyContent(FlexAlign.Start)
    .width("100%")
    .height('50%')
    .backgroundColor(Color.White)
  }
}

//底部购物车和结算组件
@Component
struct MTBottom {
  @Link
  showCart: boolean
  @Consume
  cartList: FoodItem[]

  getAllCount() {
    return this.cartList.reduce((preValue: number, item: FoodItem) => preValue + item.count, 0)
  }

  getAllPrice() {
    return this.cartList.reduce((preValue: number, item: FoodItem) => preValue + item.count * item.price, 0)
  }

  build() {
    Row() {
      Row() {
        //徽标组件
        Badge({
          value: this.getAllCount().toString(),
          position: BadgePosition.Right,
          style: {
            badgeSize: 18
          }
        }) {
          Image('/pages/05/waimai.png')
            .width(47)
            .height(69)
            .position({
              y: -15
            })
        }
        .width(50)
        .height(50)
        .margin({
          left: 25,
          right: 10
        })

        //右侧价格和配送费
        Column() {
          Text() {
            Span('¥')
              .fontSize(12)
              .fontColor('#fff')
            Span(this.getAllPrice().toFixed(2))
              .fontSize(22)
              .fontColor('#fff')
          }

          Text('预估另需配送费¥5')
            .fontSize(12)
            .fontColor('#999')
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)

        //右侧结算按钮
        Text('去结算')
          .backgroundColor('#f8c74e')
          .borderRadius({
            topRight: 30,
            bottomRight: 30
          })
          .padding({
            left: 15,
            right: 15
          })
          .height(60)
      }
      .width('100%')
      .height(60)
      .backgroundColor('#222426')
      .borderRadius(30)
      .onClick(() => {
        animateTo({ duration: 500 }, () => {
          this.showCart = !this.showCart
        })
      })
    }
    .width('100%')
    .padding({
      left: 20,
      right: 20,
      bottom: 20
    })
  }
}

//加减菜按钮
@Component
struct MTAddCut {
  @Consume
  cartList: FoodItem[]
  item: Partial<FoodItem> = {}
  //获取要显示的数量
  getContent(): number {
    return this.cartList.find(obj => obj.id === this.item.id)?.count || 0
  }

  build() {
    Row({ space: 8 }) {
      //减号
      Row() {
        Image($r('app.media.ic_screenshot_line'))
          .width(10)
          .aspectRatio(1)
      }
      .width(16)
      .aspectRatio(1)
      .backgroundColor('#fff')
      .borderRadius(4)
      .justifyContent(FlexAlign.Center)
      .border({
        width: 0.5,
        color: '#f8c74e'
      })
      .onClick(() => {
        //减菜
        addCutCart("cut", this.item as FoodItem)
      })
      //当前菜品的数量
      Text(this.getContent().toString())
        .fontSize(14)
      //加号
      Row() {
        Image($r('app.media.ic_public_add_filled'))
          .width(10)
          .aspectRatio(1)
      }
      .width(16)
      .aspectRatio(1)
      .backgroundColor('#fff')
      .borderRadius(4)
      .justifyContent(FlexAlign.Center)
      .border({
        width: 0.5,
        color: '#f8c74e'
      })
      .onClick(() => {
        //加菜
        addCutCart("add", this.item as FoodItem)
      })
    }
  }
}

//持久化数据
PersistentStorage.PersistProp<string>("user_cart", "[]")

//加菜减菜方法
const addCutCart = (type: 'add' | 'cut', item: FoodItem) => {
  const list = getCarts()
  const f = list.find(f => f.id === item.id)
  if (type === 'add') {
    if (f) {
      f.count++
    } else {
      item.count = 1
      list.unshift(item)
    }
  } else {
    if (f && f.count > 0) {
      f.count--
      if (f.count === 0) {
        const index = list.findIndex(f => f.id === item.id)
        list.splice(index, 1)
      }
    }
  }
  AppStorage.Set<string>("user_cart", JSON.stringify(list))

}

const getCarts = () => {
  return JSON.parse(AppStorage.Get<string>("user_cart") || '[]') as FoodItem[]
}
const clearCart = () => {
  AppStorage.Set<string>("user_cart", "[]")
}

export class FoodItem {
  id: number = 0
  name: string = ""
  like_ratio_desc: string = ""
  month_saled: number = 0
  unit: string = ""
  food_tag_list: string[] = []
  price: number = 0
  picture: string = ""
  description: string = ""
  tag: string = ""
  count: number = 0
}

class Category {
  tag: string = ""
  name: string = ""
  foods: FoodItem[] = []
}