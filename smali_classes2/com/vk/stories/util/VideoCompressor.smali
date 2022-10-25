.class public Lcom/vk/stories/util/VideoCompressor;
.super Ljava/lang/Object;
.source "VideoCompressor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;,
        Lcom/vk/stories/util/VideoCompressor$RenderTask;,
        Lcom/vk/stories/util/VideoCompressor$CompressDelegate;
    }
.end annotation


# static fields
.field private static final AUDIO_BITRATE:I = 0x1f400

.field private static final FFMPEG_BITRATE_MULTIPLIER:F = 1.13f

.field private static final TAG:Ljava/lang/String; = "VideoCompressor"

.field private static final VIDEO_BITRATE:I = 0x16e360

.field private static final ffMpegCompressExecutor:Ljava/util/concurrent/Executor;

.field private static final uiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 26
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vk/stories/util/VideoCompressor;->uiHandler:Landroid/os/Handler;

    .line 27
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/stories/util/VideoCompressor;->ffMpegCompressExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/vk/stories/util/VideoCompressor;->uiHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private static doFFMpegRender(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;ZLandroid/graphics/Bitmap;Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)Lcom/vk/stories/util/VideoCompressor$RenderTask;
    .locals 8
    .param p0, "parameters"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .param p1, "temp"    # Z
    .param p2, "image"    # Landroid/graphics/Bitmap;
    .param p3, "compressDelegate"    # Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    .prologue
    .line 61
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 62
    .local v1, "isCanceled":Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v6, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v6}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 64
    .local v6, "compressorAtomicReference":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lcom/vk/medianative/FFMpegVideoCompressor;>;"
    if-eqz p1, :cond_0

    .line 65
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getTempUploadVideoFile()Ljava/io/File;

    move-result-object v4

    .line 69
    .local v4, "outputVideo":Ljava/io/File;
    :goto_0
    invoke-static {v4}, Lcom/vk/core/util/FileUtils;->touch(Ljava/io/File;)V

    .line 71
    sget-object v7, Lcom/vk/stories/util/VideoCompressor;->ffMpegCompressExecutor:Ljava/util/concurrent/Executor;

    new-instance v0, Lcom/vk/stories/util/VideoCompressor$1;

    move-object v2, p3

    move-object v3, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/vk/stories/util/VideoCompressor$1;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/vk/stories/util/VideoCompressor$CompressDelegate;Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;Ljava/io/File;Landroid/graphics/Bitmap;Ljava/util/concurrent/atomic/AtomicReference;)V

    invoke-interface {v7, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 147
    new-instance v0, Lcom/vk/stories/util/VideoCompressor$2;

    invoke-direct {v0, v1, v6, p3, v4}, Lcom/vk/stories/util/VideoCompressor$2;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicReference;Lcom/vk/stories/util/VideoCompressor$CompressDelegate;Ljava/io/File;)V

    return-object v0

    .line 67
    .end local v4    # "outputVideo":Ljava/io/File;
    :cond_0
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVideoFile()Ljava/io/File;

    move-result-object v4

    .restart local v4    # "outputVideo":Ljava/io/File;
    goto :goto_0
.end method

.method public static render(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;ZLandroid/graphics/Bitmap;Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)Lcom/vk/stories/util/VideoCompressor$RenderTask;
    .locals 1
    .param p0, "parameters"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .param p1, "temp"    # Z
    .param p2, "image"    # Landroid/graphics/Bitmap;
    .param p3, "compressDelegate"    # Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    .prologue
    .line 51
    invoke-static {p0, p1, p2, p3}, Lcom/vk/stories/util/VideoCompressor;->doFFMpegRender(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;ZLandroid/graphics/Bitmap;Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)Lcom/vk/stories/util/VideoCompressor$RenderTask;

    move-result-object v0

    return-object v0
.end method

.method public static render(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;ZLcom/vk/stories/util/VideoCompressor$CompressDelegate;)Lcom/vk/stories/util/VideoCompressor$RenderTask;
    .locals 1
    .param p0, "parameters"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .param p1, "temp"    # Z
    .param p2, "compressDelegate"    # Lcom/vk/stories/util/VideoCompressor$CompressDelegate;

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lcom/vk/stories/util/VideoCompressor;->doFFMpegRender(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;ZLandroid/graphics/Bitmap;Lcom/vk/stories/util/VideoCompressor$CompressDelegate;)Lcom/vk/stories/util/VideoCompressor$RenderTask;

    move-result-object v0

    return-object v0
.end method
