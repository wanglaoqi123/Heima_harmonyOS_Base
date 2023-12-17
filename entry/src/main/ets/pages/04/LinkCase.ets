@Entry
@Component
struct LinkCase {
  @State cartList: FoodClass[] = [{
    order_id: 1,
    food_name: '鱼香肉丝',
    food_price: 18.8,
    food_count: 1
  }, {
    order_id: 2,
    food_name: '粗溜丸子',
    food_price: 26,
    food_count: 2
  }, {
    order_id: 3,
    food_name: '杂粮煎饼',
    food_price: 12,
    food_count: 1
  }]
  @State food: Partial<FoodClass> = {}

  build() {
    Row() {
      Column() {
        ForEach(this.cartList, (item: FoodClass) => {
          Row() {
            Text(item.food_name).TextStyle()
            Text("价格："+item.food_price.toString()).TextStyle()
            Text("数量："+item.food_count.toString()).TextStyle()
          }
          .height(60)
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({
            left: 20,
            right: 20
          })
        })
        BottomCart({
          foodList: $cartList
        })

      }
    }
    .height('100%')
  }
}


@Component
struct BottomCart {
  @Link foodList: FoodClass[]
  build() {
    Row() {
      Button("加菜")
        .onClick(() => {
          this.foodList = this.foodList.map(item => {
            item.food_count++
            return item
          })
        })
    }
  }
}

@Extend(Text) function TextStyle() {
  .layoutWeight(1).textAlign(TextAlign.Center).fontSize(20)
}

class FoodClass {
  order_id: number = 0
  food_name: string = ""
  food_price: number = 0
  food_count: number = 0
}