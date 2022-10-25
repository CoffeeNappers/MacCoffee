.class Lcom/vk/music/model/MusicModelCatalogBlock$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "MusicModelCatalogBlock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/MusicModelCatalogBlock;->loadAndPlayShuffleAll(Landroid/content/Context;)V
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
.field final synthetic this$0:Lcom/vk/music/model/MusicModelCatalogBlock;


# direct methods
.method constructor <init>(Lcom/vk/music/model/MusicModelCatalogBlock;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/MusicModelCatalogBlock;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/vk/music/model/MusicModelCatalogBlock$1;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

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
    .line 167
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$1;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    invoke-virtual {v0}, Lcom/vk/music/model/MusicModelCatalogBlock;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-interface {v1, v0, p1}, Lcom/vk/music/model/PlayerModel;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V

    .line 170
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 164
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/MusicModelCatalogBlock$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
