.class public final Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "RecyclerToListViewScrollListener.java"


# static fields
.field public static final SCROLL_STATE_SLOWDOWN:I = 0x3

.field public static final UNKNOWN_SCROLL_STATE:I = -0x80000000


# instance fields
.field private lastDY:I

.field private lastFirstVisible:I

.field private lastItemCount:I

.field private lastScrollState:I

.field private lastVisibleCount:I

.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/AbsListView$OnScrollListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 2
    .param p1, "scrollListener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    const/4 v1, -0x1

    .line 29
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->listeners:Ljava/util/List;

    .line 23
    iput v1, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastFirstVisible:I

    .line 24
    iput v1, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastVisibleCount:I

    .line 25
    iput v1, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastItemCount:I

    .line 26
    const/high16 v0, -0x80000000

    iput v0, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastScrollState:I

    .line 30
    iget-object v0, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    return-void
.end method


# virtual methods
.method public addScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 1
    .param p1, "scrollListener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 34
    iget-object v0, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    return-void
.end method

.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 43
    packed-switch p2, :pswitch_data_0

    .line 54
    const/high16 v1, -0x80000000

    iput v1, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastScrollState:I

    .line 57
    :goto_0
    iget-object v1, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->listeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/AbsListView$OnScrollListener;

    .line 58
    .local v0, "listener":Landroid/widget/AbsListView$OnScrollListener;
    const/4 v2, 0x0

    iget v3, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastScrollState:I

    invoke-interface {v0, v2, v3}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    goto :goto_1

    .line 45
    .end local v0    # "listener":Landroid/widget/AbsListView$OnScrollListener;
    :pswitch_0
    const/4 v1, 0x1

    iput v1, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastScrollState:I

    goto :goto_0

    .line 48
    :pswitch_1
    const/4 v1, 0x0

    iput v1, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastScrollState:I

    goto :goto_0

    .line 51
    :pswitch_2
    const/4 v1, 0x2

    iput v1, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastScrollState:I

    goto :goto_0

    .line 60
    :cond_0
    return-void

    .line 43
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 9
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    const/4 v8, 0x0

    .line 64
    iget v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastScrollState:I

    const/4 v7, 0x2

    if-ne v6, v7, :cond_0

    const/16 v6, 0x23

    if-ge p3, v6, :cond_0

    .line 65
    iget v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastDY:I

    if-lez v6, :cond_0

    iget v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastDY:I

    sub-int/2addr v6, p3

    const/16 v7, 0x64

    if-ge v6, v7, :cond_0

    .line 66
    const/4 v6, 0x3

    iput v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastScrollState:I

    .line 67
    iget-object v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->listeners:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/AbsListView$OnScrollListener;

    .line 68
    .local v3, "listener":Landroid/widget/AbsListView$OnScrollListener;
    iget v7, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastScrollState:I

    invoke-interface {v3, v8, v7}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    goto :goto_0

    .line 72
    .end local v3    # "listener":Landroid/widget/AbsListView$OnScrollListener;
    :cond_0
    iput p3, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastDY:I

    .line 74
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v4

    .line 75
    .local v4, "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    instance-of v6, v4, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v6, :cond_4

    move-object v2, v4

    .line 76
    check-cast v2, Landroid/support/v7/widget/LinearLayoutManager;

    .line 78
    .local v2, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    .line 79
    .local v0, "firstVisible":I
    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v6

    sub-int v6, v0, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v5

    .line 80
    .local v5, "visibleCount":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    .line 82
    .local v1, "itemCount":I
    iget v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastFirstVisible:I

    if-ne v0, v6, :cond_1

    iget v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastVisibleCount:I

    if-ne v5, v6, :cond_1

    iget v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastItemCount:I

    if-eq v1, v6, :cond_3

    .line 84
    :cond_1
    iget-object v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->listeners:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/AbsListView$OnScrollListener;

    .line 85
    .restart local v3    # "listener":Landroid/widget/AbsListView$OnScrollListener;
    invoke-interface {v3, v8, v0, v5, v1}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    goto :goto_1

    .line 87
    .end local v3    # "listener":Landroid/widget/AbsListView$OnScrollListener;
    :cond_2
    iput v0, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastFirstVisible:I

    .line 88
    iput v5, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastVisibleCount:I

    .line 89
    iput v1, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastItemCount:I

    .line 108
    .end local v0    # "firstVisible":I
    .end local v1    # "itemCount":I
    .end local v2    # "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    .end local v5    # "visibleCount":I
    :cond_3
    :goto_2
    return-void

    .line 91
    :cond_4
    instance-of v6, v4, Landroid/support/v7/widget/GridLayoutManager;

    if-eqz v6, :cond_3

    move-object v2, v4

    .line 92
    check-cast v2, Landroid/support/v7/widget/GridLayoutManager;

    .line 94
    .local v2, "layoutManager":Landroid/support/v7/widget/GridLayoutManager;
    invoke-virtual {v2}, Landroid/support/v7/widget/GridLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    .line 95
    .restart local v0    # "firstVisible":I
    invoke-virtual {v2}, Landroid/support/v7/widget/GridLayoutManager;->findLastVisibleItemPosition()I

    move-result v6

    sub-int v6, v0, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v5

    .line 96
    .restart local v5    # "visibleCount":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    .line 98
    .restart local v1    # "itemCount":I
    iget v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastFirstVisible:I

    if-ne v0, v6, :cond_5

    iget v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastVisibleCount:I

    if-ne v5, v6, :cond_5

    iget v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastItemCount:I

    if-eq v1, v6, :cond_3

    .line 100
    :cond_5
    iget-object v6, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->listeners:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/AbsListView$OnScrollListener;

    .line 101
    .restart local v3    # "listener":Landroid/widget/AbsListView$OnScrollListener;
    invoke-interface {v3, v8, v0, v5, v1}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    goto :goto_3

    .line 103
    .end local v3    # "listener":Landroid/widget/AbsListView$OnScrollListener;
    :cond_6
    iput v0, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastFirstVisible:I

    .line 104
    iput v5, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastVisibleCount:I

    .line 105
    iput v1, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->lastItemCount:I

    goto :goto_2
.end method

.method public removeScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 1
    .param p1, "scrollListener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 38
    iget-object v0, p0, Lme/grishka/appkit/preloading/RecyclerToListViewScrollListener;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 39
    return-void
.end method
