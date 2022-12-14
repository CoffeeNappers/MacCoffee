.class public Lcom/vk/attachpicker/widget/GalleryRecyclerView;
.super Landroid/support/v7/widget/RecyclerView;
.source "GalleryRecyclerView.java"


# instance fields
.field private columnWidthResId:I

.field private dividerSize:I

.field private itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 14
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->dividerSize:I

    .line 16
    const v0, 0x7f090025

    iput v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->columnWidthResId:I

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->dividerSize:I

    .line 16
    const v0, 0x7f090025

    iput v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->columnWidthResId:I

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyle"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->dividerSize:I

    .line 16
    const v0, 0x7f090025

    iput v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->columnWidthResId:I

    .line 28
    return-void
.end method

.method private checkItemDecoration()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    .line 62
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    instance-of v1, v1, Landroid/support/v7/widget/GridLayoutManager;

    if-eqz v1, :cond_0

    .line 63
    new-instance v0, Lcom/vk/attachpicker/widget/GridItemDecoration;

    iget v1, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->dividerSize:I

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v2}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result v2

    .line 64
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    check-cast v3, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v3}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->delta()I

    move-result v3

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/vk/attachpicker/widget/GridItemDecoration;-><init>(IIIIZ)V

    .line 65
    .local v0, "newItemDecoration":Landroid/support/v7/widget/RecyclerView$ItemDecoration;
    invoke-direct {p0, v0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->setItemDecorator(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 67
    .end local v0    # "newItemDecoration":Landroid/support/v7/widget/RecyclerView$ItemDecoration;
    :cond_0
    return-void
.end method

.method private setItemDecorator(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V
    .locals 1
    .param p1, "newItemDecorator"    # Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    .line 74
    :cond_0
    if-eqz p1, :cond_1

    .line 75
    iput-object p1, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    .line 76
    iget-object v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 78
    :cond_1
    return-void
.end method


# virtual methods
.method public getColumnWidthResId()I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->columnWidthResId:I

    return v0
.end method

.method protected onMeasure(II)V
    .locals 4
    .param p1, "widthSpec"    # I
    .param p2, "heightSpec"    # I

    .prologue
    .line 40
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->onMeasure(II)V

    .line 41
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->columnWidthResId:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v0, v2

    .line 42
    .local v0, "columnWidth":I
    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    instance-of v2, v2, Landroid/support/v7/widget/GridLayoutManager;

    if-eqz v2, :cond_0

    .line 43
    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getMeasuredWidth()I

    move-result v3

    div-int/2addr v3, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 44
    .local v1, "spanCount":I
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 45
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->checkItemDecoration()V

    .line 47
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/GridLayoutManager;

    new-instance v3, Lcom/vk/attachpicker/widget/GalleryRecyclerView$1;

    invoke-direct {v3, p0, v1}, Lcom/vk/attachpicker/widget/GalleryRecyclerView$1;-><init>(Lcom/vk/attachpicker/widget/GalleryRecyclerView;I)V

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/GridLayoutManager;->setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V

    .line 59
    .end local v1    # "spanCount":I
    :cond_0
    return-void
.end method

.method public setColumnWidthResId(I)V
    .locals 0
    .param p1, "columnWidthResId"    # I

    .prologue
    .line 35
    iput p1, p0, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->columnWidthResId:I

    .line 36
    return-void
.end method
