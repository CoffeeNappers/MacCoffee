.class Lcom/vk/masks/MasksController$8$2;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController$8;->apply(Lcom/vk/masks/model/Mask;)Lio/reactivex/ObservableSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/masks/MasksController$8;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController$8;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/masks/MasksController$8;

    .prologue
    .line 227
    iput-object p1, p0, Lcom/vk/masks/MasksController$8$2;->this$1:Lcom/vk/masks/MasksController$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)V
    .locals 4
    .param p1, "downloadEvent"    # Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 230
    invoke-virtual {p1}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isDoneEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/vk/masks/MasksController$8$2;->this$1:Lcom/vk/masks/MasksController$8;

    iget-object v0, v0, Lcom/vk/masks/MasksController$8;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$000(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksStorage;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksController$8$2;->this$1:Lcom/vk/masks/MasksController$8;

    iget-object v1, v1, Lcom/vk/masks/MasksController$8;->val$maskModel:Lcom/vk/masks/model/Mask;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/vk/masks/MasksController$8$2;->this$1:Lcom/vk/masks/MasksController$8;

    iget-object v3, v3, Lcom/vk/masks/MasksController$8;->val$name:Ljava/lang/String;

    .line 232
    invoke-static {v2, v3}, Lcom/vk/media/camera/CameraUtilsEffects;->effectFilesCount(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    .line 231
    invoke-virtual {v0, v1, v2}, Lcom/vk/masks/MasksStorage;->saveNewMask(Lcom/vk/masks/model/Mask;I)V

    .line 235
    :cond_0
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
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
    .line 227
    check-cast p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$8$2;->accept(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)V

    return-void
.end method
