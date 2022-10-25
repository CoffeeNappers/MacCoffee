.class public abstract Lcom/vkontakte/android/audio/utils/BoundServiceConnection;
.super Ljava/lang/Object;
.source "BoundServiceConnection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;,
        Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/vkontakte/android/audio/utils/BoundService;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mConnection:Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/audio/utils/BoundServiceConnection",
            "<TT;>.MyConnection;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private final mListener:Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;

.field private mService:Lcom/vkontakte/android/audio/utils/BoundService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;

    .prologue
    .line 17
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mListener:Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;

    .line 19
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;)Lcom/vkontakte/android/audio/utils/BoundService;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/BoundServiceConnection;

    .prologue
    .line 10
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mService:Lcom/vkontakte/android/audio/utils/BoundService;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;Lcom/vkontakte/android/audio/utils/BoundService;)Lcom/vkontakte/android/audio/utils/BoundService;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/BoundServiceConnection;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/utils/BoundService;

    .prologue
    .line 10
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mService:Lcom/vkontakte/android/audio/utils/BoundService;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;)Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/BoundServiceConnection;

    .prologue
    .line 10
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mListener:Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;

    return-object v0
.end method


# virtual methods
.method public connect(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mContext:Landroid/content/Context;

    if-nez v1, :cond_1

    .line 39
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mContext:Landroid/content/Context;

    .line 40
    new-instance v1, Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;-><init>(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;Lcom/vkontakte/android/audio/utils/BoundServiceConnection$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mConnection:Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;

    .line 41
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->onConnect()V

    .line 42
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->createStartIntent()Landroid/content/Intent;

    move-result-object v0

    .line 43
    .local v0, "startIntent":Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 44
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 45
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->createBindIntent()Landroid/content/Intent;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mConnection:Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 47
    .end local v0    # "startIntent":Landroid/content/Intent;
    :cond_1
    return-void
.end method

.method protected abstract createBindIntent()Landroid/content/Intent;
.end method

.method protected abstract createStartIntent()Landroid/content/Intent;
.end method

.method public disconnect()V
    .locals 3

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    const/4 v2, 0x0

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_1

    .line 51
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->onDisconnect()V

    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mService:Lcom/vkontakte/android/audio/utils/BoundService;

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mService:Lcom/vkontakte/android/audio/utils/BoundService;

    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mConnection:Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/utils/BoundService;->unregisterOnServiceLoadedListener(Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;)V

    .line 54
    iput-object v2, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mService:Lcom/vkontakte/android/audio/utils/BoundService;

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mConnection:Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 57
    iput-object v2, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mConnection:Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;

    .line 58
    iput-object v2, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mContext:Landroid/content/Context;

    .line 59
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->onDisconnected()V

    .line 61
    :cond_1
    return-void
.end method

.method protected finalize()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mConnection:Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;

    if-eqz v0, :cond_0

    .line 24
    const-string/jumbo v0, "BoundServiceConnection"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Disconnect has not been called on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 27
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 30
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method protected getService()Lcom/vkontakte/android/audio/utils/BoundService;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mService:Lcom/vkontakte/android/audio/utils/BoundService;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 64
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mService:Lcom/vkontakte/android/audio/utils/BoundService;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->mService:Lcom/vkontakte/android/audio/utils/BoundService;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/BoundService;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onConnect()V
    .locals 0

    .prologue
    .line 68
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    return-void
.end method

.method protected onConnected()V
    .locals 0

    .prologue
    .line 71
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    return-void
.end method

.method protected onDisconnect()V
    .locals 0

    .prologue
    .line 74
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    return-void
.end method

.method protected onDisconnected()V
    .locals 0

    .prologue
    .line 77
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>;"
    return-void
.end method
