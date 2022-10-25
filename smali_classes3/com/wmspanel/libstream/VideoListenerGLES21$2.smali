.class Lcom/wmspanel/libstream/VideoListenerGLES21$2;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListenerGLES21;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListenerGLES21;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListenerGLES21;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 131
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v1, "onConfigureFailed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 133
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->release()V

    .line 134
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 125
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v1, "onConfigured"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    iput-object p1, v0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 127
    return-void
.end method

.method public onReady(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 115
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v1, "onReady"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eq v0, p1, :cond_0

    .line 117
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v1, "onReady: skip"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :goto_0
    return-void

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    invoke-static {v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->access$400(Lcom/wmspanel/libstream/VideoListenerGLES21;)V

    goto :goto_0
.end method
