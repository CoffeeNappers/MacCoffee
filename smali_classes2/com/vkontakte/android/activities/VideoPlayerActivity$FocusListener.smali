.class Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FocusListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V
    .locals 0

    .prologue
    .line 1295
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Lcom/vkontakte/android/activities/VideoPlayerActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;
    .param p2, "x1"    # Lcom/vkontakte/android/activities/VideoPlayerActivity$1;

    .prologue
    .line 1295
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 2
    .param p1, "focusChange"    # I

    .prologue
    .line 1298
    packed-switch p1, :pswitch_data_0

    .line 1320
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 1300
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_1

    .line 1301
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setVolume(F)V

    .line 1303
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->play(Z)V

    goto :goto_0

    .line 1307
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_2

    .line 1308
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setVolume(F)V

    .line 1310
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->pause()V

    goto :goto_0

    .line 1313
    :pswitch_3
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    .line 1314
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    const v1, 0x3e4ccccd    # 0.2f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setVolume(F)V

    goto :goto_0

    .line 1298
    nop

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
