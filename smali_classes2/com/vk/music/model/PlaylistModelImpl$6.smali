.class Lcom/vk/music/model/PlaylistModelImpl$6;
.super Ljava/lang/Object;
.source "PlaylistModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/PlaylistModelImpl;->delete()V
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
    .line 361
    iput-object p1, p0, Lcom/vk/music/model/PlaylistModelImpl$6;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 369
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$6;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$6$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$6;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 371
    return-void
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 370
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$6;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/PlaylistModel$Callback;->onDeletionError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 364
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$6;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-interface {p1, v0}, Lcom/vk/music/model/PlaylistModel$Callback;->onDeletionDone(Lcom/vk/music/model/PlaylistModel;)V

    return-void
.end method

.method public success(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 364
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$6;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0}, Lcom/vk/music/model/PlaylistModelImpl$6$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$6;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 365
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 361
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$6;->success(Ljava/lang/Boolean;)V

    return-void
.end method
