.class Lcom/vk/music/model/PlaylistModelImpl$8;
.super Ljava/lang/Object;
.source "PlaylistModelImpl.java"

# interfaces
.implements Lcom/vk/music/model/MusicTrackModel$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/PlaylistModelImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/PlaylistModelImpl;


# direct methods
.method constructor <init>(Lcom/vk/music/model/PlaylistModelImpl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/PlaylistModelImpl;

    .prologue
    .line 455
    iput-object p1, p0, Lcom/vk/music/model/PlaylistModelImpl$8;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioAdditionDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 457
    return-void
.end method

.method public onAudioAdditionError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 460
    return-void
.end method

.method public onAudioAdditionToPlaylistDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 469
    return-void
.end method

.method public onAudioAdditionToPlaylistError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 472
    return-void
.end method

.method public onAudioRemovalDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 463
    return-void
.end method

.method public onAudioRemovalError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 466
    return-void
.end method

.method public onAudioRemovalFromPlaylistDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vk/music/dto/Playlist;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 476
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$8;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-virtual {v0}, Lcom/vk/music/model/PlaylistModelImpl;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/vk/music/dto/Playlist;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$8;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v0, v0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 477
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$8;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-virtual {v0, p2}, Lcom/vk/music/model/PlaylistModelImpl;->setPlaylist(Lcom/vk/music/dto/Playlist;)V

    .line 478
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$8;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v0, v0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 480
    :cond_0
    return-void
.end method

.method public onAudioRemovalFromPlaylistError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 483
    return-void
.end method
