.class Lcom/wmspanel/libstream/VideoListenerGLES16$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListenerGLES16;->start(Landroid/content/Context;Ljava/lang/String;Landroid/view/SurfaceHolder;Landroid/graphics/SurfaceTexture;Lcom/wmspanel/libstream/VideoEncoder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

.field final synthetic val$cameraId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListenerGLES16;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListenerGLES16;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$1;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iput-object p2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$1;->val$cameraId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$1;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    const-string/jumbo v1, "open runnable"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->access$000(Lcom/wmspanel/libstream/VideoListenerGLES16;Ljava/lang/String;)V

    .line 129
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$1;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$1;->val$cameraId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->access$100(Lcom/wmspanel/libstream/VideoListenerGLES16;Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$1;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$1;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-static {v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->access$200(Lcom/wmspanel/libstream/VideoListenerGLES16;)Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 131
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$1;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    :goto_0
    return-void

    .line 132
    :catch_0
    move-exception v0

    .line 133
    const-string/jumbo v1, "VideoListenerGLES16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$1;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 135
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$1;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->release()V

    goto :goto_0
.end method
