.class Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;
.super Ljava/lang/Object;
.source "DrawingCanvas.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/drawing/DrawingCanvas;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DrawingSession"
.end annotation


# static fields
.field private static final interpolateQualityFactor:F = 0.3f


# instance fields
.field private distanceSinceLastDrawnPoint:F

.field private final drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

.field private lastDrawnPointX:F

.field private lastDrawnPointY:F

.field private pointsProcessed:I

.field private final textureBrush:Lcom/vk/attachpicker/drawing/brushes/Brush;


# direct methods
.method public constructor <init>(Lcom/vk/attachpicker/drawing/brushes/Brush;Lcom/vk/attachpicker/drawing/DrawingPath;)V
    .locals 1
    .param p1, "textureBrush"    # Lcom/vk/attachpicker/drawing/brushes/Brush;
    .param p2, "drawingPath"    # Lcom/vk/attachpicker/drawing/DrawingPath;

    .prologue
    const/4 v0, 0x0

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    iput v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->lastDrawnPointX:F

    .line 139
    iput v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->lastDrawnPointY:F

    .line 142
    iput-object p1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->textureBrush:Lcom/vk/attachpicker/drawing/brushes/Brush;

    .line 143
    iput-object p2, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    .line 144
    return-void
.end method

.method private distance(FFFF)F
    .locals 3
    .param p1, "x0"    # F
    .param p2, "y0"    # F
    .param p3, "x1"    # F
    .param p4, "y1"    # F

    .prologue
    .line 206
    sub-float v0, p1, p3

    sub-float v1, p1, p3

    mul-float/2addr v0, v1

    sub-float v1, p2, p4

    sub-float v2, p2, p4

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->textureBrush:Lcom/vk/attachpicker/drawing/brushes/Brush;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingPath;->getPath()Landroid/graphics/Path;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/vk/attachpicker/drawing/brushes/Brush;->draw(Landroid/graphics/Canvas;Landroid/graphics/Path;)V

    .line 152
    return-void
.end method

