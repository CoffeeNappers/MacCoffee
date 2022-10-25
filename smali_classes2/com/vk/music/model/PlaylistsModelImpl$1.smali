.class Lcom/vk/music/model/PlaylistsModelImpl$1;
.super Ljava/lang/Object;
.source "PlaylistsModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/PlaylistsModelImpl;->load(II)V
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
.field final synthetic this$0:Lcom/vk/music/model/PlaylistsModelImpl;

.field final synthetic val$playlistCount:I

.field final synthetic val$playlistOffset:I


# direct methods
.method constructor <init>(Lcom/vk/music/model/PlaylistsModelImpl;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/PlaylistsModelImpl;

    .prologue
    .line 179
    iput-object p1, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    iput p2, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->val$playlistOffset:I

    iput p3, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->val$playlistCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 205
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->access$502(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 206
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .line 207
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->access$902(Lcom/vk/music/model/PlaylistsModelImpl;Ljava/lang/String;)Ljava/lang/String;

    .line 208
    iget v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->val$playlistOffset:I

    if-nez v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$1$$Lambda$3;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl$1;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 213
    :goto_0
    return-void

    .line 211
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$1$$Lambda$4;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl$1;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$2(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistsModel$Callback;

    .prologue
    .line 209
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistsModel$Callback;->onLoadingError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$fail$3(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistsModel$Callback;

    .prologue
    .line 211
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistsModel$Callback;->onMoreLoadingError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/model/PlaylistsModel$Callback;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-interface {p1, v0}, Lcom/vk/music/model/PlaylistsModel$Callback;->onLoadingDone(Lcom/vk/music/model/PlaylistsModel;)V

    return-void
.end method

.method synthetic lambda$success$1(Lcom/vkontakte/android/data/VKList;Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/data/VKList;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistsModel$Callback;

    .prologue
    .line 199
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistsModel$Callback;->onMoreLoadingDone(Lcom/vk/music/model/PlaylistsModel;Ljava/util/List;)V

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

    .line 183
    iget-object v2, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vk/music/model/PlaylistsModelImpl;->access$502(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 184
    iget v2, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->val$playlistOffset:I

    if-nez v2, :cond_2

    .line 185
    iget-object v2, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    iget-object v3, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {v3}, Lcom/vk/music/model/PlaylistsModelImpl;->access$600(Lcom/vk/music/model/PlaylistsModelImpl;)Z

    move-result v3

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    :goto_0
    and-int/2addr v0, v3

    invoke-static {v2, v0}, Lcom/vk/music/model/PlaylistsModelImpl;->access$602(Lcom/vk/music/model/PlaylistsModelImpl;Z)Z

    .line 186
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    iget v1, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->val$playlistCount:I

    invoke-static {v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->access$702(Lcom/vk/music/model/PlaylistsModelImpl;I)I

    .line 187
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {v0, p1}, Lcom/vk/music/model/PlaylistsModelImpl;->access$802(Lcom/vk/music/model/PlaylistsModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 196
    :cond_0
    :goto_1
    iget v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->val$playlistOffset:I

    if-nez v0, :cond_4

    .line 197
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {p0}, Lcom/vk/music/model/PlaylistsModelImpl$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl$1;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 201
    :goto_2
    return-void

    :cond_1
    move v0, v1

    .line 185
    goto :goto_0

    .line 189
    :cond_2
    iget-object v2, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    :goto_3
    invoke-static {v2, v0}, Lcom/vk/music/model/PlaylistsModelImpl;->access$602(Lcom/vk/music/model/PlaylistsModelImpl;Z)Z

    .line 190
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/PlaylistsModelImpl;->access$600(Lcom/vk/music/model/PlaylistsModelImpl;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    iget v1, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->val$playlistOffset:I

    iget v2, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->val$playlistCount:I

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->access$702(Lcom/vk/music/model/PlaylistsModelImpl;I)I

    .line 192
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/PlaylistsModelImpl;->access$800(Lcom/vk/music/model/PlaylistsModelImpl;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_3
    move v0, v1

    .line 189
    goto :goto_3

    .line 199
    :cond_4
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$1$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl$1;Lcom/vkontakte/android/data/VKList;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_2
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 179
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
