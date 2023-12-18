import router from '@ohos.router'
PersistentStorage.PersistProp<string>("laogao", "")

@Entry
@Component
struct AppStorageCase {
  @StorageProp("laogao")
  str: string = ""

  build() {
    Row() {
      Column() {
        Text(this.str).fontSize(40)
        Row(){
          Button('登录')
            .width('100%')
            .height(40)
            .onClick(()=> {
            AppStorage.SetOrCreate<string>("laogao","shuiruohanyu")
              router.pushUrl({
                url: "/pages/04/AppStorageCase02"
              })
          })
        }
        .padding({
          left: 20,
          right: 20
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}