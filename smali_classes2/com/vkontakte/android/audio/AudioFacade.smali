.class public final Lcom/vkontakte/android/audio/AudioFacade;
.super Lcom/vkontakte/android/audio/player/PlayerIntents;
.source "AudioFacade.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/AudioFacade$StorageType;,
        Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;
    }
.end annotation


# static fields
.field public static final ACTION_ADD_TO_PLAYLIST:Ljava/lang/String;

.field public static final ACTION_PLAY_NEXT:Ljava/lang/String;

.field public static final ACTION_SHOW_PLAYER:Ljava/lang/String;

.field public static final ACTION_USER_AUDIO_ADDED:Ljava/lang/String;

.field public static final ACTION_USER_AUDIO_REMOVED:Ljava/lang/String;

.field public static final EXTRA_MID:Ljava/lang/String;

.field public static final EXTRA_MUSIC_FILES:Ljava/lang/String;

.field private static connectionHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;",
            "Lcom/vkontakte/android/audio/player/PlayerConnection;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 46
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "USER_AUDIO_CHANGED"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_USER_AUDIO_ADDED:Ljava/lang/String;

    .line 47
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "USER_AUDIO_CHANGED"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_USER_AUDIO_REMOVED:Ljava/lang/String;

    .line 48
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "SHOW_PLAYER"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_SHOW_PLAYER:Ljava/lang/String;

    .line 49
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "PLAY_NEXT"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_PLAY_NEXT:Ljava/lang/String;

    .line 50
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "ADD_TO_PLAYLIST"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_ADD_TO_PLAYLIST:Ljava/lang/String;

    .line 52
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "MID"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatExtra(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade;->EXTRA_MID:Ljava/lang/String;

    .line 53
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "MUSIC_FILES"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatExtra(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade;->EXTRA_MUSIC_FILES:Ljava/lang/String;

    .line 65
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade;->connectionHashMap:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerIntents;-><init>()V

    .line 57
    return-void
.end method

.method public static addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V
    .locals 1
    .param p0, "listener"    # Lcom/vkontakte/android/audio/player/PlayerListener;
    .param p1, "forceLastState"    # Z

    .prologue
    .line 89
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0, p0, p1}, Lcom/vkontakte/android/audio/AudioStateListener;->addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V

    .line 90
    return-void
.end method

.method public static addSavedTracksListener(Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;Z)V
    .locals 1
    .param p0, "listener"    # Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    .param p1, "forceLastState"    # Z

    .prologue
    .line 97
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0, p0, p1}, Lcom/vkontakte/android/audio/AudioStateListener;->addSavedTracksListener(Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;Z)V

    .line 98
    return-void
.end method

.method public static addToPlayNext(Landroid/content/Context;Ljava/util/Collection;)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 277
    .local p1, "f":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_PLAY_NEXT:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/AudioFacade;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 278
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->EXTRA_MUSIC_FILES:Ljava/lang/String;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 279
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 280
    return-void
.end method

