.class Lcom/vk/music/fragment/EditPlaylistModelImpl$2;
.super Ljava/lang/Object;
.source "EditPlaylistFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/fragment/EditPlaylistModelImpl;->load(II)V
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
.field final synthetic this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

.field final synthetic val$audioCount:I

.field final synthetic val$audioOffset:I


# direct methods
.method constructor <init>(Lcom/vk/music/fragment/EditPlaylistModelImpl;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/fragment/EditPlaylistModelImpl;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    iput p2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->val$audioOffset:I

    iput p3, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->val$audioCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 254
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 255
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/fragment/EditPlaylistModelImpl$2$$Lambda$2;->lambdaFactory$(Lcom/vk/music/fragment/EditPlaylistModelImpl$2;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->access$300(Lcom/vk/music/fragment/EditPlaylistModelImpl;Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 257
    return-void
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/EditPlaylistModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/EditPlaylistModel$Callback;

    .prologue
    .line 256
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/EditPlaylistModel$Callback;->onLoadingMoreError(Lcom/vk/music/model/EditPlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;Lcom/vk/music/model/EditPlaylistModel$Callback;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;
    .param p2, "callback"    # Lcom/vk/music/model/EditPlaylistModel$Callback;

    .prologue
    .line 249
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-interface {p2, v0, v1}, Lcom/vk/music/model/EditPlaylistModel$Callback;->onLoadingMoreDone(Lcom/vk/music/model/EditPlaylistModel;Ljava/util/List;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;

    .prologue
    .line 241
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 243
    iget-object v1, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    iget-object v0, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, v1, Lcom/vk/music/fragment/EditPlaylistModelImpl;->canLoadMore:Z

    .line 244
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    iget-boolean v0, v0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->canLoadMore:Z

    if-eqz v0, :cond_0

    .line 245
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    iget v1, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->val$audioOffset:I

    iget v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->val$audioCount:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->offset:I

    .line 246
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    iget-object v0, v0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/fragment/EditPlaylistModelImpl$2$$Lambda$1;->lambdaFactory$(Lcom/vk/music/fragment/EditPlaylistModelImpl$2;Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->access$200(Lcom/vk/music/fragment/EditPlaylistModelImpl;Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 250
    return-void

    .line 243
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 238
    check-cast p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;

    invoke-virtual {p0, p1}, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;->success(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)V

    return-void
.end method
