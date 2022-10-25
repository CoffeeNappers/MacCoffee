.class public interface abstract Lcom/vk/music/model/SearchResultModel;
.super Ljava/lang/Object;
.source "SearchResultModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/SearchResultModel$Callback;
    }
.end annotation


# virtual methods
.method public abstract canLoadMore()Z
.end method

.method public abstract getCommunities()Ljava/util/List;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getError()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getGlobalResults()Ljava/util/List;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLocalResults()Ljava/util/List;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getPlayerModel()Lcom/vk/music/model/PlayerModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getQuery()Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getResults()Ljava/util/List;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end method

.method public abstract isLoaded()Z
.end method

.method public abstract loadMoreResults()V
.end method

.method public abstract loadResults()V
.end method

.method public abstract setQuery(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract subscribe(Lcom/vk/music/model/SearchResultModel$Callback;)V
    .param p1    # Lcom/vk/music/model/SearchResultModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract unsubscribe(Lcom/vk/music/model/SearchResultModel$Callback;)V
    .param p1    # Lcom/vk/music/model/SearchResultModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
