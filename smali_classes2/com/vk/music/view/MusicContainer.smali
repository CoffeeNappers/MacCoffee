.class public final Lcom/vk/music/view/MusicContainer;
.super Landroid/widget/ViewAnimator;
.source "MusicContainer.java"

# interfaces
.implements Lcom/vk/music/model/MusicModel$Callback;
.implements Lcom/vk/music/model/PlayerModel$Callback;
.implements Lcom/vk/music/model/MusicTrackModel$Callback;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/MusicContainer$Host;,
        Lcom/vk/music/view/MusicContainer$UserListener;
    }
.end annotation


# static fields
.field private static final VIEW_TYPE_FOOTER:I = 0x6

.field private static final VIEW_TYPE_HEADER1:I = 0x1

.field private static final VIEW_TYPE_HEADER2:I = 0x2

.field private static final VIEW_TYPE_HEADER3:I = 0x3

.field private static final VIEW_TYPE_MUSIC_TRACK:I = 0x5

.field private static final VIEW_TYPE_PLAYLIST:I = 0x4


# instance fields
.field final activity:Landroid/app/Activity;

.field final addPlaylistHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

.field host:Lcom/vk/music/view/MusicContainer$Host;

.field final inflater:Landroid/view/LayoutInflater;

.field final loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final model:Lcom/vk/music/model/MusicModel;

.field final musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field playlistRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field final playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field final playlistsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field progressView:Landroid/view/View;

.field recyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

.field refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

