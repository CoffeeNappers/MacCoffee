.class Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PlayerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/PlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScreenStateReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/PlayerService;

.field timeWasPaused:J

.field wasPaused:Z


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;)V
    .locals 2

    .prologue
    .line 119
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 121
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->wasPaused:Z

    .line 122
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->timeWasPaused:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/PlayerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/PlayerService$1;

    .prologue
    .line 119
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 126
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/PlayerService;->access$300(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v1

    .line 127
    .local v1, "player":Lcom/vkontakte/android/audio/player/Player;
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v3, -0x1

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 166
    :cond_1
    :goto_1
    return-void

    .line 127
    :sswitch_0
    const-string/jumbo v7, "android.intent.action.SCREEN_ON"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move v3, v4

    goto :goto_0

    :sswitch_1
    const-string/jumbo v7, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move v3, v5

    goto :goto_0

    .line 129
    :pswitch_0
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/PlayerService;->access$400(Lcom/vkontakte/android/audio/player/PlayerService;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 131
    if-eqz v1, :cond_1

    iget-boolean v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->wasPaused:Z

    if-eqz v3, :cond_1

    .line 132
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->timeWasPaused:J

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x2710

    cmp-long v3, v6, v8

    if-gez v3, :cond_2

    .line 133
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/Player;->resume()Z

    .line 136
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->timeWasPaused:J

    sub-long/2addr v6, v8

    const-wide/32 v8, 0xea60

    cmp-long v3, v6, v8

    if-gez v3, :cond_3

    .line 137
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v3, v5}, Lcom/vkontakte/android/audio/player/PlayerService;->access$502(Lcom/vkontakte/android/audio/player/PlayerService;Z)Z

    .line 138
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/PlayerService;->access$600(Lcom/vkontakte/android/audio/player/PlayerService;)V

    .line 140
    :cond_3
    iput-boolean v4, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->wasPaused:Z

    goto :goto_1

    .line 144
    :pswitch_1
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/PlayerService;->access$400(Lcom/vkontakte/android/audio/player/PlayerService;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 146
    if-nez v1, :cond_4

    const/4 v2, 0x0

    .line 147
    .local v2, "state":Lcom/vkontakte/android/audio/player/PlayerState;
    :goto_2
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 148
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription()Z

    move-result v3

    if-nez v3, :cond_7

    if-eqz v2, :cond_7

    .line 149
    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 151
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getAudioBackgroundLimit()I

    move-result v0

    .line 152
    .local v0, "disableTime":I
    if-nez v0, :cond_5

    .line 153
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/Player;->pause()Z

    .line 154
    iput-boolean v5, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->wasPaused:Z

    .line 155
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->timeWasPaused:J

    goto/16 :goto_1

    .line 146
    .end local v0    # "disableTime":I
    .end local v2    # "state":Lcom/vkontakte/android/audio/player/PlayerState;
    :cond_4
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v2

    goto :goto_2

    .line 156
    .restart local v0    # "disableTime":I
    .restart local v2    # "state":Lcom/vkontakte/android/audio/player/PlayerState;
    :cond_5
    if-lez v0, :cond_6

    const/16 v3, 0x5a0

    if-ge v0, v3, :cond_6

    .line 157
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/PlayerService;->access$400(Lcom/vkontakte/android/audio/player/PlayerService;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    goto/16 :goto_1

    .line 159
    :cond_6
    iput-boolean v4, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->wasPaused:Z

    goto/16 :goto_1

    .line 162
    .end local v0    # "disableTime":I
    :cond_7
    iput-boolean v4, p0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->wasPaused:Z

    goto/16 :goto_1

    .line 127
    nop

    :sswitch_data_0
    .sparse-switch
        -0x7ed8ea7f -> :sswitch_1
        -0x56ac2893 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
