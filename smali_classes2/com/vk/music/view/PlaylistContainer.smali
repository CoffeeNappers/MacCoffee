.class public final Lcom/vk/music/view/PlaylistContainer;
.super Landroid/widget/FrameLayout;
.source "PlaylistContainer.java"

# interfaces
.implements Lcom/vk/music/model/PlaylistModel$Callback;
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
        Lcom/vk/music/view/PlaylistContainer$UserListener;,
        Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;,
        Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;
    }
.end annotation


# static fields
.field private static final REQUEST_CODE_ATTACH_MUSIC:I = 0xb

.field private static final REQUEST_CODE_GET_PLAYLIST:I = 0xa

.field private static final VIEW_TYPE_FOOTER1:I = 0x4

.field private static final VIEW_TYPE_FOOTER2:I = 0x5

.field private static final VIEW_TYPE_FOOTER3:I = 0x6

.field private static final VIEW_TYPE_HEADER1:I = 0x1

.field private static final VIEW_TYPE_HEADER2:I = 0x2

.field private static final VIEW_TYPE_MUSIC_TRACK:I = 0x3

.field private static final VIEW_TYPE_MUSIC_WITHOUT_NET:I = 0x7


# instance fields
.field final activity:Landroid/app/Activity;

.field adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

.field animator:Landroid/widget/ViewAnimator;

.field editButton:Landroid/view/View;

.field emptyFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

.field final inflater:Landroid/view/LayoutInflater;

.field infoHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field infoHeaderCreatorBinder:Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;

.field final lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

.field loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final model:Lcom/vk/music/model/PlaylistModel;

.field musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field musicWithoutNetAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field musicWithoutNetCreatorBinder:Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;

.field progressView:Landroid/view/View;

.field recyclerView:Landroid/support/v7/widget/RecyclerView;

.field refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

.field final resourcer:Lcom/vk/core/util/Resourcer;

.field shuffleHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field titleView:Landroid/widget/TextView;

.field totalFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field totalFooterCreatorBinder:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;

