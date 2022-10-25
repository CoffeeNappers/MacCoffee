.class final Lcom/my/target/core/ui/InstreamAdVideoPlayer$1;
.super Ljava/lang/Object;
.source "InstreamAdVideoPlayer.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/ui/InstreamAdVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;


# direct methods
.method constructor <init>(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)V
    .locals 0

    .prologue
    .line 22
    iput-object p1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$1;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAudioFocusChange(I)V
    .locals 1

    .prologue
    .line 25
    packed-switch p1, :pswitch_data_0

    .line 43
    :goto_0
    :pswitch_0
    return-void

    .line 29
    :pswitch_1
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$1;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-virtual {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->pauseAdVideo()V

    .line 30
    const-string/jumbo v0, "audiofocus loss, pausing"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 35
    :pswitch_2
    const-string/jumbo v0, "audiofocus gain, unmuting"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 36
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$1;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$000(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/core/ui/views/video/VideoTextureView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->h()V

    goto :goto_0

    .line 39
    :pswitch_3
    const-string/jumbo v0, "audiofocus loss can duck, set volume to 0.3"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 40
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$1;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$000(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/core/ui/views/video/VideoTextureView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->j()V

    goto :goto_0

    .line 25
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
