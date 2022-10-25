.class Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;
.super Landroid/support/v4/media/session/MediaSessionCompat$Callback;
.source "MediaSessionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/MediaSessionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SessionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)V
    .locals 0

    .prologue
    .line 134
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;->this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-direct {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/MediaSessionHelper;Lcom/vkontakte/android/audio/player/MediaSessionHelper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/MediaSessionHelper;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/MediaSessionHelper$1;

    .prologue
    .line 134
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;-><init>(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)V

    return-void
.end method


# virtual methods
.method public onMediaButtonEvent(Landroid/content/Intent;)Z
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 137
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v2, "android.intent.action.MEDIA_BUTTON"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 139
    const-string/jumbo v2, "android.intent.extra.KEY_EVENT"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/view/KeyEvent;

    .line 140
    .local v1, "keyEvent":Landroid/view/KeyEvent;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_0

    .line 141
    invoke-virtual {v1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 153
    .end local v1    # "keyEvent":Landroid/view/KeyEvent;
    :cond_0
    invoke-super {p0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onMediaButtonEvent(Landroid/content/Intent;)Z

    move-result v2

    :goto_0
    return v2

    .line 143
    .restart local v1    # "keyEvent":Landroid/view/KeyEvent;
    :pswitch_0
    invoke-static {}, Lcom/vkontakte/android/audio/player/MediaButtonEventReceiver;->checkHeadsetHookPlayNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 144
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;->this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->access$100(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/Player;->playNext()Z

    .line 148
    :goto_1
    const/4 v2, 0x1

    goto :goto_0

    .line 146
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;->this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->access$100(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/Player;->toggleResumePause()Z

    goto :goto_1

    .line 141
    nop

    :pswitch_data_0
    .packed-switch 0x4f
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;->this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->access$100(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->pause()Z

    .line 164
    return-void
.end method

.method public onPlay()V
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;->this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->access$100(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->resume()Z

    .line 159
    return-void
.end method

.method public onRewind()V
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;->this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->access$100(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->rewind()Z

    .line 179
    return-void
.end method

.method public onSeekTo(J)V
    .locals 3
    .param p1, "pos"    # J

    .prologue
    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;->this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->access$100(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    long-to-int v1, p1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/Player;->seekTo(I)V

    .line 189
    return-void
.end method

.method public onSkipToNext()V
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;->this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->access$100(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->playNext()Z

    .line 169
    return-void
.end method

.method public onSkipToPrevious()V
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;->this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->access$100(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->playPrev()Z

    .line 174
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaSessionHelper$SessionCallback;->this$0:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->access$100(Lcom/vkontakte/android/audio/player/MediaSessionHelper;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->stop()V

    .line 184
    return-void
.end method
