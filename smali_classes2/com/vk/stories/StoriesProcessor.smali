.class public Lcom/vk/stories/StoriesProcessor;
.super Ljava/lang/Object;
.source "StoriesProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;,
        Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;
    }
.end annotation


# static fields
.field public static final MAX_PHOTO_HEIGHT:I = 0x780

.field public static final MAX_PHOTO_WIDTH:I = 0x438

.field public static final MAX_VIDEO_HEIGHT:I = 0x500

.field public static final MAX_VIDEO_LENGTH:J = 0x3a98L

.field public static final MAX_VIDEO_WIDTH:I = 0x2d0

.field private static final bitmapPaint:Landroid/graphics/Paint;

.field private static final handler:Landroid/os/Handler;

.field private static final imageExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 31
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/vk/stories/StoriesProcessor;->bitmapPaint:Landroid/graphics/Paint;

    .line 32
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/stories/StoriesProcessor;->imageExecutor:Ljava/util/concurrent/Executor;

    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vk/stories/StoriesProcessor;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static imageSize(F)[I
    .locals 2
    .param p0, "targetAr"    # F

    .prologue
    .line 36
    const/16 v0, 0x438

    const/16 v1, 0x780

    invoke-static {p0, v0, v1}, Lcom/vk/stories/StoriesProcessor;->size(FII)[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$null$0(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;Ljava/io/File;)V
    .locals 0
    .param p0, "imageProcessingCallback"    # Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;
    .param p1, "resultFile"    # Ljava/io/File;

    .prologue
    .line 85
    invoke-interface {p0, p1}, Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;->onSuccess(Ljava/io/File;)V

    return-void
.end method

.method static synthetic lambda$null$1(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V
    .locals 0
    .param p0, "imageProcessingCallback"    # Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;

    .prologue
    .line 88
    invoke-interface {p0}, Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;->onFailure()V

    return-void
.end method

.method static synthetic lambda$processImage$2(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIZLcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V
    .locals 6
    .param p0, "image"    # Landroid/graphics/Bitmap;
    .param p1, "overlay"    # Landroid/graphics/Bitmap;
    .param p2, "targetW"    # I
    .param p3, "targetH"    # I
    .param p4, "temporary"    # Z
    .param p5, "imageProcessingCallback"    # Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;

    .prologue
    .line 71
    sget-object v4, Lcom/vk/core/util/GcTrigger;->DEFAULT:Lcom/vk/core/util/GcTrigger;

    invoke-interface {v4}, Lcom/vk/core/util/GcTrigger;->runGc()V

    .line 73
    invoke-static {p0, p1, p2, p3}, Lcom/vk/stories/StoriesProcessor;->processOverlay(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 76
    .local v2, "resultBitmap":Landroid/graphics/Bitmap;
    if-eqz p4, :cond_0

    .line 77
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getTempUploadJpgImageFile()Ljava/io/File;

    move-result-object v3

    .line 82
    .local v3, "resultFile":Ljava/io/File;
    :goto_0
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 83
    .local v1, "fos":Ljava/io/FileOutputStream;
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x56

    invoke-virtual {v2, v4, v5, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 84
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 85
    sget-object v4, Lcom/vk/stories/StoriesProcessor;->handler:Landroid/os/Handler;

    invoke-static {p5, v3}, Lcom/vk/stories/StoriesProcessor$$Lambda$5;->lambdaFactory$(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;Ljava/io/File;)Ljava/lang/Runnable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    :goto_1
    return-void

    .line 79
    .end local v3    # "resultFile":Ljava/io/File;
    :cond_0
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getPhotoFile()Ljava/io/File;

    move-result-object v3

    .restart local v3    # "resultFile":Ljava/io/File;
    goto :goto_0

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v3}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 88
    sget-object v4, Lcom/vk/stories/StoriesProcessor;->handler:Landroid/os/Handler;

    invoke-static {p5}, Lcom/vk/stories/StoriesProcessor$$Lambda$6;->lambdaFactory$(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)Ljava/lang/Runnable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1
.end method

.method static synthetic lambda$saveOverlayImage$3(Landroid/graphics/Bitmap;Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Object;
    .locals 5
    .param p0, "overlay"    # Landroid/graphics/Bitmap;
    .param p1, "overlayPath"    # Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 102
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getTempUploadPngImageFile()Ljava/io/File;

    move-result-object v2

    .line 104
    .local v2, "resultFile":Ljava/io/File;
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 105
    .local v1, "fos":Ljava/io/FileOutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {p0, v3, v4, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 106
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 108
    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    :goto_0
    const/4 v3, 0x0

    return-object v3

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v2}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    goto :goto_0
.end method

.method static synthetic lambda$saveOverlayImage$4(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IILjava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Object;
    .locals 6
    .param p0, "overlay"    # Landroid/graphics/Bitmap;
    .param p1, "videoPreview"    # Landroid/graphics/Bitmap;
    .param p2, "targetW"    # I
    .param p3, "targetH"    # I
    .param p4, "videoPreviewPath"    # Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 119
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getTempUploadJpgImageFile()Ljava/io/File;

    move-result-object v3

    .line 122
    .local v3, "resultFile":Ljava/io/File;
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 123
    :try_start_0
    invoke-static {p1, p0, p2, p3}, Lcom/vk/stories/StoriesProcessor;->processOverlay(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 128
    .local v2, "resultBitmap":Landroid/graphics/Bitmap;
    :goto_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 129
    .local v1, "fos":Ljava/io/FileOutputStream;
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x50

    invoke-virtual {v2, v4, v5, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 130
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 132
    invoke-virtual {p4, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .end local v2    # "resultBitmap":Landroid/graphics/Bitmap;
    :goto_1
    const/4 v4, 0x0

    return-object v4

    .line 125
    :cond_0
    move-object v2, p1

    .restart local v2    # "resultBitmap":Landroid/graphics/Bitmap;
    goto :goto_0

    .line 133
    .end local v2    # "resultBitmap":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v3}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    goto :goto_1
.end method

.method static synthetic lambda$saveOverlayImage$5(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;Lbolts/Task;)Ljava/lang/Object;
    .locals 2
    .param p0, "imageProcessingCallback"    # Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;
    .param p1, "overlayPath"    # Ljava/util/concurrent/atomic/AtomicReference;
    .param p2, "videoPreviewPath"    # Ljava/util/concurrent/atomic/AtomicReference;
    .param p3, "task"    # Lbolts/Task;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 142
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-interface {p0, v0, v1}, Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;->onSuccess(Ljava/io/File;Ljava/io/File;)V

    .line 143
    const/4 v0, 0x0

    return-object v0
.end method

.method public static processImage(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIZLcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)V
    .locals 2
    .param p0, "image"    # Landroid/graphics/Bitmap;
    .param p1, "overlay"    # Landroid/graphics/Bitmap;
    .param p2, "targetW"    # I
    .param p3, "targetH"    # I
    .param p4, "temporary"    # Z
    .param p5, "imageProcessingCallback"    # Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;

    .prologue
    .line 70
    sget-object v0, Lcom/vk/stories/StoriesProcessor;->imageExecutor:Ljava/util/concurrent/Executor;

    invoke-static/range {p0 .. p5}, Lcom/vk/stories/StoriesProcessor$$Lambda$1;->lambdaFactory$(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIZLcom/vk/stories/StoriesProcessor$ImageProcessingCallback;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 91
    return-void
.end method

.method private static processOverlay(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 4
    .param p0, "image"    # Landroid/graphics/Bitmap;
    .param p1, "overlay"    # Landroid/graphics/Bitmap;
    .param p2, "targetW"    # I
    .param p3, "targetH"    # I

    .prologue
    const/4 v3, 0x0

    .line 60
    invoke-static {p0, p2, p3}, Lcom/vk/attachpicker/util/BitmapUtils;->centerCropBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 61
    .local v1, "resultBitmap":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_0

    .line 62
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 63
    .local v0, "canvas":Landroid/graphics/Canvas;
    sget-object v2, Lcom/vk/stories/StoriesProcessor;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 66
    .end local v0    # "canvas":Landroid/graphics/Canvas;
    :cond_0
    return-object v1
.end method

.method public static saveOverlayImage(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IILcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;)V
    .locals 8
    .param p0, "overlay"    # Landroid/graphics/Bitmap;
    .param p1, "videoPreview"    # Landroid/graphics/Bitmap;
    .param p2, "targetW"    # I
    .param p3, "targetH"    # I
    .param p4, "imageProcessingCallback"    # Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;

    .prologue
    .line 94
    sget-object v5, Lcom/vk/core/util/GcTrigger;->DEFAULT:Lcom/vk/core/util/GcTrigger;

    invoke-interface {v5}, Lcom/vk/core/util/GcTrigger;->runGc()V

    .line 96
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 97
    .local v0, "overlayPath":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/io/File;>;"
    new-instance v4, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v4}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 98
    .local v4, "videoPreviewPath":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/io/File;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 100
    .local v3, "tasks":Ljava/util/Collection;, "Ljava/util/Collection<Lbolts/Task<*>;>;"
    if-eqz p0, :cond_0

    .line 101
    invoke-static {p0, v0}, Lcom/vk/stories/StoriesProcessor$$Lambda$2;->lambdaFactory$(Landroid/graphics/Bitmap;Ljava/util/concurrent/atomic/AtomicReference;)Ljava/util/concurrent/Callable;

    move-result-object v5

    invoke-static {v5}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;)Lbolts/Task;

    move-result-object v1

    .line 114
    .local v1, "saveOverlayTask":Lbolts/Task;
    invoke-interface {v3, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 117
    .end local v1    # "saveOverlayTask":Lbolts/Task;
    :cond_0
    if-eqz p1, :cond_1

    .line 118
    invoke-static {p0, p1, p2, p3, v4}, Lcom/vk/stories/StoriesProcessor$$Lambda$3;->lambdaFactory$(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IILjava/util/concurrent/atomic/AtomicReference;)Ljava/util/concurrent/Callable;

    move-result-object v5

    invoke-static {v5}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;)Lbolts/Task;

    move-result-object v2

    .line 138
    .local v2, "saveVideoPreviewTask":Lbolts/Task;
    invoke-interface {v3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 141
    .end local v2    # "saveVideoPreviewTask":Lbolts/Task;
    :cond_1
    invoke-static {v3}, Lbolts/Task;->whenAll(Ljava/util/Collection;)Lbolts/Task;

    move-result-object v5

    invoke-static {p4, v0, v4}, Lcom/vk/stories/StoriesProcessor$$Lambda$4;->lambdaFactory$(Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;)Lbolts/Continuation;

    move-result-object v6

    sget-object v7, Lbolts/Task;->UI_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {v5, v6, v7}, Lbolts/Task;->onSuccess(Lbolts/Continuation;Ljava/util/concurrent/Executor;)Lbolts/Task;

    .line 145
    return-void
.end method

.method private static size(FII)[I
    .locals 6
    .param p0, "targetAr"    # F
    .param p1, "maxWidth"    # I
    .param p2, "maxHeght"    # I

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 48
    int-to-float v1, p1

    int-to-float v2, p2

    div-float v0, v1, v2

    .line 49
    .local v0, "idealAspectRatio":F
    sub-float v1, p0, v0

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v2, 0x3a83126f    # 0.001f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    .line 50
    new-array v1, v5, [I

    aput p1, v1, v3

    aput p2, v1, v4

    .line 54
    :goto_0
    return-object v1

    .line 51
    :cond_0
    cmpg-float v1, p0, v0

    if-gez v1, :cond_1

    .line 52
    new-array v1, v5, [I

    int-to-float v2, p2

    mul-float/2addr v2, p0

    float-to-int v2, v2

    aput v2, v1, v3

    aput p2, v1, v4

    goto :goto_0

    .line 54
    :cond_1
    new-array v1, v5, [I

    aput p1, v1, v3

    int-to-float v2, p1

    div-float/2addr v2, p0

    float-to-int v2, v2

    aput v2, v1, v4

    goto :goto_0
.end method

.method public static videoSize(FII)[I
    .locals 2
    .param p0, "targetAr"    # F
    .param p1, "videoWidth"    # I
    .param p2, "videoHeight"    # I

    .prologue
    const/16 v1, 0x500

    const/16 v0, 0x2d0

    .line 40
    if-lez p1, :cond_0

    if-lez p2, :cond_0

    .line 41
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/vk/stories/StoriesProcessor;->size(FII)[I

    move-result-object v0

    .line 43
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0, v0, v1}, Lcom/vk/stories/StoriesProcessor;->size(FII)[I

    move-result-object v0

    goto :goto_0
.end method
