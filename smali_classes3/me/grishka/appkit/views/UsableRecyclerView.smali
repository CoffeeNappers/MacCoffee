.class public Lme/grishka/appkit/views/UsableRecyclerView;
.super Landroid/support/v7/widget/RecyclerView;
.source "UsableRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/grishka/appkit/views/UsableRecyclerView$OnSizeChangeListener;,
        Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;,
        Lme/grishka/appkit/views/UsableRecyclerView$FooterViewHolder;,
        Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;,
        Lme/grishka/appkit/views/UsableRecyclerView$LongClickRunnable;,
        Lme/grishka/appkit/views/UsableRecyclerView$ClickStartRunnable;,
        Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;,
        Lme/grishka/appkit/views/UsableRecyclerView$DisableableClickable;,
        Lme/grishka/appkit/views/UsableRecyclerView$Clickable;,
        Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;,
        Lme/grishka/appkit/views/UsableRecyclerView$Adapter;,
        Lme/grishka/appkit/views/UsableRecyclerView$ExtendedListener;,
        Lme/grishka/appkit/views/UsableRecyclerView$Listener;
    }
.end annotation


# instance fields
.field private clickStartTimeout:I

.field private clickingViewHolder:Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

.field private drawHighlightOnTop:Z

.field private emptyView:Landroid/view/View;

.field private emptyViewObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

.field private footerAdapter:Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

.field private highlight:Landroid/graphics/drawable/Drawable;

.field private highlightBounds:Landroid/graphics/Rect;

.field private highlightBoundsProvider:Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;

.field private highlightedView:Landroid/view/View;

.field private lastTouchX:F

.field private lastTouchY:F

.field protected listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private longClickTimeout:I

.field private onSizeChangeListener:Lme/grishka/appkit/views/UsableRecyclerView$OnSizeChangeListener;

.field private postedClickStart:Ljava/lang/Runnable;

.field private postedLongClick:Ljava/lang/Runnable;

.field private preloader:Lme/grishka/appkit/preloading/ListPreloader;

.field private final recyclerViewDelegate:Lme/grishka/appkit/views/RecyclerViewDelegate;

.field private scrollListener:Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;

.field private touchDownX:F

.field private touchDownY:F

.field private touchSlop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 96
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 40
    new-instance v0, Lme/grishka/appkit/views/RecyclerViewDelegate;

    invoke-direct {v0, p0}, Lme/grishka/appkit/views/RecyclerViewDelegate;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->recyclerViewDelegate:Lme/grishka/appkit/views/RecyclerViewDelegate;

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    .line 50
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightBounds:Landroid/graphics/Rect;

    .line 53
    new-instance v0, Lme/grishka/appkit/views/UsableRecyclerView$1;

    invoke-direct {v0, p0}, Lme/grishka/appkit/views/UsableRecyclerView$1;-><init>(Lme/grishka/appkit/views/UsableRecyclerView;)V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->emptyViewObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .line 89
    const/4 v0, 0x0

    iput-boolean v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->drawHighlightOnTop:Z

    .line 97
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->init()V

    .line 98
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 101
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    new-instance v0, Lme/grishka/appkit/views/RecyclerViewDelegate;

    invoke-direct {v0, p0}, Lme/grishka/appkit/views/RecyclerViewDelegate;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->recyclerViewDelegate:Lme/grishka/appkit/views/RecyclerViewDelegate;

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    .line 50
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightBounds:Landroid/graphics/Rect;

    .line 53
    new-instance v0, Lme/grishka/appkit/views/UsableRecyclerView$1;

    invoke-direct {v0, p0}, Lme/grishka/appkit/views/UsableRecyclerView$1;-><init>(Lme/grishka/appkit/views/UsableRecyclerView;)V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->emptyViewObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .line 89
    const/4 v0, 0x0

    iput-boolean v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->drawHighlightOnTop:Z

    .line 102
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->init()V

    .line 103
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 106
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    new-instance v0, Lme/grishka/appkit/views/RecyclerViewDelegate;

    invoke-direct {v0, p0}, Lme/grishka/appkit/views/RecyclerViewDelegate;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->recyclerViewDelegate:Lme/grishka/appkit/views/RecyclerViewDelegate;

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    .line 50
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightBounds:Landroid/graphics/Rect;

    .line 53
    new-instance v0, Lme/grishka/appkit/views/UsableRecyclerView$1;

    invoke-direct {v0, p0}, Lme/grishka/appkit/views/UsableRecyclerView$1;-><init>(Lme/grishka/appkit/views/UsableRecyclerView;)V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->emptyViewObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .line 89
    const/4 v0, 0x0

    iput-boolean v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->drawHighlightOnTop:Z

    .line 107
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->init()V

    .line 108
    return-void
