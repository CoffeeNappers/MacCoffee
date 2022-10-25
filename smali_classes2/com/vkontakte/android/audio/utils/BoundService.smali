.class public abstract Lcom/vkontakte/android/audio/utils/BoundService;
.super Landroid/app/Service;
.source "BoundService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/utils/BoundService$Binder;,
        Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;
    }
.end annotation


# instance fields
.field private mBound:Z

.field private mOnServiceLoadedListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public isBound()Z
    .locals 1

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mBound:Z

    return v0
.end method

.method public isLoaded()Z
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mOnServiceLoadedListeners:Ljava/util/Set;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loadFinished()V
    .locals 4

    .prologue
    .line 78
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/BoundService;->isLoaded()Z

    move-result v2

    if-nez v2, :cond_0

    .line 79
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mOnServiceLoadedListeners:Ljava/util/Set;

    .line 80
    .local v1, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;>;"
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mOnServiceLoadedListeners:Ljava/util/Set;

    .line 81
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;

    .line 82
    .local v0, "listener":Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;
    invoke-interface {v0}, Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;->onServiceLoaded()V

    goto :goto_0

    .line 84
    .end local v0    # "listener":Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;
    .end local v1    # "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;>;"
    :cond_0
    return-void
.end method

.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mBound:Z

    .line 32
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/utils/BoundService;->onBound(Landroid/content/Intent;)V

    .line 34
    new-instance v0, Lcom/vkontakte/android/audio/utils/BoundService$Binder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/utils/BoundService$Binder;-><init>(Lcom/vkontakte/android/audio/utils/BoundService;)V

    return-object v0
.end method

.method public onBound(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 54
    return-void
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 17
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 19
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mOnServiceLoadedListeners:Ljava/util/Set;

    .line 20
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mOnServiceLoadedListeners:Ljava/util/Set;

    .line 26
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 27
    return-void
.end method

.method public final onRebind(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 39
    invoke-super {p0, p1}, Landroid/app/Service;->onRebind(Landroid/content/Intent;)V

    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mBound:Z

    .line 42
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/utils/BoundService;->onBound(Landroid/content/Intent;)V

    .line 43
    return-void
.end method

.method public final onUnbind(Landroid/content/Intent;)Z
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mBound:Z

    .line 48
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/utils/BoundService;->onUnbound(Landroid/content/Intent;)V

    .line 50
    const/4 v0, 0x1

    return v0
.end method

.method public onUnbound(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 57
    return-void
.end method

.method public registerOnServiceLoadedListener(Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;

    .prologue
    .line 60
    if-eqz p1, :cond_0

    .line 61
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/BoundService;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 62
    invoke-interface {p1}, Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;->onServiceLoaded()V

    .line 66
    :cond_0
    :goto_0
    return-void

    .line 64
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mOnServiceLoadedListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public unregisterOnServiceLoadedListener(Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;

    .prologue
    .line 69
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/BoundService;->isLoaded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundService;->mOnServiceLoadedListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 71
    :cond_0
    return-void
.end method
