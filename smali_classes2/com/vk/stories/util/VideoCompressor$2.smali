.class final Lcom/vk/stories/util/VideoCompressor$2;
.super Ljava/lang/Object;
.source "VideoCompressor.java"

# interfaces
.implements Lcom/vk/stories/util/VideoCompressor$RenderTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/util/VideoCompressor;->doFFMpegRender(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;ZLandroid/graphics/Bitmap;Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)Lcom/vk/stories/util/VideoCompressor$RenderTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$compressDelegate:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

.field final synthetic val$compressorAtomicReference:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$outputVideo:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicReference;Lcom/vk/stories/util/VideoCompressor$CompressDelegate;Ljava/io/File;)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lcom/vk/stories/util/VideoCompressor$2;->val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p2, p0, Lcom/vk/stories/util/VideoCompressor$2;->val$compressorAtomicReference:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p3, p0, Lcom/vk/stories/util/VideoCompressor$2;->val$compressDelegate:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    iput-object p4, p0, Lcom/vk/stories/util/VideoCompressor$2;->val$outputVideo:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$cancel$0(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)V
    .locals 0
    .param p0, "compressDelegate"    # Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    .prologue
    .line 155
    invoke-interface {p0}, Lcom/vk/stories/util/VideoCompressor$CompressDelegate;->onCancel()V

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 3

    .prologue
    .line 150
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$2;->val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 152
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$2;->val$compressorAtomicReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/medianative/FFMpegVideoCompressor;

    .line 153
    .local v0, "videoCompressor":Lcom/vk/medianative/FFMpegVideoCompressor;
    if-eqz v0, :cond_0

    .line 154
    invoke-virtual {v0}, Lcom/vk/medianative/FFMpegVideoCompressor;->forceStop()V

    .line 155
    invoke-static {}, Lcom/vk/stories/util/VideoCompressor;->access$000()Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/stories/util/VideoCompressor$2;->val$compressDelegate:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    invoke-static {v2}, Lcom/vk/stories/util/VideoCompressor$2$$Lambda$1;->lambdaFactory$(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 156
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$2;->val$compressorAtomicReference:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 158
    :cond_0
    return-void
.end method

.method public getOutputFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$2;->val$outputVideo:Ljava/io/File;

    return-object v0
.end method

.method public isCanceled()Z
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$2;->val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method
