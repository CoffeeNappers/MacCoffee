.class public final Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
.super Landroid/support/v4/app/Fragment;
.source "PlaylistSearchResultsLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification;,
        Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;
    }
.end annotation


# static fields
.field private static final KEY_CAN_LOAD_MORE:Ljava/lang/String; = "PlaylistSearchResultsLoader.key.canLoadMore"

.field private static final KEY_OFFSET:Ljava/lang/String; = "PlaylistSearchResultsLoader.key.offset"

.field private static final KEY_QUERY:Ljava/lang/String; = "PlaylistSearchResultsLoader.key.query"

.field private static final KEY_REASON:Ljava/lang/String; = "PlaylistSearchResultsLoader.key.reason"

.field private static final KEY_SEARCH_RESULT:Ljava/lang/String; = "PlaylistSearchResultsLoader.key.playlistSearchResult"

.field private static final LOAD_PORTION:I = 0x64


# instance fields
.field callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;",
            ">;"
        }
    .end annotation
.end field

.field canLoadMore:Z

.field private loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field offset:I

.field playlistSearchResult:Lcom/vk/music/dto/PlaylistSearchResult;

.field private query:Ljava/lang/String;

.field reason:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->canLoadMore:Z

    return-void
.end method

.method static synthetic access$002(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
    .param p1, "x1"    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->notifyCallbacks(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification;)V

    return-void
.end method

.method private load(II)V
    .locals 2
    .param p1, "audioOffset"    # I
    .param p2, "audioCount"    # I

    .prologue
    .line 124
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 178
    :goto_0
    return-void

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->query:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 129
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "MusicSearchResultsLoader: query is not initialized"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 133
    :cond_1
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;-><init>()V

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->query:Ljava/lang/String;

    .line 134
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->query(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;

    move-result-object v0

    .line 135
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->ownerId(I)Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;

    move-result-object v0

    .line 136
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->offset(I)Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;

    move-result-object v0

    .line 137
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->count(I)Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;

    move-result-object v0

    .line 138
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->build()Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;

    move-result-object v0

    new-instance v1, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$1;-><init>(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;II)V

    .line 139
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 177
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private notifyCallbacks(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification;)V
    .locals 3
    .param p1    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification",
            "<",
            "Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 188
    .local p1, "notification":Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification;, "Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification<Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;>;"
    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->callbacks:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 189
    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->callbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;

    .line 190
    .local v0, "callback":Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;
    invoke-interface {p1, v0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Notification;->accept(Ljava/lang/Object;)V

    goto :goto_0

    .line 193
    .end local v0    # "callback":Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;
    :cond_0
    return-void
.end method


# virtual methods
.method public canLoadMore()Z
    .locals 1

    .prologue
    .line 116
    iget-boolean v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->canLoadMore:Z

    return v0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 183
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 185
    :cond_0
    return-void
.end method

.method public getPlaylistSearchResult()Lcom/vk/music/dto/PlaylistSearchResult;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->playlistSearchResult:Lcom/vk/music/dto/PlaylistSearchResult;

    return-object v0
.end method

.method public getReason()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public load()V
    .locals 2

    .prologue
    .line 112
    const/4 v1, 0x0

    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->offset:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->offset:I

    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->load(II)V

    .line 113
    return-void

    .line 112
    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method

.method public loadMore()V
    .locals 2

    .prologue
    .line 120
    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->offset:I

    const/16 v1, 0x64

    invoke-direct {p0, v0, v1}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->load(II)V

    .line 121
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 66
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 67
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->setRetainInstance(Z)V

    .line 68
    if-eqz p1, :cond_0

    .line 69
    const-string/jumbo v0, "PlaylistSearchResultsLoader.key.query"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->query:Ljava/lang/String;

    .line 70
    const-string/jumbo v0, "PlaylistSearchResultsLoader.key.offset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->offset:I

    .line 71
    const-string/jumbo v0, "PlaylistSearchResultsLoader.key.canLoadMore"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->canLoadMore:Z

    .line 72
    const-string/jumbo v0, "PlaylistSearchResultsLoader.key.playlistSearchResult"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/PlaylistSearchResult;

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->playlistSearchResult:Lcom/vk/music/dto/PlaylistSearchResult;

    .line 73
    const-string/jumbo v0, "PlaylistSearchResultsLoader.key.reason"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->reason:Ljava/lang/String;

    .line 75
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 79
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 80
    invoke-virtual {p0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->cancel()V

    .line 81
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 56
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 57
    const-string/jumbo v0, "PlaylistSearchResultsLoader.key.query"

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->query:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    const-string/jumbo v0, "PlaylistSearchResultsLoader.key.offset"

    iget v1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->offset:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 59
    const-string/jumbo v0, "PlaylistSearchResultsLoader.key.canLoadMore"

    iget-boolean v1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->canLoadMore:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 60
    const-string/jumbo v0, "PlaylistSearchResultsLoader.key.playlistSearchResult"

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->playlistSearchResult:Lcom/vk/music/dto/PlaylistSearchResult;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 61
    const-string/jumbo v0, "PlaylistSearchResultsLoader.key.reason"

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->reason:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method public setQuery(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 84
    iput-object p1, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->query:Ljava/lang/String;

    .line 85
    invoke-virtual {p0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->cancel()V

    .line 86
    return-void
.end method

.method public subscribe(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->callbacks:Ljava/util/List;

    if-nez v0, :cond_0

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->callbacks:Ljava/util/List;

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    return-void
.end method

.method public unsubscribe(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->callbacks:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 99
    :cond_0
    return-void
.end method
