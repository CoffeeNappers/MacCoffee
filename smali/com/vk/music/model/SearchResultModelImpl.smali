.class final Lcom/vk/music/model/SearchResultModelImpl;
.super Lcom/vk/music/model/ObservableModel;
.source "SearchResultModelImpl.java"

# interfaces
.implements Lcom/vk/music/model/SearchResultModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/SearchResultModelImpl$Mode;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/model/ObservableModel",
        "<",
        "Lcom/vk/music/model/SearchResultModel$Callback;",
        ">;",
        "Lcom/vk/music/model/SearchResultModel;"
    }
.end annotation


# static fields
.field static final MODE_BY_ARTIST:I = 0x2

.field static final MODE_BY_TITLE:I = 0x1

.field private static final RESULTS_PORTION:I = 0x64


# instance fields
.field private communities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field private errorMessage:Ljava/lang/String;

.field private full:Z

.field private globalResults:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field private loadResults:Lcom/vkontakte/android/api/VKAPIRequest;

.field private loaded:Z

.field private localResults:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field private final mode:I
    .annotation build Lcom/vk/music/model/SearchResultModelImpl$Mode;
    .end annotation
.end field

.field private final musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

.field private final playerModel:Lcom/vk/music/model/PlayerModel;

.field private query:Ljava/lang/String;

.field private results:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "mode"    # I
        .annotation build Lcom/vk/music/model/SearchResultModelImpl$Mode;
        .end annotation
    .end param

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/vk/music/model/ObservableModel;-><init>()V

    .line 65
    iput-object p1, p0, Lcom/vk/music/model/SearchResultModelImpl;->query:Ljava/lang/String;

    .line 66
    iput p2, p0, Lcom/vk/music/model/SearchResultModelImpl;->mode:I

    .line 67
    new-instance v0, Lcom/vk/music/model/PlayerModelImpl;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerRefer;->search:Lcom/vkontakte/android/audio/player/PlayerRefer;

    invoke-direct {v0, v1}, Lcom/vk/music/model/PlayerModelImpl;-><init>(Lcom/vkontakte/android/audio/player/PlayerRefer;)V

    iput-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    .line 68
    new-instance v0, Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-direct {v0}, Lcom/vk/music/model/MusicTrackModelImpl;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    .line 69
    return-void
.end method

