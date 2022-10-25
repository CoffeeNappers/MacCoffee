.class public abstract Lcom/vk/music/model/ObservableModel;
.super Ljava/lang/Object;
.source "ObservableModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/ObservableModel$Notification;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Observer:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vk/music/model/ActiveModel;"
    }
.end annotation


# instance fields
.field private handler:Landroid/os/Handler;

.field private observers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TObserver;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 14
    .local p0, "this":Lcom/vk/music/model/ObservableModel;, "Lcom/vk/music/model/ObservableModel<TObserver;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/music/model/ObservableModel;->handler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public clearCallbacks()V
    .locals 1

    .prologue
    .line 35
    .local p0, "this":Lcom/vk/music/model/ObservableModel;, "Lcom/vk/music/model/ObservableModel<TObserver;>;"
    iget-object v0, p0, Lcom/vk/music/model/ObservableModel;->observers:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 36
    iget-object v0, p0, Lcom/vk/music/model/ObservableModel;->observers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 38
    :cond_0
    return-void
.end method

.method synthetic lambda$notifyObservers$0(Lcom/vk/music/model/ObservableModel$Notification;)V
    .locals 3
    .param p1, "notification"    # Lcom/vk/music/model/ObservableModel$Notification;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 47
    .local p0, "this":Lcom/vk/music/model/ObservableModel;, "Lcom/vk/music/model/ObservableModel<TObserver;>;"
    iget-object v1, p0, Lcom/vk/music/model/ObservableModel;->observers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 48
    .local v0, "observer":Ljava/lang/Object;, "TObserver;"
    invoke-interface {p1, v0}, Lcom/vk/music/model/ObservableModel$Notification;->accept(Ljava/lang/Object;)V

    goto :goto_0

    .line 50
    .end local v0    # "observer":Ljava/lang/Object;, "TObserver;"
    :cond_0
    return-void
.end method

.method protected notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V
    .locals 2
    .param p1    # Lcom/vk/music/model/ObservableModel$Notification;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/model/ObservableModel$Notification",
            "<TObserver;>;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lcom/vk/music/model/ObservableModel;, "Lcom/vk/music/model/ObservableModel<TObserver;>;"
    .local p1, "notification":Lcom/vk/music/model/ObservableModel$Notification;, "Lcom/vk/music/model/ObservableModel$Notification<TObserver;>;"
    iget-object v0, p0, Lcom/vk/music/model/ObservableModel;->observers:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/vk/music/model/ObservableModel;->handler:Landroid/os/Handler;

    invoke-static {p0, p1}, Lcom/vk/music/model/ObservableModel$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/ObservableModel;Lcom/vk/music/model/ObservableModel$Notification;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 52
    :cond_0
    return-void
.end method

.method public subscribe(Ljava/lang/Object;)V
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TObserver;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p0, "this":Lcom/vk/music/model/ObservableModel;, "Lcom/vk/music/model/ObservableModel<TObserver;>;"
    .local p1, "observer":Ljava/lang/Object;, "TObserver;"
    iget-object v0, p0, Lcom/vk/music/model/ObservableModel;->observers:Ljava/util/List;

    if-nez v0, :cond_0

    .line 22
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/ObservableModel;->observers:Ljava/util/List;

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/ObservableModel;->observers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    return-void
.end method

.method public unsubscribe(Ljava/lang/Object;)V
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TObserver;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/vk/music/model/ObservableModel;, "Lcom/vk/music/model/ObservableModel<TObserver;>;"
    .local p1, "observer":Ljava/lang/Object;, "TObserver;"
    iget-object v0, p0, Lcom/vk/music/model/ObservableModel;->observers:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/vk/music/model/ObservableModel;->observers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 31
    :cond_0
    return-void
.end method
