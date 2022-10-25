.class public final Lcom/vk/music/attach/controller/MyMusicSearchController;
.super Lcom/vk/music/attach/controller/SearchController;
.source "MyMusicSearchController.java"

# interfaces
.implements Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;


# static fields
.field private static final VIEW_TYPE_FOOTER1:I = 0x4

.field private static final VIEW_TYPE_FOOTER2:I = 0x5

.field private static final VIEW_TYPE_GLOBAL:I = 0x3

.field private static final VIEW_TYPE_HEADER1:I = 0x1

.field private static final VIEW_TYPE_LOCAL:I = 0x2


# instance fields
.field emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field globalResultsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field retryFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

.field searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/vk/music/attach/controller/SearchController;-><init>()V

    return-void
.end method

.method static synthetic access$lambda$0(Lcom/vk/music/attach/controller/MyMusicSearchController;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->onRetryButtonClick()V

    return-void
.end method

.method private bind()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 165
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v2}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->getMusicSearchResult()Lcom/vk/music/dto/MusicSearchResult;

    move-result-object v0

    .line 166
    .local v0, "searchResult":Lcom/vk/music/dto/MusicSearchResult;
    if-nez v0, :cond_2

    .line 167
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->getReason()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 168
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 169
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 192
    :cond_0
    :goto_0
    return-void

    .line 172
    :cond_1
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 173
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 177
    :cond_2
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setRefreshing(Z)V

    .line 178
    invoke-virtual {v0}, Lcom/vk/music/dto/MusicSearchResult;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 179
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 180
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 183
    :cond_3
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v3}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->canLoadMore()Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 184
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0}, Lcom/vk/music/dto/MusicSearchResult;->getLocal()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 185
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->globalResultsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0}, Lcom/vk/music/dto/MusicSearchResult;->getGlobal()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_4

    const/4 v1, 0x1

    :cond_4
    invoke-virtual {v2, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 186
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0}, Lcom/vk/music/dto/MusicSearchResult;->getGlobal()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 187
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-eq v1, v2, :cond_0

    .line 188
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0
.end method

.method static synthetic lambda$onViewAttached$0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 81
    const v1, 0x7f03012c

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 82
    .local v0, "captionView":Landroid/widget/TextView;
    const v1, 0x7f0803a8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 83
    return-object v0
.end method

.method private onRetryButtonClick()V
    .locals 2

    .prologue
    .line 160
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 161
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->load()V

    .line 162
    return-void
.end method


