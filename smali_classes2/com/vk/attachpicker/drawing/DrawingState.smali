.class public Lcom/vk/attachpicker/drawing/DrawingState;
.super Ljava/lang/Object;
.source "DrawingState.java"


# static fields
.field public static final WIDTH:[F


# instance fields
.field private final backupBrushList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/drawing/brushes/Brush;",
            ">;"
        }
    .end annotation
.end field

.field private final backupPathList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/drawing/DrawingPath;",
            ">;"
        }
    .end annotation
.end field

.field private final brushList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/drawing/brushes/Brush;",
            ">;"
        }
    .end annotation
.end field

.field private canvasHeight:F

.field private canvasWidth:F

.field private final pathList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/drawing/DrawingPath;",
            ">;"
        }
    .end annotation
.end field

.field private final tmpMatrix:Landroid/graphics/Matrix;

.field private final transformMatrix:Landroid/graphics/Matrix;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x5

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
        0x40200000    # 2.5f
        0x40400000    # 3.0f
        0x40800000    # 4.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->transformMatrix:Landroid/graphics/Matrix;

    .line 24
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->tmpMatrix:Landroid/graphics/Matrix;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->backupPathList:Ljava/util/ArrayList;

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->backupBrushList:Ljava/util/ArrayList;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    return-void
.end method

.method private applyScale(F)V
    .locals 3
    .param p1, "scale"    # F

    .prologue
    .line 183
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/brushes/Brush;

    .line 184
    .local v0, "p":Lcom/vk/attachpicker/drawing/brushes/Brush;
    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->getSize()F

    move-result v2

    mul-float/2addr v2, p1

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/drawing/brushes/Brush;->setSize(F)V

    goto :goto_0

    .line 186
    .end local v0    # "p":Lcom/vk/attachpicker/drawing/brushes/Brush;
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->backupBrushList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/brushes/Brush;

    .line 187
    .restart local v0    # "p":Lcom/vk/attachpicker/drawing/brushes/Brush;
    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->getSize()F

    move-result v2

    mul-float/2addr v2, p1

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/drawing/brushes/Brush;->setSize(F)V

    goto :goto_1

    .line 189
    .end local v0    # "p":Lcom/vk/attachpicker/drawing/brushes/Brush;
    :cond_1
    return-void
.end method

.method private applyTransformMatrix(Landroid/graphics/Matrix;)V
    .locals 3
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 174
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/DrawingPath;

    .line 175
    .local v0, "p":Lcom/vk/attachpicker/drawing/DrawingPath;
    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingPath;->transform(Landroid/graphics/Matrix;)V

    goto :goto_0

    .line 177
    .end local v0    # "p":Lcom/vk/attachpicker/drawing/DrawingPath;
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->backupPathList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/DrawingPath;

    .line 178
    .restart local v0    # "p":Lcom/vk/attachpicker/drawing/DrawingPath;
    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingPath;->transform(Landroid/graphics/Matrix;)V

    goto :goto_1

    .line 180
    .end local v0    # "p":Lcom/vk/attachpicker/drawing/DrawingPath;
    :cond_1
    return-void
.end method

.method public static findIntIndex(F)I
    .locals 2
    .param p0, "w"    # F

    .prologue
    .line 15
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 16
    sget-object v1, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    aget v1, v1, v0

    cmpl-float v1, v1, p0

    if-nez v1, :cond_0

    .line 20
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 15
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 20
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method


# virtual methods
.method public addElement(Lcom/vk/attachpicker/drawing/DrawingPath;Lcom/vk/attachpicker/drawing/brushes/Brush;)V
    .locals 1
    .param p1, "path"    # Lcom/vk/attachpicker/drawing/DrawingPath;
    .param p2, "paint"    # Lcom/vk/attachpicker/drawing/brushes/Brush;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 147
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 148
    return-void
.end method

.method public copy()Lcom/vk/attachpicker/drawing/DrawingState;
    .locals 5

    .prologue
    .line 54
    new-instance v0, Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/DrawingState;-><init>()V

    .line 56
    .local v0, "drawingState":Lcom/vk/attachpicker/drawing/DrawingState;
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/drawing/DrawingPath;

    .line 57
    .local v1, "p":Lcom/vk/attachpicker/drawing/DrawingPath;
    iget-object v3, v0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingPath;->copy()Lcom/vk/attachpicker/drawing/DrawingPath;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 60
    .end local v1    # "p":Lcom/vk/attachpicker/drawing/DrawingPath;
    :cond_0
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/drawing/brushes/Brush;

    .line 61
    .local v1, "p":Lcom/vk/attachpicker/drawing/brushes/Brush;
    iget-object v3, v0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/brushes/Brush;->copy()Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 64
    .end local v1    # "p":Lcom/vk/attachpicker/drawing/brushes/Brush;
    :cond_1
    iget v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasWidth:F

    iput v2, v0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasWidth:F

    .line 65
    iget v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasHeight:F

    iput v2, v0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasHeight:F

    .line 67
    return-object v0
.end method

.method public getBrushAt(I)Lcom/vk/attachpicker/drawing/brushes/Brush;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p1, :cond_0

    .line 110
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/brushes/Brush;

    .line 112
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCanvasHeight()F
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasHeight:F

    return v0
.end method

.method public getCanvasWidth()F
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasWidth:F

    return v0
.end method