.field final userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/PlaylistModel;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "model"    # Lcom/vk/music/model/PlaylistModel;

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 445
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 446
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    .line 447
    invoke-static {p1}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    .line 448
    iput-object p2, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    .line 449
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    .line 450
    new-instance v3, Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-direct {v3, p0, v6}, Lcom/vk/music/view/PlaylistContainer$UserListener;-><init>(Lcom/vk/music/view/PlaylistContainer;Lcom/vk/music/view/PlaylistContainer$1;)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    .line 452
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    const v4, 0x7f03013c

    invoke-virtual {v3, v4, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 453
    const v3, 0x7f1003c9

    invoke-virtual {p0, v3}, Lcom/vk/music/view/PlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->titleView:Landroid/widget/TextView;

    .line 454
    const v3, 0x7f1003d8

    invoke-virtual {p0, v3}, Lcom/vk/music/view/PlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 455
    const v3, 0x7f1003d9

    invoke-virtual {p0, v3}, Lcom/vk/music/view/PlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->editButton:Landroid/view/View;

    .line 456
    const v3, 0x7f1003da

    invoke-virtual {p0, v3}, Lcom/vk/music/view/PlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 458
    const v3, 0x7f100354

    invoke-virtual {p0, v3}, Lcom/vk/music/view/PlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ViewAnimator;

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    .line 459
    const v3, 0x7f100184

    invoke-virtual {p0, v3}, Lcom/vk/music/view/PlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->progressView:Landroid/view/View;

    .line 460
    new-instance v3, Lcom/vkontakte/android/ui/ErrorViewHelper;

    const v4, 0x7f10001b

    invoke-virtual {p0, v4}, Lcom/vk/music/view/PlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/ui/ErrorViewHelper;-><init>(Landroid/view/View;)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    .line 461
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-static {p0}, Lcom/vk/music/view/PlaylistContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/PlaylistContainer;)Landroid/view/View$OnClickListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setOnRetryListener(Landroid/view/View$OnClickListener;)V

    .line 462
    const v3, 0x7f1001a8

    invoke-virtual {p0, v3}, Lcom/vk/music/view/PlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 463
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    new-array v4, v7, [I

    const v5, 0x7f0f0018

    aput v5, v4, v8

    invoke-virtual {v3, v4}, Landroid/support/v4/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 464
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v3, v4}, Landroid/support/v4/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 466
    const v3, 0x7f10018a

    invoke-virtual {p0, v3}, Lcom/vk/music/view/PlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView;

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 467
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v7}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 468
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    invoke-direct {v0, v3}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 469
    .local v0, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 470
    new-instance v2, Lcom/vk/music/view/LastReachedScrollListener;

    invoke-direct {v2, v0}, Lcom/vk/music/view/LastReachedScrollListener;-><init>(Landroid/support/v7/widget/LinearLayoutManager;)V

    .line 471
    .local v2, "scrollListener":Lcom/vk/music/view/LastReachedScrollListener;
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v2, v3}, Lcom/vk/music/view/LastReachedScrollListener;->setListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V

    .line 472
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 474
    new-instance v3, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;

    invoke-direct {v3, p0, v6}, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;-><init>(Lcom/vk/music/view/PlaylistContainer;Lcom/vk/music/view/PlaylistContainer$1;)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;

    .line 475
    new-instance v3, Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;

    iget-object v5, p0, Lcom/vk/music/view/PlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;

    invoke-direct {v3, v4, v5, v7}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->infoHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 476
    new-instance v3, Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;

    invoke-direct {v3, p0, v6}, Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;-><init>(Lcom/vk/music/view/PlaylistContainer;Lcom/vk/music/view/PlaylistContainer$1;)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->musicWithoutNetCreatorBinder:Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;

    .line 477
    new-instance v3, Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->musicWithoutNetCreatorBinder:Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;

    iget-object v5, p0, Lcom/vk/music/view/PlaylistContainer;->musicWithoutNetCreatorBinder:Lcom/vk/music/view/PlaylistContainer$MusicWithoutNetCreatorBinder;

    const/4 v6, 0x7

    invoke-direct {v3, v4, v5, v6}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->musicWithoutNetAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 478
    new-instance v3, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0}, Lcom/vk/music/view/PlaylistContainer$$Lambda$2;->lambdaFactory$(Lcom/vk/music/view/PlaylistContainer;)Lcom/vkontakte/android/functions/F1;

    move-result-object v4

    invoke-direct {v3, v4, v9}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->shuffleHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 487
    new-instance v3, Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    const v5, 0x7f030132

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v6}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 488
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v3, v8}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 489
    new-instance v3, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;

    new-instance v4, Lcom/vk/music/view/PlaylistContainer$1;

    invoke-direct {v4, p0, p2}, Lcom/vk/music/view/PlaylistContainer$1;-><init>(Lcom/vk/music/view/PlaylistContainer;Lcom/vk/music/model/PlaylistModel;)V

    invoke-direct {v3, v4}, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;-><init>(Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->totalFooterCreatorBinder:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;

    .line 508
    new-instance v3, Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->totalFooterCreatorBinder:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;

    iget-object v5, p0, Lcom/vk/music/view/PlaylistContainer;->totalFooterCreatorBinder:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;

    const/4 v6, 0x5

    invoke-direct {v3, v4, v5, v6}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->totalFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 509
    new-instance v3, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0}, Lcom/vk/music/view/PlaylistContainer$$Lambda$3;->lambdaFactory$(Lcom/vk/music/view/PlaylistContainer;)Lcom/vkontakte/android/functions/F1;

    move-result-object v4

    const/4 v5, 0x6

    invoke-direct {v3, v4, v5}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->emptyFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 518
    new-instance v3, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v3}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 519
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v3, v7}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 521
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 522
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->musicWithoutNetAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v3, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 525
    :cond_0
    invoke-interface {p2}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v1

    .line 526
    .local v1, "playlist":Lcom/vk/music/dto/Playlist;
    if-eqz v1, :cond_1

    iget v3, v1, Lcom/vk/music/dto/Playlist;->type:I

    if-eq v3, v9, :cond_2

    .line 527
    :cond_1
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->infoHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v3, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 530
    :cond_2
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->shuffleHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v3, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 531
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v3, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 532
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->totalFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v3, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 533
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->emptyFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v3, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 534
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 536
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/vk/core/widget/LifecycleHandler;->install(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 537
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v3, v4}, Lcom/vk/core/widget/LifecycleHandler;->setLifecycleListener(Lcom/vk/core/widget/LifecycleListener;)V

    .line 538
    return-void
