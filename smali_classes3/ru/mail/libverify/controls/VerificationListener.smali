.class public interface abstract Lru/mail/libverify/controls/VerificationListener;
.super Ljava/lang/Object;


# virtual methods
.method public abstract onCompleted(Ljava/lang/String;Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V
.end method

.method public abstract onIvrCallError(Lru/mail/libverify/api/VerificationApi$FailReason;)V
.end method

.method public abstract onPhoneNumberReceived(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onProgress(Z)V
.end method

.method public abstract onSmsCodeReceived(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onStateChanged(Lru/mail/libverify/controls/VerificationController$State;)V
.end method
