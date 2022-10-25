.class public Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;
.super Ljava/lang/Object;
.source "ScaleDragDetector.java"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# static fields
.field private static final INVALID_POINTER_ID:I = -0x1


# instance fields
.field private mActivePointerId:I

.field private mActivePointerIndex:I

.field private mIsDragging:Z

.field mLastTouchX:F

.field mLastTouchY:F

.field private final mMinimumVelocity:F

.field private final mScaleDetector:Landroid/view/ScaleGestureDetector;

.field private final mScaleDragGestureListener:Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;

.field private final mTouchSlop:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "scaleDragGestureListener"    # Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v1, -0x1

    iput v1, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerId:I

    .line 41
    const/4 v1, 0x0

    iput v1, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerIndex:I

    .line 44
    new-instance v1, Landroid/view/ScaleGestureDetector;

    invoke-direct {v1, p1, p0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v1, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    .line 45
    iput-object p2, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mScaleDragGestureListener:Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;

    .line 47
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 48
    .local v0, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mMinimumVelocity:F

    .line 49
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mTouchSlop:F

    .line 50
    return-void
.end method

.method private getActiveX(Landroid/view/MotionEvent;)F
    .locals 2
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 81
    :try_start_0
    iget v1, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerIndex:I

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 83
    :goto_0
    return v1

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    goto :goto_0
.end method

.method private getActiveY(Landroid/view/MotionEvent;)F
    .locals 2
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 89
    :try_start_0
    iget v1, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerIndex:I

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 91
    :goto_0
    return v1

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    goto :goto_0
.end method

.method private onTouchActivePointer(ILandroid/view/MotionEvent;)V
    .locals 6
    .param p1, "action"    # I
    .param p2, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, -0x1

    const/4 v3, 0x0

    .line 104
    packed-switch p1, :pswitch_data_0

    .line 125
    :cond_0
    :goto_0
    :pswitch_0
    iget v4, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerId:I

    if-eq v4, v5, :cond_1

    iget v3, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerId:I

    :cond_1
    invoke-static {p2, v3}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v3

    iput v3, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerIndex:I

    .line 127
    return-void

    .line 106
    :pswitch_1
    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    iput v4, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerId:I

    goto :goto_0

    .line 110
    :pswitch_2
    iput v5, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerId:I

    goto :goto_0

    .line 113
    :pswitch_3
    invoke-static {p2}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v2

    .line 114
    .local v2, "pointerIndex":I
    invoke-static {p2, v2}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 115
    .local v1, "pointerId":I
    iget v4, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerId:I

    if-ne v1, v4, :cond_0

    .line 116
    if-nez v2, :cond_2

    const/4 v0, 0x1

    .line 117
    .local v0, "newPointerIndex":I
    :goto_1
    invoke-static {p2, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v4

    iput v4, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mActivePointerId:I

    .line 118
    invoke-static {p2, v0}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v4

    iput v4, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchX:F

    .line 119
    invoke-static {p2, v0}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v4

    iput v4, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchY:F

    goto :goto_0

    .end local v0    # "newPointerIndex":I
    :cond_2
    move v0, v3

    .line 116
    goto :goto_1

    .line 104
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private onTouchDragEvent(ILandroid/view/MotionEvent;)V
    .locals 12
    .param p1, "action"    # I
    .param p2, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v11, 0x0

    const/4 v6, 0x0

    .line 130
    packed-switch p1, :pswitch_data_0

    .line 196
    :cond_0
    :goto_0
    return-void

    .line 132
    :pswitch_0
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v7

    iput-object v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 133
    iget-object v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v7, :cond_1

    .line 134
    iget-object v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 137
    :cond_1
    invoke-direct {p0, p2}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v7

    iput v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchX:F

    .line 138
    invoke-direct {p0, p2}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v7

    iput v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchY:F

    .line 139
    iput-boolean v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mIsDragging:Z

    goto :goto_0

    .line 144
    :pswitch_1
    invoke-direct {p0, p2}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v4

    .line 145
    .local v4, "x":F
    invoke-direct {p0, p2}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v5

    .line 146
    .local v5, "y":F
    iget v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchX:F

    sub-float v0, v4, v7

    .local v0, "dx":F
    iget v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchY:F

    sub-float v1, v5, v7

    .line 148
    .local v1, "dy":F
    iget-boolean v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mIsDragging:Z

    if-nez v7, :cond_3

    .line 149
    mul-float v7, v0, v0

    mul-float v8, v1, v1

    add-float/2addr v7, v8

    float-to-double v8, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v8

    iget v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mTouchSlop:F

    float-to-double v10, v7

    cmpl-double v7, v8, v10

    if-ltz v7, :cond_2

    const/4 v6, 0x1

    :cond_2
    iput-boolean v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mIsDragging:Z

    .line 152
    :cond_3
    iget-boolean v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mIsDragging:Z

    if-eqz v6, :cond_0

    .line 153
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mScaleDragGestureListener:Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;

    invoke-interface {v6, v0, v1}, Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;->onDrag(FF)V

    .line 154
    iput v4, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchX:F

    .line 155
    iput v5, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchY:F

    .line 157
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_0

    .line 158
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 165
    .end local v0    # "dx":F
    .end local v1    # "dy":F
    .end local v4    # "x":F
    .end local v5    # "y":F
    :pswitch_2
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_0

    .line 166
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->recycle()V

    .line 167
    iput-object v11, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto :goto_0

    .line 173
    :pswitch_3
    iget-boolean v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mIsDragging:Z

    if-eqz v6, :cond_4

    .line 174
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_4

    .line 175
    invoke-direct {p0, p2}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v6

    iput v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchX:F

    .line 176
    invoke-direct {p0, p2}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v6

    iput v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchY:F

    .line 178
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 179
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v7, 0x3e8

    invoke-virtual {v6, v7}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 181
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v2

    .local v2, "vX":F
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 182
    invoke-virtual {v6}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v3

    .line 184
    .local v3, "vY":F
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v6

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iget v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mMinimumVelocity:F

    cmpl-float v6, v6, v7

    if-ltz v6, :cond_4

    .line 185
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mScaleDragGestureListener:Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;

    iget v7, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchX:F

    iget v8, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mLastTouchY:F

    neg-float v9, v2

    neg-float v10, v3

    invoke-interface {v6, v7, v8, v9, v10}, Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;->onFling(FFFF)V

    .line 189
    .end local v2    # "vX":F
    .end local v3    # "vY":F
    :cond_4
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_0

    .line 190
    iget-object v6, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->recycle()V

    .line 191
    iput-object v11, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto/16 :goto_0

    .line 130
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_3
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public isDragging()Z
    .locals 1

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mIsDragging:Z

    return v0
.end method

.method public isScaling()Z
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v0

    return v0
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 4
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 53
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v0

    .line 55
    .local v0, "scaleFactor":F
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 56
    :cond_0
    const/4 v1, 0x0

    .line 60
    :goto_0
    return v1

    .line 59
    :cond_1
    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mScaleDragGestureListener:Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v3

    invoke-interface {v1, v0, v2, v3}, Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;->onScale(FFF)V

    .line 60
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 1
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 64
    const/4 v0, 0x1

    return v0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 1
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mScaleDragGestureListener:Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;

    invoke-interface {v0}, Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;->onScaleEnd()V

    .line 69
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 96
    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 97
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 98
    .local v0, "action":I
    invoke-direct {p0, v0, p1}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->onTouchActivePointer(ILandroid/view/MotionEvent;)V

    .line 99
    invoke-direct {p0, v0, p1}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->onTouchDragEvent(ILandroid/view/MotionEvent;)V

    .line 100
    const/4 v1, 0x1

    return v1
.end method
