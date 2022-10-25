.class Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;
.super Ljava/lang/Object;
.source "StoriesGestureDetectorCompat.java"

# interfaces
.implements Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/view/StoriesGestureDetectorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GestureDetectorCompatImplBase"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;
    }
.end annotation


# static fields
.field private static final DOUBLE_TAP_TIMEOUT:I

.field private static final LONGPRESS_TIMEOUT:I = 0xc8

.field private static final LONG_PRESS:I = 0x2

.field private static final SHOW_PRESS:I = 0x1

.field private static final TAP:I = 0x3

.field private static final TAP_TIMEOUT:I


# instance fields
.field private mAlwaysInBiggerTapRegion:Z

.field private mAlwaysInTapRegion:Z

.field mCurrentDownEvent:Landroid/view/MotionEvent;

.field mDeferConfirmSingleTap:Z

.field mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

.field private mDoubleTapSlopSquare:I

.field private mDownFocusX:F

.field private mDownFocusY:F

.field private final mHandler:Landroid/os/Handler;

.field private mInLongPress:Z

.field private mIsDoubleTapping:Z

.field private mIsLongpressEnabled:Z

.field private mLastFocusX:F

.field private mLastFocusY:F

.field final mListener:Landroid/view/GestureDetector$OnGestureListener;

.field private mMaximumFlingVelocity:I

.field private mMinimumFlingVelocity:I

.field private mPreviousUpEvent:Landroid/view/MotionEvent;

.field mStillDown:Z

