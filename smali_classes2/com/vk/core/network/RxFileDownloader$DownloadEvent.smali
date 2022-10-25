.class public Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
.super Ljava/lang/Object;
.source "RxFileDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/network/RxFileDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DownloadEvent"
.end annotation


# static fields
.field private static final TYPE_DONE:I = 0x2

.field private static final TYPE_PROGRESS:I = 0x1

.field private static final TYPE_PROGRESS_INDETERMINATE:I = -0x1

.field private static final TYPE_START:I


# instance fields
.field public final progress:F

.field public final resultFile:Ljava/io/File;

.field public final type:I


# direct methods
.method private constructor <init>()V
    .locals 3

    .prologue
    .line 110
    const/4 v0, -0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;-><init>(IFLjava/io/File;)V

    .line 111
    return-void
.end method

.method private constructor <init>(F)V
    .locals 2
    .param p1, "progress"    # F

    .prologue
    .line 114
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;-><init>(IFLjava/io/File;)V

    .line 115
    return-void
.end method

.method public constructor <init>(IFLjava/io/File;)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "progress"    # F
    .param p3, "resultFile"    # Ljava/io/File;

    .prologue
    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    iput p1, p0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->type:I

    .line 123
    iput p2, p0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->progress:F

    .line 124
    iput-object p3, p0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->resultFile:Ljava/io/File;

    .line 125
    return-void
.end method

.method private constructor <init>(Ljava/io/File;)V
    .locals 2
    .param p1, "resultFile"    # Ljava/io/File;

    .prologue
    .line 118
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;-><init>(IFLjava/io/File;)V

    .line 119
    return-void
.end method

.method public static createDoneEvent(Ljava/io/File;)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
    .locals 1
    .param p0, "resultFile"    # Ljava/io/File;

    .prologue
    .line 102
    new-instance v0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    invoke-direct {v0, p0}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public static createIndeterminateProgressEvent()Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
    .locals 1

    .prologue
    .line 94
    new-instance v0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    invoke-direct {v0}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;-><init>()V

    return-object v0
.end method

.method public static createProgressEvent(F)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
    .locals 1
    .param p0, "progress"    # F

    .prologue
    .line 98
    new-instance v0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    invoke-direct {v0, p0}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;-><init>(F)V

    return-object v0
.end method

.method public static createStartEvent()Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
    .locals 4

    .prologue
    .line 90
    new-instance v0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;-><init>(IFLjava/io/File;)V

    return-object v0
.end method


# virtual methods
.method public isDoneEvent()Z
    .locals 2

    .prologue
    .line 136
    iget v0, p0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isIndeterminateProgressEvent()Z
    .locals 2

    .prologue
    .line 128
    iget v0, p0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->type:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isProgressEvent()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 132
    iget v1, p0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->type:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isStartEvent()Z
    .locals 1

    .prologue
    .line 140
    iget v0, p0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->type:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 145
    invoke-virtual {p0}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isStartEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    const-string/jumbo v0, "DownloadEvent:TYPE_START"

    .line 152
    :goto_0
    return-object v0

    .line 147
    :cond_0
    invoke-virtual {p0}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isIndeterminateProgressEvent()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 148
    const-string/jumbo v0, "DownloadEvent:TYPE_PROGRESS_INDETERMINATE"

    goto :goto_0

    .line 149
    :cond_1
    invoke-virtual {p0}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isProgressEvent()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "DownloadEvent:TYPE_PROGRESS:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->progress:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 152
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "DownloadEvent:TYPE_DONE:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->resultFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