.method public static addToPlaylist(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 283
    .local p1, "f":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_ADD_TO_PLAYLIST:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/AudioFacade;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 284
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->EXTRA_MUSIC_FILES:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 285
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 286
    return-void
.end method

.method public static bind(Landroid/content/Context;Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "o"    # Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 68
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerConnection;

    new-instance v1, Lcom/vkontakte/android/audio/AudioFacade$1;

    invoke-direct {v1, p1}, Lcom/vkontakte/android/audio/AudioFacade$1;-><init>(Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;)V

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/PlayerConnection;-><init>(Lcom/vkontakte/android/audio/player/PlayerConnectionListener;)V

    .line 74
    .local v0, "connection":Lcom/vkontakte/android/audio/player/PlayerConnection;
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/player/PlayerConnection;->connect(Landroid/content/Context;)V

    .line 75
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->connectionHashMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    return-void
.end method

.method public static canEnqueue(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 3
    .param p0, "f"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 267
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getActualTrackList()Ljava/util/List;

    move-result-object v1

    .line 268
    .local v1, "playerTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 269
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-virtual {v2, p0}, Lcom/vkontakte/android/audio/player/PlayerTrack;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 270
    const/4 v2, 0x0

    .line 273
    :goto_1
    return v2

    .line 268
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 273
    :cond_1
    const/4 v2, 0x1

    goto :goto_1
.end method

.method public static deleteAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 7
    .param p0, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    const/4 v5, 0x1

    .line 570
    const/4 v2, 0x0

    .line 571
    .local v2, "ret":Z
    sget-object v4, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v4}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 572
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v0, :cond_2

    .line 573
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->getTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    .line 574
    .local v1, "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    invoke-static {p0, v1}, Lcom/vkontakte/android/utils/Utils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 575
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->getTrackCount()I

    move-result v4

    if-ne v4, v5, :cond_3

    .line 576
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->stop()V

    .line 577
    const/4 v2, 0x1

    .line 582
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/audio/AudioFacade;->sendUserAudioRemoved(Ljava/lang/String;)V

    .line 584
    sget-object v4, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v4}, Lcom/vkontakte/android/audio/AudioStateListener;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v3

    .line 585
    .local v3, "savedTracks":Lcom/vkontakte/android/audio/player/SavedTracks;
    if-eqz v3, :cond_1

    .line 586
    new-array v4, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/audio/player/SavedTracks;->removeTracks([Ljava/lang/String;)V

    .line 589
    :cond_1
    iget v4, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget v5, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-virtual {v0, v4, v5}, Lcom/vkontakte/android/audio/player/Player;->removeTrack(II)V

    .line 591
    .end local v1    # "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v3    # "savedTracks":Lcom/vkontakte/android/audio/player/SavedTracks;
    :cond_2
    return v2

    .line 579
    .restart local v1    # "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_3
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->playNext()Z

    goto :goto_0
.end method

.method public static enqueue(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 2
    .param p0, "f"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 257
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 258
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->canEnqueue(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 259
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/player/Player;->addTrack(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 260
    const/4 v1, 0x1

    .line 262
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getActualTrackIndex()I
    .locals 2

    .prologue
    .line 202
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 203
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->getActualTrackIndex()I

    move-result v1

    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public static getActualTrackList()Ljava/util/List;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 192
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 193
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->getActualTrackList()Ljava/util/List;

    move-result-object v1

    goto :goto_0
.end method

.method public static getActualTrackListSize()I
    .locals 2

    .prologue
    .line 197
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 198
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->getActualTrackListSize()I

    move-result v1

    goto :goto_0
.end method

.method public static getBroadcastTargets()Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 411
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 412
    .local v1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string/jumbo v6, "audio_broadcast"

    const-string/jumbo v7, ""

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 413
    .local v2, "s":Ljava/lang/String;
    const-string/jumbo v5, ","

    invoke-virtual {v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 414
    .local v3, "ss":[Ljava/lang/String;
    array-length v5, v3

    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v0, v3, v4

    .line 416
    .local v0, "id":Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 414
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 421
    .end local v0    # "id":Ljava/lang/String;
    :cond_0
    return-object v1

    .line 417
    .restart local v0    # "id":Ljava/lang/String;
    :catch_0
    move-exception v6

    goto :goto_1
.end method

.method public static getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 229
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 230
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->getTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getCurrentTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 235
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 236
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->getTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 8
    .param p0, "mid"    # Ljava/lang/String;
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 547
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    move-object v4, v5

    .line 561
    :goto_0
    return-object v4

    .line 550
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string/jumbo v6, "audioCacheLocation"

    const-string/jumbo v7, ""

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 551
    .local v2, "path":Ljava/lang/String;
    invoke-static {v2}, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->parseFromPreferences(Ljava/lang/String;)Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    move-result-object v3

    .line 552
    .local v3, "storageType":Lcom/vkontakte/android/audio/AudioFacade$StorageType;
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->getFileMap()Ljava/util/Map;

    move-result-object v1

    .line 554
    .local v1, "fileMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/vkontakte/android/audio/AudioFacade$StorageType;Ljava/io/File;>;"
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 555
    .local v0, "dir":Ljava/io/File;
    if-nez v0, :cond_1

    sget-object v4, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->internal:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    move-object v0, v4

    .line 556
    :cond_1
    if-nez v0, :cond_2

    sget-object v4, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->sdCard:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    move-object v0, v4

    .line 558
    :cond_2
    if-nez v0, :cond_3

    move-object v4, v5

    .line 559
    goto :goto_0

    .line 561
    :cond_3
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->stringToFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;
    .locals 1

    .prologue
    .line 322
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/Prefs;->loopMode:Lcom/vk/core/util/Preference$PreferenceEnum;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceEnum;->get()Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/LoopMode;

    return-object v0
.end method

.method public static getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 303
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    return-object v0
.end method

.method public static getSavedTracks()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/SavedTrack;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 164
    sget-object v5, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/AudioStateListener;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v4

    .line 165
    .local v4, "savedTracks":Lcom/vkontakte/android/audio/player/SavedTracks;
    if-eqz v4, :cond_0

    .line 166
    invoke-virtual {v4}, Lcom/vkontakte/android/audio/player/SavedTracks;->getTracks()Ljava/util/List;

    move-result-object v5

    .line 184
    :goto_0
    return-object v5

    .line 168
    :cond_0
    new-array v3, v7, [Ljava/util/List;

    .line 169
    .local v3, "retListRef":[Ljava/util/List;, "[Ljava/util/List<Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    new-array v2, v7, [Lcom/vkontakte/android/audio/player/PlayerConnection;

    .line 171
    .local v2, "reference":[Lcom/vkontakte/android/audio/player/PlayerConnection;
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerConnection;

    new-instance v1, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;

    new-instance v5, Lcom/vkontakte/android/audio/AudioFacade$3;

    invoke-direct {v5, v2, v3}, Lcom/vkontakte/android/audio/AudioFacade$3;-><init>([Lcom/vkontakte/android/audio/player/PlayerConnection;[Ljava/util/List;)V

    invoke-direct {v1, v5}, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;-><init>(Lcom/vkontakte/android/audio/player/PlayerConnectionListener;)V

    .local v1, "listener":Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;
    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/PlayerConnection;-><init>(Lcom/vkontakte/android/audio/player/PlayerConnectionListener;)V

    .line 181
    .local v0, "connection":Lcom/vkontakte/android/audio/player/PlayerConnection;
    aput-object v0, v2, v6

    .line 182
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/audio/player/PlayerConnection;->connect(Landroid/content/Context;)V

    .line 183
    invoke-static {v1}, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil;->waitListenerFinished(Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;)V

    .line 184
    aget-object v5, v3, v6

    goto :goto_0
.end method

.method public static getShowPlayerIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 291
    sget-object v0, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_SHOW_PLAYER:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/AudioFacade;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getTrackDownloadFile(II)Ljava/io/File;
    .locals 1
    .param p0, "oid"    # I
    .param p1, "aid"    # I

    .prologue
    .line 539
    invoke-static {p0, p1}, Lcom/vkontakte/android/audio/MusicTrack;->generateMid(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->getTrackDownloadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getTrackDownloadFile(Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "mid"    # Ljava/lang/String;

    .prologue
    .line 543
    const-string/jumbo v0, "encoded"

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/AudioFacade;->getFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getTrackTmpFile(Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .param p0, "mid"    # Ljava/lang/String;

    .prologue
    .line 529
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/CacheUtils;->getCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 530
    .local v0, "cacheDir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->stringToFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 531
    .local v1, "file":Ljava/io/File;
    if-eqz p0, :cond_0

    const-string/jumbo v2, "null"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 533
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 535
    :cond_1
    return-object v1
.end method

.method public static isAudioCacheEnable()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 595
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v1

    if-nez v1, :cond_0

    .line 596
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "enableAudioCache"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isBroadcast()Z
    .locals 1

    .prologue
    .line 425
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getBroadcastTargets()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isCached(Ljava/lang/String;)Z
    .locals 2
    .param p0, "mid"    # Ljava/lang/String;

    .prologue
    .line 131
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v0

    .line 132
    .local v0, "savedTracks":Lcom/vkontakte/android/audio/player/SavedTracks;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->isDownloaded(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isCurrentTrack(II)Z
    .locals 2
    .param p0, "ownerId"    # I
    .param p1, "audioId"    # I

    .prologue
    .line 240
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 241
    .local v0, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v0, :cond_0

    iget v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    if-ne v1, p0, :cond_0

    iget v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    if-ne v1, p1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isDownloading(Ljava/lang/String;)Z
    .locals 2
    .param p0, "mid"    # Ljava/lang/String;

    .prologue
    .line 136
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v0

    .line 137
    .local v0, "savedTracks":Lcom/vkontakte/android/audio/player/SavedTracks;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->isDownloading(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isShuffle()Z
    .locals 1

    .prologue
    .line 326
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/Prefs;->shuffle:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceBoolean;->get()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static move(Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/ProgressCallback;)V
    .locals 15
    .param p0, "from"    # Lcom/vkontakte/android/audio/AudioFacade$StorageType;
    .param p1, "to"    # Lcom/vkontakte/android/audio/AudioFacade$StorageType;
    .param p2, "pc"    # Lcom/vkontakte/android/ProgressCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 479
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->getFileMap()Ljava/util/Map;

    move-result-object v5

    .line 481
    .local v5, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/vkontakte/android/audio/AudioFacade$StorageType;Ljava/io/File;>;"
    invoke-interface {v5, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    .line 482
    .local v3, "fromDir":Ljava/io/File;
    move-object/from16 v0, p1

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/io/File;

    .line 484
    .local v10, "toDir":Ljava/io/File;
    if-eqz p0, :cond_0

    if-nez v10, :cond_1

    .line 485
    :cond_0
    invoke-interface/range {p2 .. p2}, Lcom/vkontakte/android/ProgressCallback;->onFinished()V

    .line 524
    :goto_0
    return-void

    .line 489
    :cond_1
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x13

    if-lt v11, v12, :cond_2

    .line 490
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/content/Context;->getExternalFilesDirs(Ljava/lang/String;)[Ljava/io/File;

    .line 492
    :cond_2
    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    .line 493
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v9

    .line 494
    .local v9, "srcList":[Ljava/io/File;
    if-nez v9, :cond_3

    .line 495
    invoke-interface/range {p2 .. p2}, Lcom/vkontakte/android/ProgressCallback;->onFinished()V

    goto :goto_0

    .line 498
    :cond_3
    array-length v11, v9

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Lcom/vkontakte/android/ProgressCallback;->onSetMaxValue(I)V

    .line 500
    sget-object v11, Lcom/vkontakte/android/audio/player/SavedTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

    invoke-virtual {v11}, Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;->loadTracks()Ljava/util/ArrayList;

    move-result-object v8

    .line 501
    .local v8, "savedTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 502
    .local v7, "savedTrackMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/io/File;Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 503
    .local v6, "savedTrack":Lcom/vkontakte/android/audio/player/SavedTrack;
    iget-object v12, v6, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    invoke-interface {v7, v12, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 506
    .end local v6    # "savedTrack":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_4
    const/4 v4, 0x0

    .line 507
    .local v4, "i":I
    array-length v12, v9

    const/4 v11, 0x0

    :goto_2
    if-ge v11, v12, :cond_7

    aget-object v2, v9, v11

    .line 508
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    const-string/jumbo v14, ".encoded"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_5

    .line 507
    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 511
    :cond_5
    new-instance v1, Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v1, v10, v13}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 513
    .local v1, "df":Ljava/io/File;
    const/4 v13, 0x0

    invoke-static {v2, v1, v13}, Lcom/vkontakte/android/audio/utils/Utils;->replaceFile(Ljava/io/File;Ljava/io/File;Z)V

    .line 515
    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 516
    .restart local v6    # "savedTrack":Lcom/vkontakte/android/audio/player/SavedTrack;
    if-eqz v6, :cond_6

    .line 517
    iput-object v1, v6, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    .line 518
    invoke-virtual {v6}, Lcom/vkontakte/android/audio/player/SavedTrack;->save()Z

    .line 521
    :cond_6
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/vkontakte/android/ProgressCallback;->onProgressUpdated(I)V

    goto :goto_3

    .line 523
    .end local v1    # "df":Ljava/io/File;
    .end local v2    # "f":Ljava/io/File;
    .end local v6    # "savedTrack":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_7
    invoke-interface/range {p2 .. p2}, Lcom/vkontakte/android/ProgressCallback;->onFinished()V

    goto :goto_0
.end method

.method public static pauseBySystem()V
    .locals 2

    .prologue
    .line 315
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_0

    .line 316
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/Prefs;->pausedBySystem:Lcom/vk/core/util/Preference$PreferenceBoolean;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V

    .line 317
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->pause()V

    .line 319
    :cond_0
    return-void
.end method

.method public static playTrack(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vkontakte/android/audio/player/PlayerRefer;Z)V
    .locals 2
    .param p0, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/PlayerRefer;
    .param p2, "isIgnoreShuffle"    # Z

    .prologue
    .line 330
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 331
    .local v0, "musicTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 332
    const/4 v1, 0x0

    invoke-static {v0, v1, p1, p2}, Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    .line 333
    return-void
.end method

.method public static playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;Z)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "refer"    # Lcom/vkontakte/android/audio/player/PlayerRefer;
    .param p3, "isIgnoreShuffle"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;I",
            "Lcom/vkontakte/android/audio/player/PlayerRefer;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 340
    .local p0, "musicTracks":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;ZZ)V

    .line 341
    return-void
.end method

.method private static playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;ZZ)V
    .locals 9
    .param p1, "index"    # I
    .param p2, "refer"    # Lcom/vkontakte/android/audio/player/PlayerRefer;
    .param p3, "isIgnoreShuffle"    # Z
    .param p4, "shuffle"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;I",
            "Lcom/vkontakte/android/audio/player/PlayerRefer;",
            "ZZ)V"
        }
    .end annotation

    .prologue
    .local p0, "musicTracks":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v8, 0x0

    .line 344
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v7

    .line 345
    .local v7, "prefs":Lcom/vkontakte/android/audio/player/Prefs;
    if-eqz p3, :cond_1

    .line 346
    iget-object v0, v7, Lcom/vkontakte/android/audio/player/Prefs;->shuffle:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V

    .line 350
    :goto_0
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 351
    const/4 v0, 0x1

    new-array v1, v0, [Lcom/vkontakte/android/audio/player/PlayerConnection;

    .line 352
    .local v1, "reference":[Lcom/vkontakte/android/audio/player/PlayerConnection;
    new-instance v6, Lcom/vkontakte/android/audio/player/PlayerConnection;

    new-instance v0, Lcom/vkontakte/android/audio/AudioFacade$4;

    move v2, p4

    move-object v3, p0

    move-object v4, p2

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/audio/AudioFacade$4;-><init>([Lcom/vkontakte/android/audio/player/PlayerConnection;ZLjava/util/Collection;Lcom/vkontakte/android/audio/player/PlayerRefer;I)V

    invoke-direct {v6, v0}, Lcom/vkontakte/android/audio/player/PlayerConnection;-><init>(Lcom/vkontakte/android/audio/player/PlayerConnectionListener;)V

    .line 366
    .local v6, "connection":Lcom/vkontakte/android/audio/player/PlayerConnection;
    aput-object v6, v1, v8

    .line 367
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/vkontakte/android/audio/player/PlayerConnection;->connect(Landroid/content/Context;)V

    .line 369
    .end local v1    # "reference":[Lcom/vkontakte/android/audio/player/PlayerConnection;
    .end local v6    # "connection":Lcom/vkontakte/android/audio/player/PlayerConnection;
    :cond_0
    return-void

    .line 348
    :cond_1
    iget-object v0, v7, Lcom/vkontakte/android/audio/player/Prefs;->shuffle:Lcom/vk/core/util/Preference$PreferenceBoolean;

    iget-object v2, v7, Lcom/vkontakte/android/audio/player/Prefs;->shuffleGlobal:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v2}, Lcom/vk/core/util/Preference$PreferenceBoolean;->get()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V

    goto :goto_0
.end method

.method public static playTracksShuffle(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "refer"    # Lcom/vkontakte/android/audio/player/PlayerRefer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;I",
            "Lcom/vkontakte/android/audio/player/PlayerRefer;",
            ")V"
        }
    .end annotation

    .prologue
    .line 336
    .local p0, "musicTracks":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, p2, v0, v1}, Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;ZZ)V

    .line 337
    return-void
.end method

.method public static removeCachedFile(Ljava/lang/String;)V
    .locals 3
    .param p0, "mid"    # Ljava/lang/String;

    .prologue
    .line 157
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v0

    .line 158
    .local v0, "savedTracks":Lcom/vkontakte/android/audio/player/SavedTracks;
    if-eqz v0, :cond_0

    .line 159
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/SavedTracks;->removeTracks([Ljava/lang/String;)V

    .line 161
    :cond_0
    return-void
.end method

.method public static removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/vkontakte/android/audio/player/PlayerListener;

    .prologue
    .line 93
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/AudioStateListener;->removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 94
    return-void
.end method

.method public static removePlaylistItem(II)V
    .locals 2
    .param p0, "oid"    # I
    .param p1, "aid"    # I

    .prologue
    .line 221
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 222
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v0, :cond_0

    .line 223
    invoke-virtual {v0, p0, p1}, Lcom/vkontakte/android/audio/player/Player;->removeTrack(II)V

    .line 225
    :cond_0
    return-void
.end method

.method public static removePlaylistItem(Ljava/lang/String;)V
    .locals 2
    .param p0, "uuid"    # Ljava/lang/String;

    .prologue
    .line 214
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 215
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v0, :cond_0

    .line 216
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/player/Player;->removeTrack(Ljava/lang/String;)V

    .line 218
    :cond_0
    return-void
.end method

.method public static removeSavedTracksListener(Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .prologue
    .line 101
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/AudioStateListener;->removeSavedTracksListener(Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;)V

    .line 102
    return-void
.end method

.method public static resumeIfPausedBySystem()V
    .locals 3

    .prologue
    .line 307
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v0

    .line 308
    .local v0, "prefs":Lcom/vkontakte/android/audio/player/Prefs;
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v1, v2, :cond_0

    iget-object v1, v0, Lcom/vkontakte/android/audio/player/Prefs;->pausedBySystem:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v1}, Lcom/vk/core/util/Preference$PreferenceBoolean;->get()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 309
    iget-object v1, v0, Lcom/vkontakte/android/audio/player/Prefs;->pausedBySystem:Lcom/vk/core/util/Preference$PreferenceBoolean;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V

    .line 310
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->resume()V

    .line 312
    :cond_0
    return-void
.end method

.method static saveTrackIfAutoSaveEnable(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p0, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 439
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->oid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->isAudioCacheEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 440
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/AudioFacade;->startDownloadTracks(Lcom/vkontakte/android/audio/MusicTrack;Z)V

    .line 442
    :cond_0
    return-void
.end method

.method public static seekTo(I)V
    .locals 3
    .param p0, "percentProgress"    # I

    .prologue
    .line 247
    sget-object v2, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v1

    .line 248
    .local v1, "player":Lcom/vkontakte/android/audio/player/Player;
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 249
    .local v0, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 250
    iget v2, v0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    mul-int/lit8 v2, v2, 0xa

    mul-int/2addr v2, p0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/audio/player/Player;->seekTo(I)V

    .line 252
    :cond_0
    return-void
.end method

.method public static sendUserAudioAdded(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 3
    .param p0, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 429
    new-instance v1, Landroid/content/Intent;

    sget-object v2, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_USER_AUDIO_ADDED:Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/vkontakte/android/audio/AudioFacade;->EXTRA_MUSIC_FILES:Ljava/lang/String;

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v0

    .line 430
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 431
    return-void
.end method

.method private static sendUserAudioRemoved(Ljava/lang/String;)V
    .locals 3
    .param p0, "mid"    # Ljava/lang/String;

    .prologue
    .line 434
    new-instance v1, Landroid/content/Intent;

    sget-object v2, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_USER_AUDIO_REMOVED:Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/vkontakte/android/audio/AudioFacade;->EXTRA_MID:Ljava/lang/String;

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 435
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 436
    return-void
.end method

.method public static setBroadcast(Ljava/util/ArrayList;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p0, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 374
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 375
    .local v0, "currentFile":Lcom/vkontakte/android/audio/MusicTrack;
    if-nez v0, :cond_1

    .line 399
    :cond_0
    :goto_0
    return-void

    .line 378
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getBroadcastTargets()Ljava/util/ArrayList;

    move-result-object v4

    .line 379
    .local v4, "prev":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .local v2, "enable":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 380
    .local v1, "disable":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 381
    .local v3, "id":I
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 382
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 385
    .end local v3    # "id":I
    :cond_3
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_4
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 386
    .restart local v3    # "id":I
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 387
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 390
    .end local v3    # "id":I
    :cond_5
    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const-string/jumbo v6, "vk"

    aput-object v6, v5, v8

    const/4 v6, 0x1

    const-string/jumbo v7, "Set broadcast: enable="

    aput-object v7, v5, v6

    const/4 v6, 0x2

    aput-object v2, v5, v6

    const/4 v6, 0x3

    const-string/jumbo v7, ", disable="

    aput-object v7, v5, v6

    const/4 v6, 0x4

    aput-object v1, v5, v6

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->i([Ljava/lang/Object;)V

    .line 391
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v9, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string/jumbo v6, "audio_broadcast"

    const-string/jumbo v7, ","

    .line 392
    invoke-static {v7, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 393
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_6

    .line 394
    new-instance v5, Lcom/vkontakte/android/api/audio/AudioSetBroadcast;

    invoke-direct {v5, v0, v2}, Lcom/vkontakte/android/api/audio/AudioSetBroadcast;-><init>(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/ArrayList;)V

    invoke-virtual {v5}, Lcom/vkontakte/android/api/audio/AudioSetBroadcast;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 396
    :cond_6
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_0

    .line 397
    new-instance v5, Lcom/vkontakte/android/api/audio/AudioSetBroadcast;

    invoke-direct {v5, v9, v1}, Lcom/vkontakte/android/api/audio/AudioSetBroadcast;-><init>(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/ArrayList;)V

    invoke-virtual {v5}, Lcom/vkontakte/android/api/audio/AudioSetBroadcast;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0
.end method

.method public static showPlayer()V
    .locals 2

    .prologue
    .line 295
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 296
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->getShowPlayerIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 297
    return-void
.end method

.method public static startDownloadTracks(Ljava/util/Collection;Z)V
    .locals 4
    .param p1, "showNotification"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "tracks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 128
    :cond_0
    :goto_0
    return-void

    .line 110
    :cond_1
    sget-object v3, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/AudioStateListener;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v2

    .line 111
    .local v2, "savedTracks":Lcom/vkontakte/android/audio/player/SavedTracks;
    if-eqz v2, :cond_2

    .line 112
    invoke-virtual {v2, p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->downloadTracks(Ljava/util/Collection;Z)V

    goto :goto_0

    .line 114
    :cond_2
    const/4 v3, 0x1

    new-array v1, v3, [Lcom/vkontakte/android/audio/player/PlayerConnection;

    .line 115
    .local v1, "reference":[Lcom/vkontakte/android/audio/player/PlayerConnection;
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerConnection;

    new-instance v3, Lcom/vkontakte/android/audio/AudioFacade$2;

    invoke-direct {v3, v1, p0, p1}, Lcom/vkontakte/android/audio/AudioFacade$2;-><init>([Lcom/vkontakte/android/audio/player/PlayerConnection;Ljava/util/Collection;Z)V

    invoke-direct {v0, v3}, Lcom/vkontakte/android/audio/player/PlayerConnection;-><init>(Lcom/vkontakte/android/audio/player/PlayerConnectionListener;)V

    .line 125
    .local v0, "connection":Lcom/vkontakte/android/audio/player/PlayerConnection;
    const/4 v3, 0x0

    aput-object v0, v1, v3

    .line 126
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/audio/player/PlayerConnection;->connect(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public static swapPlaylistTracks(Lcom/vkontakte/android/audio/player/PlayerTrack;Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 3
    .param p0, "track1"    # Lcom/vkontakte/android/audio/player/PlayerTrack;
    .param p1, "track2"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    .line 207
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 208
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v0, :cond_0

    .line 209
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    iget-object v2, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/player/Player;->swap(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    :cond_0
    return-void
.end method

.method public static toggleCurrentCachedState()Z
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 141
    sget-object v5, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/AudioStateListener;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v1

    .line 142
    .local v1, "savedTracks":Lcom/vkontakte/android/audio/player/SavedTracks;
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v2

    .line 143
    .local v2, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v1, :cond_1

    if-eqz v2, :cond_1

    .line 144
    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/vkontakte/android/audio/player/SavedTracks;->getDownloadState(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    move-result-object v0

    .line 145
    .local v0, "downloadState":Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;
    sget-object v5, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->NONE:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    if-ne v0, v5, :cond_0

    .line 146
    invoke-virtual {v1, v2, v4}, Lcom/vkontakte/android/audio/player/SavedTracks;->downloadTrack(Lcom/vkontakte/android/audio/MusicTrack;Z)V

    .line 152
    .end local v0    # "downloadState":Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;
    :goto_0
    return v3

    .line 148
    .restart local v0    # "downloadState":Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;
    :cond_0
    new-array v5, v3, [Ljava/lang/String;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v4

    invoke-virtual {v1, v5}, Lcom/vkontakte/android/audio/player/SavedTracks;->removeTracks([Ljava/lang/String;)V

    goto :goto_0

    .end local v0    # "downloadState":Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;
    :cond_1
    move v3, v4

    .line 152
    goto :goto_0
.end method

.method public static unbind(Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;)V
    .locals 2
    .param p0, "o"    # Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;

    .prologue
    .line 79
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->connectionHashMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerConnection;

    .line 80
    .local v0, "connection":Lcom/vkontakte/android/audio/player/PlayerConnection;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/PlayerConnection;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 81
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/PlayerConnection;->disconnect()V

    .line 83
    :cond_0
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->connectionHashMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    return-void
.end method

.method static updateBroadcast()V
    .locals 3

    .prologue
    .line 402
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getBroadcastTargets()Ljava/util/ArrayList;

    move-result-object v1

    .line 403
    .local v1, "t":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 404
    .local v0, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eqz v2, :cond_0

    if-nez v0, :cond_1

    .line 408
    :cond_0
    :goto_0
    return-void

    .line 407
    :cond_1
    new-instance v2, Lcom/vkontakte/android/api/audio/AudioSetBroadcast;

    invoke-direct {v2, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSetBroadcast;-><init>(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/ArrayList;)V

    invoke-virtual {v2}, Lcom/vkontakte/android/api/audio/AudioSetBroadcast;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method
