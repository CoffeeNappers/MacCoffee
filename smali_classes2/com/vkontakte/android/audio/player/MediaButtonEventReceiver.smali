.class public Lcom/vkontakte/android/audio/player/MediaButtonEventReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MediaButtonEventReceiver.java"


# static fields
.field private static mLastHeadsetHook:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static checkHeadsetHookPlayNext()Z
    .locals 6

    .prologue
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/vkontakte/android/audio/player/MediaButtonEventReceiver;->mLastHeadsetHook:J

    const-wide/16 v4, 0x1f4

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 16
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/vkontakte/android/audio/player/MediaButtonEventReceiver;->mLastHeadsetHook:J

    .line 18
    const/4 v0, 0x0

    .line 23
    :goto_0
    return v0

    .line 21
    :cond_0
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/vkontakte/android/audio/player/MediaButtonEventReceiver;->mLastHeadsetHook:J

    .line 23
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 28
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 30
    .local v0, "action":Ljava/lang/String;
    const/4 v2, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 70
    :cond_1
    :goto_1
    return-void

    .line 30
    :sswitch_0
    const-string/jumbo v3, "android.intent.action.MEDIA_BUTTON"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v3, "android.media.AUDIO_BECOMING_NOISY"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    .line 32
    :pswitch_0
    const-string/jumbo v2, "android.intent.extra.KEY_EVENT"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/view/KeyEvent;

    .line 33
    .local v1, "keyEvent":Landroid/view/KeyEvent;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_1

    .line 34
    invoke-virtual {v1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_1

    goto :goto_1

    .line 39
    :sswitch_2
    invoke-static {}, Lcom/vkontakte/android/audio/player/MediaButtonEventReceiver;->checkHeadsetHookPlayNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 40
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->next()V

    goto :goto_1

    .line 36
    :sswitch_3
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->toggleResumePause()V

    goto :goto_1

    .line 42
    :cond_2
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->toggleResumePause()V

    goto :goto_1

    .line 45
    :sswitch_4
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->resume()V

    goto :goto_1

    .line 48
    :sswitch_5
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->pause()V

    goto :goto_1

    .line 51
    :sswitch_6
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->next()V

    goto :goto_1

    .line 54
    :sswitch_7
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->prev()V

    goto :goto_1

    .line 57
    :sswitch_8
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->stop()V

    goto :goto_1

    .line 60
    :sswitch_9
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->rewind()V

    goto :goto_1

    .line 67
    .end local v1    # "keyEvent":Landroid/view/KeyEvent;
    :pswitch_1
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->pause()V

    goto :goto_1

    .line 30
    nop

    :sswitch_data_0
    .sparse-switch
        -0x20bccddb -> :sswitch_1
        0x7708a552 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 34
    :sswitch_data_1
    .sparse-switch
        0x4f -> :sswitch_2
        0x55 -> :sswitch_3
        0x56 -> :sswitch_8
        0x57 -> :sswitch_6
        0x58 -> :sswitch_7
        0x59 -> :sswitch_9
        0x7e -> :sswitch_4
        0x7f -> :sswitch_5
    .end sparse-switch
.end method
