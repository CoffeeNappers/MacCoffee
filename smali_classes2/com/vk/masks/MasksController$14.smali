.class final Lcom/vk/masks/MasksController$14;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/masks/MasksController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function",
        "<",
        "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
        "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 333
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
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
    .line 336
    invoke-virtual {p1}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isProgressEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->progress:F

    const v1, 0x3f733333    # 0.95f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 337
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->createProgressEvent(F)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object p1

    .line 339
    .end local p1    # "downloadEvent":Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
    :cond_0
    return-object p1
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
    .line 333
    check-cast p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$14;->apply(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object v0

    return-object v0
.end method
