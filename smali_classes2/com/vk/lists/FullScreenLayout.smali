.class public Lcom/vk/lists/FullScreenLayout;
.super Landroid/view/ViewGroup;
.source "FullScreenLayout.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 12
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/lists/FullScreenLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 16
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vk/lists/FullScreenLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 88
    const/4 v0, 0x1

    return v0
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 59
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 82
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 93
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .locals 7
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 65
    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getChildCount()I

    move-result v3

    .line 67
    .local v3, "count":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 68
    invoke-virtual {p0, v4}, Lcom/vk/lists/FullScreenLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 69
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v5

    const/16 v6, 0x8

    if-eq v5, v6, :cond_0

    .line 70
    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getPaddingLeft()I

    move-result v1

    .line 71
    .local v1, "childLeft":I
    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getPaddingTop()I

    move-result v2

    .line 73
    .local v2, "childTop":I
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    add-int/2addr v5, v1

    .line 74
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    add-int/2addr v6, v2

    .line 72
    invoke-virtual {v0, v1, v2, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 67
    .end local v1    # "childLeft":I
    .end local v2    # "childTop":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 78
    .end local v0    # "child":Landroid/view/View;
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v9, 0x0

    .line 25
    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getChildCount()I

    move-result v3

    .line 27
    .local v3, "count":I
    const/4 v5, 0x0

    .line 28
    .local v5, "maxHeight":I
    const/4 v6, 0x0

    .line 31
    .local v6, "maxWidth":I
    invoke-virtual {p0, p1, p2}, Lcom/vk/lists/FullScreenLayout;->measureChildren(II)V

    .line 34
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 35
    invoke-virtual {p0, v4}, Lcom/vk/lists/FullScreenLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 36
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v7

    const/16 v8, 0x8

    if-eq v7, v8, :cond_0

    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    .line 38
    .local v2, "childRight":I
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 40
    .local v1, "childBottom":I
    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 41
    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 34
    .end local v1    # "childBottom":I
    .end local v2    # "childRight":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 46
    .end local v0    # "child":Landroid/view/View;
    :cond_1
    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getPaddingLeft()I

    move-result v7

    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getPaddingRight()I

    move-result v8

    add-int/2addr v7, v8

    add-int/2addr v6, v7

    .line 47
    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getPaddingTop()I

    move-result v7

    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getPaddingBottom()I

    move-result v8

    add-int/2addr v7, v8

    add-int/2addr v5, v7

    .line 50
    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getSuggestedMinimumHeight()I

    move-result v7

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 51
    invoke-virtual {p0}, Lcom/vk/lists/FullScreenLayout;->getSuggestedMinimumWidth()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 53
    invoke-static {v6, p1, v9}, Lcom/vk/lists/FullScreenLayout;->resolveSizeAndState(III)I

    move-result v7

    .line 54
    invoke-static {v5, p2, v9}, Lcom/vk/lists/FullScreenLayout;->resolveSizeAndState(III)I

    move-result v8

    .line 53
    invoke-virtual {p0, v7, v8}, Lcom/vk/lists/FullScreenLayout;->setMeasuredDimension(II)V

    .line 55
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 1

    .prologue
    .line 98
    const/4 v0, 0x0

    return v0
.end method
