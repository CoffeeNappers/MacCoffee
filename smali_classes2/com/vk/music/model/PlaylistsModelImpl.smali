.class public Lcom/vk/music/model/PlaylistsModelImpl;
.super Lcom/vk/music/model/ObservableModel;
.source "PlaylistsModelImpl.java"

# interfaces
.implements Lcom/vk/music/model/PlaylistsModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/PlaylistsModelImpl$Builder;,
        Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/model/ObservableModel",
        "<",
        "Lcom/vk/music/model/PlaylistsModel$Callback;",
        ">;",
        "Lcom/vk/music/model/PlaylistsModel;"
    }
.end annotation


# static fields
.field private static final PLAYLISTS_PORTION:I = 0x14


# instance fields
.field private final canAddPlaylist:Z

.field private canLoadMore:Z

.field private final currentUser:Z

.field private deletePlaylistsRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/api/VKAPIRequest;",
            ">;"
        }
    .end annotation
.end field

.field private errorMessage:Ljava/lang/String;

.field private followPlaylistsRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/api/VKAPIRequest;",
            ">;"
        }
    .end annotation
.end field

.field private loadPlaylistsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field private offset:I

.field private final playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/event/Subscriber",
            "<",
            "Lcom/vk/music/event/PlaylistChanged;",
            ">;"
        }
    .end annotation
.end field

.field private final playlistCreatedSubscriber:Lcom/vk/music/event/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/event/Subscriber",
            "<",
            "Lcom/vk/music/event/PlaylistCreated;",
            ">;"
        }
    .end annotation
.end field

.field private final playlistRemovedSubscriber:Lcom/vk/music/event/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/event/Subscriber",
            "<",
            "Lcom/vk/music/event/PlaylistRemoved;",
            ">;"
        }
    .end annotation
.end field

.field private playlists:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field private final requestCreator:Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;>;"
        }
    .end annotation
.end field

.field private final select:Z

