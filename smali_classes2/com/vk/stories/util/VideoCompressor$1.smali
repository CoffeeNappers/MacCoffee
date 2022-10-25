.class final Lcom/vk/stories/util/VideoCompressor$1;
.super Ljava/lang/Object;
.source "VideoCompressor.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$image:Landroid/graphics/Bitmap;

.field final synthetic val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$outputVideo:Ljava/io/File;

.field final synthetic val$parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;


# direct methods
.method constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/vk/stories/util/VideoCompressor$CompressDelegate;Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;Ljava/io/File;Landroid/graphics/Bitmap;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p2, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$compressDelegate:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    iput-object p3, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    iput-object p4, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$outputVideo:Ljava/io/File;

    iput-object p5, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$image:Landroid/graphics/Bitmap;

    iput-object p6, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$compressorAtomicReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$run$0(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)V
    .locals 0
    .param p0, "compressDelegate"    # Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    .prologue
    .line 78
    invoke-interface {p0}, Lcom/vk/stories/util/VideoCompressor$CompressDelegate;->onCancel()V

    return-void
.end method

.method static synthetic lambda$run$1(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)V
    .locals 0
    .param p0, "compressDelegate"    # Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    .prologue
    .line 120
    invoke-interface {p0}, Lcom/vk/stories/util/VideoCompressor$CompressDelegate;->onCancel()V

    return-void
.end method

