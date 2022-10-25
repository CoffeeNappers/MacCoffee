.class Lcom/vk/music/model/PlaylistModelImpl$1;
.super Lcom/vkontakte/android/background/AsyncTask;
.source "PlaylistModelImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/PlaylistModelImpl;->load(ZZII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/background/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/PlaylistModelImpl;

.field final synthetic val$audioOffset:I

.field final synthetic val$loadOwner:Z


# direct methods
.method constructor <init>(Lcom/vk/music/model/PlaylistModelImpl;ZI)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/PlaylistModelImpl;

    .prologue
    .line 195
    iput-object p1, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iput-boolean p2, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->val$loadOwner:Z

    iput p3, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->val$audioOffset:I

    invoke-direct {p0}, Lcom/vkontakte/android/background/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 195
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$1;->doInBackground([Ljava/lang/Void;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/ArrayList;
    .locals 2
    .param p1, "args"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 198
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getSavedTracks()Ljava/util/List;

    move-result-object v0

    .line 199
    .local v0, "savedTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    if-eqz v0, :cond_0

    .line 200
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 202
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0
.end method

.method synthetic lambda$onPostExecute$0(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 217
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-interface {p1, v0}, Lcom/vk/music/model/PlaylistModel$Callback;->onLoadingDone(Lcom/vk/music/model/PlaylistModel;)V

    return-void
.end method

.method synthetic lambda$onPostExecute$1(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 219
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1, v0, v1}, Lcom/vk/music/model/PlaylistModel$Callback;->onLoadingMoreDone(Lcom/vk/music/model/PlaylistModel;Ljava/util/List;)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 195
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$1;->onPostExecute(Ljava/util/ArrayList;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 208
    .local p1, "_musicTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 209
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->val$loadOwner:Z

    if-eqz v0, :cond_0

    .line 210
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->owner:Ljava/lang/String;

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    iput-object p1, v0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    .line 213
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->canLoadMore:Z

    .line 214
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    new-instance v1, Lcom/vk/music/dto/Playlist;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v3, 0x7f0803e0

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 215
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lcom/vk/music/dto/Playlist;-><init>(Ljava/lang/String;II)V

    iput-object v1, v0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    .line 216
    iget v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->val$audioOffset:I

    if-nez v0, :cond_1

    .line 217
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0}, Lcom/vk/music/model/PlaylistModelImpl$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$1;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 221
    :goto_0
    return-void

    .line 219
    :cond_1
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl$1;->this$0:Lcom/vk/music/model/PlaylistModelImpl;

    invoke-static {p0}, Lcom/vk/music/model/PlaylistModelImpl$1$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl$1;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method
