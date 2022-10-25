.class public interface abstract Lcom/vk/music/model/MusicModel;
.super Ljava/lang/Object;
.source "MusicModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/MusicModel$Callback;
    }
.end annotation


# virtual methods
.method public abstract canLoadMoreAudio()Z
.end method

.method public abstract getError()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getIcon()Ljava/lang/String;
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

.method public abstract getOriginalPlaylist(Lcom/vk/music/dto/Playlist;)Lcom/vk/music/dto/Playlist;
    .param p1    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getOwnerId()I
.end method

.method public abstract getPlayerModel()Lcom/vk/music/model/PlayerModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getPlaylists()Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
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
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract hasIcon()Z
.end method

.method public abstract isCurrentUser()Z
.end method

.method public abstract isNeedLoadTitle()Z
.end method

.method public abstract loadAndPlayShuffleAll(Landroid/content/Context;)V
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract loadMoreAudio()V
.end method

.method public abstract loadPage()V
.end method

.method public abstract subscribe(Lcom/vk/music/model/MusicModel$Callback;)V
    .param p1    # Lcom/vk/music/model/MusicModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract unsubscribe(Lcom/vk/music/model/MusicModel$Callback;)V
    .param p1    # Lcom/vk/music/model/MusicModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
