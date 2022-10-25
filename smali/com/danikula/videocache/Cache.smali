.class public interface abstract Lcom/danikula/videocache/Cache;
.super Ljava/lang/Object;
.source "Cache.java"


# virtual methods
.method public abstract append([BI)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation
.end method

.method public abstract available()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation
.end method

.method public abstract close()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation
.end method

.method public abstract complete()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation
.end method

.method public abstract isCompleted()Z
.end method

.method public abstract read([BJI)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation
.end method
