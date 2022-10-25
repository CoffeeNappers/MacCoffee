.class public final Lcom/vk/music/view/RecommendedContainer;
.super Landroid/widget/ViewAnimator;
.source "RecommendedContainer.java"

# interfaces
.implements Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;
.implements Lcom/vk/music/model/RecommendedModel$Callback;
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
        Lcom/vk/music/view/RecommendedContainer$Host;,
        Lcom/vk/music/view/RecommendedContainer$Adapter;
    }
.end annotation


# instance fields
.field final adapter:Lcom/vk/music/view/RecommendedContainer$Adapter;

.field callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field final errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

.field host:Lcom/vk/music/view/RecommendedContainer$Host;

.field final inflater:Landroid/view/LayoutInflater;

.field final model:Lcom/vk/music/model/RecommendedModel;

.field final progressView:Landroid/view/View;

.field final recyclerView:Landroid/support/v7/widget/RecyclerView;

.field final refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/RecommendedModel;)V
    .locals 7
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "recommendedModel"    # Lcom/vk/music/model/RecommendedModel;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 60
    invoke-direct {p0, p1}, Landroid/widget/ViewAnimator;-><init>(Landroid/content/Context;)V

    .line 267
    new-instance v2, Lcom/vk/music/view/RecommendedContainer$1;

    invoke-direct {v2, p0}, Lcom/vk/music/view/RecommendedContainer$1;-><init>(Lcom/vk/music/view/RecommendedContainer;)V

    iput-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    .line 62
    iput-object p2, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    .line 64
    new-instance v2, Lcom/vk/music/view/RecommendedContainer$Adapter;

    iget-object v3, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    iget-object v4, p0, Lcom/vk/music/view/RecommendedContainer;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    invoke-direct {v2, v3, v4}, Lcom/vk/music/view/RecommendedContainer$Adapter;-><init>(Lcom/vk/music/model/RecommendedModel;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    iput-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->adapter:Lcom/vk/music/view/RecommendedContainer$Adapter;

    .line 66
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->inflater:Landroid/view/LayoutInflater;

    .line 68
    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->inflater:Landroid/view/LayoutInflater;

    const v3, 0x7f03013a

    invoke-virtual {v2, v3, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 69
    invoke-virtual {p0, v5}, Lcom/vk/music/view/RecommendedContainer;->setMeasureAllChildren(Z)V

    .line 71
    const v2, 0x7f100184

    invoke-virtual {p0, v2}, Lcom/vk/music/view/RecommendedContainer;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->progressView:Landroid/view/View;

    .line 73
    new-instance v2, Lcom/vkontakte/android/ui/ErrorViewHelper;

    const v3, 0x7f10001b

    invoke-virtual {p0, v3}, Lcom/vk/music/view/RecommendedContainer;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vkontakte/android/ui/ErrorViewHelper;-><init>(Landroid/view/View;)V

    iput-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    .line 74
    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-static {p0}, Lcom/vk/music/view/RecommendedContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/RecommendedContainer;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setOnRetryListener(Landroid/view/View$OnClickListener;)V

    .line 76
    const v2, 0x7f1001a8

    invoke-virtual {p0, v2}, Lcom/vk/music/view/RecommendedContainer;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 77
    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    new-array v3, v6, [I

    const v4, 0x7f0f0018

    aput v4, v3, v5

    invoke-virtual {v2, v3}, Landroid/support/v4/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 78
    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v2, p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 80
    const v2, 0x7f10018a

    invoke-virtual {p0, v2}, Lcom/vk/music/view/RecommendedContainer;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView;

    iput-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 81
    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v3

    iget-object v4, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v4

    invoke-virtual {v2, v3, v5, v4, v5}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 82
    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v6}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 83
    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v1, p1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 84
    .local v1, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 85
    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/vk/music/view/RecommendedContainer;->adapter:Lcom/vk/music/view/RecommendedContainer$Adapter;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 86
    new-instance v0, Lme/grishka/appkit/views/DividerItemDecoration;

    const v2, 0x7f02030c

    invoke-direct {v0, p1, v2}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    .line 87
    .local v0, "decor1":Lme/grishka/appkit/views/DividerItemDecoration;
    invoke-static {p0}, Lcom/vk/music/view/RecommendedContainer$$Lambda$2;->lambdaFactory$(Lcom/vk/music/view/RecommendedContainer;)Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    move-result-object v2

    invoke-virtual {v0, v2}, Lme/grishka/appkit/views/DividerItemDecoration;->setProvider(Lme/grishka/appkit/views/DividerItemDecoration$Provider;)Lme/grishka/appkit/views/DividerItemDecoration;

    .line 89
    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 94
    return-void
.end method

.method private bind()V
    .locals 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0}, Lcom/vk/music/model/RecommendedModel;->getSections()Ljava/util/ArrayList;

    move-result-object v0

    if-nez v0, :cond_1

    .line 125
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0}, Lcom/vk/music/model/RecommendedModel;->getError()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer;->indexOfChild(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer;->setDisplayedChild(I)V

    .line 138
    :goto_0
    return-void

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->progressView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer;->indexOfChild(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer;->setDisplayedChild(I)V

    .line 129
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0}, Lcom/vk/music/model/RecommendedModel;->load()V

    goto :goto_0

    .line 132
    :cond_1
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer;->indexOfChild(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer;->setDisplayedChild(I)V

    .line 133
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->isRefreshing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 134
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 136
    :cond_2
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->adapter:Lcom/vk/music/view/RecommendedContainer$Adapter;

    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getSections()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/RecommendedContainer$Adapter;->setSectionsAndUpdateView(Ljava/util/ArrayList;)V

    goto :goto_0
.end method

.method private notifyDataSetChangedInMusicHolders()V
    .locals 5

    .prologue
    .line 141
    iget-object v3, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 142
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 143
    iget-object v3, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/vk/music/view/RecommendedContainer;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    .line 144
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    instance-of v3, v1, Lcom/vk/music/view/holders/SectionHolder;

    if-eqz v3, :cond_0

    .line 145
    check-cast v1, Lcom/vk/music/view/holders/SectionHolder;

    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1}, Lcom/vk/music/view/holders/SectionHolder;->updatePlayingState()V

    .line 142
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 148
    :cond_1
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/vk/music/view/RecommendedContainer;->onErrorRetryClick()V

    return-void
.end method

.method synthetic lambda$new$1(I)Z
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 87
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->adapter:Lcom/vk/music/view/RecommendedContainer$Adapter;

    invoke-virtual {v0, p1}, Lcom/vk/music/view/RecommendedContainer$Adapter;->getItemViewType(I)I

    move-result v0

    sget-object v1, Lcom/vk/music/dto/Section$Type;->audios_special:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v1}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->adapter:Lcom/vk/music/view/RecommendedContainer$Adapter;

    .line 88
    invoke-virtual {v0}, Lcom/vk/music/view/RecommendedContainer$Adapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 103
    invoke-super {p0}, Landroid/widget/ViewAnimator;->onAttachedToWindow()V

    .line 105
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/RecommendedModel;->subscribe(Lcom/vk/music/model/RecommendedModel$Callback;)V

    .line 106
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/MusicTrackModel;->subscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V

    .line 107
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0}, Lcom/vk/music/model/RecommendedModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlayerModel;->subscribe(Lcom/vk/music/model/PlayerModel$Callback;)V

    .line 108
    invoke-virtual {p0}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    invoke-static {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 110
    invoke-direct {p0}, Lcom/vk/music/view/RecommendedContainer;->bind()V

    .line 111
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
    .line 319
    const v0, 0x7f080405

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 320
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
    .line 324
    invoke-virtual {p0}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 325
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
    .line 338
    invoke-virtual {p0}, Lcom/vk/music/view/RecommendedContainer;->getResources()Landroid/content/res/Resources;

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

    .line 339
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
    .line 343
    invoke-virtual {p0}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 344
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
    .line 329
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
    .line 333
    invoke-virtual {p0}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 334
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
    .line 348
    const v0, 0x7f080409

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 349
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
    .line 353
    invoke-virtual {p0}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->showToast(Landroid/content/Context;)V

    .line 354
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 115
    invoke-super {p0}, Landroid/widget/ViewAnimator;->onDetachedFromWindow()V

    .line 117
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/RecommendedModel;->unsubscribe(Lcom/vk/music/model/RecommendedModel$Callback;)V

    .line 118
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/MusicTrackModel;->unsubscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V

    .line 119
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0}, Lcom/vk/music/model/RecommendedModel;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/vk/music/model/PlayerModel;->unsubscribe(Lcom/vk/music/model/PlayerModel$Callback;)V

    .line 120
    invoke-virtual {p0}, Lcom/vk/music/view/RecommendedContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 121
    return-void
