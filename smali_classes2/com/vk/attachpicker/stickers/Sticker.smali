.class public abstract Lcom/vk/attachpicker/stickers/Sticker;
.super Ljava/lang/Object;
.source "Sticker.java"


# instance fields
.field private alpha:I

.field private final boundingBox:Landroid/graphics/RectF;

.field private canvasHeight:F

.field private canvasWidth:F

.field private final drawingRect:[F

.field private isInEditMode:Z

.field private final matrix:Landroid/graphics/Matrix;

.field private final matrixValues:[F

.field private final points:[Landroid/graphics/PointF;

.field private final tmpMatrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrixValues:[F

    .line 12
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    .line 13
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->tmpMatrix:Landroid/graphics/Matrix;

    .line 18
    const/16 v0, 0x8

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    .line 19
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    .line 21
    const/16 v0, 0xff

    iput v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->alpha:I

    .line 151
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/graphics/PointF;

    const/4 v1, 0x0

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->points:[Landroid/graphics/PointF;

    .line 26
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/Sticker;->updatePosition()V

    .line 27
    return-void
.end method

.method private getValue(Landroid/graphics/Matrix;I)F
    .locals 1
    .param p1, "matrix"    # Landroid/graphics/Matrix;
    .param p2, "whichValue"    # I

    .prologue
    .line 206
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 207
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrixValues:[F

    aget v0, v0, p2

    return v0
.end method

.method private updatePosition()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 186
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 187
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 188
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->getOriginalWidth()F

    move-result v1

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 189
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->getOriginalHeight()F

    move-result v1

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 191
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    aput v2, v0, v1

    .line 192
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    aput v2, v0, v1

    .line 193
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    aput v2, v0, v1

    .line 194
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    aput v2, v0, v1

    .line 195
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    aput v2, v0, v1

    .line 196
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    aput v2, v0, v1

    .line 197
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    aput v2, v0, v1

    .line 198
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    aput v2, v0, v1

    .line 200
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 201
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 203
    return-void
.end method


# virtual methods
.method public canRotate()Z
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x1

    return v0
.end method

.method public canScale()Z
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x1

    return v0
.end method

.method public canTranslateX()Z
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x1

    return v0
.end method

.method public canTranslateY()Z
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x1

    return v0
.end method

.method public copy()Lcom/vk/attachpicker/stickers/Sticker;
    .locals 3

    .prologue
    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/vk/attachpicker/stickers/TextSticker;

    if-ne v1, v2, :cond_0

    .line 48
    new-instance v0, Lcom/vk/attachpicker/stickers/TextSticker;

    move-object v1, p0

    check-cast v1, Lcom/vk/attachpicker/stickers/TextSticker;

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/stickers/TextSticker;-><init>(Lcom/vk/attachpicker/stickers/TextSticker;)V

    .line 55
    .local v0, "sticker":Lcom/vk/attachpicker/stickers/Sticker;
    :goto_0
    iget v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->canvasWidth:F

    iput v1, v0, Lcom/vk/attachpicker/stickers/Sticker;->canvasWidth:F

    .line 56
    iget v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->canvasHeight:F

    iput v1, v0, Lcom/vk/attachpicker/stickers/Sticker;->canvasHeight:F

    .line 57
    iget-object v1, v0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 58
    invoke-direct {v0}, Lcom/vk/attachpicker/stickers/Sticker;->updatePosition()V

    .line 60
    return-object v0

    .line 49
    .end local v0    # "sticker":Lcom/vk/attachpicker/stickers/Sticker;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/vk/attachpicker/stickers/BitmapSticker;

    if-ne v1, v2, :cond_1

    .line 50
    new-instance v0, Lcom/vk/attachpicker/stickers/BitmapSticker;

    move-object v1, p0

    check-cast v1, Lcom/vk/attachpicker/stickers/BitmapSticker;

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/stickers/BitmapSticker;-><init>(Lcom/vk/attachpicker/stickers/BitmapSticker;)V

    .restart local v0    # "sticker":Lcom/vk/attachpicker/stickers/Sticker;
    goto :goto_0

    .line 52
    .end local v0    # "sticker":Lcom/vk/attachpicker/stickers/Sticker;
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "sticker":Lcom/vk/attachpicker/stickers/Sticker;
    goto :goto_0
.end method

.method public distance(FF)F
    .locals 3
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 176
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->getCenterX()F

    move-result v0

    sub-float/2addr v0, p1

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->getCenterX()F

    move-result v1

    sub-float/2addr v1, p1

    mul-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->getCenterY()F

    move-result v1

    sub-float/2addr v1, p2

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->getCenterY()F

    move-result v2

    sub-float/2addr v2, p2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public abstract doDraw(Landroid/graphics/Canvas;)V
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 145
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 146
    .local v0, "saveCount":I
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 147
    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/stickers/Sticker;->doDraw(Landroid/graphics/Canvas;)V

    .line 148
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 149
    return-void
.end method

.method public getAlpha()I
    .locals 1

    .prologue
    .line 114
    iget v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->alpha:I

    return v0
.end method

.method public getCenterX()F
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    return v0
.end method

.method public getCenterY()F
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->boundingBox:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    return v0
.end method

.method public getMatrix()Landroid/graphics/Matrix;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public abstract getOriginalHeight()F
.end method

.method public abstract getOriginalWidth()F
.end method

.method public getScale()F
    .locals 6

    .prologue
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 76
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/vk/attachpicker/stickers/Sticker;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float v0, v0

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    const/4 v2, 0x3

    invoke-direct {p0, v1, v2}, Lcom/vk/attachpicker/stickers/Sticker;->getValue(Landroid/graphics/Matrix;I)F

    move-result v1

    float-to-double v2, v1

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-float v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public handleCrop(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)V
    .locals 3
    .param p1, "before"    # Landroid/graphics/Matrix;
    .param p2, "after"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v2, 0x0

    .line 122
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 123
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 124
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 127
    iput v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->canvasWidth:F

    .line 128
    iput v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->canvasHeight:F

    .line 130
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/Sticker;->updatePosition()V

    .line 131
    return-void
.end method

.method public isCoordinatesInsideView(FF)Z
    .locals 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 160
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->points:[Landroid/graphics/PointF;

    aget-object v0, v0, v2

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    aget v1, v1, v2

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    aget v2, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 161
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->points:[Landroid/graphics/PointF;

    aget-object v0, v0, v3

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    aget v1, v1, v4

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    aget v2, v2, v5

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 162
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->points:[Landroid/graphics/PointF;

    aget-object v0, v0, v4

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v2, 0x4

    aget v1, v1, v2

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v3, 0x5

    aget v2, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 163
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->points:[Landroid/graphics/PointF;

    aget-object v0, v0, v5

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v2, 0x6

    aget v1, v1, v2

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->drawingRect:[F

    const/4 v3, 0x7

    aget v2, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 164
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->points:[Landroid/graphics/PointF;

    invoke-static {v0, p1, p2}, Lcom/vk/attachpicker/crop/MathCropUtils;->isPolygonContainsPoint([Landroid/graphics/PointF;FF)Z

    move-result v0

    return v0
.end method

.method public isInEditMode()Z
    .locals 1

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->isInEditMode:Z

    return v0
.end method

.method public reset(FF)V
    .locals 4
    .param p1, "width"    # F
    .param p2, "height"    # F

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    .line 80
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 81
    invoke-virtual {p0, p1, p2}, Lcom/vk/attachpicker/stickers/Sticker;->setCanvasDimension(FF)V

    .line 82
    div-float v0, p1, v3

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->getOriginalWidth()F

    move-result v1

    div-float/2addr v1, v3

    sub-float/2addr v0, v1

    div-float v1, p2, v3

    .line 83
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->getOriginalHeight()F

    move-result v2

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    .line 82
    invoke-virtual {p0, v0, v1}, Lcom/vk/attachpicker/stickers/Sticker;->translateBy(FF)V

    .line 84
    return-void
.end method

.method public rotateBy(FFF)V
    .locals 1
    .param p1, "rotation"    # F
    .param p2, "focusX"    # F
    .param p3, "focusY"    # F

    .prologue
    .line 107
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->canRotate()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 109
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/Sticker;->updatePosition()V

    .line 111
    :cond_0
    return-void
.end method

.method public scaleBy(FFF)V
    .locals 2
    .param p1, "scale"    # F
    .param p2, "focusX"    # F
    .param p3, "focusY"    # F

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->canScale()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->getScale()F

    move-result v0

    mul-float/2addr v0, p1

    const/high16 v1, 0x40800000    # 4.0f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->getScale()F

    move-result v0

    mul-float/2addr v0, p1

    const v1, 0x3e99999a    # 0.3f

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 101
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/Sticker;->updatePosition()V

    .line 104
    :cond_0
    return-void
.end method

.method public setAlpha(I)V
    .locals 0
    .param p1, "alpha"    # I

    .prologue
    .line 118
    iput p1, p0, Lcom/vk/attachpicker/stickers/Sticker;->alpha:I

    .line 119
    return-void
.end method

.method public setCanvasDimension(FF)V
    .locals 4
    .param p1, "width"    # F
    .param p2, "height"    # F

    .prologue
    const/4 v3, 0x0

    .line 134
    iget v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->canvasWidth:F

    cmpl-float v1, v1, v3

    if-lez v1, :cond_0

    iget v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->canvasHeight:F

    cmpl-float v1, v1, v3

    if-lez v1, :cond_0

    cmpl-float v1, p1, v3

    if-lez v1, :cond_0

    cmpl-float v1, p2, v3

    if-lez v1, :cond_0

    .line 135
    iget v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->canvasWidth:F

    div-float v1, p1, v1

    iget v2, p0, Lcom/vk/attachpicker/stickers/Sticker;->canvasHeight:F

    div-float v2, p2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 136
    .local v0, "scale":F
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0, v0, v3, v3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 139
    .end local v0    # "scale":F
    :cond_0
    iput p1, p0, Lcom/vk/attachpicker/stickers/Sticker;->canvasWidth:F

    .line 140
    iput p2, p0, Lcom/vk/attachpicker/stickers/Sticker;->canvasHeight:F

    .line 141
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/Sticker;->updatePosition()V

    .line 142
    return-void
.end method

.method public setInEditMode(Z)V
    .locals 0
    .param p1, "inEditMode"    # Z

    .prologue
    .line 68
    iput-boolean p1, p0, Lcom/vk/attachpicker/stickers/Sticker;->isInEditMode:Z

    .line 69
    return-void
.end method

.method public translateBy(FF)V
    .locals 2
    .param p1, "translationX"    # F
    .param p2, "translationY"    # F

    .prologue
    const/4 v1, 0x0

    .line 87
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->canTranslateX()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->canTranslateY()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 88
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 94
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/Sticker;->updatePosition()V

    .line 95
    return-void

    .line 89
    :cond_1
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->canTranslateX()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 90
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0

    .line 91
    :cond_2
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/Sticker;->canTranslateY()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/Sticker;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0
.end method
