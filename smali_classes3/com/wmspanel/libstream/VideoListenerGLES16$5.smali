.class Lcom/wmspanel/libstream/VideoListenerGLES16$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListenerGLES16;->toggleTorch()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListenerGLES16;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListenerGLES16;

    .prologue
    .line 435
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$5;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 437
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$5;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    const-string/jumbo v1, "toggle torch"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->access$000(Lcom/wmspanel/libstream/VideoListenerGLES16;Ljava/lang/String;)V

    .line 439
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$5;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->getCameraParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 440
    if-nez v0, :cond_0

    .line 460
    :goto_0
    return-void

    .line 443
    :cond_0
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v1

    .line 444
    if-nez v1, :cond_1

    .line 445
    const-string/jumbo v0, "VideoListenerGLES16"

    const-string/jumbo v1, "Flash is not supported"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 455
    :catch_0
    move-exception v0

    .line 456
    const-string/jumbo v1, "VideoListenerGLES16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$5;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 458
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$5;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->release()V

    goto :goto_0

    .line 448
    :cond_1
    :try_start_1
    const-string/jumbo v2, "off"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 449
    const-string/jumbo v1, "torch"

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 453
    :goto_1
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$5;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-virtual {v1, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setCameraParameters(Landroid/hardware/Camera$Parameters;)V

    goto :goto_0

    .line 451
    :cond_2
    const-string/jumbo v1, "off"

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