.field final shuffleHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final userListener:Lcom/vk/music/view/MusicContainer$UserListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/MusicModel;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v7, 0x0

    const/4 v8, 0x1

    .line 195
    invoke-direct {p0, p1}, Landroid/widget/ViewAnimator;-><init>(Landroid/content/Context;)V

    .line 196
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    .line 197
    iput-object p2, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    .line 198
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->inflater:Landroid/view/LayoutInflater;

    .line 199
    new-instance v4, Lcom/vk/music/view/MusicContainer$UserListener;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/vk/music/view/MusicContainer$UserListener;-><init>(Lcom/vk/music/view/MusicContainer;Lcom/vk/music/view/MusicContainer$1;)V

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->userListener:Lcom/vk/music/view/MusicContainer$UserListener;

    .line 201
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->inflater:Landroid/view/LayoutInflater;

    const v5, 0x7f03013a

    invoke-virtual {v4, v5, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 203
    invoke-virtual {p0, v7}, Lcom/vk/music/view/MusicContainer;->setMeasureAllChildren(Z)V

    .line 205
    const v4, 0x7f100184

    invoke-virtual {p0, v4}, Lcom/vk/music/view/MusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->progressView:Landroid/view/View;

    .line 207
    new-instance v4, Lcom/vkontakte/android/ui/ErrorViewHelper;

    const v5, 0x7f10001b

    invoke-virtual {p0, v5}, Lcom/vk/music/view/MusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vkontakte/android/ui/ErrorViewHelper;-><init>(Landroid/view/View;)V

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    .line 208
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-static {p0}, Lcom/vk/music/view/MusicContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/MusicContainer;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setOnRetryListener(Landroid/view/View$OnClickListener;)V

    .line 210
    const v4, 0x7f1001a8

    invoke-virtual {p0, v4}, Lcom/vk/music/view/MusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 211
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    new-array v5, v8, [I

    const v6, 0x7f0f0018

    aput v6, v5, v7

    invoke-virtual {v4, v5}, Landroid/support/v4/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 212
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->userListener:Lcom/vk/music/view/MusicContainer$UserListener;

    invoke-virtual {v4, v5}, Landroid/support/v4/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 213
    const v4, 0x7f10018a

    invoke-virtual {p0, v4}, Lcom/vk/music/view/MusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lme/grishka/appkit/views/UsableRecyclerView;

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->recyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 214
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->recyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4, v8}, Lme/grishka/appkit/views/UsableRecyclerView;->setHasFixedSize(Z)V

    .line 215
    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    invoke-direct {v1, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 216
    .local v1, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->recyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 217
    new-instance v3, Lcom/vk/music/view/LastReachedScrollListener;

    invoke-direct {v3, v1}, Lcom/vk/music/view/LastReachedScrollListener;-><init>(Landroid/support/v7/widget/LinearLayoutManager;)V

    .line 218
    .local v3, "scrollListener":Lcom/vk/music/view/LastReachedScrollListener;
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->userListener:Lcom/vk/music/view/MusicContainer$UserListener;

    invoke-virtual {v3, v4}, Lcom/vk/music/view/LastReachedScrollListener;->setListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V

    .line 219
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->recyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 221
    new-instance v4, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->inflater:Landroid/view/LayoutInflater;

    invoke-direct {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v5, 0x7f030142

    .line 222
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    new-instance v5, Lcom/vk/music/view/adapter/HorizontalPlaylistBinder;

    invoke-direct {v5}, Lcom/vk/music/view/adapter/HorizontalPlaylistBinder;-><init>()V

    .line 223
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    invoke-static {p0}, Lcom/vk/music/view/MusicContainer$$Lambda$2;->lambdaFactory$(Lcom/vk/music/view/MusicContainer;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v5

    .line 224
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    invoke-static {}, Lcom/vk/music/view/MusicContainer$$Lambda$3;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v5

    .line 225
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    const/4 v5, 0x4

    .line 226
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 227
    invoke-virtual {v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 228
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v4, v8}, Lcom/vk/music/view/adapter/ItemAdapter;->setHasStableIds(Z)V

    .line 230
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0}, Lcom/vk/music/view/MusicContainer$$Lambda$4;->lambdaFactory$(Lcom/vk/music/view/MusicContainer;)Lcom/vkontakte/android/functions/F1;

    move-result-object v5

    invoke-direct {v4, v5, v8}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->playlistsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 245
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0}, Lcom/vk/music/view/MusicContainer$$Lambda$5;->lambdaFactory$(Lcom/vk/music/view/MusicContainer;)Lcom/vkontakte/android/functions/F1;

    move-result-object v5

    const/4 v6, 0x2

    invoke-direct {v4, v5, v6}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->addPlaylistHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 254
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0}, Lcom/vk/music/view/MusicContainer$$Lambda$6;->lambdaFactory$(Lcom/vk/music/view/MusicContainer;)Lcom/vkontakte/android/functions/F1;

    move-result-object v5

    const/4 v6, 0x3

    invoke-direct {v4, v5, v6}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->shuffleHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 263
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->inflater:Landroid/view/LayoutInflater;

    const v6, 0x7f030132

    const/4 v7, 0x6

    invoke-direct {v4, v5, v6, v7}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 265
    invoke-static {p0}, Lcom/vk/music/view/MusicContainer$$Lambda$7;->lambdaFactory$(Lcom/vk/music/view/MusicContainer;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v2

    .line 272
    .local v2, "musicTrackClickListener":Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<Lcom/vkontakte/android/audio/MusicTrack;>;"
    new-instance v4, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->inflater:Landroid/view/LayoutInflater;

    invoke-direct {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v5, 0x7f030123

    .line 273
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    new-instance v5, Lcom/vk/music/view/adapter/PlayingMusicBinder;

    .line 274
    invoke-interface {p2}, Lcom/vk/music/model/MusicModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vk/music/view/adapter/PlayingMusicBinder;-><init>(Lcom/vk/music/model/PlayerModel;)V

    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 275
    invoke-virtual {v4, v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    const v5, 0x7f1003bf

    .line 276
    invoke-virtual {v4, v5, v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    invoke-static {}, Lcom/vk/music/view/MusicContainer$$Lambda$8;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v5

    .line 277
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    const/4 v5, 0x5

    .line 278
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 279
    invoke-virtual {v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/MusicContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 281
    new-instance v0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    .line 282
    .local v0, "adapter":Lme/grishka/appkit/utils/MergeRecyclerAdapter;
    invoke-virtual {v0, v8}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 283
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->playlistsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 284
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->addPlaylistHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 285
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->shuffleHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 286
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 287
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 288
    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->recyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 289
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/MusicModel;Landroid/view/View;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "model"    # Lcom/vk/music/model/MusicModel;
    .param p3, "emptyView"    # Landroid/view/View;

    .prologue
    .line 292
    invoke-direct {p0, p1, p2}, Lcom/vk/music/view/MusicContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/MusicModel;)V

    .line 293
    invoke-virtual {p0, p3}, Lcom/vk/music/view/MusicContainer;->addView(Landroid/view/View;)V

    .line 294
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->recyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, p3}, Lme/grishka/appkit/views/UsableRecyclerView;->setEmptyView(Landroid/view/View;)V

    .line 295
    return-void
.end method

.method private bind()V
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 333
    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v5}, Lcom/vk/music/model/MusicModel;->getMusicTracks()Ljava/util/List;

    move-result-object v1

    .line 334
    .local v1, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-nez v1, :cond_1

    .line 335
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v3}, Lcom/vk/music/model/MusicModel;->getError()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 336
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/vk/music/view/MusicContainer;->indexOfChild(Landroid/view/View;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/vk/music/view/MusicContainer;->setDisplayedChild(I)V

    .line 358
    :goto_0
    return-void

    .line 338
    :cond_0
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->progressView:Landroid/view/View;

    invoke-virtual {p0, v3}, Lcom/vk/music/view/MusicContainer;->indexOfChild(Landroid/view/View;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/vk/music/view/MusicContainer;->setDisplayedChild(I)V

    .line 339
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v3}, Lcom/vk/music/model/MusicModel;->loadPage()V

    goto :goto_0

    .line 342
    :cond_1
    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {p0, v5}, Lcom/vk/music/view/MusicContainer;->indexOfChild(Landroid/view/View;)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/vk/music/view/MusicContainer;->setDisplayedChild(I)V

    .line 343
    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v5}, Landroid/support/v4/widget/SwipeRefreshLayout;->isRefreshing()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 344
    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v5, v4}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 347
    :cond_2
    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v5}, Lcom/vk/music/model/MusicModel;->getPlaylists()Ljava/util/List;

    move-result-object v2

    .line 348
    .local v2, "playlists":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/dto/Playlist;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    move v0, v3

    .line 350
    .local v0, "hasPlaylists":Z
    :goto_1
    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->playlistsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v5, v0}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 351
    iget-object v6, p0, Lcom/vk/music/view/MusicContainer;->addPlaylistHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-nez v0, :cond_4

    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v5}, Lcom/vk/music/model/MusicModel;->isCurrentUser()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4

    move v5, v3

    :goto_2
    invoke-virtual {v6, v5}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 352
    iget-object v5, p0, Lcom/vk/music/view/MusicContainer;->shuffleHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_5

    :goto_3
    invoke-virtual {v5, v3}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 353
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v4}, Lcom/vk/music/model/MusicModel;->canLoadMoreAudio()Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 355
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v3, v2}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 356
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v3, v1}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    goto :goto_0

    .end local v0    # "hasPlaylists":Z
    :cond_3
    move v0, v4

    .line 348
    goto :goto_1

    .restart local v0    # "hasPlaylists":Z
    :cond_4
    move v5, v4

    .line 351
    goto :goto_2

    :cond_5
    move v3, v4

    .line 352
    goto :goto_3
