.class public Lcom/vk/stories/view/StoryProgressView;
.super Landroid/view/View;
.source "StoryProgressView.java"


# instance fields
.field private final DP1:I

.field private final DP2:I

.field private final DP20:I

.field private final DP8:I

.field private final LINE_HEGIHT:I

.field private final VIEW_HEIGHT:I

.field private currentSection:I

.field private progress:F

.field private sectionCount:I

.field private final whitePaint:Landroid/graphics/Paint;

.field private final whiteRect:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v2, 0x14

    const/4 v1, 0x1

    .line 31
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 17
    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP1:I

    .line 18
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP2:I

    .line 19
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    .line 20
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    .line 21
    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP20:I

    .line 22
    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->VIEW_HEIGHT:I

    .line 23
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    .line 24
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    .line 26
    iput v1, p0, Lcom/vk/stories/view/StoryProgressView;->sectionCount:I

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->currentSection:I

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->progress:F

    .line 32
    invoke-direct {p0}, Lcom/vk/stories/view/StoryProgressView;->init()V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/16 v2, 0x14

    const/4 v1, 0x1

    .line 36
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP1:I

    .line 18
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP2:I

    .line 19
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    .line 20
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    .line 21
    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP20:I

    .line 22
    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->VIEW_HEIGHT:I

    .line 23
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    .line 24
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    .line 26
    iput v1, p0, Lcom/vk/stories/view/StoryProgressView;->sectionCount:I

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->currentSection:I

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->progress:F

    .line 37
    invoke-direct {p0}, Lcom/vk/stories/view/StoryProgressView;->init()V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/16 v2, 0x14

    const/4 v1, 0x1

    .line 41
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP1:I

    .line 18
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP2:I

    .line 19
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    .line 20
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    .line 21
    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP20:I

    .line 22
    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->VIEW_HEIGHT:I

    .line 23
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    .line 24
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    .line 26
    iput v1, p0, Lcom/vk/stories/view/StoryProgressView;->sectionCount:I

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->currentSection:I

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StoryProgressView;->progress:F

    .line 42
    invoke-direct {p0}, Lcom/vk/stories/view/StoryProgressView;->init()V

    .line 43
    return-void
.end method

.method private getHorizontalPadding()I
    .locals 1

    .prologue
    .line 52
    invoke-static {}, Lcom/vk/core/util/Device;->isGalaxyS8()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/vk/core/util/Device;->isGalaxyS8Plus()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 53
    :cond_0
    iget v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP20:I

    .line 55
    :goto_0
    return v0

    :cond_1
    iget v0, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    goto :goto_0
.end method

.method private init()V
    .locals 2

    .prologue
    .line 46
    const v0, 0x7f0200c2

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/StoryProgressView;->setBackgroundResource(I)V

    .line 47
    iget-object v0, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 48
    iget-object v0, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 49
    return-void
.end method


# virtual methods
.method public getCurrentSection()I
    .locals 1

    .prologue
    .line 142
    iget v0, p0, Lcom/vk/stories/view/StoryProgressView;->currentSection:I

    return v0
.end method

.method public getProgress()F
    .locals 1

    .prologue
    .line 119
    iget v0, p0, Lcom/vk/stories/view/StoryProgressView;->progress:F

    return v0
.end method

.method public getSectionCount()I
    .locals 1

    .prologue
    .line 133
    iget v0, p0, Lcom/vk/stories/view/StoryProgressView;->sectionCount:I

    return v0
.end method

