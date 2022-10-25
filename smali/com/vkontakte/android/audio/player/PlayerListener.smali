.class public interface abstract Lcom/vkontakte/android/audio/player/PlayerListener;
.super Ljava/lang/Object;
.source "PlayerListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;
    }
.end annotation


# virtual methods
.method public abstract onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
.end method

.method public abstract onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
.end method

.method public abstract onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
.end method

.method public abstract onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
.end method

.method public abstract onTrackListChanged(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation
.end method
