@Entry
@Component
struct StateCase {
  @State
  user: UserInfo = {
    username: "宝只",
    age: 20,
    address: {
      province: "北京",
      city: "昌平区",
      area: "回龙观"
    }
  }

  build() {
    Row() {
      Column({space: 20}) {
        Text(JSON.stringify(this.user))
        Row() {
          Text("姓名：")
          TextInput({ text: this.user.username })
            .layoutWeight(1)
            .onChange((value)=>{
              this.user.username = value
            })
        }
        .width('100%')
        .padding({
          left: 20,
          right: 20
        })

        Row() {
          Text("年龄：")
          TextInput({ text: this.user.age.toString() })
            .layoutWeight(1)
            .onChange((value)=>{
              this.user.age = parseInt(value)
            })
        }
        .width('100%')
        .padding({
          left: 20,
          right: 20
        })

        Row({space: 10}) {
          Text("地址：")
          TextInput({ text: this.user.address.province })
            .layoutWeight(1)
            .onChange((value)=>{
              // this.user.address = {...this.user.address, province: value}

              this.user.address.province = value
              this.user = {...this.user}
            })
          TextInput({ text: this.user.address.city })
            .layoutWeight(1)
            .onChange((value)=>{
              this.user.address = {...this.user.address, city: value}
              // this.user.address.city = value
            })
          TextInput({ text: this.user.address.area })
            .layoutWeight(1)
            .onChange((value)=>{
              this.user.address = {...this.user.address, area: value}
              // this.user.address.area = value
            })
        }
        .width('100%')
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


class UserInfo {
  username: string
  age: number
  address: {
    province: string
    city: string
    area: string
  }
}