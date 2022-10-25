.class public interface abstract Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;
.super Ljava/lang/Object;
.source "PlaylistSearchResultsLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onSearchResultsLoadingDone(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;)V
    .param p1    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onSearchResultsLoadingError(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onSearchResultsLoadingMoreDone(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;Lcom/vk/music/dto/PlaylistSearchResult;)V
    .param p1    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/PlaylistSearchResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onSearchResultsLoadingMoreError(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