.end method

.method static synthetic access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView;

    .prologue
    .line 38
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->recyclerViewDelegate:Lme/grishka/appkit/views/RecyclerViewDelegate;

    return-object v0
.end method

.method static synthetic access$100(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/preloading/ListPreloader;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView;

    .prologue
    .line 38
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->preloader:Lme/grishka/appkit/preloading/ListPreloader;

    return-object v0
.end method

.method static synthetic access$1002(Lme/grishka/appkit/views/UsableRecyclerView;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 38
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$1100()[I
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lme/grishka/appkit/views/UsableRecyclerView;->PRESSED_ENABLED_FOCUSED_STATE_SET:[I

    return-object v0
.end method

.method static synthetic access$1202(Lme/grishka/appkit/views/UsableRecyclerView;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 38
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$1300()[I
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lme/grishka/appkit/views/UsableRecyclerView;->EMPTY_STATE_SET:[I

    return-object v0
.end method

.method static synthetic access$200(Lme/grishka/appkit/views/UsableRecyclerView;)V
    .locals 0
    .param p0, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView;

    .prologue
    .line 38
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->updateEmptyViewVisibility()V

    return-void
.end method

.method static synthetic access$500(Lme/grishka/appkit/views/UsableRecyclerView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView;

    .prologue
    .line 38
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$600()[I
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lme/grishka/appkit/views/UsableRecyclerView;->EMPTY_STATE_SET:[I

    return-object v0
.end method

.method static synthetic access$700(Lme/grishka/appkit/views/UsableRecyclerView;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView;

    .prologue
    .line 38
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$900(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView;

    .prologue
    .line 38
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickingViewHolder:Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    return-object v0
.end method

.method static synthetic access$902(Lme/grishka/appkit/views/UsableRecyclerView;Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 0
    .param p0, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView;
    .param p1, "x1"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .prologue
    .line 38
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickingViewHolder:Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    return-object p1
.end method

.method private init()V
    .locals 6

    .prologue
    const/16 v5, 0x19

    const/4 v4, 0x0

    .line 111
    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 150
    :goto_0
    return-void

    .line 115
    :cond_0
    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchSlop:I

    .line 116
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v1

    iput v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickStartTimeout:I

    .line 117
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v1

    iput v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->longClickTimeout:I

    .line 118
    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [I

    const v3, 0x101030e

    aput v3, v2, v4

    invoke-virtual {v1, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 119
    .local v0, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 120
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 122
    new-instance v1, Lme/grishka/appkit/utils/AutoAssignMaxRecycledViewPool;

    invoke-direct {v1, v5}, Lme/grishka/appkit/utils/AutoAssignMaxRecycledViewPool;-><init>(I)V

    invoke-virtual {p0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setRecycledViewPool(Landroid/support/v7/widget/RecyclerView$RecycledViewPool;)V

    .line 124
    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->recyclerViewDelegate:Lme/grishka/appkit/views/RecyclerViewDelegate;

    new-instance v2, Lme/grishka/appkit/views/UsableRecyclerView$2;

    invoke-direct {v2, p0}, Lme/grishka/appkit/views/UsableRecyclerView$2;-><init>(Lme/grishka/appkit/views/UsableRecyclerView;)V

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/RecyclerViewDelegate;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 147
    new-instance v1, Lme/grishka/appkit/preloading/ListPreloader;

    invoke-direct {v1, v5}, Lme/grishka/appkit/preloading/ListPreloader;-><init>(I)V

    iput-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->preloader:Lme/grishka/appkit/preloading/ListPreloader;

    .line 148
    new-instance v1, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;

    iget-object v2, p0, Lme/grishka/appkit/views/UsableRecyclerView;->preloader:Lme/grishka/appkit/preloading/ListPreloader;

    invoke-direct {v1, v2}, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;-><init>(Landroid/widget/AbsListView$OnScrollListener;)V

    iput-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->scrollListener:Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;

    .line 149
    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->scrollListener:Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;

    invoke-virtual {p0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    goto :goto_0
.end method

.method private updateEmptyViewVisibility()V
    .locals 2

    .prologue
    .line 392
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->emptyView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 393
    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->emptyView:Landroid/view/View;

    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 395
    :cond_0
    return-void

    .line 393
    :cond_1
    const/16 v0, 0x8

    goto :goto_0
.end method


# virtual methods
.method public addFooterView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 356
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 357
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->footerAdapter:Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

    if-nez v0, :cond_0

    .line 358
    new-instance v0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v1

    invoke-direct {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;-><init>(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->footerAdapter:Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

    .line 359
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->footerAdapter:Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->access$800(Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 360
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->footerAdapter:Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

    invoke-super {p0, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 365
    :goto_0
    return-void

    .line 362
    :cond_0
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->footerAdapter:Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->access$800(Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 363
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->footerAdapter:Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method public addScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 1
    .param p1, "scrollListener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 384
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->scrollListener:Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->addScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 385
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 297
    iget-boolean v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->drawHighlightOnTop:Z

    if-eqz v0, :cond_0

    .line 298
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 299
    :cond_0
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3

    .line 300
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 301
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightBoundsProvider:Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;

    if-eqz v0, :cond_5

    .line 302
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightBoundsProvider:Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    iget-object v2, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightBounds:Landroid/graphics/Rect;

    invoke-interface {v0, v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;->getSelectorBounds(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 307
    :cond_1
    :goto_0
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 308
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_2

    .line 309
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->lastTouchX:F

    iget v2, p0, Lme/grishka/appkit/views/UsableRecyclerView;->lastTouchY:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    .line 311
    :cond_2
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 313
    :cond_3
    iget-boolean v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->drawHighlightOnTop:Z

    if-nez v0, :cond_4

    .line 314
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 315
    :cond_4
    return-void

    .line 304
    :cond_5
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightBounds:Landroid/graphics/Rect;

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    iget-object v2, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v3

    iget-object v4, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0
.end method

.method public bridge synthetic findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 38
    invoke-virtual {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView;->findViewHolderForAdapterPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public findViewHolderForAdapterPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 404
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    return-object v0
.end method

.method public bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 38
    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .locals 2

    .prologue
    .line 369
    invoke-super {p0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .line 370
    .local v0, "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    instance-of v1, v0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

    if-eqz v1, :cond_1

    .line 371
    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

    .end local v0    # "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    iget-object v0, v0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .line 375
    :cond_0
    :goto_0
    return-object v0

    .line 372
    .restart local v0    # "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    :cond_1
    instance-of v1, v0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;

    if-eqz v1, :cond_0

    .line 373
    check-cast v0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;

    .end local v0    # "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    iget-object v0, v0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    goto :goto_0
.end method

.method public bridge synthetic getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 38
    invoke-virtual {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 1
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 399
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    return-object v0
.end method

.method public getCount()I
    .locals 2

    .prologue
    .line 379
    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    .line 380
    .local v0, "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemCount()I

    move-result v1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getOnSizeChangeListener()Lme/grishka/appkit/views/UsableRecyclerView$OnSizeChangeListener;
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->onSizeChangeListener:Lme/grishka/appkit/views/UsableRecyclerView$OnSizeChangeListener;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 331
    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onSizeChanged(IIII)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 284
    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/RecyclerView;->onSizeChanged(IIII)V

    .line 285
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->onSizeChangeListener:Lme/grishka/appkit/views/UsableRecyclerView$OnSizeChangeListener;

    if-eqz v0, :cond_0

    .line 286
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->onSizeChangeListener:Lme/grishka/appkit/views/UsableRecyclerView$OnSizeChangeListener;

    invoke-interface {v0, p1, p2, p3, p4}, Lme/grishka/appkit/views/UsableRecyclerView$OnSizeChangeListener;->onSizeChange(IIII)V

    .line 288
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x0

    const/4 v8, 0x0

    .line 154
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getScrollState()I

    move-result v3

    if-nez v3, :cond_4

    .line 155
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iput v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->lastTouchX:F

    iput v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchDownX:F

    .line 156
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->lastTouchY:F

    iput v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchDownY:F

    .line 157
    iput-object v8, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    .line 158
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-virtual {p0, v3, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object v2

    .line 159
    .local v2, "view":Landroid/view/View;
    if-eqz v2, :cond_4

    .line 160
    invoke-virtual {p0, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v1

    .line 161
    .local v1, "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    if-eqz v1, :cond_4

    .line 162
    instance-of v3, v1, Lme/grishka/appkit/views/UsableRecyclerView$Clickable;

    if-eqz v3, :cond_4

    .line 163
    instance-of v3, v1, Lme/grishka/appkit/views/UsableRecyclerView$DisableableClickable;

    if-eqz v3, :cond_0

    move-object v3, v1

    check-cast v3, Lme/grishka/appkit/views/UsableRecyclerView$DisableableClickable;

    invoke-interface {v3}, Lme/grishka/appkit/views/UsableRecyclerView$DisableableClickable;->isEnabled()Z

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    instance-of v3, v1, Lme/grishka/appkit/views/UsableRecyclerView$DisableableClickable;

    if-nez v3, :cond_3

    .line 164
    :cond_1
    iput-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickingViewHolder:Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .line 165
    iput-object v2, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    .line 166
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    if-eqz v3, :cond_2

    .line 167
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 168
    :cond_2
    new-instance v3, Lme/grishka/appkit/views/UsableRecyclerView$ClickStartRunnable;

    invoke-direct {v3, p0, v8}, Lme/grishka/appkit/views/UsableRecyclerView$ClickStartRunnable;-><init>(Lme/grishka/appkit/views/UsableRecyclerView;Lme/grishka/appkit/views/UsableRecyclerView$1;)V

    iput-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    iget v5, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickStartTimeout:I

    int-to-long v6, v5

    invoke-virtual {p0, v3, v6, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 170
    :cond_3
    instance-of v3, v1, Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;

    if-eqz v3, :cond_4

    .line 171
    new-instance v3, Lme/grishka/appkit/views/UsableRecyclerView$LongClickRunnable;

    invoke-direct {v3, p0, v8}, Lme/grishka/appkit/views/UsableRecyclerView$LongClickRunnable;-><init>(Lme/grishka/appkit/views/UsableRecyclerView;Lme/grishka/appkit/views/UsableRecyclerView$1;)V

    iput-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    iget v5, p0, Lme/grishka/appkit/views/UsableRecyclerView;->longClickTimeout:I

    int-to-long v6, v5

    invoke-virtual {p0, v3, v6, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 177
    .end local v1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .end local v2    # "view":Landroid/view/View;
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v5, 0x3

    if-ne v3, v5, :cond_6

    .line 178
    iput-object v8, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickingViewHolder:Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .line 179
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    if-eqz v3, :cond_6

    .line 180
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setPressed(Z)V

    .line 181
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    sget-object v5, Lme/grishka/appkit/views/UsableRecyclerView;->EMPTY_STATE_SET:[I

    invoke-virtual {v3, v5}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 182
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    if-eqz v3, :cond_5

    .line 183
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 184
    iput-object v8, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    .line 186
    :cond_5
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    if-eqz v3, :cond_6

    .line 187
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 188
    iput-object v8, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    .line 192
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v5, 0x2

    if-ne v3, v5, :cond_9

    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickingViewHolder:Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    if-eqz v3, :cond_9

    .line 193
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iput v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->lastTouchX:F

    .line 194
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->lastTouchY:F

    .line 195
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget v5, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchDownX:F

    sub-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget v5, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchSlop:I

    int-to-float v5, v5

    cmpl-float v3, v3, v5

    if-gtz v3, :cond_7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget v5, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchDownY:F

    sub-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget v5, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchSlop:I

    int-to-float v5, v5

    cmpl-float v3, v3, v5

    if-lez v3, :cond_9

    .line 196
    :cond_7
    iput-object v8, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickingViewHolder:Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .line 197
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    if-eqz v3, :cond_9

    .line 198
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightedView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setPressed(Z)V

    .line 199
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    sget-object v5, Lme/grishka/appkit/views/UsableRecyclerView;->EMPTY_STATE_SET:[I

    invoke-virtual {v3, v5}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 200
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    if-eqz v3, :cond_8

    .line 201
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 202
    iput-object v8, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    .line 204
    :cond_8
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    if-eqz v3, :cond_9

    .line 205
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 206
    iput-object v8, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    .line 211
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_d

    .line 212
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iput v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->lastTouchX:F

    .line 213
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->lastTouchY:F

    .line 214
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    if-eqz v3, :cond_a

    .line 215
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 216
    iput-object v8, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedLongClick:Ljava/lang/Runnable;

    .line 218
    :cond_a
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickingViewHolder:Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    if-eqz v3, :cond_d

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget v5, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchDownX:F

    sub-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget v5, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchSlop:I

    int-to-float v5, v5

    cmpg-float v3, v3, v5

    if-ltz v3, :cond_b

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget v5, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchDownY:F

    sub-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget v5, p0, Lme/grishka/appkit/views/UsableRecyclerView;->touchSlop:I

    int-to-float v5, v5

    cmpg-float v3, v3, v5

    if-gez v3, :cond_d

    .line 219
    :cond_b
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickingViewHolder:Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    check-cast v3, Lme/grishka/appkit/views/UsableRecyclerView$Clickable;

    invoke-interface {v3}, Lme/grishka/appkit/views/UsableRecyclerView$Clickable;->onClick()V

    .line 220
    invoke-virtual {p0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->playSoundEffect(I)V

    .line 221
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    if-eqz v3, :cond_c

    .line 222
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 223
    iget-object v3, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 224
    iput-object v8, p0, Lme/grishka/appkit/views/UsableRecyclerView;->postedClickStart:Ljava/lang/Runnable;

    .line 226
    :cond_c
    iput-object v8, p0, Lme/grishka/appkit/views/UsableRecyclerView;->clickingViewHolder:Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .line 227
    new-instance v3, Lme/grishka/appkit/views/UsableRecyclerView$3;

    invoke-direct {v3, p0}, Lme/grishka/appkit/views/UsableRecyclerView$3;-><init>(Lme/grishka/appkit/views/UsableRecyclerView;)V

    const-wide/16 v6, 0x32

    invoke-virtual {p0, v3, v6, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 240
    :cond_d
    :try_start_0
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 243
    :goto_0
    return v3

    .line 241
    :catch_0
    move-exception v0

    .line 242
    .local v0, "error":Ljava/lang/Exception;
    const-string/jumbo v3, "error"

    const-string/jumbo v5, "error"

    invoke-static {v3, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v3, v4

    .line 243
    goto :goto_0
.end method

.method public removeScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 1
    .param p1, "scrollListener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 388
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->scrollListener:Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->removeScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 389
    return-void
.end method

.method public setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 2
    .param p1, "adapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;

    .prologue
    .line 336
    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 337
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 353
    :goto_0
    return-void

    .line 341
    :cond_0
    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 342
    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->emptyViewObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 344
    :cond_1
    instance-of v0, p1, Lme/grishka/appkit/preloading/PrefetchInfoProvider;

    if-eqz v0, :cond_2

    .line 345
    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->preloader:Lme/grishka/appkit/preloading/ListPreloader;

    move-object v0, p1

    check-cast v0, Lme/grishka/appkit/preloading/PrefetchInfoProvider;

    invoke-virtual {v1, v0}, Lme/grishka/appkit/preloading/ListPreloader;->setProvider(Lme/grishka/appkit/preloading/PrefetchInfoProvider;)V

    .line 347
    :cond_2
    if-nez p1, :cond_4

    const/4 p1, 0x0

    .line 348
    :goto_1
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 349
    if-eqz p1, :cond_3

    .line 350
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->emptyViewObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 352
    :cond_3
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->updateEmptyViewVisibility()V

    goto :goto_0

    .line 347
    :cond_4
    new-instance v0, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;

    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .end local p1    # "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-direct {v0, p1}, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;-><init>(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    move-object p1, v0

    goto :goto_1
.end method

.method public setDrawSelectorOnTop(Z)V
    .locals 0
    .param p1, "drawOnTop"    # Z

    .prologue
    .line 267
    iput-boolean p1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->drawHighlightOnTop:Z

    .line 268
    return-void
.end method

.method public setEmptyView(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 322
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->emptyView:Landroid/view/View;

    .line 323
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->updateEmptyViewVisibility()V

    .line 324
    return-void
.end method

.method public setListener(Lme/grishka/appkit/views/UsableRecyclerView$Listener;)V
    .locals 0
    .param p1, "listener"    # Lme/grishka/appkit/views/UsableRecyclerView$Listener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 408
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    .line 409
    return-void
.end method

.method public setOnSizeChangeListener(Lme/grishka/appkit/views/UsableRecyclerView$OnSizeChangeListener;)V
    .locals 0
    .param p1, "onSizeChangeListener"    # Lme/grishka/appkit/views/UsableRecyclerView$OnSizeChangeListener;

    .prologue
    .line 279
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->onSizeChangeListener:Lme/grishka/appkit/views/UsableRecyclerView$OnSizeChangeListener;

    .line 280
    return-void
.end method

.method public setSelector(I)V
    .locals 1
    .param p1, "drawableRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 248
    invoke-virtual {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 249
    return-void
.end method

.method public setSelector(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "selector"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 254
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 255
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 260
    :cond_0
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    .line 261
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_1

    .line 264
    :goto_0
    return-void

    .line 263
    :cond_1
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    goto :goto_0
.end method

.method public setSelectorBoundsProvider(Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;)V
    .locals 0
    .param p1, "provider"    # Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;

    .prologue
    .line 271
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlightBoundsProvider:Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;

    .line 272
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 292
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView;->highlight:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