.method public getLastPath()Lcom/vk/attachpicker/drawing/DrawingPath;
    .locals 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/DrawingPath;

    .line 120
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getMaxBrushWidth()F
    .locals 4

    .prologue
    .line 36
    const/4 v1, 0x0

    .line 37
    .local v1, "maxWidth":F
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/brushes/Brush;

    .line 38
    .local v0, "b":Lcom/vk/attachpicker/drawing/brushes/Brush;
    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->getMaxDimension()F

    move-result v3

    cmpl-float v3, v3, v1

    if-lez v3, :cond_0

    .line 39
    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->getMaxDimension()F

    move-result v1

    goto :goto_0

    .line 42
    .end local v0    # "b":Lcom/vk/attachpicker/drawing/brushes/Brush;
    :cond_1
    return v1
.end method

.method public getMergedPath()Landroid/graphics/Path;
    .locals 3

    .prologue
    .line 138
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 139
    .local v1, "path":Landroid/graphics/Path;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 140
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/attachpicker/drawing/DrawingPath;

    invoke-virtual {v2}, Lcom/vk/attachpicker/drawing/DrawingPath;->getPath()Landroid/graphics/Path;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 139
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 142
    :cond_0
    return-object v1
.end method

.method public getPathAt(I)Lcom/vk/attachpicker/drawing/DrawingPath;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 101
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p1, :cond_0

    .line 102
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/DrawingPath;

    .line 104
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public handleCropChange(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)V
    .locals 2
    .param p1, "before"    # Landroid/graphics/Matrix;
    .param p2, "after"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v1, 0x0

    .line 164
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 165
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 166
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/drawing/DrawingState;->applyTransformMatrix(Landroid/graphics/Matrix;)V

    .line 169
    iput v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasWidth:F

    .line 170
    iput v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasHeight:F

    .line 171
    return-void
.end method

.method public handleSizeChange(FF)V
    .locals 4
    .param p1, "width"    # F
    .param p2, "height"    # F

    .prologue
    const/4 v3, 0x0

    .line 192
    iget v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasWidth:F

    cmpl-float v1, v1, v3

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasHeight:F

    cmpl-float v1, v1, v3

    if-eqz v1, :cond_0

    cmpl-float v1, p1, v3

    if-eqz v1, :cond_0

    cmpl-float v1, p2, v3

    if-eqz v1, :cond_0

    .line 193
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->transformMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 194
    iget v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasWidth:F

    div-float v1, p1, v1

    iget v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasHeight:F

    div-float v2, p2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 195
    .local v0, "scale":F
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->transformMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0, v0, v3, v3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 197
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->transformMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/drawing/DrawingState;->applyTransformMatrix(Landroid/graphics/Matrix;)V

    .line 198
    invoke-direct {p0, v0}, Lcom/vk/attachpicker/drawing/DrawingState;->applyScale(F)V

    .line 201
    .end local v0    # "scale":F
    :cond_0
    iput p1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasWidth:F

    .line 202
    iput p2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->canvasHeight:F

    .line 203
    return-void
.end method

.method public postScale(FFF)V
    .locals 1
    .param p1, "scale"    # F
    .param p2, "focalX"    # F
    .param p3, "focalY"    # F

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 158
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 159
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/drawing/DrawingState;->applyTransformMatrix(Landroid/graphics/Matrix;)V

    .line 160
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/drawing/DrawingState;->applyScale(F)V

    .line 161
    return-void
.end method

.method public postTranslate(FF)V
    .locals 1
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 152
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 153
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->tmpMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/drawing/DrawingState;->applyTransformMatrix(Landroid/graphics/Matrix;)V

    .line 154
    return-void
.end method

.method public removeLastElement()V
    .locals 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 129
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 131
    :cond_1
    return-void
.end method

.method public restore()V
    .locals 4

    .prologue
    .line 83
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 84
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->backupPathList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/DrawingPath;

    .line 85
    .local v0, "p":Lcom/vk/attachpicker/drawing/DrawingPath;
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingPath;->copy()Lcom/vk/attachpicker/drawing/DrawingPath;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 88
    .end local v0    # "p":Lcom/vk/attachpicker/drawing/DrawingPath;
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 89
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->backupBrushList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/brushes/Brush;

    .line 90
    .local v0, "p":Lcom/vk/attachpicker/drawing/brushes/Brush;
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->copy()Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 93
    .end local v0    # "p":Lcom/vk/attachpicker/drawing/brushes/Brush;
    :cond_1
    return-void
.end method

.method public save()V
    .locals 4

    .prologue
    .line 71
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->backupPathList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 72
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/DrawingPath;

    .line 73
    .local v0, "p":Lcom/vk/attachpicker/drawing/DrawingPath;
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->backupPathList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingPath;->copy()Lcom/vk/attachpicker/drawing/DrawingPath;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 76
    .end local v0    # "p":Lcom/vk/attachpicker/drawing/DrawingPath;
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->backupBrushList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 77
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingState;->brushList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/brushes/Brush;

    .line 78
    .local v0, "p":Lcom/vk/attachpicker/drawing/brushes/Brush;
    iget-object v2, p0, Lcom/vk/attachpicker/drawing/DrawingState;->backupBrushList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->copy()Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 80
    .end local v0    # "p":Lcom/vk/attachpicker/drawing/brushes/Brush;
    :cond_1
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingState;->pathList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
