.class public Lcom/vk/attachpicker/drawing/brushes/EraserBrush;
.super Lcom/vk/attachpicker/drawing/brushes/Brush;
.source "EraserBrush.java"


# instance fields
.field private final defaultWidth:F

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 16
    invoke-direct {p0}, Lcom/vk/attachpicker/drawing/brushes/Brush;-><init>()V

    .line 17
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->defaultWidth:F

    .line 19
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->paint:Landroid/graphics/Paint;

    .line 20
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 21
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 22
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 23
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->paint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 24
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 26
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->setSize(F)V

    .line 27
    return-void
.end method


# virtual methods
.method public copy()Lcom/vk/attachpicker/drawing/brushes/Brush;
    .locals 3

    .prologue
    .line 61
    new-instance v0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;-><init>()V

    .line 62
    .local v0, "b":Lcom/vk/attachpicker/drawing/brushes/EraserBrush;
    iget-object v1, v0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->paint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 63
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->getSize()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->setSize(F)V

    .line 64
    return-object v0
.end method

.method public draw(Landroid/graphics/Canvas;FF)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .prologue
    .line 74
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Path;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "path"    # Landroid/graphics/Path;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 70
    return-void
.end method

.method public drawPeriod()F
    .locals 1

    .prologue
    .line 78
    const/4 v0, 0x0

    return v0
.end method

.method public getAlpha()I
    .locals 1

    .prologue
    .line 46
    const/16 v0, 0xff

    return v0
.end method

.method public getMaxDimension()F
    .locals 2

    .prologue
    .line 37
    iget v0, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->defaultWidth:F

    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->getSize()F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method public setColor(I)V
    .locals 0
    .param p1, "color"    # I

    .prologue
    .line 42
    return-void
.end method

.method public setSize(F)V
    .locals 2
    .param p1, "size"    # F

    .prologue
    .line 31
    invoke-super {p0, p1}, Lcom/vk/attachpicker/drawing/brushes/Brush;->setSize(F)V

    .line 32
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;->defaultWidth:F

    mul-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 33
    return-void
.end method

.method public shouldBeDrawnInDrawingLayer()Z
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x1

    return v0
.end method

.method public shouldBeDrawnInSessionDrawingLayer()Z
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    return v0
.end method
