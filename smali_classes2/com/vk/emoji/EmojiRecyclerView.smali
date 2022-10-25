.class final Lcom/vk/emoji/EmojiRecyclerView;
.super Landroid/support/v7/widget/RecyclerView;
.source "EmojiRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;,
        Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;
    }
.end annotation


# instance fields
.field private headerInfoProvider:Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;

.field private onSpanCountChangeListener:Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;

.field private spanCount:I

.field private final spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 11
    new-instance v0, Lcom/vk/emoji/EmojiRecyclerView$1;

    invoke-direct {v0, p0}, Lcom/vk/emoji/EmojiRecyclerView$1;-><init>(Lcom/vk/emoji/EmojiRecyclerView;)V

    iput-object v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 22
    const/4 v0, 0x1

    iput v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanCount:I

    .line 28
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
    .line 31
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 11
    new-instance v0, Lcom/vk/emoji/EmojiRecyclerView$1;

    invoke-direct {v0, p0}, Lcom/vk/emoji/EmojiRecyclerView$1;-><init>(Lcom/vk/emoji/EmojiRecyclerView;)V

    iput-object v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 22
    const/4 v0, 0x1

    iput v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanCount:I

    .line 32
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
    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    new-instance v0, Lcom/vk/emoji/EmojiRecyclerView$1;

    invoke-direct {v0, p0}, Lcom/vk/emoji/EmojiRecyclerView$1;-><init>(Lcom/vk/emoji/EmojiRecyclerView;)V

    iput-object v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 22
    const/4 v0, 0x1

    iput v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanCount:I

    .line 36
    return-void
.end method

.method static synthetic access$000(Lcom/vk/emoji/EmojiRecyclerView;)Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/EmojiRecyclerView;

    .prologue
    .line 9
    iget-object v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->headerInfoProvider:Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/emoji/EmojiRecyclerView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/EmojiRecyclerView;

    .prologue
    .line 9
    iget v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanCount:I

    return v0
.end method


# virtual methods
.method public getHeaderInfoProvider()Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->headerInfoProvider:Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;

    return-object v0
.end method

.method public getOnSpanCountChangeListener()Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->onSpanCountChangeListener:Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;

    return-object v0
.end method

.method public getSpanCount()I
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanCount:I

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
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/vk/emoji/R$dimen;->emoji_keyboard_item_width:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v0, v2

    .line 42
    .local v0, "columnWidth":I
    if-lez v0, :cond_2

    invoke-virtual {p0}, Lcom/vk/emoji/EmojiRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {p0}, Lcom/vk/emoji/EmojiRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    instance-of v2, v2, Landroid/support/v7/widget/GridLayoutManager;

    if-eqz v2, :cond_2

    .line 43
    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/vk/emoji/EmojiRecyclerView;->getMeasuredWidth()I

    move-result v3

    div-int/2addr v3, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 44
    .local v1, "newSpanCount":I
    iget v2, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanCount:I

    if-eq v1, v2, :cond_1

    .line 45
    iput v1, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanCount:I

    .line 46
    iget-object v2, p0, Lcom/vk/emoji/EmojiRecyclerView;->onSpanCountChangeListener:Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;

    if-eqz v2, :cond_0

    .line 47
    iget-object v2, p0, Lcom/vk/emoji/EmojiRecyclerView;->onSpanCountChangeListener:Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;

    iget v3, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanCount:I

    invoke-interface {v2, v3}, Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;->onSpanCountChanged(I)V

    .line 49
    :cond_0
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/GridLayoutManager;

    iget v3, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanCount:I

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 51
    :cond_1
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/GridLayoutManager;

    iget-object v3, p0, Lcom/vk/emoji/EmojiRecyclerView;->spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/GridLayoutManager;->setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V

    .line 53
    .end local v1    # "newSpanCount":I
    :cond_2
    return-void
.end method

.method public setHeaderInfoProvider(Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;)V
    .locals 0
    .param p1, "headerInfoProvider"    # Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/vk/emoji/EmojiRecyclerView;->headerInfoProvider:Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;

    .line 61
    return-void
.end method

.method public setOnSpanCountChangeListener(Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;)V
    .locals 0
    .param p1, "onSpanCountChangeListener"    # Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/vk/emoji/EmojiRecyclerView;->onSpanCountChangeListener:Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;

    .line 69
    return-void
.end method
