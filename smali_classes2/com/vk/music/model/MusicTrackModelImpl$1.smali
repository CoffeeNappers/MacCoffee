.class Lcom/vk/music/model/MusicTrackModelImpl$1;
.super Ljava/lang/Object;
.source "MusicTrackModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/MusicTrackModelImpl;->removeMusic(Lcom/vkontakte/android/audio/MusicTrack;)V
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
.field final synthetic this$0:Lcom/vk/music/model/MusicTrackModelImpl;

.field final synthetic val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;


# direct methods
.method constructor <init>(Lcom/vk/music/model/MusicTrackModelImpl;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/MusicTrackModelImpl;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    iput-object p2, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/MusicTrackModelImpl;->access$100(Lcom/vk/music/model/MusicTrackModelImpl;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-static {v1}, Lcom/vk/music/model/MusicTrackModelImpl;->access$000(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "vk"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .line 105
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl$1$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/MusicTrackModelImpl$1;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicTrackModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 106
    return-void
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/MusicTrackModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/MusicTrackModel$Callback;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/MusicTrackModel$Callback;->onAudioRemovalError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/model/MusicTrackModel$Callback;)V
    .locals 1
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "callback"    # Lcom/vk/music/model/MusicTrackModel$Callback;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/MusicTrackModel$Callback;->onAudioRemovalDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method public success(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/MusicTrackModelImpl;->access$100(Lcom/vk/music/model/MusicTrackModelImpl;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-static {v1}, Lcom/vk/music/model/MusicTrackModelImpl;->access$000(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->removeCachedFile(Ljava/lang/String;)V

    .line 98
    iget-object v0, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->this$0:Lcom/vk/music/model/MusicTrackModelImpl;

    iget-object v1, p0, Lcom/vk/music/model/MusicTrackModelImpl$1;->val$musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-static {p0, v1}, Lcom/vk/music/model/MusicTrackModelImpl$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/MusicTrackModelImpl$1;Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicTrackModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 99
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 91
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/MusicTrackModelImpl$1;->success(Ljava/lang/Boolean;)V

    return-void
.end method
