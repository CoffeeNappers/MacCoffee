.class public interface abstract Lru/mail/libverify/fetcher/e;
.super Ljava/lang/Object;


# virtual methods
.method public abstract a()Lru/mail/libverify/storage/o;
.end method

.method public abstract a(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract a(Lru/mail/libverify/gcm/ServerInfo;)V
    .param p1    # Lru/mail/libverify/gcm/ServerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract a(Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V
    .param p1    # Lru/mail/libverify/requests/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V
    .param p1    # Lru/mail/libverify/requests/response/ClientApiResponseBase;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract a(Z)V
.end method

.method public abstract b()Ljava/util/concurrent/ExecutorService;
.end method

.method public abstract b(Z)V
.end method

.method public abstract c()Ljava/util/concurrent/ExecutorService;
.end method

.method public abstract d()Landroid/os/Handler;
.end method

.method public abstract e()Z
.end method
