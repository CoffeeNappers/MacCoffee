.class public final Lcom/vk/music/attach/controller/MyMusicController;
.super Lcom/vk/music/attach/controller/Controller;
.source "MyMusicController.java"

# interfaces
.implements Lcom/vk/music/attach/loader/MusicLoader$Callback;


# static fields
.field private static final KEY_SEARCH_EXPANDED:Ljava/lang/String; = "MyMusicController.key.searchExpanded"

.field private static final VIEW_TYPE_FOOTER1:I = 0x3

.field private static final VIEW_TYPE_FOOTER2:I = 0x4

.field private static final VIEW_TYPE_HEADER:I = 0x1

.field private static final VIEW_TYPE_MUSIC_TRACK:I = 0x2


# instance fields
.field contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

.field emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field musicTrackAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field playlistCounterView:Landroid/widget/TextView;

.field playlistsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field retryFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field searchExpanded:Z

.field searchStarterWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/vk/music/attach/controller/Controller;-><init>()V

    .line 50
    new-instance v0, Lcom/vk/music/attach/controller/MyMusicController$1;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/controller/MyMusicController$1;-><init>(Lcom/vk/music/attach/controller/MyMusicController;)V

    iput-object v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchStarterWatcher:Landroid/text/TextWatcher;

    return-void
.end method

