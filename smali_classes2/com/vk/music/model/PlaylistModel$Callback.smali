.class public interface abstract Lcom/vk/music/model/PlaylistModel$Callback;
.super Ljava/lang/Object;
.source "PlaylistModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/PlaylistModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onAttachingDone(Lcom/vk/music/model/PlaylistModel;Ljava/util/List;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/model/PlaylistModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onAttachingError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onDeletionDone(Lcom/vk/music/model/PlaylistModel;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onDeletionError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onFollowingTogglingDone(Lcom/vk/music/model/PlaylistModel;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onFollowingTogglingError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingDone(Lcom/vk/music/model/PlaylistModel;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingMoreDone(Lcom/vk/music/model/PlaylistModel;Ljava/util/List;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/model/PlaylistModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onLoadingMoreError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlaylistChanged(Lcom/vk/music/model/PlaylistModel;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
