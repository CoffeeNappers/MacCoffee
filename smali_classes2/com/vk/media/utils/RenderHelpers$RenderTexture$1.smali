.class Lcom/vk/media/utils/RenderHelpers$RenderTexture$1;
.super Ljava/lang/Object;
.source "RenderHelpers.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/media/utils/RenderHelpers$RenderTexture;->create(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/media/utils/RenderHelpers$RenderTexture;


# direct methods
.method constructor <init>(Lcom/vk/media/utils/RenderHelpers$RenderTexture;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 2
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 205
    monitor-enter p0

    .line 206
    :try_start_0
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->access$402(Lcom/vk/media/utils/RenderHelpers$RenderTexture;Z)Z

    .line 207
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    invoke-static {v0}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->access$500(Lcom/vk/media/utils/RenderHelpers$RenderTexture;)Lcom/vk/media/utils/RenderHelpers$Renderer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture$1;->this$0:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    invoke-static {v0}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->access$500(Lcom/vk/media/utils/RenderHelpers$RenderTexture;)Lcom/vk/media/utils/RenderHelpers$Renderer;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/media/utils/RenderHelpers$Renderer;->draw()V

    .line 210
    :cond_0
    monitor-exit p0

    .line 211
    return-void

    .line 210
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
