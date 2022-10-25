.class Lcom/vk/stories/util/VideoCompressor$1$1;
.super Ljava/lang/Object;
.source "VideoCompressor.java"

# interfaces
.implements Lcom/vk/medianative/FFMpegVideoCompressor$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/util/VideoCompressor$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/util/VideoCompressor$1;


# direct methods
.method constructor <init>(Lcom/vk/stories/util/VideoCompressor$1;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/util/VideoCompressor$1;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/vk/stories/util/VideoCompressor$1$1;->this$0:Lcom/vk/stories/util/VideoCompressor$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$onBytes$1(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;I)V
    .locals 0
    .param p0, "compressDelegate"    # Lcom/vk/stories/util/VideoCompressor$CompressDelegate;
    .param p1, "bytes"    # I

    .prologue
    .line 114
    invoke-interface {p0, p1}, Lcom/vk/stories/util/VideoCompressor$CompressDelegate;->onBytes(I)V

    return-void
.end method

.method static synthetic lambda$onProgress$0(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;I)V
    .locals 0
    .param p0, "compressDelegate"    # Lcom/vk/stories/util/VideoCompressor$CompressDelegate;
    .param p1, "progress"    # I

    .prologue
    .line 106
    invoke-interface {p0, p1}, Lcom/vk/stories/util/VideoCompressor$CompressDelegate;->onProgress(I)V

    return-void
.end method


# virtual methods
.method public onBytes(I)V
    .locals 2
    .param p1, "bytes"    # I

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$1$1;->this$0:Lcom/vk/stories/util/VideoCompressor$1;

    iget-object v0, v0, Lcom/vk/stories/util/VideoCompressor$1;->val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    :goto_0
    return-void

    .line 114
    :cond_0
    invoke-static {}, Lcom/vk/stories/util/VideoCompressor;->access$000()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1$1;->this$0:Lcom/vk/stories/util/VideoCompressor$1;

    iget-object v1, v1, Lcom/vk/stories/util/VideoCompressor$1;->val$compressDelegate:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    invoke-static {v1, p1}, Lcom/vk/stories/util/VideoCompressor$1$1$$Lambda$2;->lambdaFactory$(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;I)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public onProgress(I)V
    .locals 2
    .param p1, "progress"    # I

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$1$1;->this$0:Lcom/vk/stories/util/VideoCompressor$1;

    iget-object v0, v0, Lcom/vk/stories/util/VideoCompressor$1;->val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    :goto_0
    return-void

    .line 106
    :cond_0
    invoke-static {}, Lcom/vk/stories/util/VideoCompressor;->access$000()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1$1;->this$0:Lcom/vk/stories/util/VideoCompressor$1;

    iget-object v1, v1, Lcom/vk/stories/util/VideoCompressor$1;->val$compressDelegate:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    invoke-static {v1, p1}, Lcom/vk/stories/util/VideoCompressor$1$1$$Lambda$1;->lambdaFactory$(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;I)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public onVideoInfo(IIIIDI)V
    .locals 5
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "videoFrames"    # I
    .param p4, "audioFrames"    # I
    .param p5, "fps"    # D
    .param p7, "sampleRate"    # I

    .prologue
    .line 98
    const-string/jumbo v0, "VideoCompressor"

    const-string/jumbo v1, "width: %d, height: %d, videoFrames: %d, audioFrames: %d, fps: %f, sampleRate: %d"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    invoke-static {p5, p6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    invoke-static {p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    return-void
.end method
