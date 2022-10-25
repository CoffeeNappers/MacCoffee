.class Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;
.super Landroid/os/Handler;
.source "AbsVideoPlayer.java"

# interfaces
.implements Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/AbsVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "UiHandler"
.end annotation


# static fields
.field static final MESSAGE_END_OF_BUFFER:I = 0x5

.field static final MESSAGE_ERROR:I = 0x6

.field static final MESSAGE_FIRST_FRAME:I = 0x7

.field static final MESSAGE_PLAYBACK_COMPLETE:I = 0x2

.field static final MESSAGE_PLAYBACK_RESUMED:I = 0x1

.field static final MESSAGE_UPDATE_BUFFERED:I = 0x4

.field static final MESSAGE_UPDATE_POSITION:I = 0x3


# instance fields
.field private listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

.field private rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 190
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 191
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 261
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/media/AbsVideoPlayer;

    .line 262
    .local v0, "obj":Lcom/vkontakte/android/media/AbsVideoPlayer;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    if-eqz v1, :cond_0

    .line 263
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 289
    :cond_0
    :goto_0
    return-void

    .line 265
    :pswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;->onPlaybackResumed(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    goto :goto_0

    .line 268
    :pswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;->onPlaybackCompleted(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    goto :goto_0

    .line 271
    :pswitch_2
    iget-object v1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v1, v0, v2}, Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;->onUpdatePlaybackPosition(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    goto :goto_0

    .line 274
    :pswitch_3
    iget-object v1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v1, v0, v2}, Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;->onUpdateBuffered(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    goto :goto_0

    .line 277
    :pswitch_4
    iget-object v1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;->onEndOfBuffer(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    goto :goto_0

    .line 280
    :pswitch_5
    iget-object v1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v1, v0, v2}, Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;->onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    goto :goto_0

    .line 283
    :pswitch_6
    iget-object v1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;->onRenderedFirstFrame(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    goto :goto_0

    .line 263
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public onEndOfBuffer(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    const/4 v1, 0x0

    .line 237
    const/4 v0, 0x5

    invoke-virtual {p0, p1, v1, v1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->sendMessage(Ljava/lang/Object;III)V

    .line 238
    return-void
.end method

.method public onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "errCode"    # I

    .prologue
    .line 242
    const/4 v0, 0x0

    const/4 v1, 0x6

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->sendMessage(Ljava/lang/Object;III)V

    .line 243
    return-void
.end method

.method public onPlaybackCompleted(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    const/4 v1, 0x0

    .line 216
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v1, v1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->sendMessage(Ljava/lang/Object;III)V

    .line 217
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    if-eqz v0, :cond_0

    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;->sendViewedRanges()V

    .line 220
    :cond_0
    return-void
.end method

.method public onPlaybackResumed(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    const/4 v1, 0x0

    .line 211
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v1, v1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->sendMessage(Ljava/lang/Object;III)V

    .line 212
    return-void
.end method

.method public onPlayerReady(Lcom/vkontakte/android/media/AbsVideoPlayer;II)V
    .locals 1
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "videoW"    # I
    .param p3, "videoH"    # I

    .prologue
    .line 203
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    if-eqz v0, :cond_0

    .line 205
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;->onPlayerReady(Lcom/vkontakte/android/media/AbsVideoPlayer;II)V

    .line 207
    :cond_0
    return-void
.end method

.method public onRenderedFirstFrame(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    const/4 v1, 0x0

    .line 247
    const/4 v0, 0x7

    invoke-virtual {p0, p1, v1, v1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->sendMessage(Ljava/lang/Object;III)V

    .line 248
    return-void
.end method

.method public onUpdateBuffered(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "percent"    # I

    .prologue
    .line 232
    const/4 v0, 0x0

    const/4 v1, 0x4

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->sendMessage(Ljava/lang/Object;III)V

    .line 233
    return-void
.end method

.method public onUpdatePlaybackPosition(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "msec"    # I

    .prologue
    .line 224
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->sendMessage(Ljava/lang/Object;III)V

    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    if-eqz v0, :cond_0

    .line 226
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;->updateCurrentRange(I)V

    .line 228
    :cond_0
    return-void
.end method

.method sendMessage(Ljava/lang/Object;III)V
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "code"    # I

    .prologue
    .line 251
    invoke-virtual {p0, p4}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 252
    .local v0, "m":Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 253
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 254
    iput p3, v0, Landroid/os/Message;->arg2:I

    .line 255
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 256
    return-void
.end method

.method public setListener(Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    .prologue
    .line 194
    iput-object p1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->listener:Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    .line 195
    return-void
.end method

.method public setRangeListener(Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;)V
    .locals 0
    .param p1, "rangeListener"    # Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    .prologue
    .line 198
    iput-object p1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    .line 199
    return-void
.end method