.field private mTouchSlopSquare:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v0

    sput v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->TAP_TIMEOUT:I

    .line 50
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v0

    sput v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->DOUBLE_TAP_TIMEOUT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Landroid/view/GestureDetector$OnGestureListener;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    if-eqz p3, :cond_1

    .line 140
    new-instance v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;

    invoke-direct {v0, p0, p3}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;-><init>(Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    .line 144
    :goto_0
    iput-object p2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    .line 145
    instance-of v0, p2, Landroid/view/GestureDetector$OnDoubleTapListener;

    if-eqz v0, :cond_0

    .line 146
    check-cast p2, Landroid/view/GestureDetector$OnDoubleTapListener;

    .end local p2    # "listener":Landroid/view/GestureDetector$OnGestureListener;
    invoke-virtual {p0, p2}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 148
    :cond_0
    invoke-direct {p0, p1}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->init(Landroid/content/Context;)V

    .line 149
    return-void

    .line 142
    .restart local p2    # "listener":Landroid/view/GestureDetector$OnGestureListener;
    :cond_1
    new-instance v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;

    invoke-direct {v0, p0}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;-><init>(Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    goto :goto_0
.end method

.method private cancel()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 399
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 400
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 401
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 402
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 403
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 404
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    .line 405
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    .line 406
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    .line 407
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    .line 408
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    .line 409
    iget-boolean v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    if-eqz v0, :cond_0

    .line 410
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    .line 412
    :cond_0
    return-void
.end method

.method private cancelTaps()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 415
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 416
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 417
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 418
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    .line 419
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    .line 420
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    .line 421
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    .line 422
    iget-boolean v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    if-eqz v0, :cond_0

    .line 423
    iput-boolean v2, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    .line 425
    :cond_0
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 152
    if-nez p1, :cond_0

    .line 153
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Context must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 155
    :cond_0
    iget-object v3, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    if-nez v3, :cond_1

    .line 156
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "OnGestureListener must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 158
    :cond_1
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    .line 160
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 161
    .local v0, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v2

    .line 162
    .local v2, "touchSlop":I
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledDoubleTapSlop()I

    move-result v1

    .line 163
    .local v1, "doubleTapSlop":I
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v3

    iput v3, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mMinimumFlingVelocity:I

    .line 164
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v3

    iput v3, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mMaximumFlingVelocity:I

    .line 166
    mul-int v3, v2, v2

    iput v3, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mTouchSlopSquare:I

    .line 167
    mul-int v3, v1, v1

    iput v3, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapSlopSquare:I

    .line 168
    return-void
.end method

.method private isConsideredDoubleTap(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "firstDown"    # Landroid/view/MotionEvent;
    .param p2, "firstUp"    # Landroid/view/MotionEvent;
    .param p3, "secondDown"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x0

    .line 429
    iget-boolean v3, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    if-nez v3, :cond_1

    .line 439
    :cond_0
    :goto_0
    return v2

    .line 433
    :cond_1
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    sget v3, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->DOUBLE_TAP_TIMEOUT:I

    int-to-long v6, v3

    cmp-long v3, v4, v6

    if-gtz v3, :cond_0

    .line 437
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v4, v4

    sub-int v0, v3, v4

    .line 438
    .local v0, "deltaX":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    sub-int v1, v3, v4

    .line 439
    .local v1, "deltaY":I
    mul-int v3, v0, v0

    mul-int v4, v1, v1

    add-int/2addr v3, v4

    iget v4, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapSlopSquare:I

    if-ge v3, v4, :cond_0

    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method dispatchLongPress()V
    .locals 2

    .prologue
    .line 443
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 444
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    .line 445
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    .line 446
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    iget-object v1, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    .line 447
    return-void
.end method

.method public isLongpressEnabled()Z
    .locals 1

    .prologue
    .line 201
    iget-boolean v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 42
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 214
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    .line 216
    .local v6, "action":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v36, v0

    if-nez v36, :cond_0

    .line 217
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 219
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 221
    and-int/lit16 v0, v6, 0xff

    move/from16 v36, v0

    const/16 v37, 0x6

    move/from16 v0, v36

    move/from16 v1, v37

    if-ne v0, v1, :cond_1

    const/16 v22, 0x1

    .line 223
    .local v22, "pointerUp":Z
    :goto_0
    if-eqz v22, :cond_2

    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v25

    .line 226
    .local v25, "skipIndex":I
    :goto_1
    const/16 v26, 0x0

    .local v26, "sumX":F
    const/16 v27, 0x0

    .line 227
    .local v27, "sumY":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    .line 228
    .local v7, "count":I
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_2
    move/from16 v0, v18

    if-ge v0, v7, :cond_4

    .line 229
    move/from16 v0, v25

    move/from16 v1, v18

    if-ne v0, v1, :cond_3

    .line 228
    :goto_3
    add-int/lit8 v18, v18, 0x1

    goto :goto_2

    .line 221
    .end local v7    # "count":I
    .end local v18    # "i":I
    .end local v22    # "pointerUp":Z
    .end local v25    # "skipIndex":I
    .end local v26    # "sumX":F
    .end local v27    # "sumY":F
    :cond_1
    const/16 v22, 0x0

    goto :goto_0

    .line 223
    .restart local v22    # "pointerUp":Z
    :cond_2
    const/16 v25, -0x1

    goto :goto_1

    .line 230
    .restart local v7    # "count":I
    .restart local v18    # "i":I
    .restart local v25    # "skipIndex":I
    .restart local v26    # "sumX":F
    .restart local v27    # "sumY":F
    :cond_3
    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v36

    add-float v26, v26, v36

    .line 231
    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v36

    add-float v27, v27, v36

    goto :goto_3

    .line 233
    :cond_4
    if-eqz v22, :cond_6

    add-int/lit8 v12, v7, -0x1

    .line 234
    .local v12, "div":I
    :goto_4
    int-to-float v0, v12

    move/from16 v36, v0

    div-float v14, v26, v36

    .line 235
    .local v14, "focusX":F
    int-to-float v0, v12

    move/from16 v36, v0

    div-float v15, v27, v36

    .line 237
    .local v15, "focusY":F
    const/16 v17, 0x0

    .line 239
    .local v17, "handled":Z
    and-int/lit16 v0, v6, 0xff

    move/from16 v36, v0

    packed-switch v36, :pswitch_data_0

    .line 395
    :cond_5
    :goto_5
    :pswitch_0
    return v17

    .end local v12    # "div":I
    .end local v14    # "focusX":F
    .end local v15    # "focusY":F
    .end local v17    # "handled":Z
    :cond_6
    move v12, v7

    .line 233
    goto :goto_4

    .line 241
    .restart local v12    # "div":I
    .restart local v14    # "focusX":F
    .restart local v15    # "focusY":F
    .restart local v17    # "handled":Z
    :pswitch_1
    move-object/from16 v0, p0

    iput v14, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    .line 242
    move-object/from16 v0, p0

    iput v15, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    move-object/from16 v0, p0

    iput v15, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    .line 244
    invoke-direct/range {p0 .. p0}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->cancelTaps()V

    goto :goto_5

    .line 248
    :pswitch_2
    move-object/from16 v0, p0

    iput v14, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    .line 249
    move-object/from16 v0, p0

    iput v15, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    move-object/from16 v0, p0

    iput v15, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v36, v0

    const/16 v37, 0x3e8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mMaximumFlingVelocity:I

    move/from16 v38, v0

    move/from16 v0, v38

    int-to-float v0, v0

    move/from16 v38, v0

    invoke-virtual/range {v36 .. v38}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 254
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v28

    .line 255
    .local v28, "upIndex":I
    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v19

    .line 256
    .local v19, "id1":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move/from16 v1, v19

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v33

    .line 257
    .local v33, "x1":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move/from16 v1, v19

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v35

    .line 258
    .local v35, "y1":F
    const/16 v18, 0x0

    :goto_6
    move/from16 v0, v18

    if-ge v0, v7, :cond_5

    .line 259
    move/from16 v0, v18

    move/from16 v1, v28

    if-ne v0, v1, :cond_8

    .line 258
    :cond_7
    add-int/lit8 v18, v18, 0x1

    goto :goto_6

    .line 261
    :cond_8
    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v20

    .line 262
    .local v20, "id2":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move/from16 v1, v20

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v36

    mul-float v32, v33, v36

    .line 263
    .local v32, "x":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move/from16 v1, v20

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v36

    mul-float v34, v35, v36

    .line 265
    .local v34, "y":F
    add-float v13, v32, v34

    .line 266
    .local v13, "dot":F
    const/16 v36, 0x0

    cmpg-float v36, v13, v36

    if-gez v36, :cond_7

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Landroid/view/VelocityTracker;->clear()V

    goto/16 :goto_5

    .line 274
    .end local v13    # "dot":F
    .end local v19    # "id1":I
    .end local v20    # "id2":I
    .end local v28    # "upIndex":I
    .end local v32    # "x":F
    .end local v33    # "x1":F
    .end local v34    # "y":F
    .end local v35    # "y1":F
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    move-object/from16 v36, v0

    if-eqz v36, :cond_a

    .line 275
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x3

    invoke-virtual/range {v36 .. v37}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v16

    .line 276
    .local v16, "hadTapMessage":Z
    if-eqz v16, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x3

    invoke-virtual/range {v36 .. v37}, Landroid/os/Handler;->removeMessages(I)V

    .line 277
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v36, v0

    if-eqz v36, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    move-object/from16 v36, v0

    if-eqz v36, :cond_d

    if-eqz v16, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v36, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    .line 278
    move-object/from16 v0, p0

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->isConsideredDoubleTap(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    move-result v36

    if-eqz v36, :cond_d

    .line 280
    const/16 v36, 0x1

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    .line 282
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    move-object/from16 v36, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    invoke-interface/range {v36 .. v37}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result v36

    or-int v17, v17, v36

    .line 284
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result v36

    or-int v17, v17, v36

    .line 291
    .end local v16    # "hadTapMessage":Z
    :cond_a
    :goto_7
    move-object/from16 v0, p0

    iput v14, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    .line 292
    move-object/from16 v0, p0

    iput v15, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    move-object/from16 v0, p0

    iput v15, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    .line 293
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v36, v0

    if-eqz v36, :cond_b

    .line 294
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Landroid/view/MotionEvent;->recycle()V

    .line 296
    :cond_b
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    .line 297
    const/16 v36, 0x1

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    .line 298
    const/16 v36, 0x1

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    .line 299
    const/16 v36, 0x1

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    .line 300
    const/16 v36, 0x0

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    .line 301
    const/16 v36, 0x0

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    .line 303
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    move/from16 v36, v0

    if-eqz v36, :cond_c

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x2

    invoke-virtual/range {v36 .. v37}, Landroid/os/Handler;->removeMessages(I)V

    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v38, v0

    invoke-virtual/range {v38 .. v38}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v38

    sget v40, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->TAP_TIMEOUT:I

    move/from16 v0, v40

    int-to-long v0, v0

    move-wide/from16 v40, v0

    add-long v38, v38, v40

    const-wide/16 v40, 0xc8

    add-long v38, v38, v40

    invoke-virtual/range {v36 .. v39}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 308
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v38, v0

    invoke-virtual/range {v38 .. v38}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v38

    sget v40, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->TAP_TIMEOUT:I

    move/from16 v0, v40

    int-to-long v0, v0

    move-wide/from16 v40, v0

    add-long v38, v38, v40

    invoke-virtual/range {v36 .. v39}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result v36

    or-int v17, v17, v36

    .line 310
    goto/16 :goto_5

    .line 287
    .restart local v16    # "hadTapMessage":Z
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x3

    sget v38, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->DOUBLE_TAP_TIMEOUT:I

    move/from16 v0, v38

    int-to-long v0, v0

    move-wide/from16 v38, v0

    invoke-virtual/range {v36 .. v39}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_7

    .line 313
    .end local v16    # "hadTapMessage":Z
    :pswitch_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    move/from16 v36, v0

    if-nez v36, :cond_5

    .line 316
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    move/from16 v36, v0

    sub-float v23, v36, v14

    .line 317
    .local v23, "scrollX":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    move/from16 v36, v0

    sub-float v24, v36, v15

    .line 318
    .local v24, "scrollY":F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    move/from16 v36, v0

    if-eqz v36, :cond_e

    .line 320
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result v36

    or-int v17, v17, v36

    goto/16 :goto_5

    .line 321
    :cond_e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    move/from16 v36, v0

    if-eqz v36, :cond_10

    .line 322
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    move/from16 v36, v0

    sub-float v36, v14, v36

    move/from16 v0, v36

    float-to-int v9, v0

    .line 323
    .local v9, "deltaX":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    move/from16 v36, v0

    sub-float v36, v15, v36

    move/from16 v0, v36

    float-to-int v10, v0

    .line 324
    .local v10, "deltaY":I
    mul-int v36, v9, v9

    mul-int v37, v10, v10

    add-int v11, v36, v37

    .line 325
    .local v11, "distance":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mTouchSlopSquare:I

    move/from16 v36, v0

    move/from16 v0, v36

    if-le v11, v0, :cond_f

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    move-object/from16 v36, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, p1

    move/from16 v3, v23

    move/from16 v4, v24

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/GestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v17

    .line 327
    move-object/from16 v0, p0

    iput v14, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    .line 328
    move-object/from16 v0, p0

    iput v15, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    .line 329
    const/16 v36, 0x0

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x3

    invoke-virtual/range {v36 .. v37}, Landroid/os/Handler;->removeMessages(I)V

    .line 331
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x1

    invoke-virtual/range {v36 .. v37}, Landroid/os/Handler;->removeMessages(I)V

    .line 332
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x2

    invoke-virtual/range {v36 .. v37}, Landroid/os/Handler;->removeMessages(I)V

    .line 334
    :cond_f
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mTouchSlopSquare:I

    move/from16 v36, v0

    move/from16 v0, v36

    if-le v11, v0, :cond_5

    .line 335
    const/16 v36, 0x0

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    goto/16 :goto_5

    .line 337
    .end local v9    # "deltaX":I
    .end local v10    # "deltaY":I
    .end local v11    # "distance":I
    :cond_10
    invoke-static/range {v23 .. v23}, Ljava/lang/Math;->abs(F)F

    move-result v36

    const/high16 v37, 0x3f800000    # 1.0f

    cmpl-float v36, v36, v37

    if-gez v36, :cond_11

    invoke-static/range {v24 .. v24}, Ljava/lang/Math;->abs(F)F

    move-result v36

    const/high16 v37, 0x3f800000    # 1.0f

    cmpl-float v36, v36, v37

    if-ltz v36, :cond_5

    .line 338
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    move-object/from16 v36, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, p1

    move/from16 v3, v23

    move/from16 v4, v24

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/GestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v17

    .line 339
    move-object/from16 v0, p0

    iput v14, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    .line 340
    move-object/from16 v0, p0

    iput v15, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    goto/16 :goto_5

    .line 345
    .end local v23    # "scrollX":F
    .end local v24    # "scrollY":F
    :pswitch_5
    const/16 v36, 0x0

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    .line 346
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v8

    .line 347
    .local v8, "currentUpEvent":Landroid/view/MotionEvent;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    move/from16 v36, v0

    if-eqz v36, :cond_15

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result v36

    or-int v17, v17, v36

    .line 373
    :cond_12
    :goto_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    move-object/from16 v36, v0

    if-eqz v36, :cond_13

    .line 374
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Landroid/view/MotionEvent;->recycle()V

    .line 377
    :cond_13
    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    .line 378
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v36, v0

    if-eqz v36, :cond_14

    .line 381
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Landroid/view/VelocityTracker;->recycle()V

    .line 382
    const/16 v36, 0x0

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 384
    :cond_14
    const/16 v36, 0x0

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    .line 385
    const/16 v36, 0x0

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    .line 386
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x1

    invoke-virtual/range {v36 .. v37}, Landroid/os/Handler;->removeMessages(I)V

    .line 387
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x2

    invoke-virtual/range {v36 .. v37}, Landroid/os/Handler;->removeMessages(I)V

    goto/16 :goto_5

    .line 350
    :cond_15
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    move/from16 v36, v0

    if-eqz v36, :cond_16

    .line 351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move-object/from16 v36, v0

    const/16 v37, 0x3

    invoke-virtual/range {v36 .. v37}, Landroid/os/Handler;->removeMessages(I)V

    .line 352
    const/16 v36, 0x0

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    goto :goto_8

    .line 353
    :cond_16
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    move/from16 v36, v0

    if-eqz v36, :cond_17

    .line 354
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v17

    .line 355
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    move/from16 v36, v0

    if-eqz v36, :cond_12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    move-object/from16 v36, v0

    if-eqz v36, :cond_12

    .line 356
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    goto/16 :goto_8

    .line 360
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v29, v0

    .line 361
    .local v29, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v36, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v21

    .line 362
    .local v21, "pointerId":I
    const/16 v36, 0x3e8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mMaximumFlingVelocity:I

    move/from16 v37, v0

    move/from16 v0, v37

    int-to-float v0, v0

    move/from16 v37, v0

    move-object/from16 v0, v29

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 363
    move-object/from16 v0, v29

    move/from16 v1, v21

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v31

    .line 365
    .local v31, "velocityY":F
    move-object/from16 v0, v29

    move/from16 v1, v21

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v30

    .line 368
    .local v30, "velocityX":F
    invoke-static/range {v31 .. v31}, Ljava/lang/Math;->abs(F)F

    move-result v36

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mMinimumFlingVelocity:I

    move/from16 v37, v0

    move/from16 v0, v37

    int-to-float v0, v0

    move/from16 v37, v0

    cmpl-float v36, v36, v37

    if-gtz v36, :cond_18

    .line 369
    invoke-static/range {v30 .. v30}, Ljava/lang/Math;->abs(F)F

    move-result v36

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mMinimumFlingVelocity:I

    move/from16 v37, v0

    move/from16 v0, v37

    int-to-float v0, v0

    move/from16 v37, v0

    cmpl-float v36, v36, v37

    if-lez v36, :cond_12

    .line 370
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    move-object/from16 v36, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, p1

    move/from16 v3, v30

    move/from16 v4, v31

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/GestureDetector$OnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v17

    goto/16 :goto_8

    .line 391
    .end local v8    # "currentUpEvent":Landroid/view/MotionEvent;
    .end local v21    # "pointerId":I
    .end local v29    # "velocityTracker":Landroid/view/VelocityTracker;
    .end local v30    # "velocityX":F
    .end local v31    # "velocityY":F
    :pswitch_6
    invoke-direct/range {p0 .. p0}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->cancel()V

    goto/16 :goto_5

    .line 239
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setIsLongpressEnabled(Z)V
    .locals 0
    .param p1, "isLongpressEnabled"    # Z

    .prologue
    .line 193
    iput-boolean p1, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    .line 194
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 0
    .param p1, "onDoubleTapListener"    # Landroid/view/GestureDetector$OnDoubleTapListener;

    .prologue
    .line 179
    iput-object p1, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 180
    return-void
.end method
