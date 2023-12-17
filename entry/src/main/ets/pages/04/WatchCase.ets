import promptAction from '@ohos.promptAction'

@Entry
@Component
struct ProvideCase {
  @State message: string = 'Hello World'
  @Provide('aa')
  @Watch('updateMoney')
  money: number = 1000

  updateMoney(keyname: string) {
    promptAction.showToast({
      message: this.money.toString()
    })
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Text('爷爷的钱: ' + this.money)
        Divider().width(6).color(Color.Red).width('100%')
        Father()
      }
      .width('100%')
    }
    .height('100%')
  }
}

function updateMoney(num: number) {

}

@Component
struct Father {
  @Consume('aa')
  @Watch('updateNum')
  money: number

  updateNum() {
    AlertDialog.show({message: '钱发生变化了呦' + this.money } )
  }
  build() {
    Column({ space: 20 }) {
      Text('爸爸的钱: ' + this.money)
        .onClick(() => {
          this.money += 1
        })
      Divider().width(6).color(Color.Red).width('100%')
      Son()
    }
  }
}

@Component
struct Son {
  @Consume
  money: number

  build() {
    Text('孙子的钱: ' + this.money)
      .onClick(() => {
        this.money -= 10
      })
  }
}