.end method

.method onErrorRetryClick()V
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0}, Lcom/vk/music/model/RecommendedModel;->load()V

    .line 98
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->progressView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer;->indexOfChild(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer;->setDisplayedChild(I)V

    .line 99
    return-void
.end method

.method public onLoadingDone(Lcom/vk/music/model/RecommendedModel;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/RecommendedModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 214
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->adapter:Lcom/vk/music/view/RecommendedContainer$Adapter;

    invoke-interface {p1}, Lcom/vk/music/model/RecommendedModel;->getSections()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/RecommendedContainer$Adapter;->setSectionsAndUpdateView(Ljava/util/ArrayList;)V

    .line 215
    invoke-direct {p0}, Lcom/vk/music/view/RecommendedContainer;->bind()V

    .line 216
    return-void
.end method

.method public onLoadingError(Lcom/vk/music/model/RecommendedModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/RecommendedModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "response"    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 220
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->isRefreshing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 221
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 223
    :cond_0
    invoke-interface {p1}, Lcom/vk/music/model/RecommendedModel;->getSections()Ljava/util/ArrayList;

    move-result-object v0

    if-nez v0, :cond_1

    .line 224
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer;->indexOfChild(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer;->setDisplayedChild(I)V

    .line 225
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->errorViewHelper:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2, v0}, Lme/grishka/appkit/api/ErrorResponse;->bindErrorView(Landroid/view/View;)V

    .line 227
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
    .line 238
    invoke-direct {p0}, Lcom/vk/music/view/RecommendedContainer;->notifyDataSetChangedInMusicHolders()V

    .line 239
    return-void
.end method

.method public onPlayingResumed(Lcom/vk/music/model/PlayerModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 243
    invoke-direct {p0}, Lcom/vk/music/view/RecommendedContainer;->notifyDataSetChangedInMusicHolders()V

    .line 244
    return-void
.end method

.method public onPlayingStopped(Lcom/vk/music/model/PlayerModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 233
    invoke-direct {p0}, Lcom/vk/music/view/RecommendedContainer;->notifyDataSetChangedInMusicHolders()V

    .line 234
    return-void
.end method

.method public onPlaylistResult(Lcom/vk/music/dto/Playlist;)V
    .locals 2
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 249
    if-eqz p1, :cond_0

    .line 250
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/model/MusicTrackModel;->getTarget()Lcom/vkontakte/android/audio/MusicTrack;

    move-result-object v0

    .line 251
    .local v0, "target":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v0, :cond_0

    .line 252
    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v1}, Lcom/vk/music/model/RecommendedModel;->getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;

    move-result-object v1

    invoke-interface {v1, v0, p1}, Lcom/vk/music/model/MusicTrackModel;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/dto/Playlist;)V

    .line 255
    .end local v0    # "target":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_0
    return-void
.end method

.method public onRefresh()V
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer;->model:Lcom/vk/music/model/RecommendedModel;

    invoke-interface {v0}, Lcom/vk/music/model/RecommendedModel;->load()V

    .line 208
    return-void
.end method

.method public setHost(Lcom/vk/music/view/RecommendedContainer$Host;)V
    .locals 0
    .param p1, "host"    # Lcom/vk/music/view/RecommendedContainer$Host;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 264
    iput-object p1, p0, Lcom/vk/music/view/RecommendedContainer;->host:Lcom/vk/music/view/RecommendedContainer$Host;

    .line 265
    return-void
.end method
