.class public Lcom/wmspanel/libstream/StreamerSurface;
.super Lcom/wmspanel/libstream/Streamer;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "StreamerSurface"


# instance fields
.field private dK:Lcom/wmspanel/libstream/VideoListenerSurface;


# direct methods
.method protected constructor <init>(I)V
    .locals 0
    .param p1, "items"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/wmspanel/libstream/Streamer;-><init>()V

    .line 15
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/StreamerSurface;->init(I)V

    .line 16
    return-void
.end method


# virtual methods
.method public addVideoTs(J)V
    .locals 1
    .param p1, "shift"    # J

    .prologue
    .line 60
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0, p1, p2}, Lcom/wmspanel/libstream/VideoListener;->setGapPts(J)V

    .line 63
    :cond_0
    return-void
.end method

.method public drainEncoder()V
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->dK:Lcom/wmspanel/libstream/VideoListenerSurface;

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->dK:Lcom/wmspanel/libstream/VideoListenerSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerSurface;->drainEncoder()V

    .line 46
    :cond_0
    return-void
.end method

.method public flip()V
    .locals 1

    .prologue
    .line 50
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public getEncoderSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->dK:Lcom/wmspanel/libstream/VideoListenerSurface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->dK:Lcom/wmspanel/libstream/VideoListenerSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListenerSurface;->getEncoderSurface()Landroid/view/Surface;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 55
    invoke-super {p0}, Lcom/wmspanel/libstream/Streamer;->release()V

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->dK:Lcom/wmspanel/libstream/VideoListenerSurface;

    .line 57
    return-void
.end method

.method public startVideoCapture()V
    .locals 3

    .prologue
    .line 20
    const-string/jumbo v0, "StreamerSurface"

    const-string/jumbo v1, "startVideoCapture"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->dK:Lcom/wmspanel/libstream/VideoListenerSurface;

    if-eqz v0, :cond_0

    .line 36
    :goto_0
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_1

    .line 25
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    if-nez v0, :cond_2

    .line 28
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerSurface;->createVideoEncoder()Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 29
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    if-nez v0, :cond_2

    .line 30
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "VideoEncoder is null, check if streamer was built with AUDIO_ONLY mode"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :cond_2
    new-instance v0, Lcom/wmspanel/libstream/VideoListenerSurface;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerSurface;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerSurface;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/VideoListenerSurface;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->dK:Lcom/wmspanel/libstream/VideoListenerSurface;

    .line 34
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->dK:Lcom/wmspanel/libstream/VideoListenerSurface;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerSurface;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListenerSurface;->start(Lcom/wmspanel/libstream/VideoEncoder;)V

    .line 35
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->dK:Lcom/wmspanel/libstream/VideoListenerSurface;

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerSurface;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    goto :goto_0
.end method
