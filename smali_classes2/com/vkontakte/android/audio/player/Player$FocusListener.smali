.class Lcom/vkontakte/android/audio/player/Player$FocusListener;
.super Ljava/lang/Object;
.source "Player.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/Player;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FocusListener"
.end annotation


# instance fields
.field private mPaused:Z

.field playResumeRunnable:Ljava/lang/Runnable;

.field final synthetic this$0:Lcom/vkontakte/android/audio/player/Player;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 1

    .prologue
    .line 873
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 876
    new-instance v0, Lcom/vkontakte/android/audio/player/Player$FocusListener$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/player/Player$FocusListener$1;-><init>(Lcom/vkontakte/android/audio/player/Player$FocusListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->playResumeRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/Player;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/Player$1;

    .prologue
    .line 873
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/Player$FocusListener;-><init>(Lcom/vkontakte/android/audio/player/Player;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/audio/player/Player$FocusListener;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player$FocusListener;

    .prologue
    .line 873
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->mPaused:Z

    return v0
.end method

.method static synthetic access$1702(Lcom/vkontakte/android/audio/player/Player$FocusListener;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player$FocusListener;
    .param p1, "x1"    # Z

    .prologue
    .line 873
    iput-boolean p1, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->mPaused:Z

    return p1
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 5
    .param p1, "focusChange"    # I

    .prologue
    const/4 v1, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 890
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1800(Lcom/vkontakte/android/audio/player/Player;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 891
    packed-switch p1, :pswitch_data_0

    .line 907
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 893
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1900(Lcom/vkontakte/android/audio/player/Player;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->playResumeRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 897
    :pswitch_2
    new-array v0, v1, [Ljava/lang/Object;

    const-string/jumbo v1, "PlayerService"

    aput-object v1, v0, v2

    const-string/jumbo v1, "Player"

    aput-object v1, v0, v3

    const-string/jumbo v1, "Audio focus loss"

    aput-object v1, v0, v4

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 898
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1900(Lcom/vkontakte/android/audio/player/Player;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->playResumeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 899
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->pause()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->mPaused:Z

    goto :goto_0

    .line 902
    :pswitch_3
    new-array v0, v1, [Ljava/lang/Object;

    const-string/jumbo v1, "PlayerService"

    aput-object v1, v0, v2

    const-string/jumbo v1, "Player"

    aput-object v1, v0, v3

    const-string/jumbo v1, "Audio focus loss can duck"

    aput-object v1, v0, v4

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 903
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$100(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    move-result-object v0

    const v1, 0x3e4ccccd    # 0.2f

    invoke-interface {v0, v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->setVolume(F)V

    goto :goto_0

    .line 891
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

.method resetPaused()V
    .locals 1

    .prologue
    .line 910
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->mPaused:Z

    .line 911
    return-void
.end method
