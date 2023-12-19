@Entry
@Component
struct MeiTuan {
  @State
  list: Category[] = []

  build() {
    //底部组件显示在最上面，使用stack堆叠
    Stack({ alignContent: Alignment.Bottom }) {
      //主内容组件
      MTMain({list: $list})
      //购物车组件
      MTCart()
      //底部组件
      MTBottom()
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
          ForEach(this.list, (item: string, index: number) => {
            Text(item)
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
  ForEach(this.list, (item:Category, index: number) => {
    ListItem() {
      // MTFoodItem()
      Row()
    }
  })
}
      }
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
      Column() {
        Text()
      }

    }
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

//购物车组件
@Component
struct MTCart {
  build() {
    Row() {

    }
    .width("100%")
    .height(100)
    .backgroundColor(Color.Yellow)
  }
}

//底部组件
@Component
struct MTBottom {
  build() {
    Row() {

    }
    .width('100%')
    .height(40)
    .backgroundColor(Color.Black)
  }
}

export class  FoodItem {
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