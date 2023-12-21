import router from '@ohos.router'


@Entry
@Component
struct HmList {
  @State list: ListItemInfo[] = Array.from(Array(100), (_: number, index: number) => {
    return {
      id: index,
      title: `我是第${index + 1}个`
    } as ListItemInfo
  })

  onPageShow() {
    const param = router.getParams() as BackParams
    const num = AppStorage.Get<number>("myId")
    // if (num) {
    //   AlertDialog.show({
    //     message: num.toString()
    //   })
    // }

    if (param?.detailId) {
      AlertDialog.show({
        message: param.detailId.toString()
      })
    }
  }

  build() {
    Row() {
      Column() {
        Row() {
          Text('列表数据')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .height(40)
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .border({
          color: '#f3f4f5',
          width: {
            bottom: 1
          }

        })

        List({space: 20}) {
          ForEach(this.list, (item: ListItemInfo) => {
            ListItem() {
              Row() {
                Text(item.title)
                Button('查看详情')
                  .height(30)
                  .onClick(() => {
                    //将目标页面压入页面栈的栈顶，当前页面还在
                    router.pushUrl({
                      url: "pages/06/HmDetail",
                      params: {
                        id: item.id + 1
                      }
                    })

                    //目标页面替换当前页面，当前页面就销毁了
                    // router.replaceUrl({
                    //   url: "pages/06/HmDetail"
                    // })
                  })
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }
          })
        }
        .padding({
          left: 15,
          right: 15
        })
      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}

class ListItemInfo {
  id: number
  title: string
}

class BackParams {
  detailId: number
}