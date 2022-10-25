.class public Lcom/vk/masks/MasksView;
.super Lcom/vk/lists/RecyclerPaginatedView;
.source "MasksView.java"

# interfaces
.implements Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/masks/MasksView$OnMaskSelectedListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/lists/RecyclerPaginatedView;",
        "Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset",
        "<",
        "Lcom/vkontakte/android/api/masks/MasksResponse;",
        ">;"
    }
.end annotation


# instance fields
.field private final adapter:Lcom/vk/masks/MasksAdapter;

.field private final masksContainer:Lcom/vk/masks/MasksContainer;

.field private final onMaskSelectedListener:Lcom/vk/masks/MasksView$OnMaskSelectedListener;

.field private paginateHelper:Lcom/vk/lists/PaginateHelper;

.field private final sectionId:I

.field private selectedMask:Lcom/vk/masks/model/Mask;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/masks/MasksContainer;ILcom/vk/masks/MasksView$OnMaskSelectedListener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "masksContainer"    # Lcom/vk/masks/MasksContainer;
    .param p3, "sectionId"    # I
    .param p4, "onMaskSelectedListener"    # Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    .prologue
    .line 36
    new-instance v1, Landroid/view/ContextThemeWrapper;

    const v2, 0x7f0b009a

    invoke-direct {v1, p1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {p0, v1}, Lcom/vk/lists/RecyclerPaginatedView;-><init>(Landroid/content/Context;)V

    .line 37
    iput p3, p0, Lcom/vk/masks/MasksView;->sectionId:I

    .line 38
    iput-object p2, p0, Lcom/vk/masks/MasksView;->masksContainer:Lcom/vk/masks/MasksContainer;

    .line 39
    new-instance v1, Lcom/vk/masks/MasksAdapter;

    invoke-virtual {p0}, Lcom/vk/masks/MasksView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p2, p3, p4}, Lcom/vk/masks/MasksAdapter;-><init>(Landroid/content/Context;Lcom/vk/masks/MasksContainer;ILcom/vk/masks/MasksView$OnMaskSelectedListener;)V

    iput-object v1, p0, Lcom/vk/masks/MasksView;->adapter:Lcom/vk/masks/MasksAdapter;

    .line 40
    iput-object p4, p0, Lcom/vk/masks/MasksView;->onMaskSelectedListener:Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    .line 41
    invoke-direct {p0, p1}, Lcom/vk/masks/MasksView;->init(Landroid/content/Context;)V

    .line 43
    invoke-virtual {p2}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 44
    iget-object v1, p0, Lcom/vk/masks/MasksView;->adapter:Lcom/vk/masks/MasksAdapter;

    invoke-virtual {v1}, Lcom/vk/masks/MasksAdapter;->getItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {p2}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 45
    .local v0, "neededIndex":I
    if-lez v0, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/vk/masks/MasksView;->getRecyclerView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    .line 49
    .end local v0    # "neededIndex":I
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/vk/masks/MasksView;)Lcom/vk/masks/MasksAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksView;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/masks/MasksView;->adapter:Lcom/vk/masks/MasksAdapter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/masks/MasksView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksView;

    .prologue
    .line 25
    iget v0, p0, Lcom/vk/masks/MasksView;->sectionId:I

    return v0
.end method

.method static synthetic access$200(Lcom/vk/masks/MasksView;)Lcom/vk/masks/MasksContainer;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksView;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/masks/MasksView;->masksContainer:Lcom/vk/masks/MasksContainer;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/masks/MasksView;)Lcom/vk/masks/model/Mask;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksView;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/masks/MasksView;->selectedMask:Lcom/vk/masks/model/Mask;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/masks/MasksView;)Lcom/vk/masks/MasksView$OnMaskSelectedListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksView;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/masks/MasksView;->onMaskSelectedListener:Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    return-object v0
.end method

