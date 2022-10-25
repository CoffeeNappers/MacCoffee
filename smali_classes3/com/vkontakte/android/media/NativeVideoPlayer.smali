.class public Lcom/vkontakte/android/media/NativeVideoPlayer;
.super Lcom/vkontakte/android/media/TextureVideoPlayer;
.source "NativeVideoPlayer.java"


# static fields
.field public static final MEDIA_ERROR_SYSTEM:I = -0x80000000


# instance fields
.field private mCompleted:Z

.field private mLastPosition:I

.field private mPlayer:Landroid/media/MediaPlayer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mPrepared:Z

.field private mQuality:I

.field private mUrl:Ljava/lang/String;

.field final mVigo:Lcom/vkontakte/android/media/VigoDelegate;

.field ticker:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "videoFile"    # Lcom/vkontakte/android/api/VideoFile;
    .param p3, "referrer"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/media/TextureVideoPlayer;-><init>(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)V

    .line 22
    new-instance v0, Lcom/vkontakte/android/media/VigoDelegate;

    invoke-direct {v0}, Lcom/vkontakte/android/media/VigoDelegate;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    .line 33
    invoke-static {p0}, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/media/NativeVideoPlayer;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->ticker:Ljava/lang/Runnable;

    .line 48
    return-void
.end method


# virtual methods
.method public createPlayer(IIII)V
    .locals 0
    .param p1, "minBufferMs"    # I
    .param p2, "maxBufferMs"    # I
    .param p3, "bufferForPlaybackMs"    # I
    .param p4, "bufferForPlaybackAfterRebufferMs"    # I

    .prologue
    .line 82
    return-void
.end method

.method dispatchPlayerReady()V
    .locals 4

    .prologue
    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 189
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 190
    iget-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v3

    invoke-virtual {v1, p0, v2, v3}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onPlayerReady(Lcom/vkontakte/android/media/AbsVideoPlayer;II)V

    .line 192
    :cond_0
    return-void
.end method

.method doSetDataSource(Landroid/graphics/SurfaceTexture;)V
    .locals 5
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 195
    iget-object v2, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoDelegate;->beforeSetDataSource()V

    .line 196
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    .line 197
    .local v1, "player":Landroid/media/MediaPlayer;
    iput-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 199
    invoke-static {p0}, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/media/NativeVideoPlayer;)Landroid/media/MediaPlayer$OnCompletionListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 204
    invoke-static {p0}, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/media/NativeVideoPlayer;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 221
    invoke-static {p0, v1}, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/media/NativeVideoPlayer;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer$OnInfoListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    .line 234
    invoke-static {p0, v1}, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/media/NativeVideoPlayer;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 239
    invoke-static {p0, v1}, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/media/NativeVideoPlayer;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 245
    invoke-virtual {p0}, Lcom/vkontakte/android/media/NativeVideoPlayer;->tick()V

    .line 247
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/media/NativeVideoPlayer;->updateTexture(Landroid/graphics/SurfaceTexture;)V

    .line 249
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 250
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 251
    iget-object v2, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoDelegate;->afterSetDataSource()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 255
    :goto_0
    return-void

    .line 252
    :catch_0
    move-exception v0

    .line 253
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v2, "NativeVideoPlayer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "setDataSource failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getPosition()I
    .locals 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 161
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 162
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    .line 164
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getQuality()I
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mQuality:I

    return v0
.end method

.method public isCompleted()Z
    .locals 1

    .prologue
    .line 169
    iget-boolean v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mCompleted:Z

    return v0
.end method

