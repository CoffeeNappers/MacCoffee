.class public interface abstract Lcom/vkontakte/android/media/AutoPlay$Listener;
.super Ljava/lang/Object;
.source "AutoPlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/AutoPlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract getPlayingNow()Lcom/vkontakte/android/media/AutoPlay;
.end method

.method public abstract onComplete(Lcom/vkontakte/android/media/AutoPlay;)V
.end method

.method public abstract onError(Lcom/vkontakte/android/media/AutoPlay;)V
.end method

.method public abstract onPause(Landroid/app/Activity;)V
.end method

.method public abstract onReady(Lcom/vkontakte/android/media/AutoPlay;)V
.end method

.method public abstract onResume(Landroid/app/Activity;)V
.end method

.method public abstract playPrepared(Lcom/vkontakte/android/media/AutoPlay;)V
.end method