.method public hasOverlappingRendering()Z
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/16 v12, 0xff

    const/16 v11, 0x4c

    .line 71
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 73
    iget v5, p0, Lcom/vk/stories/view/StoryProgressView;->sectionCount:I

    if-nez v5, :cond_1

    .line 116
    :cond_0
    return-void

    .line 77
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v5

    invoke-direct {p0}, Lcom/vk/stories/view/StoryProgressView;->getHorizontalPadding()I

    move-result v6

    mul-int/lit8 v6, v6, 0x2

    sub-int v0, v5, v6

    .line 78
    .local v0, "availableWidth":I
    iget v5, p0, Lcom/vk/stories/view/StoryProgressView;->sectionCount:I

    div-int v3, v0, v5

    .line 80
    .local v3, "partWidth":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v5, p0, Lcom/vk/stories/view/StoryProgressView;->sectionCount:I

    if-ge v2, v5, :cond_0

    .line 83
    if-nez v2, :cond_2

    .line 84
    invoke-direct {p0}, Lcom/vk/stories/view/StoryProgressView;->getHorizontalPadding()I

    move-result v4

    .line 88
    .local v4, "startX":I
    :goto_1
    iget v5, p0, Lcom/vk/stories/view/StoryProgressView;->sectionCount:I

    add-int/lit8 v5, v5, -0x1

    if-ne v2, v5, :cond_3

    .line 89
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v5

    invoke-direct {p0}, Lcom/vk/stories/view/StoryProgressView;->getHorizontalPadding()I

    move-result v6

    sub-int v1, v5, v6

    .line 93
    .local v1, "endX":I
    :goto_2
    iget v5, p0, Lcom/vk/stories/view/StoryProgressView;->DP1:I

    add-int/2addr v4, v5

    .line 94
    iget v5, p0, Lcom/vk/stories/view/StoryProgressView;->DP1:I

    sub-int/2addr v1, v5

    .line 96
    iget v5, p0, Lcom/vk/stories/view/StoryProgressView;->currentSection:I

    if-ge v2, v5, :cond_4

    .line 97
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    int-to-float v6, v4

    iget v7, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    int-to-float v7, v7

    int-to-float v8, v1

    iget v9, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    iget v10, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    add-int/2addr v9, v10

    int-to-float v9, v9

    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 98
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v12}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 99
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    iget v7, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    iget-object v8, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 80
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 86
    .end local v1    # "endX":I
    .end local v4    # "startX":I
    :cond_2
    invoke-direct {p0}, Lcom/vk/stories/view/StoryProgressView;->getHorizontalPadding()I

    move-result v5

    mul-int v6, v3, v2

    add-int v4, v5, v6

    .restart local v4    # "startX":I
    goto :goto_1

    .line 91
    :cond_3
    add-int v1, v4, v3

    .restart local v1    # "endX":I
    goto :goto_2

    .line 101
    :cond_4
    iget v5, p0, Lcom/vk/stories/view/StoryProgressView;->currentSection:I

    if-ne v5, v2, :cond_5

    .line 102
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    int-to-float v6, v4

    iget v7, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    int-to-float v7, v7

    int-to-float v8, v1

    iget v9, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    iget v10, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    add-int/2addr v9, v10

    int-to-float v9, v9

    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 103
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v11}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 104
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    iget v7, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    iget-object v8, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 106
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    int-to-float v6, v4

    iget v7, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    int-to-float v7, v7

    int-to-float v8, v4

    sub-int v9, v1, v4

    int-to-float v9, v9

    iget v10, p0, Lcom/vk/stories/view/StoryProgressView;->progress:F

    mul-float/2addr v9, v10

    add-float/2addr v8, v9

    iget v9, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    iget v10, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    add-int/2addr v9, v10

    int-to-float v9, v9

    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 107
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v12}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 108
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    iget v7, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    iget-object v8, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_3

    .line 111
    :cond_5
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    int-to-float v6, v4

    iget v7, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    int-to-float v7, v7

    int-to-float v8, v1

    iget v9, p0, Lcom/vk/stories/view/StoryProgressView;->DP8:I

    iget v10, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    add-int/2addr v9, v10

    int-to-float v9, v9

    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 112
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v11}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 113
    iget-object v5, p0, Lcom/vk/stories/view/StoryProgressView;->whiteRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    iget v7, p0, Lcom/vk/stories/view/StoryProgressView;->LINE_HEGIHT:I

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    iget-object v8, p0, Lcom/vk/stories/view/StoryProgressView;->whitePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto/16 :goto_3
.end method

.method protected onMeasure(II)V
    .locals 2
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 66
    iget v0, p0, Lcom/vk/stories/view/StoryProgressView;->VIEW_HEIGHT:I

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-super {p0, p1, v0}, Landroid/view/View;->onMeasure(II)V

    .line 67
    return-void
.end method

.method public setCurrentSection(I)V
    .locals 0
    .param p1, "currentSection"    # I

    .prologue
    .line 146
    iput p1, p0, Lcom/vk/stories/view/StoryProgressView;->currentSection:I

    .line 147
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryProgressView;->invalidate()V

    .line 148
    return-void
.end method

.method public setProgress(F)V
    .locals 1
    .param p1, "progress"    # F

    .prologue
    .line 123
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    .line 124
    const/4 p1, 0x0

    .line 128
    :cond_0
    :goto_0
    iput p1, p0, Lcom/vk/stories/view/StoryProgressView;->progress:F

    .line 129
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryProgressView;->invalidate()V

    .line 130
    return-void

    .line 125
    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    .line 126
    const/high16 p1, 0x3f800000    # 1.0f

    goto :goto_0
.end method

.method public setSectionCount(I)V
    .locals 0
    .param p1, "sectionCount"    # I

    .prologue
    .line 137
    iput p1, p0, Lcom/vk/stories/view/StoryProgressView;->sectionCount:I

    .line 138
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryProgressView;->invalidate()V

    .line 139
    return-void
.end method
