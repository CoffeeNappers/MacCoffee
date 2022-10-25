.class public final Lcom/vk/music/view/SearchResultContainer;
.super Landroid/widget/ViewAnimator;
.source "SearchResultContainer.java"

# interfaces
.implements Lcom/vk/music/model/SearchResultModel$Callback;
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
        Lcom/vk/music/view/SearchResultContainer$Host;,
        Lcom/vk/music/view/SearchResultContainer$UserListener;
    }
.end annotation


# static fields
.field private static final VIEW_TYPE_FOOTER1:I = 0x6

.field private static final VIEW_TYPE_HEADER1:I = 0x1

.field private static final VIEW_TYPE_HEADER2:I = 0x2

.field private static final VIEW_TYPE_RESULTS1:I = 0x3

.field private static final VIEW_TYPE_RESULTS2:I = 0x4

.field private static final VIEW_TYPE_RESULTS3:I = 0x5


# instance fields
.field final activity:Landroid/app/Activity;

.field final communitiesAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field final communitiesHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

.field final globalCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field globalCaptionView:Landroid/widget/TextView;

.field final globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field private host:Lcom/vk/music/view/SearchResultContainer$Host;

.field final inflater:Landroid/view/LayoutInflater;

.field final loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field final model:Lcom/vk/music/model/SearchResultModel;

.field final progressView:Landroid/view/View;

.field final refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

