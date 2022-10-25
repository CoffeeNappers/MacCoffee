.class Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;
.super Ljava/lang/Object;
.source "InstreamAudioAdPlayerAdapter.java"

# interfaces
.implements Lcom/my/target/ads/instream/InstreamAudioAdPlayer;
.implements Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;
.implements Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;


# instance fields
.field private adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

.field private final ctx:Landroid/content/Context;

.field private final mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

.field private mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

.field private final type:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;Landroid/content/Context;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;)V
    .locals 1
    .param p1, "type"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "id"    # I
    .param p4, "listener"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->type:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    .line 31
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->ctx:Landroid/content/Context;

    .line 32
    iput-object p4, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    .line 33
    invoke-static {p1, p2, p3, p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Factory;->get(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;Landroid/content/Context;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    .line 34
    return-void
.end method


# virtual methods
.method public canPlay()Z
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->canPlay()Z

    move-result v0

    return v0
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->release()V

    .line 105
    return-void
.end method

.method public getAdAudioDuration()F
    .locals 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getDuration()J

    move-result-wide v0

    long-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public getAdAudioTimeElapsed()F
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getCurrentPosition()J

    move-result-wide v0

    long-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public getAdPlayerListener()Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    return-object v0
.end method

.method public getAudioSessionId()I
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getAudioSessionId()I

    move-result v0

    return v0
.end method

.method public getCurrentContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->ctx:Landroid/content/Context;

    return-object v0
.end method

.method public getCurrentPosition()J
    .locals 2

    .prologue
    .line 215
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getCurrentPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v0

    return v0
.end method

.method public getRefer()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getRefer()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    move-result-object v0

    return-object v0
.end method

.method public getState()Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 231
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    return-object v0
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .locals 1
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "percent"    # I

    .prologue
    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v0, p1, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onBufferingProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 159
    return-void
.end method

.method public onCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V
    .locals 2
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 133
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v1, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    .line 136
    .local v0, "adPlayerListener":Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;
    if-eqz v0, :cond_0

    .line 137
    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;->onAdAudioCompleted()V

    .line 139
    :cond_0
    return-void
.end method

.method public onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V
    .locals 2
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "errorType"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;

    .prologue
    .line 143
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v1, p1, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V

    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    .line 146
    .local v0, "adPlayerListener":Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;
    if-eqz v0, :cond_0

    .line 147
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;->onAdAudioError(Ljava/lang/String;)V

    .line 149
    :cond_0
    return-void
.end method

.method public onHelperIdChange(I)V
    .locals 1
    .param p1, "newId"    # I

    .prologue
    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onHelperIdChange(I)V

    .line 164
    return-void
.end method

.method public onPrepared(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .locals 4
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "duration"    # I

    .prologue
    .line 121
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v1, p1, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onPrepared(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 123
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "myTarget"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    .line 126
    .local v0, "adPlayerListener":Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;
    if-eqz v0, :cond_0

    .line 127
    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;->onAdAudioStarted()V

    .line 129
    :cond_0
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .locals 1
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "progress"    # I

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelperListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    invoke-interface {v0, p1, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 154
    return-void
.end method

.method public pause()Z
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->pause()Z

    move-result v0

    return v0
.end method

.method public pauseAdAudio()V
    .locals 2

    .prologue
    .line 74
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->pause()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    .line 76
    .local v0, "adPlayerListener":Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;
    if-eqz v0, :cond_0

    .line 77
    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;->onAdAudioPaused()V

    .line 80
    .end local v0    # "adPlayerListener":Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;
    :cond_0
    return-void
.end method

.method public play(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
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
    .line 170
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0, p1, p2, p3}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->play(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 171
    return-void
.end method

.method public playAdAudio(Landroid/net/Uri;)V
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 66
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->type:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->createHttpUrl(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v1, v2, v3, v4}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->play(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :goto_0
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->release()V

    .line 181
    return-void
.end method

.method public resume()Z
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->resume()Z

    move-result v0

    return v0
.end method

.method public resumeAdAudio()V
    .locals 2

    .prologue
    .line 84
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->resume()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    .line 86
    .local v0, "adPlayerListener":Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;
    if-eqz v0, :cond_0

    .line 87
    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;->onAdAudioResumed()V

    .line 90
    .end local v0    # "adPlayerListener":Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;
    :cond_0
    return-void
.end method

.method public rewind()Z
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->rewind()Z

    move-result v0

    return v0
.end method

.method public seekTo(I)Z
    .locals 1
    .param p1, "millis"    # I

    .prologue
    .line 205
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->seekTo(I)Z

    move-result v0

    return v0
.end method

.method public setAdPlayerListener(Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;)V
    .locals 0
    .param p1, "adPlayerListener"    # Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    .line 46
    return-void
.end method

.method public setVolume(F)V
    .locals 2
    .param p1, "v"    # F

    .prologue
    .line 109
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->setVolume(F)V

    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    .line 112
    .local v0, "adPlayerListener":Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;
    if-eqz v0, :cond_0

    .line 113
    invoke-interface {v0, p1}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;->onVolumeChanged(F)V

    .line 115
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->stop()V

    .line 221
    return-void
.end method

.method public stopAdAudio()V
    .locals 2

    .prologue
    .line 94
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->stop()V

    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->adPlayerListener:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    .line 97
    .local v0, "adPlayerListener":Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;
    if-eqz v0, :cond_0

    .line 98
    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;->onAdAudioStopped()V

    .line 100
    :cond_0
    return-void
.end method

.method public tryNext()Z
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/InstreamAudioAdPlayerAdapter;->mediaPlayerHelper:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->tryNext()Z

    move-result v0

    return v0
.end method
