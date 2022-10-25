.class public Lcom/vkontakte/android/audio/player/PlayerConnection;
.super Lcom/vkontakte/android/audio/utils/BoundServiceConnection;
.source "PlayerConnection.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/audio/utils/BoundServiceConnection",
        "<",
        "Lcom/vkontakte/android/audio/player/PlayerService;",
        ">;"
    }
.end annotation


# instance fields
.field private mDisconnectNeeded:Z

.field private final mListener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/player/PlayerConnectionListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;-><init>(Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;)V

    .line 15
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerConnection;->mListener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    .line 16
    return-void
.end method


# virtual methods
.method protected createBindIntent()Landroid/content/Intent;
    .locals 3

    .prologue
    .line 33
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerConnection;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    return-object v0
.end method

.method protected createStartIntent()Landroid/content/Intent;
    .locals 3

    .prologue
    .line 28
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerConnection;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    return-object v0
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 23
    invoke-super {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->finalize()V

    .line 24
    return-void
.end method

.method public getPlayer()Lcom/vkontakte/android/audio/player/Player;
    .locals 2

    .prologue
    .line 68
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerConnection;->getService()Lcom/vkontakte/android/audio/utils/BoundService;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerService;

    .line 69
    .local v0, "service":Lcom/vkontakte/android/audio/player/PlayerService;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/PlayerService;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v1

    goto :goto_0
.end method

.method public getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;
    .locals 2

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerConnection;->getService()Lcom/vkontakte/android/audio/utils/BoundService;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerService;

    .line 74
    .local v0, "service":Lcom/vkontakte/android/audio/player/PlayerService;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/PlayerService;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v1

    goto :goto_0
.end method

.method protected onConnect()V
    .locals 1

    .prologue
    .line 38
    invoke-super {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->onConnect()V

    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/PlayerConnection;->mDisconnectNeeded:Z

    .line 40
    return-void
.end method

.method protected onConnected()V
    .locals 2

    .prologue
    .line 44
    invoke-super {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->onConnected()V

    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerConnection;->mListener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    if-eqz v0, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerConnection;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerConnection;->mListener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/Player;->registerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 48
    :cond_0
    return-void
.end method

.method protected onDisconnect()V
    .locals 2

    .prologue
    .line 52
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerConnection;->mListener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    if-eqz v1, :cond_0

    .line 53
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerConnection;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 54
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v0, :cond_0

    .line 55
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerConnection;->mListener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/Player;->unregisterListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 58
    .end local v0    # "player":Lcom/vkontakte/android/audio/player/Player;
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->onDisconnect()V

    .line 59
    return-void
.end method

.method protected onDisconnected()V
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/PlayerConnection;->mDisconnectNeeded:Z

    .line 64
    invoke-super {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->onDisconnected()V

    .line 65
    return-void
.end method
