.class Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;
.super Ljava/lang/Object;
.source "ExoPlayerHelper.java"

# interfaces
.implements Lcom/google/android/exoplayer2/ExoPlayer$EventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    .prologue
    .line 228
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadingChanged(Z)V
    .locals 0
    .param p1, "isLoading"    # Z

    .prologue
    .line 231
    return-void
.end method

.method public onPlayerError(Lcom/google/android/exoplayer2/ExoPlaybackException;)V
    .locals 8
    .param p1, "error"    # Lcom/google/android/exoplayer2/ExoPlaybackException;

    .prologue
    .line 263
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->stop()V

    .line 264
    iget v5, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;->type:I

    packed-switch v5, :pswitch_data_0

    .line 287
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v5}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$100(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    sget-object v7, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;->unknown:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;

    invoke-interface {v5, v6, v7}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V

    .line 291
    :goto_0
    return-void

    .line 267
    :pswitch_0
    const/4 v2, 0x0

    .line 268
    .local v2, "exception":Ljava/lang/Exception;
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->getSourceException()Ljava/io/IOException;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 269
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->getSourceException()Ljava/io/IOException;

    move-result-object v2

    .line 271
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->getUnexpectedException()Ljava/lang/RuntimeException;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 272
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->getUnexpectedException()Ljava/lang/RuntimeException;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    move-object v3, v2

    .line 274
    .end local v2    # "exception":Ljava/lang/Exception;
    .local v3, "exception":Ljava/lang/Exception;
    :goto_1
    if-eqz v3, :cond_2

    .line 275
    :try_start_1
    instance-of v5, v3, Lcom/google/android/exoplayer2/source/UnrecognizedInputFormatException;

    if-eqz v5, :cond_1

    .line 276
    move-object v0, v3

    check-cast v0, Lcom/google/android/exoplayer2/source/UnrecognizedInputFormatException;

    move-object v5, v0

    iget-object v4, v5, Lcom/google/android/exoplayer2/source/UnrecognizedInputFormatException;->uri:Landroid/net/Uri;

    .line 277
    .local v4, "uri":Landroid/net/Uri;
    new-instance v2, Ljava/lang/Exception;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "|uri="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 279
    .end local v3    # "exception":Ljava/lang/Exception;
    .end local v4    # "uri":Landroid/net/Uri;
    .restart local v2    # "exception":Ljava/lang/Exception;
    :goto_2
    :try_start_2
    invoke-static {v2}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 284
    :goto_3
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v5}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$100(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    sget-object v7, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;->unknown:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;

    invoke-interface {v5, v6, v7}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V

    goto :goto_0

    .line 281
    :catch_0
    move-exception v1

    .line 282
    .local v1, "e":Ljava/lang/Exception;
    :goto_4
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1, v5}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_3

    .line 281
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "exception":Ljava/lang/Exception;
    .restart local v3    # "exception":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "exception":Ljava/lang/Exception;
    .restart local v2    # "exception":Ljava/lang/Exception;
    goto :goto_4

    .end local v2    # "exception":Ljava/lang/Exception;
    .restart local v3    # "exception":Ljava/lang/Exception;
    :cond_1
    move-object v2, v3

    .end local v3    # "exception":Ljava/lang/Exception;
    .restart local v2    # "exception":Ljava/lang/Exception;
    goto :goto_2

    .end local v2    # "exception":Ljava/lang/Exception;
    .restart local v3    # "exception":Ljava/lang/Exception;
    :cond_2
    move-object v2, v3

    .end local v3    # "exception":Ljava/lang/Exception;
    .restart local v2    # "exception":Ljava/lang/Exception;
    goto :goto_3

    :cond_3
    move-object v3, v2

    .end local v2    # "exception":Ljava/lang/Exception;
    .restart local v3    # "exception":Ljava/lang/Exception;
    goto :goto_1

    .line 264
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onPlayerStateChanged(ZI)V
    .locals 6
    .param p1, "playWhenReady"    # Z
    .param p2, "playbackState"    # I

    .prologue
    const/4 v3, 0x1

    .line 235
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$000(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 236
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_2

    .line 237
    const/4 v1, 0x4

    if-ne p2, v1, :cond_0

    .line 238
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->stop()V

    .line 239
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$100(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-interface {v1, v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V

    .line 241
    :cond_0
    const/4 v1, 0x3

    if-ne p2, v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$200(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 242
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v1, v3}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$202(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;Z)Z

    .line 243
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$300(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v1, v2, :cond_1

    .line 244
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$000(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setPlayWhenReady(Z)V

    .line 245
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$400(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)V

    .line 247
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$100(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$000(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v4

    long-to-int v3, v4

    invoke-interface {v1, v2, v3}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onPrepared(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 250
    :cond_2
    return-void
.end method

.method public onPositionDiscontinuity()V
    .locals 0

    .prologue
    .line 295
    return-void
.end method

.method public onTimelineChanged(Lcom/google/android/exoplayer2/Timeline;Ljava/lang/Object;)V
    .locals 0
    .param p1, "timeline"    # Lcom/google/android/exoplayer2/Timeline;
    .param p2, "manifest"    # Ljava/lang/Object;

    .prologue
    .line 254
    return-void
.end method

.method public onTracksChanged(Lcom/google/android/exoplayer2/source/TrackGroupArray;Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;)V
    .locals 0
    .param p1, "trackGroups"    # Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p2, "trackSelections"    # Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;

    .prologue
    .line 259
    return-void
.end method
