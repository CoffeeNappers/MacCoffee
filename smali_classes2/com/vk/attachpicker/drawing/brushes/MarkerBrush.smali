.class public Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;
.super Lcom/vk/attachpicker/drawing/brushes/Brush;
.source "MarkerBrush.java"


# instance fields
.field private final defaultHeight:F

.field private final defaultWidth:F

.field private final drawPeriod:F

.field private final drawingRect:Landroid/graphics/RectF;

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/vk/attachpicker/drawing/brushes/Brush;-><init>()V

    .line 20
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->drawPeriod:F

    .line 21
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->defaultWidth:F

    .line 22
    const/16 v0, 0x10

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->defaultHeight:F

    .line 24
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->paint:Landroid/graphics/Paint;

    .line 25
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 27
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->drawingRect:Landroid/graphics/RectF;

    .line 28
    return-void
.end method


# virtual methods
.method public copy()Lcom/vk/attachpicker/drawing/brushes/Brush;
    .locals 3

    .prologue
    .line 57
    new-instance v0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;-><init>()V

    .line 58
    .local v0, "b":Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;
    iget-object v1, v0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->paint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 59
    iget-object v1, v0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->drawingRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->drawingRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 60
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->getSize()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->setSize(F)V

    .line 61
    return-object v0
.end method

.method public draw(Landroid/graphics/Canvas;FF)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    .line 70
    iget v2, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->defaultWidth:F

    div-float/2addr v2, v4

    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->getSize()F

    move-result v3

    mul-float v0, v2, v3

    .line 71
    .local v0, "dx":F
    iget v2, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->defaultHeight:F

    div-float/2addr v2, v4

    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->getSize()F

    move-result v3

    mul-float v1, v2, v3

    .line 72
    .local v1, "dy":F
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->drawingRect:Landroid/graphics/RectF;

    sub-float v3, p2, v0

    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 73
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->drawingRect:Landroid/graphics/RectF;

    sub-float v3, p3, v1

    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 74
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->drawingRect:Landroid/graphics/RectF;

    add-float v3, p2, v0

    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 75
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->drawingRect:Landroid/graphics/RectF;

    add-float v3, p3, v1

    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 77
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 78
    const/high16 v2, -0x3d900000    # -60.0f

    invoke-virtual {p1, v2, p2, p3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 79
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->drawingRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v0, v0, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 80
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 81
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Path;)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "path"    # Landroid/graphics/Path;

    .prologue
    .line 66
    return-void
.end method

.method public drawPeriod()F
    .locals 1

    .prologue
    .line 85
    iget v0, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->drawPeriod:F

    return v0
.end method

.method public getAlpha()I
    .locals 1

    .prologue
    .line 42
    const/16 v0, 0xc8

    return v0
.end method

.method public getMaxDimension()F
    .locals 2

    .prologue
    .line 32
    iget v0, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->defaultHeight:F

    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->getSize()F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method public setColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    return-void
.end method

.method public shouldBeDrawnInDrawingLayer()Z
    .locals 1

    .prologue
    .line 52
    const/4 v0, 0x0

    return v0
.end method

.method public shouldBeDrawnInSessionDrawingLayer()Z
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x1

    return v0
.end method
