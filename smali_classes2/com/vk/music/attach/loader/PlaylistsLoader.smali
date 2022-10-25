.class public final Lcom/vk/music/attach/loader/PlaylistsLoader;
.super Landroid/support/v4/app/Fragment;
.source "PlaylistsLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;,
        Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;
    }
.end annotation


# static fields
.field private static final KEY_CAN_LOAD_MORE:Ljava/lang/String; = "PlaylistsLoader.key.canLoadMore"

.field private static final KEY_OFFSET:Ljava/lang/String; = "PlaylistsLoader.key.offset"

.field private static final KEY_PLAYLISTS:Ljava/lang/String; = "PlaylistsLoader.key.playlists"

.field private static final KEY_REASON:Ljava/lang/String; = "PlaylistsLoader.key.reason"

.field private static final LOAD_PORTION:I = 0x64


# instance fields
.field callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;",
            ">;"
        }
    .end annotation
.end field

.field canLoadMore:Z

.field private loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field offset:I

.field playlists:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field reason:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore:Z

    return-void
.end method

.method static synthetic access$002(Lcom/vk/music/attach/loader/PlaylistsLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/attach/loader/PlaylistsLoader;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/music/attach/loader/PlaylistsLoader;Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/attach/loader/PlaylistsLoader;
    .param p1, "x1"    # Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->notifyCallbacks(Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;)V

    return-void
.end method

.method private load(II)V
    .locals 2
    .param p1, "playlistsOffset"    # I
    .param p2, "playlistsCount"    # I

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 167
    :goto_0
    return-void

    .line 125
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;-><init>(I)V

    .line 126
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->offset(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;

    move-result-object v0

    .line 127
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->count(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;

    move-result-object v0

    .line 128
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->build()Lcom/vkontakte/android/api/audio/AudioGetPlaylists;

    move-result-object v0

    new-instance v1, Lcom/vk/music/attach/loader/PlaylistsLoader$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/vk/music/attach/loader/PlaylistsLoader$1;-><init>(Lcom/vk/music/attach/loader/PlaylistsLoader;II)V

    .line 129
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 166
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private notifyCallbacks(Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;)V
    .locals 3
    .param p1    # Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/attach/loader/PlaylistsLoader$Notification",
            "<",
            "Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 170
    .local p1, "notification":Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;, "Lcom/vk/music/attach/loader/PlaylistsLoader$Notification<Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;>;"
    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->callbacks:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 171
    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->callbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;

    .line 172
    .local v0, "callback":Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;
    invoke-interface {p1, v0}, Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;->accept(Ljava/lang/Object;)V

    goto :goto_0

    .line 175
    .end local v0    # "callback":Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;
    :cond_0
    return-void
.end method


# virtual methods
.method public canLoadMore()Z
    .locals 1

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore:Z

    return v0
.end method

.method public getPlaylists()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->playlists:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getReason()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public load()V
    .locals 2

    .prologue
    .line 109
    const/4 v1, 0x0

    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->offset:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->offset:I

    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/vk/music/attach/loader/PlaylistsLoader;->load(II)V

    .line 110
    return-void

    .line 109
    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method

.method public loadMore()V
    .locals 2

    .prologue
    .line 117
    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->offset:I

    const/16 v1, 0x64

    invoke-direct {p0, v0, v1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->load(II)V

    .line 118
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 61
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 62
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/music/attach/loader/PlaylistsLoader;->setRetainInstance(Z)V

    .line 63
    if-eqz p1, :cond_0

    .line 64
    const-string/jumbo v0, "PlaylistsLoader.key.offset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->offset:I

    .line 65
    const-string/jumbo v0, "PlaylistsLoader.key.canLoadMore"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore:Z

    .line 66
    const-string/jumbo v0, "PlaylistsLoader.key.playlists"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->playlists:Ljava/util/ArrayList;

    .line 67
    const-string/jumbo v0, "PlaylistsLoader.key.reason"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->reason:Ljava/lang/String;

    .line 69
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 78
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 79
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 83
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 52
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 53
    const-string/jumbo v0, "PlaylistsLoader.key.offset"

    iget v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->offset:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 54
    const-string/jumbo v0, "PlaylistsLoader.key.canLoadMore"

    iget-boolean v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 55
    const-string/jumbo v0, "PlaylistsLoader.key.playlists"

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->playlists:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 56
    const-string/jumbo v0, "PlaylistsLoader.key.reason"

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->reason:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 73
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 74
    return-void
.end method

.method public subscribe(Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->callbacks:Ljava/util/List;

    if-nez v0, :cond_0

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->callbacks:Ljava/util/List;

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    return-void
.end method

.method public unsubscribe(Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->callbacks:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 96
    :cond_0
    return-void
.end method
