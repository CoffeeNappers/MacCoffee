.class public Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;
.super Ljava/lang/Object;
.source "AdPlayerHelper.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
.implements Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;
.implements Lcom/vkontakte/android/audio/player/ads/AudioAd$OnStateChangedListener;


# instance fields
.field private audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

.field private final ctx:Landroid/content/Context;

.field private final idAd:I

.field private final idContent:I

.field private mState:Lcom/vkontakte/android/audio/player/PlayerState;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

.field private playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

.field private final type:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;Landroid/content/Context;IILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;)V
    .locals 1
    .param p1, "type"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "idContent"    # I
    .param p4, "idAd"    # I
    .param p5, "listener"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 40
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->type:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    .line 41
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->ctx:Landroid/content/Context;

    .line 42
    iput p3, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->idContent:I

    .line 43
    iput p4, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->idAd:I

    .line 44
    iput-object p5, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    .line 46
    invoke-static {p1, p2, p3, p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Factory;->get(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;Landroid/content/Context;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    .line 47
    return-void
.end method


# virtual methods
.method public canPlay()Z
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isAllowTrackChange()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAdText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->getAdText()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getAudioSessionId()I
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->getAudioSessionId()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getAudioSessionId()I

    move-result v0

    goto :goto_0
.end method

.method public getCurrentPosition()J
    .locals 2

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 177
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    .line 179
    :goto_0
    return-wide v0

    .line 177
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->getCurrentPosition()J

    move-result-wide v0

    goto :goto_0

    .line 179
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getCurrentPosition()J

    move-result-wide v0

    goto :goto_0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->getCurrentDuration()F

    move-result v0

    float-to-long v0, v0

    .line 170
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getDuration()J

    move-result-wide v0

    goto :goto_0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->idAd:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->idContent:I

    goto :goto_0
.end method

.method declared-synchronized getOrCreateAdPlayer()Lcom/my/target/ads/instream/InstreamAudioAdPlayer;
    .locals 4

    .prologue
    .line 50
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    if-nez v0, :cond_0

    .line 51
    new-instance v0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->type:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->ctx:Landroid/content/Context;

    iget v3, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->idAd:I

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;-><init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;Landroid/content/Context;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 50
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getPlayerActions()[Lcom/vkontakte/android/audio/PlayerAction;
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->getPlayerActions()[Lcom/vkontakte/android/audio/PlayerAction;

    move-result-object v0

    goto :goto_0
.end method

.method public getRefer()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getRefer()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    move-result-object v0

    return-object v0
.end method

.method public getState()Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    return-object v0
.end method

.method synthetic lambda$onCompleted$1(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V
    .locals 1
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V

    return-void
.end method

.method synthetic lambda$onProgress$2()V
    .locals 2

    .prologue
    .line 250
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_0

    .line 251
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->resume()Z

    .line 253
    :cond_0
    return-void
.end method

.method synthetic lambda$play$0(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 3
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 71
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v1, v2, :cond_1

    .line 72
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1, p1, p2, p3}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->play(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 73
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v1, v2, :cond_1

    .line 74
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->pause()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :cond_1
    :goto_0
    return-void

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .locals 2
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "percent"    # I

    .prologue
    .line 261
    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v0

    iget v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->idContent:I

    if-ne v0, v1, :cond_0

    .line 262
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v0, p1, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onBufferingProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 264
    :cond_0
    return-void
.end method

.method public onCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V
    .locals 3
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 230
    iget v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->idContent:I

    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 231
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    sget-object v1, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->postroll:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    invoke-static {p0, p1}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->work(Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;)V

    .line 237
    :cond_0
    :goto_0
    return-void

    .line 235
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V

    goto :goto_0
.end method

.method public onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V
    .locals 1
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "errorType"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;

    .prologue
    .line 241
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v0, p1, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V

    .line 242
    return-void
.end method

.method public onHelperIdChange(I)V
    .locals 1
    .param p1, "newId"    # I

    .prologue
    .line 268
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onHelperIdChange(I)V

    .line 269
    return-void
.end method

.method public onPrepared(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .locals 1
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "duration"    # I

    .prologue
    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v0, p1, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onPrepared(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 226
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .locals 4
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "progress"    # I

    .prologue
    .line 246
    div-int/lit16 v0, p2, 0x3e8

    .line 247
    .local v0, "progressSec":I
    iget v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->idContent:I

    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v2

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->checkMidroll(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 248
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->pause()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 249
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    sget-object v2, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->midlroll:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    invoke-static {p0}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;)Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->work(Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;I)V

    .line 256
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v1, p1, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 257
    return-void
.end method

.method public onStateChange()V
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->idAd:I

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->onHelperIdChange(I)V

    .line 276
    return-void

    .line 275
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->idContent:I

    goto :goto_0
.end method

.method public pause()Z
    .locals 3

    .prologue
    .line 103
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v1, v2, :cond_2

    .line 105
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 106
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->pause()Z

    move-result v0

    .line 110
    .local v0, "retValue":Z
    :goto_0
    if-eqz v0, :cond_0

    .line 111
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 115
    .end local v0    # "retValue":Z
    :cond_0
    :goto_1
    return v0

    .line 108
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->pause()Z

    move-result v0

    .restart local v0    # "retValue":Z
    goto :goto_0

    .line 115
    .end local v0    # "retValue":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public play(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 6
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
    .line 60
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->stop()V

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->release()V

    .line 68
    :cond_0
    new-instance v0, Lcom/vkontakte/android/audio/player/ads/AudioAd;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->ctx:Landroid/content/Context;

    move-object v2, p1

    move-object v3, p0

    move-object v4, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/audio/player/ads/AudioAd;-><init>(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;Lcom/vkontakte/android/audio/player/ads/AudioAd$OnStateChangedListener;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    sget-object v1, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->preroll:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    invoke-static {p0, p1, p2, p3}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->work(Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;)V

    .line 81
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->release()V

    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->release()V

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    if-eqz v0, :cond_1

    .line 95
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->release()V

    .line 96
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    .line 98
    :cond_1
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 99
    return-void
.end method

.method public resume()Z
    .locals 3

    .prologue
    .line 120
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v1, v2, :cond_2

    .line 122
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 123
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->resume()Z

    move-result v0

    .line 127
    .local v0, "retValue":Z
    :goto_0
    if-eqz v0, :cond_0

    .line 128
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 132
    .end local v0    # "retValue":Z
    :cond_0
    :goto_1
    return v0

    .line 125
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->resume()Z

    move-result v0

    .restart local v0    # "retValue":Z
    goto :goto_0

    .line 132
    .end local v0    # "retValue":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public rewind()Z
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isAllowTrackChange()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 140
    :goto_0
    return v0

    .line 138
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 140
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->rewind()Z

    move-result v0

    goto :goto_0
.end method

.method public seekTo(I)Z
    .locals 1
    .param p1, "millis"    # I

    .prologue
    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isAllowSeek()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->seekTo(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 161
    :goto_0
    return v0

    .line 159
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 161
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->seekTo(I)Z

    move-result v0

    goto :goto_0
.end method

.method public setVolume(F)V
    .locals 1
    .param p1, "volume"    # F

    .prologue
    .line 194
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->setVolume(F)V

    .line 195
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    if-eqz v0, :cond_0

    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->setVolume(F)V

    .line 198
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->stop()V

    .line 186
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerAd:Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->stop()V

    .line 189
    :cond_0
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 190
    return-void
.end method

.method public tryNext()Z
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->isAllowSkip()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->audioAd:Lcom/vkontakte/android/audio/player/ads/AudioAd;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->skip()V

    .line 150
    :cond_0
    const/4 v0, 0x1

    .line 152
    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->playerContent:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->tryNext()Z

    move-result v0

    goto :goto_0
.end method
