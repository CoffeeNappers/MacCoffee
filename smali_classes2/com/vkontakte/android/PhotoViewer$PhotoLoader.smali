.class Lcom/vkontakte/android/PhotoViewer$PhotoLoader;
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
    name = "PhotoLoader"
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

.field private photo:Lcom/vkontakte/android/Photo;

.field private progr:Lcom/vk/imageloader/VKImageRequestProgress;

.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;

.field private wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/PhotoViewer;Lcom/vkontakte/android/Photo;)V
    .locals 1
    .param p2, "p"    # Lcom/vkontakte/android/Photo;

    .prologue
    .line 1260
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1256
    new-instance v0, Lcom/vk/imageloader/VKImageRequestWrapper;

    invoke-direct {v0}, Lcom/vk/imageloader/VKImageRequestWrapper;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;

    .line 1258
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->canceled:Z

    .line 1261
    iput-object p2, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->photo:Lcom/vkontakte/android/Photo;

    .line 1262
    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 2
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    const/4 v1, 0x1

    .line 1273
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;

    if-eqz v0, :cond_0

    .line 1274
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;

    invoke-virtual {v0}, Lcom/vk/imageloader/VKImageRequestWrapper;->cancel()V

    .line 1275
    iput-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->canceled:Z

    .line 1277
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
    .line 1282
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->bmp:Landroid/graphics/Bitmap;

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
    .line 1290
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
    .line 1252
    invoke-virtual {p0}, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->get()Landroid/graphics/Bitmap;

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
    .line 1252
    invoke-virtual {p0, p1, p2, p3}, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->get(JLjava/util/concurrent/TimeUnit;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 1295
    iget-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->canceled:Z

    return v0
.end method

.method public isDone()Z
    .locals 1

    .prologue
    .line 1300
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public run()V
    .locals 4

    .prologue
    const/16 v3, 0x78

    .line 1266
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->canceled:Z

    .line 1267
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget-boolean v1, v1, Lcom/vkontakte/android/PhotoViewer;->useSmall:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->photo:Lcom/vkontakte/android/Photo;

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 1268
    .local v0, "url":Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->progr:Lcom/vk/imageloader/VKImageRequestProgress;

    invoke-static {v1, v2, v3}, Lcom/vk/imageloader/VKImageLoader;->getVeryBigBitmap(Landroid/net/Uri;Lcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;)Lio/reactivex/Observable;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    iput-object v1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->bmp:Landroid/graphics/Bitmap;

    .line 1269
    return-void

    .line 1267
    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget-boolean v1, v1, Lcom/vkontakte/android/PhotoViewer;->useBig:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->photo:Lcom/vkontakte/android/Photo;

    const/4 v2, 0x3

    new-array v2, v2, [C

    fill-array-data v2, :array_0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/Photo;->getImage([C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->photo:Lcom/vkontakte/android/Photo;

    const/16 v2, 0x79

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/Photo;->getImage(CC)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_0

    :array_0
    .array-data 2
        0x7as
        0x79s
        0x78s
    .end array-data
.end method

.method public setProgressCallback(Lcom/vk/imageloader/VKImageRequestProgress;)V
    .locals 0
    .param p1, "c"    # Lcom/vk/imageloader/VKImageRequestProgress;

    .prologue
    .line 1305
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;->progr:Lcom/vk/imageloader/VKImageRequestProgress;

    .line 1306
    return-void
.end method
