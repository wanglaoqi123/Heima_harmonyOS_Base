@Entry
@Component
struct CounterCase {


  @State count: number = 5
  timer: number = -1

  build() {
    Row() {
      Column() {
        Button(this.count < 5 ? `还剩${this.count}秒` : "发送验证码")
          .onClick(()=>{
            if (this.count === 5) {
              setInterval(() => {
                if (this.count === 0) {
                  clearInterval(this.timer)
                  this.count = 5
                  return
                }
                this.count--
              },1000)
            }

          })
      }
      .width('100%')
    }
    .height('100%')
  }
}