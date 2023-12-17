@Entry
@Component
struct ObjectLinkCase {
  @State
  list: FoodObjectClass[] = [new FoodObjectClass({
    order_id: 1,
    food_name: '鱼香肉丝',
    food_price: 18.8,
    food_count: 1
  }), new FoodObjectClass({
    order_id: 2,
    food_name: '粗溜丸子',
    food_price: 26,
    food_count: 2
  }), new FoodObjectClass({
    order_id: 3,
    food_name: '杂粮煎饼',
    food_price: 12,
    food_count: 1
  })]
  @State food: Partial<FoodObjectClass> = {}

  build() {
    Row() {
      Column() {
        ForEach(this.list, (item: FoodObjectClass) => {
          FoodItem({item: item})
        })
        BottomCart2({
          foodList: $list
        })

      }
    }
    .height('100%')
  }
}

@Component
struct FoodItem {
  //
  @ObjectLink
  item: FoodObjectClass
  build() {
    Row() {
      Text(this.item.food_name).TextStyle4()
      Text(this.item.food_price.toString()).TextStyle4()
      Row() {
        Text('-').AddCutStyle()
          .onClick(() => {
            if (this.item.food_count > 0) {
              this.item.food_count--
            }
          })
        Text(this.item.food_count.toString()).TextStyle4()
        Text('+').AddCutStyle()
          .onClick(() => {
            this.item.food_count++
          })
      }
      .layoutWeight(1)
    }
    .height(60)
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: 20,
      right: 20
    })
  }
}

@Component
struct BottomCart2{
  @Link foodList: FoodObjectClass[]
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

@Extend(Text) function TextStyle4() {
  .layoutWeight(1).textAlign(TextAlign.Center).fontSize(20)
}

@Extend(Text)
function AddCutStyle () {
  .width(40)
  .height(40)
  .borderRadius(20)
  .backgroundColor(Color.Grey)
  .textAlign(TextAlign.Center)
  .fontSize(20)
}

interface IFoodInfo {
  order_id: number
  food_name: string
  food_price: number
  food_count: number
}

@Observed //监听class里的属性变化
class FoodObjectClass implements IFoodInfo{
  order_id = 0
  food_name = ""
  food_price = 0
  food_count = 0
  constructor(obj: IFoodInfo) {
    this.order_id = obj.order_id
    this.food_name = obj.food_name
    this.food_price = obj.food_price
    this.food_count = obj.food_count
  }

}