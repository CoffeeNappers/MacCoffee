.class public final Lcom/vk/music/view/PlaylistsContainer;
.super Landroid/widget/FrameLayout;
.source "PlaylistsContainer.java"

# interfaces
.implements Lcom/vk/music/model/PlaylistsModel$Callback;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/PlaylistsContainer$UserListener;
    }
.end annotation


# static fields
.field private static final VIEW_TYPE_FOOTER:I = 0x3

.field private static final VIEW_TYPE_HEADER:I = 0x1

.field private static final VIEW_TYPE_PLAYLIST:I = 0x2


# instance fields
.field final activity:Landroid/app/Activity;

.field final addPlaylistAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final animator:Landroid/widget/ViewAnimator;

.field final errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

.field final inflater:Landroid/view/LayoutInflater;

.field final lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

.field final loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final model:Lcom/vk/music/model/PlaylistsModel;

.field final playlistAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field final progressView:Landroid/view/View;

.field final recyclerView:Landroid/support/v7/widget/RecyclerView;

.field final refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

.field final userListener:Lcom/vk/music/view/PlaylistsContainer$UserListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/PlaylistsModel;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 191
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 192
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v6

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    .line 193
    iput-object p2, p0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    .line 194
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->inflater:Landroid/view/LayoutInflater;

    .line 195
    new-instance v6, Lcom/vk/music/view/PlaylistsContainer$UserListener;

    invoke-direct {v6, p0, v11}, Lcom/vk/music/view/PlaylistsContainer$UserListener;-><init>(Lcom/vk/music/view/PlaylistsContainer;Lcom/vk/music/view/PlaylistsContainer$1;)V

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->userListener:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    .line 197
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->inflater:Landroid/view/LayoutInflater;

    const v7, 0x7f030145

    invoke-virtual {v6, v7, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 198
    const v6, 0x7f1003d8

    invoke-virtual {p0, v6}, Lcom/vk/music/view/PlaylistsContainer;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iget-object v7, p0, Lcom/vk/music/view/PlaylistsContainer;->userListener:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    const v6, 0x7f100354

    invoke-virtual {p0, v6}, Lcom/vk/music/view/PlaylistsContainer;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ViewAnimator;

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->animator:Landroid/widget/ViewAnimator;

    .line 201
    const v6, 0x7f100184

    invoke-virtual {p0, v6}, Lcom/vk/music/view/PlaylistsContainer;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->progressView:Landroid/view/View;

    .line 202
    new-instance v6, Lcom/vkontakte/android/ui/ErrorViewHelper;

    const v7, 0x7f10001b

    invoke-virtual {p0, v7}, Lcom/vk/music/view/PlaylistsContainer;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/vkontakte/android/ui/ErrorViewHelper;-><init>(Landroid/view/View;)V

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    .line 203
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-static {p0}, Lcom/vk/music/view/PlaylistsContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/PlaylistsContainer;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setOnRetryListener(Landroid/view/View$OnClickListener;)V

    .line 204
    const v6, 0x7f1001a8

    invoke-virtual {p0, v6}, Lcom/vk/music/view/PlaylistsContainer;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 205
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    new-array v7, v10, [I

    const/4 v8, 0x0

    const v9, 0x7f0f0018

    aput v9, v7, v8

    invoke-virtual {v6, v7}, Landroid/support/v4/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 206
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, Lcom/vk/music/view/PlaylistsContainer$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlaylistsModel;)Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/support/v4/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 207
    const v6, 0x7f10018a

    invoke-virtual {p0, v6}, Lcom/vk/music/view/PlaylistsContainer;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/RecyclerView;

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 208
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v6, v10}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 209
    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    invoke-direct {v2, v6}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 210
    .local v2, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v6, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 211
    new-instance v4, Lcom/vk/music/view/LastReachedScrollListener;

    invoke-direct {v4, v2}, Lcom/vk/music/view/LastReachedScrollListener;-><init>(Landroid/support/v7/widget/LinearLayoutManager;)V

    .line 212
    .local v4, "scrollListener":Lcom/vk/music/view/LastReachedScrollListener;
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->userListener:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    invoke-virtual {v4, v6}, Lcom/vk/music/view/LastReachedScrollListener;->setListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V

    .line 213
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v6, v4}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 214
    const v6, 0x7f100128

    invoke-virtual {p0, v6}, Lcom/vk/music/view/PlaylistsContainer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 215
    .local v5, "title":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistsContainer;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-interface {p2, v6}, Lcom/vk/music/model/PlaylistsModel;->getTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    new-instance v6, Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v7, p0, Lcom/vk/music/view/PlaylistsContainer;->inflater:Landroid/view/LayoutInflater;

    const v8, 0x7f030132

    const/4 v9, 0x3

    invoke-direct {v6, v7, v8, v9}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 219
    invoke-static {p0}, Lcom/vk/music/view/PlaylistsContainer$$Lambda$3;->lambdaFactory$(Lcom/vk/music/view/PlaylistsContainer;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v3

    .line 226
    .local v3, "playlistClickListener":Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<Lcom/vk/music/dto/Playlist;>;"
    new-instance v0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    .line 227
    .local v0, "adapter":Lme/grishka/appkit/utils/MergeRecyclerAdapter;
    invoke-virtual {v0, v10}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 228
    new-instance v6, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    iget-object v7, p0, Lcom/vk/music/view/PlaylistsContainer;->inflater:Landroid/view/LayoutInflater;

    invoke-direct {v6, v7}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v7, 0x7f030141

    .line 229
    invoke-virtual {v6, v7}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v6

    new-instance v7, Lcom/vk/music/view/adapter/PlaylistBinder;

    .line 230
    invoke-static {p1}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/vk/music/view/adapter/PlaylistBinder;-><init>(Lcom/vk/core/util/Resourcer;)V

    invoke-virtual {v6, v7}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v6

    .line 231
    invoke-virtual {v6, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v6

    invoke-static {}, Lcom/vk/music/view/PlaylistsContainer$$Lambda$4;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v7

    .line 232
    invoke-virtual {v6, v7}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v6

    const/4 v7, 0x2

    .line 233
    invoke-virtual {v6, v7}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v1

    .line 234
    .local v1, "builder":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<Lcom/vk/music/dto/Playlist;>;"
    invoke-interface {p2}, Lcom/vk/music/model/PlaylistsModel;->isSelect()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 235
    invoke-static {}, Lcom/vk/music/view/PlaylistsContainer$$Lambda$5;->lambdaFactory$()Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    .line 237
    iput-object v11, p0, Lcom/vk/music/view/PlaylistsContainer;->addPlaylistAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 252
    :goto_0
    invoke-virtual {v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v6

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->playlistAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 253
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->playlistAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, v6}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 254
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v6}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 255
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v6, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 257
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    invoke-static {v6}, Lcom/vk/core/widget/LifecycleHandler;->install(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v6

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 258
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v7, p0, Lcom/vk/music/view/PlaylistsContainer;->userListener:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    invoke-virtual {v6, v7}, Lcom/vk/core/widget/LifecycleHandler;->setLifecycleListener(Lcom/vk/core/widget/LifecycleListener;)V

    .line 259
    return-void

    .line 239
    :cond_0
    const v6, 0x7f1003e1

    invoke-virtual {v1, v6, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    .line 241
    new-instance v6, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0}, Lcom/vk/music/view/PlaylistsContainer$$Lambda$6;->lambdaFactory$(Lcom/vk/music/view/PlaylistsContainer;)Lcom/vkontakte/android/functions/F1;

    move-result-object v7

    invoke-direct {v6, v7, v10}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->addPlaylistAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 250
    iget-object v6, p0, Lcom/vk/music/view/PlaylistsContainer;->addPlaylistAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v6}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    goto :goto_0
.end method

.method private bind()V
    .locals 4

    .prologue
    .line 280
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistsModel;->getPlaylists()Ljava/util/List;

    move-result-object v0

    .line 281
    .local v0, "playlists":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/dto/Playlist;>;"
    if-nez v0, :cond_1

    .line 282
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistsModel;->getError()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 283
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v3, p0, Lcom/vk/music/view/PlaylistsContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ViewAnimator;->indexOfChild(Landroid/view/View;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 299
    :goto_0
    return-void

    .line 285
    :cond_0
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v3, p0, Lcom/vk/music/view/PlaylistsContainer;->progressView:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/widget/ViewAnimator;->indexOfChild(Landroid/view/View;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 286
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistsModel;->loadPlaylists()V

    goto :goto_0

    .line 289
    :cond_1
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v3, p0, Lcom/vk/music/view/PlaylistsContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v2, v3}, Landroid/widget/ViewAnimator;->indexOfChild(Landroid/view/View;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 290
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->isRefreshing()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 291
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 293
    :cond_2
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->addPlaylistAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eqz v1, :cond_3

    .line 294
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->addPlaylistAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v2}, Lcom/vk/music/model/PlaylistsModel;->canAddPlaylist()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 296
    :cond_3
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v2}, Lcom/vk/music/model/PlaylistsModel;->canLoadMore()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 297
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->playlistAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    goto :goto_0
.end method

.method static synthetic lambda$new$2(Landroid/view/View;)V
    .locals 2
    .param p0, "itemView"    # Landroid/view/View;

    .prologue
    .line 235
    const v0, 0x7f1003e1

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private updatePlaylist(Lcom/vk/music/dto/Playlist;)V
    .locals 8
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 302
    iget-object v3, p0, Lcom/vk/music/view/PlaylistsContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 304
    .local v0, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 305
    iget-object v3, p0, Lcom/vk/music/view/PlaylistsContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistsContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->findContainingViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    .line 306
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemId()J

    move-result-wide v4

    invoke-virtual {p1}, Lcom/vk/music/dto/Playlist;->getPid()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-nez v3, :cond_0

    .line 307
    check-cast v1, Lcom/vk/music/view/adapter/ItemViewHolder;

    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1, p1}, Lcom/vk/music/view/adapter/ItemViewHolder;->rebind(Ljava/lang/Object;)V

    .line 304
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 310
    :cond_1
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 203
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistsContainer;->onErrorRetryClick()V

    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;Lcom/vk/music/dto/Playlist;I)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
    .param p3, "position"    # I

    .prologue
    .line 220
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f1003e1

    if-ne v0, v1, :cond_0

    .line 221
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->userListener:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/PlaylistsContainer$UserListener;->onMenuClick(Lcom/vk/music/dto/Playlist;)V

    .line 225
    :goto_0
    return-void

    .line 223
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->userListener:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/PlaylistsContainer$UserListener;->onClick(Lcom/vk/music/dto/Playlist;)V

    goto :goto_0
