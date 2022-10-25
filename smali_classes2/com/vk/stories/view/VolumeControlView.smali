.class public Lcom/vk/stories/view/VolumeControlView;
.super Landroid/view/View;
.source "VolumeControlView.java"


# instance fields
.field private final DP8:I

.field private final bluePaint:Landroid/graphics/Paint;

.field private final grayPaint:Landroid/graphics/Paint;

.field private volumeLevel:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    .line 20
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 13
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/VolumeControlView;->DP8:I

    .line 14
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->grayPaint:Landroid/graphics/Paint;

    .line 15
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->bluePaint:Landroid/graphics/Paint;

    .line 21
    invoke-direct {p0}, Lcom/vk/stories/view/VolumeControlView;->init()V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x1

    .line 25
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/VolumeControlView;->DP8:I

    .line 14
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->grayPaint:Landroid/graphics/Paint;

    .line 15
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->bluePaint:Landroid/graphics/Paint;

    .line 26
    invoke-direct {p0}, Lcom/vk/stories/view/VolumeControlView;->init()V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x1

    .line 30
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/VolumeControlView;->DP8:I

    .line 14
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->grayPaint:Landroid/graphics/Paint;

    .line 15
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->bluePaint:Landroid/graphics/Paint;

    .line 31
    invoke-direct {p0}, Lcom/vk/stories/view/VolumeControlView;->init()V

    .line 32
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 35
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/VolumeControlView;->setBackgroundColor(I)V

    .line 37
    iget-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->grayPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x1e000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    iget-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->grayPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 39
    iget-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->grayPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 40
    iget-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->grayPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 42
    iget-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->bluePaint:Landroid/graphics/Paint;

    const v1, -0xa96d29

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 43
    iget-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->bluePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 44
    iget-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->bluePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000    # 3.0f

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 45
    iget-object v0, p0, Lcom/vk/stories/view/VolumeControlView;->bluePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 46
    return-void
.end method


# virtual methods
.method public getVolumeLevel()F
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lcom/vk/stories/view/VolumeControlView;->volumeLevel:F

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 50
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 52
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v2, v0

    .line 53
    .local v2, "cy":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    iget v1, p0, Lcom/vk/stories/view/VolumeControlView;->DP8:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    int-to-float v6, v0

    .line 55
    .local v6, "availableWidth":F
    iget v0, p0, Lcom/vk/stories/view/VolumeControlView;->DP8:I

    int-to-float v1, v0

    iget v0, p0, Lcom/vk/stories/view/VolumeControlView;->DP8:I

    int-to-float v0, v0

    add-float v3, v0, v6

    iget-object v5, p0, Lcom/vk/stories/view/VolumeControlView;->grayPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 56
    iget v0, p0, Lcom/vk/stories/view/VolumeControlView;->DP8:I

    int-to-float v1, v0

    iget v0, p0, Lcom/vk/stories/view/VolumeControlView;->DP8:I

    int-to-float v0, v0

    iget v3, p0, Lcom/vk/stories/view/VolumeControlView;->volumeLevel:F

    mul-float/2addr v3, v6

    add-float/2addr v3, v0

    iget-object v5, p0, Lcom/vk/stories/view/VolumeControlView;->bluePaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 57
    return-void
.end method

.method public setVolumeLevel(F)V
    .locals 1
    .param p1, "volumeLevel"    # F

    .prologue
    .line 64
    iput p1, p0, Lcom/vk/stories/view/VolumeControlView;->volumeLevel:F

    .line 65
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    .line 66
    const/4 p1, 0x0

    .line 70
    :cond_0
    :goto_0
    iput p1, p0, Lcom/vk/stories/view/VolumeControlView;->volumeLevel:F

    .line 71
    invoke-virtual {p0}, Lcom/vk/stories/view/VolumeControlView;->invalidate()V

    .line 72
    return-void

    .line 67
    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    .line 68
    const/high16 p1, 0x3f800000    # 1.0f

    goto :goto_0
.end method
