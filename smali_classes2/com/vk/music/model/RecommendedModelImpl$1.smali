.class Lcom/vk/music/model/RecommendedModelImpl$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "RecommendedModelImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/RecommendedModelImpl;->playSection(Lcom/vk/music/dto/Section;Lcom/vkontakte/android/audio/MusicTrack;)V
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
.field final synthetic this$0:Lcom/vk/music/model/RecommendedModelImpl;

.field final synthetic val$audios:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/vk/music/model/RecommendedModelImpl;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/RecommendedModelImpl;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/vk/music/model/RecommendedModelImpl$1;->this$0:Lcom/vk/music/model/RecommendedModelImpl;

    iput-object p2, p0, Lcom/vk/music/model/RecommendedModelImpl$1;->val$audios:Ljava/util/ArrayList;

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
    .line 69
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getActualTrackList()Ljava/util/List;

    move-result-object v0

    .line 70
    .local v0, "playerTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    iget-object v1, p0, Lcom/vk/music/model/RecommendedModelImpl$1;->val$audios:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 71
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/vkontakte/android/audio/AudioFacade;->addToPlaylist(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 73
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 66
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/RecommendedModelImpl$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
