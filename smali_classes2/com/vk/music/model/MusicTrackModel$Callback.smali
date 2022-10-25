.class public interface abstract Lcom/vk/music/model/MusicTrackModel$Callback;
.super Ljava/lang/Object;
.source "MusicTrackModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/MusicTrackModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onAudioAdditionDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vkontakte/android/audio/MusicTrack;)V
    .param p1    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onAudioAdditionError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onAudioAdditionToPlaylistDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onAudioAdditionToPlaylistError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onAudioRemovalDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vkontakte/android/audio/MusicTrack;)V
    .param p1    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onAudioRemovalError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onAudioRemovalFromPlaylistDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vk/music/dto/Playlist;Lcom/vkontakte/android/audio/MusicTrack;)V
    .param p1    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onAudioRemovalFromPlaylistError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
