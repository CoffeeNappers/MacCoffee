.class Lcom/vk/music/model/MusicTrackModelImpl;
.super Lcom/vk/music/model/ObservableModel;
.source "MusicTrackModelImpl.java"

# interfaces
.implements Lcom/vk/music/model/MusicTrackModel;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/model/ObservableModel",
        "<",
        "Lcom/vk/music/model/MusicTrackModel$Callback;",
        ">;",
        "Lcom/vk/music/model/MusicTrackModel;"
    }
.end annotation


# instance fields
.field private addRequests:Ljava/util/Map;
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

.field private addToPlaylistRequests:Ljava/util/Map;
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

.field private boomHelper:Lcom/vk/music/utils/BoomHelper;

.field private removeFromPlaylistRequests:Ljava/util/Map;
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

.field private removeRequests:Ljava/util/Map;
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

.field private target:Lcom/vkontakte/android/audio/MusicTrack;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/vk/music/model/ObservableModel;-><init>()V

    .line 29
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->addRequests:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->addToPlaylistRequests:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->removeRequests:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->removeFromPlaylistRequests:Ljava/util/Map;

    .line 34
    new-instance v0, Lcom/vk/music/utils/BoomHelper;

    invoke-direct {v0}, Lcom/vk/music/utils/BoomHelper;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->boomHelper:Lcom/vk/music/utils/BoomHelper;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 25
    invoke-static {p0}, Lcom/vk/music/model/MusicTrackModelImpl;->key(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/music/model/MusicTrackModelImpl;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/MusicTrackModelImpl;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->removeRequests:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p1, "x1"    # Lcom/vk/music/dto/Playlist;

    .prologue
    .line 25
    invoke-static {p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl;->key(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/music/model/MusicTrackModelImpl;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/MusicTrackModelImpl;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->removeFromPlaylistRequests:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/music/model/MusicTrackModelImpl;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/MusicTrackModelImpl;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->addRequests:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/music/model/MusicTrackModelImpl;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/MusicTrackModelImpl;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->addToPlaylistRequests:Ljava/util/Map;

    return-object v0
.end method

.method private addMusic(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 6
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 160
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->addRequests:Ljava/util/Map;

    invoke-static {p1}, Lcom/vk/music/model/MusicTrackModelImpl;->key(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 179
    :goto_0
    return-void

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->addRequests:Ljava/util/Map;

    invoke-static {p1}, Lcom/vk/music/model/MusicTrackModelImpl;->key(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/api/audio/AudioAdd;

    iget v3, p1, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget v4, p1, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Lcom/vkontakte/android/api/audio/AudioAdd;-><init>(III)V

    new-instance v3, Lcom/vk/music/model/MusicTrackModelImpl$3;

    invoke-direct {v3, p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl$3;-><init>(Lcom/vk/music/model/MusicTrackModelImpl;Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 164
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioAdd;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 177
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 163
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private addMusicToPlaylist(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V
    .locals 4
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 182
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->addToPlaylistRequests:Ljava/util/Map;

    invoke-static {p1, p2}, Lcom/vk/music/model/MusicTrackModelImpl;->key(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 209
    :goto_0
    return-void

    .line 185
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->addToPlaylistRequests:Ljava/util/Map;

    invoke-static {p1, p2}, Lcom/vk/music/model/MusicTrackModelImpl;->key(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;

    invoke-direct {v2}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;-><init>()V

    iget v3, p2, Lcom/vk/music/dto/Playlist;->ownerId:I

    .line 186
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->ownerId(I)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;

    move-result-object v2

    iget v3, p2, Lcom/vk/music/dto/Playlist;->id:I

    .line 187
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->playlistId(I)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;

    move-result-object v2

    .line 188
    invoke-virtual {v2, p1}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;

    move-result-object v2

    .line 189
    invoke-virtual {v2}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->build()Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;

    move-result-object v2

    new-instance v3, Lcom/vk/music/model/MusicTrackModelImpl$4;

    invoke-direct {v3, p0, p1, p2}, Lcom/vk/music/model/MusicTrackModelImpl$4;-><init>(Lcom/vk/music/model/MusicTrackModelImpl;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 190
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 207
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 185
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private static key(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;
    .locals 1
    .param p0, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static key(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;
    .locals 2
    .param p0, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;

    .prologue
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p1, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p1, Lcom/vk/music/dto/Playlist;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private removeMusic(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 4
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->removeRequests:Ljava/util/Map;

    invoke-static {p1}, Lcom/vk/music/model/MusicTrackModelImpl;->key(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 109
    :goto_0
    return-void

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->removeRequests:Ljava/util/Map;

    invoke-static {p1}, Lcom/vk/music/model/MusicTrackModelImpl;->key(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/api/audio/AudioDelete;

    invoke-direct {v2, p1}, Lcom/vkontakte/android/api/audio/AudioDelete;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    new-instance v3, Lcom/vk/music/model/MusicTrackModelImpl$1;

    invoke-direct {v3, p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl$1;-><init>(Lcom/vk/music/model/MusicTrackModelImpl;Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 91
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 107
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 90
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private removeMusicFromPlaylist(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V
    .locals 4
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 112
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->removeFromPlaylistRequests:Ljava/util/Map;

    invoke-static {p1, p2}, Lcom/vk/music/model/MusicTrackModelImpl;->key(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    :goto_0
    return-void

    .line 116
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->removeFromPlaylistRequests:Ljava/util/Map;

    invoke-static {p1, p2}, Lcom/vk/music/model/MusicTrackModelImpl;->key(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;

    invoke-direct {v2}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;-><init>()V

    iget v3, p2, Lcom/vk/music/dto/Playlist;->ownerId:I

    .line 117
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->ownerId(I)Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;

    move-result-object v2

    iget v3, p2, Lcom/vk/music/dto/Playlist;->id:I

    .line 118
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->playlistId(I)Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;

    move-result-object v2

    .line 119
    invoke-virtual {v2, p1}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;

    move-result-object v2

    .line 120
    invoke-virtual {v2}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->build()Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;

    move-result-object v2

    new-instance v3, Lcom/vk/music/model/MusicTrackModelImpl$2;

    invoke-direct {v3, p0, p1, p2}, Lcom/vk/music/model/MusicTrackModelImpl$2;-><init>(Lcom/vk/music/model/MusicTrackModelImpl;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 121
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 134
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 116
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public addAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 64
    if-eqz p2, :cond_0

    .line 65
    invoke-direct {p0, p1, p2}, Lcom/vk/music/model/MusicTrackModelImpl;->addMusicToPlaylist(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 69
    :goto_0
    return-void

    .line 67
    :cond_0
    invoke-direct {p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl;->addMusic(Lcom/vkontakte/android/audio/MusicTrack;)V

    goto :goto_0
.end method

.method public canAddAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 1
    .param p1, "mt"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 59
    if-eqz p1, :cond_0

    iget v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canRemoveAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 1
    .param p1, "mt"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 73
    if-eqz p1, :cond_0

    iget v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public clearDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 3
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 154
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->removeSavedTrack([Ljava/lang/String;)V

    .line 155
    return-void
.end method

.method public download(Lcom/vkontakte/android/audio/MusicTrack;Landroid/content/Context;)V
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 145
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->boomHelper:Lcom/vk/music/utils/BoomHelper;

    sget-object v1, Lcom/vk/music/utils/BoomHelper$From;->menu:Lcom/vk/music/utils/BoomHelper$From;

    invoke-virtual {v0, p2, p1, v1}, Lcom/vk/music/utils/BoomHelper;->loadTrack(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/utils/BoomHelper$From;)V

    .line 150
    :goto_0
    return-void

    .line 148
    :cond_0
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/AudioFacade;->startDownloadTracks(Ljava/util/Collection;Z)V

    goto :goto_0
.end method

.method public getTarget()Lcom/vkontakte/android/audio/MusicTrack;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->target:Lcom/vkontakte/android/audio/MusicTrack;

    return-object v0
.end method

.method public isDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 1
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 140
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->isCached(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public release()V
    .locals 0

    .prologue
    .line 225
    return-void
.end method

.method public removeAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 78
    if-eqz p2, :cond_0

    .line 79
    invoke-direct {p0, p1, p2}, Lcom/vk/music/model/MusicTrackModelImpl;->removeMusicFromPlaylist(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 83
    :goto_0
    return-void

    .line 81
    :cond_0
    invoke-direct {p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl;->removeMusic(Lcom/vkontakte/android/audio/MusicTrack;)V

    goto :goto_0
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 213
    const-string/jumbo v0, "target"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    iput-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl;->target:Lcom/vkontakte/android/audio/MusicTrack;

    .line 214
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 219
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 220
    .local v0, "state":Landroid/os/Bundle;
    const-string/jumbo v1, "target"

    iget-object v2, p0, Lcom/vk/music/model/MusicTrackModelImpl;->target:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 221
    return-object v0
.end method

.method public setTarget(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p1, "target"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 48
    iput-object p1, p0, Lcom/vk/music/model/MusicTrackModelImpl;->target:Lcom/vkontakte/android/audio/MusicTrack;

    .line 49
    return-void
.end method

.method public bridge synthetic subscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/MusicTrackModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 25
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->subscribe(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic unsubscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/MusicTrackModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 25
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->unsubscribe(Ljava/lang/Object;)V

    return-void
.end method
