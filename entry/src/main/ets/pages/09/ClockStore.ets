//闹钟类
import preferences from '@ohos.data.preferences'
export class ClockItemClass {
  hour: number = 0
  minute: number = 0
  id: string = ""
  reminderId?: number = 0 // 后台代理提醒id
  enabled: boolean = false // 开启闹铃 关闭闹铃
}

export class MyClockStore {
  //获取首选项存储闹铃的仓库
  getStore () {
    return preferences.getPreferences(getContext(this), "clock_store")
  }
  //写如所有的闹铃信息
  async setClockList (json: string) {
    const store = await this.getStore()
    await store.put("clock_table", json)
    //数据写入磁盘
    await store.flush()
  }
  //获取所有的闹铃信息
  async getClockList () {
    const store = await this.getStore()
    const str = await store.get("clock_table", "[]") as string
    return JSON.parse(str) as ClockItemClass[]
  }
}