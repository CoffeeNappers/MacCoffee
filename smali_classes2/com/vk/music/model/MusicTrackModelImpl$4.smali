.class Lcom/vk/music/model/MusicTrackModelImpl$4;
.super Ljava/lang/Object;
.source "MusicTrackModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/MusicTrackModelImpl;->addMusicToPlaylist(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V
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
        "Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;",
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
    .line 190
    iput-object p1, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    iput-object p2, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iput-object p3, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->val$playlist:Lcom/vk/music/dto/Playlist;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/MusicTrackModelImpl;->access$500(Lcom/vk/music/model/MusicTrackModelImpl;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v2, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->val$playlist:Lcom/vk/music/dto/Playlist;

    invoke-static {v1, v2}, Lcom/vk/music/model/MusicTrackModelImpl;->access$200(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl$4$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/MusicTrackModelImpl$4;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicTrackModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 205
    return-void
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/MusicTrackModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/MusicTrackModel$Callback;

    .prologue
    .line 204
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/MusicTrackModel$Callback;->onAudioAdditionToPlaylistError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;Lcom/vk/music/model/MusicTrackModel$Callback;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;
    .param p2, "callback"    # Lcom/vk/music/model/MusicTrackModel$Callback;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-interface {p2, v0, v1}, Lcom/vk/music/model/MusicTrackModel$Callback;->onAudioAdditionToPlaylistDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/MusicTrackModelImpl;->access$500(Lcom/vk/music/model/MusicTrackModelImpl;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v2, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->val$playlist:Lcom/vk/music/dto/Playlist;

    invoke-static {v1, v2}, Lcom/vk/music/model/MusicTrackModelImpl;->access$200(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    iget-object v0, p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;->ids:[I

    array-length v0, v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 195
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget v1, v1, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;->ids:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/MusicTrack;->changeIds(II)V

    .line 197
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$4;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl$4$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/MusicTrackModelImpl$4;Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicTrackModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 198
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 190
    check-cast p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl$4;->success(Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;)V

    return-void
.end method
