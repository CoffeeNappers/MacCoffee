.class public interface abstract Lcom/vk/music/model/MusicModel$Callback;
.super Ljava/lang/Object;
.source "MusicModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/MusicModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onAudioLoadingDone(Lcom/vk/music/model/MusicModel;Ljava/util/List;)V
    .param p1    # Lcom/vk/music/model/MusicModel;
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
            "Lcom/vk/music/model/MusicModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onAudioLoadingError(Lcom/vk/music/model/MusicModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingDone(Lcom/vk/music/model/MusicModel;)V
    .param p1    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingError(Lcom/vk/music/model/MusicModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlaylistChanged(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlaylistCreated(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlaylistRemoved(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
