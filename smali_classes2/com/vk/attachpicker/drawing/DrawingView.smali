.class public Lcom/vk/attachpicker/drawing/DrawingView;
.super Landroid/view/View;
.source "DrawingView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;
    }
.end annotation


# static fields
.field private static final TOUCH_OFFSET:I


# instance fields
.field private brushType:I

.field private color:I

.field private drawingCanvas:Lcom/vk/attachpicker/drawing/DrawingCanvas;

.field private final drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

.field private fixTouchPosition:Z

.field private isDown:Z

.field private onMotionEventListener:Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;

.field private touchEnabled:Z

.field private widthMultiplier:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/attachpicker/drawing/DrawingView;->TOUCH_OFFSET:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 36
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 21
    new-instance v0, Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/DrawingState;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    .line 24
    iput-boolean v1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->touchEnabled:Z

    .line 26
    iput-boolean v2, p0, Lcom/vk/attachpicker/drawing/DrawingView;->fixTouchPosition:Z

    .line 31
    iput v2, p0, Lcom/vk/attachpicker/drawing/DrawingView;->brushType:I

    .line 32
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    aget v0, v0, v1

    iput v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->color:I

    .line 33
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    iput v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->widthMultiplier:F

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 40
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    new-instance v0, Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/DrawingState;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    .line 24
    iput-boolean v1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->touchEnabled:Z

    .line 26
    iput-boolean v2, p0, Lcom/vk/attachpicker/drawing/DrawingView;->fixTouchPosition:Z

    .line 31
    iput v2, p0, Lcom/vk/attachpicker/drawing/DrawingView;->brushType:I

    .line 32
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    aget v0, v0, v1

    iput v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->color:I

    .line 33
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    iput v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->widthMultiplier:F

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    new-instance v0, Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/DrawingState;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    .line 24
    iput-boolean v1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->touchEnabled:Z

    .line 26
    iput-boolean v2, p0, Lcom/vk/attachpicker/drawing/DrawingView;->fixTouchPosition:Z

    .line 31
    iput v2, p0, Lcom/vk/attachpicker/drawing/DrawingView;->brushType:I

    .line 32
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    aget v0, v0, v1

    iput v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->color:I

    .line 33
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    iput v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->widthMultiplier:F

    .line 45
    return-void
.end method

.method private endCurrentPath()V
    .locals 2

    .prologue
    .line 72
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingState;->getLastPath()Lcom/vk/attachpicker/drawing/DrawingPath;

    move-result-object v0

    .line 73
    .local v0, "path":Lcom/vk/attachpicker/drawing/DrawingPath;
    if-eqz v0, :cond_0

    .line 74
    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingPath;->close()V

    .line 76
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingCanvas:Lcom/vk/attachpicker/drawing/DrawingCanvas;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->saveDrawingSession()V

    .line 77
    return-void
.end method

.method private invalidateBitmap()V
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingCanvas:Lcom/vk/attachpicker/drawing/DrawingCanvas;

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingCanvas:Lcom/vk/attachpicker/drawing/DrawingCanvas;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->clearDrawCache()V

    .line 118
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingCanvas:Lcom/vk/attachpicker/drawing/DrawingCanvas;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->draw(Lcom/vk/attachpicker/drawing/DrawingState;)V

    .line 120
    :cond_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/DrawingView;->invalidate()V

    .line 121
    return-void
.end method

.method private onActionDown(Landroid/view/MotionEvent;)V
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->startNewPath(Landroid/view/MotionEvent;)V

    .line 81
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->isDown:Z

    .line 83
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->onMotionEventListener:Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->onMotionEventListener:Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;

    invoke-interface {v0}, Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;->onDown()V

    .line 86
    :cond_0
    return-void
.end method

.method private onActionMove(Landroid/view/MotionEvent;)V
    .locals 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 89
    iget-boolean v3, p0, Lcom/vk/attachpicker/drawing/DrawingView;->isDown:Z

    if-nez v3, :cond_0

    .line 102
    :goto_0
    return-void

    .line 93
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 94
    .local v0, "newX":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 96
    .local v1, "newY":F
    iget-object v3, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v3}, Lcom/vk/attachpicker/drawing/DrawingState;->getLastPath()Lcom/vk/attachpicker/drawing/DrawingPath;

    move-result-object v2

    .line 97
    .local v2, "path":Lcom/vk/attachpicker/drawing/DrawingPath;
    if-eqz v2, :cond_1

    .line 98
    invoke-virtual {v2, v0, v1}, Lcom/vk/attachpicker/drawing/DrawingPath;->add(FF)V

    .line 100
    :cond_1
    iget-object v3, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingCanvas:Lcom/vk/attachpicker/drawing/DrawingCanvas;

    invoke-virtual {v3}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->processPoints()V

    goto :goto_0
.end method

.method private onActionUp(Landroid/view/MotionEvent;)V
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 105
    iget-boolean v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->isDown:Z

    if-eqz v0, :cond_0

    .line 106
    invoke-direct {p0}, Lcom/vk/attachpicker/drawing/DrawingView;->endCurrentPath()V

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->isDown:Z

    .line 109
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->onMotionEventListener:Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->onMotionEventListener:Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;

    invoke-interface {v0}, Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;->onUp()V

    .line 113
    :cond_0
    return-void
