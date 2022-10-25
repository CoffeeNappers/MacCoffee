.class public interface abstract Lcom/vk/music/model/PlaylistsModel;
.super Ljava/lang/Object;
.source "PlaylistsModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/PlaylistsModel$Callback;
    }
.end annotation


# virtual methods
.method public abstract addPlaylist(Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract canAddPlaylist()Z
.end method

.method public abstract canAddPlaylist(Lcom/vk/music/dto/Playlist;)Z
    .param p1    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract canDeletePlaylist(Lcom/vk/music/dto/Playlist;)Z
    .param p1    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract canLoadMore()Z
.end method

.method public abstract deletePlaylist(Lcom/vk/music/dto/Playlist;)V
    .param p1    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract getError()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getOriginalPlaylist(Lcom/vk/music/dto/Playlist;)Lcom/vk/music/dto/Playlist;
    .param p1    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getPlaylists()Ljava/util/List;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTitle(Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract isCurrentUser()Z
.end method

.method public abstract isSelect()Z
.end method

.method public abstract loadMore()V
.end method

.method public abstract loadPlaylists()V
.end method

.method public abstract subscribe(Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract unsubscribe(Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .param p1    # Lcom/vk/music/model/PlaylistsModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
