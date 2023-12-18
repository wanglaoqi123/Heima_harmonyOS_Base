@Entry
@Component
struct AppStorageCase02 {
  @StorageProp("laogao")
  token: string = ""

  @StorageLink("laogao")
  token2: string = ""

  aboutToAppear() {
    AlertDialog.show({
      message: AppStorage.Get<string>("laogao")
    })
  }

  build() {
    Row() {
      Column() {
        Text(this.token)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('更新token')
          .onClick(() => {
            this.token2 = "今天讲的太难了"
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}