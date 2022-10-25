.class Lcom/vk/masks/MasksController$8;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController;->getMask(Lcom/vk/masks/model/Mask;)Lio/reactivex/Observable;
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
        "Lcom/vk/masks/model/Mask;",
        "Lio/reactivex/ObservableSource",
        "<+",
        "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksController;

.field final synthetic val$maskModel:Lcom/vk/masks/model/Mask;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController;Lcom/vk/masks/model/Mask;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/vk/masks/MasksController$8;->this$0:Lcom/vk/masks/MasksController;

    iput-object p2, p0, Lcom/vk/masks/MasksController$8;->val$maskModel:Lcom/vk/masks/model/Mask;

    iput-object p3, p0, Lcom/vk/masks/MasksController$8;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/vk/masks/model/Mask;)Lio/reactivex/ObservableSource;
    .locals 7
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/masks/model/Mask;",
            ")",
            "Lio/reactivex/ObservableSource",
            "<+",
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
    .line 192
    iget-object v4, p0, Lcom/vk/masks/MasksController$8;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v4}, Lcom/vk/masks/MasksController;->access$000(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksStorage;

    move-result-object v4

    iget-object v5, p0, Lcom/vk/masks/MasksController$8;->val$maskModel:Lcom/vk/masks/model/Mask;

    invoke-virtual {v4, v5}, Lcom/vk/masks/MasksStorage;->isDownloaded(Lcom/vk/masks/model/Mask;)Z

    move-result v2

    .line 193
    .local v2, "maskWasDownloaded":Z
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v5, p0, Lcom/vk/masks/MasksController$8;->val$name:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/vk/media/camera/CameraUtilsEffects;->effectFilesCount(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    .line 194
    .local v1, "effectsFilesCount":I
    if-lez v1, :cond_0

    iget-object v4, p0, Lcom/vk/masks/MasksController$8;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v4}, Lcom/vk/masks/MasksController;->access$000(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksStorage;

    move-result-object v4

    iget-object v5, p0, Lcom/vk/masks/MasksController$8;->val$maskModel:Lcom/vk/masks/model/Mask;

    invoke-virtual {v4, v5}, Lcom/vk/masks/MasksStorage;->getMaskFilesCount(Lcom/vk/masks/model/Mask;)I

    move-result v4

    if-ne v1, v4, :cond_0

    const/4 v3, 0x1

    .line 196
    .local v3, "validMaskFiles":Z
    :goto_0
    if-eqz v2, :cond_1

    if-eqz v3, :cond_1

    .line 197
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v5, p0, Lcom/vk/masks/MasksController$8;->val$name:Ljava/lang/String;

    .line 198
    invoke-static {v4, v5}, Lcom/vk/media/camera/CameraUtilsEffects;->effectDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 197
    invoke-static {v4}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->createDoneEvent(Ljava/io/File;)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object v4

    invoke-static {v4}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v4

    .line 237
    :goto_1
    return-object v4

    .line 194
    .end local v3    # "validMaskFiles":Z
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 201
    .restart local v3    # "validMaskFiles":Z
    :cond_1
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v5, p0, Lcom/vk/masks/MasksController$8;->val$name:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/vk/media/camera/CameraUtilsEffects;->effectDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/FileUtils;->doubleTryDeleteFile(Ljava/io/File;)V

    .line 204
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/vk/masks/MasksController$8;->val$name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ".zip"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/FileUtils;->getDownloadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 205
    .local v0, "downloadFile":Ljava/io/File;
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v5, p0, Lcom/vk/masks/MasksController$8;->val$maskModel:Lcom/vk/masks/model/Mask;

    iget-object v5, v5, Lcom/vk/masks/model/Mask;->url:Ljava/lang/String;

    invoke-static {v4, v5, v0}, Lcom/vk/core/network/RxFileDownloader;->download(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Lio/reactivex/Observable;

    move-result-object v4

    new-instance v5, Lcom/vk/masks/MasksController$8$5;

    invoke-direct {v5, p0}, Lcom/vk/masks/MasksController$8$5;-><init>(Lcom/vk/masks/MasksController$8;)V

    .line 207
    invoke-virtual {v4, v5}, Lio/reactivex/Observable;->doOnSubscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v4

    new-instance v5, Lcom/vk/masks/MasksController$8$4;

    invoke-direct {v5, p0}, Lcom/vk/masks/MasksController$8$4;-><init>(Lcom/vk/masks/MasksController$8;)V

    .line 213
    invoke-virtual {v4, v5}, Lio/reactivex/Observable;->doOnEach(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v4

    new-instance v5, Lcom/vk/masks/MasksController$8$3;

    invoke-direct {v5, p0}, Lcom/vk/masks/MasksController$8$3;-><init>(Lcom/vk/masks/MasksController$8;)V

    .line 219
    invoke-virtual {v4, v5}, Lio/reactivex/Observable;->doOnDispose(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v4

    .line 225
    invoke-static {}, Lcom/vk/masks/MasksController;->access$400()Lio/reactivex/functions/Function;

    move-result-object v5

    invoke-virtual {v4, v5}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v4

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v6, p0, Lcom/vk/masks/MasksController$8;->val$name:Ljava/lang/String;

    .line 226
    invoke-static {v5, v6}, Lcom/vk/media/camera/CameraUtilsEffects;->effectDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/masks/MasksController;->access$300(Ljava/io/File;)Lio/reactivex/functions/Function;

    move-result-object v5

    invoke-virtual {v4, v5}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v4

    new-instance v5, Lcom/vk/masks/MasksController$8$2;

    invoke-direct {v5, p0}, Lcom/vk/masks/MasksController$8$2;-><init>(Lcom/vk/masks/MasksController$8;)V

    .line 227
    invoke-virtual {v4, v5}, Lio/reactivex/Observable;->doOnNext(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v4

    new-instance v5, Lcom/vk/masks/MasksController$8$1;

    invoke-direct {v5, p0}, Lcom/vk/masks/MasksController$8$1;-><init>(Lcom/vk/masks/MasksController$8;)V

    .line 237
    invoke-virtual {v4, v5}, Lio/reactivex/Observable;->doOnError(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v4

    goto :goto_1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 189
    check-cast p1, Lcom/vk/masks/model/Mask;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$8;->apply(Lcom/vk/masks/model/Mask;)Lio/reactivex/ObservableSource;

    move-result-object v0

    return-object v0
.end method
