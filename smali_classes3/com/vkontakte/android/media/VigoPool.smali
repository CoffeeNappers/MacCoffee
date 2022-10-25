.class public Lcom/vkontakte/android/media/VigoPool;
.super Ljava/lang/Object;
.source "VigoPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/media/VigoPool$ObjectFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mMaxSize:I

.field private final mObjectFactory:Lcom/vkontakte/android/media/VigoPool$ObjectFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/media/VigoPool$ObjectFactory",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final mObjects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/media/VigoPool$ObjectFactory;I)V
    .locals 1
    .param p2, "poolSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/media/VigoPool$ObjectFactory",
            "<TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p0, "this":Lcom/vkontakte/android/media/VigoPool;, "Lcom/vkontakte/android/media/VigoPool<TT;>;"
    .local p1, "factory":Lcom/vkontakte/android/media/VigoPool$ObjectFactory;, "Lcom/vkontakte/android/media/VigoPool$ObjectFactory<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/vkontakte/android/media/VigoPool;->mObjectFactory:Lcom/vkontakte/android/media/VigoPool$ObjectFactory;

    .line 21
    iput p2, p0, Lcom/vkontakte/android/media/VigoPool;->mMaxSize:I

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoPool;->mObjects:Ljava/util/List;

    .line 23
    return-void
.end method


# virtual methods
.method public getObject()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 26
    .local p0, "this":Lcom/vkontakte/android/media/VigoPool;, "Lcom/vkontakte/android/media/VigoPool<TT;>;"
    const/4 v0, 0x0

    .line 28
    .local v0, "obj":Ljava/lang/Object;, "TT;"
    iget-object v2, p0, Lcom/vkontakte/android/media/VigoPool;->mObjects:Ljava/util/List;

    monitor-enter v2

    .line 30
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VigoPool;->mObjects:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 31
    iget-object v1, p0, Lcom/vkontakte/android/media/VigoPool;->mObjectFactory:Lcom/vkontakte/android/media/VigoPool$ObjectFactory;

    invoke-interface {v1}, Lcom/vkontakte/android/media/VigoPool$ObjectFactory;->newInstance()Ljava/lang/Object;

    move-result-object v0

    .line 36
    :goto_0
    monitor-exit v2

    return-object v0

    .line 33
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VigoPool;->mObjects:Ljava/util/List;

    iget-object v3, p0, Lcom/vkontakte/android/media/VigoPool;->mObjects:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v1, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 37
    .end local v0    # "obj":Ljava/lang/Object;, "TT;"
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setFree(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lcom/vkontakte/android/media/VigoPool;, "Lcom/vkontakte/android/media/VigoPool<TT;>;"
    .local p1, "obj":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/vkontakte/android/media/VigoPool;->mObjects:Ljava/util/List;

    monitor-enter v1

    .line 42
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoPool;->mObjects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v2, p0, Lcom/vkontakte/android/media/VigoPool;->mMaxSize:I

    if-ge v0, v2, :cond_0

    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoPool;->mObjects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    :cond_0
    monitor-exit v1

    .line 46
    return-void

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
