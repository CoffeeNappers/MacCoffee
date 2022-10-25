.class public interface abstract Lcom/vkontakte/android/media/VideoPools$PlayerContext;
.super Ljava/lang/Object;
.source "VideoPools.java"

# interfaces
.implements Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/VideoPools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PlayerContext"
.end annotation


# virtual methods
.method public abstract onPause(Landroid/app/Activity;)V
.end method

.method public abstract onPlayerAttached(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
.end method

.method public abstract onPlayerDetached(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
.end method

.method public abstract onResume(Landroid/app/Activity;)V
.end method
