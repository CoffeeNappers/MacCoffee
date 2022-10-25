.class public final Lcom/vk/music/attach/loader/PlaylistMusicLoader;
.super Landroid/support/v4/app/Fragment;
.source "PlaylistMusicLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;,
        Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;
    }
.end annotation


# static fields
.field private static final KEY_CAN_LOAD_MORE:Ljava/lang/String; = "PlaylistMusicLoader.key.canLoadMore"

.field private static final KEY_MUSIC_TRACKS:Ljava/lang/String; = "PlaylistMusicLoader.key.musicTracks"

.field private static final KEY_OFFSET:Ljava/lang/String; = "PlaylistMusicLoader.key.offset"

.field private static final KEY_PLAYLIST:Ljava/lang/String; = "PlaylistMusicLoader.key.playlist"

.field private static final KEY_REASON:Ljava/lang/String; = "PlaylistMusicLoader.key.reason"

.field private static final LOAD_PORTION:I = 0x64


# instance fields
.field callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;",
            ">;"
        }
    .end annotation
.end field

.field canLoadMore:Z

.field private loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field musicTracks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field offset:I

.field private playlist:Lcom/vk/music/dto/Playlist;

.field reason:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore:Z

    return-void
.end method

.method static synthetic access$002(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader;
    .param p1, "x1"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->notifyCallbacks(Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;)V

    return-void
.end method

.method private load(II)V
    .locals 3
    .param p1, "audioOffset"    # I
    .param p2, "audioCount"    # I

    .prologue
    .line 139
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 191
    :goto_0
    return-void

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->playlist:Lcom/vk/music/dto/Playlist;

    if-nez v0, :cond_1

    .line 144
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "PlaylistMusicLoader: playlist is not initialized"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 148
    :cond_1
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->playlist:Lcom/vk/music/dto/Playlist;

    iget v1, v1, Lcom/vk/music/dto/Playlist;->id:I

    iget-object v2, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->playlist:Lcom/vk/music/dto/Playlist;

    iget v2, v2, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;-><init>(II)V

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v1, v1, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    .line 149
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->accessKey(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v0

    .line 150
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioOffset(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v0

    .line 151
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioCount(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v0

    .line 152
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->build()Lcom/vkontakte/android/api/audio/AudioGetPlaylist;

    move-result-object v0

    new-instance v1, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;-><init>(Lcom/vk/music/attach/loader/PlaylistMusicLoader;II)V

    .line 153
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 190
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private notifyCallbacks(Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;)V
    .locals 3
    .param p1    # Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification",
            "<",
            "Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 194
    .local p1, "notification":Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;, "Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification<Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;>;"
    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->callbacks:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 195
    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->callbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;

    .line 196
    .local v0, "callback":Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;
    invoke-interface {p1, v0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;->accept(Ljava/lang/Object;)V

    goto :goto_0

    .line 199
    .end local v0    # "callback":Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;
    :cond_0
    return-void
.end method

.method private reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 106
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 108
    iput-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 110
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->offset:I

    .line 111
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore:Z

    .line 112
    iput-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->musicTracks:Ljava/util/ArrayList;

    .line 113
    iput-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->reason:Ljava/lang/String;

    .line 114
    return-void
.end method


# virtual methods
.method public canLoadMore()Z
    .locals 1

    .prologue
    .line 131
    iget-boolean v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore:Z

    return v0
.end method

.method public getMusicTracks()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->musicTracks:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getReason()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 123
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public load()V
    .locals 2

    .prologue
    .line 127
    const/4 v1, 0x0

    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->offset:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->offset:I

    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->load(II)V

    .line 128
    return-void

    .line 127
    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method

.method public loadMore()V
    .locals 2

    .prologue
    .line 135
    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->offset:I

    const/16 v1, 0x64

    invoke-direct {p0, v0, v1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->load(II)V

    .line 136
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 64
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 65
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->setRetainInstance(Z)V

    .line 67
    if-eqz p1, :cond_0

    .line 68
    const-string/jumbo v0, "PlaylistMusicLoader.key.playlist"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Playlist;

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->playlist:Lcom/vk/music/dto/Playlist;

    .line 69
    const-string/jumbo v0, "PlaylistMusicLoader.key.offset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->offset:I

    .line 70
    const-string/jumbo v0, "PlaylistMusicLoader.key.canLoadMore"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore:Z

    .line 71
    const-string/jumbo v0, "PlaylistMusicLoader.key.musicTracks"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->musicTracks:Ljava/util/ArrayList;

    .line 72
    const-string/jumbo v0, "PlaylistMusicLoader.key.reason"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->reason:Ljava/lang/String;

    .line 74
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 78
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 79
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 83
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 54
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 55
    const-string/jumbo v0, "PlaylistMusicLoader.key.playlist"

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 56
    const-string/jumbo v0, "PlaylistMusicLoader.key.offset"

    iget v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->offset:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 57
    const-string/jumbo v0, "PlaylistMusicLoader.key.canLoadMore"

    iget-boolean v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 58
    const-string/jumbo v0, "PlaylistMusicLoader.key.musicTracks"

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 59
    const-string/jumbo v0, "PlaylistMusicLoader.key.reason"

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->reason:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public setPlaylist(Lcom/vk/music/dto/Playlist;)V
    .locals 1
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {p1, v0}, Lcom/vk/music/dto/Playlist;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 100
    iput-object p1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->playlist:Lcom/vk/music/dto/Playlist;

    .line 101
    invoke-direct {p0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->reset()V

    .line 103
    :cond_0
    return-void
.end method

.method public subscribe(Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->callbacks:Ljava/util/List;

    if-nez v0, :cond_0

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->callbacks:Ljava/util/List;

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    return-void
.end method

.method public unsubscribe(Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->callbacks:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 96
    :cond_0
    return-void
.end method
