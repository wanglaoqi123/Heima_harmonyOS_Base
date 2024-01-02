import router from '@ohos.router'
import { ClockItemClass, MyClockStore } from './ClockStore'
import util from '@ohos.util'
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
    const list = await this.myStore.getClockList()
    // 系统代理一个闹钟之后，才会返回一个id
    let reminderObj: reminderAgentManager.ReminderRequestAlarm = {
      reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
      hour,
      minute,
      daysOfWeek: [],
      ringDuration: 60
    }

    //编辑闹铃
    if (this.currentClock.id) {
      //取消闹铃
      if (this.currentClock.reminderId) {
        reminderAgentManager.cancelReminder(this.currentClock.reminderId)
      }
      //新增闹铃
      const reminderId = await reminderAgentManager.publishReminder(reminderObj)
      this.currentClock.reminderId = reminderId
      this.currentClock.hour =  hour
      this.currentClock.minute =  minute
      const index: number = list.findIndex(item => item.id === this.currentClock.id)
      list.splice(index, 1, this.currentClock as ClockItemClass)
      //写入磁盘
      this.myStore.setClockList(JSON.stringify(list))
      router.back()
      return
    }

    //删除闹铃
    //新增闹铃
    //写入磁盘

    //声明一个闹铃
    let obj: ClockItemClass = {
      hour,
      minute,
      id: util.generateRandomUUID(),
      enabled: true
      // remindId:
    }

    const reminderId = await reminderAgentManager.publishReminder(reminderObj)
    obj.reminderId = reminderId //拿到代理返回的id，就可以写入首选项了

    list.push(obj)
    this.myStore.setClockList(JSON.stringify(list))
    router.back()
  }
  //尽量不适用async修饰aboutToAppear
  async aboutToAppear() {
    const obj = router.getParams() as ClockParams
    //判空 传进来的参数如果为空，obj是undefined
    if (obj && obj.id) {
      const list = await this.myStore.getClockList()
      //记录当前闹铃的目的是为了存储
      this.currentClock = list.find(item => item.id === obj.id)
      //将当前闹铃时间传递给时间选择器
      //arkTs只有第一层的数据更新再能导致UI更新 所以下面两行代码不生效
      // this.currentTime.time.setHours(this.currentClock.hour)
      // this.currentTime.time.setMinutes(this.currentClock.minute)
      const time = new Date()
      time.setHours(this.currentClock.hour)
      time.setMinutes(this.currentClock.minute)
      this.currentTime.time = time

    }
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

class ClockParams {
  id: string = ""
}