.method synthetic lambda$doSetDataSource$1(Landroid/media/MediaPlayer;)V
    .locals 6
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    int-to-long v4, v1

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->onPlaybackComplete(JJ)V

    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onPlaybackCompleted(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 202
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mCompleted:Z

    .line 203
    return-void
.end method

.method synthetic lambda$doSetDataSource$2(Landroid/media/MediaPlayer;II)Z
    .locals 5
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    const/4 v1, -0x1

    const/16 v4, -0x3ec

    const/4 v2, 0x1

    .line 205
    if-eq p2, v2, :cond_0

    const/16 v0, -0x3ef

    if-eq p2, v0, :cond_0

    const/16 v0, -0x3f2

    if-ne p2, v0, :cond_1

    .line 208
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    const/high16 v0, -0x80000000

    if-ne p3, v0, :cond_4

    move v0, v1

    :goto_0
    invoke-virtual {v3, p0, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 212
    :cond_1
    if-eq p2, v4, :cond_2

    const/16 v0, 0x64

    if-eq p2, v0, :cond_2

    const/16 v0, -0x6e

    if-ne p2, v0, :cond_3

    .line 215
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 217
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v0, p2, p3}, Lcom/vkontakte/android/media/VigoDelegate;->onError(II)V

    .line 218
    return v2

    .line 208
    :cond_4
    if-ne p3, v4, :cond_5

    const/4 v0, 0x4

    goto :goto_0

    :cond_5
    move v0, v2

    goto :goto_0
.end method

.method synthetic lambda$doSetDataSource$3(Landroid/media/MediaPlayer;Landroid/media/MediaPlayer;II)Z
    .locals 6
    .param p1, "player"    # Landroid/media/MediaPlayer;
    .param p2, "mp"    # Landroid/media/MediaPlayer;
    .param p3, "what"    # I
    .param p4, "extra"    # I

    .prologue
    .line 222
    const/16 v0, 0x2bd

    if-ne p3, v0, :cond_0

    .line 223
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onEndOfBuffer(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 224
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    int-to-long v4, v1

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->onBufferingStart(JJ)V

    .line 227
    :cond_0
    const/16 v0, 0x2be

    if-ne p3, v0, :cond_1

    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onPlaybackResumed(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    int-to-long v4, v1

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->onBufferingEnd(JJ)V

    .line 231
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$doSetDataSource$4(Landroid/media/MediaPlayer;Landroid/media/MediaPlayer;I)V
    .locals 6
    .param p1, "player"    # Landroid/media/MediaPlayer;
    .param p2, "mp"    # Landroid/media/MediaPlayer;
    .param p3, "percent"    # I

    .prologue
    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0, p3}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onUpdateBuffered(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    int-to-long v4, v1

    move v1, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/media/VigoDelegate;->onBufferingUpdate(IJJ)V

    .line 237
    return-void
.end method

.method synthetic lambda$doSetDataSource$5(Landroid/media/MediaPlayer;Landroid/media/MediaPlayer;)V
    .locals 6
    .param p1, "player"    # Landroid/media/MediaPlayer;
    .param p2, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 240
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPrepared:Z

    .line 241
    invoke-virtual {p0}, Lcom/vkontakte/android/media/NativeVideoPlayer;->dispatchPlayerReady()V

    .line 242
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    int-to-long v4, v1

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->vigoOnPrepared(JJ)V

    .line 243
    return-void
.end method

.method synthetic lambda$new$0()V
    .locals 8

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 35
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 36
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    .line 37
    .local v1, "position":I
    iget v2, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mLastPosition:I

    if-eq v1, v2, :cond_0

    .line 38
    iput v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mLastPosition:I

    .line 39
    iget-object v2, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    iget v3, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mLastPosition:I

    invoke-virtual {v2, p0, v3}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onUpdatePlaybackPosition(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 40
    iget-object v2, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v3

    int-to-long v6, v3

    invoke-virtual {v2, v4, v5, v6, v7}, Lcom/vkontakte/android/media/VigoDelegate;->onUpdatePlaybackPosition(JJ)V

    .line 43
    .end local v1    # "position":I
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/media/NativeVideoPlayer;->tick()V

    .line 44
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 1
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mUrl:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 142
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/media/NativeVideoPlayer;->doSetDataSource(Landroid/graphics/SurfaceTexture;)V

    .line 146
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/media/TextureVideoPlayer;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V

    .line 147
    return-void

    .line 144
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/media/NativeVideoPlayer;->updateTexture(Landroid/graphics/SurfaceTexture;)V

    goto :goto_0
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 2
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 152
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 153
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 155
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/media/TextureVideoPlayer;->onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z

    move-result v1

    return v1
.end method

.method public pause()V
    .locals 7

    .prologue
    .line 104
    iget-object v6, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 105
    .local v6, "player":Landroid/media/MediaPlayer;
    if-eqz v6, :cond_0

    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v6}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    invoke-virtual {v6}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v6}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/media/VigoDelegate;->pause(ZJJ)V

    .line 107
    invoke-virtual {v6}, Landroid/media/MediaPlayer;->pause()V

    .line 109
    :cond_0
    return-void
.end method

.method public play(Z)V
    .locals 6
    .param p1, "replay"    # Z

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 95
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 96
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mCompleted:Z

    .line 97
    iget-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->play(JJ)V

    .line 98
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 100
    :cond_0
    return-void
.end method

.method public recallReady()V
    .locals 0

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/vkontakte/android/media/NativeVideoPlayer;->dispatchPlayerReady()V

    .line 124
    return-void
.end method

.method public replay(I)V
    .locals 6
    .param p1, "position"    # I

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 87
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 88
    iget-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v2

    int-to-long v2, v2

    int-to-long v4, p1

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->play(JJ)V

    .line 90
    :cond_0
    return-void
.end method

.method public seek(I)V
    .locals 8
    .param p1, "offset"    # I

    .prologue
    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 114
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 115
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mCompleted:Z

    .line 116
    iget-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    int-to-float v2, p1

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v3

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual/range {v1 .. v7}, Lcom/vkontakte/android/media/VigoDelegate;->seek(FZJJ)V

    .line 117
    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 119
    :cond_0
    return-void
.end method

.method public setDataSourceAndPrepare(Ljava/lang/String;IZZ)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "quality"    # I
    .param p3, "useVigo"    # Z
    .param p4, "autoplay"    # Z

    .prologue
    .line 61
    iput p2, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mQuality:I

    .line 62
    iput-boolean p4, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->isAutoplay:Z

    .line 63
    iget-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    if-eqz p3, :cond_1

    .end local p2    # "quality":I
    :goto_0
    invoke-static {p4}, Lcom/vkontakte/android/media/VigoDelegate;->getSVCid(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, p2, v2}, Lcom/vkontakte/android/media/VigoDelegate;->setDataSourceAndPrepare(Ljava/lang/String;ILjava/lang/String;)V

    .line 64
    iput-object p1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mUrl:Ljava/lang/String;

    .line 66
    iget-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    if-eqz v1, :cond_0

    .line 67
    iget-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    .line 68
    .local v0, "surfaceTexture":Landroid/graphics/SurfaceTexture;
    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/media/NativeVideoPlayer;->doSetDataSource(Landroid/graphics/SurfaceTexture;)V

    .line 72
    .end local v0    # "surfaceTexture":Landroid/graphics/SurfaceTexture;
    :cond_0
    return-void

    .line 63
    .restart local p2    # "quality":I
    :cond_1
    const/4 p2, -0x1

    goto :goto_0
.end method

.method public setPlayerStateListener(Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;)V
    .locals 2
    .param p1, "l"    # Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    .prologue
    .line 52
    invoke-super {p0, p1}, Lcom/vkontakte/android/media/TextureVideoPlayer;->setPlayerStateListener(Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;)V

    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 54
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPrepared:Z

    if-eqz v1, :cond_0

    .line 55
    invoke-virtual {p0}, Lcom/vkontakte/android/media/NativeVideoPlayer;->dispatchPlayerReady()V

    .line 57
    :cond_0
    return-void
.end method

.method public setVolume(F)V
    .locals 1
    .param p1, "gain"    # F

    .prologue
    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 175
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 176
    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 178
    :cond_0
    return-void
.end method

.method public stopAndRelease()V
    .locals 6

    .prologue
    .line 128
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 129
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p0}, Lcom/vkontakte/android/media/NativeVideoPlayer;->tock()V

    .line 131
    iget-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->release(JJ)V

    .line 132
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 133
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 134
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 135
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPrepared:Z

    .line 137
    :cond_0
    return-void
.end method

.method tick()V
    .locals 4

    .prologue
    .line 258
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 259
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 260
    iget-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->ticker:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    .line 262
    :cond_0
    return-void
.end method

.method tock()V
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->ticker:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 266
    return-void
.end method

.method updateTexture(Landroid/graphics/SurfaceTexture;)V
    .locals 2
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 181
    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer;->mPlayer:Landroid/media/MediaPlayer;

    .line 182
    .local v0, "player":Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 183
    new-instance v1, Landroid/view/Surface;

    invoke-direct {v1, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 185
    :cond_0
    return-void
.end method
