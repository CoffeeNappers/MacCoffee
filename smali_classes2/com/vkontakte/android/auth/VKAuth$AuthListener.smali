.class public interface abstract Lcom/vkontakte/android/auth/VKAuth$AuthListener;
.super Ljava/lang/Object;
.source "VKAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/auth/VKAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "AuthListener"
.end annotation


# virtual methods
.method public abstract onAuthFinish(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
    .param p2    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract onAuthNeedValidation(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
.end method

.method public abstract onAuthStart()V
.end method
