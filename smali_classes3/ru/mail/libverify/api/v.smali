.class public interface abstract Lru/mail/libverify/api/v;
.super Ljava/lang/Object;


# virtual methods
.method public abstract a()Landroid/os/Handler;
.end method

.method public abstract a(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
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

.method public abstract a(Lru/mail/libverify/requests/response/FetcherInfo;)V
    .param p1    # Lru/mail/libverify/requests/response/FetcherInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract a(Ljava/lang/String;)Z
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract b()Lru/mail/libverify/sms/k;
.end method

.method public abstract c()Lru/mail/libverify/sms/g;
.end method

.method public abstract d()Lru/mail/libverify/storage/o;
.end method

.method public abstract e()Ljava/util/concurrent/ExecutorService;
.end method
