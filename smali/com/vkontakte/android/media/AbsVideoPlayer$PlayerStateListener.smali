.class public interface abstract Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;
.super Ljava/lang/Object;
.source "AbsVideoPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/AbsVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PlayerStateListener"
.end annotation


# virtual methods
.method public abstract onEndOfBuffer(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
.end method

.method public abstract onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
.end method

.method public abstract onPlaybackCompleted(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
.end method

.method public abstract onPlaybackResumed(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
.end method

.method public abstract onPlayerReady(Lcom/vkontakte/android/media/AbsVideoPlayer;II)V
.end method

.method public abstract onRenderedFirstFrame(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
.end method

.method public abstract onUpdateBuffered(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
.end method

.method public abstract onUpdatePlaybackPosition(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
.end method
