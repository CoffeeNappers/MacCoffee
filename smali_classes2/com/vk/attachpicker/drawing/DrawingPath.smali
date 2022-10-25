.class public Lcom/vk/attachpicker/drawing/DrawingPath;
.super Ljava/lang/Object;
.source "DrawingPath.java"


# static fields
.field private static final MINOR_MOVE:I


# instance fields
.field private final cachedPath:Landroid/graphics/Path;

.field private isClosed:Z

.field private isMinorDelta:Z

.field private pathIsClosed:Z

.field private final pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

.field private final pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/attachpicker/drawing/DrawingPath;->MINOR_MOVE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/16 v2, 0x6e

    const/4 v1, 0x0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-direct {v0, v2}, Lcom/vk/attachpicker/util/DynamicFloatArray;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    .line 14
    new-instance v0, Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-direct {v0, v2}, Lcom/vk/attachpicker/util/DynamicFloatArray;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    .line 16
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->isMinorDelta:Z

    .line 17
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->cachedPath:Landroid/graphics/Path;

    .line 18
    iput-boolean v1, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathIsClosed:Z

    .line 19
    iput-boolean v1, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->isClosed:Z

    .line 23
    return-void
.end method

.method private static fillPath(Landroid/graphics/Path;Lcom/vk/attachpicker/util/DynamicFloatArray;Lcom/vk/attachpicker/util/DynamicFloatArray;ZZ)V
    .locals 18
    .param p0, "path"    # Landroid/graphics/Path;
    .param p1, "pathX"    # Lcom/vk/attachpicker/util/DynamicFloatArray;
    .param p2, "pathY"    # Lcom/vk/attachpicker/util/DynamicFloatArray;
    .param p3, "shouldEnd"    # Z
    .param p4, "isMinorDelta"    # Z

    .prologue
    .line 104
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Path;->rewind()V

    .line 105
    invoke-virtual/range {p1 .. p1}, Lcom/vk/attachpicker/util/DynamicFloatArray;->size()I

    move-result v9

    if-nez v9, :cond_1

    .line 141
    :cond_0
    :goto_0
    return-void

    .line 109
    :cond_1
    const/4 v9, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v2

    .line 110
    .local v2, "beginPointX":F
    const/4 v9, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v3

    .line 112
    .local v3, "beginPointY":F
    if-eqz p4, :cond_2

    .line 113
    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 114
    const/high16 v9, 0x3f800000    # 1.0f

    add-float/2addr v9, v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v3}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_0

    .line 116
    :cond_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 117
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/vk/attachpicker/util/DynamicFloatArray;->size()I

    move-result v9

    if-ge v6, v9, :cond_0

    .line 118
    add-int/lit8 v9, v6, -0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v7

    .line 119
    .local v7, "prePointX":F
    add-int/lit8 v9, v6, -0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v8

    .line 120
    .local v8, "prePointY":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v4

    .line 121
    .local v4, "currentPointX":F
    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v5

    .line 123
    .local v5, "currentPointY":F
    sub-float v9, v4, v7

    float-to-double v12, v9

    const-wide/high16 v14, 0x4000000000000000L    # 2.0

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v12

    sub-float v9, v5, v8

    float-to-double v14, v9

    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    invoke-static/range {v14 .. v17}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v14

    add-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    .line 125
    .local v10, "s":D
    const-wide/high16 v12, 0x4000000000000000L    # 2.0

    cmpg-double v9, v10, v12

    if-gez v9, :cond_4

    .line 126
    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 133
    :goto_2
    if-eqz p3, :cond_3

    .line 134
    invoke-virtual/range {p1 .. p1}, Lcom/vk/attachpicker/util/DynamicFloatArray;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    if-ne v6, v9, :cond_3

    .line 135
    add-float v9, v7, v4

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v9, v12

    add-float v12, v8, v5

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v12, v4, v5}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 117
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 129
    :cond_4
    add-float v9, v7, v4

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v9, v12

    add-float v12, v8, v5

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v8, v9, v12}, Landroid/graphics/Path;->quadTo(FFFF)V

    goto :goto_2
.end method


# virtual methods
.method public add(FF)V
    .locals 8
    .param p1, "newX"    # F
    .param p2, "newY"    # F

    .prologue
    const/4 v7, 0x0

    .line 66
    iget-boolean v5, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->isClosed:Z

    if-eqz v5, :cond_1

    .line 85
    :cond_0
    :goto_0
    return-void

    .line 69
    :cond_1
    iget-object v5, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v5, p1}, Lcom/vk/attachpicker/util/DynamicFloatArray;->add(F)Z

    .line 70
    iget-object v5, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v5, p2}, Lcom/vk/attachpicker/util/DynamicFloatArray;->add(F)Z

    .line 72
    iget-boolean v5, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->isMinorDelta:Z

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v5}, Lcom/vk/attachpicker/util/DynamicFloatArray;->size()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_0

    .line 73
    iget-object v5, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v5, v7}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v0

    .line 74
    .local v0, "beginX":F
    iget-object v5, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v5, v7}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v1

    .line 76
    .local v1, "beginY":F
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_1
    iget-object v5, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v5}, Lcom/vk/attachpicker/util/DynamicFloatArray;->size()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 77
    iget-object v5, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v5, v2}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v3

    .line 78
    .local v3, "x":F
    iget-object v5, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v5, v2}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v4

    .line 79
    .local v4, "y":F
    sub-float v5, v0, v3

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    sget v6, Lcom/vk/attachpicker/drawing/DrawingPath;->MINOR_MOVE:I

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-gtz v5, :cond_2

    sub-float v5, v1, v4

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    sget v6, Lcom/vk/attachpicker/drawing/DrawingPath;->MINOR_MOVE:I

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_3

    .line 80
    :cond_2
    iput-boolean v7, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->isMinorDelta:Z

    goto :goto_0

    .line 76
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public close()V
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->isClosed:Z

    .line 89
    return-void
