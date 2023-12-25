@Entry
@Component
struct VideoCase {
  controller: VideoController = new VideoController()
  @State
  speed: number = 0

  build() {
    Tabs() {
      TabContent() {
        Column({ space: 20 }) {
          Video({
            currentProgressRate: this.speed,
            controller: this.controller,
            src: 'https://vd3.bdstatic.com/mda-pmj5ajqd7p4b6pgb/576p/h264/1703044058699262355/mda-pmj5ajqd7p4b6pgb.mp4?auth_key=1703138418-0-0-618ea72b33be241c96c6cff86c06e080&bcevod_channel=searchbox_feed&cr=1&cd=0&pd=1&pt=4&logid=0018430194&vid=9762003448174112444&abtest=all'
          })
            .width('100%')
            .aspectRatio(1.2)
            .controls(false)
          Row() {
            Slider({
              value: this.speed,
              min: 0.75,
              max: 2,
              step: 0.25
            }).showSteps(true)
              .onChange(value => {
                this.speed = value
              })
          }
          Text("当前速度： "+this.speed)
          Row({space: 20}) {
            Button('播放')
              .onClick(() => {
                this.controller.start()
              })
            Button('暂停')
              .onClick(() => {
                this.controller.pause()
              })
            Button('快进到一分钟')
              .onClick(() => {
                this.controller.setCurrentTime(60)
              })
            Button('停止')
              .onClick(() => {
                this.controller.stop()
              })
          }
        }

      }
      .tabBar('在线视频')

      TabContent() {
        Video({
          src: $rawfile('SNtBNF6N.mp4')
        })
          .width('100%')
          .aspectRatio(1.2)
      }
      .tabBar('本地视频')

      TabContent() {
        Video({
          src: 'https://m701.music.126.net/20231225115501/b83c5f351667de46bc804d997685ccee/jdyyaac/obj/w5rDlsOJwrLDjj7CmsOj/31648546323/a2c3/d54f/fe45/000623360b4fd047cdd40a2b356979b5.m4a'
        })
          .width('100%')
          .aspectRatio(1.2)
      }
      .tabBar("音频")
    }
    .animationDuration(500)
  }
}