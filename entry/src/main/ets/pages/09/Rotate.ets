@Entry
@Component
struct Rotate {
//画笔旋转案例
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true))
  build() {
    Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center}){
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          this.context.translate(100, 100)
          this.context.rotate(45 * Math.PI / 180 )
          this.context.fillRect(70, 20, 50 , 50)
        })
    }
    .width('100%')
    .height('100%')
  }
}