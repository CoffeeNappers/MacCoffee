.class Lcom/vk/attachpicker/widget/TextureVideoView$1;
.super Ljava/lang/Object;
.source "TextureVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/widget/TextureVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/widget/TextureVideoView;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/widget/TextureVideoView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/widget/TextureVideoView;

    .prologue
    .line 528
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView$1;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 531
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$1;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$102(Lcom/vk/attachpicker/widget/TextureVideoView;I)I

    .line 532
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$1;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$202(Lcom/vk/attachpicker/widget/TextureVideoView;I)I

    .line 533
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$1;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$100(Lcom/vk/attachpicker/widget/TextureVideoView;)I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$1;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$200(Lcom/vk/attachpicker/widget/TextureVideoView;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 534
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$1;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->requestLayout()V

    .line 535
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$1;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$300(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    .line 537
    :cond_0
    return-void
.end method
