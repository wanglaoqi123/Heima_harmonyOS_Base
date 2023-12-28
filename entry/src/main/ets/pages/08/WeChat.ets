import preferences from '@ohos.data.preferences'
import util from '@ohos.util'

@Entry
@Component
struct WeChat {
  messStore: MessageStore = new MessageStore()
  @State
  @Watch("updateMessage")
  messList: MessageItem[] = []

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
        List() {
          ForEach(this.messList, (item) => {

          })
        }
        .layoutWeight(1)
        .padding({
          bottom: 80
        })


      }


      Row({space : 20}) {
        TextInput()
          .layoutWeight(1)
          .backgroundColor(Color.White)
          .height(40)
          .borderRadius(2)
        Button('发送')
          .height(30)
          .width(60)
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