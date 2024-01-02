import router from '@ohos.router'
import { ClockItemClass, MyClockStore } from './ClockStore'
import util from '@ohos.util'
import promptAction from '@ohos.promptAction'
import reminderAgentManager from '@ohos.reminderAgentManager'

@Entry
@Component
struct AddClock {
  myStore: MyClockStore = new MyClockStore()
  @State
  currentClock: Partial<ClockItemClass> = {}
  //@State直接修饰Date类型，模拟器会报错，可以使用class包装一个Date类型就不报错了
  @State
  currentTime: CurrentTime = { time: new Date() }
  //添加闹铃
  async addClock() {
    const hour = this.currentTime.time.getHours()
    const minute = this.currentTime.time.getMinutes()
    //声明一个闹铃
    let obj: ClockItemClass = {
      hour,
      minute,
      id: util.generateRandomUUID(),
      enabled: true
      // remindId:
    }

    // 系统代理一个闹钟之后，才会返回一个id
    let reminderObj: reminderAgentManager.ReminderRequestAlarm = {
      reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
      hour,
      minute,
      daysOfWeek: [],
      ringDuration: 60
    }
    const reminderId = await reminderAgentManager.publishReminder(reminderObj)
    obj.reminderId = reminderId //拿到代理返回的id，就可以写入首选项了
    const list = await this.myStore.getClockList()
    list.push(obj)
    this.myStore.setClockList(JSON.stringify(list))
    router.back()
  }

  build() {
    Navigation() {
      TimePicker({ selected: this.currentTime.time })
        .borderRadius(16)
        .onChange((result) => {
          this.currentTime.time.setHours(result.hour)
          this.currentTime.time.setMinutes(result.minute)
        })
      Text("删除闹铃")
        .width(100)
        .height(40)
        .borderRadius(20)
        .backgroundColor("#c3c4c5")
        .textAlign(TextAlign.Center)
        .fontColor('#f00')
        .opacity(0.4)
        .margin({
          top: 30
        })
    }
    .title("新建闹钟")
    .titleMode(NavigationTitleMode.Mini)
    .menus([
      {
        value: '',
        icon: '/images/ic_confirm.png',
        action: () => {
          this.addClock()
        }
      }
    ])
  }
}

class CurrentTime {
  time: Date = new Date()
}