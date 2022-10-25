.class public interface abstract Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;
.super Ljava/lang/Object;
.source "MusicSearchResultsLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onSearchResultsLoadingDone(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;)V
    .param p1    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onSearchResultsLoadingError(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onSearchResultsLoadingMoreDone(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vk/music/dto/MusicSearchResult;)V
    .param p1    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/dto/MusicSearchResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onSearchResultsLoadingMoreError(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
