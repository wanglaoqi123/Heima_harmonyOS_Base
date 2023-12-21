import router from '@ohos.router'
@Entry
@Component
struct HmDetail {
  @State
  currentId: number = 0
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

        //单例模式  同一个页面栈中只有一个，跳转时候如果目标页已经存在页面栈中，则将其移动到栈顶的位置
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