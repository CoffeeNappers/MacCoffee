.class Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;
.super Ljava/lang/Object;
.source "SavedTracks.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/SavedTracks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyDownloadTaskListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/SavedTracks;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/SavedTracks;)V
    .locals 0

    .prologue
    .line 397
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/SavedTracks;Lcom/vkontakte/android/audio/player/SavedTracks$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/SavedTracks$1;

    .prologue
    .line 397
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;-><init>(Lcom/vkontakte/android/audio/player/SavedTracks;)V

    return-void
.end method


# virtual methods
.method public isAllTasksFinished()Z
    .locals 1

    .prologue
    .line 418
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$500(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onFinished(Lcom/vkontakte/android/audio/player/DownloadTaskBase;Z)V
    .locals 2
    .param p1, "task"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    .param p2, "success"    # Z

    .prologue
    .line 410
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->getUuid()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$400(Lcom/vkontakte/android/audio/player/SavedTracks;Ljava/lang/String;)Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    .line 411
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$500(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 412
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$600(Lcom/vkontakte/android/audio/player/SavedTracks;)Lcom/vkontakte/android/audio/utils/WakeLockEx;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->releaseSafety()V

    .line 413
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$700(Lcom/vkontakte/android/audio/player/SavedTracks;)V

    .line 414
    return-void
.end method

.method public varargs onRemoveTracks([Lcom/vkontakte/android/audio/player/SavedTrack;)V
    .locals 1
    .param p1, "tracks"    # [Lcom/vkontakte/android/audio/player/SavedTrack;

    .prologue
    .line 405
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$300(Lcom/vkontakte/android/audio/player/SavedTracks;[Lcom/vkontakte/android/audio/player/SavedTrack;)V

    .line 406
    return-void
.end method

.method public varargs onSaveTracks([Lcom/vkontakte/android/audio/player/SavedTrack;)V
    .locals 1
    .param p1, "tracks"    # [Lcom/vkontakte/android/audio/player/SavedTrack;

    .prologue
    .line 400
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$200(Lcom/vkontakte/android/audio/player/SavedTracks;[Lcom/vkontakte/android/audio/player/SavedTrack;)V

    .line 401
    return-void
.end method
