.class Lcom/vk/music/attach/loader/MusicLoader$1;
.super Ljava/lang/Object;
.source "MusicLoader.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/attach/loader/MusicLoader;->load(ZII)V
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
        "Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/attach/loader/MusicLoader;

.field final synthetic val$audioCount:I

.field final synthetic val$audioOffset:I

.field final synthetic val$loadPlaylist:Z


# direct methods
.method constructor <init>(Lcom/vk/music/attach/loader/MusicLoader;ZII)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/attach/loader/MusicLoader;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iput-boolean p2, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->val$loadPlaylist:Z

    iput p3, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->val$audioOffset:I

    iput p4, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->val$audioCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 166
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/MusicLoader;->access$002(Lcom/vk/music/attach/loader/MusicLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 168
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vk/music/attach/loader/MusicLoader;->reason:Ljava/lang/String;

    .line 170
    const-string/jumbo v0, "vk"

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/MusicLoader;->reason:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    iget v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->val$audioOffset:I

    if-nez v0, :cond_0

    .line 172
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/MusicLoader$1$$Lambda$3;->lambdaFactory$(Lcom/vk/music/attach/loader/MusicLoader$1;)Lcom/vk/music/attach/loader/MusicLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/MusicLoader;->access$100(Lcom/vk/music/attach/loader/MusicLoader;Lcom/vk/music/attach/loader/MusicLoader$Notification;)V

    .line 176
    :goto_0
    return-void

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/MusicLoader$1$$Lambda$4;->lambdaFactory$(Lcom/vk/music/attach/loader/MusicLoader$1;)Lcom/vk/music/attach/loader/MusicLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/MusicLoader;->access$100(Lcom/vk/music/attach/loader/MusicLoader;Lcom/vk/music/attach/loader/MusicLoader$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$2(Lcom/vk/music/attach/loader/MusicLoader$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vk/music/attach/loader/MusicLoader$Callback;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/MusicLoader;->reason:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vk/music/attach/loader/MusicLoader$Callback;->onMusicLoadingError(Lcom/vk/music/attach/loader/MusicLoader;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$fail$3(Lcom/vk/music/attach/loader/MusicLoader$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vk/music/attach/loader/MusicLoader$Callback;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/MusicLoader;->reason:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vk/music/attach/loader/MusicLoader$Callback;->onMusicLoadingMoreError(Lcom/vk/music/attach/loader/MusicLoader;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/attach/loader/MusicLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/MusicLoader$Callback;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    invoke-interface {p1, v0}, Lcom/vk/music/attach/loader/MusicLoader$Callback;->onMusicLoadingDone(Lcom/vk/music/attach/loader/MusicLoader;)V

    return-void
.end method

.method synthetic lambda$success$1(Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;Lcom/vk/music/attach/loader/MusicLoader$Callback;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;
    .param p2, "callback"    # Lcom/vk/music/attach/loader/MusicLoader$Callback;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    invoke-interface {p2, v0, v1}, Lcom/vk/music/attach/loader/MusicLoader$Callback;->onMusicLoadingMoreDone(Lcom/vk/music/attach/loader/MusicLoader;Ljava/util/List;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 141
    iget-object v2, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vk/music/attach/loader/MusicLoader;->access$002(Lcom/vk/music/attach/loader/MusicLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 143
    iget-boolean v2, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->val$loadPlaylist:Z

    if-eqz v2, :cond_0

    .line 144
    iget-object v2, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->playlists:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, v2, Lcom/vk/music/attach/loader/MusicLoader;->playlistsCount:Ljava/lang/Integer;

    .line 147
    :cond_0
    iget v2, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->val$audioOffset:I

    if-nez v2, :cond_2

    .line 148
    iget-object v2, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    :goto_0
    iput-boolean v0, v2, Lcom/vk/music/attach/loader/MusicLoader;->canLoadMore:Z

    .line 149
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget v1, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->val$audioCount:I

    iput v1, v0, Lcom/vk/music/attach/loader/MusicLoader;->offset:I

    .line 150
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    iput-object v1, v0, Lcom/vk/music/attach/loader/MusicLoader;->musicTracks:Ljava/util/ArrayList;

    .line 152
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/MusicLoader$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/attach/loader/MusicLoader$1;)Lcom/vk/music/attach/loader/MusicLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/MusicLoader;->access$100(Lcom/vk/music/attach/loader/MusicLoader;Lcom/vk/music/attach/loader/MusicLoader$Notification;)V

    .line 162
    :goto_1
    return-void

    :cond_1
    move v0, v1

    .line 148
    goto :goto_0

    .line 154
    :cond_2
    iget-object v2, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    :goto_2
    iput-boolean v0, v2, Lcom/vk/music/attach/loader/MusicLoader;->canLoadMore:Z

    .line 155
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-boolean v0, v0, Lcom/vk/music/attach/loader/MusicLoader;->canLoadMore:Z

    if-eqz v0, :cond_3

    .line 156
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget v1, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->val$audioOffset:I

    iget v2, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->val$audioCount:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/vk/music/attach/loader/MusicLoader;->offset:I

    .line 157
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    iget-object v0, v0, Lcom/vk/music/attach/loader/MusicLoader;->musicTracks:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 160
    :cond_3
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicLoader;

    invoke-static {p0, p1}, Lcom/vk/music/attach/loader/MusicLoader$1$$Lambda$2;->lambdaFactory$(Lcom/vk/music/attach/loader/MusicLoader$1;Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;)Lcom/vk/music/attach/loader/MusicLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/MusicLoader;->access$100(Lcom/vk/music/attach/loader/MusicLoader;Lcom/vk/music/attach/loader/MusicLoader$Notification;)V

    goto :goto_1

    :cond_4
    move v0, v1

    .line 154
    goto :goto_2
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 138
    check-cast p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;

    invoke-virtual {p0, p1}, Lcom/vk/music/attach/loader/MusicLoader$1;->success(Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;)V

    return-void
.end method
