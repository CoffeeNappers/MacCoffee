.class Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;
.super Ljava/lang/Object;
.source "DownloadTaskBase.java"

# interfaces
.implements Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/audio/player/DownloadTaskBase;->downloadTracks(Ljava/util/Collection;)Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mFirstTrack:Lcom/vkontakte/android/audio/MusicTrack;

.field private mProgressSnap:Lcom/vkontakte/android/audio/utils/ProgressSnap;

.field final synthetic this$0:Lcom/vkontakte/android/audio/player/DownloadTaskBase;

.field final synthetic val$isMultipleMode:Z

.field final synthetic val$musicTracks:Ljava/util/Collection;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/player/DownloadTaskBase;ZLjava/util/Collection;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    .prologue
    .line 225
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->this$0:Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    iput-boolean p2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->val$isMultipleMode:Z

    iput-object p3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->val$musicTracks:Ljava/util/Collection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isCancelled()Z
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->this$0:Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->isCancelled()Z

    move-result v0

    return v0
.end method

.method public onProgress(JJI)V
    .locals 4
    .param p1, "count"    # J
    .param p3, "totalCount"    # J
    .param p5, "progress"    # I

    .prologue
    const/4 v3, 0x0

    .line 231
    iget-boolean v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->val$isMultipleMode:Z

    if-nez v1, :cond_2

    .line 232
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->mFirstTrack:Lcom/vkontakte/android/audio/MusicTrack;

    if-nez v1, :cond_0

    .line 233
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->val$musicTracks:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/MusicTrack;

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->mFirstTrack:Lcom/vkontakte/android/audio/MusicTrack;

    .line 234
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->mProgressSnap:Lcom/vkontakte/android/audio/utils/ProgressSnap;

    if-nez v1, :cond_1

    .line 235
    new-instance v1, Lcom/vkontakte/android/audio/utils/ProgressSnap;

    const/16 v2, 0x14

    invoke-direct {v1, v2}, Lcom/vkontakte/android/audio/utils/ProgressSnap;-><init>(I)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->mProgressSnap:Lcom/vkontakte/android/audio/utils/ProgressSnap;

    .line 237
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->mProgressSnap:Lcom/vkontakte/android/audio/utils/ProgressSnap;

    invoke-virtual {v1, p5}, Lcom/vkontakte/android/audio/utils/ProgressSnap;->progress(I)I

    move-result v0

    .line 238
    .local v0, "p":I
    if-ltz v0, :cond_2

    .line 239
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->this$0:Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;->mFirstTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-static {v1, v2, v0, v3, v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->access$200(Lcom/vkontakte/android/audio/player/DownloadTaskBase;Lcom/vkontakte/android/audio/MusicTrack;III)V

    .line 241
    .end local v0    # "p":I
    :cond_2
    return-void
.end method
