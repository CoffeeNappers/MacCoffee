.class Lcom/vk/music/model/MusicTrackModelImpl$2;
.super Ljava/lang/Object;
.source "MusicTrackModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/MusicTrackModelImpl;->removeMusicFromPlaylist(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/MusicTrackModelImpl;

.field final synthetic val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

.field final synthetic val$playlist:Lcom/vk/music/dto/Playlist;


# direct methods
.method constructor <init>(Lcom/vk/music/model/MusicTrackModelImpl;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/MusicTrackModelImpl;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    iput-object p2, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iput-object p3, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->val$playlist:Lcom/vk/music/dto/Playlist;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/MusicTrackModelImpl;->access$300(Lcom/vk/music/model/MusicTrackModelImpl;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v2, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->val$playlist:Lcom/vk/music/dto/Playlist;

    invoke-static {v1, v2}, Lcom/vk/music/model/MusicTrackModelImpl;->access$200(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "vk"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .line 132
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/MusicTrackModelImpl$2;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicTrackModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 133
    return-void
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/MusicTrackModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/MusicTrackModel$Callback;

    .prologue
    .line 132
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/MusicTrackModel$Callback;->onAudioRemovalFromPlaylistError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/model/MusicTrackModel$Callback;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "callback"    # Lcom/vk/music/model/MusicTrackModel$Callback;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-interface {p3, v0, v1, p2}, Lcom/vk/music/model/MusicTrackModel$Callback;->onAudioRemovalFromPlaylistDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vk/music/dto/Playlist;Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;

    .prologue
    .line 124
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/MusicTrackModelImpl;->access$300(Lcom/vk/music/model/MusicTrackModelImpl;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v2, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->val$playlist:Lcom/vk/music/dto/Playlist;

    invoke-static {v1, v2}, Lcom/vk/music/model/MusicTrackModelImpl;->access$200(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$2;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-static {p0, p1, v1}, Lcom/vk/music/model/MusicTrackModelImpl$2$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/MusicTrackModelImpl$2;Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicTrackModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 126
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 121
    check-cast p1, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl$2;->success(Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;)V

    return-void
.end method
