.class Lcom/wmspanel/libstream/VideoListenerGLES16$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListenerGLES16;->focus()V
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
    .line 471
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 473
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    const-string/jumbo v1, "focus runnable"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->access$000(Lcom/wmspanel/libstream/VideoListenerGLES16;Ljava/lang/String;)V

    .line 475
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->getCameraParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 476
    if-nez v0, :cond_0

    .line 494
    :goto_0
    return-void

    .line 480
    :cond_0
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 482
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v2, v2, Lcom/wmspanel/libstream/FocusMode;->focusMode16:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setFocusMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 483
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v2, v2, Lcom/wmspanel/libstream/FocusMode;->awbMode16:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setAwbMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 484
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v2, v2, Lcom/wmspanel/libstream/FocusMode;->antibandingMode16:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setAntibandingMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 485
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget v2, v2, Lcom/wmspanel/libstream/FocusMode;->exposureCompensation:I

    invoke-virtual {v1, v0, v2}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setExposureCompensation(Landroid/hardware/Camera$Parameters;I)V

    .line 487
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-virtual {v1, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setCameraParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 489
    :catch_0
    move-exception v0

    .line 490
    const-string/jumbo v1, "VideoListenerGLES16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 492
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$6;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->release()V

    goto :goto_0
.end method
