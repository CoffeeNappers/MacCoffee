.class Lcom/vkontakte/android/activities/VideoPlayerActivity$11;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->createUI(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 281
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 285
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 289
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    .line 290
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/AbsVideoPlayer;->userStartSeeking()V

    .line 292
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->access$402(Lcom/vkontakte/android/activities/VideoPlayerActivity;Z)Z

    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->cancelHideUI()V

    .line 294
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 3
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 298
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, v1, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v1, :cond_0

    .line 299
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, v1, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->userStopSeeking()V

    .line 300
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    .line 301
    .local v0, "position":I
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-static {v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->access$100(Lcom/vkontakte/android/activities/VideoPlayerActivity;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 302
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, v1, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer;->seek(I)V

    .line 303
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updateTimings(I)V

    .line 308
    .end local v0    # "position":I
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->access$402(Lcom/vkontakte/android/activities/VideoPlayerActivity;Z)Z

    .line 309
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getHideDelay()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->hideUIDelayed(I)V

    .line 310
    return-void

    .line 305
    .restart local v0    # "position":I
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->replay(I)V

    goto :goto_0
.end method
