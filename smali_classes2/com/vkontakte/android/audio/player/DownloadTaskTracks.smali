.class Lcom/vkontakte/android/audio/player/DownloadTaskTracks;
.super Lcom/vkontakte/android/audio/player/DownloadTaskBase;
.source "DownloadTaskTracks.java"


# instance fields
.field private final mMids:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mTracks:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;Ljava/util/Collection;Z)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;
    .param p4, "showNotification"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 17
    .local p3, "tracks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-direct {p0, p1, p2, p4}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;-><init>(Landroid/content/Context;Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;Z)V

    .line 19
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->mTracks:Ljava/util/Collection;

    .line 20
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->mMids:Ljava/util/Set;

    .line 21
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->mTracks:Ljava/util/Collection;

    if-eqz v1, :cond_0

    .line 22
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->mTracks:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 23
    .local v0, "track":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->mMids:Ljava/util/Set;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 26
    .end local v0    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_0
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;
    .locals 4
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 35
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->mTracks:Ljava/util/Collection;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->downloadTracks(Ljava/util/Collection;)Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    move-result-object v0

    .line 36
    .local v0, "error":Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;
    if-eqz v0, :cond_0

    .line 37
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->mTracks:Ljava/util/Collection;

    iget-boolean v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->mShowNotifications:Z

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getStartDownloadTracksIntent(Landroid/content/Context;Ljava/util/Collection;Z)Landroid/content/Intent;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;->retryIntent:Landroid/content/Intent;

    .line 39
    :cond_0
    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 11
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->doInBackground([Ljava/lang/Void;)Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    move-result-object v0

    return-object v0
.end method

.method public hasTrack(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mid"    # Ljava/lang/String;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;->mMids:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
