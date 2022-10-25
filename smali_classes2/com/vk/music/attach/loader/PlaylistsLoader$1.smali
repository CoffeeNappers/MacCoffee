.class Lcom/vk/music/attach/loader/PlaylistsLoader$1;
.super Ljava/lang/Object;
.source "PlaylistsLoader.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/attach/loader/PlaylistsLoader;->load(II)V
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
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vk/music/dto/Playlist;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

.field final synthetic val$playlistsCount:I

.field final synthetic val$playlistsOffset:I


# direct methods
.method constructor <init>(Lcom/vk/music/attach/loader/PlaylistsLoader;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/attach/loader/PlaylistsLoader;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iput p2, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->val$playlistsOffset:I

    iput p3, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->val$playlistsCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 154
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->access$002(Lcom/vk/music/attach/loader/PlaylistsLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 156
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vk/music/attach/loader/PlaylistsLoader;->reason:Ljava/lang/String;

    .line 158
    const-string/jumbo v0, "vk"

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/PlaylistsLoader;->reason:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    iget v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->val$playlistsOffset:I

    if-nez v0, :cond_0

    .line 160
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/PlaylistsLoader$1$$Lambda$3;->lambdaFactory$(Lcom/vk/music/attach/loader/PlaylistsLoader$1;)Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->access$100(Lcom/vk/music/attach/loader/PlaylistsLoader;Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;)V

    .line 164
    :goto_0
    return-void

    .line 162
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/PlaylistsLoader$1$$Lambda$4;->lambdaFactory$(Lcom/vk/music/attach/loader/PlaylistsLoader$1;)Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->access$100(Lcom/vk/music/attach/loader/PlaylistsLoader;Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$2(Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/PlaylistsLoader;->reason:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;->onPlaylistsLoadingError(Lcom/vk/music/attach/loader/PlaylistsLoader;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$fail$3(Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iget-object v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/PlaylistsLoader;->reason:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;->onPlaylistsLoadingMoreError(Lcom/vk/music/attach/loader/PlaylistsLoader;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;

    .prologue
    .line 140
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    invoke-interface {p1, v0}, Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;->onPlaylistsLoadingDone(Lcom/vk/music/attach/loader/PlaylistsLoader;)V

    return-void
.end method

.method synthetic lambda$success$1(Lcom/vkontakte/android/data/VKList;Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/data/VKList;
    .param p2, "callback"    # Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;

    .prologue
    .line 148
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;->onPlaylistsLoadingMoreDone(Lcom/vk/music/attach/loader/PlaylistsLoader;Ljava/util/List;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vk/music/dto/Playlist;>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 133
    iget-object v2, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vk/music/attach/loader/PlaylistsLoader;->access$002(Lcom/vk/music/attach/loader/PlaylistsLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 135
    iget v2, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->val$playlistsOffset:I

    if-nez v2, :cond_1

    .line 136
    iget-object v2, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iget-boolean v3, v2, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore:Z

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    :goto_0
    and-int/2addr v0, v3

    iput-boolean v0, v2, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore:Z

    .line 137
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iget v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->val$playlistsCount:I

    iput v1, v0, Lcom/vk/music/attach/loader/PlaylistsLoader;->offset:I

    .line 138
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iput-object p1, v0, Lcom/vk/music/attach/loader/PlaylistsLoader;->playlists:Ljava/util/ArrayList;

    .line 140
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/PlaylistsLoader$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/attach/loader/PlaylistsLoader$1;)Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->access$100(Lcom/vk/music/attach/loader/PlaylistsLoader;Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;)V

    .line 150
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 136
    goto :goto_0

    .line 142
    :cond_1
    iget-object v2, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    :goto_2
    iput-boolean v0, v2, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore:Z

    .line 143
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iget-boolean v0, v0, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore:Z

    if-eqz v0, :cond_2

    .line 144
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iget v1, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->val$playlistsOffset:I

    iget v2, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->val$playlistsCount:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/vk/music/attach/loader/PlaylistsLoader;->offset:I

    .line 145
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    iget-object v0, v0, Lcom/vk/music/attach/loader/PlaylistsLoader;->playlists:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 148
    :cond_2
    iget-object v0, p0, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->this$0:Lcom/vk/music/attach/loader/PlaylistsLoader;

    invoke-static {p0, p1}, Lcom/vk/music/attach/loader/PlaylistsLoader$1$$Lambda$2;->lambdaFactory$(Lcom/vk/music/attach/loader/PlaylistsLoader$1;Lcom/vkontakte/android/data/VKList;)Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->access$100(Lcom/vk/music/attach/loader/PlaylistsLoader;Lcom/vk/music/attach/loader/PlaylistsLoader$Notification;)V

    goto :goto_1

    :cond_3
    move v0, v1

    .line 142
    goto :goto_2
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 129
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/music/attach/loader/PlaylistsLoader$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
