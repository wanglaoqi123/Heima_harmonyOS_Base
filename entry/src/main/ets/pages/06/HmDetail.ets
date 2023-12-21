import router from '@ohos.router'
@Entry
@Component
struct HmDetail {
  @State
  currentId: number = 0
  //aboutToAppear只在初始化页面的时候加载一次
  aboutToAppear() {
    const params = router.getParams() as RouterParamClass
    if (params.id) {
      this.currentId = params.id
    }
    // AlertDialog.show({
    //   message: this.currentId.toString()
    // })
  }


  build() {
    Row() {
      Column() {
        Text('详情页')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('返回列表页')
          .onClick(() => {
            AppStorage.SetOrCreate<number>("myId", Date.now())
            router.back({
              url: 'pages/06/HmList',
              params: {
                detailId: Date.now()
              }
            })
          })

        // Button('跳回列表页')
        //   .onClick(() => {
        //     router.pushUrl({
        //       url: 'pages/06/HmList'
        //     })
        //   })

        //单例模式 即如果目标页的url在页面栈中已经存在同url页面，则离栈顶最近的同url页面会被移动到栈顶，并重新加载；如果目标页的url在页面栈中不存在同url页面，则按照标准模式跳转。
        Button('单例模式跳回列表页')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/06/HmList'
            },router.RouterMode.Single)
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}

class RouterParamClass {
  id: number = 0
}