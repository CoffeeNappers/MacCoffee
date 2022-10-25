.class Lcom/vk/music/model/PlaylistsModelImpl$2;
.super Ljava/lang/Object;
.source "PlaylistsModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/PlaylistsModelImpl;->addPlaylist(Lcom/vk/music/dto/Playlist;)V
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
        "Lcom/vk/music/dto/PlaylistLink;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/PlaylistsModelImpl;

.field final synthetic val$playlist:Lcom/vk/music/dto/Playlist;


# direct methods
.method constructor <init>(Lcom/vk/music/model/PlaylistsModelImpl;Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/PlaylistsModelImpl;

    .prologue
    .line 252
    iput-object p1, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    iput-object p2, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->val$playlist:Lcom/vk/music/dto/Playlist;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 262
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/PlaylistsModelImpl;->access$1100(Lcom/vk/music/model/PlaylistsModelImpl;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->val$playlist:Lcom/vk/music/dto/Playlist;

    invoke-static {v1}, Lcom/vk/music/model/PlaylistsModelImpl;->access$1000(Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .line 264
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$2$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl$2;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 265
    return-void
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistsModel$Callback;

    .prologue
    .line 264
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistsModel$Callback;->onAdditionError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/dto/Playlist;Lcom/vk/music/model/PlaylistsModel$Callback;)V
    .locals 1
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistsModel$Callback;

    .prologue
    .line 257
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistsModel$Callback;->onAdditionDone(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method public success(Lcom/vk/music/dto/PlaylistLink;)V
    .locals 2
    .param p1, "result"    # Lcom/vk/music/dto/PlaylistLink;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/PlaylistsModelImpl;->access$1100(Lcom/vk/music/model/PlaylistsModelImpl;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->val$playlist:Lcom/vk/music/dto/Playlist;

    invoke-static {v1}, Lcom/vk/music/model/PlaylistsModelImpl;->access$1000(Lcom/vk/music/dto/Playlist;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->val$playlist:Lcom/vk/music/dto/Playlist;

    iput-object p1, v0, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    .line 257
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->this$0:Lcom/vk/music/model/PlaylistsModelImpl;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistsModelImpl$2;->val$playlist:Lcom/vk/music/dto/Playlist;

    invoke-static {p0, v1}, Lcom/vk/music/model/PlaylistsModelImpl$2$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModelImpl$2;Lcom/vk/music/dto/Playlist;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 258
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 252
    check-cast p1, Lcom/vk/music/dto/PlaylistLink;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/PlaylistsModelImpl$2;->success(Lcom/vk/music/dto/PlaylistLink;)V

    return-void
.end method
