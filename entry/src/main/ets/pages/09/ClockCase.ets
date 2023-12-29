import reminderAgentManager from '@ohos.reminderAgentManager'
import notificationManager from '@ohos.notificationManager'

@Entry
@Component
struct ClockCase {

  @State
  reminderId: number = 0
  build() {
    Row() {
      Column() {
        Button('发布闹铃')
          .onClick(async () => {
            let obj: reminderAgentManager.ReminderRequestAlarm = {
              reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
              hour: 11,
              minute: 22,
              ringDuration: 5,
              daysOfWeek: [],
            }
            this.reminderId = await reminderAgentManager.publishReminder(obj)
            //没响铃之前可以取消
            // reminderAgentManager.cancelReminder(reminderId)
          })
        Button('取消闹铃')
          .onClick(() => {
            reminderAgentManager.cancelReminder(this.reminderId)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}