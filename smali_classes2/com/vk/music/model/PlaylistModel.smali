.class public interface abstract Lcom/vk/music/model/PlaylistModel;
.super Ljava/lang/Object;
.source "PlaylistModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/PlaylistModel$Callback;
    }
.end annotation


# virtual methods
.method public abstract attachMusic(Ljava/util/List;)V
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract canLoadMore()Z
.end method

.method public abstract canShare()Z
.end method

.method public abstract delete()V
.end method

.method public abstract getError()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getMusicTracks()Ljava/util/List;
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

.method public abstract getOffset()I
.end method

.method public abstract getOwner()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getOwnerId()I
.end method

.method public abstract getPlayerModel()Lcom/vk/music/model/PlayerModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getPlaylist()Lcom/vk/music/dto/Playlist;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract isCurrentUser()Z
.end method

.method public abstract isFollowed()Z
.end method

.method public abstract isLoaded()Z
.end method

.method public abstract load()V
.end method

.method public abstract loadAndPlayShuffleAll(Landroid/content/Context;)V
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract loadMore()V
.end method

.method public abstract subscribe(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract toggleFollowing()V
.end method

.method public abstract unsubscribe(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .param p1    # Lcom/vk/music/model/PlaylistModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
