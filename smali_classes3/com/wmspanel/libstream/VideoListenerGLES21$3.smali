.class Lcom/wmspanel/libstream/VideoListenerGLES21$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListenerGLES21;->openCamera(Landroid/content/Context;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

.field final synthetic val$cameraManager:Landroid/hardware/camera2/CameraManager;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListenerGLES21;Landroid/hardware/camera2/CameraManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListenerGLES21;

    .prologue
    .line 310
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    iput-object p2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->val$cameraManager:Landroid/hardware/camera2/CameraManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 315
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-nez v0, :cond_0

    .line 316
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->val$cameraManager:Landroid/hardware/camera2/CameraManager;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraId:Ljava/lang/String;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    iget-object v3, v3, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V

    .line 327
    :goto_0
    return-void

    .line 318
    :cond_0
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v1, "Camera already opened"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 320
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->release()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 322
    :catch_0
    move-exception v0

    .line 323
    const-string/jumbo v1, "VideoListenerGLES21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 325
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$3;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->release()V

    goto :goto_0
.end method
