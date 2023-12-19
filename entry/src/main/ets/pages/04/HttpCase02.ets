import http from '@ohos.net.http'
@Entry
@Component
struct HttpCase02 {

  aboutToAppear(){
    this.getData()
  }
  async getData() {
    try {
      const req = http.createHttp()
      const res = await req.request("https://zhoushugang.gitee.io/fe2022/takeaway.json")
      AlertDialog.show({
        message: res.result as string
      })
    }
   catch (error) {

   }
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