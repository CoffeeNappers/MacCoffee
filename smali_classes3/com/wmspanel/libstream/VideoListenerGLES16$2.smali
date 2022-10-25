.class Lcom/wmspanel/libstream/VideoListenerGLES16$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListenerGLES16;->release()V
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
    .line 306
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 308
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    const-string/jumbo v1, "release runnable"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->access$000(Lcom/wmspanel/libstream/VideoListenerGLES16;Ljava/lang/String;)V

    .line 310
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->releaseCamera()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 314
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 315
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-static {v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->access$300(Lcom/wmspanel/libstream/VideoListenerGLES16;)V

    .line 317
    :goto_0
    return-void

    .line 311
    :catch_0
    move-exception v0

    .line 312
    :try_start_1
    const-string/jumbo v1, "VideoListenerGLES16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 314
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 315
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-static {v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->access$300(Lcom/wmspanel/libstream/VideoListenerGLES16;)V

    goto :goto_0

    .line 314
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v1, v2}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 315
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16$2;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES16;

    invoke-static {v1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->access$300(Lcom/wmspanel/libstream/VideoListenerGLES16;)V

    throw v0
.end method
