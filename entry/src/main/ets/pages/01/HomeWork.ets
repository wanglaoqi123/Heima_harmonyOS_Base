@Entry
@Component
struct HomeWork {


  build() {
    Column() {
      Row({space: 20}){
        Text("神领物流").fontSize(20)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100')

      Row({space: 20}){
        Column(){
          Text("账号登录").fontSize(30).fontWeight(10)
        }
        .width('50%')
        .height('50')
        Column(){
          Text("手机号登录>").fontSize(20).fontColor(Color.Red)
        }
        .width('50%')
        .height('50')
      }
      Row(){
        Column(){
          Row(){
            TextInput({placeholder: '请输入账号'})
              .backgroundColor(Color.Transparent)
              .border({
                color: Color.Grey,
                width: {bottom: 1},
                style: {
                  bottom: BorderStyle.Solid
                },
                radius: 0
              })
              .margin({right: 15, left: 15})
          }
          .width('85%')
          .height(50)
          Row(){
            TextInput({placeholder: '请输入密码'})
              .backgroundColor(Color.Transparent)
              .border({
                color: Color.Grey,
                width: {bottom: 1},
                style: {
                  bottom: BorderStyle.Solid
                },
                radius: 0
              })
              .type(InputType.Password)
              .margin({right: 15, left: 15})
          }
          .width('85%')
          .height(50)
          Row(){
            Button("登录")
              .width('70%')
              .backgroundColor(Color.Red)
          }
          .width('100%')
          .height(50)
          .justifyContent(FlexAlign.Center)
        }
      }
      .margin({top: 40})
    }
    .height('100%')
    .width('100%')
  }
}