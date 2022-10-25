.class public final Lcom/vk/music/attach/controller/PlaylistsSearchController;
.super Lcom/vk/music/attach/controller/SearchController;
.source "PlaylistsSearchController.java"

# interfaces
.implements Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;


# static fields
.field private static final VIEW_TYPE_FOOTER1:I = 0x3

.field private static final VIEW_TYPE_FOOTER2:I = 0x4

.field private static final VIEW_TYPE_HEADER1:I = 0x1

.field private static final VIEW_TYPE_PLAYLIST:I = 0x2


# instance fields
.field emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vk/music/dto/Playlist;",
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
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field retryFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

.field searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/vk/music/attach/controller/SearchController;-><init>()V

    return-void
.end method

.method private bind()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 210
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v2}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->getPlaylistSearchResult()Lcom/vk/music/dto/PlaylistSearchResult;

    move-result-object v0

    .line 211
    .local v0, "searchResult":Lcom/vk/music/dto/PlaylistSearchResult;
    if-nez v0, :cond_2

    .line 212
    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v1}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->getReason()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 213
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 214
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 237
    :cond_0
    :goto_0
    return-void

    .line 217
    :cond_1
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 218
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 222
    :cond_2
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setRefreshing(Z)V

    .line 223
    invoke-virtual {v0}, Lcom/vk/music/dto/PlaylistSearchResult;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 224
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 225
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 228
    :cond_3
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v3}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->canLoadMore()Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 229
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0}, Lcom/vk/music/dto/PlaylistSearchResult;->getLocal()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 230
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->globalResultsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0}, Lcom/vk/music/dto/PlaylistSearchResult;->getGlobal()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_4

    const/4 v1, 0x1

    :cond_4
    invoke-virtual {v2, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 231
    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0}, Lcom/vk/music/dto/PlaylistSearchResult;->getGlobal()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 232
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-eq v1, v2, :cond_0

    .line 233
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0
.end method

.method static synthetic lambda$onViewAttached$0(Landroid/view/View;)V
    .locals 2
    .param p0, "itemView"    # Landroid/view/View;

    .prologue
    .line 82
    const v0, 0x7f1003e1

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method static synthetic lambda$onViewAttached$2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 94
    const v1, 0x7f03012c

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 95
    .local v0, "captionView":Landroid/widget/TextView;
    const v1, 0x7f0803a8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 96
    return-object v0
.end method

.method static synthetic lambda$onViewAttached$5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 117
    const v1, 0x7f030025

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 118
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f10019e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f0803d1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 119
    return-object v0
.end method

