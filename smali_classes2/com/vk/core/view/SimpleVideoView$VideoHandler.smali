.class Lcom/vk/core/view/SimpleVideoView$VideoHandler;
.super Landroid/os/Handler;
.source "SimpleVideoView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/view/SimpleVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VideoHandler"
.end annotation


# instance fields
.field private final MSG_BUFFERING_END:I

.field private final MSG_BUFFERING_START:I

.field private final MSG_END:I

.field private final MSG_FIRST_FRAME_RENDERED:I

.field private final MSG_ON_PREPARED:I

.field private final MSG_VIDEO_ERROR:I

.field private final MSG_VIDEO_SIZE_CHANGED:I

.field final synthetic this$0:Lcom/vk/core/view/SimpleVideoView;


# direct methods
.method public constructor <init>(Lcom/vk/core/view/SimpleVideoView;)V
    .locals 1

    .prologue
    .line 660
    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    .line 661
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 652
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->MSG_ON_PREPARED:I

    .line 653
    const/4 v0, 0x1

    iput v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->MSG_BUFFERING_START:I

    .line 654
    const/4 v0, 0x2

    iput v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->MSG_BUFFERING_END:I

    .line 655
    const/4 v0, 0x3

    iput v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->MSG_END:I

    .line 656
    const/4 v0, 0x4

    iput v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->MSG_FIRST_FRAME_RENDERED:I

    .line 657
    const/4 v0, 0x5

    iput v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->MSG_VIDEO_SIZE_CHANGED:I

    .line 658
    const/4 v0, 0x6

    iput v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->MSG_VIDEO_ERROR:I

    .line 662
    return-void
.end method


# virtual methods
.method public dispatchBufferingEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 731
    const/4 v0, 0x2

    invoke-static {p0, v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 732
    return-void
.end method

.method public dispatchBufferingStart(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 727
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 728
    return-void
.end method

.method public dispatchEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 735
    const/4 v0, 0x3

    invoke-static {p0, v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 736
    return-void
.end method

.method public dispatchError(I)V
    .locals 2
    .param p1, "what"    # I

    .prologue
    .line 747
    const/4 v0, 0x6

    const/4 v1, 0x0

    invoke-static {p0, v0, p1, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 748
    return-void
.end method

.method public dispatchFirstFrameRendered(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 739
    const/4 v0, 0x4

    invoke-static {p0, v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 740
    return-void
.end method

.method public dispatchOnPrepared(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 723
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 724
    return-void
.end method

.method public dispatchVideoSizeChanged(III)V
    .locals 2
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "unappliedRotationDegrees"    # I

    .prologue
    .line 743
    const/4 v0, 0x5

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v0, p1, p2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 744
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 666
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 720
    :cond_0
    :goto_0
    return-void

    .line 668
    :pswitch_0
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1200(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 669
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1200(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;

    move-result-object v1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-interface {v1, v0}, Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;->onPrepared(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 674
    :pswitch_1
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1300(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 675
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1300(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;

    move-result-object v1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-interface {v1, v0}, Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;->onBufferingStart(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 680
    :pswitch_2
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1300(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 681
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1300(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;

    move-result-object v1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-interface {v1, v0}, Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;->onBufferingEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 686
    :pswitch_3
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1400(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnEndListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 687
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1400(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnEndListener;

    move-result-object v1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-interface {v1, v0}, Lcom/vk/core/view/SimpleVideoView$OnEndListener;->onEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 692
    :pswitch_4
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1500(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 693
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1500(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;

    move-result-object v1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-interface {v1, v0}, Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;->onFirstFrameRendered(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 698
    :pswitch_5
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 699
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v1, v0}, Lcom/vk/core/view/SimpleVideoView;->access$1602(Lcom/vk/core/view/SimpleVideoView;I)I

    .line 703
    :goto_1
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1600(Lcom/vk/core/view/SimpleVideoView;)I

    move-result v0

    rem-int/lit16 v0, v0, 0xb4

    const/16 v1, 0x5a

    if-ne v0, v1, :cond_2

    .line 704
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    iget v1, p1, Landroid/os/Message;->arg2:I

    invoke-static {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->access$802(Lcom/vk/core/view/SimpleVideoView;I)I

    .line 705
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->access$902(Lcom/vk/core/view/SimpleVideoView;I)I

    .line 710
    :goto_2
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1700(Lcom/vk/core/view/SimpleVideoView;)V

    goto/16 :goto_0

    .line 701
    :cond_1
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->access$1602(Lcom/vk/core/view/SimpleVideoView;I)I

    goto :goto_1

    .line 707
    :cond_2
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->access$802(Lcom/vk/core/view/SimpleVideoView;I)I

    .line 708
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    iget v1, p1, Landroid/os/Message;->arg2:I

    invoke-static {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->access$902(Lcom/vk/core/view/SimpleVideoView;I)I

    goto :goto_2

    .line 714
    :pswitch_6
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1800(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnErrorListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 715
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v0}, Lcom/vk/core/view/SimpleVideoView;->access$1800(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnErrorListener;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v0, v1}, Lcom/vk/core/view/SimpleVideoView$OnErrorListener;->onErrorListener(I)V

    goto/16 :goto_0

    .line 666
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
