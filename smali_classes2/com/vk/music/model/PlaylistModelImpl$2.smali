.class Lcom/vk/music/model/PlaylistModelImpl$2;
.super Ljava/lang/Object;
.source "PlaylistModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/PlaylistModelImpl;->load(ZZII)V
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
        "Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/PlaylistModelImpl;

.field final synthetic val$audioCount:I

.field final synthetic val$audioOffset:I

.field final synthetic val$loadOwner:Z

.field final synthetic val$loadPlaylist:Z


# direct methods
.method constructor <init>(Lcom/vk/music/model/PlaylistModelImpl;ZZII)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/PlaylistModelImpl;

    .prologue
    .line 231
    iput-object p1, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iput-boolean p2, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$loadOwner:Z

    iput-boolean p3, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$loadPlaylist:Z

    iput p4, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$audioOffset:I

    iput p5, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$audioCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 262
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 263
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    iput-object v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->errorMessage:Ljava/lang/String;

    .line 265
    iget v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$audioOffset:I

    if-nez v0, :cond_0

    .line 266
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$2$$Lambda$3;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$2;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 270
    :goto_0
    return-void

    .line 268
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$2$$Lambda$4;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$2;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$2(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 266
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistModel$Callback;->onLoadingError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$fail$3(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 268
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistModel$Callback;->onLoadingMoreError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 254
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-interface {p1, v0}, Lcom/vk/music/model/PlaylistModel$Callback;->onLoadingDone(Lcom/vk/music/model/PlaylistModel;)V

    return-void
.end method

.method synthetic lambda$success$1(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 256
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-interface {p2, v0, v1}, Lcom/vk/music/model/PlaylistModel$Callback;->onLoadingMoreDone(Lcom/vk/music/model/PlaylistModel;Ljava/util/List;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)V
    .locals 5
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 234
    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    const/4 v3, 0x0

    iput-object v3, v2, Lcom/vk/music/model/PlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 235
    iget-boolean v2, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$loadOwner:Z

    if-eqz v2, :cond_0

    .line 236
    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->owner:Ljava/lang/String;

    iput-object v3, v2, Lcom/vk/music/model/PlaylistModelImpl;->owner:Ljava/lang/String;

    .line 238
    :cond_0
    iget-boolean v2, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$loadPlaylist:Z

    if-eqz v2, :cond_1

    .line 239
    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->playlist:Lcom/vk/music/dto/Playlist;

    iput-object v3, v2, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    .line 241
    :cond_1
    iget v2, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$audioOffset:I

    if-nez v2, :cond_4

    .line 242
    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-boolean v3, v2, Lcom/vk/music/model/PlaylistModelImpl;->canLoadMore:Z

    iget-object v4, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    :goto_0
    and-int/2addr v0, v3

    iput-boolean v0, v2, Lcom/vk/music/model/PlaylistModelImpl;->canLoadMore:Z

    .line 243
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget v1, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$audioCount:I

    iput v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->offset:I

    .line 244
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    .line 253
    :cond_2
    :goto_1
    iget v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$audioOffset:I

    if-nez v0, :cond_6

    .line 254
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0}, Lcom/vk/music/model/PlaylistModelImpl$2$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$2;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 258
    :goto_2
    return-void

    :cond_3
    move v0, v1

    .line 242
    goto :goto_0

    .line 246
    :cond_4
    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5

    :goto_3
    iput-boolean v0, v2, Lcom/vk/music/model/PlaylistModelImpl;->canLoadMore:Z

    .line 247
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-boolean v0, v0, Lcom/vk/music/model/PlaylistModelImpl;->canLoadMore:Z

    if-eqz v0, :cond_2

    .line 248
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget v1, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$audioOffset:I

    iget v2, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->val$audioCount:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->offset:I

    .line 249
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v0, v0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_5
    move v0, v1

    .line 246
    goto :goto_3

    .line 256
    :cond_6
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$2$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$2;Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_2
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 231
    check-cast p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$2;->success(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)V

    return-void
.end method
