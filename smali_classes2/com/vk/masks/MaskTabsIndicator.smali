.class public Lcom/vk/masks/MaskTabsIndicator;
.super Landroid/support/v7/widget/RecyclerView;
.source "MaskTabsIndicator.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;
.implements Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;


# instance fields
.field private bottomDividerPaint:Landroid/graphics/Paint;

.field private halfDp:F

.field private pager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 24
    invoke-direct {p0}, Lcom/vk/masks/MaskTabsIndicator;->init()V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    invoke-direct {p0}, Lcom/vk/masks/MaskTabsIndicator;->init()V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyle"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    invoke-direct {p0}, Lcom/vk/masks/MaskTabsIndicator;->init()V

    .line 35
    return-void
.end method

.method private init()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 38
    new-instance v0, Lcom/vk/masks/MaskTabsAdapter;

    invoke-virtual {p0}, Lcom/vk/masks/MaskTabsIndicator;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/vk/masks/MaskTabsAdapter;-><init>(Landroid/content/Context;Lcom/vk/masks/MaskTabsHolder$OnMaskTabClick;)V

    invoke-virtual {p0, v0}, Lcom/vk/masks/MaskTabsIndicator;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 39
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vk/masks/MaskTabsIndicator;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, v2, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {p0, v0}, Lcom/vk/masks/MaskTabsIndicator;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 40
    invoke-virtual {p0, v2}, Lcom/vk/masks/MaskTabsIndicator;->setWillNotDraw(Z)V

    .line 41
    const/high16 v0, 0x3f000000    # 0.5f

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(F)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/masks/MaskTabsIndicator;->halfDp:F

    .line 42
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vk/masks/MaskTabsIndicator;->bottomDividerPaint:Landroid/graphics/Paint;

    .line 43
    iget-object v0, p0, Lcom/vk/masks/MaskTabsIndicator;->bottomDividerPaint:Landroid/graphics/Paint;

    const v1, 0x1effffff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 44
    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 3
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x1

    .line 68
    iget-object v1, p0, Lcom/vk/masks/MaskTabsIndicator;->pager:Landroid/support/v4/view/ViewPager;

    iget-object v2, p0, Lcom/vk/masks/MaskTabsIndicator;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v2

    sub-int/2addr v2, p1

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    if-gt v2, v0, :cond_0

    :goto_0
    invoke-virtual {v1, p1, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 69
    return-void

    .line 68
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 73
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->onDraw(Landroid/graphics/Canvas;)V

    .line 74
    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget v2, p0, Lcom/vk/masks/MaskTabsIndicator;->halfDp:F

    sub-float v2, v0, v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v3, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    int-to-float v4, v0

    iget-object v5, p0, Lcom/vk/masks/MaskTabsIndicator;->bottomDividerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 75
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 64
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 53
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/vk/masks/MaskTabsIndicator;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/vk/masks/MaskTabsAdapter;

    invoke-virtual {v0, p1}, Lcom/vk/masks/MaskTabsAdapter;->setSelectionPosition(I)V

    .line 58
    invoke-virtual {p0, p1}, Lcom/vk/masks/MaskTabsIndicator;->scrollToPosition(I)V

    .line 59
    return-void
.end method

.method public setPager(Landroid/support/v4/view/ViewPager;)V
    .locals 0
    .param p1, "pager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/vk/masks/MaskTabsIndicator;->pager:Landroid/support/v4/view/ViewPager;

    .line 79
    return-void
.end method

.method public setSections(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    invoke-virtual {p0}, Lcom/vk/masks/MaskTabsIndicator;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/vk/masks/MaskTabsAdapter;

    invoke-virtual {v0, p1}, Lcom/vk/masks/MaskTabsAdapter;->setSections(Ljava/util/ArrayList;)V

    .line 48
    return-void
.end method