.end method

.method private startNewPath(Landroid/view/MotionEvent;)V
    .locals 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 49
    iget v4, p0, Lcom/vk/attachpicker/drawing/DrawingView;->brushType:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 50
    new-instance v0, Lcom/vk/attachpicker/drawing/brushes/PenBrush;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/brushes/PenBrush;-><init>()V

    .line 60
    .local v0, "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    :goto_0
    iget v4, p0, Lcom/vk/attachpicker/drawing/DrawingView;->widthMultiplier:F

    invoke-virtual {v0, v4}, Lcom/vk/attachpicker/drawing/brushes/Brush;->setSize(F)V

    .line 61
    iget v4, p0, Lcom/vk/attachpicker/drawing/DrawingView;->color:I

    invoke-virtual {v0, v4}, Lcom/vk/attachpicker/drawing/brushes/Brush;->setColor(I)V

    .line 63
    new-instance v3, Lcom/vk/attachpicker/drawing/DrawingPath;

    invoke-direct {v3}, Lcom/vk/attachpicker/drawing/DrawingPath;-><init>()V

    .line 64
    .local v3, "path":Lcom/vk/attachpicker/drawing/DrawingPath;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 65
    .local v1, "newX":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 66
    .local v2, "newY":F
    invoke-virtual {v3, v1, v2}, Lcom/vk/attachpicker/drawing/DrawingPath;->add(FF)V

    .line 67
    iget-object v4, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v4, v3, v0}, Lcom/vk/attachpicker/drawing/DrawingState;->addElement(Lcom/vk/attachpicker/drawing/DrawingPath;Lcom/vk/attachpicker/drawing/brushes/Brush;)V

    .line 68
    iget-object v4, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingCanvas:Lcom/vk/attachpicker/drawing/DrawingCanvas;

    invoke-virtual {v4, v0, v3}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->startDrawingSession(Lcom/vk/attachpicker/drawing/brushes/Brush;Lcom/vk/attachpicker/drawing/DrawingPath;)V

    .line 69
    return-void

    .line 51
    .end local v0    # "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    .end local v1    # "newX":F
    .end local v2    # "newY":F
    .end local v3    # "path":Lcom/vk/attachpicker/drawing/DrawingPath;
    :cond_0
    iget v4, p0, Lcom/vk/attachpicker/drawing/DrawingView;->brushType:I

    if-nez v4, :cond_1

    .line 52
    new-instance v0, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/brushes/EraserBrush;-><init>()V

    .restart local v0    # "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    goto :goto_0

    .line 53
    .end local v0    # "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    :cond_1
    iget v4, p0, Lcom/vk/attachpicker/drawing/DrawingView;->brushType:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_2

    .line 54
    new-instance v0, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/brushes/MarkerBrush;-><init>()V

    .restart local v0    # "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    goto :goto_0

    .line 55
    .end local v0    # "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    :cond_2
    iget v4, p0, Lcom/vk/attachpicker/drawing/DrawingView;->brushType:I

    const/4 v5, 0x3

    if-ne v4, v5, :cond_3

    .line 56
    new-instance v0, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;

    invoke-direct {v0}, Lcom/vk/attachpicker/drawing/brushes/NeonBrush;-><init>()V

    .restart local v0    # "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    goto :goto_0

    .line 58
    .end local v0    # "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    :cond_3
    const/4 v0, 0x0

    .restart local v0    # "brush":Lcom/vk/attachpicker/drawing/brushes/Brush;
    goto :goto_0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingState;->clear()V

    .line 220
    invoke-direct {p0}, Lcom/vk/attachpicker/drawing/DrawingView;->invalidateBitmap()V

    .line 221
    return-void
.end method

.method public getBrushType()I
    .locals 1

    .prologue
    .line 228
    iget v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->brushType:I

    return v0
.end method

.method public getColor()I
    .locals 1

    .prologue
    .line 236
    iget v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->color:I

    return v0
.end method

.method public getDrawingStateCopy()Lcom/vk/attachpicker/drawing/DrawingState;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingState;->copy()Lcom/vk/attachpicker/drawing/DrawingState;

    move-result-object v0

    return-object v0
.end method

.method public getHistorySize()I
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingState;->size()I

    move-result v0

    return v0
.end method

.method public getWidthMultiplier()F
    .locals 1

    .prologue
    .line 244
    iget v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->widthMultiplier:F

    return v0
.end method

.method public handleCrop(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)V
    .locals 1
    .param p1, "before"    # Landroid/graphics/Matrix;
    .param p2, "after"    # Landroid/graphics/Matrix;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v0, p1, p2}, Lcom/vk/attachpicker/drawing/DrawingState;->handleCropChange(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)V

    .line 147
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/DrawingView;->invalidate()V

    .line 148
    return-void
.end method

