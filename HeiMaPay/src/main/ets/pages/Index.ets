import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'

@Entry
@Component
struct Index {
  @State message: string = '黑马支付页面'
  @StorageProp("order_id")
  orderId: number = 0

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text(this.orderId.toString())
          .fontColor(Color.Red)
          .fontSize(30)
        Button('支付').onClick(() => {
          const context = getContext(this) as common.UIAbilityContext
          let want: Want = {
            abilityName: 'EntryAbility',
            bundleName: 'com.itheima.heima_harmony',
            moduleName: 'entry',
            parameters: {
              paySuccess: true
            }
          }
          context.terminateSelfWithResult({
            resultCode: 1,
            want: want
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}