.method static synthetic access$lambda$0(Lcom/vk/music/attach/controller/MyMusicController;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicController;->onRetryButtonClick()V

    return-void
.end method

.method private bind(Lcom/vk/music/attach/loader/MusicLoader;)V
    .locals 3
    .param p1, "loader"    # Lcom/vk/music/attach/loader/MusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 215
    invoke-virtual {p1}, Lcom/vk/music/attach/loader/MusicLoader;->getMusicTracks()Ljava/util/List;

    move-result-object v0

    .line 216
    .local v0, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-nez v0, :cond_2

    .line 217
    invoke-virtual {p1}, Lcom/vk/music/attach/loader/MusicLoader;->getReason()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 218
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 219
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 241
    :cond_0
    :goto_0
    return-void

    .line 222
    :cond_1
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 223
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 227
    :cond_2
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setRefreshing(Z)V

    .line 228
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 229
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 230
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 233
    :cond_3
    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicController;->updatePlaylistCounterView()V

    .line 234
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {p1}, Lcom/vk/music/attach/loader/MusicLoader;->canLoadMore()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 235
    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicController;->musicTrackAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 236
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-eq v1, v2, :cond_0

    .line 237
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0
.end method

.method private bindExpanded()V
    .locals 4

    .prologue
    const/16 v3, 0x8

    const/4 v1, 0x0

    .line 244
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->playlistsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-boolean v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 245
    iget-boolean v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    if-eqz v0, :cond_2

    .line 246
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getLeftButton()Landroid/widget/ImageView;

    move-result-object v0

    const v2, 0x7f02014f

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 247
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->supportsVoiceSearch()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 248
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    const v2, 0x7f020157

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 249
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 253
    :goto_1
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 254
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getTitleView()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 262
    :goto_2
    return-void

    :cond_0
    move v0, v1

    .line 244
    goto :goto_0

    .line 251
    :cond_1
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    .line 256
    :cond_2
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getLeftButton()Landroid/widget/ImageView;

    move-result-object v0

    const v2, 0x7f020354

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 257
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    const v2, 0x7f0201f7

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 258
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 259
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setVisibility(I)V

    .line 260
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getTitleView()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2
.end method

.method private onPlaylistsButtonClick()V
    .locals 1

    .prologue
    .line 194
    const-class v0, Lcom/vk/music/attach/controller/PlaylistsController;

    invoke-virtual {p0, v0}, Lcom/vk/music/attach/controller/MyMusicController;->moveNext(Ljava/lang/Class;)V

    .line 195
    return-void
.end method

.method private onRetryButtonClick()V
    .locals 2

    .prologue
    .line 198
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 199
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicLoader;->load()V

    .line 200
    return-void
.end method

.method private updatePlaylistCounterView()V
    .locals 4

    .prologue
    .line 210
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/music/attach/loader/MusicLoader;->getPlaylistsCount()Ljava/lang/Integer;

    move-result-object v0

    .line 211
    .local v0, "playlistsCount":Ljava/lang/Integer;
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->playlistCounterView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    const/4 v3, 0x1

    invoke-static {v2, v1, v3}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 212
    return-void

    .line 211
    :cond_0
    const-string/jumbo v1, ""

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$null$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicController;->onPlaylistsButtonClick()V

    return-void
.end method

.method synthetic lambda$onViewAttached$1(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 98
    const v1, 0x7f030135

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 99
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f1003d1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/music/attach/controller/MyMusicController$$Lambda$3;->lambdaFactory$(Lcom/vk/music/attach/controller/MyMusicController;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    const v1, 0x7f1003d2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/attach/controller/MyMusicController;->playlistCounterView:Landroid/widget/TextView;

    .line 101
    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicController;->updatePlaylistCounterView()V

    .line 102
    return-object v0
.end method

.method public onBackClicked()Z
    .locals 1

    .prologue
    .line 146
    iget-boolean v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    if-eqz v0, :cond_0

    .line 147
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    .line 148
    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicController;->bindExpanded()V

    .line 149
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 150
    const/4 v0, 0x1

    .line 152
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
    .line 75
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/Controller;->onCreate(Landroid/os/Bundle;)V

    .line 76
    if-eqz p1, :cond_0

    .line 77
    const-string/jumbo v0, "MyMusicController.key.searchExpanded"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    .line 79
    :cond_0
    return-void
.end method

.method protected onEndOfListReached()V
    .locals 1

    .prologue
    .line 187
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onEndOfListReached()V

    .line 188
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicLoader;->canLoadMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicLoader;->loadMore()V

    .line 191
    :cond_0
    return-void
.end method

.method protected onLeftButtonClicked()V
    .locals 1

    .prologue
    .line 157
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onLeftButtonClicked()V

    .line 158
    iget-boolean v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    if-eqz v0, :cond_0

    .line 159
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    .line 160
    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicController;->bindExpanded()V

    .line 161
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 165
    :goto_0
    return-void

    .line 163
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->close()V

    goto :goto_0
.end method

.method public onMusicLoadingDone(Lcom/vk/music/attach/loader/MusicLoader;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/MusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 266
    invoke-direct {p0, p1}, Lcom/vk/music/attach/controller/MyMusicController;->bind(Lcom/vk/music/attach/loader/MusicLoader;)V

    .line 267
    return-void
.end method

.method public onMusicLoadingError(Lcom/vk/music/attach/loader/MusicLoader;Ljava/lang/String;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/MusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reason"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 271
    invoke-direct {p0, p1}, Lcom/vk/music/attach/controller/MyMusicController;->bind(Lcom/vk/music/attach/loader/MusicLoader;)V

    .line 272
    return-void
.end method

.method public onMusicLoadingMoreDone(Lcom/vk/music/attach/loader/MusicLoader;Ljava/util/List;)V
    .locals 2
    .param p1, "loader"    # Lcom/vk/music/attach/loader/MusicLoader;
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
            "Lcom/vk/music/attach/loader/MusicLoader;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 276
    .local p2, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->musicTrackAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 277
    iget-object v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {p1}, Lcom/vk/music/attach/loader/MusicLoader;->canLoadMore()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 278
    return-void
.end method

.method public onMusicLoadingMoreError(Lcom/vk/music/attach/loader/MusicLoader;Ljava/lang/String;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/MusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reason"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 281
    return-void
.end method

.method protected onRefreshRequested()V
    .locals 1

    .prologue
    .line 181
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onRefreshRequested()V

    .line 182
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicLoader;->load()V

    .line 183
    return-void
.end method

.method protected onRightButtonClicked()V
    .locals 1

    .prologue
    .line 169
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onRightButtonClicked()V

    .line 170
    iget-boolean v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    if-eqz v0, :cond_0

    .line 171
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->startVoiceSearch()V

    .line 177
    :goto_0
    return-void

    .line 173
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    .line 174
    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicController;->bindExpanded()V

    .line 175
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

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
    .line 69
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/Controller;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 70
    const-string/jumbo v0, "MyMusicController.key.searchExpanded"

    iget-boolean v1, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 71
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 140
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onStart()V

    .line 141
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/MusicLoader;->load()V

    .line 142
    return-void
.end method

.method protected onViewAttached(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x1

    .line 83
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/Controller;->onViewAttached(Landroid/os/Bundle;)V

    .line 85
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    const-class v3, Lcom/vk/music/attach/sharedstate/Search;

    invoke-interface {v2, v3}, Lcom/vk/music/attach/controller/Controller$HostController;->getSharedState(Ljava/lang/Class;)Landroid/os/Bundle;

    move-result-object v1

    .line 86
    .local v1, "sharedState":Landroid/os/Bundle;
    if-eqz v1, :cond_1

    .line 87
    const-string/jumbo v2, "Search.expanded"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    .line 88
    iget-boolean v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchExpanded:Z

    if-nez v2, :cond_0

    .line 89
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 91
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    const-class v3, Lcom/vk/music/attach/sharedstate/Search;

    invoke-interface {v2, v3}, Lcom/vk/music/attach/controller/Controller$HostController;->removeSharedState(Ljava/lang/Class;)V

    .line 94
    :cond_1
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-nez v2, :cond_2

    .line 95
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 96
    .local v0, "inflater":Landroid/view/LayoutInflater;
    new-instance v2, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0, v0}, Lcom/vk/music/attach/controller/MyMusicController$$Lambda$1;->lambdaFactory$(Lcom/vk/music/attach/controller/MyMusicController;Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v3

    invoke-direct {v2, v3, v4}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->playlistsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 106
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v0, v2, v3}, Lcom/vk/music/attach/controller/AdapterHelper;->createMusicAdapter(Landroid/view/LayoutInflater;Lcom/vk/music/attach/controller/Controller$HostController;I)Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->musicTrackAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 107
    const/4 v2, 0x3

    invoke-static {v0, v2}, Lcom/vk/music/attach/controller/AdapterHelper;->createLoadingFooterAdapter(Landroid/view/LayoutInflater;I)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 108
    invoke-static {p0}, Lcom/vk/music/attach/controller/MyMusicController$$Lambda$2;->lambdaFactory$(Lcom/vk/music/attach/controller/MyMusicController;)Lcom/vkontakte/android/functions/VoidF;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/vk/music/attach/controller/AdapterHelper;->createErrorAdapter(Landroid/view/LayoutInflater;Lcom/vkontakte/android/functions/VoidF;)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 109
    invoke-static {v0}, Lcom/vk/music/attach/controller/AdapterHelper;->createEmptyAdapter(Landroid/view/LayoutInflater;)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 110
    invoke-static {v0}, Lcom/vk/music/attach/controller/AdapterHelper;->createLoaderAdapter(Landroid/view/LayoutInflater;)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 112
    new-instance v2, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 113
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v2, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 114
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/MyMusicController;->playlistsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v2, v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 115
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/MyMusicController;->musicTrackAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v2, v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 116
    iget-object v2, p0, Lcom/vk/music/attach/controller/MyMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v3, p0, Lcom/vk/music/attach/controller/MyMusicController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v2, v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 119
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    :cond_2
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getTitleView()Landroid/widget/TextView;

    move-result-object v2

    const v3, 0x7f0803fc

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 120
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 121
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchStarterWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 123
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/vk/music/attach/loader/MusicLoader;->subscribe(Lcom/vk/music/attach/loader/MusicLoader$Callback;)V

    .line 125
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v2

    invoke-interface {v2}, Lcom/vk/music/attach/controller/Controller$HostController;->getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/vk/music/attach/controller/MyMusicController;->bind(Lcom/vk/music/attach/loader/MusicLoader;)V

    .line 126
    invoke-direct {p0}, Lcom/vk/music/attach/controller/MyMusicController;->bindExpanded()V

    .line 127
    return-void
.end method

.method protected onViewDetached()V
    .locals 2

    .prologue
    .line 131
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onViewDetached()V

    .line 132
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/attach/controller/MyMusicController;->playlistCounterView:Landroid/widget/TextView;

    .line 133
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/MyMusicController;->searchStarterWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 135
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vk/music/attach/loader/MusicLoader;->unsubscribe(Lcom/vk/music/attach/loader/MusicLoader$Callback;)V

    .line 136
    return-void
.end method

.method public onVoiceSearchResult(Ljava/lang/String;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 204
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/Controller;->onVoiceSearchResult(Ljava/lang/String;)V

    .line 205
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 206
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/MyMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 207
    return-void
.end method
