.class public final Lcom/vk/music/attach/loader/MusicLoader;
.super Landroid/support/v4/app/Fragment;
.source "MusicLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/attach/loader/MusicLoader$Notification;,
        Lcom/vk/music/attach/loader/MusicLoader$Callback;
    }
.end annotation


# static fields
.field private static final AUDIO_ITEMS_PORTION:I = 0x64

.field private static final KEY_CAN_LOAD_MORE:Ljava/lang/String; = "MusicLoader.key.canLoadMore"

.field private static final KEY_MUSIC_TRACKS:Ljava/lang/String; = "MusicLoader.key.musicTracks"

.field private static final KEY_OFFSET:Ljava/lang/String; = "MusicLoader.key.offset"

.field private static final KEY_PLAYLISTS_COUNT:Ljava/lang/String; = "MusicLoader.key.playlistsCount"

.field private static final KEY_REASON:Ljava/lang/String; = "MusicLoader.key.reason"


# instance fields
.field callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/attach/loader/MusicLoader$Callback;",
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

.field playlistsCount:Ljava/lang/Integer;

.field reason:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->canLoadMore:Z

    return-void
.end method

.method static synthetic access$002(Lcom/vk/music/attach/loader/MusicLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/attach/loader/MusicLoader;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/vk/music/attach/loader/MusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/music/attach/loader/MusicLoader;Lcom/vk/music/attach/loader/MusicLoader$Notification;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/attach/loader/MusicLoader;
    .param p1, "x1"    # Lcom/vk/music/attach/loader/MusicLoader$Notification;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/vk/music/attach/loader/MusicLoader;->notifyCallbacks(Lcom/vk/music/attach/loader/MusicLoader$Notification;)V

    return-void
.end method

.method private load(ZII)V
    .locals 3
    .param p1, "loadPlaylist"    # Z
    .param p2, "audioOffset"    # I
    .param p3, "audioCount"    # I

    .prologue
    const/4 v2, 0x1

    .line 128
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 179
    :goto_0
    return-void

    .line 132
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;-><init>(I)V

    .line 133
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->needPlaylists(Z)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    move-result-object v0

    .line 134
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->playlistsCount(I)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    move-result-object v0

    .line 135
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->audioOffset(I)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    move-result-object v0

    .line 136
    invoke-virtual {v0, p3}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->audioCount(I)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    move-result-object v0

    .line 137
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->build()Lcom/vkontakte/android/api/audio/AudioGetMusicPage;

    move-result-object v0

    new-instance v1, Lcom/vk/music/attach/loader/MusicLoader$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/vk/music/attach/loader/MusicLoader$1;-><init>(Lcom/vk/music/attach/loader/MusicLoader;ZII)V

    .line 138
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 178
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private notifyCallbacks(Lcom/vk/music/attach/loader/MusicLoader$Notification;)V
    .locals 3
    .param p1    # Lcom/vk/music/attach/loader/MusicLoader$Notification;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/attach/loader/MusicLoader$Notification",
            "<",
            "Lcom/vk/music/attach/loader/MusicLoader$Callback;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 182
    .local p1, "notification":Lcom/vk/music/attach/loader/MusicLoader$Notification;, "Lcom/vk/music/attach/loader/MusicLoader$Notification<Lcom/vk/music/attach/loader/MusicLoader$Callback;>;"
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicLoader;->callbacks:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 183
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicLoader;->callbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/loader/MusicLoader$Callback;

    .line 184
    .local v0, "callback":Lcom/vk/music/attach/loader/MusicLoader$Callback;
    invoke-interface {p1, v0}, Lcom/vk/music/attach/loader/MusicLoader$Notification;->accept(Ljava/lang/Object;)V

    goto :goto_0

    .line 187
    .end local v0    # "callback":Lcom/vk/music/attach/loader/MusicLoader$Callback;
    :cond_0
    return-void
.end method


# virtual methods
.method public canLoadMore()Z
    .locals 1

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->canLoadMore:Z

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
    .line 107
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->musicTracks:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getPlaylistsCount()Ljava/lang/Integer;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->playlistsCount:Ljava/lang/Integer;

    return-object v0
.end method

.method public getReason()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public load()V
    .locals 3

    .prologue
    .line 116
    const/4 v1, 0x1

    const/4 v2, 0x0

    iget v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->offset:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->offset:I

    :goto_0
    invoke-direct {p0, v1, v2, v0}, Lcom/vk/music/attach/loader/MusicLoader;->load(ZII)V

    .line 117
    return-void

    .line 116
    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method

.method public loadMore()V
    .locals 3

    .prologue
    .line 124
    const/4 v0, 0x0

    iget v1, p0, Lcom/vk/music/attach/loader/MusicLoader;->offset:I

    const/16 v2, 0x64

    invoke-direct {p0, v0, v1, v2}, Lcom/vk/music/attach/loader/MusicLoader;->load(ZII)V

    .line 125
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 65
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 66
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/music/attach/loader/MusicLoader;->setRetainInstance(Z)V

    .line 67
    if-eqz p1, :cond_1

    .line 68
    const-string/jumbo v0, "MusicLoader.key.offset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->offset:I

    .line 69
    const-string/jumbo v0, "MusicLoader.key.canLoadMore"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->canLoadMore:Z

    .line 70
    const-string/jumbo v0, "MusicLoader.key.playlistsCount"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    const-string/jumbo v0, "MusicLoader.key.playlistsCount"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->playlistsCount:Ljava/lang/Integer;

    .line 73
    :cond_0
    const-string/jumbo v0, "MusicLoader.key.musicTracks"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->musicTracks:Ljava/util/ArrayList;

    .line 74
    const-string/jumbo v0, "MusicLoader.key.reason"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->reason:Ljava/lang/String;

    .line 76
    :cond_1
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 80
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 81
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 85
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 53
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 54
    const-string/jumbo v0, "MusicLoader.key.offset"

    iget v1, p0, Lcom/vk/music/attach/loader/MusicLoader;->offset:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 55
    const-string/jumbo v0, "MusicLoader.key.canLoadMore"

    iget-boolean v1, p0, Lcom/vk/music/attach/loader/MusicLoader;->canLoadMore:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 56
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->playlistsCount:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 57
    const-string/jumbo v0, "MusicLoader.key.playlistsCount"

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicLoader;->playlistsCount:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 59
    :cond_0
    const-string/jumbo v0, "MusicLoader.key.musicTracks"

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicLoader;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 60
    const-string/jumbo v0, "MusicLoader.key.reason"

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicLoader;->reason:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public subscribe(Lcom/vk/music/attach/loader/MusicLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/MusicLoader$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->callbacks:Ljava/util/List;

    if-nez v0, :cond_0

    .line 89
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->callbacks:Ljava/util/List;

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    return-void
.end method

.method public unsubscribe(Lcom/vk/music/attach/loader/MusicLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/MusicLoader$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 95
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->callbacks:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 98
    :cond_0
    return-void
.end method
