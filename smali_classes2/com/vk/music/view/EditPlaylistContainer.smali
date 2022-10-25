.class public final Lcom/vk/music/view/EditPlaylistContainer;
.super Landroid/widget/LinearLayout;
.source "EditPlaylistContainer.java"

# interfaces
.implements Lcom/vk/music/model/EditPlaylistModel$Callback;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/EditPlaylistContainer$UserListener;,
        Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;
    }
.end annotation


# static fields
.field private static final ATTACH_LIMIT:I = 0x64

.field private static final REQUEST_CODE_ATTACH_MUSIC:I = 0xa

.field private static final VIEW_TYPE_FOOTER1:I = 0x4

.field private static final VIEW_TYPE_FOOTER2:I = 0x5

.field private static final VIEW_TYPE_HEADER1:I = 0x1

.field private static final VIEW_TYPE_HEADER2:I = 0x2

.field private static final VIEW_TYPE_MUSIC_TRACK:I = 0x3


# instance fields
.field final activity:Landroid/app/Activity;

.field attachHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field private btnSave:Landroid/widget/TextView;

.field final inflater:Landroid/view/LayoutInflater;

.field infoHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field infoHeaderCreatorBinder:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

.field final lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

.field loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final model:Lcom/vk/music/model/EditPlaylistModel;

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

.field recyclerView:Landroid/support/v7/widget/RecyclerView;

.field final resourcer:Lcom/vk/core/util/Resourcer;

.field totalFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field totalFooterCreatorBinder:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;

