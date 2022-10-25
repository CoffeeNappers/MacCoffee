.class public Lcom/vk/attachpicker/drawing/brushes/NeonBrush;
.super Lcom/vk/attachpicker/drawing/brushes/Brush;
.source "NeonBrush.java"


# static fields
.field private static final ADD_BACKGROUND_BLUR:F = 13.0f

.field private static final ADD_BACKGROUND_STROKE:F = 6.0f


# instance fields
.field private final backgroundPaint:Landroid/graphics/Paint;

.field private final defaultWidth:F

.field private final topPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 21
    invoke-direct {p0}, Lcom/vk/attachpicker/drawing/brushes/Brush;-><init>()V

    .line 22
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->defaultWidth:F

    .line 24
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->topPaint:Landroid/graphics/Paint;

    .line 25
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->topPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 26
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->topPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 27
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->topPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 29
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    .line 30
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 31
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 32
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 34
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->setSize(F)V

    .line 35
    return-void
.end method


# virtual methods
.method public copy()Lcom/vk/attachpicker/drawing/brushes/Brush;
    .locals 3

    .prologue
    .line 78
    new-instance v0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;-><init>()V

    .line 79
    .local v0, "b":Lcom/vk/attachpicker/drawing/brushes/NeonBrush;
    iget-object v1, v0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->topPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->topPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 80
    iget-object v1, v0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 81
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->getSize()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->setSize(F)V

    .line 82
    return-object v0
.end method

.method public draw(Landroid/graphics/Canvas;FF)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .prologue
    .line 93
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Path;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "path"    # Landroid/graphics/Path;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 88
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->topPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 89
    return-void
.end method

.method public drawPeriod()F
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x0

    return v0
.end method

.method public getAlpha()I
    .locals 1

    .prologue
    .line 63
    const/16 v0, 0xff

    return v0
.end method

.method public getMaxDimension()F
    .locals 3

    .prologue
    .line 47
    const v0, 0x3fb33333    # 1.4f

    iget v1, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->defaultWidth:F

    mul-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->getSize()F

    move-result v1

    mul-float/2addr v0, v1

    const/high16 v1, 0x40c00000    # 6.0f

    add-float/2addr v0, v1

    const/high16 v1, 0x41d00000    # 26.0f

    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->getSize()F

    move-result v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public setColor(I)V
    .locals 2
    .param p1, "color"    # I

    .prologue
    const/high16 v1, -0x1000000

    .line 52
    if-ne p1, v1, :cond_0

    .line 53
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->topPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    const v1, -0x338b1f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 59
    :goto_0
    return-void

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->topPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 57
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0
.end method

.method public setSize(F)V
    .locals 4
    .param p1, "size"    # F

    .prologue
    .line 39
    invoke-super {p0, p1}, Lcom/vk/attachpicker/drawing/brushes/Brush;->setSize(F)V

    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->topPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->defaultWidth:F

    mul-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 41
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    const v1, 0x3fb33333    # 1.4f

    iget v2, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->defaultWidth:F

    mul-float/2addr v1, v2

    mul-float/2addr v1, p1

    const/high16 v2, 0x40c00000    # 6.0f

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 42
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;->backgroundPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/BlurMaskFilter;

    const/high16 v2, 0x41500000    # 13.0f

    mul-float/2addr v2, p1

    sget-object v3, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v1, v2, v3}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 43
    return-void
.end method

.method public shouldBeDrawnInDrawingLayer()Z
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    return v0
.end method

.method public shouldBeDrawnInSessionDrawingLayer()Z
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x0

    return v0
.end method
