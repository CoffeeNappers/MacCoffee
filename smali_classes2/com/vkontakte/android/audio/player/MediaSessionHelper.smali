.class Lcom/vkontakte/android/audio/player/MediaSessionHelper;
.super Ljava/lang/Object;
.source "MediaSessionHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mInitialized:Z

.field private final mPlayer:Lcom/vkontakte/android/audio/player/Player;

.field private mSession:Landroid/support/v4/media/session/MediaSessionCompat;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/audio/player/Player;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mContext:Landroid/content/Context;

    .line 33
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    .line 34
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)Lcom/vkontakte/android/audio/player/Player;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    return-object v0
.end method

.method private updateMetadata(Lcom/vkontakte/android/audio/MusicTrack;Landroid/graphics/Bitmap;)V
    .locals 5
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v4, 0x0

    .line 110
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v1}, Landroid/support/v4/media/session/MediaSessionCompat;->isActive()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 111
    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v2, "PlayerService"

    aput-object v2, v1, v4

    const/4 v2, 0x1

    const-string/jumbo v3, "Player"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "updateMetadata"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string/jumbo v3, "artist"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string/jumbo v3, "title"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    iget-object v3, p1, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string/jumbo v3, "bitmap"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    aput-object p2, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 114
    new-instance v0, Landroid/support/v4/media/MediaMetadataCompat$Builder;

    invoke-direct {v0}, Landroid/support/v4/media/MediaMetadataCompat$Builder;-><init>()V

    .line 116
    .local v0, "builder":Landroid/support/v4/media/MediaMetadataCompat$Builder;
    const-string/jumbo v2, "android.media.metadata.ALBUM"

    iget-object v1, p1, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    if-nez v1, :cond_3

    const-string/jumbo v1, ""

    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 117
    const-string/jumbo v1, "android.media.metadata.ALBUM_ARTIST"

    iget-object v2, p1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 118
    const-string/jumbo v1, "android.media.metadata.ARTIST"

    iget-object v2, p1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 119
    const-string/jumbo v1, "android.media.metadata.TITLE"

    iget-object v2, p1, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 120
    const-string/jumbo v1, "android.media.metadata.DURATION"

    iget v2, p1, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putLong(Ljava/lang/String;J)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 122
    const-string/jumbo v1, "android.media.metadata.TRACK_NUMBER"

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getActualTrackIndex()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putLong(Ljava/lang/String;J)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 123
    const-string/jumbo v1, "android.media.metadata.NUM_TRACKS"

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getActualTrackListSize()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putLong(Ljava/lang/String;J)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 125
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 126
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    if-nez v1, :cond_0

    .line 127
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p2, v1, v4}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 128
    :cond_0
    const-string/jumbo v1, "android.media.metadata.ALBUM_ART"

    invoke-virtual {v0, v1, p2}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 130
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->build()Landroid/support/v4/media/MediaMetadataCompat;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/session/MediaSessionCompat;->setMetadata(Landroid/support/v4/media/MediaMetadataCompat;)V

    .line 132
    .end local v0    # "builder":Landroid/support/v4/media/MediaMetadataCompat$Builder;
    :cond_2
    return-void

    .line 116
    .restart local v0    # "builder":Landroid/support/v4/media/MediaMetadataCompat$Builder;
    :cond_3
    iget-object v1, p1, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    iget-object v1, v1, Lcom/vk/music/dto/AlbumLink;->title:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public init()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 37
    iget-boolean v3, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mInitialized:Z

    if-nez v3, :cond_0

    .line 38
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mInitialized:Z

    .line 40
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.MEDIA_BUTTON"

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mContext:Landroid/content/Context;

    const-class v5, Lcom/vkontakte/android/audio/player/MediaButtonEventReceiver;

    invoke-direct {v1, v3, v7, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 41
    .local v1, "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mContext:Landroid/content/Context;

    invoke-static {v3, v6, v1, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 42
    .local v2, "pendingIntent":Landroid/app/PendingIntent;
    new-instance v0, Landroid/content/ComponentName;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mContext:Landroid/content/Context;

    const-class v4, Lcom/vkontakte/android/audio/player/MediaButtonEventReceiver;

    invoke-direct {v0, v3, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 44
    .local v0, "componentName":Landroid/content/ComponentName;
    new-instance v3, Landroid/support/v4/media/session/MediaSessionCompat;

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mContext:Landroid/content/Context;

    const-string/jumbo v5, "VK Music"

    invoke-direct {v3, v4, v5, v0, v2}, Landroid/support/v4/media/session/MediaSessionCompat;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/ComponentName;Landroid/app/PendingIntent;)V

    iput-object v3, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 45
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    new-instance v4, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;

    invoke-direct {v4, p0, v7}, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;-><init>(Lcom/vkontakte/android/audio/player/MediaSessionHelper;Lcom/vkontakte/android/audio/player/MediaSessionHelper$1;)V

    invoke-virtual {v3, v4}, Landroid/support/v4/media/session/MediaSessionCompat;->setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;)V

    .line 46
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/support/v4/media/session/MediaSessionCompat;->setFlags(I)V

    .line 49
    .end local v0    # "componentName":Landroid/content/ComponentName;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "pendingIntent":Landroid/app/PendingIntent;
    :cond_0
    return-void
.end method

.method synthetic lambda$update$0(Lcom/vkontakte/android/audio/player/PlayerTrack;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "playerTrack"    # Lcom/vkontakte/android/audio/player/PlayerTrack;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 100
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->updateMetadata(Lcom/vkontakte/android/audio/MusicTrack;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method synthetic lambda$update$1(Lcom/vkontakte/android/audio/player/PlayerTrack;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "playerTrack"    # Lcom/vkontakte/android/audio/player/PlayerTrack;
    .param p2, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 101
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->updateMetadata(Lcom/vkontakte/android/audio/MusicTrack;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 52
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mInitialized:Z

    if-eqz v0, :cond_0

    .line 53
    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mInitialized:Z

    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0, v1}, Landroid/support/v4/media/session/MediaSessionCompat;->setActive(Z)V

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaSessionCompat;->release()V

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 59
    :cond_0
    return-void
.end method

.method public update()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/high16 v8, 0x3f800000    # 1.0f

    .line 62
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v2

    .line 63
    .local v2, "state":Lcom/vkontakte/android/audio/player/PlayerState;
    sget-object v5, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v2, v5, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->release()V

    .line 107
    :goto_0
    return-void

    .line 66
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->init()V

    .line 68
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/Player;->getTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v3

    .line 70
    .local v3, "trackInfo":Lcom/vkontakte/android/audio/player/TrackInfo;
    new-instance v0, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    invoke-direct {v0}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;-><init>()V

    .line 71
    .local v0, "builder":Landroid/support/v4/media/session/PlaybackStateCompat$Builder;
    const-wide/16 v6, 0x23f

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setActions(J)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 78
    sget-object v5, Lcom/vkontakte/android/audio/player/MediaSessionHelper$1;->$SwitchMap$com$vkontakte$android$audio$player$PlayerState:[I

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/PlayerState;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 89
    :goto_1
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->build()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/support/v4/media/session/MediaSessionCompat;->setPlaybackState(Landroid/support/v4/media/session/PlaybackStateCompat;)V

    .line 91
    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    .line 92
    .local v1, "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v1, :cond_1

    .line 93
    invoke-static {}, Lcom/vkontakte/android/audio/utils/Utils;->getMaxCoverSize()I

    move-result v5

    invoke-virtual {v1, v5}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getThumbUrl(I)Ljava/lang/String;

    move-result-object v4

    .line 94
    .local v4, "url":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 95
    const/4 v5, 0x0

    invoke-direct {p0, v1, v5}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->updateMetadata(Lcom/vkontakte/android/audio/MusicTrack;Landroid/graphics/Bitmap;)V

    .line 105
    .end local v4    # "url":Ljava/lang/String;
    :cond_1
    :goto_2
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->mSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v5, v9}, Landroid/support/v4/media/session/MediaSessionCompat;->setActive(Z)V

    goto :goto_0

    .line 80
    .end local v1    # "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :pswitch_0
    const-wide/16 v6, 0x0

    invoke-virtual {v0, v9, v6, v7, v8}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJF)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    goto :goto_1

    .line 83
    :pswitch_1
    const/4 v5, 0x2

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPosition()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v0, v5, v6, v7, v8}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJF)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    goto :goto_1

    .line 86
    :pswitch_2
    const/4 v5, 0x3

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPosition()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v0, v5, v6, v7, v8}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJF)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    goto :goto_1

    .line 97
    .restart local v1    # "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .restart local v4    # "url":Ljava/lang/String;
    :cond_2
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v5

    .line 98
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v6

    invoke-virtual {v5, v6}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v5

    .line 99
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v6

    invoke-virtual {v5, v6}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v5

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/player/MediaSessionHelper$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/audio/player/MediaSessionHelper;Lcom/vkontakte/android/audio/player/PlayerTrack;)Lio/reactivex/functions/Consumer;

    move-result-object v6

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/player/MediaSessionHelper$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/audio/player/MediaSessionHelper;Lcom/vkontakte/android/audio/player/PlayerTrack;)Lio/reactivex/functions/Consumer;

    move-result-object v7

    .line 100
    invoke-virtual {v5, v6, v7}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    goto :goto_2

    .line 78
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
