.class public interface abstract Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;
.super Ljava/lang/Object;
.source "PlaylistsLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/attach/loader/PlaylistsLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onPlaylistsLoadingDone(Lcom/vk/music/attach/loader/PlaylistsLoader;)V
    .param p1    # Lcom/vk/music/attach/loader/PlaylistsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlaylistsLoadingError(Lcom/vk/music/attach/loader/PlaylistsLoader;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/attach/loader/PlaylistsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlaylistsLoadingMoreDone(Lcom/vk/music/attach/loader/PlaylistsLoader;Ljava/util/List;)V
    .param p1    # Lcom/vk/music/attach/loader/PlaylistsLoader;
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
            "Lcom/vk/music/attach/loader/PlaylistsLoader;",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onPlaylistsLoadingMoreError(Lcom/vk/music/attach/loader/PlaylistsLoader;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/attach/loader/PlaylistsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