.end method

.method private bind()V
    .locals 9

    .prologue
    const/4 v8, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 563
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v3}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v2

    .line 564
    .local v2, "playlist":Lcom/vk/music/dto/Playlist;
    if-nez v2, :cond_1

    .line 565
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v3}, Lcom/vk/music/model/PlaylistModel;->getError()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 566
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v5, p0, Lcom/vk/music/view/PlaylistContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ViewAnimator;->indexOfChild(Landroid/view/View;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 626
    :goto_0
    return-void

    .line 568
    :cond_0
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v5, p0, Lcom/vk/music/view/PlaylistContainer;->progressView:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/widget/ViewAnimator;->indexOfChild(Landroid/view/View;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 569
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v3}, Lcom/vk/music/model/PlaylistModel;->load()V

    goto :goto_0

    .line 572
    :cond_1
    invoke-direct {p0, v2}, Lcom/vk/music/view/PlaylistContainer;->bindTitle(Lcom/vk/music/dto/Playlist;)V

    .line 573
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v6, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v7, p0, Lcom/vk/music/view/PlaylistContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v6, v7}, Landroid/widget/ViewAnimator;->indexOfChild(Landroid/view/View;)I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 574
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v3}, Landroid/support/v4/widget/SwipeRefreshLayout;->isRefreshing()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 575
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v3, v5}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 578
    :cond_2
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v3}, Lcom/vk/music/model/PlaylistModel;->getOwner()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    .line 579
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v3}, Lcom/vk/music/model/PlaylistModel;->load()V

    .line 582
    :cond_3
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v3}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v3

    if-nez v3, :cond_4

    .line 583
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v3}, Lcom/vk/music/model/PlaylistModel;->load()V

    .line 586
    :cond_4
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateInfoHeader()V

    .line 587
    iget-object v6, p0, Lcom/vk/music/view/PlaylistContainer;->infoHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget v3, v2, Lcom/vk/music/dto/Playlist;->type:I

    if-eq v3, v8, :cond_7

    move v3, v4

    :goto_1
    invoke-virtual {v6, v3}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 588
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->musicWithoutNetAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget v6, v2, Lcom/vk/music/dto/Playlist;->type:I

    if-ne v6, v8, :cond_5

    move v5, v4

    :cond_5
    invoke-virtual {v3, v5}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 590
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateShuffleHeader()V

    .line 591
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateEmptyFooter()V

    .line 592
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateLoadingFooter()V

    .line 593
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateTotalFooter()V

    .line 595
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    if-nez v3, :cond_6

    .line 596
    invoke-static {p0}, Lcom/vk/music/view/PlaylistContainer$$Lambda$4;->lambdaFactory$(Lcom/vk/music/view/PlaylistContainer;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v1

    .line 604
    .local v1, "musicTrackClickListener":Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<Lcom/vkontakte/android/audio/MusicTrack;>;"
    new-instance v0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    invoke-direct {v0, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    .line 605
    .local v0, "builder":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget v3, v2, Lcom/vk/music/dto/Playlist;->type:I

    if-ne v3, v4, :cond_9

    .line 606
    iget-object v3, v2, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v4, :cond_8

    .line 607
    const v3, 0x7f030124

    invoke-virtual {v0, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v3

    new-instance v4, Lcom/vk/music/view/adapter/AlbumMusicBinder;

    iget-object v5, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    .line 608
    invoke-interface {v5}, Lcom/vk/music/model/PlaylistModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vk/music/view/adapter/AlbumMusicBinder;-><init>(Lcom/vk/music/model/PlayerModel;)V

    invoke-virtual {v3, v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    .line 617
    :goto_2
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v3

    const v4, 0x7f1003bf

    .line 618
    invoke-virtual {v3, v4, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v3

    invoke-static {}, Lcom/vk/music/view/PlaylistContainer$$Lambda$5;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v4

    .line 619
    invoke-virtual {v3, v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v3

    const/4 v4, 0x3

    .line 620
    invoke-virtual {v3, v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v3

    .line 621
    invoke-virtual {v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 622
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v5, p0, Lcom/vk/music/view/PlaylistContainer;->shuffleHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v4, v5}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getIndexOfAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/vk/music/view/PlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v3, v4, v5}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(ILme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 624
    .end local v0    # "builder":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .end local v1    # "musicTrackClickListener":Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_6
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v4}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    goto/16 :goto_0

    :cond_7
    move v3, v5

    .line 587
    goto/16 :goto_1

    .line 610
    .restart local v0    # "builder":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .restart local v1    # "musicTrackClickListener":Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_8
    const v3, 0x7f030125

    invoke-virtual {v0, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v3

    new-instance v4, Lcom/vk/music/view/adapter/CompilationMusicBinder;

    iget-object v5, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    .line 611
    invoke-interface {v5}, Lcom/vk/music/model/PlaylistModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vk/music/view/adapter/CompilationMusicBinder;-><init>(Lcom/vk/music/model/PlayerModel;)V

    invoke-virtual {v3, v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    goto :goto_2

    .line 614
    :cond_9
    const v3, 0x7f030123

    invoke-virtual {v0, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v3

    new-instance v4, Lcom/vk/music/view/adapter/PlayingMusicBinder;

    iget-object v5, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    .line 615
    invoke-interface {v5}, Lcom/vk/music/model/PlaylistModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vk/music/view/adapter/PlayingMusicBinder;-><init>(Lcom/vk/music/model/PlayerModel;)V

    invoke-virtual {v3, v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    goto :goto_2
.end method

.method private bindTitle(Lcom/vk/music/dto/Playlist;)V
    .locals 2
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 629
    iget v0, p1, Lcom/vk/music/dto/Playlist;->type:I

    packed-switch v0, :pswitch_data_0

    .line 643
    :goto_0
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->isCurrentUser()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    .line 644
    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v0

    iget v0, v0, Lcom/vk/music/dto/Playlist;->type:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    .line 645
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->editButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 646
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->editButton:Landroid/view/View;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 650
    :goto_1
    return-void

    .line 631
    :pswitch_0
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->titleView:Landroid/widget/TextView;

    const v1, 0x7f0803fb

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 635
    :pswitch_1
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->titleView:Landroid/widget/TextView;

    const v1, 0x7f080400

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 639
    :pswitch_2
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->titleView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 648
    :cond_1
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->editButton:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 629
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private updateEmptyFooter()V
    .locals 2

    .prologue
    .line 661
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 662
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->emptyFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->isCurrentUser()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 666
    :goto_0
    return-void

    .line 664
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->emptyFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    goto :goto_0
.end method

.method private updateInfoHeader()V
    .locals 1

    .prologue
    .line 653
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->infoHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ViewAdapter;->notifyDataSetChanged()V

    .line 654
    return-void
.end method

.method private updateLoadingFooter()V
    .locals 2

    .prologue
    .line 669
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 670
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 674
    :goto_0
    return-void

    .line 672
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->canLoadMore()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    goto :goto_0
.end method

.method private updatePlaying()V
    .locals 5

    .prologue
    .line 685
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 687
    .local v0, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 688
    iget-object v3, p0, Lcom/vk/music/view/PlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/vk/music/view/PlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->findContainingViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    .line 689
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    .line 690
    check-cast v1, Lcom/vk/music/view/adapter/ItemViewHolder;

    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1}, Lcom/vk/music/view/adapter/ItemViewHolder;->rebind()V

    .line 687
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 693
    :cond_1
    return-void
.end method

.method private updateShuffleHeader()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 657
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->shuffleHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v2}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v2}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v0, :cond_0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 658
    return-void

    .line 657
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateTotalFooter()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 677
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 678
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->totalFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 682
    :goto_0
    return-void

    .line 680
    :cond_0
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->totalFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v2}, Lcom/vk/music/model/PlaylistModel;->canLoadMore()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v0, 0x1

    :cond_1
    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$bind$4(Landroid/view/View;Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p3, "position"    # I

    .prologue
    .line 597
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f1003bf

    if-ne v0, v1, :cond_0

    .line 598
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/PlaylistContainer$UserListener;->onMenuClick(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 602
    :goto_0
    return-void

    .line 600
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/PlaylistContainer$UserListener;->onClick(Lcom/vkontakte/android/audio/MusicTrack;)V

    goto :goto_0
.end method

.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 461
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistContainer;->onErrorRetryClick()V

    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 480
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030137

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 481
    .local v0, "v":Landroid/widget/TextView;
    const v1, 0x7f02028f

    const v2, 0x7f0f0085

    invoke-static {v0, v1, v2}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;II)V

    .line 482
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 483
    return-object v0
.end method

.method synthetic lambda$new$3(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 511
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030133

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 512
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f1003cf

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/music/view/PlaylistContainer$$Lambda$6;->lambdaFactory$(Lcom/vk/music/view/PlaylistContainer;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 513
    return-object v0
.end method

.method synthetic lambda$null$2(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 512
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v0}, Lcom/vk/music/view/PlaylistContainer$UserListener;->onAttachMusicClick()V

    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 542
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 544
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlaylistModel;->subscribe(Lcom/vk/music/model/PlaylistModel$Callback;)V

    .line 545
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/MusicTrackModel;->subscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V

    .line 546
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlayerModel;->subscribe(Lcom/vk/music/model/PlayerModel$Callback;)V

    .line 547
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-static {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 549
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->bind()V

    .line 550
    return-void
.end method

.method public onAttachingDone(Lcom/vk/music/model/PlaylistModel;Ljava/util/List;)V
    .locals 3
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
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
            "Lcom/vk/music/model/PlaylistModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 751
    .local p2, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    const v1, 0x7f0d0032

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 752
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-interface {p1}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 753
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateInfoHeader()V

    .line 754
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateEmptyFooter()V

    .line 755
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateShuffleHeader()V

    .line 756
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateTotalFooter()V

    .line 757
    return-void
.end method

.method public onAttachingError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 761
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 762
    return-void
.end method

.method public onAudioAdditionDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 772
    return-void
.end method

.method public onAudioAdditionError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 777
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
    .line 791
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    const v1, 0x7f080407

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p2, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/vk/core/util/Resourcer;->str(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 792
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
    .line 796
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 797
    return-void
.end method

.method public onAudioRemovalDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 782
    return-void
.end method

.method public onAudioRemovalError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/MusicTrackModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 787
    return-void
.end method

.method public onAudioRemovalFromPlaylistDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vk/music/dto/Playlist;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
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
    .line 801
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p3}, Lcom/vk/music/view/adapter/ItemAdapter;->removeItem(Ljava/lang/Object;)V

    .line 802
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateInfoHeader()V

    .line 803
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateEmptyFooter()V

    .line 804
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateShuffleHeader()V

    .line 805
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updateTotalFooter()V

    .line 806
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
    .line 810
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 811
    return-void
.end method

.method public onDeletionDone(Lcom/vk/music/model/PlaylistModel;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 736
    const v1, 0x7f08040c

    invoke-static {v1}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 737
    invoke-interface {p1}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v0

    .line 738
    .local v0, "playlist":Lcom/vk/music/dto/Playlist;
    if-eqz v0, :cond_0

    .line 739
    new-instance v1, Lcom/vk/music/event/PlaylistRemoved;

    invoke-direct {v1, v0}, Lcom/vk/music/event/PlaylistRemoved;-><init>(Lcom/vk/music/dto/Playlist;)V

    invoke-static {v1}, Lcom/vk/music/event/MusicEventBus;->post(Lcom/vk/music/event/Event;)V

    .line 741
    :cond_0
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 742
    return-void
.end method

.method public onDeletionError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 746
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 747
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 554
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 556
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlaylistModel;->unsubscribe(Lcom/vk/music/model/PlaylistModel$Callback;)V

    .line 557
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/MusicTrackModel;->unsubscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V

    .line 558
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlayerModel;->unsubscribe(Lcom/vk/music/model/PlayerModel$Callback;)V

    .line 559
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 560
    return-void
.end method

.method onErrorRetryClick()V
    .locals 3

    .prologue
    .line 440
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlaylistModel;->load()V

    .line 441
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer;->progressView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/widget/ViewAnimator;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 442
    return-void
.end method

.method public onFollowingTogglingDone(Lcom/vk/music/model/PlaylistModel;Lcom/vk/music/dto/Playlist;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 726
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->infoHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ViewAdapter;->notifyDataSetChanged()V

    .line 727
    return-void
.end method

.method public onFollowingTogglingError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 731
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 732
    return-void
.end method

.method public onLoadingDone(Lcom/vk/music/model/PlaylistModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 697
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->bind()V

    .line 698
    return-void
.end method

.method public onLoadingError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 3
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 702
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->isRefreshing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 703
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 705
    :cond_0
    invoke-interface {p1}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v0

    if-nez v0, :cond_1

    .line 706
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->animator:Landroid/widget/ViewAnimator;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ViewAnimator;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 707
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->bindErrorView(Landroid/view/View;)V

    .line 709
    :cond_1
    return-void
.end method

.method public onLoadingMoreDone(Lcom/vk/music/model/PlaylistModel;Ljava/util/List;)V
    .locals 3
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
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
            "Lcom/vk/music/model/PlaylistModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 713
    .local p2, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 714
    invoke-interface {p1}, Lcom/vk/music/model/PlaylistModel;->canLoadMore()Z

    move-result v0

    .line 715
    .local v0, "canLoadMoreAudio":Z
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 716
    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer;->totalFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {p1}, Lcom/vk/music/model/PlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v2, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 717
    return-void

    .line 716
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onLoadingMoreError(Lcom/vk/music/model/PlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 721
    invoke-virtual {p0}, Lcom/vk/music/view/PlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 722
    return-void
.end method

.method public onPlayingPaused(Lcom/vk/music/model/PlayerModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 820
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updatePlaying()V

    .line 821
    return-void
.end method

.method public onPlayingResumed(Lcom/vk/music/model/PlayerModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 825
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updatePlaying()V

    .line 826
    return-void
.end method

.method public onPlayingStopped(Lcom/vk/music/model/PlayerModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 815
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->updatePlaying()V

    .line 816
    return-void
.end method

.method public onPlaylistChanged(Lcom/vk/music/model/PlaylistModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 766
    invoke-direct {p0}, Lcom/vk/music/view/PlaylistContainer;->bind()V

    .line 767
    return-void
.end method
