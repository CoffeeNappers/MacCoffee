.class Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Lcom/vkontakte/android/ui/PhotoView$RunnableFuture;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/PhotoViewer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DocPhotoLoader"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/ui/PhotoView$RunnableFuture",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private bmp:Landroid/graphics/Bitmap;

.field private canceled:Z

.field private progr:Lcom/vk/imageloader/VKImageRequestProgress;

.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;

.field private wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 1

    .prologue
    .line 1316
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1312
    new-instance v0, Lcom/vk/imageloader/VKImageRequestWrapper;

    invoke-direct {v0}, Lcom/vk/imageloader/VKImageRequestWrapper;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;

    .line 1314
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->canceled:Z

    .line 1317
    return-void
.end method

.method static synthetic lambda$run$0(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "rec$"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 1326
    invoke-static {p0}, Lcom/vkontakte/android/PhotoViewer;->access$3400(Lcom/vkontakte/android/PhotoViewer;)V

    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 2
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    const/4 v1, 0x1

    .line 1333
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;

    if-eqz v0, :cond_0

    .line 1334
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;

    invoke-virtual {v0}, Lcom/vk/imageloader/VKImageRequestWrapper;->cancel()V

    .line 1335
    iput-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->canceled:Z

    .line 1337
    :cond_0
    return v1
.end method

.method public get()Landroid/graphics/Bitmap;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 1342
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->bmp:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Landroid/graphics/Bitmap;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 1350
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 1309
    invoke-virtual {p0}, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->get()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 1309
    invoke-virtual {p0, p1, p2, p3}, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->get(JLjava/util/concurrent/TimeUnit;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 1355
    iget-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->canceled:Z

    return v0
.end method

.method public isDone()Z
    .locals 1

    .prologue
    .line 1360
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 1321
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->canceled:Z

    .line 1322
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$3200(Lcom/vkontakte/android/PhotoViewer;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1323
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$3200(Lcom/vkontakte/android/PhotoViewer;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->progr:Lcom/vk/imageloader/VKImageRequestProgress;

    invoke-static {v0, v1, v2}, Lcom/vk/imageloader/VKImageLoader;->getVeryBigBitmap(Landroid/net/Uri;Lcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->bmp:Landroid/graphics/Bitmap;

    .line 1324
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 1325
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->this$0:Lcom/vkontakte/android/PhotoViewer;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->access$3302(Lcom/vkontakte/android/PhotoViewer;Z)Z

    .line 1326
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/PhotoViewer;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 1329
    :cond_0
    return-void
.end method

.method public setProgressCallback(Lcom/vk/imageloader/VKImageRequestProgress;)V
    .locals 0
    .param p1, "c"    # Lcom/vk/imageloader/VKImageRequestProgress;

    .prologue
    .line 1365
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;->progr:Lcom/vk/imageloader/VKImageRequestProgress;

    .line 1366
    return-void
.end method
