.class public interface abstract Lcom/vkontakte/android/media/AutoPlay;
.super Ljava/lang/Object;
.source "AutoPlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/media/AutoPlay$Type;,
        Lcom/vkontakte/android/media/AutoPlay$Listener;
    }
.end annotation


# virtual methods
.method public abstract canAutoPlay()Z
.end method

.method public abstract detachSurface()V
.end method

.method public abstract getPercentageOnScreen()F
.end method

.method public abstract getScreenCenterDistance()I
.end method

.method public abstract getType()Lcom/vkontakte/android/media/AutoPlay$Type;
.end method

.method public abstract isComplete()Z
.end method

.method public abstract isPlaying()Z
.end method

.method public abstract isPrepared()Z
.end method

.method public abstract pause()V
.end method

.method public abstract play(Z)V
.end method

.method public abstract prepare()V
.end method

.method public abstract removeListener(Lcom/vkontakte/android/media/AutoPlay$Listener;)V
.end method

.method public abstract setListener(Lcom/vkontakte/android/media/AutoPlay$Listener;)V
.end method

.method public abstract stop()V
.end method

.method public abstract waiting()V
.end method
