import router from '@ohos.router'
@Entry
@Component
struct AddClock {

  build() {
    Navigation() {
      TimePicker()
        .borderRadius(16)
      Text("删除闹铃")
        .width(100)
        .height(40)
        .borderRadius(20)
        .backgroundColor("#c3c4c5")
        .textAlign(TextAlign.Center)
        .fontColor('#f00')
        .opacity(0.4)
        .margin({
          top: 30
        })
    }
    .title("新建闹钟")
    .titleMode(NavigationTitleMode.Mini)
    .menus([
      {
        value: '',
        icon: '/images/ic_confirm.png'
      }
    ])
  }
}