.method static synthetic lambda$run$2(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;Ljava/lang/Exception;)V
    .locals 0
    .param p0, "compressDelegate"    # Lcom/vk/stories/util/VideoCompressor$CompressDelegate;
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 136
    invoke-interface {p0, p1}, Lcom/vk/stories/util/VideoCompressor$CompressDelegate;->onError(Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$run$3(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;JJLjava/io/File;)V
    .locals 3
    .param p0, "compressDelegate"    # Lcom/vk/stories/util/VideoCompressor$CompressDelegate;
    .param p1, "stop"    # J
    .param p3, "start"    # J
    .param p5, "outputVideo"    # Ljava/io/File;

    .prologue
    .line 143
    sub-long v0, p1, p3

    invoke-interface {p0, v0, v1, p5}, Lcom/vk/stories/util/VideoCompressor$CompressDelegate;->onFinish(JLjava/io/File;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 74
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 77
    .local v4, "start":J
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 78
    invoke-static {}, Lcom/vk/stories/util/VideoCompressor;->access$000()Landroid/os/Handler;

    move-result-object v1

    iget-object v6, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$compressDelegate:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    invoke-static {v6}, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$1;->lambdaFactory$(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)Ljava/lang/Runnable;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 144
    :cond_0
    :goto_0
    return-void

    .line 83
    :cond_1
    :try_start_0
    new-instance v7, Lcom/vk/medianative/FFMpegVideoCompressor;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {}, Lcom/vkontakte/android/VKApplication;->deviceYear()I

    move-result v6

    invoke-direct {v7, v1, v6}, Lcom/vk/medianative/FFMpegVideoCompressor;-><init>(Landroid/content/Context;I)V

    .line 84
    .local v7, "videoCompressor":Lcom/vk/medianative/FFMpegVideoCompressor;
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-static {v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->access$100(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    :goto_1
    const v6, 0x19dd18

    iget-object v8, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-static {v8}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->access$200(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)I

    move-result v8

    invoke-virtual {v7, v1, v6, v8}, Lcom/vk/medianative/FFMpegVideoCompressor;->config(III)Lcom/vk/medianative/FFMpegVideoCompressor;

    .line 85
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-static {v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->access$300(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)Ljava/io/File;

    move-result-object v1

    iget-object v6, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$outputVideo:Ljava/io/File;

    invoke-virtual {v7, v1, v6}, Lcom/vk/medianative/FFMpegVideoCompressor;->path(Ljava/io/File;Ljava/io/File;)Lcom/vk/medianative/FFMpegVideoCompressor;

    .line 86
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-static {v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->access$400(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)Z

    move-result v1

    invoke-virtual {v7, v1}, Lcom/vk/medianative/FFMpegVideoCompressor;->mirror(Z)Lcom/vk/medianative/FFMpegVideoCompressor;

    .line 87
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-static {v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->access$500(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)F

    move-result v1

    invoke-virtual {v7, v1}, Lcom/vk/medianative/FFMpegVideoCompressor;->aspectRatio(F)Lcom/vk/medianative/FFMpegVideoCompressor;

    .line 88
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$image:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_3

    .line 89
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$image:Landroid/graphics/Bitmap;

    invoke-virtual {v7, v1}, Lcom/vk/medianative/FFMpegVideoCompressor;->addOverlay(Landroid/graphics/Bitmap;)Lcom/vk/medianative/FFMpegVideoCompressor;

    .line 94
    :goto_2
    new-instance v1, Lcom/vk/stories/util/VideoCompressor$1$1;

    invoke-direct {v1, p0}, Lcom/vk/stories/util/VideoCompressor$1$1;-><init>(Lcom/vk/stories/util/VideoCompressor$1;)V

    invoke-virtual {v7, v1}, Lcom/vk/medianative/FFMpegVideoCompressor;->callback(Lcom/vk/medianative/FFMpegVideoCompressor$Callback;)Lcom/vk/medianative/FFMpegVideoCompressor;

    .line 119
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 120
    invoke-static {}, Lcom/vk/stories/util/VideoCompressor;->access$000()Landroid/os/Handler;

    move-result-object v1

    iget-object v6, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$compressDelegate:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    invoke-static {v6}, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$2;->lambdaFactory$(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)Ljava/lang/Runnable;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 129
    .end local v7    # "videoCompressor":Lcom/vk/medianative/FFMpegVideoCompressor;
    :catch_0
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$outputVideo:Ljava/io/File;

    invoke-static {v1}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 133
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$isCanceled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    .line 136
    invoke-static {}, Lcom/vk/stories/util/VideoCompressor;->access$000()Landroid/os/Handler;

    move-result-object v1

    iget-object v6, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$compressDelegate:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    invoke-static {v6, v0}, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$3;->lambdaFactory$(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;Ljava/lang/Exception;)Ljava/lang/Runnable;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 137
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$compressorAtomicReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v9}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 84
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v7    # "videoCompressor":Lcom/vk/medianative/FFMpegVideoCompressor;
    :cond_2
    const v1, 0x1f400

    goto :goto_1

    .line 91
    :cond_3
    :try_start_1
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-static {v1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->access$600(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v7, v1}, Lcom/vk/medianative/FFMpegVideoCompressor;->addOverlay(Ljava/io/File;)Lcom/vk/medianative/FFMpegVideoCompressor;

    goto :goto_2

    .line 125
    :cond_4
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$compressorAtomicReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v7}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 127
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getTempAyuvFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Lcom/vk/medianative/FFMpegVideoCompressor;->startCompression(Ljava/lang/String;)V

    .line 128
    invoke-virtual {v7}, Lcom/vk/medianative/FFMpegVideoCompressor;->waitForCompression()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 140
    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$compressorAtomicReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v9}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 142
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 143
    .local v2, "stop":J
    invoke-static {}, Lcom/vk/stories/util/VideoCompressor;->access$000()Landroid/os/Handler;

    move-result-object v8

    iget-object v1, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$compressDelegate:Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    iget-object v6, p0, Lcom/vk/stories/util/VideoCompressor$1;->val$outputVideo:Ljava/io/File;

    invoke-static/range {v1 .. v6}, Lcom/vk/stories/util/VideoCompressor$1$$Lambda$4;->lambdaFactory$(Lcom/vk/stories/util/VideoCompressor$CompressDelegate;JJLjava/io/File;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0
.end method
