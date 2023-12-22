import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'
@Entry
@Component
struct MainPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Button('去支付')
          .onClick(() => {
            //拉起另外一个ability
            //上下文-当前页面所在的Ability的一些共有的参数和方法
            const context = getContext(this) as common.UIAbilityContext
            let want: Want = {
              bundleName: 'com.itheima.heima_harmony', //包名
              abilityName: 'PayAbility'
            }
            context.startAbility(want)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}