.class public Lcom/vk/attachpicker/drawing/brushes/PenBrush;
.super Lcom/vk/attachpicker/drawing/brushes/Brush;
.source "PenBrush.java"


# instance fields
.field private final defaultWidth:F

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/vk/attachpicker/drawing/brushes/Brush;-><init>()V

    .line 16
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->defaultWidth:F

    .line 18
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->paint:Landroid/graphics/Paint;

    .line 19
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 20
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 21
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 23
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->setSize(F)V

    .line 24
    return-void
.end method


# virtual methods
.method public copy()Lcom/vk/attachpicker/drawing/brushes/Brush;
    .locals 3

    .prologue
    .line 59
    new-instance v0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/brushes/PenBrush;-><init>()V

    .line 60
    .local v0, "b":Lcom/vk/attachpicker/drawing/brushes/PenBrush;
    iget-object v1, v0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->paint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 61
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->getSize()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->setSize(F)V

    .line 62
    return-object v0
.end method

.method public draw(Landroid/graphics/Canvas;FF)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .prologue
    .line 72
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Path;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "path"    # Landroid/graphics/Path;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 68
    return-void
.end method

.method public drawPeriod()F
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    return v0
.end method

.method public getAlpha()I
    .locals 1

    .prologue
    .line 44
    const/16 v0, 0xff

    return v0
.end method

.method public getMaxDimension()F
    .locals 2

    .prologue
    .line 34
    iget v0, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->defaultWidth:F

    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->getSize()F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method public setColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    return-void
.end method

.method public setSize(F)V
    .locals 2
    .param p1, "size"    # F

    .prologue
    .line 28
    invoke-super {p0, p1}, Lcom/vk/attachpicker/drawing/brushes/Brush;->setSize(F)V

    .line 29
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;->defaultWidth:F

    mul-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 30
    return-void
.end method

.method public shouldBeDrawnInDrawingLayer()Z
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    return v0
.end method

.method public shouldBeDrawnInSessionDrawingLayer()Z
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    return v0
.end method
