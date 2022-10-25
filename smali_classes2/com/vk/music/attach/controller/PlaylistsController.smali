.class public final Lcom/vk/music/attach/controller/PlaylistsController;
.super Lcom/vk/music/attach/controller/Controller;
.source "PlaylistsController.java"

# interfaces
.implements Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;


# static fields
.field private static final KEY_SEARCH_EXPANDED:Ljava/lang/String; = "PlaylistsController.key.searchExpanded"

.field private static final VIEW_TYPE_FOOTER1:I = 0x2

.field private static final VIEW_TYPE_FOOTER2:I = 0x3

.field private static final VIEW_TYPE_PLAYLIST:I = 0x1


# instance fields
.field contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

.field emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
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

.field searchExpanded:Z

.field searchStarterWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vk/music/attach/controller/Controller;-><init>()V

    .line 49
    new-instance v0, Lcom/vk/music/attach/controller/PlaylistsController$1;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/controller/PlaylistsController$1;-><init>(Lcom/vk/music/attach/controller/PlaylistsController;)V

    iput-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchStarterWatcher:Landroid/text/TextWatcher;

    return-void
.end method

.method private bind(Lcom/vk/music/attach/loader/PlaylistsLoader;)V
    .locals 3
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 237
    invoke-virtual {p1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->getPlaylists()Ljava/util/List;

    move-result-object v0

    .line 238
    .local v0, "playlists":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/dto/Playlist;>;"
    if-nez v0, :cond_2

    .line 239
    invoke-virtual {p1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->getReason()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 240
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 241
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 262
    :cond_0
    :goto_0
    return-void

    .line 244
    :cond_1
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 245
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 249
    :cond_2
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setRefreshing(Z)V

    .line 250
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 251
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 252
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 255
    :cond_3
    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistsController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {p1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 256
    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistsController;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 257
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-eq v1, v2, :cond_0

    .line 258
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0
.end method

.method private bindExpanded()V
    .locals 4

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 265
    iget-boolean v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    if-eqz v0, :cond_1

    .line 266
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->supportsVoiceSearch()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 267
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f020157

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 268
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 272
    :goto_0
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 273
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getTitleView()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 280
    :goto_1
    return-void

    .line 270
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 275
    :cond_1
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f0201f7

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 276
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 277
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setVisibility(I)V

    .line 278
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getTitleView()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method

.method static synthetic lambda$onViewAttached$0(Landroid/view/View;)V
    .locals 2
    .param p0, "itemView"    # Landroid/view/View;

    .prologue
    .line 96
    const v0, 0x7f1003e1

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method static synthetic lambda$onViewAttached$4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
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

    const v2, 0x7f0803cc

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
    .line 222
    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    if-nez v1, :cond_0

    .line 223
    move-object v0, p1

    .line 233
    .local v0, "original":Lcom/vk/music/dto/Playlist;
    :goto_0
    const-class v1, Lcom/vk/music/attach/controller/PlaylistMusicController;

    new-instance v2, Lcom/vk/music/utils/Bundler;

    invoke-direct {v2}, Lcom/vk/music/utils/Bundler;-><init>()V

    const-string/jumbo v3, "PlaylistMusicController.arg.playlist"

    invoke-virtual {v2, v3, v0}, Lcom/vk/music/utils/Bundler;->put(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/vk/music/attach/controller/PlaylistsController;->moveNext(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 234
    return-void

    .line 225
    .end local v0    # "original":Lcom/vk/music/dto/Playlist;
    :cond_0
    new-instance v0, Lcom/vk/music/dto/Playlist;

    invoke-direct {v0, p1}, Lcom/vk/music/dto/Playlist;-><init>(Lcom/vk/music/dto/Playlist;)V

    .line 226
    .restart local v0    # "original":Lcom/vk/music/dto/Playlist;
    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iget v1, v1, Lcom/vk/music/dto/PlaylistLink;->id:I

    iput v1, v0, Lcom/vk/music/dto/Playlist;->id:I

    .line 227
    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iget v1, v1, Lcom/vk/music/dto/PlaylistLink;->ownerId:I

    iput v1, v0, Lcom/vk/music/dto/Playlist;->ownerId:I

    .line 228
    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iget-object v1, v1, Lcom/vk/music/dto/PlaylistLink;->accessKey:Ljava/lang/String;

    iput-object v1, v0, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    .line 229
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    .line 230
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vk/music/dto/Playlist;->following:Z

    .line 231
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
    .line 216
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistsController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 217
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistsLoader()Lcom/vk/music/attach/loader/PlaylistsLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistsLoader;->load()V

    .line 218
    return-void
.end method


# virtual methods
.method synthetic lambda$null$2(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->onRetryButtonClick()V

    return-void
.end method

.method synthetic lambda$onViewAttached$1(Landroid/view/View;Lcom/vk/music/dto/Playlist;I)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
    .param p3, "position"    # I

    .prologue
    .line 98
    invoke-direct {p0, p2}, Lcom/vk/music/attach/controller/PlaylistsController;->onPlaylistClick(Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method synthetic lambda$onViewAttached$3(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
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

    invoke-static {p0}, Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$6;->lambdaFactory$(Lcom/vk/music/attach/controller/PlaylistsController;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    return-object v0
.end method

.method public onBackClicked()Z
    .locals 1

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    if-eqz v0, :cond_0

    .line 162
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    .line 163
    invoke-direct {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->bindExpanded()V

    .line 164
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 165
    const/4 v0, 0x1

    .line 167
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onBackClicked()Z

    move-result v0

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 74
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/Controller;->onCreate(Landroid/os/Bundle;)V

    .line 75
    if-eqz p1, :cond_0

    .line 76
    const-string/jumbo v0, "PlaylistsController.key.searchExpanded"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    .line 78
    :cond_0
    return-void
.end method

.method protected onEndOfListReached()V
    .locals 1

    .prologue
    .line 202
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onEndOfListReached()V

    .line 203
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistsLoader()Lcom/vk/music/attach/loader/PlaylistsLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistsLoader()Lcom/vk/music/attach/loader/PlaylistsLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistsLoader;->loadMore()V

    .line 206
    :cond_0
    return-void
.end method

.method protected onLeftButtonClicked()V
    .locals 1

    .prologue
    .line 172
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onLeftButtonClicked()V

    .line 173
    iget-boolean v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    if-eqz v0, :cond_0

    .line 174
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    .line 175
    invoke-direct {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->bindExpanded()V

    .line 176
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 180
    :goto_0
    return-void

    .line 178
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->moveBack()V

    goto :goto_0
.end method

.method public onPlaylistsLoadingDone(Lcom/vk/music/attach/loader/PlaylistsLoader;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 284
    invoke-direct {p0, p1}, Lcom/vk/music/attach/controller/PlaylistsController;->bind(Lcom/vk/music/attach/loader/PlaylistsLoader;)V

    .line 285
    return-void
.end method

.method public onPlaylistsLoadingError(Lcom/vk/music/attach/loader/PlaylistsLoader;Ljava/lang/String;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reason"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 289
    invoke-direct {p0, p1}, Lcom/vk/music/attach/controller/PlaylistsController;->bind(Lcom/vk/music/attach/loader/PlaylistsLoader;)V

    .line 290
    return-void
.end method

.method public onPlaylistsLoadingMoreDone(Lcom/vk/music/attach/loader/PlaylistsLoader;Ljava/util/List;)V
    .locals 2
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistsLoader;
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
            "Lcom/vk/music/attach/loader/PlaylistsLoader;",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 294
    .local p2, "playlists":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/dto/Playlist;>;"
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 295
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {p1}, Lcom/vk/music/attach/loader/PlaylistsLoader;->canLoadMore()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 296
    return-void
.end method

.method public onPlaylistsLoadingMoreError(Lcom/vk/music/attach/loader/PlaylistsLoader;Ljava/lang/String;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistsLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reason"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 301
    return-void
.end method

.method protected onRefreshRequested()V
    .locals 1

    .prologue
    .line 196
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onRefreshRequested()V

    .line 197
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistsLoader()Lcom/vk/music/attach/loader/PlaylistsLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistsLoader;->load()V

    .line 198
    return-void
.end method

.method protected onRightButtonClicked()V
    .locals 1

    .prologue
    .line 184
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onRightButtonClicked()V

    .line 185
    iget-boolean v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->startVoiceSearch()V

    .line 192
    :goto_0
    return-void

    .line 188
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    .line 189
    invoke-direct {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->bindExpanded()V

    .line 190
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->showKeyboard(Landroid/view/View;)V

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 68
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/Controller;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 69
    const-string/jumbo v0, "PlaylistsController.key.searchExpanded"

    iget-boolean v1, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 70
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 154
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onStart()V

    .line 156
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistsLoader()Lcom/vk/music/attach/loader/PlaylistsLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistsLoader;->load()V

    .line 157
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

    .line 82
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/Controller;->onViewAttached(Landroid/os/Bundle;)V

    .line 84
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    const-class v3, Lcom/vk/music/attach/sharedstate/Search;

    invoke-interface {v2, v3}, Lcom/vk/music/attach/controller/Controller$HostController;->getSharedState(Ljava/lang/Class;)Landroid/os/Bundle;

    move-result-object v1

    .line 85
    .local v1, "sharedState":Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 86
    const-string/jumbo v2, "Search.expanded"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    .line 87
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    const-class v3, Lcom/vk/music/attach/sharedstate/Search;

    invoke-interface {v2, v3}, Lcom/vk/music/attach/controller/Controller$HostController;->removeSharedState(Ljava/lang/Class;)V

    .line 90
    :cond_0
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-nez v2, :cond_1

    .line 91
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 92
    .local v0, "inflater":Landroid/view/LayoutInflater;
    new-instance v2, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 93
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v2, v6}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 94
    new-instance v2, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    invoke-direct {v2, v0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v3, 0x7f030141

    .line 95
    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    invoke-static {}, Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$1;->lambdaFactory$()Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

    move-result-object v3

    .line 96
    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    new-instance v3, Lcom/vk/music/view/adapter/PlaylistBinder;

    .line 97
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vk/music/view/adapter/PlaylistBinder;-><init>(Lcom/vk/core/util/Resourcer;)V

    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    invoke-static {p0}, Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$2;->lambdaFactory$(Lcom/vk/music/attach/controller/PlaylistsController;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v3

    .line 98
    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    .line 99
    invoke-virtual {v2, v6}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    invoke-static {}, Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$3;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v3

    .line 100
    invoke-virtual {v2, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v2

    .line 101
    invoke-virtual {v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 102
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/PlaylistsController;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v2, v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 103
    new-instance v2, Lcom/vk/music/view/adapter/ViewAdapter;

    const v3, 0x7f030132

    const/4 v4, 0x2

    invoke-direct {v2, v0, v3, v4}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 104
    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/PlaylistsController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v2, v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 106
    new-instance v2, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0, v0}, Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$4;->lambdaFactory$(Lcom/vk/music/attach/controller/PlaylistsController;Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v3

    invoke-direct {v2, v3, v5}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 115
    new-instance v2, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {v0}, Lcom/vk/music/attach/controller/PlaylistsController$$Lambda$5;->lambdaFactory$(Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v3

    invoke-direct {v2, v3, v5}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 124
    new-instance v2, Lcom/vk/music/view/adapter/ViewAdapter;

    const v3, 0x7f030138

    invoke-direct {v2, v0, v3, v5}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    iput-object v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 127
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    :cond_1
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getLeftButton()Landroid/widget/ImageView;

    move-result-object v2

    const v3, 0x7f02014f

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 128
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getTitleView()Landroid/widget/TextView;

    move-result-object v2

    const v3, 0x7f080401

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 129
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 130
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchStarterWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 132
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistsLoader()Lcom/vk/music/attach/loader/PlaylistsLoader;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/vk/music/attach/loader/PlaylistsLoader;->subscribe(Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;)V

    .line 134
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistsLoader()Lcom/vk/music/attach/loader/PlaylistsLoader;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/vk/music/attach/controller/PlaylistsController;->bind(Lcom/vk/music/attach/loader/PlaylistsLoader;)V

    .line 135
    invoke-direct {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->bindExpanded()V

    .line 137
    iget-boolean v2, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchExpanded:Z

    if-eqz v2, :cond_2

    .line 138
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/KeyboardUtils;->showKeyboard(Landroid/view/View;)V

    .line 142
    :goto_0
    return-void

    .line 140
    :cond_2
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    goto :goto_0
.end method

.method protected onViewDetached()V
    .locals 2

    .prologue
    .line 146
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onViewDetached()V

    .line 147
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistsController;->searchStarterWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 149
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistsLoader()Lcom/vk/music/attach/loader/PlaylistsLoader;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vk/music/attach/loader/PlaylistsLoader;->unsubscribe(Lcom/vk/music/attach/loader/PlaylistsLoader$Callback;)V

    .line 150
    return-void
.end method

.method public onVoiceSearchResult(Ljava/lang/String;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 210
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/Controller;->onVoiceSearchResult(Ljava/lang/String;)V

    .line 211
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 212
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistsController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 213
    return-void
.end method
