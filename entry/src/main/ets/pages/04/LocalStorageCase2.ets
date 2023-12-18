import { local, UserInfoClass } from './LocalStorageCase'
import router from '@ohos.router'

@Entry(local)
@Component
struct LocalStorageCase2 {
  // @LocalStorageProp("user")
  @LocalStorageLink("user") //双向绑定，这边改，LocalStorageCase 里的数据也会变化

  myUser: Partial<UserInfoClass> = {}

  build() {
    Row() {
      Column() {
        Text(this.myUser.username)
        Text(this.myUser.age.toString())
        Button('更改2').onClick(() => {
          this.myUser.age = 99
        })
        Button('跳转到另一个页面')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/04/LocalStorageCase2'
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}