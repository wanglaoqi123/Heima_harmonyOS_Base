import router from '@ohos.router'

export class UserInfoClass {
  username: string = '老高'
  age: number = 34
}

let user: Record<string, UserInfoClass> = { "user": {
  username: "老高",
  age: 34
}
};

const local = new LocalStorage(user);

export { local }

@Entry(local)
@Component
struct LocalStorageCase {
  @State message: string = 'Hello World'
  @LocalStorageProp("user")
  myUser: Partial<UserInfoClass> = {}
  @LocalStorageLink("user")
  myUser2: Partial<UserInfoClass> = {}

  build() {
    Row() {
      Column({space: 10}) {
        Text(this.myUser.username)
        Text(this.myUser.age.toString())
        Button('跳转到另一个页面')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/04/LocalStorageCase2'
            })
          })
        Button('更改').onClick(() => {
          this.myUser.username = '老高好难'
        })
        Button('更改2').onClick(() => {
          this.myUser2.username = '老高好难'
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}