.class Lcom/wmspanel/libstream/VideoListener21$2;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
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
    .line 76
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 104
    const-string/jumbo v0, "VideoListener21"

    const-string/jumbo v1, "onConfigureFailed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 106
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener21;->release()V

    .line 107
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 80
    const-string/jumbo v0, "VideoListener21"

    const-string/jumbo v1, "onConfigured"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iput-object p1, v0, Lcom/wmspanel/libstream/VideoListener21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 86
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoListener21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 87
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoListener21;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 88
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-static {v1}, Lcom/wmspanel/libstream/VideoListener21;->access$000(Lcom/wmspanel/libstream/VideoListener21;)Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 90
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 92
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    .line 93
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListener21;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1, v2}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    return-void

    .line 95
    :catch_0
    move-exception v0

    .line 96
    const-string/jumbo v1, "VideoListener21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 98
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$2;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener21;->release()V

    goto :goto_0
.end method