.field private title:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)V
    .locals 2
    .param p1, "builder"    # Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/vk/music/model/ObservableModel;-><init>()V

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->canLoadMore:Z

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->followPlaylistsRequests:Ljava/util/Map;

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->deletePlaylistsRequests:Ljava/util/Map;

    .line 55
    invoke-static {p0}, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl;)Lcom/vk/music/event/Subscriber;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;

    .line 67
    invoke-static {p0}, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl;)Lcom/vk/music/event/Subscriber;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlistCreatedSubscriber:Lcom/vk/music/event/Subscriber;

    .line 80
    invoke-static {p0}, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$3;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl;)Lcom/vk/music/event/Subscriber;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlistRemovedSubscriber:Lcom/vk/music/event/Subscriber;

    .line 91
    invoke-static {p1}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->access$000(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->requestCreator:Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;

    .line 92
    invoke-static {p1}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->access$100(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->currentUser:Z

    .line 93
    invoke-static {p1}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->access$200(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->title:Ljava/lang/String;

    .line 94
    invoke-static {p1}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->access$300(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->select:Z

    .line 95
    invoke-static {p1}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->access$400(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->canAddPlaylist:Z

    .line 97
    const-class v0, Lcom/vk/music/event/PlaylistChanged;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->subscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 98
    const-class v0, Lcom/vk/music/event/PlaylistCreated;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlistCreatedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->subscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 99
    const-class v0, Lcom/vk/music/event/PlaylistRemoved;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlistRemovedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->subscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 100
    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/model/PlaylistsModelImpl$Builder;Lcom/vk/music/model/PlaylistsModelImpl$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl$Builder;
    .param p2, "x1"    # Lcom/vk/music/model/PlaylistsModelImpl$1;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl;-><init>(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/vk/music/dto/Playlist;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/dto/Playlist;

    .prologue
    .line 27
    invoke-static {p0}, Lcom/vk/music/model/PlaylistsModelImpl;->key(Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vk/music/model/PlaylistsModelImpl;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->followPlaylistsRequests:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vk/music/model/PlaylistsModelImpl;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->deletePlaylistsRequests:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->loadPlaylistsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$600(Lcom/vk/music/model/PlaylistsModelImpl;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl;

    .prologue
    .line 27
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->canLoadMore:Z

    return v0
.end method

.method static synthetic access$602(Lcom/vk/music/model/PlaylistsModelImpl;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl;
    .param p1, "x1"    # Z

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->canLoadMore:Z

    return p1
.end method

.method static synthetic access$702(Lcom/vk/music/model/PlaylistsModelImpl;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl;
    .param p1, "x1"    # I

    .prologue
    .line 27
    iput p1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->offset:I

    return p1
.end method

.method static synthetic access$800(Lcom/vk/music/model/PlaylistsModelImpl;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$802(Lcom/vk/music/model/PlaylistsModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$902(Lcom/vk/music/model/PlaylistsModelImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->errorMessage:Ljava/lang/String;

    return-object p1
.end method

.method private static key(Lcom/vk/music/dto/Playlist;)Ljava/lang/String;
    .locals 2
    .param p0, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/vk/music/dto/Playlist;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private load(II)V
    .locals 2
    .param p1, "playlistOffset"    # I
    .param p2, "playlistCount"    # I

    .prologue
    .line 173
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->loadPlaylistsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 216
    :goto_0
    return-void

    .line 177
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->requestCreator:Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;

    .line 178
    invoke-interface {v0, p0, p1, p2}, Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;->createLoadRequest(Lcom/vk/music/model/PlaylistsModelImpl;II)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vk/music/model/PlaylistsModelImpl$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/vk/music/model/PlaylistsModelImpl$1;-><init>(Lcom/vk/music/model/PlaylistsModelImpl;II)V

    .line 179
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 215
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->loadPlaylistsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method


# virtual methods
.method public addPlaylist(Lcom/vk/music/dto/Playlist;)V
    .locals 6
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 245
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->followPlaylistsRequests:Ljava/util/Map;

    invoke-static {p1}, Lcom/vk/music/model/PlaylistsModelImpl;->key(Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 269
    :goto_0
    return-void

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->followPlaylistsRequests:Ljava/util/Map;

    .line 250
    invoke-static {p1}, Lcom/vk/music/model/PlaylistsModelImpl;->key(Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;

    iget v3, p1, Lcom/vk/music/dto/Playlist;->id:I

    iget v4, p1, Lcom/vk/music/dto/Playlist;->ownerId:I

    iget-object v5, p1, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5}, Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;-><init>(IILjava/lang/String;)V

    new-instance v3, Lcom/vk/music/model/PlaylistsModelImpl$2;

    invoke-direct {v3, p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$2;-><init>(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vk/music/dto/Playlist;)V

    .line 252
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 267
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 249
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public canAddPlaylist()Z
    .locals 1

    .prologue
    .line 159
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->canAddPlaylist:Z

    return v0
.end method

.method public canAddPlaylist(Lcom/vk/music/dto/Playlist;)Z
    .locals 3
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 220
    iget v2, p1, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 235
    :cond_0
    :goto_0
    return v1

    .line 225
    :cond_1
    iget-object v2, p1, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    if-nez v2, :cond_0

    .line 230
    iget-object v2, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    if-eqz v2, :cond_3

    .line 232
    iget-object v2, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iget v2, v2, Lcom/vk/music/dto/PlaylistLink;->ownerId:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-nez v2, :cond_2

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1

    :cond_3
    move v1, v0

    .line 235
    goto :goto_0
.end method

.method public canDeletePlaylist(Lcom/vk/music/dto/Playlist;)Z
    .locals 1
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 240
    iget v0, p1, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    return v0
.end method

.method public canLoadMore()Z
    .locals 1

    .prologue
    .line 149
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->canLoadMore:Z

    return v0
.end method

.method public deletePlaylist(Lcom/vk/music/dto/Playlist;)V
    .locals 5
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 273
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->deletePlaylistsRequests:Ljava/util/Map;

    invoke-static {p1}, Lcom/vk/music/model/PlaylistsModelImpl;->key(Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 297
    :goto_0
    return-void

    .line 277
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->deletePlaylistsRequests:Ljava/util/Map;

    .line 278
    invoke-static {p1}, Lcom/vk/music/model/PlaylistsModelImpl;->key(Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;

    iget v3, p1, Lcom/vk/music/dto/Playlist;->id:I

    iget v4, p1, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;-><init>(II)V

    new-instance v3, Lcom/vk/music/model/PlaylistsModelImpl$3;

    invoke-direct {v3, p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$3;-><init>(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vk/music/dto/Playlist;)V

    .line 280
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 295
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 277
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public getError()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 307
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->errorMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalPlaylist(Lcom/vk/music/dto/Playlist;)Lcom/vk/music/dto/Playlist;
    .locals 1
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 139
    invoke-virtual {p1}, Lcom/vk/music/dto/Playlist;->getOriginalPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v0

    return-object v0
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
    .line 133
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->title:Ljava/lang/String;

    return-object v0
.end method

.method public isCurrentUser()Z
    .locals 1

    .prologue
    .line 154
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->currentUser:Z

    return v0
.end method

.method public isSelect()Z
    .locals 1

    .prologue
    .line 301
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->select:Z

    return v0
.end method

.method synthetic lambda$new$1(Lcom/vk/music/event/PlaylistChanged;)V
    .locals 3
    .param p1, "event"    # Lcom/vk/music/event/PlaylistChanged;

    .prologue
    .line 56
    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    if-nez v1, :cond_1

    .line 65
    :cond_0
    :goto_0
    return-void

    .line 60
    :cond_1
    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/vk/music/event/PlaylistChanged;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 61
    .local v0, "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 62
    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/vk/music/event/PlaylistChanged;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v1, v0, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 63
    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$6;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vk/music/event/PlaylistChanged;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$new$3(Lcom/vk/music/event/PlaylistCreated;)V
    .locals 3
    .param p1, "event"    # Lcom/vk/music/event/PlaylistCreated;

    .prologue
    const/4 v2, 0x0

    .line 68
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 78
    :goto_0
    return-void

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vk/music/event/PlaylistCreated;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 73
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->canLoadMore:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->offset:I

    if-lt v0, v1, :cond_1

    .line 74
    iput-boolean v2, p0, Lcom/vk/music/model/PlaylistsModelImpl;->canLoadMore:Z

    .line 77
    :cond_1
    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$5;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vk/music/event/PlaylistCreated;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/model/PlaylistsModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$new$5(Lcom/vk/music/event/PlaylistRemoved;)V
    .locals 2
    .param p1, "event"    # Lcom/vk/music/event/PlaylistRemoved;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 88
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vk/music/event/PlaylistRemoved;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$$Lambda$4;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vk/music/event/PlaylistRemoved;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/model/PlaylistsModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$null$0(Lcom/vk/music/event/PlaylistChanged;Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 1
    .param p1, "event"    # Lcom/vk/music/event/PlaylistChanged;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistsModel$Callback;

    .prologue
    .line 63
    iget-object v0, p1, Lcom/vk/music/event/PlaylistChanged;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-interface {p2, p0, v0}, Lcom/vk/music/model/PlaylistsModel$Callback;->onPlaylistChanged(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method synthetic lambda$null$2(Lcom/vk/music/event/PlaylistCreated;Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 1
    .param p1, "event"    # Lcom/vk/music/event/PlaylistCreated;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistsModel$Callback;

    .prologue
    .line 77
    iget-object v0, p1, Lcom/vk/music/event/PlaylistCreated;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-interface {p2, p0, v0}, Lcom/vk/music/model/PlaylistsModel$Callback;->onPlaylistCreated(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method synthetic lambda$null$4(Lcom/vk/music/event/PlaylistRemoved;Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 1
    .param p1, "event"    # Lcom/vk/music/event/PlaylistRemoved;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistsModel$Callback;

    .prologue
    .line 86
    iget-object v0, p1, Lcom/vk/music/event/PlaylistRemoved;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-interface {p2, p0, v0}, Lcom/vk/music/model/PlaylistsModel$Callback;->onPlaylistRemoved(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method public loadMore()V
    .locals 2

    .prologue
    .line 169
    iget v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->offset:I

    const/16 v1, 0x14

    invoke-direct {p0, v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->load(II)V

    .line 170
    return-void
.end method

.method public loadPlaylists()V
    .locals 2

    .prologue
    .line 164
    const/4 v1, 0x0

    iget v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->offset:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->offset:I

    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/vk/music/model/PlaylistsModelImpl;->load(II)V

    .line 165
    return-void

    .line 164
    :cond_0
    const/16 v0, 0x14

    goto :goto_0
.end method

.method public release()V
    .locals 2

    .prologue
    .line 121
    const-class v0, Lcom/vk/music/event/PlaylistChanged;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->unsubscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 122
    const-class v0, Lcom/vk/music/event/PlaylistCreated;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlistCreatedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->unsubscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 123
    const-class v0, Lcom/vk/music/event/PlaylistRemoved;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlistRemovedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->unsubscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 125
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->loadPlaylistsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->loadPlaylistsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 128
    :cond_0
    return-void
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 114
    const-string/jumbo v0, "canLoadMore"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->canLoadMore:Z

    .line 115
    const-string/jumbo v0, "offset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->offset:I

    .line 116
    const-string/jumbo v0, "playlists"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    .line 117
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 105
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 106
    .local v0, "state":Landroid/os/Bundle;
    const-string/jumbo v1, "canLoadMore"

    iget-boolean v2, p0, Lcom/vk/music/model/PlaylistsModelImpl;->canLoadMore:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 107
    const-string/jumbo v1, "offset"

    iget v2, p0, Lcom/vk/music/model/PlaylistsModelImpl;->offset:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 108
    const-string/jumbo v1, "playlists"

    iget-object v2, p0, Lcom/vk/music/model/PlaylistsModelImpl;->playlists:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 109
    return-object v0
.end method

.method public bridge synthetic subscribe(Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/PlaylistsModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 27
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->subscribe(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic unsubscribe(Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/PlaylistsModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 27
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->unsubscribe(Ljava/lang/Object;)V

    return-void
.end method
