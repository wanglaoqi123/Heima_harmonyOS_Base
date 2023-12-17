@Entry
@Component
struct MultiStateCase {
  @State message: string = 'Hello World'
  @State
  user: IUserProfileModel = new IUserProfileModel({
    username: '老高',
    age: 34,
    sex: '男',
    address: new IAddressModel({
      province: '河北',
      city: '衡水',
      area: '深舟'
    })
  })

  build() {
    Row() {
      Column() {
        Row() {
          Text(this.user.username).fontSize(40)
          Text(this.user.age.toString()).fontSize(40)
          Text(this.user.address.province).fontSize(40)
          Text(this.user.address.city).fontSize(40)
          Text(this.user.address.area).fontSize(40)
        }
        .width('100%')
        .height(50)

        Button('更新名字和年龄')
          // .onClick(() => {
          //   this.user.username = '老韩'
          //   this.user.age = 29
          // })
          .onClick(() => {
            this.user.address.city = '北京'
            this.user.address = new IAddressModel(this.user.address)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

interface IAddress {
  province: string
  city: string
  area: string
}

interface IUserProfile {
  username: string
  age: number
  sex: '男' | '女'
  address: IAddress
}


class IAddressModel implements IAddress {
  province: string = ''
  city: string = ''
  area: string = ''

  constructor(model: IAddress) {
    this.province = model.province
    this.city = model.city
    this.area = model.area
  }
}


class IUserProfileModel implements IUserProfile {
  username: string = ""
  age: number = 0
  sex: '男' | '女' = '男'
  address: IAddress = new IAddressModel({} as IAddress)

  constructor(model: IUserProfile) {
    this.username = model.username
    this.age = model.age
    this.sex = model.sex
    this.address = model.address
  }
}