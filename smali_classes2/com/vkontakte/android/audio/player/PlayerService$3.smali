.class Lcom/vkontakte/android/audio/player/PlayerService$3;
.super Ljava/lang/Object;
.source "PlayerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/PlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/PlayerService;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/audio/player/PlayerService;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService$3;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x3c

    const-wide/16 v4, 0x0

    const/4 v8, 0x1

    .line 181
    invoke-static {p0}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 183
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getAudioBackgroundLimit()I

    move-result v0

    .line 184
    .local v0, "disableTime":I
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$3;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$300(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v1

    if-nez v1, :cond_1

    move-wide v2, v4

    .line 185
    .local v2, "playedTimeSec":J
    :goto_0
    cmp-long v1, v2, v4

    if-eqz v1, :cond_2

    div-long v4, v2, v10

    int-to-long v6, v0

    cmp-long v1, v4, v6

    if-ltz v1, :cond_2

    .line 186
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$3;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$300(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 187
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$3;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$300(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/Player;->pause()Z

    .line 188
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$3;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$700(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;

    move-result-object v1

    iput-boolean v8, v1, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->wasPaused:Z

    .line 189
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$3;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$700(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, v1, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;->timeWasPaused:J

    .line 194
    :cond_0
    :goto_1
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v4

    div-long v4, v2, v10

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v1, v8

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 195
    return-void

    .line 184
    .end local v2    # "playedTimeSec":J
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$3;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$300(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/Player;->getTodayListeningTimeSec()J

    move-result-wide v2

    goto :goto_0

    .line 192
    .restart local v2    # "playedTimeSec":J
    :cond_2
    const-wide/16 v4, 0x7d0

    invoke-static {p0, v4, v5}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_1
.end method