.end method

.method private syncHeaderEnable()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 420
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v3}, Lcom/vk/music/view/adapter/ItemAdapter;->getItemCount()I

    move-result v3

    if-lez v3, :cond_0

    move v0, v1

    .line 421
    .local v0, "hasPlaylists":Z
    :goto_0
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->playlistsHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v3, v0}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 422
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->addPlaylistHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-nez v0, :cond_1

    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v4}, Lcom/vk/music/model/MusicModel;->isCurrentUser()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v4}, Lcom/vk/music/view/adapter/ItemAdapter;->getItemCount()I

    move-result v4

    if-lez v4, :cond_1

    :goto_1
    invoke-virtual {v3, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 423
    return-void

    .end local v0    # "hasPlaylists":Z
    :cond_0
    move v0, v2

    .line 420
    goto :goto_0

    .restart local v0    # "hasPlaylists":Z
    :cond_1
    move v1, v2

    .line 422
    goto :goto_1
.end method

.method private updatePlaying()V
    .locals 5

    .prologue
    .line 481
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->recyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v0

    .line 483
    .local v0, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 484
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->recyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->recyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->findContainingViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    .line 485
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_0

    .line 486
    check-cast v1, Lcom/vk/music/view/adapter/ItemViewHolder;

    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1}, Lcom/vk/music/view/adapter/ItemViewHolder;->rebind()V

    .line 483
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 489
    :cond_1
    return-void
.end method

