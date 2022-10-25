.class Lcom/vk/core/view/SimpleVideoView$FocusListener;
.super Ljava/lang/Object;
.source "SimpleVideoView.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/view/SimpleVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FocusListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/view/SimpleVideoView;


# direct methods
.method private constructor <init>(Lcom/vk/core/view/SimpleVideoView;)V
    .locals 0

    .prologue
    .line 773
    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView$FocusListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/core/view/SimpleVideoView;Lcom/vk/core/view/SimpleVideoView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p2, "x1"    # Lcom/vk/core/view/SimpleVideoView$1;

    .prologue
    .line 773
    invoke-direct {p0, p1}, Lcom/vk/core/view/SimpleVideoView$FocusListener;-><init>(Lcom/vk/core/view/SimpleVideoView;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$onAudioFocusChange$0()V
    .locals 2

    .prologue
    .line 781
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$FocusListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v1}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 782
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 783
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$FocusListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-static {v1}, Lcom/vk/core/view/SimpleVideoView;->access$1900(Lcom/vk/core/view/SimpleVideoView;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVolume(F)V

    .line 785
    :cond_0
    return-void

    .line 783
    :cond_1
    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0
.end method

.method public onAudioFocusChange(I)V
    .locals 4
    .param p1, "focusChange"    # I

    .prologue
    .line 776
    packed-switch p1, :pswitch_data_0

    .line 797
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 779
    :pswitch_1
    invoke-static {p0}, Lcom/vk/core/view/SimpleVideoView$FocusListener$$Lambda$1;->lambdaFactory$(Lcom/vk/core/view/SimpleVideoView$FocusListener;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x5dc

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0

    .line 789
    :pswitch_2
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView$FocusListener;->this$0:Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v1}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 790
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 791
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVolume(F)V

    goto :goto_0

    .line 776
    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
