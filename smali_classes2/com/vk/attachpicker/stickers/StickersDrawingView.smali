.class public Lcom/vk/attachpicker/stickers/StickersDrawingView;
.super Landroid/view/View;
.source "StickersDrawingView.java"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
.implements Lcom/vk/attachpicker/gesture/MoveGestureDetector$OnMoveGestureListener;
.implements Lcom/vk/attachpicker/gesture/RotationGestureDetector$OnRotationGestureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;,
        Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;,
        Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;
    }
.end annotation


# static fields
.field private static final STATE_IN_DRAWING_AREA:I = 0x1

.field private static final STATE_IN_REMOVE_AREA:I = 0x2

.field private static final STATE_NONE:I = 0x0

.field private static final STATE_WAS_SCALED_OR_ROTATED:I = 0x3


# instance fields
.field private downTime:J

.field private downX:I

.field private downY:I

.field private drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

.field private interceptTouchListener:Landroid/view/View$OnTouchListener;

.field private moveGestureDetector:Lcom/vk/attachpicker/gesture/MoveGestureDetector;

.field private moveView:Lcom/vk/attachpicker/stickers/Sticker;

.field private onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

.field private onTextStickerClickListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;

.field private removeAreas:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;",
            ">;"
        }
    .end annotation
.end field

.field private rotationGestureDetector:Lcom/vk/attachpicker/gesture/RotationGestureDetector;

.field private scaleGestureDetector:Landroid/view/ScaleGestureDetector;

.field private state:I

.field private final testRect:Landroid/graphics/Rect;

.field private final thisViewRect:Landroid/graphics/Rect;

