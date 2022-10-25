.class Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;
.super Ljava/lang/Object;
.source "PlaylistMusicLoader.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/attach/loader/PlaylistMusicLoader;->load(II)V
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
.field final synthetic this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

.field final synthetic val$audioCount:I

.field final synthetic val$audioOffset:I


# direct methods
.method constructor <init>(Lcom/vk/music/attach/loader/PlaylistMusicLoader;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    .prologue
    .line 153
    iput-object p1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iput p2, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->val$audioOffset:I

    iput p3, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->val$audioCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 178
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->access$002(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 180
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->reason:Ljava/lang/String;

    .line 182
    const-string/jumbo v0, "vk"

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->reason:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->val$audioOffset:I

    if-nez v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1$$Lambda$3;->lambdaFactory$(Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;)Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->access$100(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;)V

    .line 188
    :goto_0
    return-void

    .line 186
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1$$Lambda$4;->lambdaFactory$(Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;)Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->access$100(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$2(Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->reason:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;->onMusicLoadingError(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$fail$3(Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->reason:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;->onMusicLoadingMoreError(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    invoke-interface {p1, v0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;->onMusicLoadingDone(Lcom/vk/music/attach/loader/PlaylistMusicLoader;)V

    return-void
.end method

.method synthetic lambda$success$1(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;
    .param p2, "callback"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-interface {p2, v0, v1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;->onMusicLoadingMoreDone(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Ljava/util/List;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)V
    .locals 5
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 157
    iget-object v2, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->access$002(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 159
    iget v2, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->val$audioOffset:I

    if-nez v2, :cond_1

    .line 160
    iget-object v2, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-boolean v3, v2, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore:Z

    iget-object v4, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    :goto_0
    and-int/2addr v0, v3

    iput-boolean v0, v2, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore:Z

    .line 161
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->val$audioCount:I

    iput v1, v0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->offset:I

    .line 162
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->musicTracks:Ljava/util/ArrayList;

    .line 164
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;)Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->access$100(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;)V

    .line 174
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 160
    goto :goto_0

    .line 166
    :cond_1
    iget-object v2, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    :goto_2
    iput-boolean v0, v2, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore:Z

    .line 167
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-boolean v0, v0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore:Z

    if-eqz v0, :cond_2

    .line 168
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget v1, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->val$audioOffset:I

    iget v2, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->val$audioCount:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->offset:I

    .line 169
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iget-object v0, v0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->musicTracks:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 172
    :cond_2
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    invoke-static {p0, p1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1$$Lambda$2;->lambdaFactory$(Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->access$100(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Lcom/vk/music/attach/loader/PlaylistMusicLoader$Notification;)V

    goto :goto_1

    :cond_3
    move v0, v1

    .line 166
    goto :goto_2
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 153
    check-cast p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;

    invoke-virtual {p0, p1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader$1;->success(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)V

    return-void
.end method
