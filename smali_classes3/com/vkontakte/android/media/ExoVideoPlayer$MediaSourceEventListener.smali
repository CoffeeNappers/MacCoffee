.class Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;
.super Ljava/lang/Object;
.source "ExoVideoPlayer.java"

# interfaces
.implements Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener;
.implements Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/ExoVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MediaSourceEventListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/media/ExoVideoPlayer;

.field private url:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/ExoVideoPlayer;)V
    .locals 0

    .prologue
    .line 622
    iput-object p1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/media/ExoVideoPlayer;Lcom/vkontakte/android/media/ExoVideoPlayer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/media/ExoVideoPlayer;
    .param p2, "x1"    # Lcom/vkontakte/android/media/ExoVideoPlayer$1;

    .prologue
    .line 622
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;-><init>(Lcom/vkontakte/android/media/ExoVideoPlayer;)V

    return-void
.end method


# virtual methods
.method public onDownstreamFormatChanged(ILcom/google/android/exoplayer2/Format;ILjava/lang/Object;J)V
    .locals 0
    .param p1, "trackType"    # I
    .param p2, "trackFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p3, "trackSelectionReason"    # I
    .param p4, "trackSelectionData"    # Ljava/lang/Object;
    .param p5, "mediaTimeMs"    # J

    .prologue
    .line 673
    return-void
.end method

.method public onLoadCanceled(Lcom/google/android/exoplayer2/upstream/DataSpec;IILcom/google/android/exoplayer2/Format;ILjava/lang/Object;JJJJJ)V
    .locals 0
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .param p2, "dataType"    # I
    .param p3, "trackType"    # I
    .param p4, "trackFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p5, "trackSelectionReason"    # I
    .param p6, "trackSelectionData"    # Ljava/lang/Object;
    .param p7, "mediaStartTimeMs"    # J
    .param p9, "mediaEndTimeMs"    # J
    .param p11, "elapsedRealtimeMs"    # J
    .param p13, "loadDurationMs"    # J
    .param p15, "bytesLoaded"    # J

    .prologue
    .line 656
    return-void
.end method

.method public onLoadCompleted(Lcom/google/android/exoplayer2/upstream/DataSpec;IILcom/google/android/exoplayer2/Format;ILjava/lang/Object;JJJJJ)V
    .locals 9
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .param p2, "dataType"    # I
    .param p3, "trackType"    # I
    .param p4, "trackFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p5, "trackSelectionReason"    # I
    .param p6, "trackSelectionData"    # Ljava/lang/Object;
    .param p7, "mediaStartTimeMs"    # J
    .param p9, "mediaEndTimeMs"    # J
    .param p11, "elapsedRealtimeMs"    # J
    .param p13, "loadDurationMs"    # J
    .param p15, "bytesLoaded"    # J

    .prologue
    .line 649
    invoke-static {}, Lcom/vkontakte/android/media/ExoVideoPlayer;->access$600()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-wide/from16 v2, p15

    move-wide/from16 v4, p13

    invoke-virtual/range {v0 .. v7}, Lcom/vkontakte/android/data/BenchmarkTracker;->trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V

    .line 650
    return-void
.end method

.method public onLoadError(Lcom/google/android/exoplayer2/upstream/DataSpec;IILcom/google/android/exoplayer2/Format;ILjava/lang/Object;JJJJJLjava/io/IOException;Z)V
    .locals 9
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .param p2, "dataType"    # I
    .param p3, "trackType"    # I
    .param p4, "trackFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p5, "trackSelectionReason"    # I
    .param p6, "trackSelectionData"    # Ljava/lang/Object;
    .param p7, "mediaStartTimeMs"    # J
    .param p9, "mediaEndTimeMs"    # J
    .param p11, "elapsedRealtimeMs"    # J
    .param p13, "loadDurationMs"    # J
    .param p15, "bytesLoaded"    # J
    .param p17, "error"    # Ljava/io/IOException;
    .param p18, "wasCanceled"    # Z

    .prologue
    .line 663
    invoke-static {}, Lcom/vkontakte/android/media/ExoVideoPlayer;->access$600()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v6, 0x0

    move-wide/from16 v2, p15

    move-wide/from16 v4, p13

    move-object/from16 v7, p17

    invoke-virtual/range {v0 .. v7}, Lcom/vkontakte/android/data/BenchmarkTracker;->trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V

    .line 664
    return-void
.end method

.method public onLoadError(Ljava/io/IOException;)V
    .locals 8
    .param p1, "error"    # Ljava/io/IOException;

    .prologue
    const-wide/16 v2, 0x0

    .line 677
    invoke-static {}, Lcom/vkontakte/android/media/ExoVideoPlayer;->access$600()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;->url:Ljava/lang/String;

    const/4 v6, 0x0

    move-wide v4, v2

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Lcom/vkontakte/android/data/BenchmarkTracker;->trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V

    .line 678
    return-void
.end method

.method public onLoadStarted(Lcom/google/android/exoplayer2/upstream/DataSpec;IILcom/google/android/exoplayer2/Format;ILjava/lang/Object;JJJ)V
    .locals 4
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .param p2, "dataType"    # I
    .param p3, "trackType"    # I
    .param p4, "trackFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p5, "trackSelectionReason"    # I
    .param p6, "trackSelectionData"    # Ljava/lang/Object;
    .param p7, "mediaStartTimeMs"    # J
    .param p9, "mediaEndTimeMs"    # J
    .param p11, "elapsedRealtimeMs"    # J

    .prologue
    .line 629
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer;

    invoke-static {v1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->access$200(Lcom/vkontakte/android/media/ExoVideoPlayer;)Lcom/vkontakte/android/media/VigoDelegate;

    move-result-object v1

    iget-object v2, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/media/VigoDelegate;->setHost(Landroid/net/Uri;)V

    .line 631
    const/4 v1, 0x1

    if-ne p2, v1, :cond_1

    .line 632
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer;

    invoke-static {v1, p4}, Lcom/vkontakte/android/media/ExoVideoPlayer;->access$302(Lcom/vkontakte/android/media/ExoVideoPlayer;Lcom/google/android/exoplayer2/Format;)Lcom/google/android/exoplayer2/Format;

    .line 634
    sget-object v1, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->instance:Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;

    iget-boolean v1, v1, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->aboveScreenResolutionDisable:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer;

    .line 635
    invoke-static {v1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->access$400(Lcom/vkontakte/android/media/ExoVideoPlayer;)Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;

    move-result-object v1

    invoke-virtual {v1, p4}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->checkVideoFormat(Lcom/google/android/exoplayer2/Format;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 636
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer;

    invoke-static {v1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->access$500(Lcom/vkontakte/android/media/ExoVideoPlayer;)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 637
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 638
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->stop()V

    .line 640
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer;

    iget-object v1, v1, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    iget-object v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 643
    .end local v0    # "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    :cond_1
    return-void
.end method

.method public onUpstreamDiscarded(IJJ)V
    .locals 0
    .param p1, "trackType"    # I
    .param p2, "mediaStartTimeMs"    # J
    .param p4, "mediaEndTimeMs"    # J

    .prologue
    .line 668
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 681
    iput-object p1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;->url:Ljava/lang/String;

    .line 682
    return-void
.end method