.method static synthetic access$002(Lcom/vk/music/model/SearchResultModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/SearchResultModelImpl;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/vk/music/model/SearchResultModelImpl;->loadResults:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/music/model/SearchResultModelImpl;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/SearchResultModelImpl;

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->loaded:Z

    return v0
.end method

.method static synthetic access$102(Lcom/vk/music/model/SearchResultModelImpl;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/SearchResultModelImpl;
    .param p1, "x1"    # Z

    .prologue
    .line 26
    iput-boolean p1, p0, Lcom/vk/music/model/SearchResultModelImpl;->loaded:Z

    return p1
.end method

.method static synthetic access$202(Lcom/vk/music/model/SearchResultModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/SearchResultModelImpl;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/vk/music/model/SearchResultModelImpl;->localResults:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$302(Lcom/vk/music/model/SearchResultModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/SearchResultModelImpl;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/vk/music/model/SearchResultModelImpl;->globalResults:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vk/music/model/SearchResultModelImpl;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/SearchResultModelImpl;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->results:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$402(Lcom/vk/music/model/SearchResultModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/SearchResultModelImpl;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/vk/music/model/SearchResultModelImpl;->results:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$500(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Ljava/util/List;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Ljava/util/List;

    .prologue
    .line 26
    invoke-static {p0, p1, p2}, Lcom/vk/music/model/SearchResultModelImpl;->fillResults(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$602(Lcom/vk/music/model/SearchResultModelImpl;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/SearchResultModelImpl;
    .param p1, "x1"    # Z

    .prologue
    .line 26
    iput-boolean p1, p0, Lcom/vk/music/model/SearchResultModelImpl;->full:Z

    return p1
.end method

.method private fillResults()V
    .locals 3

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->results:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->localResults:Ljava/util/ArrayList;

    .line 166
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->globalResults:Ljava/util/ArrayList;

    .line 167
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->results:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/music/model/SearchResultModelImpl;->localResults:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->globalResults:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2}, Lcom/vk/music/model/SearchResultModelImpl;->fillResults(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 169
    :cond_0
    return-void
.end method

.method private static fillResults(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "results":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .local p1, "local":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .local p2, "global":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 35
    .local v0, "result":Lcom/vkontakte/android/audio/MusicTrack;
    iget v2, v0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 36
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 38
    :cond_0
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 41
    .end local v0    # "result":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_1
    return-void
.end method

.method private load(II)V
    .locals 4
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->loadResults:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 260
    :goto_0
    return-void

    .line 214
    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/audio/AudioSearch;

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->query:Ljava/lang/String;

    iget v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->mode:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-direct {v1, v2, v0, p1, p2}, Lcom/vkontakte/android/api/audio/AudioSearch;-><init>(Ljava/lang/String;ZII)V

    new-instance v0, Lcom/vk/music/model/SearchResultModelImpl$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/model/SearchResultModelImpl$1;-><init>(Lcom/vk/music/model/SearchResultModelImpl;I)V

    .line 215
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/audio/AudioSearch;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 259
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->loadResults:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 214
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method


# virtual methods
.method public canLoadMore()Z
    .locals 1

    .prologue
    .line 178
    iget-boolean v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->full:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public clearCallbacks()V
    .locals 3

    .prologue
    .line 264
    invoke-super {p0}, Lcom/vk/music/model/ObservableModel;->clearCallbacks()V

    .line 265
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vk/music/model/ModelHelper;->clearCallbacksAll([Lcom/vk/music/model/ActiveModel;)V

    .line 266
    return-void
.end method

.method public getCommunities()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->communities:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getError()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 206
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->errorMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getGlobalResults()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->globalResults:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 158
    invoke-direct {p0}, Lcom/vk/music/model/SearchResultModelImpl;->fillResults()V

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->globalResults:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getLocalResults()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 147
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->localResults:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 148
    invoke-direct {p0}, Lcom/vk/music/model/SearchResultModelImpl;->fillResults()V

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->localResults:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    return-object v0
.end method

.method public getPlayerModel()Lcom/vk/music/model/PlayerModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 194
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    return-object v0
.end method

.method public getQuery()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->query:Ljava/lang/String;

    return-object v0
.end method

.method public getResults()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->results:Ljava/util/ArrayList;

    return-object v0
.end method

.method public isLoaded()Z
    .locals 1

    .prologue
    .line 173
    iget-boolean v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->loaded:Z

    return v0
.end method

.method synthetic lambda$setQuery$0(Lcom/vk/music/model/SearchResultModel$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vk/music/model/SearchResultModel$Callback;

    .prologue
    .line 128
    invoke-interface {p1, p0}, Lcom/vk/music/model/SearchResultModel$Callback;->onQueryChanged(Lcom/vk/music/model/SearchResultModel;)V

    return-void
.end method

.method public loadMoreResults()V
    .locals 2

    .prologue
    .line 188
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->results:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->count(Ljava/util/Collection;)I

    move-result v0

    const/16 v1, 0x64

    invoke-direct {p0, v0, v1}, Lcom/vk/music/model/SearchResultModelImpl;->load(II)V

    .line 189
    return-void
.end method

.method public loadResults()V
    .locals 3

    .prologue
    .line 183
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/vk/music/model/SearchResultModelImpl;->results:Ljava/util/ArrayList;

    const/16 v2, 0x64

    invoke-static {v1, v2}, Lcom/vk/core/util/CollectionUtils;->countIfNotLess(Ljava/util/Collection;I)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/vk/music/model/SearchResultModelImpl;->load(II)V

    .line 184
    return-void
.end method

.method public release()V
    .locals 3

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->loadResults:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->loadResults:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 99
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vk/music/model/ModelHelper;->releaseAll([Lcom/vk/music/model/ActiveModel;)V

    .line 100
    return-void
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 73
    const-string/jumbo v0, "loaded"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->loaded:Z

    .line 74
    const-string/jumbo v0, "full"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->full:Z

    .line 75
    const-string/jumbo v0, "communities"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->communities:Ljava/util/ArrayList;

    .line 76
    const-string/jumbo v0, "local"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->localResults:Ljava/util/ArrayList;

    .line 77
    const-string/jumbo v0, "global"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl;->globalResults:Ljava/util/ArrayList;

    .line 78
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v2, v0, v1

    invoke-static {p1, v0}, Lcom/vk/music/model/ModelHelper;->restoreAll(Landroid/os/Bundle;[Lcom/vk/music/model/ActiveModel;)V

    .line 79
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 84
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 85
    .local v0, "state":Landroid/os/Bundle;
    const-string/jumbo v1, "loaded"

    iget-boolean v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->loaded:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 86
    const-string/jumbo v1, "full"

    iget-boolean v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->full:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 87
    const-string/jumbo v1, "communities"

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->communities:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 88
    const-string/jumbo v1, "local"

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->localResults:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 89
    const-string/jumbo v1, "global"

    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->globalResults:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 90
    const/4 v1, 0x2

    new-array v1, v1, [Lcom/vk/music/model/ActiveModel;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vk/music/model/SearchResultModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vk/music/model/SearchResultModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/vk/music/model/ModelHelper;->saveAll(Landroid/os/Bundle;[Lcom/vk/music/model/ActiveModel;)V

    .line 91
    return-object v0
.end method

.method public setQuery(Ljava/lang/String;)V
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 110
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->query:Ljava/lang/String;

    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const/4 v0, 0x1

    .line 111
    .local v0, "changed":Z
    :goto_0
    if-eqz v0, :cond_4

    .line 112
    invoke-virtual {p0}, Lcom/vk/music/model/SearchResultModelImpl;->release()V

    .line 113
    iput-object p1, p0, Lcom/vk/music/model/SearchResultModelImpl;->query:Ljava/lang/String;

    .line 114
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->communities:Ljava/util/ArrayList;

    if-eqz v2, :cond_0

    .line 115
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->communities:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 117
    :cond_0
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->results:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    .line 118
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->results:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 120
    :cond_1
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->localResults:Ljava/util/ArrayList;

    if-eqz v2, :cond_2

    .line 121
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->localResults:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 123
    :cond_2
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->globalResults:Ljava/util/ArrayList;

    if-eqz v2, :cond_3

    .line 124
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl;->globalResults:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 126
    :cond_3
    iput-boolean v1, p0, Lcom/vk/music/model/SearchResultModelImpl;->loaded:Z

    .line 127
    iput-boolean v1, p0, Lcom/vk/music/model/SearchResultModelImpl;->full:Z

    .line 128
    invoke-static {p0}, Lcom/vk/music/model/SearchResultModelImpl$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/SearchResultModelImpl;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/music/model/SearchResultModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 130
    :cond_4
    return-void

    .end local v0    # "changed":Z
    :cond_5
    move v0, v1

    .line 110
    goto :goto_0
.end method

.method public bridge synthetic subscribe(Lcom/vk/music/model/SearchResultModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/SearchResultModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 26
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->subscribe(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic unsubscribe(Lcom/vk/music/model/SearchResultModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/SearchResultModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 26
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->unsubscribe(Ljava/lang/Object;)V

    return-void
.end method
