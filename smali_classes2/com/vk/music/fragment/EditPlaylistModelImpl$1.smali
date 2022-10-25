.class Lcom/vk/music/fragment/EditPlaylistModelImpl$1;
.super Ljava/lang/Object;
.source "EditPlaylistFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/fragment/EditPlaylistModelImpl;->savePlaylist()V
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
        "Lcom/vk/music/dto/Playlist;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;


# direct methods
.method constructor <init>(Lcom/vk/music/fragment/EditPlaylistModelImpl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/fragment/EditPlaylistModelImpl;

    .prologue
    .line 197
    iput-object p1, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$1;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 206
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$1;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->saveRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 207
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$1;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/fragment/EditPlaylistModelImpl$1$$Lambda$2;->lambdaFactory$(Lcom/vk/music/fragment/EditPlaylistModelImpl$1;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->access$100(Lcom/vk/music/fragment/EditPlaylistModelImpl;Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 209
    return-void
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/EditPlaylistModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/EditPlaylistModel$Callback;

    .prologue
    .line 208
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$1;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/EditPlaylistModel$Callback;->onSavingError(Lcom/vk/music/model/EditPlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/dto/Playlist;Lcom/vk/music/model/EditPlaylistModel$Callback;)V
    .locals 1
    .param p1, "result"    # Lcom/vk/music/dto/Playlist;
    .param p2, "callback"    # Lcom/vk/music/model/EditPlaylistModel$Callback;

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$1;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/EditPlaylistModel$Callback;->onSavingDone(Lcom/vk/music/model/EditPlaylistModel;Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method public success(Lcom/vk/music/dto/Playlist;)V
    .locals 2
    .param p1, "result"    # Lcom/vk/music/dto/Playlist;

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$1;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->saveRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 201
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl$1;->this$0:Lcom/vk/music/fragment/EditPlaylistModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/fragment/EditPlaylistModelImpl$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/fragment/EditPlaylistModelImpl$1;Lcom/vk/music/dto/Playlist;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->access$000(Lcom/vk/music/fragment/EditPlaylistModelImpl;Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 202
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 197
    check-cast p1, Lcom/vk/music/dto/Playlist;

    invoke-virtual {p0, p1}, Lcom/vk/music/fragment/EditPlaylistModelImpl$1;->success(Lcom/vk/music/dto/Playlist;)V

    return-void
.end method
