.class final Lcom/vk/imageloader/VKImageLoader$5;
.super Lcom/facebook/imagepipeline/datasource/BaseBitmapDataSubscriber;
.source "VKImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/imageloader/VKImageLoader;->getBitmapInternal(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Landroid/graphics/Bitmap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$lock:Ljava/lang/Object;

.field final synthetic val$needLock:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$requestProgress:Lcom/vk/imageloader/VKImageRequestProgress;

.field final synthetic val$res:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/vk/imageloader/VKImageRequestProgress;)V
    .locals 0

    .prologue
    .line 286
    iput-object p1, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$res:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p2, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$lock:Ljava/lang/Object;

    iput-object p3, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$needLock:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p4, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$requestProgress:Lcom/vk/imageloader/VKImageRequestProgress;

    invoke-direct {p0}, Lcom/facebook/imagepipeline/datasource/BaseBitmapDataSubscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailureImpl(Lcom/facebook/datasource/DataSource;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/datasource/DataSource",
            "<",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 304
    .local p1, "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;"
    iget-object v1, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$lock:Ljava/lang/Object;

    monitor-enter v1

    .line 305
    :try_start_0
    iget-object v0, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$lock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 306
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 308
    iget-object v0, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$needLock:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 309
    return-void

    .line 306
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onNewResultImpl(Landroid/graphics/Bitmap;)V
    .locals 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 290
    :try_start_0
    iget-object v1, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$res:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 295
    :goto_0
    iget-object v2, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$lock:Ljava/lang/Object;

    monitor-enter v2

    .line 296
    :try_start_1
    iget-object v1, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$lock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 297
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 299
    iget-object v1, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$needLock:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 300
    return-void

    .line 291
    :catch_0
    move-exception v0

    .line 292
    .local v0, "t":Ljava/lang/Throwable;
    const-string/jumbo v1, "VKImageLoader"

    const-string/jumbo v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 297
    .end local v0    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public onProgressUpdate(Lcom/facebook/datasource/DataSource;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/datasource/DataSource",
            "<",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 313
    .local p1, "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;"
    invoke-interface {p1}, Lcom/facebook/datasource/DataSource;->getProgress()F

    move-result v0

    .line 314
    .local v0, "progress":F
    iget-object v1, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$requestProgress:Lcom/vk/imageloader/VKImageRequestProgress;

    if-eqz v1, :cond_0

    .line 315
    iget-object v1, p0, Lcom/vk/imageloader/VKImageLoader$5;->val$requestProgress:Lcom/vk/imageloader/VKImageRequestProgress;

    invoke-interface {v1, v0}, Lcom/vk/imageloader/VKImageRequestProgress;->onProgressUpdate(F)V

    .line 317
    :cond_0
    return-void
.end method
