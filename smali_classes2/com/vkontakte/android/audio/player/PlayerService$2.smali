.class Lcom/vkontakte/android/audio/player/PlayerService$2;
.super Landroid/content/BroadcastReceiver;
.source "PlayerService.java"


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
    .line 73
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService$2;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 76
    invoke-static {p1}, Lcom/vkontakte/android/audio/utils/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    .line 77
    .local v0, "online":Z
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerService;->access$100()Lcom/vkontakte/android/audio/events/StaticObservableEvent;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/PlayerService$2;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/audio/events/StaticObservableEvent;->fire(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    return-void
.end method
