.class public Lcom/vk/attachpicker/drawing/DrawingCanvas;
.super Ljava/lang/Object;
.source "DrawingCanvas.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;
    }
.end annotation


# static fields
.field private static final STUB_PAINT:Landroid/graphics/Paint;


# instance fields
.field private drawingBitmap:Landroid/graphics/Bitmap;

.field private drawingCanvas:Landroid/graphics/Canvas;

.field private drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

.field private final height:I

.field private sessionDrawingBitmap:Landroid/graphics/Bitmap;

.field private sessionDrawingCanvas:Landroid/graphics/Canvas;

.field private final width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->STUB_PAINT:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput p1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->width:I

    .line 28
    iput p2, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->height:I

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->initDrawingBitmapIfNeeded(II)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "drawingBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->width:I

    .line 34
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->height:I

    .line 35
    iput-object p1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingBitmap:Landroid/graphics/Bitmap;

    .line 36
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingCanvas:Landroid/graphics/Canvas;

    .line 37
    return-void
.end method

.method private static checkBitmapValid(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;II)Z
    .locals 1
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 229
    invoke-static {p0, p1}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->checkCanvasExists(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 230
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    if-ne v0, p2, :cond_0

    .line 231
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-ne v0, p3, :cond_0

    .line 232
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    if-ne v0, p2, :cond_0

    .line 233
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    if-ne v0, p3, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static checkCanvasExists(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;)Z
    .locals 1
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 225
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private initDrawingBitmapIfNeeded(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 211
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingCanvas:Landroid/graphics/Canvas;

    invoke-static {v0, v1, p1, p2}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->checkBitmapValid(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 212
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingBitmap:Landroid/graphics/Bitmap;

    .line 213
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingCanvas:Landroid/graphics/Canvas;

    .line 215
    :cond_0
    return-void
.end method

.method private initSessionBitmapIfNeeded(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 218
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingCanvas:Landroid/graphics/Canvas;

    invoke-static {v0, v1, p1, p2}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->checkBitmapValid(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 219
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingBitmap:Landroid/graphics/Bitmap;

    .line 220
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingCanvas:Landroid/graphics/Canvas;

    .line 222
    :cond_0
    return-void
.end method


# virtual methods
.method public clearDrawCache()V
    .locals 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 49
    return-void
.end method

.method public destroyDrawingSession()V
    .locals 2

    .prologue
    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    .line 102
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 105
    :cond_0
    return-void
.end method

.method public draw(Lcom/vk/attachpicker/drawing/DrawingState;)V
    .locals 6
    .param p1, "state"    # Lcom/vk/attachpicker/drawing/DrawingState;

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->destroyDrawingSession()V

    .line 54
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/vk/attachpicker/drawing/DrawingState;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 55
    invoke-virtual {p1, v1}, Lcom/vk/attachpicker/drawing/DrawingState;->getBrushAt(I)Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v0

    .line 56
    .local v0, "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    invoke-virtual {p1, v1}, Lcom/vk/attachpicker/drawing/DrawingState;->getPathAt(I)Lcom/vk/attachpicker/drawing/DrawingPath;

    move-result-object v2

    .line 58
    .local v2, "path":Lcom/vk/attachpicker/drawing/DrawingPath;
    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->shouldBeDrawnInSessionDrawingLayer()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 59
    invoke-virtual {p0, v0, v2}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->startDrawingSession(Lcom/vk/attachpicker/drawing/brushes/Brush;Lcom/vk/attachpicker/drawing/DrawingPath;)V

    .line 60
    iget v3, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->width:I

    iget v4, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->height:I

    invoke-direct {p0, v3, v4}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->initSessionBitmapIfNeeded(II)V

    .line 61
    iget-object v3, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    iget-object v4, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingCanvas:Landroid/graphics/Canvas;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawUnprocessedPoints(Landroid/graphics/Canvas;Z)V

    .line 62
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->saveDrawingSession()V

    .line 54
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 65
    :cond_0
    iget-object v3, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2}, Lcom/vk/attachpicker/drawing/DrawingPath;->getPath()Landroid/graphics/Path;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/vk/attachpicker/drawing/brushes/Brush;->draw(Landroid/graphics/Canvas;Landroid/graphics/Path;)V

    goto :goto_1

    .line 68
    .end local v0    # "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    .end local v2    # "path":Lcom/vk/attachpicker/drawing/DrawingPath;
    :cond_1
    return-void
.end method

.method public drawOnCanvas(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, 0x0

    .line 109
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->getBrush()Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->shouldBeDrawnInDrawingLayer()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->draw(Landroid/graphics/Canvas;)V

    .line 114
    :cond_0
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->STUB_PAINT:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 115
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/vk/attachpicker/drawing/DrawingCanvas;->STUB_PAINT:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 117
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    .line 118
    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->getBrush()Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->shouldBeDrawnInSessionDrawingLayer()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    .line 121
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->STUB_PAINT:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->getBrush()Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/brushes/Brush;->getAlpha()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 122
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/vk/attachpicker/drawing/DrawingCanvas;->STUB_PAINT:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 127
    :cond_1
    :goto_0
    return-void

    .line 124
    :cond_2
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->getBrush()Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->shouldBeDrawnInDrawingLayer()Z

    move-result v0

    if-nez v0, :cond_1

    .line 125
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->height:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 40
    iget v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->width:I

    return v0
.end method

.method public processPoints()V
    .locals 3

    .prologue
    .line 77
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    if-nez v0, :cond_1

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 80
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->getBrush()Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->shouldBeDrawnInSessionDrawingLayer()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iget v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->width:I

    iget v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->height:I

    invoke-direct {p0, v0, v1}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->initSessionBitmapIfNeeded(II)V

    .line 82
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingCanvas:Landroid/graphics/Canvas;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawUnprocessedPoints(Landroid/graphics/Canvas;Z)V

    goto :goto_0
.end method

.method public saveDrawingSession()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 87
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    if-nez v0, :cond_0

    .line 98
    :goto_0
    return-void

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->getBrush()Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/brushes/Brush;->shouldBeDrawnInSessionDrawingLayer()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 91
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingCanvas:Landroid/graphics/Canvas;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->drawUnprocessedPoints(Landroid/graphics/Canvas;Z)V

    .line 92
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->STUB_PAINT:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->getBrush()Lcom/vk/attachpicker/drawing/brushes/Brush;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/brushes/Brush;->getAlpha()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 93
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingCanvas:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->sessionDrawingBitmap:Landroid/graphics/Bitmap;

    sget-object v2, Lcom/vk/attachpicker/drawing/DrawingCanvas;->STUB_PAINT:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 97
    :goto_1
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->destroyDrawingSession()V

    goto :goto_0

    .line 95
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;->draw(Landroid/graphics/Canvas;)V

    goto :goto_1
.end method

.method public startDrawingSession(Lcom/vk/attachpicker/drawing/brushes/Brush;Lcom/vk/attachpicker/drawing/DrawingPath;)V
    .locals 1
    .param p1, "brush"    # Lcom/vk/attachpicker/drawing/brushes/Brush;
    .param p2, "drawingPath"    # Lcom/vk/attachpicker/drawing/DrawingPath;

    .prologue
    .line 71
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->destroyDrawingSession()V

    .line 72
    new-instance v0, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    invoke-direct {v0, p1, p2}, Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;-><init>(Lcom/vk/attachpicker/drawing/brushes/Brush;Lcom/vk/attachpicker/drawing/DrawingPath;)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawingSession:Lcom/vk/attachpicker/drawing/DrawingCanvas$DrawingSession;

    .line 73
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->processPoints()V

    .line 74
    return-void
.end method
