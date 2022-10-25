.class Lcom/vk/music/model/MusicModelImpl$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "MusicModelImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/MusicModelImpl;->loadAndPlayShuffleAll(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/MusicModelImpl;


# direct methods
.method constructor <init>(Lcom/vk/music/model/MusicModelImpl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/MusicModelImpl;

    .prologue
    .line 295
    iput-object p1, p0, Lcom/vk/music/model/MusicModelImpl$2;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 298
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 299
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$2;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-virtual {v0}, Lcom/vk/music/model/MusicModelImpl;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Lcom/vk/music/model/PlayerModel;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V

    .line 301
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 295
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/MusicModelImpl$2;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
