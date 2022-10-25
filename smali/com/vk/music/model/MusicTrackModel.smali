.class public interface abstract Lcom/vk/music/model/MusicTrackModel;
.super Ljava/lang/Object;
.source "MusicTrackModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/MusicTrackModel$Callback;
    }
.end annotation


# virtual methods
.method public abstract addAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract canAddAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract canRemoveAudio(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract clearDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)V
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract download(Lcom/vkontakte/android/audio/MusicTrack;Landroid/content/Context;)V
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract getTarget()Lcom/vkontakte/android/audio/MusicTrack;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract isDownloaded(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract removeAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract setTarget(Lcom/vkontakte/android/audio/MusicTrack;)V
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract subscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V
    .param p1    # Lcom/vk/music/model/MusicTrackModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract unsubscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V
    .param p1    # Lcom/vk/music/model/MusicTrackModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
