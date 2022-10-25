.class Lcom/vk/attachpicker/widget/TextureVideoView$7;
.super Ljava/lang/Object;
.source "TextureVideoView.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


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
    .line 736
    iput-object p1, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 2
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 739
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    new-instance v1, Landroid/view/Surface;

    invoke-direct {v1, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$1202(Lcom/vk/attachpicker/widget/TextureVideoView;Landroid/view/Surface;)Landroid/view/Surface;

    .line 740
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->openVideo()V

    .line 741
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 2
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .prologue
    const/4 v1, 0x0

    .line 754
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$800(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 755
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$800(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 756
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$800(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 757
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$802(Lcom/vk/attachpicker/widget/TextureVideoView;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;

    .line 760
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$1200(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/view/Surface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 761
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$1200(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 762
    iget-object v0, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$1202(Lcom/vk/attachpicker/widget/TextureVideoView;Landroid/view/Surface;)Landroid/view/Surface;

    .line 765
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 6
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 745
    iget-object v4, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v4}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$600(Lcom/vk/attachpicker/widget/TextureVideoView;)I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_1

    move v1, v2

    .line 746
    .local v1, "isValidState":Z
    :goto_0
    iget-object v4, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v4}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$100(Lcom/vk/attachpicker/widget/TextureVideoView;)I

    move-result v4

    if-ne v4, p2, :cond_2

    iget-object v4, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v4}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$200(Lcom/vk/attachpicker/widget/TextureVideoView;)I

    move-result v4

    if-ne v4, p3, :cond_2

    move v0, v2

    .line 747
    .local v0, "hasValidSize":Z
    :goto_1
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->access$800(Lcom/vk/attachpicker/widget/TextureVideoView;)Landroid/media/MediaPlayer;

    move-result-object v2

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 748
    iget-object v2, p0, Lcom/vk/attachpicker/widget/TextureVideoView$7;->this$0:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->start()V

    .line 750
    :cond_0
    return-void

    .end local v0    # "hasValidSize":Z
    .end local v1    # "isValidState":Z
    :cond_1
    move v1, v3

    .line 745
    goto :goto_0

    .restart local v1    # "isValidState":Z
    :cond_2
    move v0, v3

    .line 746
    goto :goto_1
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 770
    return-void
.end method