.end method

.method public copy()Lcom/vk/attachpicker/drawing/DrawingPath;
    .locals 3

    .prologue
    .line 26
    new-instance v0, Lcom/vk/attachpicker/drawing/DrawingPath;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/DrawingPath;-><init>()V

    .line 27
    .local v0, "dp":Lcom/vk/attachpicker/drawing/DrawingPath;
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    iget-object v2, v0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/util/DynamicFloatArray;->copyTo(Lcom/vk/attachpicker/util/DynamicFloatArray;)V

    .line 28
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    iget-object v2, v0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/util/DynamicFloatArray;->copyTo(Lcom/vk/attachpicker/util/DynamicFloatArray;)V

    .line 29
    iget-boolean v1, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->isMinorDelta:Z

    iput-boolean v1, v0, Lcom/vk/attachpicker/drawing/DrawingPath;->isMinorDelta:Z

    .line 30
    iget-object v1, v0, Lcom/vk/attachpicker/drawing/DrawingPath;->cachedPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->cachedPath:Landroid/graphics/Path;

    invoke-virtual {v1, v2}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 31
    iget-boolean v1, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathIsClosed:Z

    iput-boolean v1, v0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathIsClosed:Z

    .line 32
    iget-boolean v1, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->isClosed:Z

    iput-boolean v1, v0, Lcom/vk/attachpicker/drawing/DrawingPath;->isClosed:Z

    .line 33
    return-object v0
.end method

.method public getPath()Landroid/graphics/Path;
    .locals 5

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathIsClosed:Z

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->cachedPath:Landroid/graphics/Path;

    .line 99
    :goto_0
    return-object v0

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->cachedPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    const/4 v3, 0x0

    iget-boolean v4, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->isMinorDelta:Z

    invoke-static {v0, v1, v2, v3, v4}, Lcom/vk/attachpicker/drawing/DrawingPath;->fillPath(Landroid/graphics/Path;Lcom/vk/attachpicker/util/DynamicFloatArray;Lcom/vk/attachpicker/util/DynamicFloatArray;ZZ)V

    .line 96
    iget-boolean v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->isClosed:Z

    if-eqz v0, :cond_1

    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathIsClosed:Z

    .line 99
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->cachedPath:Landroid/graphics/Path;

    goto :goto_0
.end method

.method public getX(I)F
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v0

    return v0
.end method

.method public getY(I)F
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v0

    return v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/DynamicFloatArray;->size()I

    move-result v0

    return v0
.end method

.method public transform(Landroid/graphics/Matrix;)V
    .locals 5
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 37
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v2}, Lcom/vk/attachpicker/util/DynamicFloatArray;->size()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    new-array v1, v2, [F

    .line 38
    .local v1, "temp":[F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 39
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    div-int/lit8 v3, v0, 0x2

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v2

    aput v2, v1, v0

    .line 40
    add-int/lit8 v2, v0, 0x1

    iget-object v3, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    div-int/lit8 v4, v0, 0x2

    invoke-virtual {v3, v4}, Lcom/vk/attachpicker/util/DynamicFloatArray;->get(I)F

    move-result v3

    aput v3, v1, v2

    .line 38
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p1, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 43
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v2}, Lcom/vk/attachpicker/util/DynamicFloatArray;->clear()V

    .line 44
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    invoke-virtual {v2}, Lcom/vk/attachpicker/util/DynamicFloatArray;->clear()V

    .line 45
    const/4 v0, 0x0

    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 46
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathX:Lcom/vk/attachpicker/util/DynamicFloatArray;

    aget v3, v1, v0

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/util/DynamicFloatArray;->add(F)Z

    .line 47
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathY:Lcom/vk/attachpicker/util/DynamicFloatArray;

    add-int/lit8 v3, v0, 0x1

    aget v3, v1, v3

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/util/DynamicFloatArray;->add(F)Z

    .line 45
    add-int/lit8 v0, v0, 0x2

    goto :goto_1

    .line 50
    :cond_1
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/vk/attachpicker/drawing/DrawingPath;->pathIsClosed:Z

    .line 51
    return-void
.end method
