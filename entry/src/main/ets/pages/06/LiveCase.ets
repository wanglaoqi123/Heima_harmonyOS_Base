import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct LiveCase {
  @State message: string = 'Hello World'

  onPageShow() {
    promptAction.showToast({
      message: '页面显示',
      duration: 2000
    })
  }
  onPageHide() {
    promptAction.showToast({
      message: '页面隐藏',
      duration: 2000
    })
  }
  onBackPress() {
    promptAction.showToast({
      message: '页面返回',
      duration: 2000
    })
  }
  aboutToAppear() {
    promptAction.showToast({
      message: '页面初始化aboutToAppear',
      duration: 2000
    })
  }
  aboutToDisappear() {
    promptAction.showToast({
      message: '页面销毁aboutToDisappear',
      duration: 2000
    })
  }


  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            router.pushUrl({
              url: "pages/06/HmList"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}