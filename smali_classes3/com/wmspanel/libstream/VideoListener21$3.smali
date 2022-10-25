.class Lcom/wmspanel/libstream/VideoListener21$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListener21;->openCamera(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListener21;

.field final synthetic val$cameraManager:Landroid/hardware/camera2/CameraManager;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListener21;Landroid/hardware/camera2/CameraManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListener21;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener21$3;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iput-object p2, p0, Lcom/wmspanel/libstream/VideoListener21$3;->val$cameraManager:Landroid/hardware/camera2/CameraManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 121
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$3;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-nez v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$3;->val$cameraManager:Landroid/hardware/camera2/CameraManager;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener21$3;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoListener21;->mCameraId:Ljava/lang/String;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener21$3;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListener21;->mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListener21$3;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v3, v3, Lcom/wmspanel/libstream/VideoListener21;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V

    .line 133
    :goto_0
    return-void

    .line 124
    :cond_0
    const-string/jumbo v0, "VideoListener21"

    const-string/jumbo v1, "Camera already opened"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$3;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 126
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$3;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener21;->release()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 128
    :catch_0
    move-exception v0

    .line 129
    const-string/jumbo v1, "VideoListener21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$3;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 131
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$3;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener21;->release()V

    goto :goto_0
.end method
