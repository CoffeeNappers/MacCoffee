.class Lcom/vkontakte/android/audio/player/MediaPlayerHelper;
.super Ljava/lang/Object;
.source "MediaPlayerHelper.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/MediaPlayerHelper$ProgressRunnable;,
        Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;
    }
.end annotation


# instance fields
.field private final id:I

.field private mAudioSessionId:I

.field private final mListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

.field private mPlayer:Landroid/media/MediaPlayer;

.field private mPrepared:Z

.field private mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

.field private mState:Lcom/vkontakte/android/audio/player/PlayerState;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final mWakeLock:Lcom/vkontakte/android/audio/utils/WakeLockEx;

.field private refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;


# direct methods
.method constructor <init>(Landroid/content/Context;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # I
    .param p3, "listener"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 30
    iput p2, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->id:I

    .line 31
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    .line 32
    new-instance v0, Lcom/vkontakte/android/audio/utils/WakeLockEx;

    const-class v1, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/audio/utils/WakeLockEx;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mWakeLock:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    .line 33
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->setState(Lcom/vkontakte/android/audio/player/PlayerState;)V

    .line 34
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->init()V

    .line 35
    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    return-object v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelper;
    .param p1, "x1"    # Z

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPrepared:Z

    return p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Landroid/media/MediaPlayer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->startProgressTimer()V

    return-void
.end method

.method private init()V
    .locals 3

    .prologue
    .line 174
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    if-nez v1, :cond_0

    .line 175
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    .line 176
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 177
    iget v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mAudioSessionId:I

    if-eqz v1, :cond_1

    .line 178
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    iget v2, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mAudioSessionId:I

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setAudioSessionId(I)V

    .line 182
    :goto_0
    new-instance v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;-><init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;Lcom/vkontakte/android/audio/player/MediaPlayerHelper$1;)V

    .line 183
    .local v0, "listener":Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 184
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 185
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 186
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 188
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;
    :cond_0
    return-void

    .line 180
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mAudioSessionId:I

    goto :goto_0
.end method

.method private releaseInit()V
    .locals 0

    .prologue
    .line 191
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->release()V

    .line 192
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->init()V

    .line 193
    return-void
.end method

.method private setState(Lcom/vkontakte/android/audio/player/PlayerState;)V
    .locals 2
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 66
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_0

    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mWakeLock:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->acquire()V

    .line 71
    :goto_0
    return-void

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mWakeLock:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->releaseSafety()V

    goto :goto_0
.end method

.method private startProgressTimer()V
    .locals 6

    .prologue
    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

    if-nez v0, :cond_0

    .line 197
    new-instance v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$ProgressRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$ProgressRunnable;-><init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;Lcom/vkontakte/android/audio/player/MediaPlayerHelper$1;)V

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x1f4

    invoke-static {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/audio/utils/Timer;->startNewTimer(Ljava/lang/Runnable;JJ)Lcom/vkontakte/android/audio/utils/Timer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

    .line 198
    :cond_0
    return-void
.end method

.method private stopProgressTimer()V
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/Timer;->stop()V

    .line 203
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

    .line 205
    :cond_0
    return-void
.end method


# virtual methods
.method public canPlay()Z
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x1

    return v0
.end method

.method public getAudioSessionId()I
    .locals 1

    .prologue
    .line 167
    iget v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mAudioSessionId:I

    if-nez v0, :cond_0

    .line 168
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->init()V

    .line 170
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mAudioSessionId:I

    return v0
.end method

.method public getCurrentPosition()J
    .locals 2

    .prologue
    .line 154
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPrepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    int-to-long v0, v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 149
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPrepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    int-to-long v0, v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 57
    iget v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->id:I

    return v0
.end method

.method public getRefer()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    return-object v0
.end method

.method public getState()Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    return-object v0
.end method

.method public pause()Z
    .locals 2

    .prologue
    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_1

    .line 137
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->setState(Lcom/vkontakte/android/audio/player/PlayerState;)V

    .line 138
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPrepared:Z

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 141
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->stopProgressTimer()V

    .line 142
    const/4 v0, 0x1

    .line 144
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public play(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 2
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .line 81
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->releaseInit()V

    .line 84
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p2}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->setState(Lcom/vkontakte/android/audio/player/PlayerState;)V

    .line 92
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 93
    return-void

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->stop()V

    .line 88
    throw v0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->setState(Lcom/vkontakte/android/audio/player/PlayerState;)V

    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mWakeLock:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->releaseSafety()V

    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    .line 45
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPrepared:Z

    .line 46
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->stopProgressTimer()V

    .line 47
    return-void
.end method

.method public resume()Z
    .locals 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_1

    .line 124
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->setState(Lcom/vkontakte/android/audio/player/PlayerState;)V

    .line 125
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPrepared:Z

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 127
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->startProgressTimer()V

    .line 129
    :cond_0
    const/4 v0, 0x1

    .line 131
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public rewind()Z
    .locals 1

    .prologue
    .line 102
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->seekTo(I)Z

    move-result v0

    return v0
.end method

.method public seekTo(I)Z
    .locals 1
    .param p1, "millis"    # I

    .prologue
    .line 112
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPrepared:Z

    if-eqz v0, :cond_0

    .line 113
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->stopProgressTimer()V

    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 115
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->startProgressTimer()V

    .line 116
    const/4 v0, 0x1

    .line 118
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setVolume(F)V
    .locals 1
    .param p1, "volume"    # F

    .prologue
    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 163
    :goto_0
    return-void

    .line 162
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    goto :goto_0
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->release()V

    .line 76
    return-void
.end method

.method public tryNext()Z
    .locals 1

    .prologue
    .line 107
    const/4 v0, 0x0

    return v0
.end method
