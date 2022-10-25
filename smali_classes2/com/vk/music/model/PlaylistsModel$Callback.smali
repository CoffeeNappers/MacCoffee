.class public interface abstract Lcom/vk/music/model/PlaylistsModel$Callback;
.super Ljava/lang/Object;
.source "PlaylistsModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/PlaylistsModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onAdditionDone(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onAdditionError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onDeletionDone(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onDeletionError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingDone(Lcom/vk/music/model/PlaylistsModel;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onMoreLoadingDone(Lcom/vk/music/model/PlaylistsModel;Ljava/util/List;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
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
            "Lcom/vk/music/model/PlaylistsModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onMoreLoadingError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlaylistChanged(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlaylistCreated(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlaylistRemoved(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