.field final userListener:Lcom/vk/music/view/EditPlaylistContainer$UserListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/EditPlaylistModel;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "model"    # Lcom/vk/music/model/EditPlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v6, 0x0

    const/4 v8, 0x1

    .line 246
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 247
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->activity:Landroid/app/Activity;

    .line 248
    invoke-static {p1}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    .line 249
    iput-object p2, p0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    .line 250
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    .line 251
    new-instance v4, Lcom/vk/music/view/EditPlaylistContainer$UserListener;

    invoke-direct {v4, p0, v6}, Lcom/vk/music/view/EditPlaylistContainer$UserListener;-><init>(Lcom/vk/music/view/EditPlaylistContainer;Lcom/vk/music/view/EditPlaylistContainer$1;)V

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->userListener:Lcom/vk/music/view/EditPlaylistContainer$UserListener;

    .line 253
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    const v5, 0x7f03012f

    invoke-virtual {v4, v5, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 254
    invoke-virtual {p0, v8}, Lcom/vk/music/view/EditPlaylistContainer;->setOrientation(I)V

    .line 256
    const v4, 0x7f1003c9

    invoke-virtual {p0, v4}, Lcom/vk/music/view/EditPlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 257
    .local v3, "toolbarTitle":Landroid/widget/TextView;
    invoke-interface {p2}, Lcom/vk/music/model/EditPlaylistModel;->isNew()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 258
    const v4, 0x7f0803ff

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 263
    :goto_0
    const v4, 0x7f10029a

    invoke-virtual {p0, v4}, Lcom/vk/music/view/EditPlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iget-object v5, p0, Lcom/vk/music/view/EditPlaylistContainer;->userListener:Lcom/vk/music/view/EditPlaylistContainer$UserListener;

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 264
    const v4, 0x7f1003ca

    invoke-virtual {p0, v4}, Lcom/vk/music/view/EditPlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->btnSave:Landroid/widget/TextView;

    .line 265
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->btnSave:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/vk/music/view/EditPlaylistContainer;->userListener:Lcom/vk/music/view/EditPlaylistContainer$UserListener;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 267
    const v4, 0x7f10018a

    invoke-virtual {p0, v4}, Lcom/vk/music/view/EditPlaylistContainer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/RecyclerView;

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 268
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v8}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 269
    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->activity:Landroid/app/Activity;

    invoke-direct {v1, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 270
    .local v1, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 271
    new-instance v2, Lcom/vk/music/view/LastReachedScrollListener;

    invoke-direct {v2, v1}, Lcom/vk/music/view/LastReachedScrollListener;-><init>(Landroid/support/v7/widget/LinearLayoutManager;)V

    .line 272
    .local v2, "scrollListener":Lcom/vk/music/view/LastReachedScrollListener;
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->userListener:Lcom/vk/music/view/EditPlaylistContainer$UserListener;

    invoke-virtual {v2, v4}, Lcom/vk/music/view/LastReachedScrollListener;->setListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V

    .line 273
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 275
    new-instance v4, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-direct {v4, p0, v6}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;-><init>(Lcom/vk/music/view/EditPlaylistContainer;Lcom/vk/music/view/EditPlaylistContainer$1;)V

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    .line 276
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-static {p0}, Lcom/vk/music/view/EditPlaylistContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/EditPlaylistContainer;)Lcom/vkontakte/android/functions/VoidF;

    move-result-object v5

    iput-object v5, v4, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->onTitleTextChanged:Lcom/vkontakte/android/functions/VoidF;

    .line 278
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v5, p0, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    iget-object v6, p0, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-direct {v4, v5, v6, v8}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 279
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0}, Lcom/vk/music/view/EditPlaylistContainer$$Lambda$2;->lambdaFactory$(Lcom/vk/music/view/EditPlaylistContainer;)Lcom/vkontakte/android/functions/F1;

    move-result-object v5

    const/4 v6, 0x2

    invoke-direct {v4, v5, v6}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->attachHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 289
    new-instance v4, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    iget-object v5, p0, Lcom/vk/music/view/EditPlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    invoke-direct {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v5, 0x7f030128

    .line 290
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    new-instance v5, Lcom/vk/music/view/adapter/HighlightMusicBinder;

    .line 291
    invoke-interface {p2}, Lcom/vk/music/model/EditPlaylistModel;->getRemoved()Ljava/util/Collection;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vk/music/view/adapter/HighlightMusicBinder;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    const v5, 0x7f1003c2

    invoke-static {p0}, Lcom/vk/music/view/EditPlaylistContainer$$Lambda$3;->lambdaFactory$(Lcom/vk/music/view/EditPlaylistContainer;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v6

    .line 292
    invoke-virtual {v4, v5, v6}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(ILcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    invoke-static {}, Lcom/vk/music/view/EditPlaylistContainer$$Lambda$4;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v5

    .line 293
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    const/4 v5, 0x3

    .line 294
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 295
    invoke-virtual {v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 296
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v5, p0, Lcom/vk/music/view/EditPlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    const v6, 0x7f030132

    const/4 v7, 0x4

    invoke-direct {v4, v5, v6, v7}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Landroid/view/LayoutInflater;II)V

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 297
    new-instance v4, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;

    new-instance v5, Lcom/vk/music/view/EditPlaylistContainer$1;

    invoke-direct {v5, p0, p2}, Lcom/vk/music/view/EditPlaylistContainer$1;-><init>(Lcom/vk/music/view/EditPlaylistContainer;Lcom/vk/music/model/EditPlaylistModel;)V

    invoke-direct {v4, v5}, Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;-><init>(Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;)V

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->totalFooterCreatorBinder:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;

    .line 316
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v5, p0, Lcom/vk/music/view/EditPlaylistContainer;->totalFooterCreatorBinder:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;

    iget-object v6, p0, Lcom/vk/music/view/EditPlaylistContainer;->totalFooterCreatorBinder:Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;

    const/4 v7, 0x5

    invoke-direct {v4, v5, v6, v7}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->totalFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 318
    new-instance v0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    .line 319
    .local v0, "adapter":Lme/grishka/appkit/utils/MergeRecyclerAdapter;
    invoke-virtual {v0, v8}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 320
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 321
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->attachHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 322
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 323
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 324
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->totalFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 325
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 327
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->activity:Landroid/app/Activity;

    invoke-static {v4}, Lcom/vk/core/widget/LifecycleHandler;->install(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 328
    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v5, p0, Lcom/vk/music/view/EditPlaylistContainer;->userListener:Lcom/vk/music/view/EditPlaylistContainer$UserListener;

    invoke-virtual {v4, v5}, Lcom/vk/core/widget/LifecycleHandler;->setLifecycleListener(Lcom/vk/core/widget/LifecycleListener;)V

    .line 329
    return-void

    .line 260
    .end local v0    # "adapter":Lme/grishka/appkit/utils/MergeRecyclerAdapter;
    .end local v1    # "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    .end local v2    # "scrollListener":Lcom/vk/music/view/LastReachedScrollListener;
    :cond_0
    const v4, 0x7f080400

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_0
.end method

.method static synthetic access$100(Lcom/vk/music/view/EditPlaylistContainer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/view/EditPlaylistContainer;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/vk/music/view/EditPlaylistContainer;->updateAttachHeader()V

    return-void
.end method

.method static synthetic access$200(Lcom/vk/music/view/EditPlaylistContainer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/view/EditPlaylistContainer;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/vk/music/view/EditPlaylistContainer;->updateTotalFooter()V

    return-void
.end method

.method static synthetic access$300(Lcom/vk/music/view/EditPlaylistContainer;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/view/EditPlaylistContainer;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/vk/music/view/EditPlaylistContainer;->updateRemovedState(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method static synthetic access$lambda$0(Lcom/vk/music/view/EditPlaylistContainer;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/music/view/EditPlaylistContainer;->updateBtnSaveState()V

    return-void
.end method

.method private bind()V
    .locals 3

    .prologue
    .line 353
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/EditPlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v0

    .line 354
    .local v0, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-nez v0, :cond_0

    .line 355
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 359
    :goto_0
    invoke-direct {p0}, Lcom/vk/music/view/EditPlaylistContainer;->updateTotalFooter()V

    .line 360
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 361
    return-void

    .line 357
    :cond_0
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v2, p0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v2}, Lcom/vk/music/model/EditPlaylistModel;->canLoadMore()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    goto :goto_0
.end method

.method private updateAttachHeader()V
    .locals 3

    .prologue
    .line 364
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer;->attachHeaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/EditPlaylistModel;->getAttached()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    const/16 v2, 0x64

    if-ge v0, v2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 365
    return-void

    .line 364
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateBtnSaveState()V
    .locals 2

    .prologue
    .line 332
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer;->btnSave:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer;->infoHeaderCreatorBinder:Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    invoke-virtual {v1}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->isTitleValid()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 333
    return-void
.end method

.method private updateRemovedState(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 8
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 372
    iget-object v3, p0, Lcom/vk/music/view/EditPlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 374
    .local v0, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 375
    iget-object v3, p0, Lcom/vk/music/view/EditPlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/vk/music/view/EditPlaylistContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->findContainingViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    .line 376
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemId()J

    move-result-wide v4

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getMidId()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-nez v3, :cond_0

    .line 377
    check-cast v1, Lcom/vk/music/view/adapter/ItemViewHolder;

    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1}, Lcom/vk/music/view/adapter/ItemViewHolder;->rebind()V

    .line 374
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 380
    :cond_1
    return-void
.end method

.method private updateTotalFooter()V
    .locals 2

    .prologue
    .line 368
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer;->totalFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/EditPlaylistModel;->getMusicTracks()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 369
    return-void

    .line 368
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$new$1(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 281
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030137

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 282
    .local v0, "view":Landroid/widget/TextView;
    const v1, 0x7f0803a2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 283
    const v1, 0x7f02015f

    const v2, 0x7f0f0085

    invoke-static {v0, v1, v2}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;II)V

    .line 284
    invoke-static {p0}, Lcom/vk/music/view/EditPlaylistContainer$$Lambda$5;->lambdaFactory$(Lcom/vk/music/view/EditPlaylistContainer;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 285
    return-object v0
.end method

.method synthetic lambda$new$2(Landroid/view/View;Lcom/vkontakte/android/audio/MusicTrack;I)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p3, "position"    # I

    .prologue
    .line 292
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer;->userListener:Lcom/vk/music/view/EditPlaylistContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->onActionClick(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method synthetic lambda$null$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 284
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer;->userListener:Lcom/vk/music/view/EditPlaylistContainer$UserListener;

    invoke-virtual {v0}, Lcom/vk/music/view/EditPlaylistContainer$UserListener;->onAttachMusicClick()V

    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 337
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 339
    invoke-virtual {p0}, Lcom/vk/music/view/EditPlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 342
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/EditPlaylistModel;->subscribe(Lcom/vk/music/model/EditPlaylistModel$Callback;)V

    .line 343
    invoke-direct {p0}, Lcom/vk/music/view/EditPlaylistContainer;->bind()V

    .line 344
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 348
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 349
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/EditPlaylistModel;->unsubscribe(Lcom/vk/music/model/EditPlaylistModel$Callback;)V

    .line 350
    return-void
.end method

.method public onLoadingMoreDone(Lcom/vk/music/model/EditPlaylistModel;Ljava/util/List;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/EditPlaylistModel;
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
            "Lcom/vk/music/model/EditPlaylistModel;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 399
    .local p2, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer;->musicTracksAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 400
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {p1}, Lcom/vk/music/model/EditPlaylistModel;->canLoadMore()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 401
    invoke-direct {p0}, Lcom/vk/music/view/EditPlaylistContainer;->updateTotalFooter()V

    .line 402
    return-void
.end method

.method public onLoadingMoreError(Lcom/vk/music/model/EditPlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/EditPlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 406
    invoke-virtual {p0}, Lcom/vk/music/view/EditPlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 407
    return-void
.end method

.method public onSavingDone(Lcom/vk/music/model/EditPlaylistModel;Lcom/vk/music/dto/Playlist;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/EditPlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 384
    invoke-interface {p1}, Lcom/vk/music/model/EditPlaylistModel;->isNew()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 385
    new-instance v0, Lcom/vk/music/event/PlaylistCreated;

    invoke-direct {v0, p2}, Lcom/vk/music/event/PlaylistCreated;-><init>(Lcom/vk/music/dto/Playlist;)V

    invoke-static {v0}, Lcom/vk/music/event/MusicEventBus;->post(Lcom/vk/music/event/Event;)V

    .line 389
    :goto_0
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 390
    return-void

    .line 387
    :cond_0
    new-instance v0, Lcom/vk/music/event/PlaylistChanged;

    invoke-direct {v0, p2}, Lcom/vk/music/event/PlaylistChanged;-><init>(Lcom/vk/music/dto/Playlist;)V

    invoke-static {v0}, Lcom/vk/music/event/MusicEventBus;->post(Lcom/vk/music/event/Event;)V

    goto :goto_0
.end method

.method public onSavingError(Lcom/vk/music/model/EditPlaylistModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/EditPlaylistModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 394
    invoke-virtual {p0}, Lcom/vk/music/view/EditPlaylistContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 395
    return-void
.end method
