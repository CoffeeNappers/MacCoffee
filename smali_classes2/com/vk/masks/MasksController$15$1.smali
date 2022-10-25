.class Lcom/vk/masks/MasksController$15$1;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController$15;->apply(Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;)Lio/reactivex/ObservableSource;
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
.field final synthetic this$1:Lcom/vk/masks/MasksController$15;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$serverModelVersion:I


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController$15;ILandroid/content/Context;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/masks/MasksController$15;

    .prologue
    .line 366
    iput-object p1, p0, Lcom/vk/masks/MasksController$15$1;->this$1:Lcom/vk/masks/MasksController$15;

    iput p2, p0, Lcom/vk/masks/MasksController$15$1;->val$serverModelVersion:I

    iput-object p3, p0, Lcom/vk/masks/MasksController$15$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)V
    .locals 2
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
    .line 369
    invoke-virtual {p1}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isDoneEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 370
    iget-object v0, p0, Lcom/vk/masks/MasksController$15$1;->this$1:Lcom/vk/masks/MasksController$15;

    iget-object v0, v0, Lcom/vk/masks/MasksController$15;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$200(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksPrefs;

    move-result-object v0

    iget v1, p0, Lcom/vk/masks/MasksController$15$1;->val$serverModelVersion:I

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksPrefs;->setEngineModelVersion(I)V

    .line 371
    iget-object v0, p0, Lcom/vk/masks/MasksController$15$1;->this$1:Lcom/vk/masks/MasksController$15;

    iget-object v0, v0, Lcom/vk/masks/MasksController$15;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$200(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksPrefs;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksController$15$1;->val$context:Landroid/content/Context;

    invoke-static {v1}, Lcom/vk/media/camera/CameraUtilsEffects;->engineDataFilesCount(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksPrefs;->setEngineModelFileCount(I)V

    .line 373
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
    .line 366
    check-cast p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$15$1;->accept(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)V

    return-void
.end method
