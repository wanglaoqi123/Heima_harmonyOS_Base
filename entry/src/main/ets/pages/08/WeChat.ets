import preferences from '@ohos.data.preferences'
import util from '@ohos.util'
import promptAction from '@ohos.promptAction'
import http from '@ohos.net.http'
import { WindowMode } from '@ohos.UiTest'

@Entry
@Component
struct WeChat {
  myhttp: http.HttpRequest = http.createHttp()
  @State
  contentStr: string = ""
  messStore: MessageStore = new MessageStore()
  @State
  topY: number = 0
  @State
  @Watch("updateMessage")
  messList: MessageItem[] = []

  async sendMessage() {
    let selfMessage: MessageItem = {
      avatar: $r("app.media.zhan"),
      username: "有钱哥哥",
      id: util.generateRandomUUID(),
      timestamp: Date.now(),
      self: true,
      content: this.contentStr
    }
    this.messList.push(selfMessage) //更新数组  -> 首选项也更新

    //发送请求
    const url = "http://api.qingyunke.com/api.php?key=free&appid=0&msg=${encodeURI(this.contentStr)}"
    this.contentStr = "" //我发我的，我清我的
    const res = await this.myhttp.request(url)
    //拿到机器人回复的结果
    const result = JSON.parse(res.result as string) as ResultClass
    if (result.result === 0) {
      //再加一条聊天记录
      let wifeMessage: MessageItem = {
        avatar: $r("app.media.bo"),
        username: "博弟",
        id: util.generateRandomUUID(),
        timestamp: Date.now(),
        self: false,
        content: result.content
      }
      this.messList.push(wifeMessage)
    }

  }

  async aboutToAppear() {
    this.getMess()
  }

  async updateMessage() {
    await this.messStore.setMessage(JSON.stringify(this.messList))
  }

  async getMess() {
    this.messList = await this.messStore.getMessage()
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Row() {
          Text('🐱老婆大人')
            .height(50)
        }
        //聊天对话框
        //循环聊天记录
        List({ space: 20 }) {
          ForEach(this.messList, (item: MessageItem) => {
            //聊天信息组件
            ListItem() {
              MessageChat({ item, delMesssage: (id: string) => {
                const index = this.messList.findIndex(item => item.id === id)
                this.messList.splice(index,1)
              } })
            }
          })
        }
        .layoutWeight(1)
        .padding({
          bottom: 80
        })
      }
      .position({
        y: this.topY
      })

      Row({ space: 20 }) {
        TextInput({
          text: this.contentStr
        })
          .layoutWeight(1)
          .backgroundColor(Color.White)
          .height(40)
          .borderRadius(2)
          .onChange(value => {
            this.contentStr = value
          })
        Button('发送')
          .height(30)
          .width(60)
          .enabled(!!this.contentStr) //!!表示将字符串转成布尔类型
          .onClick(() => {
            //发送消息
            this.sendMessage()
          })
      }
      .height(70)
      .width('100%')
      .padding({
        left: 20,
        right: 20
      })
    }
    .height('100%')
    .backgroundColor('#ededed')
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.topY = Math.abs(parseFloat(newArea.globalPosition.y.toString()))
    })
  }
}

@Component
struct MessageChat {
  item: Partial<MessageItem> = {}
  @State
  showDel: boolean = false
  delMesssage: (id: string) => void = () => {}

  @Builder
  getDelContent () {
    Button('删除')
      .onClick(() => {
        this.delMesssage(this.item.id)
      })
  }

  build() {
    Row() {
      Image(this.item.avatar)
        .width(40)
        .aspectRatio(1)
        .borderRadius(6)
      Row() {
        Text(this.item.content)
          .fontColor('#0c2803')
          .backgroundColor(this.item.self ? "#8bec73" : Color.White)
          .lineHeight(24)
          .padding(10)
          .margin({
            left: 10,
            right: 10
          })
          .gesture(LongPressGesture()
            .onAction(() => {
              this.showDel = true
            }))
          // .bindPopup(this.showDel, {
          //   builder: this.getDelContent(),
          //   placement: Placement.Top
          // })
        if (this.showDel) {
          this.getDelContent()
        }
      }
      .layoutWeight(5)
      .justifyContent(this.item.self ? FlexAlign.End : FlexAlign.Start)

      Text().layoutWeight(1)
    }
    .padding({
      left: 20,
      right: 20
    })
    .width('100%')
    .direction(this.item.self ? Direction.Rtl : Direction.Ltr)
  }
}

class MessageItem {
  content: string = "" // 聊天内容
  avatar: ResourceStr = "" // 用户头像
  username: string = "" // 用户昵称
  id: string = "" // 消息id
  timestamp: number = 0
  self: boolean = false // 是否是自身的消息
}

class MessageStore {
  async getStore() {
    return await preferences.getPreferences(getContext(this), "message_store")
  }

  //写入数据
  async setMessage(json: string) {
    //获取首选项对象实例
    const store = await this.getStore()
    await store.put("message_list", json) //设置数据
    await store.flush() // 将数据写入数据库
  }

  //获取数据
  async getMessage() {
    //获取首选项对象实例
    const store = await this.getStore()
    const data = await store.get("message_list", "[]") as string
    return JSON.parse(data) as MessageItem[]
  }
}

class ResultClass {
  result: number = 0
  content: string = ""
}

