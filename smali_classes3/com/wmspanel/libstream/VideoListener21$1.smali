.class Lcom/wmspanel/libstream/VideoListener21$1;
.super Landroid/hardware/camera2/CameraDevice$StateCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListener21;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListener21;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListener21;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListener21;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraDevice$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraDevice;)V
    .locals 2
    .param p1, "camera"    # Landroid/hardware/camera2/CameraDevice;

    .prologue
    .line 56
    const-string/jumbo v0, "VideoListener21"

    const-string/jumbo v1, "onClosed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 58
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-static {v0}, Lcom/wmspanel/libstream/VideoListener21;->access$100(Lcom/wmspanel/libstream/VideoListener21;)V

    .line 59
    return-void
.end method

.method public onDisconnected(Landroid/hardware/camera2/CameraDevice;)V
    .locals 2
    .param p1, "camera"    # Landroid/hardware/camera2/CameraDevice;

    .prologue
    .line 63
    const-string/jumbo v0, "VideoListener21"

    const-string/jumbo v1, "onDisconnected"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 65
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener21;->release()V

    .line 66
    return-void
.end method

.method public onError(Landroid/hardware/camera2/CameraDevice;I)V
    .locals 3
    .param p1, "camera"    # Landroid/hardware/camera2/CameraDevice;
    .param p2, "error"    # I

    .prologue
    .line 70
    const-string/jumbo v0, "VideoListener21"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onError, error="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 72
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener21;->release()V

    .line 73
    return-void
.end method

.method public onOpened(Landroid/hardware/camera2/CameraDevice;)V
    .locals 4
    .param p1, "camera"    # Landroid/hardware/camera2/CameraDevice;

    .prologue
    .line 37
    const-string/jumbo v0, "VideoListener21"

    const-string/jumbo v1, "onOpened"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iput-object p1, v0, Lcom/wmspanel/libstream/VideoListener21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    .line 41
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoListener21;->mPreviewSurface:Landroid/view/Surface;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-static {v1}, Lcom/wmspanel/libstream/VideoListener21;->access$000(Lcom/wmspanel/libstream/VideoListener21;)Landroid/view/Surface;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoListener21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListener21;->mSessionStateCallback:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v3, v3, Lcom/wmspanel/libstream/VideoListener21;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v2, v3}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    :goto_0
    return-void

    .line 47
    :catch_0
    move-exception v0

    .line 48
    const-string/jumbo v1, "VideoListener21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 50
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$1;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener21;->release()V

    goto :goto_0
.end method
