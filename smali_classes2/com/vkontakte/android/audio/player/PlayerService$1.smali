.class final Lcom/vkontakte/android/audio/player/PlayerService$1;
.super Lcom/vkontakte/android/audio/events/StaticObservableEvent;
.source "PlayerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/PlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/audio/events/StaticObservableEvent",
        "<",
        "Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;",
        "Lcom/vkontakte/android/audio/player/PlayerService;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/vkontakte/android/audio/events/StaticObservableEvent;-><init>()V

    return-void
.end method


# virtual methods
.method protected notifyHandler(Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;Lcom/vkontakte/android/audio/player/PlayerService;Ljava/lang/Boolean;)V
    .locals 1
    .param p1, "handler"    # Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;
    .param p2, "playerService"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p3, "args"    # Ljava/lang/Boolean;

    .prologue
    .line 70
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-interface {p1, p2, v0}, Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;->onNetworkStateChanged(Lcom/vkontakte/android/audio/player/PlayerService;Z)V

    .line 71
    return-void
.end method

.method protected bridge synthetic notifyHandler(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 67
    check-cast p1, Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;

    check-cast p2, Lcom/vkontakte/android/audio/player/PlayerService;

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vkontakte/android/audio/player/PlayerService$1;->notifyHandler(Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;Lcom/vkontakte/android/audio/player/PlayerService;Ljava/lang/Boolean;)V

    return-void
.end method