.method public drawUnprocessedPoints(Landroid/graphics/Canvas;Z)V
    .locals 25
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "finish"    # Z

    .prologue
    .line 155
    if-eqz p2, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/vk/attachpicker/drawing/DrawingPath;->size()I

    move-result v21

    if-lez v21, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/vk/attachpicker/drawing/DrawingPath;->size()I

    move-result v21

    const/16 v22, 0x5

    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_0

    .line 156
    const-string/jumbo v21, "tmp"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "drawingPath.size(): "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/vk/attachpicker/drawing/DrawingPath;->size()I

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, ", finish: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->textureBrush:Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual/range {v22 .. v23}, Lcom/vk/attachpicker/drawing/DrawingPath;->getX(I)F

    move-result v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual/range {v23 .. v24}, Lcom/vk/attachpicker/drawing/DrawingPath;->getY(I)F

    move-result v23

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/attachpicker/drawing/brushes/Brush;->draw(Landroid/graphics/Canvas;FF)V

    .line 203
    :goto_0
    return-void

    .line 161
    :cond_0
    const/16 v21, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->pointsProcessed:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x2

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 164
    .local v10, "start":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/vk/attachpicker/drawing/DrawingPath;->size()I

    move-result v21

    add-int/lit8 v6, v21, -0x2

    .line 166
    .local v6, "end":I
    move v8, v10

    .local v8, "j":I
    :goto_1
    if-ge v8, v6, :cond_3

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Lcom/vk/attachpicker/drawing/DrawingPath;->getX(I)F

    move-result v14

    .line 169
    .local v14, "x0":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Lcom/vk/attachpicker/drawing/DrawingPath;->getY(I)F

    move-result v18

    .line 170
    .local v18, "y0":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v21, v0

    add-int/lit8 v22, v8, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/vk/attachpicker/drawing/DrawingPath;->getX(I)F

    move-result v15

    .line 171
    .local v15, "x1":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v21, v0

    add-int/lit8 v22, v8, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/vk/attachpicker/drawing/DrawingPath;->getY(I)F

    move-result v19

    .line 172
    .local v19, "y1":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v21, v0

    add-int/lit8 v22, v8, 0x2

    invoke-virtual/range {v21 .. v22}, Lcom/vk/attachpicker/drawing/DrawingPath;->getX(I)F

    move-result v16

    .line 173
    .local v16, "x2":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v21, v0

    add-int/lit8 v22, v8, 0x2

    invoke-virtual/range {v21 .. v22}, Lcom/vk/attachpicker/drawing/DrawingPath;->getY(I)F

    move-result v20

    .line 175
    .local v20, "y2":F
    add-float v21, v14, v15

    const/high16 v22, 0x40000000    # 2.0f

    div-float v14, v21, v22

    .line 176
    add-float v21, v18, v19

    const/high16 v22, 0x40000000    # 2.0f

    div-float v18, v21, v22

    .line 177
    add-float v21, v15, v16

    const/high16 v22, 0x40000000    # 2.0f

    div-float v16, v21, v22

    .line 178
    add-float v21, v19, v20

    const/high16 v22, 0x40000000    # 2.0f

    div-float v20, v21, v22

    .line 180
    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-direct {v0, v14, v1, v15, v2}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->distance(FFFF)F

    move-result v21

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v16

    move/from16 v3, v20

    invoke-direct {v0, v15, v1, v2, v3}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->distance(FFFF)F

    move-result v22

    add-float v9, v21, v22

    .line 181
    .local v9, "length":F
    const v21, 0x3e99999a    # 0.3f

    mul-float v21, v21, v9

    invoke-static/range {v21 .. v21}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 183
    .local v4, "count":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v4, :cond_2

    .line 184
    int-to-float v0, v7

    move/from16 v21, v0

    int-to-float v0, v4

    move/from16 v22, v0

    div-float v11, v21, v22

    .line 185
    .local v11, "t":F
    mul-float v12, v11, v11

    .line 186
    .local v12, "t2":F
    const/high16 v21, 0x40000000    # 2.0f

    mul-float v21, v21, v15

    sub-float v21, v14, v21

    add-float v21, v21, v16

    mul-float v21, v21, v12

    const/high16 v22, 0x40000000    # 2.0f

    mul-float v22, v22, v15

    const/high16 v23, 0x40000000    # 2.0f

    mul-float v23, v23, v14

    sub-float v22, v22, v23

    mul-float v22, v22, v11

    add-float v21, v21, v22

    add-float v13, v21, v14

    .line 187
    .local v13, "x":F
    const/high16 v21, 0x40000000    # 2.0f

    mul-float v21, v21, v19

    sub-float v21, v18, v21

    add-float v21, v21, v20

    mul-float v21, v21, v12

    const/high16 v22, 0x40000000    # 2.0f

    mul-float v22, v22, v19

    const/high16 v23, 0x40000000    # 2.0f

    mul-float v23, v23, v18

    sub-float v22, v22, v23

    mul-float v22, v22, v11

    add-float v21, v21, v22

    add-float v17, v21, v18

    .line 189
    .local v17, "y":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->lastDrawnPointX:F

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->lastDrawnPointY:F

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v17

    invoke-direct {v0, v1, v2, v13, v3}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->distance(FFFF)F

    move-result v5

    .line 190
    .local v5, "distance":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->distanceSinceLastDrawnPoint:F

    move/from16 v21, v0

    add-float v21, v21, v5

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->distanceSinceLastDrawnPoint:F

    .line 192
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->distanceSinceLastDrawnPoint:F

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->textureBrush:Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/vk/attachpicker/drawing/brushes/Brush;->drawPeriod()F

    move-result v22

    cmpl-float v21, v21, v22

    if-lez v21, :cond_1

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->textureBrush:Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-virtual {v0, v1, v13, v2}, Lcom/vk/attachpicker/drawing/brushes/Brush;->draw(Landroid/graphics/Canvas;FF)V

    .line 194
    const/16 v21, 0x0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->distanceSinceLastDrawnPoint:F

    .line 196
    :cond_1
    move-object/from16 v0, p0

    iput v13, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->lastDrawnPointX:F

    .line 197
    move-object/from16 v0, p0

    iput v13, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->lastDrawnPointY:F

    .line 183
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_2

    .line 166
    .end local v5    # "distance":F
    .end local v11    # "t":F
    .end local v12    # "t2":F
    .end local v13    # "x":F
    .end local v17    # "y":F
    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 201
    .end local v4    # "count":I
    .end local v7    # "i":I
    .end local v9    # "length":F
    .end local v14    # "x0":F
    .end local v15    # "x1":F
    .end local v16    # "x2":F
    .end local v18    # "y0":F
    .end local v19    # "y1":F
    .end local v20    # "y2":F
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawingPath:Lcom/vk/attachpicker/drawing/DrawingPath;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/vk/attachpicker/drawing/DrawingPath;->size()I

    move-result v21

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->pointsProcessed:I

    goto/16 :goto_0
.end method

.method public getBrush()Lcom/vk/attachpicker/drawing/brushes/Brush;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->textureBrush:Lcom/vk/attachpicker/drawing/brushes/Brush;

    return-object v0
.end method