.method private init(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v4, 0x8

    const/4 v5, 0x0

    .line 57
    sget-object v1, Lcom/vk/lists/AbstractPaginatedView$LayoutType;->GRID:Lcom/vk/lists/AbstractPaginatedView$LayoutType;

    invoke-virtual {p0, v1}, Lcom/vk/masks/MasksView;->initLayoutManager(Lcom/vk/lists/AbstractPaginatedView$LayoutType;)Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->setSpanCount(I)Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->buildAndSet()V

    .line 58
    invoke-virtual {p0}, Lcom/vk/masks/MasksView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090022

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p0, v1}, Lcom/vk/masks/MasksView;->setColumnWidth(I)V

    .line 59
    invoke-virtual {p0, v5}, Lcom/vk/masks/MasksView;->setSwipeRefreshEnabled(Z)V

    .line 60
    iget-object v1, p0, Lcom/vk/masks/MasksView;->adapter:Lcom/vk/masks/MasksAdapter;

    invoke-virtual {p0, v1}, Lcom/vk/masks/MasksView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 62
    const/16 v1, 0x50

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    .line 63
    .local v0, "bottomPadding":I
    invoke-virtual {p0}, Lcom/vk/masks/MasksView;->getRecyclerView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/support/v7/widget/RecyclerView;->setClipToPadding(Z)V

    .line 64
    invoke-virtual {p0}, Lcom/vk/masks/MasksView;->getRecyclerView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 66
    iget-object v1, p0, Lcom/vk/masks/MasksView;->errorView:Lcom/vk/lists/AbstractErrorView;

    invoke-virtual {v1, v5, v5, v5, v0}, Lcom/vk/lists/AbstractErrorView;->setPadding(IIII)V

    .line 67
    iget-object v1, p0, Lcom/vk/masks/MasksView;->loadingView:Landroid/view/View;

    invoke-virtual {v1, v5, v5, v5, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 68
    iget-object v1, p0, Lcom/vk/masks/MasksView;->emptyView:Landroid/view/View;

    invoke-virtual {v1, v5, v5, v5, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 71
    invoke-static {p0}, Lcom/vk/lists/PaginateHelper;->createWithOffset(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;)Lcom/vk/lists/PaginateHelper$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/masks/MasksView;->masksContainer:Lcom/vk/masks/MasksContainer;

    iget v3, p0, Lcom/vk/masks/MasksView;->sectionId:I

    .line 72
    invoke-virtual {v2, v3}, Lcom/vk/masks/MasksContainer;->getNextFromForSectionId(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/lists/PaginateHelper$Builder;->setDefaultNextFrom(Ljava/lang/String;)Lcom/vk/lists/PaginateHelper$Builder;

    move-result-object v1

    .line 73
    invoke-virtual {v1, v5}, Lcom/vk/lists/PaginateHelper$Builder;->setReloadOnBind(Z)Lcom/vk/lists/PaginateHelper$Builder;

    move-result-object v1

    const/16 v2, 0x3c

    .line 74
    invoke-virtual {v1, v2}, Lcom/vk/lists/PaginateHelper$Builder;->setPageSize(I)Lcom/vk/lists/PaginateHelper$Builder;

    move-result-object v1

    .line 75
    invoke-virtual {v1, p0}, Lcom/vk/lists/PaginateHelper$Builder;->buildAndBind(Lcom/vk/lists/AbstractPaginatedView;)Lcom/vk/lists/PaginateHelper;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/masks/MasksView;->paginateHelper:Lcom/vk/lists/PaginateHelper;

    .line 76
    return-void
.end method


# virtual methods
.method protected createLoadingView()Landroid/view/View;
    .locals 3

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/vk/masks/MasksView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0300e0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public loadNext(ILcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;
    .locals 2
    .param p1, "offset"    # I
    .param p2, "helper"    # Lcom/vk/lists/PaginateHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vk/lists/PaginateHelper;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lcom/vkontakte/android/api/masks/MasksResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 106
    iget v0, p0, Lcom/vk/masks/MasksView;->sectionId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 107
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksController;->recentMasks()Lcom/vkontakte/android/api/masks/MasksResponse;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    .line 110
    :goto_0
    return-object v0

    .line 109
    :cond_0
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils;->getLastKnownLocationRx()Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/masks/MasksView$2;

    invoke-direct {v1, p0, p2, p1}, Lcom/vk/masks/MasksView$2;-><init>(Lcom/vk/masks/MasksView;Lcom/vk/lists/PaginateHelper;I)V

    .line 110
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vk/masks/MasksView;->adapter:Lcom/vk/masks/MasksAdapter;

    invoke-virtual {v0}, Lcom/vk/masks/MasksAdapter;->notifyDataSetChanged()V

    .line 86
    return-void
.end method

.method public onNewData(Lio/reactivex/Observable;Lcom/vk/lists/PaginateHelper;)V
    .locals 2
    .param p2, "helper"    # Lcom/vk/lists/PaginateHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observable",
            "<",
            "Lcom/vkontakte/android/api/masks/MasksResponse;",
            ">;",
            "Lcom/vk/lists/PaginateHelper;",
            ")V"
        }
    .end annotation

    .prologue
    .line 128
    .local p1, "observable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lcom/vkontakte/android/api/masks/MasksResponse;>;"
    new-instance v0, Lcom/vk/masks/MasksView$3;

    invoke-direct {v0, p0, p2}, Lcom/vk/masks/MasksView$3;-><init>(Lcom/vk/masks/MasksView;Lcom/vk/lists/PaginateHelper;)V

    new-instance v1, Lcom/vk/masks/MasksView$4;

    invoke-direct {v1, p0}, Lcom/vk/masks/MasksView$4;-><init>(Lcom/vk/masks/MasksView;)V

    invoke-virtual {p1, v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 145
    return-void
.end method

.method public reload(Lcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;
    .locals 2
    .param p1, "helper"    # Lcom/vk/lists/PaginateHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/lists/PaginateHelper;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lcom/vkontakte/android/api/masks/MasksResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 95
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/vk/masks/MasksView;->loadNext(ILcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/masks/MasksView$1;

    invoke-direct {v1, p0}, Lcom/vk/masks/MasksView$1;-><init>(Lcom/vk/masks/MasksView;)V

    .line 96
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->doOnNext(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public reloadIfLocal()V
    .locals 2

    .prologue
    .line 79
    iget v0, p0, Lcom/vk/masks/MasksView;->sectionId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 80
    iget-object v0, p0, Lcom/vk/masks/MasksView;->paginateHelper:Lcom/vk/lists/PaginateHelper;

    invoke-virtual {v0}, Lcom/vk/lists/PaginateHelper;->reload()V

    .line 82
    :cond_0
    return-void
.end method

.method public setSelectedMask(Lcom/vk/masks/model/Mask;)V
    .locals 1
    .param p1, "selectedMask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/vk/masks/MasksView;->selectedMask:Lcom/vk/masks/model/Mask;

    .line 90
    iget-object v0, p0, Lcom/vk/masks/MasksView;->adapter:Lcom/vk/masks/MasksAdapter;

    invoke-virtual {v0, p1}, Lcom/vk/masks/MasksAdapter;->setSelectedMask(Lcom/vk/masks/model/Mask;)V

    .line 91
    return-void
.end method
