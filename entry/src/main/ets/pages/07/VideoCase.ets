@Entry
@Component
struct VideoCase {
  @State message: string = 'Hello World'

  build() {
    Tabs() {
      TabContent() {
        Video({
          src: 'https://vd3.bdstatic.com/mda-pmj5ajqd7p4b6pgb/576p/h264/1703044058699262355/mda-pmj5ajqd7p4b6pgb.mp4?auth_key=1703138418-0-0-618ea72b33be241c96c6cff86c06e080&bcevod_channel=searchbox_feed&cr=1&cd=0&pd=1&pt=4&logid=0018430194&vid=9762003448174112444&abtest=all'
        })
          .width(300)
          .aspectRatio(1.3)
      }
      .tabBar('在线视频')
      TabContent() {
        Video({
          // src: $rawfile('travel.mp4')
          src: 'https://vd3.bdstatic.com/mda-pmj5ajqd7p4b6pgb/576p/h264/1703044058699262355/mda-pmj5ajqd7p4b6pgb.mp4?auth_key=1703138418-0-0-618ea72b33be241c96c6cff86c06e080&bcevod_channel=searchbox_feed&cr=1&cd=0&pd=1&pt=4&logid=0018430194&vid=9762003448174112444&abtest=all'
        })
          .width(300)
          .aspectRatio(1.3)
      }
      .tabBar('本地视频')
    }
    .animationDuration(500)
  }
}