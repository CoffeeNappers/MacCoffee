.class public Lcom/vk/stories/view/ShareStoryRecyclerView;
.super Lme/grishka/appkit/views/UsableRecyclerView;
.source "ShareStoryRecyclerView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;)V

    .line 17
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
    .line 20
    invoke-direct {p0, p1, p2}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
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
    .line 24
    invoke-direct {p0, p1, p2, p3}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    return-void
.end method


# virtual methods
.method protected getColumnsCount()I
    .locals 5

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/vk/stories/view/ShareStoryRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v3, v4, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 50
    .local v3, "srcW":I
    invoke-virtual {p0}, Lcom/vk/stories/view/ShareStoryRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v1

    .line 52
    .local v1, "isTablet":Z
    invoke-static {}, Lcom/vk/core/util/Screen;->width()I

    move-result v2

    .line 53
    .local v2, "listWidth":I
    const/16 v4, 0x258

    if-lt v3, v4, :cond_1

    if-eqz v1, :cond_0

    const/high16 v4, 0x43200000    # 160.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 54
    .local v0, "columnWidth":I
    :goto_0
    div-int v4, v2, v0

    return v4

    .line 53
    .end local v0    # "columnWidth":I
    :cond_0
    const/high16 v4, 0x43870000    # 270.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 4
    .param p1, "widthSpec"    # I
    .param p2, "heightSpec"    # I

    .prologue
    .line 29
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/views/UsableRecyclerView;->onMeasure(II)V

    .line 31
    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/vk/stories/view/ShareStoryRecyclerView;->getColumnsCount()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 32
    .local v1, "spanCount":I
    invoke-virtual {p0}, Lcom/vk/stories/view/ShareStoryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 33
    invoke-virtual {p0}, Lcom/vk/stories/view/ShareStoryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/GridLayoutManager;

    .line 34
    .local v0, "lm":Landroid/support/v7/widget/GridLayoutManager;
    invoke-virtual {v0, v1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 35
    new-instance v2, Lcom/vk/stories/view/ShareStoryRecyclerView$1;

    invoke-direct {v2, p0, v1}, Lcom/vk/stories/view/ShareStoryRecyclerView$1;-><init>(Lcom/vk/stories/view/ShareStoryRecyclerView;I)V

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/GridLayoutManager;->setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V

    .line 46
    .end local v0    # "lm":Landroid/support/v7/widget/GridLayoutManager;
    :cond_0
    return-void
.end method
