.class final Lcom/vk/core/view/SimpleVideoView$ComponentListener;
.super Ljava/lang/Object;
.source "SimpleVideoView.java"

# interfaces
.implements Lcom/google/android/exoplayer2/SimpleExoPlayer$VideoListener;
.implements Lcom/google/android/exoplayer2/ExoPlayer$EventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/view/SimpleVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ComponentListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/view/SimpleVideoView;


# direct methods
.method private constructor <init>(Lcom/vk/core/view/SimpleVideoView;)V
    .locals 0

    .prologue
    .line 572
    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/core/view/SimpleVideoView;Lcom/vk/core/view/SimpleVideoView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p2, "x1"    # Lcom/vk/core/view/SimpleVideoView$1;

    .prologue
    .line 572
    invoke-direct {p0, p1}, Lcom/vk/core/view/SimpleVideoView$ComponentListener;-><init>(Lcom/vk/core/view/SimpleVideoView;)V

    return-void
.end method


# virtual methods
.method public onLoadingChanged(Z)V
    .locals 0
    .param p1, "isLoading"    # Z

    .prologue
    .line 597
    return-void
.end method

.method public onPlayerError(Lcom/google/android/exoplayer2/ExoPlaybackException;)V
    .locals 6
    .param p1, "e"    # Lcom/google/android/exoplayer2/ExoPlaybackException;

    .prologue
    const/4 v5, -0x1

    .line 623
    const/4 v0, -0x1

    .line 624
    .local v0, "error":I
    iget-object v2, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v2}, Lcom/vk/core/view/SimpleVideoView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/exoplayer2/util/Util;->getPhysicalDisplaySize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v1

    .line 625
    .local v1, "p":Landroid/graphics/Point;
    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v2}, Lcom/vk/core/view/SimpleVideoView;->access$800(Lcom/vk/core/view/SimpleVideoView;)I

    move-result v2

    iget-object v3, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v3}, Lcom/vk/core/view/SimpleVideoView;->access$900(Lcom/vk/core/view/SimpleVideoView;)I

    move-result v3

    mul-int/2addr v2, v3

    iget v3, v1, Landroid/graphics/Point;->x:I

    iget v4, v1, Landroid/graphics/Point;->y:I

    mul-int/2addr v3, v4

    if-le v2, v3, :cond_0

    .line 626
    iget-object v2, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v2}, Lcom/vk/core/view/SimpleVideoView;->stop()V

    .line 627
    const/16 v0, 0x8

    .line 630
    :cond_0
    iget-object v2, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v2, v5}, Lcom/vk/core/view/SimpleVideoView;->access$1000(Lcom/vk/core/view/SimpleVideoView;I)V

    .line 631
    iget-object v2, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v2, v5}, Lcom/vk/core/view/SimpleVideoView;->access$1100(Lcom/vk/core/view/SimpleVideoView;I)V

    .line 632
    return-void
.end method

.method public onPlayerStateChanged(ZI)V
    .locals 2
    .param p1, "playWhenReady"    # Z
    .param p2, "playbackState"    # I

    .prologue
    .line 601
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v1}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 602
    .local v0, "exoPlayer":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 603
    packed-switch p2, :pswitch_data_0

    .line 619
    :cond_0
    :goto_0
    return-void

    .line 605
    :pswitch_0
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v1, v0}, Lcom/vk/core/view/SimpleVideoView;->access$400(Lcom/vk/core/view/SimpleVideoView;Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 609
    :pswitch_1
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v1, v0}, Lcom/vk/core/view/SimpleVideoView;->access$500(Lcom/vk/core/view/SimpleVideoView;Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 610
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v1, v0}, Lcom/vk/core/view/SimpleVideoView;->access$600(Lcom/vk/core/view/SimpleVideoView;Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 614
    :pswitch_2
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v1, v0}, Lcom/vk/core/view/SimpleVideoView;->access$700(Lcom/vk/core/view/SimpleVideoView;Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 603
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onPositionDiscontinuity()V
    .locals 0

    .prologue
    .line 637
    return-void
.end method

.method public onRenderedFirstFrame()V
    .locals 2

    .prologue
    .line 586
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v1}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 587
    .local v0, "exoPlayer":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 588
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v1, v0}, Lcom/vk/core/view/SimpleVideoView;->access$300(Lcom/vk/core/view/SimpleVideoView;Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 590
    :cond_0
    return-void
.end method

.method public onTimelineChanged(Lcom/google/android/exoplayer2/Timeline;Ljava/lang/Object;)V
    .locals 0
    .param p1, "timeline"    # Lcom/google/android/exoplayer2/Timeline;
    .param p2, "manifest"    # Ljava/lang/Object;

    .prologue
    .line 642
    return-void
.end method

.method public onTracksChanged(Lcom/google/android/exoplayer2/source/TrackGroupArray;Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;)V
    .locals 0
    .param p1, "trackGroups"    # Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p2, "trackSelections"    # Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;

    .prologue
    .line 647
    return-void
.end method

.method public onVideoSizeChanged(IIIF)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "unappliedRotationDegrees"    # I
    .param p4, "pixelWidthHeightRatio"    # F

    .prologue
    .line 578
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v1}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 579
    .local v0, "exoPlayer":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 580
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v1, p1, p2, p3}, Lcom/vk/core/view/SimpleVideoView;->access$200(Lcom/vk/core/view/SimpleVideoView;III)V

    .line 582
    :cond_0
    return-void
.end method