.field private touchEnabled:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, -0x1

    .line 50
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 27
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->thisViewRect:Landroid/graphics/Rect;

    .line 28
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->testRect:Landroid/graphics/Rect;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->removeAreas:Ljava/util/ArrayList;

    .line 31
    new-instance v0, Lcom/vk/attachpicker/stickers/StickersDrawingState;

    invoke-direct {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingState;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    .line 42
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downX:I

    .line 43
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downY:I

    .line 44
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downTime:J

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->touchEnabled:Z

    .line 51
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->init(Landroid/content/Context;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, -0x1

    .line 55
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->thisViewRect:Landroid/graphics/Rect;

    .line 28
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->testRect:Landroid/graphics/Rect;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->removeAreas:Ljava/util/ArrayList;

    .line 31
    new-instance v0, Lcom/vk/attachpicker/stickers/StickersDrawingState;

    invoke-direct {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingState;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    .line 42
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downX:I

    .line 43
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downY:I

    .line 44
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downTime:J

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->touchEnabled:Z

    .line 56
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->init(Landroid/content/Context;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, -0x1

    .line 60
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->thisViewRect:Landroid/graphics/Rect;

    .line 28
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->testRect:Landroid/graphics/Rect;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->removeAreas:Ljava/util/ArrayList;

    .line 31
    new-instance v0, Lcom/vk/attachpicker/stickers/StickersDrawingState;

    invoke-direct {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingState;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    .line 42
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downX:I

    .line 43
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downY:I

    .line 44
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downTime:J

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->touchEnabled:Z

    .line 61
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->init(Landroid/content/Context;)V

    .line 62
    return-void
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/stickers/StickersDrawingView;)Lcom/vk/attachpicker/stickers/StickersDrawingState;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/StickersDrawingView;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    return-object v0
.end method

.method private init(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    new-instance v0, Lcom/vk/attachpicker/gesture/MoveGestureDetector;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/gesture/MoveGestureDetector;-><init>(Lcom/vk/attachpicker/gesture/MoveGestureDetector$OnMoveGestureListener;)V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveGestureDetector:Lcom/vk/attachpicker/gesture/MoveGestureDetector;

    .line 66
    new-instance v0, Landroid/view/ScaleGestureDetector;

    invoke-direct {v0, p1, p0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    .line 67
    new-instance v0, Lcom/vk/attachpicker/gesture/RotationGestureDetector;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/gesture/RotationGestureDetector;-><init>(Lcom/vk/attachpicker/gesture/RotationGestureDetector$OnRotationGestureListener;)V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->rotationGestureDetector:Lcom/vk/attachpicker/gesture/RotationGestureDetector;

    .line 68
    return-void
.end method


# virtual methods
.method public addRemoveArea(III)V
    .locals 2
    .param p1, "gravity"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->removeAreas:Ljava/util/ArrayList;

    new-instance v1, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;-><init>(Lcom/vk/attachpicker/stickers/StickersDrawingView;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    return-void
.end method

.method public addStickerView(Lcom/vk/attachpicker/stickers/Sticker;)V
    .locals 2
    .param p1, "sticker"    # Lcom/vk/attachpicker/stickers/Sticker;

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vk/attachpicker/stickers/StickersDrawingView$1;

    invoke-direct {v1, p0, p1}, Lcom/vk/attachpicker/stickers/StickersDrawingView$1;-><init>(Lcom/vk/attachpicker/stickers/StickersDrawingView;Lcom/vk/attachpicker/stickers/Sticker;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 126
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 127
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->clear()V

    .line 92
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 93
    return-void
.end method

.method public getDrawingState()Lcom/vk/attachpicker/stickers/StickersDrawingState;
    .locals 1

    .prologue
    .line 337
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->copy()Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-result-object v0

    return-object v0
.end method

.method public getInterceptTouchListener()Landroid/view/View$OnTouchListener;
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->interceptTouchListener:Landroid/view/View$OnTouchListener;

    return-object v0
.end method

.method public handleCrop(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)V
    .locals 1
    .param p1, "before"    # Landroid/graphics/Matrix;
    .param p2, "after"    # Landroid/graphics/Matrix;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    invoke-virtual {v0, p1, p2}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->handleCrop(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)V

    .line 131
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 132
    return-void
.end method

.method public handleSizeChange(II)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 135
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    invoke-virtual {v0, p1, p2}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->handleSizeChange(II)V

    .line 136
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 137
    return-void
.end method

.method public hitRemoveArea(IIZ)Z
    .locals 7
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "useOutsideAreasAsRemoveAreas"    # Z

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 75
    if-eqz p3, :cond_1

    if-ltz p1, :cond_0

    if-ltz p2, :cond_0

    .line 76
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getMeasuredWidth()I

    move-result v4

    if-gt p1, v4, :cond_0

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getMeasuredHeight()I

    move-result v4

    if-le p2, v4, :cond_1

    .line 87
    :cond_0
    :goto_0
    return v2

    .line 79
    :cond_1
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->thisViewRect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getMeasuredWidth()I

    move-result v5

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getMeasuredHeight()I

    move-result v6

    invoke-virtual {v4, v3, v3, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 80
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->removeAreas:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_2

    .line 81
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->removeAreas:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;

    .line 82
    .local v1, "removeArea":Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->thisViewRect:Landroid/graphics/Rect;

    iget-object v5, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->testRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v4, v5}, Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;->get(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 83
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->testRect:Landroid/graphics/Rect;

    invoke-virtual {v4, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    if-nez v4, :cond_0

    .line 80
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v1    # "removeArea":Lcom/vk/attachpicker/stickers/StickersDrawingView$RemoveArea;
    :cond_2
    move v2, v3

    .line 87
    goto :goto_0
.end method

.method public isDefault()Z
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->size()I

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
    .line 140
    iget-boolean v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->touchEnabled:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 149
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 150
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->draw(Landroid/graphics/Canvas;)V

    .line 151
    return-void
.end method

.method public onMove(FF)V
    .locals 1
    .param p1, "deltaX"    # F
    .param p2, "deltaY"    # F

    .prologue
    .line 322
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    if-eqz v0, :cond_0

    .line 323
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    invoke-virtual {v0, p1, p2}, Lcom/vk/attachpicker/stickers/Sticker;->translateBy(FF)V

    .line 324
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 326
    :cond_0
    return-void
.end method

.method public onRotation(FFF)V
    .locals 2
    .param p1, "delta"    # F
    .param p2, "focalX"    # F
    .param p3, "focalY"    # F

    .prologue
    const/4 v1, 0x3

    .line 309
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    if-eqz v0, :cond_1

    .line 310
    iget v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->state:I

    if-eq v0, v1, :cond_0

    .line 311
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->state:I

    .line 312
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    invoke-interface {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;->onTwoFingerGesture()V

    .line 315
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    neg-float v1, p1

    invoke-virtual {v0, v1, p2, p3}, Lcom/vk/attachpicker/stickers/Sticker;->rotateBy(FFF)V

    .line 316
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 318
    :cond_1
    return-void
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 4
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    const/4 v1, 0x3

    .line 285
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    if-eqz v0, :cond_1

    .line 286
    iget v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->state:I

    if-eq v0, v1, :cond_0

    .line 287
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->state:I

    .line 288
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    invoke-interface {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;->onTwoFingerGesture()V

    .line 291
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/attachpicker/stickers/Sticker;->scaleBy(FFF)V

    .line 292
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 294
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 1
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 299
    const/4 v0, 0x1

    return v0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 305
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 155
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 157
    invoke-virtual {p0, p1, p2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->handleSizeChange(II)V

    .line 158
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 24
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 164
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->interceptTouchListener:Landroid/view/View$OnTouchListener;

    move-object/from16 v19, v0

    if-eqz v19, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    if-nez v19, :cond_0

    .line 165
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->interceptTouchListener:Landroid/view/View$OnTouchListener;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-interface {v0, v1, v2}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 168
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->touchEnabled:Z

    move/from16 v19, v0

    if-nez v19, :cond_1

    .line 169
    const/16 v19, 0x0

    .line 280
    :goto_0
    return v19

    .line 172
    :cond_1
    invoke-static/range {p0 .. p0}, Lcom/vk/attachpicker/util/Utils;->getXOnScreen(Landroid/view/View;)I

    move-result v19

    move/from16 v0, v19

    neg-int v7, v0

    .line 173
    .local v7, "deltaX":I
    invoke-static/range {p0 .. p0}, Lcom/vk/attachpicker/util/Utils;->getYOnScreen(Landroid/view/View;)I

    move-result v19

    move/from16 v0, v19

    neg-int v8, v0

    .line 174
    .local v8, "deltaY":I
    int-to-float v0, v7

    move/from16 v19, v0

    int-to-float v0, v8

    move/from16 v20, v0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 176
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v19

    move/from16 v0, v19

    and-int/lit16 v4, v0, 0xff

    .line 177
    .local v4, "action":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v19

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v17, v0

    .line 178
    .local v17, "x":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v19

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v18, v0

    .line 180
    .local v18, "y":I
    if-eqz v4, :cond_2

    const/16 v19, 0x5

    move/from16 v0, v19

    if-ne v4, v0, :cond_b

    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    if-nez v19, :cond_b

    .line 181
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->size()I

    move-result v19

    if-lez v19, :cond_9

    .line 182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->size()I

    move-result v19

    add-int/lit8 v12, v19, -0x1

    .local v12, "i":I
    :goto_1
    if-ltz v12, :cond_3

    .line 183
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    if-eqz v19, :cond_5

    .line 200
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    if-nez v19, :cond_9

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_9

    .line 201
    invoke-static/range {p1 .. p1}, Lcom/vk/attachpicker/gesture/MoveGestureDetector;->getFocalX(Landroid/view/MotionEvent;)F

    move-result v10

    .line 202
    .local v10, "focalX":F
    invoke-static/range {p1 .. p1}, Lcom/vk/attachpicker/gesture/MoveGestureDetector;->getFocalY(Landroid/view/MotionEvent;)F

    move-result v11

    .line 204
    .local v11, "focalY":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->get(I)Lcom/vk/attachpicker/stickers/Sticker;

    move-result-object v5

    .line 205
    .local v5, "closestSticker":Lcom/vk/attachpicker/stickers/Sticker;
    invoke-virtual {v5, v10, v11}, Lcom/vk/attachpicker/stickers/Sticker;->distance(FF)F

    move-result v9

    .line 207
    .local v9, "distance":F
    const/4 v12, 0x0

    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v12, v0, :cond_8

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->get(I)Lcom/vk/attachpicker/stickers/Sticker;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10, v11}, Lcom/vk/attachpicker/stickers/Sticker;->distance(FF)F

    move-result v6

    .line 209
    .local v6, "d":F
    cmpg-float v19, v6, v9

    if-gtz v19, :cond_4

    .line 210
    move v9, v6

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->get(I)Lcom/vk/attachpicker/stickers/Sticker;

    move-result-object v5

    .line 207
    :cond_4
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 187
    .end local v5    # "closestSticker":Lcom/vk/attachpicker/stickers/Sticker;
    .end local v6    # "d":F
    .end local v9    # "distance":F
    .end local v10    # "focalX":F
    .end local v11    # "focalY":F
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->get(I)Lcom/vk/attachpicker/stickers/Sticker;

    move-result-object v16

    .line 189
    .local v16, "v":Lcom/vk/attachpicker/stickers/Sticker;
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v15

    .line 190
    .local v15, "pc":I
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_3
    if-ge v13, v15, :cond_6

    .line 191
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/MotionEvent;->getX(I)F

    move-result v19

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/MotionEvent;->getY(I)F

    move-result v20

    move-object/from16 v0, v16

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/stickers/Sticker;->isCoordinatesInsideView(FF)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 192
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->getStickers()Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->size()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v0, v12, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 195
    invoke-virtual/range {p0 .. p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 182
    :cond_6
    add-int/lit8 v12, v12, -0x1

    goto/16 :goto_1

    .line 190
    :cond_7
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 214
    .end local v13    # "j":I
    .end local v15    # "pc":I
    .end local v16    # "v":Lcom/vk/attachpicker/stickers/Sticker;
    .restart local v5    # "closestSticker":Lcom/vk/attachpicker/stickers/Sticker;
    .restart local v9    # "distance":F
    .restart local v10    # "focalX":F
    .restart local v11    # "focalY":F
    :cond_8
    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    .line 217
    .end local v5    # "closestSticker":Lcom/vk/attachpicker/stickers/Sticker;
    .end local v9    # "distance":F
    .end local v10    # "focalX":F
    .end local v11    # "focalY":F
    .end local v12    # "i":I
    :cond_9
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downX:I

    .line 218
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downY:I

    .line 219
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downTime:J

    .line 220
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vk/attachpicker/stickers/StickersDrawingView;->state:I

    .line 273
    :cond_a
    :goto_4
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveGestureDetector:Lcom/vk/attachpicker/gesture/MoveGestureDetector;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/gesture/MoveGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 274
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 275
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->rotationGestureDetector:Lcom/vk/attachpicker/gesture/RotationGestureDetector;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/gesture/RotationGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 280
    :goto_5
    const/16 v19, 0x1

    goto/16 :goto_0

    .line 222
    :cond_b
    const/16 v19, 0x1

    move/from16 v0, v19

    if-eq v4, v0, :cond_c

    const/16 v19, 0x3

    move/from16 v0, v19

    if-ne v4, v0, :cond_f

    .line 223
    :cond_c
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downX:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_d

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downY:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_d

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downX:I

    move/from16 v19, v0

    sub-int v19, v19, v17

    .line 224
    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->abs(I)I

    move-result v19

    const/16 v20, 0x5

    invoke-static/range {v20 .. v20}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_d

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downY:I

    move/from16 v19, v0

    sub-int v19, v19, v18

    .line 225
    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->abs(I)I

    move-result v19

    const/16 v20, 0x5

    invoke-static/range {v20 .. v20}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_d

    .line 226
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downTime:J

    move-wide/from16 v22, v0

    sub-long v20, v20, v22

    const-wide/16 v22, 0x1f4

    cmp-long v19, v20, v22

    if-gez v19, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    if-eqz v19, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    instance-of v0, v0, Lcom/vk/attachpicker/stickers/TextSticker;

    move/from16 v19, v0

    if-eqz v19, :cond_d

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onTextStickerClickListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;

    move-object/from16 v19, v0

    if-eqz v19, :cond_d

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onTextStickerClickListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    check-cast v19, Lcom/vk/attachpicker/stickers/TextSticker;

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;->onClick(Lcom/vk/attachpicker/stickers/TextSticker;)V

    .line 234
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    move-object/from16 v19, v0

    if-eqz v19, :cond_e

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->state:I

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_e

    .line 235
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->hitRemoveArea(IIZ)Z

    move-result v19

    if-eqz v19, :cond_e

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    if-eqz v19, :cond_e

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->removeSticker(Lcom/vk/attachpicker/stickers/Sticker;)V

    .line 238
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    .line 239
    invoke-virtual/range {p0 .. p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 243
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;->onUp()V

    .line 244
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    goto/16 :goto_4

    .line 245
    :cond_f
    const/16 v19, 0x2

    move/from16 v0, v19

    if-ne v4, v0, :cond_a

    .line 246
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->downTime:J

    move-wide/from16 v22, v0

    sub-long v20, v20, v22

    const-wide/16 v22, 0x96

    cmp-long v19, v20, v22

    if-lez v19, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    if-eqz v19, :cond_a

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->state:I

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_a

    .line 247
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->state:I

    move/from16 v19, v0

    if-nez v19, :cond_10

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    move-object/from16 v19, v0

    if-eqz v19, :cond_10

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;->onStartMove()V

    .line 254
    :cond_10
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->hitRemoveArea(IIZ)Z

    move-result v19

    if-eqz v19, :cond_11

    .line 255
    const/4 v14, 0x2

    .line 259
    .local v14, "newState":I
    :goto_6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->state:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-eq v14, v0, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    move-object/from16 v19, v0

    if-eqz v19, :cond_a

    .line 260
    const/16 v19, 0x2

    move/from16 v0, v19

    if-ne v14, v0, :cond_12

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    const/16 v20, 0x7f

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/stickers/Sticker;->setAlpha(I)V

    .line 262
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;->onEnterRemoveArea()V

    .line 267
    :goto_7
    move-object/from16 v0, p0

    iput v14, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->state:I

    goto/16 :goto_4

    .line 257
    .end local v14    # "newState":I
    :cond_11
    const/4 v14, 0x1

    .restart local v14    # "newState":I
    goto :goto_6

    .line 264
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->moveView:Lcom/vk/attachpicker/stickers/Sticker;

    move-object/from16 v19, v0

    const/16 v20, 0xff

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/stickers/Sticker;->setAlpha(I)V

    .line 265
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;->onLeaveRemoveArea()V

    goto :goto_7

    .line 276
    .end local v14    # "newState":I
    :catch_0
    move-exception v19

    goto/16 :goto_5
.end method

.method public removeStickerView(Lcom/vk/attachpicker/stickers/Sticker;)V
    .locals 1
    .param p1, "sticker"    # Lcom/vk/attachpicker/stickers/Sticker;

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->drawingState:Lcom/vk/attachpicker/stickers/StickersDrawingState;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->removeSticker(Lcom/vk/attachpicker/stickers/Sticker;)V

    .line 109
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 110
    return-void
.end method

.method public setInterceptTouchListener(Landroid/view/View$OnTouchListener;)V
    .locals 0
    .param p1, "interceptTouchListener"    # Landroid/view/View$OnTouchListener;

    .prologue
    .line 333
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->interceptTouchListener:Landroid/view/View$OnTouchListener;

    .line 334
    return-void
.end method

.method public setOnStickerMoveListener(Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;)V
    .locals 0
    .param p1, "onStickerMoveListener"    # Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onStickerMoveListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;

    .line 105
    return-void
.end method

.method public setOnTextStickerClickListener(Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;)V
    .locals 0
    .param p1, "onTextStickerClickListener"    # Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->onTextStickerClickListener:Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;

    .line 101
    return-void
.end method

.method public setTouchEnabled(Z)V
    .locals 0
    .param p1, "touchEnabled"    # Z

    .prologue
    .line 144
    iput-boolean p1, p0, Lcom/vk/attachpicker/stickers/StickersDrawingView;->touchEnabled:Z

    .line 145
    return-void
.end method
