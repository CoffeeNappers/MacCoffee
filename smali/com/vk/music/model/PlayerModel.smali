.class public interface abstract Lcom/vk/music/model/PlayerModel;
.super Ljava/lang/Object;
.source "PlayerModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/PlayerModel$Callback;
    }
.end annotation


# virtual methods
.method public abstract addToPlayNext(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract getPlayingTrack()Lcom/vkontakte/android/audio/MusicTrack;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract isPlayerPlaying()Z
.end method

.method public abstract loadAndPlayTheSame(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract subscribe(Lcom/vk/music/model/PlayerModel$Callback;)V
    .param p1    # Lcom/vk/music/model/PlayerModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;Lcom/vkontakte/android/audio/player/PlayerRefer;)V
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;",
            "Lcom/vkontakte/android/audio/player/PlayerRefer;",
            ")V"
        }
    .end annotation
.end method

.method public abstract unsubscribe(Lcom/vk/music/model/PlayerModel$Callback;)V
    .param p1    # Lcom/vk/music/model/PlayerModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
