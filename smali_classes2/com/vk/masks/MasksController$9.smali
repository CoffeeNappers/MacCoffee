.class Lcom/vk/masks/MasksController$9;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/BiFunction;


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
        "Lio/reactivex/functions/BiFunction",
        "<",
        "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
        "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
        "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksController;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 248
    iput-object p1, p0, Lcom/vk/masks/MasksController$9;->this$0:Lcom/vk/masks/MasksController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
    .locals 2
    .param p1, "mask"    # Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2, "model"    # Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 251
    invoke-virtual {p1}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isProgressEvent()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isProgressEvent()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 252
    iget v0, p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->progress:F

    iget v1, p2, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->progress:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    .line 256
    .end local p1    # "mask":Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
    :cond_0
    :goto_0
    return-object p1

    .restart local p1    # "mask":Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
    :cond_1
    move-object p1, p2

    .line 252
    goto :goto_0

    .line 253
    :cond_2
    invoke-virtual {p2}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isProgressEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object p1, p2

    .line 254
    goto :goto_0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 248
    check-cast p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    check-cast p2, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    invoke-virtual {p0, p1, p2}, Lcom/vk/masks/MasksController$9;->apply(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object v0

    return-object v0
.end method
