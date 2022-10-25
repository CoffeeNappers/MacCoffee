.class Lcom/vk/music/model/PlaylistModelImpl$7;
.super Ljava/lang/Object;
.source "PlaylistModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/PlaylistModelImpl;->attachMusic(Ljava/util/List;)V
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
.field final synthetic this$0:Lcom/vk/music/model/PlaylistModelImpl;

.field final synthetic val$tracksToAttach:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/vk/music/model/PlaylistModelImpl;Ljava/util/List;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/PlaylistModelImpl;

    .prologue
    .line 390
    iput-object p1, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iput-object p2, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->val$tracksToAttach:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 423
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->attachRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 424
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$7$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$7;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 426
    return-void
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 425
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistModel$Callback;->onAttachingError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Ljava/util/List;Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 1
    .param p1, "tracksToAttach"    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 418
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistModel$Callback;->onAttachingDone(Lcom/vk/music/model/PlaylistModel;Ljava/util/List;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;)V
    .locals 8
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;

    .prologue
    .line 393
    iget-object v5, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    const/4 v6, 0x0

    iput-object v6, v5, Lcom/vk/music/model/PlaylistModelImpl;->attachRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 395
    iget-object v5, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v6, p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v5, v6}, Lcom/vk/music/model/PlaylistModelImpl;->setPlaylist(Lcom/vk/music/dto/Playlist;)V

    .line 396
    const/4 v0, 0x0

    .line 398
    .local v0, "i":I
    iget-object v5, p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;->ids:[I

    array-length v5, v5

    iget-object v6, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->val$tracksToAttach:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ne v5, v6, :cond_0

    .line 399
    iget-object v5, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->val$tracksToAttach:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/audio/MusicTrack;

    .line 400
    .local v4, "track":Lcom/vkontakte/android/audio/MusicTrack;
    iget v6, v4, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget-object v7, p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;->ids:[I

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aget v7, v7, v0

    invoke-virtual {v4, v6, v7}, Lcom/vkontakte/android/audio/MusicTrack;->changeIds(II)V

    move v0, v1

    .line 401
    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_0

    .line 404
    .end local v4    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_0
    iget-object v5, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v5, v5, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    if-eqz v5, :cond_2

    .line 406
    iget-object v5, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->val$tracksToAttach:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 408
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 409
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/audio/MusicTrack;

    .line 410
    .local v3, "next":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v5, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v5, v5, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 411
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 413
    :cond_1
    iget-object v5, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v5, v5, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_1

    .line 418
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .end local v3    # "next":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_2
    iget-object v5, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v6, p0, Lcom/vk/music/model/PlaylistModelImpl$7;->val$tracksToAttach:Ljava/util/List;

    invoke-static {p0, v6}, Lcom/vk/music/model/PlaylistModelImpl$7$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$7;Ljava/util/List;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 419
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 390
    check-cast p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$7;->success(Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;)V

    return-void
.end method