.method private onPlaylistClick(Lcom/vk/music/dto/Playlist;)V
    .locals 4
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 195
    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    if-nez v1, :cond_0

    .line 196
    move-object v0, p1

    .line 206
    .local v0, "original":Lcom/vk/music/dto/Playlist;
    :goto_0
    const-class v1, Lcom/vk/music/attach/controller/PlaylistMusicController;

    new-instance v2, Lcom/vk/music/utils/Bundler;

    invoke-direct {v2}, Lcom/vk/music/utils/Bundler;-><init>()V

    const-string/jumbo v3, "PlaylistMusicController.arg.playlist"

    invoke-virtual {v2, v3, v0}, Lcom/vk/music/utils/Bundler;->put(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->moveNext(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 207
    return-void

    .line 198
    .end local v0    # "original":Lcom/vk/music/dto/Playlist;
    :cond_0
    new-instance v0, Lcom/vk/music/dto/Playlist;

    invoke-direct {v0, p1}, Lcom/vk/music/dto/Playlist;-><init>(Lcom/vk/music/dto/Playlist;)V

    .line 199
    .restart local v0    # "original":Lcom/vk/music/dto/Playlist;
    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iget v1, v1, Lcom/vk/music/dto/PlaylistLink;->id:I

    iput v1, v0, Lcom/vk/music/dto/Playlist;->id:I

    .line 200
    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iget v1, v1, Lcom/vk/music/dto/PlaylistLink;->ownerId:I

    iput v1, v0, Lcom/vk/music/dto/Playlist;->ownerId:I

    .line 201
    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iget-object v1, v1, Lcom/vk/music/dto/PlaylistLink;->accessKey:Ljava/lang/String;

    iput-object v1, v0, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    .line 202
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    .line 203
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vk/music/dto/Playlist;->following:Z

    .line 204
    new-instance v1, Lcom/vk/music/dto/PlaylistLink;

    iget v2, p1, Lcom/vk/music/dto/Playlist;->id:I

    iget v3, p1, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-direct {v1, v2, v3}, Lcom/vk/music/dto/PlaylistLink;-><init>(II)V

    iput-object v1, v0, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    goto :goto_0
.end method

.method private onRetryButtonClick()V
    .locals 2

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 190
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->load()V

    .line 191
    return-void
.end method


# virtual methods
.method synthetic lambda$null$3(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->onRetryButtonClick()V

    return-void
.end method

.method synthetic lambda$onViewAttached$1(Landroid/view/View;Lcom/vk/music/dto/Playlist;I)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
    .param p3, "position"    # I

    .prologue
    .line 84
    invoke-direct {p0, p2}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->onPlaylistClick(Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method synthetic lambda$onViewAttached$4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 108
    const v1, 0x7f030026

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 109
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f1001a2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$7;->lambdaFactory$(Lcom/vk/music/attach/controller/PlaylistsSearchController;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    return-object v0
.end method

.method public onBackClicked()Z
    .locals 5

    .prologue
    .line 156
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    const-class v1, Lcom/vk/music/attach/sharedstate/Search;

    new-instance v2, Lcom/vk/music/utils/Bundler;

    invoke-direct {v2}, Lcom/vk/music/utils/Bundler;-><init>()V

    const-string/jumbo v3, "Search.expanded"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/vk/music/utils/Bundler;->put(Ljava/lang/String;Z)Landroid/os/Bundle;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->putSharedState(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 157
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->moveBack()V

    .line 158
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
    .line 63
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/SearchController;->onCreate(Landroid/os/Bundle;)V

    .line 64
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->setRetainInstance(Z)V

    .line 65
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    const-class v1, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->addLoader(Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    iput-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    .line 66
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 70
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onDestroy()V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    .line 72
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    const-class v1, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->destroyLoader(Ljava/lang/Class;)V

    .line 73
    return-void
.end method

.method protected onEndOfListReached()V
    .locals 1

    .prologue
    .line 182
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onEndOfListReached()V

    .line 183
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->canLoadMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->loadMore()V

    .line 186
    :cond_0
    return-void
.end method

.method protected onLeftButtonClicked()V
    .locals 5

    .prologue
    .line 163
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onLeftButtonClicked()V

    .line 164
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    const-class v1, Lcom/vk/music/attach/sharedstate/Search;

    new-instance v2, Lcom/vk/music/utils/Bundler;

    invoke-direct {v2}, Lcom/vk/music/utils/Bundler;-><init>()V

    const-string/jumbo v3, "Search.expanded"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/vk/music/utils/Bundler;->put(Ljava/lang/String;Z)Landroid/os/Bundle;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->putSharedState(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 165
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->moveBack()V

    .line 166
    return-void
.end method

.method protected onRefreshRequested()V
    .locals 1

    .prologue
    .line 176
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onRefreshRequested()V

    .line 177
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->load()V

    .line 178
    return-void
.end method

.method protected onRightButtonClicked()V
    .locals 0

    .prologue
    .line 170
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onRightButtonClicked()V

    .line 171
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->moveBack()V

    .line 172
    return-void
.end method

.method public onSearchResultsLoadingDone(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 241
    invoke-direct {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->bind()V

    .line 242
    return-void
.end method

.method public onSearchResultsLoadingError(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;Ljava/lang/String;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "error"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 246
    invoke-direct {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->bind()V

    .line 247
    return-void
.end method

.method public onSearchResultsLoadingMoreDone(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;Lcom/vk/music/dto/PlaylistSearchResult;)V
    .locals 2
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlistSearchResult"    # Lcom/vk/music/dto/PlaylistSearchResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 251
    invoke-virtual {p2}, Lcom/vk/music/dto/PlaylistSearchResult;->getLocal()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {p2}, Lcom/vk/music/dto/PlaylistSearchResult;->getLocal()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 254
    :cond_0
    invoke-virtual {p2}, Lcom/vk/music/dto/PlaylistSearchResult;->getGlobal()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 255
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {p2}, Lcom/vk/music/dto/PlaylistSearchResult;->getGlobal()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 257
    :cond_1
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {p1}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->canLoadMore()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 258
    return-void
.end method

.method public onSearchResultsLoadingMoreError(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;Ljava/lang/String;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "error"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 263
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 144
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onStart()V

    .line 145
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->load()V

    .line 146
    return-void
.end method

.method protected onStartSearch()V
    .locals 2

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 52
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getSearchText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->setQuery(Ljava/lang/String;)V

    .line 53
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->load()V

    .line 54
    return-void
.end method

.method protected onStopSearch()V
    .locals 0

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->moveBack()V

    .line 59
    return-void
.end method

.method protected onViewAttached(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 77
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/SearchController;->onViewAttached(Landroid/os/Bundle;)V

    .line 78
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-nez v2, :cond_0

    .line 79
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 80
    .local v0, "inflater":Landroid/view/LayoutInflater;
    new-instance v2, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    invoke-direct {v2, v0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v3, 0x7f030141

    .line 81
    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    invoke-static {}, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$1;->lambdaFactory$()Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

    move-result-object v3

    .line 82
    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    new-instance v3, Lcom/vk/music/view/adapter/PlaylistBinder;

    .line 83
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vk/music/view/adapter/PlaylistBinder;-><init>(Lcom/vk/core/util/Resourcer;)V

    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    invoke-static {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$2;->lambdaFactory$(Lcom/vk/music/attach/controller/PlaylistsSearchController;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v3

    .line 84
    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    const/4 v3, 0x2

    .line 85
    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    invoke-static {}, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$3;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v3

    .line 86
    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v1

    .line 88
    .local v1, "playlistAdapterBuilder":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<Lcom/vk/music/dto/Playlist;>;"
    new-instance v2, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 89
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v2, v6}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 90
    invoke-virtual {v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 91
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v2, v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 92
    new-instance v2, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {v0}, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$4;->lambdaFactory$(Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v3

    invoke-direct {v2, v3, v6}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->globalResultsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 100
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->globalResultsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v2, v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 101
    invoke-virtual {v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 102
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v2, v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 103
    new-instance v2, Lcom/vk/music/view/adapter/ViewAdapter;

    const v3, 0x7f030132

    const/4 v4, 0x3

    invoke-direct {v2, v0, v3, v4}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 104
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchResultsAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v2, v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 106
    new-instance v2, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0, v0}, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$5;->lambdaFactory$(Lcom/vk/music/attach/controller/PlaylistsSearchController;Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v3

    invoke-direct {v2, v3, v5}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 115
    new-instance v2, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {v0}, Lcom/vk/music/attach/controller/PlaylistsSearchController$$Lambda$6;->lambdaFactory$(Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v3

    invoke-direct {v2, v3, v5}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 124
    new-instance v2, Lcom/vk/music/view/adapter/ViewAdapter;

    const v3, 0x7f030138

    invoke-direct {v2, v0, v3, v5}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 127
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    .end local v1    # "playlistAdapterBuilder":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<Lcom/vk/music/dto/Playlist;>;"
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getLeftButton()Landroid/widget/ImageView;

    move-result-object v2

    const v3, 0x7f02014f

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 128
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v2

    const v3, 0x7f020354

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 129
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 130
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getTitleView()Landroid/widget/TextView;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 131
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setVisibility(I)V

    .line 132
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v2

    const v3, 0x7f0803b0

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(I)V

    .line 134
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getSearchText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->setQuery(Ljava/lang/String;)V

    .line 135
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v2, p0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->subscribe(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;)V

    .line 137
    invoke-direct {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->bind()V

    .line 139
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsSearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/KeyboardUtils;->showKeyboard(Landroid/view/View;)V

    .line 140
    return-void
.end method

.method protected onViewDetached()V
    .locals 1

    .prologue
    .line 150
    invoke-super {p0}, Lcom/vk/music/attach/controller/SearchController;->onViewDetached()V

    .line 151
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsSearchController;->searchLoader:Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;

    invoke-virtual {v0, p0}, Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader;->unsubscribe(Lcom/vk/music/attach/loader/PlaylistSearchResultsLoader$Callback;)V

    .line 152
    return-void
.end method
