.class final Lcom/vk/masks/MasksController$13;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController;->unzipFileMap(Ljava/io/File;)Lio/reactivex/functions/Function;
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


# instance fields
.field final synthetic val$outputPath:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .locals 0

    .prologue
    .line 319
    iput-object p1, p0, Lcom/vk/masks/MasksController$13;->val$outputPath:Ljava/io/File;

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
    .line 322
    invoke-virtual {p1}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isDoneEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 323
    iget-object v0, p0, Lcom/vk/masks/MasksController$13;->val$outputPath:Ljava/io/File;

    iget-object v1, p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->resultFile:Ljava/io/File;

    invoke-static {v0, v1}, Lcom/vk/core/util/FileUtils;->unzip(Ljava/io/File;Ljava/io/File;)Z

    .line 324
    iget-object v0, p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->resultFile:Ljava/io/File;

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 325
    iget-object v0, p0, Lcom/vk/masks/MasksController$13;->val$outputPath:Ljava/io/File;

    invoke-static {v0}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->createDoneEvent(Ljava/io/File;)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object p1

    .line 327
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
    .line 319
    check-cast p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$13;->apply(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object v0

    return-object v0
.end method
