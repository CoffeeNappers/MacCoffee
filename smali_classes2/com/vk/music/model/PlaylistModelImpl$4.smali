.class Lcom/vk/music/model/PlaylistModelImpl$4;
.super Ljava/lang/Object;
.source "PlaylistModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/PlaylistModelImpl;->toggleFollowing()V
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
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/PlaylistModelImpl;


# direct methods
.method constructor <init>(Lcom/vk/music/model/PlaylistModelImpl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/PlaylistModelImpl;

    .prologue
    .line 302
    iput-object p1, p0, Lcom/vk/music/model/PlaylistModelImpl$4;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 312
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$4;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->toggleRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 313
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$4;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$4$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$4;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 315
    return-void
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 314
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$4;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistModel$Callback;->onFollowingTogglingError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 307
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$4;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistModelImpl$4;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v1, v1, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-interface {p1, v0, v1}, Lcom/vk/music/model/PlaylistModel$Callback;->onFollowingTogglingDone(Lcom/vk/music/model/PlaylistModel;Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method public success(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    const/4 v1, 0x0

    .line 305
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$4;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iput-object v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->toggleRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 306
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$4;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iget-object v0, v0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iput-object v1, v0, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    .line 307
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$4;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0}, Lcom/vk/music/model/PlaylistModelImpl$4$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$4;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 308
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 302
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$4;->success(Ljava/lang/Boolean;)V

    return-void
.end method