.field final userListener:Lcom/vk/music/view/SearchResultContainer$UserListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/SearchResultModel;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "model"    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 177
    invoke-direct {p0, p1}, Landroid/widget/ViewAnimator;-><init>(Landroid/content/Context;)V

    .line 80
    new-instance v7, Lcom/vk/music/view/SearchResultContainer$UserListener;

    invoke-direct {v7, p0}, Lcom/vk/music/view/SearchResultContainer$UserListener;-><init>(Lcom/vk/music/view/SearchResultContainer;)V

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->userListener:Lcom/vk/music/view/SearchResultContainer$UserListener;

    .line 178
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v7

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->activity:Landroid/app/Activity;

    .line 179
    iput-object p2, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    .line 180
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->inflater:Landroid/view/LayoutInflater;

    .line 181
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->inflater:Landroid/view/LayoutInflater;

    const v8, 0x7f03013a

    invoke-virtual {v7, v8, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 183
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->inflater:Landroid/view/LayoutInflater;

    const v8, 0x7f030025

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 184
    .local v3, "emptyView":Landroid/view/View;
    invoke-virtual {p0, v3}, Lcom/vk/music/view/SearchResultContainer;->addView(Landroid/view/View;)V

    .line 185
    const v7, 0x7f10019e

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 186
    .local v2, "emptyText":Landroid/widget/TextView;
    const v7, 0x7f08045d

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(I)V

    .line 188
    invoke-virtual {p0, v11}, Lcom/vk/music/view/SearchResultContainer;->setMeasureAllChildren(Z)V

    .line 190
    const v7, 0x7f100184

    invoke-virtual {p0, v7}, Lcom/vk/music/view/SearchResultContainer;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->progressView:Landroid/view/View;

    .line 192
    new-instance v7, Lcom/vkontakte/android/ui/ErrorViewHelper;

    const v8, 0x7f10001b

    invoke-virtual {p0, v8}, Lcom/vk/music/view/SearchResultContainer;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/vkontakte/android/ui/ErrorViewHelper;-><init>(Landroid/view/View;)V

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    .line 193
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-static {p0}, Lcom/vk/music/view/SearchResultContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/SearchResultContainer;)Landroid/view/View$OnClickListener;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setOnRetryListener(Landroid/view/View$OnClickListener;)V

    .line 195
    const v7, 0x7f1001a8

    invoke-virtual {p0, v7}, Lcom/vk/music/view/SearchResultContainer;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 196
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v7, v11}, Landroid/support/v4/widget/SwipeRefreshLayout;->setEnabled(Z)V

    .line 197
    const v7, 0x7f10018a

    invoke-virtual {p0, v7}, Lcom/vk/music/view/SearchResultContainer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lme/grishka/appkit/views/UsableRecyclerView;

    .line 198
    .local v5, "recyclerView":Lme/grishka/appkit/views/UsableRecyclerView;
    invoke-virtual {v5, v10}, Lme/grishka/appkit/views/UsableRecyclerView;->setHasFixedSize(Z)V

    .line 199
    invoke-virtual {v5, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setEmptyView(Landroid/view/View;)V

    .line 201
    new-instance v4, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v4, p1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 202
    .local v4, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    invoke-virtual {v5, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 203
    new-instance v6, Lcom/vk/music/view/LastReachedScrollListener;

    invoke-direct {v6, v4}, Lcom/vk/music/view/LastReachedScrollListener;-><init>(Landroid/support/v7/widget/LinearLayoutManager;)V

    .line 204
    .local v6, "scrollListener":Lcom/vk/music/view/LastReachedScrollListener;
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->userListener:Lcom/vk/music/view/SearchResultContainer$UserListener;

    invoke-virtual {v6, v7}, Lcom/vk/music/view/LastReachedScrollListener;->setListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V

    .line 205
    invoke-virtual {v5, v6}, Lme/grishka/appkit/views/UsableRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 207
    new-instance v7, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    iget-object v8, p0, Lcom/vk/music/view/SearchResultContainer;->inflater:Landroid/view/LayoutInflater;

    invoke-direct {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v8, 0x7f03012e

    .line 208
    invoke-virtual {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v7

    new-instance v8, Lcom/vk/music/view/SearchResultContainer$1;

    invoke-direct {v8, p0}, Lcom/vk/music/view/SearchResultContainer$1;-><init>(Lcom/vk/music/view/SearchResultContainer;)V

    .line 209
    invoke-virtual {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v7

    invoke-static {}, Lcom/vk/music/view/SearchResultContainer$$Lambda$2;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v8

    .line 224
    invoke-virtual {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v7

    const/4 v8, 0x3

    .line 225
    invoke-virtual {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v7

    .line 226
    invoke-virtual {v7}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v7

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->communitiesAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 227
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->communitiesAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v7, v10}, Lcom/vk/music/view/adapter/ItemAdapter;->setHasStableIds(Z)V

    .line 229
    new-instance v7, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0}, Lcom/vk/music/view/SearchResultContainer$$Lambda$3;->lambdaFactory$(Lcom/vk/music/view/SearchResultContainer;)Lcom/vkontakte/android/functions/F1;

    move-result-object v8

    invoke-direct {v7, v8, v10}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->communitiesHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 245
    new-instance v7, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    iget-object v8, p0, Lcom/vk/music/view/SearchResultContainer;->inflater:Landroid/view/LayoutInflater;

    invoke-direct {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v8, 0x7f030126

    .line 246
    invoke-virtual {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v7

    new-instance v8, Lcom/vk/music/view/SearchResultContainer$2;

    .line 247
    invoke-interface {p2}, Lcom/vk/music/model/SearchResultModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v9

    invoke-direct {v8, p0, v9}, Lcom/vk/music/view/SearchResultContainer$2;-><init>(Lcom/vk/music/view/SearchResultContainer;Lcom/vk/music/model/PlayerModel;)V

    invoke-virtual {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v7

    invoke-static {p0}, Lcom/vk/music/view/SearchResultContainer$$Lambda$4;->lambdaFactory$(Lcom/vk/music/view/SearchResultContainer;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v8

    .line 261
    invoke-virtual {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v7

    const v8, 0x7f1003bf

    invoke-static {p0}, Lcom/vk/music/view/SearchResultContainer$$Lambda$5;->lambdaFactory$(Lcom/vk/music/view/SearchResultContainer;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v9

    .line 262
    invoke-virtual {v7, v8, v9}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v7

    invoke-static {}, Lcom/vk/music/view/SearchResultContainer$$Lambda$6;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v8

    .line 263
    invoke-virtual {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v7

    const/4 v8, 0x4

    .line 264
    invoke-virtual {v7, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v1

    .line 265
    .local v1, "builder":Lcom/vk/music/view/adapter/ItemAdapter$Builder;, "Lcom/vk/music/view/adapter/ItemAdapter$Builder<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-virtual {v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v7

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 267
    new-instance v7, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0}, Lcom/vk/music/view/SearchResultContainer$$Lambda$7;->lambdaFactory$(Lcom/vk/music/view/SearchResultContainer;)Lcom/vkontakte/android/functions/F1;

    move-result-object v8

    invoke-static {p0, p2}, Lcom/vk/music/view/SearchResultContainer$$Lambda$8;->lambdaFactory$(Lcom/vk/music/view/SearchResultContainer;Lcom/vk/music/model/SearchResultModel;)Lcom/vkontakte/android/functions/VoidF;

    move-result-object v9

    const/4 v10, 0x2

    invoke-direct {v7, v8, v9, v10}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->globalCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 277
    const/4 v7, 0x5

    invoke-virtual {v1, v7}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v7

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 279
    new-instance v7, Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v8, p0, Lcom/vk/music/view/SearchResultContainer;->inflater:Landroid/view/LayoutInflater;

    const v9, 0x7f030132

    const/4 v10, 0x6

    invoke-direct {v7, v8, v9, v10}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    iput-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 280
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v7, v11}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 282
    new-instance v0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    .line 283
    .local v0, "adapter":Lme/grishka/appkit/utils/MergeRecyclerAdapter;
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->communitiesHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v7}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 284
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, v7}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 285
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->globalCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v7}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 286
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, v7}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 287
    iget-object v7, p0, Lcom/vk/music/view/SearchResultContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v7}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 288
    invoke-virtual {v5, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 289
    return-void
.end method

.method static synthetic access$000(Lcom/vk/music/view/SearchResultContainer;)Lcom/vk/music/view/SearchResultContainer$Host;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/view/SearchResultContainer;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->host:Lcom/vk/music/view/SearchResultContainer$Host;

    return-object v0
.end method

.method private bind()V
    .locals 7

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 331
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v3}, Lcom/vk/music/model/SearchResultModel;->isLoaded()Z

    move-result v3

    if-nez v3, :cond_1

    .line 332
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v3}, Lcom/vk/music/model/SearchResultModel;->getError()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 333
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/vk/music/view/SearchResultContainer;->indexOfChild(Landroid/view/View;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/vk/music/view/SearchResultContainer;->setDisplayedChild(I)V

    .line 350
    :goto_0
    return-void

    .line 335
    :cond_0
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->progressView:Landroid/view/View;

    invoke-virtual {p0, v3}, Lcom/vk/music/view/SearchResultContainer;->indexOfChild(Landroid/view/View;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/vk/music/view/SearchResultContainer;->setDisplayedChild(I)V

    .line 336
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v3}, Lcom/vk/music/model/SearchResultModel;->loadResults()V

    goto :goto_0

    .line 339
    :cond_1
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {p0, v3}, Lcom/vk/music/view/SearchResultContainer;->indexOfChild(Landroid/view/View;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/vk/music/view/SearchResultContainer;->setDisplayedChild(I)V

    .line 340
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v3}, Lcom/vk/music/model/SearchResultModel;->getCommunities()Ljava/util/List;

    move-result-object v0

    .line 341
    .local v0, "communities":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/Group;>;"
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->communitiesAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v3, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 342
    iget-object v6, p0, Lcom/vk/music/view/SearchResultContainer;->communitiesHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_2

    move v3, v4

    :goto_1
    invoke-virtual {v6, v3}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 343
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v3}, Lcom/vk/music/model/SearchResultModel;->getLocalResults()Ljava/util/List;

    move-result-object v2

    .line 344
    .local v2, "localResults":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v3, v2}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 345
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v3}, Lcom/vk/music/model/SearchResultModel;->getGlobalResults()Ljava/util/List;

    move-result-object v1

    .line 346
    .local v1, "globalResults":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v3, v1}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 347
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->globalCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {v1}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v6

    if-nez v6, :cond_3

    :goto_2
    invoke-virtual {v3, v4}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 348
    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v4, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v4}, Lcom/vk/music/model/SearchResultModel;->canLoadMore()Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    goto :goto_0

    .end local v1    # "globalResults":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .end local v2    # "localResults":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_2
    move v3, v5

    .line 342
    goto :goto_1

    .restart local v1    # "globalResults":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .restart local v2    # "localResults":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_3
    move v4, v5

    .line 347
    goto :goto_2
.end method

.method static synthetic lambda$new$1(Lcom/vkontakte/android/api/Group;)J
    .locals 2
    .param p0, "group"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 224
    iget v0, p0, Lcom/vkontakte/android/api/Group;->id:I

    int-to-long v0, v0

    return-wide v0
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/vk/music/view/SearchResultContainer;->onErrorRetryClick()V

    return-void
.end method

.method synthetic lambda$new$2(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 231
    iget-object v2, p0, Lcom/vk/music/view/SearchResultContainer;->inflater:Landroid/view/LayoutInflater;

    const v3, 0x7f030136

    invoke-virtual {v2, v3, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 232
    .local v1, "v":Landroid/view/View;
    const v2, 0x7f1003d3

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const v3, 0x7f0803fd

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 233
    const v2, 0x7f1003d4

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->userListener:Lcom/vk/music/view/SearchResultContainer$UserListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 234
    const v2, 0x7f10018a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    .line 235
    .local v0, "communitiesRecyclerView":Landroid/support/v7/widget/RecyclerView;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 236
    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v3, p0, Lcom/vk/music/view/SearchResultContainer;->activity:Landroid/app/Activity;

    invoke-direct {v2, v3, v4, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 237
    iget-object v2, p0, Lcom/vk/music/view/SearchResultContainer;->communitiesAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 239
    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 240
    return-object v1
.end method

.method synthetic lambda$new$3(Landroid/view/View;Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p3, "position"    # I

    .prologue
    .line 261
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->userListener:Lcom/vk/music/view/SearchResultContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/SearchResultContainer$UserListener;->onClick(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method synthetic lambda$new$4(Landroid/view/View;Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p3, "position"    # I

    .prologue
    .line 262
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->userListener:Lcom/vk/music/view/SearchResultContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/SearchResultContainer$UserListener;->onMenuClick(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method synthetic lambda$new$5(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 269
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->inflater:Landroid/view/LayoutInflater;

    const v1, 0x7f03012c

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->globalCaptionView:Landroid/widget/TextView;

    .line 270
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->globalCaptionView:Landroid/widget/TextView;

    const v1, 0x7f0803a8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 271
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->globalCaptionView:Landroid/widget/TextView;

    return-object v0
.end method

.method synthetic lambda$new$6(Lcom/vk/music/model/SearchResultModel;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 273
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer;->globalCaptionView:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/vk/music/model/SearchResultModel;->getLocalResults()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {v1, v0}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;I)V

    return-void

    :cond_0
    const v0, 0x7f02030c

    goto :goto_0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 293
    invoke-super {p0}, Landroid/widget/ViewAnimator;->onAttachedToWindow()V

    .line 295
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/SearchResultModel;->subscribe(Lcom/vk/music/model/SearchResultModel$Callback;)V

    .line 296
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlayerModel;->subscribe(Lcom/vk/music/model/PlayerModel$Callback;)V

    .line 297
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/MusicTrackModel;->subscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V

    .line 299
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer;->userListener:Lcom/vk/music/view/SearchResultContainer$UserListener;

    invoke-static {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 301
    invoke-direct {p0}, Lcom/vk/music/view/SearchResultContainer;->bind()V

    .line 303
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->loadResults()V

    .line 304
    return-void
.end method

.method public onAudioAdditionDone(Lcom/vk/music/model/MusicTrackModel;Lcom/vkontakte/android/audio/MusicTrack;)V
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
    .line 391
    const v0, 0x7f080405

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 392
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
    .line 396
    invoke-virtual {p0}, Lcom/vk/music/view/SearchResultContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 397
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
    .line 410
    invoke-virtual {p0}, Lcom/vk/music/view/SearchResultContainer;->getResources()Landroid/content/res/Resources;

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

    .line 411
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
    .line 415
    invoke-virtual {p0}, Lcom/vk/music/view/SearchResultContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 416
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
    .line 401
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
    .line 405
    invoke-virtual {p0}, Lcom/vk/music/view/SearchResultContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 406
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
    .line 419
    return-void
.end method

.method public onAudioRemovalFromPlaylistError(Lcom/vk/music/model/MusicTrackModel;Lme/grishka/appkit/api/ErrorResponse;)V
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
    .line 422
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 308
    invoke-super {p0}, Landroid/widget/ViewAnimator;->onDetachedFromWindow()V

    .line 310
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/SearchResultModel;->unsubscribe(Lcom/vk/music/model/SearchResultModel$Callback;)V

    .line 311
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/MusicTrackModel;->unsubscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V

    .line 312
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlayerModel;->unsubscribe(Lcom/vk/music/model/PlayerModel$Callback;)V

    .line 314
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 315
    return-void
.end method

.method onErrorRetryClick()V
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->loadResults()V

    .line 167
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->progressView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SearchResultContainer;->indexOfChild(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SearchResultContainer;->setDisplayedChild(I)V

    .line 168
    return-void
.end method

.method public onLoadingDone(Lcom/vk/music/model/SearchResultModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 354
    invoke-direct {p0}, Lcom/vk/music/view/SearchResultContainer;->bind()V

    .line 355
    return-void
.end method

.method public onLoadingError(Lcom/vk/music/model/SearchResultModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 359
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->isRefreshing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 360
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 362
    :cond_0
    invoke-interface {p1}, Lcom/vk/music/model/SearchResultModel;->getResults()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    .line 363
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SearchResultContainer;->indexOfChild(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SearchResultContainer;->setDisplayedChild(I)V

    .line 364
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->bindErrorView(Landroid/view/View;)V

    .line 366
    :cond_1
    return-void
.end method

.method public onLoadingMoreDone(Lcom/vk/music/model/SearchResultModel;Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/model/SearchResultModel;",
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
    .line 370
    .local p2, "localResults":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .local p3, "globalResults":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 371
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 373
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 374
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p3}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 376
    :cond_1
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {p1}, Lcom/vk/music/model/SearchResultModel;->canLoadMore()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 377
    return-void
.end method

.method public onLoadingMoreError(Lcom/vk/music/model/SearchResultModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 381
    invoke-virtual {p0}, Lcom/vk/music/view/SearchResultContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 382
    return-void
.end method

.method public onPlayingPaused(Lcom/vk/music/model/PlayerModel;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 432
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyDataSetChanged()V

    .line 433
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyDataSetChanged()V

    .line 434
    return-void
.end method

.method public onPlayingResumed(Lcom/vk/music/model/PlayerModel;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 438
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyDataSetChanged()V

    .line 439
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyDataSetChanged()V

    .line 440
    return-void
.end method

.method public onPlayingStopped(Lcom/vk/music/model/PlayerModel;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 426
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->localResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyDataSetChanged()V

    .line 427
    iget-object v0, p0, Lcom/vk/music/view/SearchResultContainer;->globalResultsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ItemAdapter;->notifyDataSetChanged()V

    .line 428
    return-void
.end method

.method public onPlaylistResult(Lcom/vk/music/dto/Playlist;)V
    .locals 2
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 322
    if-eqz p1, :cond_0

    .line 323
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/model/MusicTrackModel;->getTarget()Lcom/vkontakte/android/audio/MusicTrack;

    move-result-object v0

    .line 324
    .local v0, "target":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v0, :cond_0

    .line 325
    iget-object v1, p0, Lcom/vk/music/view/SearchResultContainer;->model:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1}, Lcom/vk/music/model/SearchResultModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, v0, p1}, Lcom/vk/music/model/MusicTrackModel;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 328
    .end local v0    # "target":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_0
    return-void
.end method

.method public onQueryChanged(Lcom/vk/music/model/SearchResultModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/SearchResultModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 386
    invoke-direct {p0}, Lcom/vk/music/view/SearchResultContainer;->bind()V

    .line 387
    return-void
.end method

.method public setHost(Lcom/vk/music/view/SearchResultContainer$Host;)V
    .locals 0
    .param p1, "host"    # Lcom/vk/music/view/SearchResultContainer$Host;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 318
    iput-object p1, p0, Lcom/vk/music/view/SearchResultContainer;->host:Lcom/vk/music/view/SearchResultContainer$Host;

    .line 319
    return-void
.end method