.method private updatePlaylist(Lcom/vk/music/dto/Playlist;)V
    .locals 8
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 361
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->playlistRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-nez v3, :cond_1

    .line 373
    :cond_0
    return-void

    .line 365
    :cond_1
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->playlistRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 367
    .local v0, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 368
    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->playlistRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/vk/music/view/MusicContainer;->playlistRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->findContainingViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    .line 369
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemId()J

    move-result-wide v4

    invoke-virtual {p1}, Lcom/vk/music/dto/Playlist;->getPid()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-nez v3, :cond_2

    .line 370
    check-cast v1, Lcom/vk/music/view/adapter/ItemViewHolder;

    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1, p1}, Lcom/vk/music/view/adapter/ItemViewHolder;->rebind(Ljava/lang/Object;)V

    .line 367
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 208
    invoke-virtual {p0}, Lcom/vk/music/view/MusicContainer;->onErrorRetryClick()V

    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;Lcom/vk/music/dto/Playlist;I)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
    .param p3, "position"    # I

    .prologue
    .line 224
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->userListener:Lcom/vk/music/view/MusicContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/MusicContainer$UserListener;->onClick(Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method synthetic lambda$new$2(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 232
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->inflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030136

    invoke-virtual {v1, v2, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 233
    .local v0, "v":Landroid/view/View;
    const v1, 0x7f1003d3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f080401

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 234
    const v1, 0x7f1003d4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/MusicContainer;->userListener:Lcom/vk/music/view/MusicContainer$UserListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 235
    const v1, 0x7f10018a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/vk/music/view/MusicContainer;->playlistRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 236
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->playlistRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 237
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->playlistRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v3, p0, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    invoke-direct {v2, v3, v4, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 238
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->playlistRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/vk/music/view/MusicContainer;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 240
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->playlistRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 241
    return-object v0
.end method

.method synthetic lambda$new$3(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 247
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->inflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030134

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 248
    .local v0, "v":Landroid/widget/TextView;
    const v1, 0x7f02021e

    const v2, 0x7f0f0085

    invoke-static {v0, v1, v2}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;II)V

    .line 249
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->userListener:Lcom/vk/music/view/MusicContainer$UserListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 250
    return-object v0
.end method

.method synthetic lambda$new$4(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 256
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->inflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030137

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 257
    .local v0, "v":Landroid/widget/TextView;
    const v1, 0x7f02028f

    const v2, 0x7f0f0085

    invoke-static {v0, v1, v2}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;II)V

    .line 258
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->userListener:Lcom/vk/music/view/MusicContainer$UserListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 259
    return-object v0
.end method

.method synthetic lambda$new$5(Landroid/view/View;Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p3, "position"    # I

    .prologue
    .line 266
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f1003bf

    if-ne v0, v1, :cond_0

    .line 267
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->userListener:Lcom/vk/music/view/MusicContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/MusicContainer$UserListener;->onMenuClick(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 271
    :goto_0
    return-void

    .line 269
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->userListener:Lcom/vk/music/view/MusicContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/MusicContainer$UserListener;->onClick(Lcom/vkontakte/android/audio/MusicTrack;)V

    goto :goto_0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 299
    invoke-super {p0}, Landroid/widget/ViewAnimator;->onAttachedToWindow()V

    .line 301
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/MusicModel;->subscribe(Lcom/vk/music/model/MusicModel$Callback;)V

    .line 302
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/MusicTrackModel;->subscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V

    .line 303
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlayerModel;->subscribe(Lcom/vk/music/model/PlayerModel$Callback;)V

    .line 304
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->userListener:Lcom/vk/music/view/MusicContainer$UserListener;

    invoke-static {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 306
    invoke-direct {p0}, Lcom/vk/music/view/MusicContainer;->bind()V

    .line 307
    return-void
.end method

.method public onAudioAdditionDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 3
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 427
    const v0, 0x7f080405

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 428
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    const/4 v1, 0x0

    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(ILjava/util/Collection;)V

    .line 429
    return-void
.end method

.method public onAudioAdditionError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 433
    invoke-virtual {p0}, Lcom/vk/music/view/MusicContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 434
    return-void
.end method

.method public onAudioAdditionToPlaylistDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vk/music/dto/Playlist;)V
    .locals 5
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 448
    invoke-virtual {p0}, Lcom/vk/music/view/MusicContainer;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080407

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p2, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 449
    return-void
.end method

.method public onAudioAdditionToPlaylistError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 453
    invoke-virtual {p0}, Lcom/vk/music/view/MusicContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 454
    return-void
.end method

.method public onAudioLoadingDone(Lcom/vk/music/model/MusicModel;Ljava/util/List;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
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
            "Lcom/vk/music/model/MusicModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 393
    .local p2, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 394
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {p1}, Lcom/vk/music/model/MusicModel;->canLoadMoreAudio()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 395
    return-void
.end method

.method public onAudioLoadingError(Lcom/vk/music/model/MusicModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 399
    invoke-virtual {p0}, Lcom/vk/music/view/MusicContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 400
    return-void
.end method

.method public onAudioRemovalDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 438
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->removeItem(Ljava/lang/Object;)V

    .line 439
    return-void
.end method

.method public onAudioRemovalError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 443
    invoke-virtual {p0}, Lcom/vk/music/view/MusicContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 444
    return-void
.end method

.method public onAudioRemovalFromPlaylistDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vk/music/dto/Playlist;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 458
    return-void
.end method

.method public onAudioRemovalFromPlaylistError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 462
    invoke-virtual {p0}, Lcom/vk/music/view/MusicContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 463
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 311
    invoke-super {p0}, Landroid/widget/ViewAnimator;->onDetachedFromWindow()V

    .line 313
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/MusicModel;->unsubscribe(Lcom/vk/music/model/MusicModel$Callback;)V

    .line 314
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/MusicTrackModel;->unsubscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V

    .line 315
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlayerModel;->unsubscribe(Lcom/vk/music/model/PlayerModel$Callback;)V

    .line 316
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 317
    return-void
.end method

.method onErrorRetryClick()V
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicModel;->loadPage()V

    .line 185
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->progressView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/vk/music/view/MusicContainer;->indexOfChild(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/MusicContainer;->setDisplayedChild(I)V

    .line 186
    return-void
.end method

.method public onLoadingDone(Lcom/vk/music/model/MusicModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 377
    invoke-direct {p0}, Lcom/vk/music/view/MusicContainer;->bind()V

    .line 378
    return-void
.end method

.method public onLoadingError(Lcom/vk/music/model/MusicModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 382
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->isRefreshing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 383
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 385
    :cond_0
    invoke-interface {p1}, Lcom/vk/music/model/MusicModel;->getMusicTracks()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    .line 386
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/MusicContainer;->indexOfChild(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/MusicContainer;->setDisplayedChild(I)V

    .line 387
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->bindErrorView(Landroid/view/View;)V

    .line 389
    :cond_1
    return-void
.end method

.method public onPlayingPaused(Lcom/vk/music/model/PlayerModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 472
    invoke-direct {p0}, Lcom/vk/music/view/MusicContainer;->updatePlaying()V

    .line 473
    return-void
.end method

.method public onPlayingResumed(Lcom/vk/music/model/PlayerModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 477
    invoke-direct {p0}, Lcom/vk/music/view/MusicContainer;->updatePlaying()V

    .line 478
    return-void
.end method

.method public onPlayingStopped(Lcom/vk/music/model/PlayerModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 467
    invoke-direct {p0}, Lcom/vk/music/view/MusicContainer;->updatePlaying()V

    .line 468
    return-void
.end method

.method public onPlaylistChanged(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 404
    invoke-direct {p0, p2}, Lcom/vk/music/view/MusicContainer;->updatePlaylist(Lcom/vk/music/dto/Playlist;)V

    .line 405
    return-void
.end method

.method public onPlaylistCreated(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V
    .locals 3
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 409
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    const/4 v1, 0x0

    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(ILjava/util/Collection;)V

    .line 410
    invoke-direct {p0}, Lcom/vk/music/view/MusicContainer;->syncHeaderEnable()V

    .line 411
    return-void
.end method

.method public onPlaylistRemoved(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/MusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 415
    iget-object v0, p0, Lcom/vk/music/view/MusicContainer;->playlistsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->removeItem(Ljava/lang/Object;)V

    .line 416
    invoke-direct {p0}, Lcom/vk/music/view/MusicContainer;->syncHeaderEnable()V

    .line 417
    return-void
.end method

.method public onPlaylistResult(Lcom/vk/music/dto/Playlist;)V
    .locals 2
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 324
    if-eqz p1, :cond_0

    .line 325
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/model/MusicTrackModel;->getTarget()Lcom/vkontakte/android/audio/MusicTrack;

    move-result-object v0

    .line 326
    .local v0, "target":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v0, :cond_0

    .line 327
    iget-object v1, p0, Lcom/vk/music/view/MusicContainer;->model:Lcom/vk/music/model/MusicModel;

    invoke-interface {v1}, Lcom/vk/music/model/MusicModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, v0, p1}, Lcom/vk/music/model/MusicTrackModel;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 330
    .end local v0    # "target":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_0
    return-void
.end method

.method public setHost(Lcom/vk/music/view/MusicContainer$Host;)V
    .locals 0
    .param p1, "host"    # Lcom/vk/music/view/MusicContainer$Host;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 320
    iput-object p1, p0, Lcom/vk/music/view/MusicContainer;->host:Lcom/vk/music/view/MusicContainer$Host;

    .line 321
    return-void
.end method
