import router from '@ohos.router'
@Entry
@Component
struct MainNav {
  @State
  routerItems: RouterClass[] = [
    {
      title: "知乎案例",
      url: "pages/02/ZhiHu"
    },
    {
      title: "美团案例",
      url: "pages/05/MeiTuan"
    },
    {
      title: "抖音案例",
      url: "pages/07/DouYin/DouYin"
    },
    {
      title: "你画我猜案例",
      url: "pages/08/GuessCanvas"
    }
  ]

  build() {
    List({space: 20}) {
      ForEach(this.routerItems,(item: RouterClass) => {
        ListItem() {
          Row() {
            Button(item.title)
              .width('100%')
              .onClick(() => {
                if (item.url) {
                  router.pushUrl({
                    url: item.url
                  })
                }
              })
          }
          .padding(20)
          .height(100)
          .borderRadius(8)
          .width('100%')
        }
      })
    }
  }
}

class RouterClass {
  title: string = ""
  url: string = ""
}