.end method

.method synthetic lambda$new$3(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 243
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->inflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030134

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 244
    .local v0, "v":Landroid/widget/TextView;
    const v1, 0x7f02021e

    const v2, 0x7f0f0085

    invoke-static {v0, v1, v2}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;II)V

    .line 245
    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->userListener:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 246
    return-object v0
.end method

.method public onAdditionDone(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 341
    const v0, 0x7f08040b

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 342
    return-void
.end method

.method public onAdditionError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 346
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistsContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 347
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 263
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 265
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlaylistsModel;->subscribe(Lcom/vk/music/model/PlaylistsModel$Callback;)V

    .line 266
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->userListener:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    invoke-static {v0, v1}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 268
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistsContainer;->bind()V

    .line 269
    return-void
.end method

.method public onDeletionDone(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 351
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->playlistAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->removeItem(Ljava/lang/Object;)V

    .line 352
    return-void
.end method

.method public onDeletionError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 356
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistsContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 357
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 273
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 275
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlaylistsModel;->unsubscribe(Lcom/vk/music/model/PlaylistsModel$Callback;)V

    .line 276
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 277
    return-void
.end method

.method onErrorRetryClick()V
    .locals 2

    .prologue
    .line 186
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->model:Lcom/vk/music/model/PlaylistsModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistsModel;->loadPlaylists()V

    .line 187
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->progressView:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/vk/music/view/PlaylistsContainer;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 188
    return-void
.end method

.method public onLoadingDone(Lcom/vk/music/model/PlaylistsModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 314
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistsContainer;->bind()V

    .line 315
    return-void
.end method

.method public onLoadingError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 3
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 319
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->isRefreshing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 322
    :cond_0
    invoke-interface {p1}, Lcom/vk/music/model/PlaylistsModel;->getPlaylists()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    .line 323
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistsContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistsContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ViewAnimator;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 324
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->bindErrorView(Landroid/view/View;)V

    .line 326
    :cond_1
    return-void
.end method

.method public onMoreLoadingDone(Lcom/vk/music/model/PlaylistsModel;Ljava/util/List;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
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
            "Lcom/vk/music/model/PlaylistsModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 330
    .local p2, "playlists":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/dto/Playlist;>;"
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->playlistAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 331
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {p1}, Lcom/vk/music/model/PlaylistsModel;->canLoadMore()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 332
    return-void
.end method

.method public onMoreLoadingError(Lcom/vk/music/model/PlaylistsModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 336
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistsContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 337
    return-void
.end method

.method public onPlaylistChanged(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 361
    invoke-direct {p0, p2}, Lcom/vk/music/view/PlaylistsContainer;->updatePlaylist(Lcom/vk/music/dto/Playlist;)V

    .line 362
    return-void
.end method

.method public onPlaylistCreated(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V
    .locals 3
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 366
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->playlistAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    const/4 v1, 0x0

    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(ILjava/util/Collection;)V

    .line 367
    return-void
.end method

.method public onPlaylistRemoved(Lcom/vk/music/model/PlaylistsModel;Lcom/vk/music/dto/Playlist;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 371
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer;->playlistAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->removeItem(Ljava/lang/Object;)V

    .line 372
    return-void
.end method
