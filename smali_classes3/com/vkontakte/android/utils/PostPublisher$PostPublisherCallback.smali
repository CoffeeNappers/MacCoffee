.class public interface abstract Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;
.super Ljava/lang/Object;
.source "PostPublisher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/utils/PostPublisher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PostPublisherCallback"
.end annotation


# virtual methods
.method public abstract onError(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .param p1    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract onSuccess()V
.end method