.method public handleSizeChange(II)V
    .locals 3
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    int-to-float v1, p1

    int-to-float v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/drawing/DrawingState;->handleSizeChange(FF)V

    .line 142
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/DrawingView;->invalidate()V

    .line 143
    return-void
.end method

.method public isDefault()Z
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingState;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isTouchEnabled()Z
    .locals 1

    .prologue
    .line 206
    iget-boolean v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->touchEnabled:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 168
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 169
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingCanvas:Lcom/vk/attachpicker/drawing/DrawingCanvas;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->drawOnCanvas(Landroid/graphics/Canvas;)V

    .line 170
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 2
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 160
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 161
    invoke-virtual {p0, p1, p2}, Lcom/vk/attachpicker/drawing/DrawingView;->handleSizeChange(II)V

    .line 162
    new-instance v0, Lcom/vk/attachpicker/drawing/DrawingCanvas;

    invoke-direct {v0, p1, p2}, Lcom/vk/attachpicker/drawing/DrawingCanvas;-><init>(II)V

    iput-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingCanvas:Lcom/vk/attachpicker/drawing/DrawingCanvas;

    .line 163
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingCanvas:Lcom/vk/attachpicker/drawing/DrawingCanvas;

    iget-object v1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->draw(Lcom/vk/attachpicker/drawing/DrawingState;)V

    .line 164
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 174
    iget-boolean v2, p0, Lcom/vk/attachpicker/drawing/DrawingView;->touchEnabled:Z

    if-nez v2, :cond_0

    .line 175
    const/4 v2, 0x0

    .line 202
    :goto_0
    return v2

    .line 178
    :cond_0
    iget-boolean v2, p0, Lcom/vk/attachpicker/drawing/DrawingView;->fixTouchPosition:Z

    if-eqz v2, :cond_1

    .line 179
    invoke-static {p0}, Lcom/vk/attachpicker/util/Utils;->getXOnScreen(Landroid/view/View;)I

    move-result v2

    neg-int v0, v2

    .line 180
    .local v0, "deltaX":I
    invoke-static {p0}, Lcom/vk/attachpicker/util/Utils;->getYOnScreen(Landroid/view/View;)I

    move-result v2

    neg-int v1, v2

    .line 181
    .local v1, "deltaY":I
    int-to-float v2, v0

    sget v3, Lcom/vk/attachpicker/drawing/DrawingView;->TOUCH_OFFSET:I

    sub-int v3, v1, v3

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 186
    .end local v0    # "deltaX":I
    .end local v1    # "deltaY":I
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 200
    :goto_2
    invoke-virtual {p0}, Lcom/vk/attachpicker/drawing/DrawingView;->invalidate()V

    .line 202
    const/4 v2, 0x1

    goto :goto_0

    .line 183
    :cond_1
    const/4 v2, 0x0

    sget v3, Lcom/vk/attachpicker/drawing/DrawingView;->TOUCH_OFFSET:I

    neg-int v3, v3

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    goto :goto_1

    .line 188
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->onActionDown(Landroid/view/MotionEvent;)V

    goto :goto_2

    .line 191
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->onActionMove(Landroid/view/MotionEvent;)V

    goto :goto_2

    .line 194
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->onActionUp(Landroid/view/MotionEvent;)V

    goto :goto_2

    .line 186
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public restoreState()V
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingState;->restore()V

    .line 137
    invoke-direct {p0}, Lcom/vk/attachpicker/drawing/DrawingView;->invalidateBitmap()V

    .line 138
    return-void
.end method

.method public saveState()V
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingState;->save()V

    .line 133
    return-void
.end method

.method public setBrushType(I)V
    .locals 0
    .param p1, "brushType"    # I

    .prologue
    .line 232
    iput p1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->brushType:I

    .line 233
    return-void
.end method

.method public setColor(I)V
    .locals 0
    .param p1, "color"    # I

    .prologue
    .line 240
    iput p1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->color:I

    .line 241
    return-void
.end method

.method public setFixTouchPosition(Z)V
    .locals 0
    .param p1, "fixTouchPosition"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->fixTouchPosition:Z

    .line 125
    return-void
.end method

.method public setOnMotionEventListener(Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;)V
    .locals 0
    .param p1, "onMotionEventListener"    # Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->onMotionEventListener:Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;

    .line 129
    return-void
.end method

.method public setTouchEnabled(Z)V
    .locals 0
    .param p1, "touchEnabled"    # Z

    .prologue
    .line 210
    iput-boolean p1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->touchEnabled:Z

    .line 211
    return-void
.end method

.method public setWidthMultiplier(F)V
    .locals 0
    .param p1, "widthMultiplier"    # F

    .prologue
    .line 248
    iput p1, p0, Lcom/vk/attachpicker/drawing/DrawingView;->widthMultiplier:F

    .line 249
    return-void
.end method

.method public undo()V
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/vk/attachpicker/drawing/DrawingView;->drawingState:Lcom/vk/attachpicker/drawing/DrawingState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingState;->removeLastElement()V

    .line 215
    invoke-direct {p0}, Lcom/vk/attachpicker/drawing/DrawingView;->invalidateBitmap()V

    .line 216
    return-void
.end method
