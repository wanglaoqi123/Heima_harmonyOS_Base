@Entry
@Component
struct LoadingCase {
  @State message: string = 'Hello World'
  @State showLoading: boolean = false

  aboutToAppear() {
    this.showLoading = true
    setTimeout(() => {
      this.showLoading = false
    },3000)
  }

  build() {
    Row() {
      Column() {
        if (this.showLoading) {
          heimaLoading()
        } else {
          Text(this.message)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct heimaLoading {
  @State count: number = 0
  aboutToAppear() {
    if (this.count === 100) {
      this.count = 0
    }
    setInterval(() => {
      this.count++
    },20)
  }
  build() {
    Progress({
      value: this.count,
      total: 100,
      style: ProgressStyle.ScaleRing
    })
      .style({
        strokeWidth: 6,
        scaleCount: 20,
      })
      .width(60)
      .height(60)
  }
}