@Entry
@Component
struct ConditionCase {
  @State showImage: boolean = false
  @State selectIndex: number = -1

  build() {
    Row() {
      Column({ space: 20 }) {
        Toggle({
          type: ToggleType.Switch,
          isOn: this.showImage //双向绑定？有啥用呢？在这个案例里的作用是什么
        })
          .onChange((isOn) => {
            this.showImage = isOn
          })
        if (this.showImage) { //组件频繁创建渲染销毁占用内存
          Image('/assets/test10.jpeg')
            .width(100)
            .aspectRatio(1)
        }
        // Image('/assets/test10.jpeg')
        //   .width(100)
        //   .aspectRatio(1)
        //   .opacity(this.showImage ? 1 : 0)

        // Image('/assets/test10.jpeg')
        //   .width(this.showImage ? 100 : 0)
        //   .aspectRatio(1)

        // Image('/assets/test10.jpeg')
        //   .width(100)
        //   .aspectRatio(1)
        //   .visibility(this.showImage ? Visibility.Visible : Visibility.None)

        Image('/assets/test10.jpeg')
          .width(100)
          .aspectRatio(1)
          .scale({
            x: this.showImage ? 1 : 0,
            y: this.showImage ? 1 : 0,
          })


        Select([{ value: '西游记' }, { value: '红楼梦' }, { value: '水浒传' }])
          .onSelect((index) => {
            this.selectIndex = index
          })
        if (this.selectIndex === 0) {
          Image($r('app.media.xiyouji'))
            .width(100)
        } else if (this.selectIndex === 1) {
          Image($r('app.media.hongloumeng'))
            .width(100)
        } else if (this.selectIndex === 2) {
          Image($r('app.media.shuihuzhuan'))
            .width(100)
        }

      }
      .width('100%')
    }
    .height('100%')
  }
}