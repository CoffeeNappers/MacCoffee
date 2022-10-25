.class public interface abstract Lcom/vk/music/model/SearchResultModel$Callback;
.super Ljava/lang/Object;
.source "SearchResultModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/SearchResultModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onLoadingDone(Lcom/vk/music/model/SearchResultModel;)V
    .param p1    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingError(Lcom/vk/music/model/SearchResultModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingMoreDone(Lcom/vk/music/model/SearchResultModel;Ljava/util/List;Ljava/util/List;)V
    .param p1    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/model/SearchResultModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onLoadingMoreError(Lcom/vk/music/model/SearchResultModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onQueryChanged(Lcom/vk/music/model/SearchResultModel;)V
    .param p1    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
