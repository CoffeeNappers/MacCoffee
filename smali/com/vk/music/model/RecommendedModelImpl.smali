.class Lcom/vk/music/model/RecommendedModelImpl;
.super Lcom/vk/music/model/ObservableModel;
.source "RecommendedModelImpl.java"

# interfaces
.implements Lcom/vk/music/model/RecommendedModel;
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/model/ObservableModel",
        "<",
        "Lcom/vk/music/model/RecommendedModel$Callback;",
        ">;",
        "Lcom/vk/music/model/RecommendedModel;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vk/music/dto/Section;",
        ">;>;"
    }
.end annotation


# instance fields
.field private audioGetCatalog:Lcom/vkontakte/android/api/audio/AudioGetCatalog;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private errorMessage:Ljava/lang/String;

.field private final musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

.field private final playerModel:Lcom/vk/music/model/PlayerModel;

.field private sections:Ljava/util/ArrayList;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Section;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 35
    invoke-direct {p0}, Lcom/vk/music/model/ObservableModel;-><init>()V

    .line 29
    iput-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->sections:Ljava/util/ArrayList;

    .line 32
    iput-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->audioGetCatalog:Lcom/vkontakte/android/api/audio/AudioGetCatalog;

    .line 36
    new-instance v0, Lcom/vk/music/model/PlayerModelImpl;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerRefer;->none:Lcom/vkontakte/android/audio/player/PlayerRefer;

    invoke-direct {v0, v1}, Lcom/vk/music/model/PlayerModelImpl;-><init>(Lcom/vkontakte/android/audio/player/PlayerRefer;)V

    iput-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    .line 37
    new-instance v0, Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-direct {v0}, Lcom/vk/music/model/MusicTrackModelImpl;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    .line 38
    return-void
.end method


# virtual methods
.method public clearCallbacks()V
    .locals 1

    .prologue
    .line 93
    invoke-super {p0}, Lcom/vk/music/model/ObservableModel;->clearCallbacks()V

    .line 94
    invoke-virtual {p0}, Lcom/vk/music/model/RecommendedModelImpl;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/model/PlayerModel;->clearCallbacks()V

    .line 95
    return-void
.end method

.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 129
    iget-object v0, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->errorMessage:Ljava/lang/String;

    .line 130
    invoke-static {p0, p1}, Lcom/vk/music/model/RecommendedModelImpl$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/RecommendedModelImpl;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/model/RecommendedModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 131
    return-void
.end method

.method public getError()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->errorMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    return-object v0
.end method

.method public getPlayerModel()Lcom/vk/music/model/PlayerModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    return-object v0
.end method

.method public getSections()Ljava/util/ArrayList;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Section;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->sections:Ljava/util/ArrayList;

    return-object v0
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/RecommendedModel$Callback;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/RecommendedModel$Callback;

    .prologue
    .line 130
    invoke-interface {p2, p0, p1}, Lcom/vk/music/model/RecommendedModel$Callback;->onLoadingError(Lcom/vk/music/model/RecommendedModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/model/RecommendedModel$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vk/music/model/RecommendedModel$Callback;

    .prologue
    .line 124
    invoke-interface {p1, p0}, Lcom/vk/music/model/RecommendedModel$Callback;->onLoadingDone(Lcom/vk/music/model/RecommendedModel;)V

    return-void
.end method

.method public load()V
    .locals 2

    .prologue
    .line 48
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetCatalog;

    invoke-direct {v0}, Lcom/vkontakte/android/api/audio/AudioGetCatalog;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->audioGetCatalog:Lcom/vkontakte/android/api/audio/AudioGetCatalog;

    .line 49
    iget-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->audioGetCatalog:Lcom/vkontakte/android/api/audio/AudioGetCatalog;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/audio/AudioGetCatalog;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 50
    iget-object v1, p0, Lcom/vk/music/model/RecommendedModelImpl;->audioGetCatalog:Lcom/vkontakte/android/api/audio/AudioGetCatalog;

    const/4 v0, 0x0

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/audio/AudioGetCatalog;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 51
    return-void
.end method

.method public playSection(Lcom/vk/music/dto/Section;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 5
    .param p1, "section"    # Lcom/vk/music/dto/Section;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 61
    iget-object v1, p1, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    if-nez v1, :cond_1

    const/4 v0, 0x0

    .line 62
    .local v0, "audios":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :goto_0
    invoke-virtual {p0}, Lcom/vk/music/model/RecommendedModelImpl;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    iget-object v2, p1, Lcom/vk/music/dto/Section;->source:Ljava/lang/String;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/PlayerRefer;->parseRecommended(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v2

    invoke-interface {v1, p2, v0, v2}, Lcom/vk/music/model/PlayerModel;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;Lcom/vkontakte/android/audio/player/PlayerRefer;)V

    .line 64
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v2, 0x64

    if-ge v1, v2, :cond_0

    .line 65
    new-instance v1, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    iget v2, p1, Lcom/vk/music/dto/Section;->id:I

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    rsub-int/lit8 v4, v4, 0x64

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;-><init>(III)V

    .line 66
    invoke-virtual {v1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->buildAudios()Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    new-instance v2, Lcom/vk/music/model/RecommendedModelImpl$1;

    invoke-direct {v2, p0, v0}, Lcom/vk/music/model/RecommendedModelImpl$1;-><init>(Lcom/vk/music/model/RecommendedModelImpl;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 74
    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 76
    :cond_0
    return-void

    .line 61
    .end local v0    # "audios":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 99
    invoke-virtual {p0}, Lcom/vk/music/model/RecommendedModelImpl;->clearCallbacks()V

    .line 100
    iget-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->audioGetCatalog:Lcom/vkontakte/android/api/audio/AudioGetCatalog;

    .line 101
    .local v0, "audioGetCatalog":Lcom/vkontakte/android/api/audio/AudioGetCatalog;
    if-eqz v0, :cond_0

    .line 102
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioGetCatalog;->cancel()V

    .line 104
    :cond_0
    return-void
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 80
    const-string/jumbo v0, "sections"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->sections:Ljava/util/ArrayList;

    .line 81
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 86
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 87
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v1, "sections"

    iget-object v2, p0, Lcom/vk/music/model/RecommendedModelImpl;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 88
    return-object v0
.end method

.method public bridge synthetic subscribe(Lcom/vk/music/model/RecommendedModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/RecommendedModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 23
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->subscribe(Ljava/lang/Object;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/music/dto/Section;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vk/music/dto/Section;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/vk/music/model/RecommendedModelImpl;->sections:Ljava/util/ArrayList;

    .line 124
    invoke-static {p0}, Lcom/vk/music/model/RecommendedModelImpl$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/RecommendedModelImpl;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/model/RecommendedModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 125
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 23
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/RecommendedModelImpl;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method

.method public bridge synthetic unsubscribe(Lcom/vk/music/model/RecommendedModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/RecommendedModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 23
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->unsubscribe(Ljava/lang/Object;)V

    return-void
.end method
