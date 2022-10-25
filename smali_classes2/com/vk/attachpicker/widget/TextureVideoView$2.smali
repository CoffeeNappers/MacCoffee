.class Lcom/vk/attachpicker/widget/TextureVideoView$2;
.super Ljava/lang/Object;
.source "TextureVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


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
    .line 540
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    const/4 v2, 0x3

    .line 543
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$402(Lcom/vk/attachpicker/widget/TextureVideoView;I)I

    .line 545
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$500(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 546
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$500(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/media/MediaPlayer$OnPreparedListener;->onPrepared(Landroid/media/MediaPlayer;)V

    .line 549
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$102(Lcom/vk/attachpicker/widget/TextureVideoView;I)I

    .line 550
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$202(Lcom/vk/attachpicker/widget/TextureVideoView;I)I

    .line 552
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->seekTo(I)V

    .line 554
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$100(Lcom/vk/attachpicker/widget/TextureVideoView;)I

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$200(Lcom/vk/attachpicker/widget/TextureVideoView;)I

    move-result v0

    if-eqz v0, :cond_2

    .line 555
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$300(Lcom/vk/attachpicker/widget/TextureVideoView;)V

    .line 557
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$600(Lcom/vk/attachpicker/widget/TextureVideoView;)I

    move-result v0

    if-ne v0, v2, :cond_1

    .line 558
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->start()V

    .line 567
    :cond_1
    :goto_0
    return-void

    .line 563
    :cond_2
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$600(Lcom/vk/attachpicker/widget/TextureVideoView;)I

    move-result v0

    if-ne v0, v2, :cond_1

    .line 564
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$2;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->start()V

    goto :goto_0
.end method
