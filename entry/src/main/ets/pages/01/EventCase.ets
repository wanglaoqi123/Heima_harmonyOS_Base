import promptAction from '@ohos.promptAction'
@Entry
@Component
struct EventCase {
  @State
  account: string = ""
  @State
  password: string = ""

  a: boolean = false

  login() {
    // AlertDialog.show({
    //   message: `${this.account}--${this.password}`
    // })
    if (this.account === 'admin' && this.password === '456') {
      promptAction.showToast({message: "登录成功"})
    }else {
      promptAction.showToast({message: "用户名或密码错误"})

    }
  }

  getBtnEnable(): boolean {
      return this.account != '' && this.password!=''
  }

  build() {
    Row() {
      Column({space: 20}) {
        TextInput({
          placeholder: '请输入用户名'
        })
          .height(40)
          .width('80%')
          .onChange((value)=>{
            // AlertDialog.show({message: value })
            this.account = value
          })
        TextInput({
          placeholder: '请输入密码'

        })
          .height(40)
          .width('80%')
          .type(InputType.Password)
          .onChange((value)=>{
            this.password = value
          })

        Button("登录")
          .width('80%')
          .onClick(()=>{
            // AlertDialog.show({message: "登录成功"})
            this.login()
          })
          .enabled(this.getBtnEnable()
          )
      }
      .width('100%')
    }
    .height('100%')
  }
}