# virtual methods
.method public onBackClicked()Z
    .locals 5

    .prologue
    .line 127
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    const-class v1, Lcom/vk/music/attach/sharedstate/Search;

    new-instance v2, Lcom/vk/music/utils/Bundler;

    invoke-direct {v2}, Lcom/vk/music/utils/Bundler;-><init>()V

    const-string/jumbo v3, "Search.expanded"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/vk/music/utils/Bundler;->put(Ljava/lang/String;Z)Landroid/os/Bundle;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->putSharedState(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 128
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->moveBack()V

    .line 129
    const/4 v0, 0x1

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 60
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/SearchController;->onCreate(Landroid/os/Bundle;)V

    .line 61
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->setRetainInstance(Z)V

    .line 62
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    const-class v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->addLoader(Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iput-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    .line 63
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 67
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onDestroy()V

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    .line 69
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    const-class v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->destroyLoader(Ljava/lang/Class;)V

    .line 70
    return-void
.end method

.method protected onEndOfListReached()V
    .locals 1

    .prologue
    .line 153
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onEndOfListReached()V

    .line 154
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->canLoadMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->loadMore()V

    .line 157
    :cond_0
    return-void
.end method

.method protected onLeftButtonClicked()V
    .locals 5

    .prologue
    .line 134
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onLeftButtonClicked()V

    .line 135
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    const-class v1, Lcom/vk/music/attach/sharedstate/Search;

    new-instance v2, Lcom/vk/music/utils/Bundler;

    invoke-direct {v2}, Lcom/vk/music/utils/Bundler;-><init>()V

    const-string/jumbo v3, "Search.expanded"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/vk/music/utils/Bundler;->put(Ljava/lang/String;Z)Landroid/os/Bundle;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->putSharedState(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 136
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->moveBack()V

    .line 137
    return-void
.end method

.method protected onRefreshRequested()V
    .locals 1

    .prologue
    .line 147
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onRefreshRequested()V

    .line 148
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->load()V

    .line 149
    return-void
.end method

.method protected onRightButtonClicked()V
    .locals 0

    .prologue
    .line 141
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onRightButtonClicked()V

    .line 142
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->moveBack()V

    .line 143
    return-void
.end method

.method public onSearchResultsLoadingDone(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 196
    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->bind()V

    .line 197
    return-void
.end method

.method public onSearchResultsLoadingError(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Ljava/lang/String;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "error"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 201
    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->bind()V

    .line 202
    return-void
.end method

.method public onSearchResultsLoadingMoreDone(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vk/music/dto/MusicSearchResult;)V
    .locals 2
    .param p1, "loader"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicSearchResult"    # Lcom/vk/music/dto/MusicSearchResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 206
    invoke-virtual {p2}, Lcom/vk/music/dto/MusicSearchResult;->getLocal()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 207
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {p2}, Lcom/vk/music/dto/MusicSearchResult;->getLocal()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 209
    :cond_0
    invoke-virtual {p2}, Lcom/vk/music/dto/MusicSearchResult;->getGlobal()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 210
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {p2}, Lcom/vk/music/dto/MusicSearchResult;->getGlobal()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 212
    :cond_1
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {p1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->canLoadMore()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 213
    return-void
.end method

.method public onSearchResultsLoadingMoreError(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Ljava/lang/String;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "error"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 218
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 115
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onStart()V

    .line 116
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->load()V

    .line 117
    return-void
.end method

.method protected onStartSearch()V
    .locals 2

    .prologue
    .line 48
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 49
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getSearchText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->setQuery(Ljava/lang/String;)V

    .line 50
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->load()V

    .line 51
    return-void
.end method

.method protected onStopSearch()V
    .locals 0

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->moveBack()V

    .line 56
    return-void
.end method

.method protected onViewAttached(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x1

    .line 74
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/SearchController;->onViewAttached(Landroid/os/Bundle;)V

    .line 76
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-nez v1, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 78
    .local v0, "inflater":Landroid/view/LayoutInflater;
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Lcom/vk/music/attach/controller/AdapterHelper;->createMusicAdapter(Landroid/view/LayoutInflater;Lcom/vk/music/attach/controller/Controller$HostController;I)Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 79
    new-instance v1, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {v0}, Lcom/vk/music/attach/controller/MyMusicSearchController$$Lambda$1;->lambdaFactory$(Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v2

    invoke-direct {v1, v2, v3}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->globalResultsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 87
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    const/4 v2, 0x3

    invoke-static {v0, v1, v2}, Lcom/vk/music/attach/controller/AdapterHelper;->createMusicAdapter(Landroid/view/LayoutInflater;Lcom/vk/music/attach/controller/Controller$HostController;I)Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 88
    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/vk/music/attach/controller/AdapterHelper;->createLoadingFooterAdapter(Landroid/view/LayoutInflater;I)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 89
    invoke-static {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController$$Lambda$2;->lambdaFactory$(Lcom/vk/music/attach/controller/MyMusicSearchController;)Lcom/vkontakte/android/functions/VoidF;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/controller/AdapterHelper;->createErrorAdapter(Landroid/view/LayoutInflater;Lcom/vkontakte/android/functions/VoidF;)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 90
    invoke-static {v0}, Lcom/vk/music/attach/controller/AdapterHelper;->createEmptyAdapter(Landroid/view/LayoutInflater;)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 91
    invoke-static {v0}, Lcom/vk/music/attach/controller/AdapterHelper;->createLoaderAdapter(Landroid/view/LayoutInflater;)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 93
    new-instance v1, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 94
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v1, v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 95
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1, v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 96
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->globalResultsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v1, v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 97
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1, v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 98
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v1, v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 101
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getLeftButton()Landroid/widget/ImageView;

    move-result-object v1

    const v2, 0x7f02014f

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 102
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v1

    const v2, 0x7f020354

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 103
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getTitleView()Landroid/widget/TextView;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 104
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 105
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v1

    const v2, 0x7f0803b2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(I)V

    .line 107
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->getSearchText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->setQuery(Ljava/lang/String;)V

    .line 108
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v1, p0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->subscribe(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;)V

    .line 110
    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicSearchController;->bind()V

    .line 111
    return-void
.end method

.method protected onViewDetached()V
    .locals 1

    .prologue
    .line 121
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onViewDetached()V

    .line 122
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicSearchController;->searchLoader:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {v0, p0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->unsubscribe(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;)V

    .line 123
    return-void
.end method
