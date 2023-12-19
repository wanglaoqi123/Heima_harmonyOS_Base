import http from '@ohos.net.http'
@Entry
@Component
struct HttpCase {
  aboutToAppear() {
    this.getData()
  }
  getData() {
    const req =  http.createHttp()
    req.request("https://zhoushugang.gitee.io/fe2022/takeaway.json",(err,res) => {
      if (!err) {
        AlertDialog.show({
          message: JSON.stringify(res)
        })
      } else {
        AlertDialog.show({
          message: "失败了"
        })
      }
    })


  }


  build() {
    Row() {
      Column() {
      }
      .width('100%')
    }
    .height('100%')
  }
}