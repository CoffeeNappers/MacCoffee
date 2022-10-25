.class Lcom/vk/masks/MasksController$15;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/masks/MasksController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function",
        "<",
        "Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;",
        "Lio/reactivex/ObservableSource",
        "<",
        "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksController;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 345
    iput-object p1, p0, Lcom/vk/masks/MasksController$15;->this$0:Lcom/vk/masks/MasksController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;)Lio/reactivex/ObservableSource;
    .locals 8
    .param p1, "masksGetModelResponse"    # Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;",
            ")",
            "Lio/reactivex/ObservableSource",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 348
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 349
    .local v0, "context":Landroid/content/Context;
    iget v5, p1, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->modelVersion:I

    .line 350
    .local v5, "serverModelVersion":I
    iget-object v4, p1, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->url:Ljava/lang/String;

    .line 352
    .local v4, "serverModelUrl":Ljava/lang/String;
    invoke-static {v0}, Lcom/vk/media/camera/CameraUtilsEffects;->engineDataFilesCount(Landroid/content/Context;)I

    move-result v2

    .line 354
    .local v2, "engineDataFilesCount":I
    invoke-static {v0}, Lcom/vk/media/camera/CameraUtilsEffects;->engineDataExist(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/vk/masks/MasksController$15;->this$0:Lcom/vk/masks/MasksController;

    .line 355
    invoke-static {v6}, Lcom/vk/masks/MasksController;->access$200(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksPrefs;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vk/masks/MasksPrefs;->getEngineModelFilesCount()I

    move-result v6

    if-ne v2, v6, :cond_0

    if-lez v2, :cond_0

    iget-object v6, p0, Lcom/vk/masks/MasksController$15;->this$0:Lcom/vk/masks/MasksController;

    .line 357
    invoke-static {v6}, Lcom/vk/masks/MasksController;->access$200(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksPrefs;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vk/masks/MasksPrefs;->getEngineModelVersion()I

    move-result v6

    iget v7, p1, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->modelVersion:I

    if-ne v6, v7, :cond_0

    const/4 v3, 0x1

    .line 359
    .local v3, "hasValidEngineData":Z
    :goto_0
    if-eqz v3, :cond_1

    .line 361
    invoke-static {v0}, Lcom/vk/media/camera/CameraUtilsEffects;->engineDataDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v6

    .line 360
    invoke-static {v6}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->createDoneEvent(Ljava/io/File;)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object v6

    invoke-static {v6}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v6

    .line 366
    :goto_1
    return-object v6

    .line 357
    .end local v3    # "hasValidEngineData":Z
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 363
    .restart local v3    # "hasValidEngineData":Z
    :cond_1
    const-string/jumbo v6, "masks_model.zip"

    invoke-static {v6}, Lcom/vk/core/util/FileUtils;->getDownloadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 364
    .local v1, "downloadFile":Ljava/io/File;
    invoke-static {v0, v4, v1}, Lcom/vk/core/network/RxFileDownloader;->download(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Lio/reactivex/Observable;

    move-result-object v6

    .line 365
    invoke-static {v0}, Lcom/vk/media/camera/CameraUtilsEffects;->engineDataDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v7

    invoke-static {v7}, Lcom/vk/masks/MasksController;->access$300(Ljava/io/File;)Lio/reactivex/functions/Function;

    move-result-object v7

    invoke-virtual {v6, v7}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v6

    new-instance v7, Lcom/vk/masks/MasksController$15$1;

    invoke-direct {v7, p0, v5, v0}, Lcom/vk/masks/MasksController$15$1;-><init>(Lcom/vk/masks/MasksController$15;ILandroid/content/Context;)V

    .line 366
    invoke-virtual {v6, v7}, Lio/reactivex/Observable;->doOnNext(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v6

    goto :goto_1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 345
    check-cast p1, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$15;->apply(Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;)Lio/reactivex/ObservableSource;

    move-result-object v0

    return-object v0
.end method
