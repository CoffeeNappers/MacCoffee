.class public Lcom/vkontakte/android/ui/SlidingDrawer;
.super Landroid/view/ViewGroup;
.source "SlidingDrawer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/SlidingDrawer$SlidingHandler;,
        Lcom/vkontakte/android/ui/SlidingDrawer$DrawerToggler;,
        Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;,
        Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerCloseListener;,
        Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerOpenListener;
    }
.end annotation


# static fields
.field private static final ANIMATION_FRAME_DURATION:I = 0x10

.field private static final COLLAPSED_FULL_CLOSED:I = -0x2712

.field private static final EXPANDED_FULL_OPEN:I = -0x2711

.field private static final MAXIMUM_ACCELERATION:F = 2000.0f

.field private static final MAXIMUM_MAJOR_VELOCITY:F = 200.0f

.field private static final MAXIMUM_MINOR_VELOCITY:F = 150.0f

.field private static final MAXIMUM_TAP_VELOCITY:F = 100.0f

.field private static final MSG_ANIMATE:I = 0x3e8

.field public static final ORIENTATION_HORIZONTAL:I = 0x0

.field public static final ORIENTATION_VERTICAL:I = 0x1

.field private static final TAP_THRESHOLD:I = 0x6

.field private static final VELOCITY_UNITS:I = 0x3e8


# instance fields
.field private mAllowSingleTap:Z

.field private mAnimateOnClick:Z

.field private mAnimatedAcceleration:F

.field private mAnimatedVelocity:F

.field private mAnimating:Z

.field private mAnimationLastTime:J

.field private mAnimationPosition:F

.field private mBottomOffset:I

.field private mContent:Landroid/view/View;

.field private final mContentId:I

.field private mCurrentAnimationTime:J

.field private mExpanded:Z

.field private final mFrame:Landroid/graphics/Rect;

.field private mHandle:Landroid/view/View;

.field private mHandleHeight:I

.field private final mHandleId:I

.field private mHandleWidth:I

.field private final mHandler:Landroid/os/Handler;

.field private final mInvalidate:Landroid/graphics/Rect;

.field private mLocked:Z

.field private final mMaximumAcceleration:I

.field private final mMaximumMajorVelocity:I

.field private final mMaximumMinorVelocity:I

.field private final mMaximumTapVelocity:I

.field private mOnDrawerCloseListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerCloseListener;

.field private mOnDrawerOpenListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerOpenListener;

.field private mOnDrawerScrollListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;

.field private final mTapThreshold:I

.field private mTopOffset:I

.field private mTouchDelta:I

.field private mTracking:Z

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private final mVelocityUnits:I

.field private mVertical:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 182
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/SlidingDrawer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 183
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v10, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/high16 v9, 0x3f000000    # 0.5f

    .line 193
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 104
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mFrame:Landroid/graphics/Rect;

    .line 105
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mInvalidate:Landroid/graphics/Rect;

    .line 122
    new-instance v5, Lcom/vkontakte/android/ui/SlidingDrawer$SlidingHandler;

    const/4 v8, 0x0

    invoke-direct {v5, p0, v8}, Lcom/vkontakte/android/ui/SlidingDrawer$SlidingHandler;-><init>(Lcom/vkontakte/android/ui/SlidingDrawer;Lcom/vkontakte/android/ui/SlidingDrawer$1;)V

    iput-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandler:Landroid/os/Handler;

    .line 194
    sget-object v5, Lcom/vkontakte/android/R$styleable;->SlidingDrawer:[I

    invoke-virtual {p1, p2, v5, p3, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 196
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v7, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    .line 197
    .local v4, "orientation":I
    if-ne v4, v6, :cond_0

    move v5, v6

    :goto_0
    iput-boolean v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    .line 198
    const/4 v5, 0x3

    invoke-virtual {v0, v5, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    float-to-int v5, v5

    iput v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    .line 199
    const/4 v5, 0x4

    invoke-virtual {v0, v5, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    float-to-int v5, v5

    iput v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    .line 200
    const/4 v5, 0x5

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAllowSingleTap:Z

    .line 201
    const/4 v5, 0x6

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimateOnClick:Z

    .line 203
    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    .line 204
    .local v3, "handleId":I
    if-nez v3, :cond_1

    .line 205
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "The handle attribute is required and must refer to a valid child."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v3    # "handleId":I
    :cond_0
    move v5, v7

    .line 197
    goto :goto_0

    .line 209
    .restart local v3    # "handleId":I
    :cond_1
    const/4 v5, 0x2

    invoke-virtual {v0, v5, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 210
    .local v1, "contentId":I
    if-nez v1, :cond_2

    .line 211
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "The handle attribute is required and must refer to a valid child."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 215
    :cond_2
    iput v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleId:I

    .line 216
    iput v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContentId:I

    .line 218
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v2, v5, Landroid/util/DisplayMetrics;->density:F

    .line 219
    .local v2, "density":F
    const/high16 v5, 0x40c00000    # 6.0f

    mul-float/2addr v5, v2

    add-float/2addr v5, v9

    float-to-int v5, v5

    iput v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTapThreshold:I

    .line 220
    const/high16 v5, 0x42c80000    # 100.0f

    mul-float/2addr v5, v2

    add-float/2addr v5, v9

    float-to-int v5, v5

    iput v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumTapVelocity:I

    .line 221
    const/high16 v5, 0x43160000    # 150.0f

    mul-float/2addr v5, v2

    add-float/2addr v5, v9

    float-to-int v5, v5

    iput v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMinorVelocity:I

    .line 222
    const/high16 v5, 0x43480000    # 200.0f

    mul-float/2addr v5, v2

    add-float/2addr v5, v9

    float-to-int v5, v5

    iput v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMajorVelocity:I

    .line 223
    const/high16 v5, 0x44fa0000    # 2000.0f

    mul-float/2addr v5, v2

    add-float/2addr v5, v9

    float-to-int v5, v5

    iput v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumAcceleration:I

    .line 224
    const/high16 v5, 0x447a0000    # 1000.0f

    mul-float/2addr v5, v2

    add-float/2addr v5, v9

    float-to-int v5, v5

    iput v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVelocityUnits:I

    .line 226
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 228
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/ui/SlidingDrawer;->setAlwaysDrawnWithCacheEnabled(Z)V

    .line 229
    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/SlidingDrawer;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SlidingDrawer;

    .prologue
    .line 82
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mLocked:Z

    return v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/SlidingDrawer;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SlidingDrawer;

    .prologue
    .line 82
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimateOnClick:Z

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/SlidingDrawer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SlidingDrawer;

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->doAnimation()V

    return-void
.end method

.method private animateClose(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 473
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/SlidingDrawer;->prepareTracking(I)V

    .line 474
    iget v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumAcceleration:I

    int-to-float v0, v0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/vkontakte/android/ui/SlidingDrawer;->performFling(IFZ)V

    .line 475
    return-void
.end method

.method private animateOpen(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 478
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/SlidingDrawer;->prepareTracking(I)V

    .line 479
    iget v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumAcceleration:I

    neg-int v0, v0

    int-to-float v0, v0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/vkontakte/android/ui/SlidingDrawer;->performFling(IFZ)V

    .line 480
    return-void
.end method

.method private closeDrawer()V
    .locals 2

    .prologue
    .line 803
    const/16 v0, -0x2712

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/SlidingDrawer;->moveHandle(I)V

    .line 804
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 805
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->destroyDrawingCache()V

    .line 807
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-nez v0, :cond_1

    .line 815
    :cond_0
    :goto_0
    return-void

    .line 811
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    .line 812
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerCloseListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerCloseListener;

    if-eqz v0, :cond_0

    .line 813
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerCloseListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerCloseListener;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerCloseListener;->onDrawerClosed()V

    goto :goto_0
.end method

.method private doAnimation()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 670
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    if-eqz v0, :cond_0

    .line 671
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->incrementAnimation()V

    .line 672
    iget v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationPosition:F

    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getHeight()I

    move-result v0

    :goto_0
    add-int/2addr v0, v2

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    cmpl-float v0, v1, v0

    if-ltz v0, :cond_2

    .line 673
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    .line 674
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->closeDrawer()V

    .line 685
    :cond_0
    :goto_1
    return-void

    .line 672
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getWidth()I

    move-result v0

    goto :goto_0

    .line 675
    :cond_2
    iget v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationPosition:F

    iget v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_3

    .line 676
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    .line 677
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->openDrawer()V

    goto :goto_1

    .line 679
    :cond_3
    iget v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationPosition:F

    float-to-int v0, v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/SlidingDrawer;->moveHandle(I)V

    .line 680
    iget-wide v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mCurrentAnimationTime:J

    const-wide/16 v2, 0x10

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mCurrentAnimationTime:J

    .line 681
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x3e8

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    iget-wide v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mCurrentAnimationTime:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageAtTime(Landroid/os/Message;J)Z

    goto :goto_1
.end method

.method private incrementAnimation()V
    .locals 8

    .prologue
    .line 688
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 689
    .local v2, "now":J
    iget-wide v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationLastTime:J

    sub-long v6, v2, v6

    long-to-float v6, v6

    const/high16 v7, 0x447a0000    # 1000.0f

    div-float v4, v6, v7

    .line 690
    .local v4, "t":F
    iget v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationPosition:F

    .line 691
    .local v1, "position":F
    iget v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedVelocity:F

    .line 692
    .local v5, "v":F
    iget v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedAcceleration:F

    .line 693
    .local v0, "a":F
    mul-float v6, v5, v4

    add-float/2addr v6, v1

    const/high16 v7, 0x3f000000    # 0.5f

    mul-float/2addr v7, v0

    mul-float/2addr v7, v4

    mul-float/2addr v7, v4

    add-float/2addr v6, v7

    iput v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationPosition:F

    .line 694
    mul-float v6, v0, v4

    add-float/2addr v6, v5

    iput v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedVelocity:F

    .line 695
    iput-wide v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationLastTime:J

    .line 696
    return-void
.end method

.method private moveHandle(I)V
    .locals 12
    .param p1, "position"    # I

    .prologue
    const/4 v11, 0x0

    const/16 v9, -0x2711

    const/16 v8, -0x2712

    .line 556
    iget-object v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    .line 558
    .local v3, "handle":Landroid/view/View;
    iget-boolean v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v7, :cond_4

    .line 559
    if-ne p1, v9, :cond_0

    .line 560
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {v3, v7}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 561
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->invalidate()V

    .line 619
    :goto_0
    return-void

    .line 562
    :cond_0
    if-ne p1, v8, :cond_1

    .line 563
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getBottom()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getTop()I

    move-result v8

    sub-int/2addr v7, v8

    iget v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleHeight:I

    sub-int/2addr v7, v8

    .line 564
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v8

    sub-int/2addr v7, v8

    .line 563
    invoke-virtual {v3, v7}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 565
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->invalidate()V

    goto :goto_0

    .line 567
    :cond_1
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v6

    .line 568
    .local v6, "top":I
    sub-int v1, p1, v6

    .line 569
    .local v1, "deltaY":I
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    if-ge p1, v7, :cond_3

    .line 570
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    sub-int v1, v7, v6

    .line 574
    :cond_2
    :goto_1
    invoke-virtual {v3, v1}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 576
    iget-object v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mFrame:Landroid/graphics/Rect;

    .line 577
    .local v2, "frame":Landroid/graphics/Rect;
    iget-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mInvalidate:Landroid/graphics/Rect;

    .line 579
    .local v5, "region":Landroid/graphics/Rect;
    invoke-virtual {v3, v2}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 580
    invoke-virtual {v5, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 582
    iget v7, v2, Landroid/graphics/Rect;->left:I

    iget v8, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v8, v1

    iget v9, v2, Landroid/graphics/Rect;->right:I

    iget v10, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v10, v1

    invoke-virtual {v5, v7, v8, v9, v10}, Landroid/graphics/Rect;->union(IIII)V

    .line 583
    iget v7, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v7, v1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getWidth()I

    move-result v8

    iget v9, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v9, v1

    iget-object v10, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    .line 584
    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v10

    add-int/2addr v9, v10

    .line 583
    invoke-virtual {v5, v11, v7, v8, v9}, Landroid/graphics/Rect;->union(IIII)V

    .line 586
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/SlidingDrawer;->invalidate(Landroid/graphics/Rect;)V

    goto :goto_0

    .line 571
    .end local v2    # "frame":Landroid/graphics/Rect;
    .end local v5    # "region":Landroid/graphics/Rect;
    :cond_3
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getBottom()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getTop()I

    move-result v8

    sub-int/2addr v7, v8

    iget v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleHeight:I

    sub-int/2addr v7, v8

    sub-int/2addr v7, v6

    if-le v1, v7, :cond_2

    .line 572
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getBottom()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getTop()I

    move-result v8

    sub-int/2addr v7, v8

    iget v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleHeight:I

    sub-int/2addr v7, v8

    sub-int v1, v7, v6

    goto :goto_1

    .line 589
    .end local v1    # "deltaY":I
    .end local v6    # "top":I
    :cond_4
    if-ne p1, v9, :cond_5

    .line 590
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {v3, v7}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 591
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->invalidate()V

    goto/16 :goto_0

    .line 592
    :cond_5
    if-ne p1, v8, :cond_6

    .line 593
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getRight()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getLeft()I

    move-result v8

    sub-int/2addr v7, v8

    iget v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleWidth:I

    sub-int/2addr v7, v8

    .line 594
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v8

    sub-int/2addr v7, v8

    .line 593
    invoke-virtual {v3, v7}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 595
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->invalidate()V

    goto/16 :goto_0

    .line 597
    :cond_6
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v4

    .line 598
    .local v4, "left":I
    sub-int v0, p1, v4

    .line 599
    .local v0, "deltaX":I
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    if-ge p1, v7, :cond_8

    .line 600
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    sub-int v0, v7, v4

    .line 604
    :cond_7
    :goto_2
    invoke-virtual {v3, v0}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 606
    iget-object v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mFrame:Landroid/graphics/Rect;

    .line 607
    .restart local v2    # "frame":Landroid/graphics/Rect;
    iget-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mInvalidate:Landroid/graphics/Rect;

    .line 609
    .restart local v5    # "region":Landroid/graphics/Rect;
    invoke-virtual {v3, v2}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 610
    invoke-virtual {v5, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 612
    iget v7, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v7, v0

    iget v8, v2, Landroid/graphics/Rect;->top:I

    iget v9, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v9, v0

    iget v10, v2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v5, v7, v8, v9, v10}, Landroid/graphics/Rect;->union(IIII)V

    .line 613
    iget v7, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v7, v0

    iget v8, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v8, v0

    iget-object v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    .line 614
    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getHeight()I

    move-result v9

    .line 613
    invoke-virtual {v5, v7, v11, v8, v9}, Landroid/graphics/Rect;->union(IIII)V

    .line 616
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/SlidingDrawer;->invalidate(Landroid/graphics/Rect;)V

    goto/16 :goto_0

    .line 601
    .end local v2    # "frame":Landroid/graphics/Rect;
    .end local v5    # "region":Landroid/graphics/Rect;
    :cond_8
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getRight()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getLeft()I

    move-result v8

    sub-int/2addr v7, v8

    iget v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleWidth:I

    sub-int/2addr v7, v8

    sub-int/2addr v7, v4

    if-le v0, v7, :cond_7

    .line 602
    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getRight()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getLeft()I

    move-result v8

    sub-int/2addr v7, v8

    iget v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleWidth:I

    sub-int/2addr v7, v8

    sub-int v0, v7, v4

    goto :goto_2
.end method

.method private openDrawer()V
    .locals 2

    .prologue
    .line 818
    const/16 v0, -0x2711

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/SlidingDrawer;->moveHandle(I)V

    .line 819
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 821
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-eqz v0, :cond_1

    .line 829
    :cond_0
    :goto_0
    return-void

    .line 825
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    .line 826
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerOpenListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerOpenListener;

    if-eqz v0, :cond_0

    .line 827
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerOpenListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerOpenListener;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerOpenListener;->onDrawerOpened()V

    goto :goto_0
.end method

.method private performFling(IFZ)V
    .locals 6
    .param p1, "position"    # I
    .param p2, "velocity"    # F
    .param p3, "always"    # Z

    .prologue
    const/16 v5, 0x3e8

    const/4 v4, 0x0

    .line 483
    int-to-float v2, p1

    iput v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationPosition:F

    .line 484
    iput p2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedVelocity:F

    .line 485
    iget-boolean v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-eqz v2, :cond_4

    .line 486
    if-nez p3, :cond_0

    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMajorVelocity:I

    int-to-float v2, v2

    cmpl-float v2, p2, v2

    if-gtz v2, :cond_0

    iget v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    iget-boolean v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleHeight:I

    :goto_0
    add-int/2addr v2, v3

    if-le p1, v2, :cond_3

    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMajorVelocity:I

    neg-int v2, v2

    int-to-float v2, v2

    cmpl-float v2, p2, v2

    if-lez v2, :cond_3

    .line 491
    :cond_0
    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumAcceleration:I

    int-to-float v2, v2

    iput v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedAcceleration:F

    .line 492
    cmpg-float v2, p2, v4

    if-gez v2, :cond_1

    .line 493
    iput v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedVelocity:F

    .line 521
    :cond_1
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 522
    .local v0, "now":J
    iput-wide v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationLastTime:J

    .line 523
    const-wide/16 v2, 0x10

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mCurrentAnimationTime:J

    .line 524
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    .line 525
    iget-object v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 526
    iget-object v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    iget-wide v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mCurrentAnimationTime:J

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->sendMessageAtTime(Landroid/os/Message;J)Z

    .line 527
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->stopTracking()V

    .line 528
    return-void

    .line 486
    .end local v0    # "now":J
    :cond_2
    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleWidth:I

    goto :goto_0

    .line 497
    :cond_3
    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumAcceleration:I

    neg-int v2, v2

    int-to-float v2, v2

    iput v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedAcceleration:F

    .line 498
    cmpl-float v2, p2, v4

    if-lez v2, :cond_1

    .line 499
    iput v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedVelocity:F

    goto :goto_1

    .line 503
    :cond_4
    if-nez p3, :cond_7

    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMajorVelocity:I

    int-to-float v2, v2

    cmpl-float v2, p2, v2

    if-gtz v2, :cond_5

    iget-boolean v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v2, :cond_6

    .line 504
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getHeight()I

    move-result v2

    :goto_2
    div-int/lit8 v2, v2, 0x2

    if-le p1, v2, :cond_7

    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMajorVelocity:I

    neg-int v2, v2

    int-to-float v2, v2

    cmpl-float v2, p2, v2

    if-lez v2, :cond_7

    .line 507
    :cond_5
    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumAcceleration:I

    int-to-float v2, v2

    iput v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedAcceleration:F

    .line 508
    cmpg-float v2, p2, v4

    if-gez v2, :cond_1

    .line 509
    iput v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedVelocity:F

    goto :goto_1

    .line 504
    :cond_6
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getWidth()I

    move-result v2

    goto :goto_2

    .line 514
    :cond_7
    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumAcceleration:I

    neg-int v2, v2

    int-to-float v2, v2

    iput v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedAcceleration:F

    .line 515
    cmpl-float v2, p2, v4

    if-lez v2, :cond_1

    .line 516
    iput v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedVelocity:F

    goto :goto_1
.end method

.method private prepareContent()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    .line 622
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    if-eqz v5, :cond_0

    .line 653
    :goto_0
    return-void

    .line 628
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    .line 629
    .local v2, "content":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->isLayoutRequested()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 630
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v5, :cond_2

    .line 631
    iget v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleHeight:I

    .line 632
    .local v0, "childHeight":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getBottom()I

    move-result v5

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getTop()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int/2addr v5, v0

    iget v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    sub-int v3, v5, v6

    .line 633
    .local v3, "height":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getRight()I

    move-result v5

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getLeft()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-static {v5, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 634
    invoke-static {v3, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 633
    invoke-virtual {v2, v5, v6}, Landroid/view/View;->measure(II)V

    .line 635
    iget v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    add-int/2addr v5, v0

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    add-int/2addr v7, v0

    .line 636
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    add-int/2addr v7, v8

    .line 635
    invoke-virtual {v2, v9, v5, v6, v7}, Landroid/view/View;->layout(IIII)V

    .line 649
    .end local v0    # "childHeight":I
    .end local v3    # "height":I
    :cond_1
    :goto_1
    invoke-virtual {v2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewTreeObserver;->dispatchOnPreDraw()Z

    .line 650
    invoke-virtual {v2}, Landroid/view/View;->buildDrawingCache()V

    .line 652
    const/16 v5, 0x8

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 638
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 639
    .local v1, "childWidth":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getRight()I

    move-result v5

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getLeft()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int/2addr v5, v1

    iget v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    sub-int v4, v5, v6

    .line 640
    .local v4, "width":I
    invoke-static {v4, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 641
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getBottom()I

    move-result v6

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getTop()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-static {v6, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 640
    invoke-virtual {v2, v5, v6}, Landroid/view/View;->measure(II)V

    .line 642
    iget v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    add-int/2addr v5, v1

    iget v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    add-int/2addr v6, v1

    .line 643
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v6, v7

    .line 644
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    .line 642
    invoke-virtual {v2, v5, v9, v6, v7}, Landroid/view/View;->layout(IIII)V

    goto :goto_1
.end method

.method private prepareTracking(I)V
    .locals 8
    .param p1, "position"    # I

    .prologue
    const/16 v7, 0x3e8

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 531
    iput-boolean v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTracking:Z

    .line 532
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 533
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-nez v5, :cond_0

    move v2, v4

    .line 534
    .local v2, "opening":Z
    :goto_0
    if-eqz v2, :cond_2

    .line 535
    iget v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumAcceleration:I

    int-to-float v3, v3

    iput v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedAcceleration:F

    .line 536
    iget v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMajorVelocity:I

    int-to-float v3, v3

    iput v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimatedVelocity:F

    .line 537
    iget v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    iget-boolean v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v3, :cond_1

    .line 538
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getHeight()I

    move-result v3

    iget v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleHeight:I

    sub-int/2addr v3, v6

    :goto_1
    add-int/2addr v3, v5

    int-to-float v3, v3

    iput v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationPosition:F

    .line 539
    iget v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationPosition:F

    float-to-int v3, v3

    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/SlidingDrawer;->moveHandle(I)V

    .line 540
    iput-boolean v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    .line 541
    iget-object v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v7}, Landroid/os/Handler;->removeMessages(I)V

    .line 542
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 543
    .local v0, "now":J
    iput-wide v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimationLastTime:J

    .line 544
    const-wide/16 v6, 0x10

    add-long/2addr v6, v0

    iput-wide v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mCurrentAnimationTime:J

    .line 545
    iput-boolean v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    .line 553
    .end local v0    # "now":J
    :goto_2
    return-void

    .end local v2    # "opening":Z
    :cond_0
    move v2, v3

    .line 533
    goto :goto_0

    .line 538
    .restart local v2    # "opening":Z
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getWidth()I

    move-result v3

    iget v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleWidth:I

    sub-int/2addr v3, v6

    goto :goto_1

    .line 547
    :cond_2
    iget-boolean v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    if-eqz v4, :cond_3

    .line 548
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    .line 549
    iget-object v3, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v7}, Landroid/os/Handler;->removeMessages(I)V

    .line 551
    :cond_3
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/SlidingDrawer;->moveHandle(I)V

    goto :goto_2
.end method

.method private stopTracking()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 656
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 657
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTracking:Z

    .line 659
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerScrollListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;

    if-eqz v0, :cond_0

    .line 660
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerScrollListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;->onScrollEnded()V

    .line 663
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_1

    .line 664
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 665
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 667
    :cond_1
    return-void
.end method


# virtual methods
.method public animateClose()V
    .locals 2

    .prologue
    .line 770
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->prepareContent()V

    .line 771
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerScrollListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;

    .line 772
    .local v0, "scrollListener":Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;
    if-eqz v0, :cond_0

    .line 773
    invoke-interface {v0}, Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;->onScrollStarted()V

    .line 775
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    :goto_0
    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/SlidingDrawer;->animateClose(I)V

    .line 776
    if-eqz v0, :cond_1

    .line 777
    invoke-interface {v0}, Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;->onScrollEnded()V

    .line 779
    :cond_1
    return-void

    .line 775
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    goto :goto_0
.end method

.method public animateOpen()V
    .locals 2

    .prologue
    .line 791
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->prepareContent()V

    .line 792
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerScrollListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;

    .line 793
    .local v0, "scrollListener":Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;
    if-eqz v0, :cond_0

    .line 794
    invoke-interface {v0}, Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;->onScrollStarted()V

    .line 796
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    :goto_0
    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/SlidingDrawer;->animateOpen(I)V

    .line 797
    if-eqz v0, :cond_1

    .line 798
    invoke-interface {v0}, Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;->onScrollEnded()V

    .line 800
    :cond_1
    return-void

    .line 796
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    goto :goto_0
.end method

.method public animateToggle()V
    .locals 1

    .prologue
    .line 727
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-nez v0, :cond_0

    .line 728
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->animateOpen()V

    .line 732
    :goto_0
    return-void

    .line 730
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->animateClose()V

    goto :goto_0
.end method

.method public close()V
    .locals 0

    .prologue
    .line 755
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->closeDrawer()V

    .line 756
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->invalidate()V

    .line 757
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->requestLayout()V

    .line 758
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x0

    .line 278
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getDrawingTime()J

    move-result-wide v2

    .line 279
    .local v2, "drawingTime":J
    iget-object v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    .line 280
    .local v1, "handle":Landroid/view/View;
    iget-boolean v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    .line 282
    .local v4, "isVertical":Z
    invoke-virtual {p0, p1, v1, v2, v3}, Lcom/vkontakte/android/ui/SlidingDrawer;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 284
    iget-boolean v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTracking:Z

    if-nez v6, :cond_0

    iget-boolean v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    if-eqz v6, :cond_6

    .line 285
    :cond_0
    iget-object v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 286
    .local v0, "cache":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_3

    .line 287
    if-eqz v4, :cond_2

    .line 288
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p1, v0, v5, v6, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 302
    .end local v0    # "cache":Landroid/graphics/Bitmap;
    :cond_1
    :goto_0
    return-void

    .line 290
    .restart local v0    # "cache":Landroid/graphics/Bitmap;
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p1, v0, v6, v5, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 293
    :cond_3
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 294
    if-eqz v4, :cond_5

    move v6, v5

    :goto_1
    if-eqz v4, :cond_4

    .line 295
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v5

    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    sub-int/2addr v5, v7

    int-to-float v5, v5

    .line 294
    :cond_4
    invoke-virtual {p1, v6, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 296
    iget-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    invoke-virtual {p0, p1, v5, v2, v3}, Lcom/vkontakte/android/ui/SlidingDrawer;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 297
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_0

    .line 294
    :cond_5
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v6

    iget v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    sub-int/2addr v6, v7

    int-to-float v6, v6

    goto :goto_1

    .line 299
    .end local v0    # "cache":Landroid/graphics/Bitmap;
    :cond_6
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-eqz v5, :cond_1

    .line 300
    iget-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    invoke-virtual {p0, p1, v5, v2, v3}, Lcom/vkontakte/android/ui/SlidingDrawer;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    goto :goto_0
.end method

.method public getContent()Landroid/view/View;
    .locals 1

    .prologue
    .line 878
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    return-object v0
.end method

.method public getHandle()Landroid/view/View;
    .locals 1

    .prologue
    .line 868
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    return-object v0
.end method

.method public isMoving()Z
    .locals 1

    .prologue
    .line 914
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTracking:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOpened()Z
    .locals 1

    .prologue
    .line 905
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    return v0
.end method

.method public lock()V
    .locals 1

    .prologue
    .line 896
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mLocked:Z

    .line 897
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .prologue
    .line 233
    iget v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleId:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/SlidingDrawer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    .line 234
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    if-nez v0, :cond_0

    .line 235
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The handle attribute is must refer to an existing child."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 238
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    new-instance v1, Lcom/vkontakte/android/ui/SlidingDrawer$DrawerToggler;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/ui/SlidingDrawer$DrawerToggler;-><init>(Lcom/vkontakte/android/ui/SlidingDrawer;Lcom/vkontakte/android/ui/SlidingDrawer$1;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 240
    iget v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContentId:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/SlidingDrawer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    .line 241
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    if-nez v0, :cond_1

    .line 242
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The content attribute is must refer to an existing child."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 245
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 246
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, 0x0

    const/4 v8, 0x1

    .line 345
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mLocked:Z

    if-eqz v9, :cond_1

    .line 386
    :cond_0
    :goto_0
    return v7

    .line 349
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 351
    .local v0, "action":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    .line 352
    .local v5, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    .line 354
    .local v6, "y":F
    iget-object v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mFrame:Landroid/graphics/Rect;

    .line 355
    .local v1, "frame":Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    .line 357
    .local v2, "handle":Landroid/view/View;
    invoke-virtual {v2, v1}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 358
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTracking:Z

    if-nez v9, :cond_2

    float-to-int v9, v5

    float-to-int v10, v6

    invoke-virtual {v1, v9, v10}, Landroid/graphics/Rect;->contains(II)Z

    move-result v9

    if-nez v9, :cond_2

    iget v9, v1, Landroid/graphics/Rect;->right:I

    if-gtz v9, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getWidth()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    cmpl-float v9, v5, v9

    if-gtz v9, :cond_0

    const/high16 v9, 0x43200000    # 160.0f

    invoke-static {v9}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v9

    int-to-float v9, v9

    cmpg-float v9, v6, v9

    if-ltz v9, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getHeight()I

    move-result v9

    const/high16 v10, 0x42f00000    # 120.0f

    invoke-static {v10}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v10

    sub-int/2addr v9, v10

    int-to-float v9, v9

    cmpl-float v9, v6, v9

    if-gtz v9, :cond_0

    .line 362
    :cond_2
    if-nez v0, :cond_4

    .line 363
    iput-boolean v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTracking:Z

    .line 365
    invoke-virtual {v2, v8}, Landroid/view/View;->setPressed(Z)V

    .line 367
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->prepareContent()V

    .line 370
    iget-object v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerScrollListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;

    if-eqz v7, :cond_3

    .line 371
    iget-object v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerScrollListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;

    invoke-interface {v7}, Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;->onScrollStarted()V

    .line 374
    :cond_3
    iget-boolean v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v7, :cond_5

    .line 375
    iget-object v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v4

    .line 376
    .local v4, "top":I
    float-to-int v7, v6

    sub-int/2addr v7, v4

    iput v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTouchDelta:I

    .line 377
    invoke-direct {p0, v4}, Lcom/vkontakte/android/ui/SlidingDrawer;->prepareTracking(I)V

    .line 383
    .end local v4    # "top":I
    :goto_1
    iget-object v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_4
    move v7, v8

    .line 386
    goto :goto_0

    .line 379
    :cond_5
    iget-object v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v3

    .line 380
    .local v3, "left":I
    float-to-int v7, v5

    sub-int/2addr v7, v3

    iput v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTouchDelta:I

    .line 381
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/SlidingDrawer;->prepareTracking(I)V

    goto :goto_1
.end method

.method protected onLayout(ZIIII)V
    .locals 13
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 306
    iget-boolean v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTracking:Z

    if-eqz v8, :cond_0

    .line 341
    :goto_0
    return-void

    .line 310
    :cond_0
    sub-int v7, p4, p2

    .line 311
    .local v7, "width":I
    sub-int v6, p5, p3

    .line 313
    .local v6, "height":I
    iget-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    .line 315
    .local v5, "handle":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    .line 316
    .local v3, "childWidth":I
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 321
    .local v0, "childHeight":I
    iget-object v4, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    .line 323
    .local v4, "content":Landroid/view/View;
    iget-boolean v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v8, :cond_2

    .line 324
    sub-int v8, v7, v3

    div-int/lit8 v1, v8, 0x2

    .line 325
    .local v1, "childLeft":I
    iget-boolean v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-eqz v8, :cond_1

    iget v2, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    .line 327
    .local v2, "childTop":I
    :goto_1
    const/4 v8, 0x0

    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    add-int/2addr v9, v0

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    iget v11, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    add-int/2addr v11, v0

    .line 328
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v12

    add-int/2addr v11, v12

    .line 327
    invoke-virtual {v4, v8, v9, v10, v11}, Landroid/view/View;->layout(IIII)V

    .line 338
    :goto_2
    add-int v8, v1, v3

    add-int v9, v2, v0

    invoke-virtual {v5, v1, v2, v8, v9}, Landroid/view/View;->layout(IIII)V

    .line 339
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleHeight:I

    .line 340
    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleWidth:I

    goto :goto_0

    .line 325
    .end local v2    # "childTop":I
    :cond_1
    sub-int v8, v6, v0

    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    add-int v2, v8, v9

    goto :goto_1

    .line 330
    .end local v1    # "childLeft":I
    :cond_2
    iget-boolean v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-eqz v8, :cond_3

    iget v1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    .line 331
    .restart local v1    # "childLeft":I
    :goto_3
    sub-int v8, v6, v0

    div-int/lit8 v2, v8, 0x2

    .line 333
    .restart local v2    # "childTop":I
    iget v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    add-int/2addr v8, v3

    const/4 v9, 0x0

    iget v10, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    add-int/2addr v10, v3

    .line 334
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v11

    add-int/2addr v10, v11

    .line 335
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v11

    .line 333
    invoke-virtual {v4, v8, v9, v10, v11}, Landroid/view/View;->layout(IIII)V

    goto :goto_2

    .line 330
    .end local v1    # "childLeft":I
    .end local v2    # "childTop":I
    :cond_3
    sub-int v8, v7, v3

    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    add-int v1, v8, v9

    goto :goto_3
.end method

.method protected onMeasure(II)V
    .locals 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v9, 0x40000000    # 2.0f

    .line 250
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    .line 251
    .local v5, "widthSpecMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v6

    .line 253
    .local v6, "widthSpecSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 254
    .local v2, "heightSpecMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 256
    .local v3, "heightSpecSize":I
    if-eqz v5, :cond_0

    if-nez v2, :cond_1

    .line 257
    :cond_0
    new-instance v7, Ljava/lang/RuntimeException;

    const-string/jumbo v8, "SlidingDrawer cannot have UNSPECIFIED dimensions"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 260
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    .line 261
    .local v0, "handle":Landroid/view/View;
    invoke-virtual {p0, v0, p1, p2}, Lcom/vkontakte/android/ui/SlidingDrawer;->measureChild(Landroid/view/View;II)V

    .line 263
    iget-boolean v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v7, :cond_2

    .line 264
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    sub-int v7, v3, v7

    iget v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    sub-int v1, v7, v8

    .line 265
    .local v1, "height":I
    iget-object v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    invoke-static {v6, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 266
    invoke-static {v1, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    .line 265
    invoke-virtual {v7, v8, v9}, Landroid/view/View;->measure(II)V

    .line 273
    .end local v1    # "height":I
    :goto_0
    invoke-virtual {p0, v6, v3}, Lcom/vkontakte/android/ui/SlidingDrawer;->setMeasuredDimension(II)V

    .line 274
    return-void

    .line 268
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    sub-int v7, v6, v7

    iget v8, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    sub-int v4, v7, v8

    .line 269
    .local v4, "width":I
    iget-object v7, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mContent:Landroid/view/View;

    invoke-static {v4, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 270
    invoke-static {v3, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    .line 269
    invoke-virtual {v7, v8, v9}, Landroid/view/View;->measure(II)V

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 14
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 391
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mLocked:Z

    if-eqz v9, :cond_0

    .line 392
    const/4 v9, 0x1

    .line 469
    :goto_0
    return v9

    .line 395
    :cond_0
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTracking:Z

    if-eqz v9, :cond_1

    .line 396
    iget-object v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 397
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 398
    .local v0, "action":I
    packed-switch v0, :pswitch_data_0

    .line 469
    .end local v0    # "action":I
    :cond_1
    :goto_1
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTracking:Z

    if-nez v9, :cond_2

    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAnimating:Z

    if-nez v9, :cond_2

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v9

    if-eqz v9, :cond_18

    :cond_2
    const/4 v9, 0x1

    goto :goto_0

    .line 400
    .restart local v0    # "action":I
    :pswitch_0
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    if-eqz v9, :cond_3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    :goto_2
    float-to-int v9, v9

    iget v10, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTouchDelta:I

    sub-int/2addr v9, v10

    invoke-direct {p0, v9}, Lcom/vkontakte/android/ui/SlidingDrawer;->moveHandle(I)V

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v9

    goto :goto_2

    .line 404
    :pswitch_1
    iget-object v5, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 405
    .local v5, "velocityTracker":Landroid/view/VelocityTracker;
    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVelocityUnits:I

    invoke-virtual {v5, v9}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 407
    invoke-virtual {v5}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v8

    .line 408
    .local v8, "yVelocity":F
    invoke-virtual {v5}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v7

    .line 411
    .local v7, "xVelocity":F
    iget-boolean v6, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mVertical:Z

    .line 412
    .local v6, "vertical":Z
    if-eqz v6, :cond_a

    .line 413
    const/4 v9, 0x0

    cmpg-float v9, v8, v9

    if-gez v9, :cond_9

    const/4 v2, 0x1

    .line 414
    .local v2, "negative":Z
    :goto_3
    const/4 v9, 0x0

    cmpg-float v9, v7, v9

    if-gez v9, :cond_4

    .line 415
    neg-float v7, v7

    .line 417
    :cond_4
    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMinorVelocity:I

    int-to-float v9, v9

    cmpl-float v9, v7, v9

    if-lez v9, :cond_5

    .line 418
    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMinorVelocity:I

    int-to-float v7, v9

    .line 430
    :cond_5
    :goto_4
    float-to-double v10, v7

    float-to-double v12, v8

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v10

    double-to-float v4, v10

    .line 431
    .local v4, "velocity":F
    if-eqz v2, :cond_6

    .line 432
    neg-float v4, v4

    .line 435
    :cond_6
    iget-object v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    move-result v3

    .line 436
    .local v3, "top":I
    iget-object v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandle:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v1

    .line 438
    .local v1, "left":I
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v9

    iget v10, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumTapVelocity:I

    int-to-float v10, v10

    cmpg-float v9, v9, v10

    if-gez v9, :cond_16

    .line 439
    if-eqz v6, :cond_d

    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-eqz v9, :cond_7

    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTapThreshold:I

    iget v10, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    add-int/2addr v9, v10

    if-lt v3, v9, :cond_8

    :cond_7
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-nez v9, :cond_f

    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    .line 440
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getBottom()I

    move-result v10

    add-int/2addr v9, v10

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getTop()I

    move-result v10

    sub-int/2addr v9, v10

    iget v10, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleHeight:I

    sub-int/2addr v9, v10

    iget v10, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTapThreshold:I

    sub-int/2addr v9, v10

    if-le v3, v9, :cond_f

    .line 446
    :cond_8
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mAllowSingleTap:Z

    if-eqz v9, :cond_13

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->isOpened()Z

    move-result v9

    if-nez v9, :cond_13

    .line 447
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/ui/SlidingDrawer;->playSoundEffect(I)V

    .line 449
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-eqz v9, :cond_11

    .line 450
    if-eqz v6, :cond_10

    .end local v3    # "top":I
    :goto_5
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/SlidingDrawer;->animateClose(I)V

    goto/16 :goto_1

    .line 413
    .end local v1    # "left":I
    .end local v2    # "negative":Z
    .end local v4    # "velocity":F
    :cond_9
    const/4 v2, 0x0

    goto :goto_3

    .line 421
    :cond_a
    const/4 v9, 0x0

    cmpg-float v9, v7, v9

    if-gez v9, :cond_c

    const/4 v2, 0x1

    .line 422
    .restart local v2    # "negative":Z
    :goto_6
    const/4 v9, 0x0

    cmpg-float v9, v8, v9

    if-gez v9, :cond_b

    .line 423
    neg-float v8, v8

    .line 425
    :cond_b
    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMinorVelocity:I

    int-to-float v9, v9

    cmpl-float v9, v8, v9

    if-lez v9, :cond_5

    .line 426
    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mMaximumMinorVelocity:I

    int-to-float v8, v9

    goto :goto_4

    .line 421
    .end local v2    # "negative":Z
    :cond_c
    const/4 v2, 0x0

    goto :goto_6

    .line 440
    .restart local v1    # "left":I
    .restart local v2    # "negative":Z
    .restart local v3    # "top":I
    .restart local v4    # "velocity":F
    :cond_d
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-eqz v9, :cond_e

    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTapThreshold:I

    iget v10, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTopOffset:I

    add-int/2addr v9, v10

    if-lt v1, v9, :cond_8

    :cond_e
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-nez v9, :cond_f

    iget v9, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mBottomOffset:I

    .line 443
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getRight()I

    move-result v10

    add-int/2addr v9, v10

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->getLeft()I

    move-result v10

    sub-int/2addr v9, v10

    iget v10, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mHandleWidth:I

    sub-int/2addr v9, v10

    iget v10, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mTapThreshold:I

    sub-int/2addr v9, v10

    if-gt v1, v9, :cond_8

    .line 459
    :cond_f
    if-eqz v6, :cond_15

    .end local v3    # "top":I
    :goto_7
    const/4 v9, 0x0

    invoke-direct {p0, v3, v4, v9}, Lcom/vkontakte/android/ui/SlidingDrawer;->performFling(IFZ)V

    goto/16 :goto_1

    .restart local v3    # "top":I
    :cond_10
    move v3, v1

    .line 450
    goto :goto_5

    .line 452
    :cond_11
    if-eqz v6, :cond_12

    .end local v3    # "top":I
    :goto_8
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/SlidingDrawer;->animateOpen(I)V

    goto/16 :goto_1

    .restart local v3    # "top":I
    :cond_12
    move v3, v1

    goto :goto_8

    .line 455
    :cond_13
    if-eqz v6, :cond_14

    .end local v3    # "top":I
    :goto_9
    const/4 v9, 0x0

    invoke-direct {p0, v3, v4, v9}, Lcom/vkontakte/android/ui/SlidingDrawer;->performFling(IFZ)V

    goto/16 :goto_1

    .restart local v3    # "top":I
    :cond_14
    move v3, v1

    goto :goto_9

    :cond_15
    move v3, v1

    .line 459
    goto :goto_7

    .line 462
    :cond_16
    if-eqz v6, :cond_17

    .end local v3    # "top":I
    :goto_a
    const/4 v9, 0x0

    invoke-direct {p0, v3, v4, v9}, Lcom/vkontakte/android/ui/SlidingDrawer;->performFling(IFZ)V

    goto/16 :goto_1

    .restart local v3    # "top":I
    :cond_17
    move v3, v1

    goto :goto_a

    .line 469
    .end local v0    # "action":I
    .end local v1    # "left":I
    .end local v2    # "negative":Z
    .end local v3    # "top":I
    .end local v4    # "velocity":F
    .end local v5    # "velocityTracker":Landroid/view/VelocityTracker;
    .end local v6    # "vertical":Z
    .end local v7    # "xVelocity":F
    .end local v8    # "yVelocity":F
    :cond_18
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 398
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public open()V
    .locals 0

    .prologue
    .line 742
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->openDrawer()V

    .line 743
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->invalidate()V

    .line 744
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->requestLayout()V

    .line 745
    return-void
.end method

.method public setOnDrawerCloseListener(Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerCloseListener;)V
    .locals 0
    .param p1, "onDrawerCloseListener"    # Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerCloseListener;

    .prologue
    .line 846
    iput-object p1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerCloseListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerCloseListener;

    .line 847
    return-void
.end method

.method public setOnDrawerOpenListener(Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerOpenListener;)V
    .locals 0
    .param p1, "onDrawerOpenListener"    # Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerOpenListener;

    .prologue
    .line 837
    iput-object p1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerOpenListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerOpenListener;

    .line 838
    return-void
.end method

.method public setOnDrawerScrollListener(Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;)V
    .locals 0
    .param p1, "onDrawerScrollListener"    # Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;

    .prologue
    .line 858
    iput-object p1, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mOnDrawerScrollListener:Lcom/vkontakte/android/ui/SlidingDrawer$OnDrawerScrollListener;

    .line 859
    return-void
.end method

.method public toggle()V
    .locals 1

    .prologue
    .line 708
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mExpanded:Z

    if-nez v0, :cond_0

    .line 709
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->openDrawer()V

    .line 713
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->invalidate()V

    .line 714
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->requestLayout()V

    .line 715
    return-void

    .line 711
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SlidingDrawer;->closeDrawer()V

    goto :goto_0
.end method

.method public unlock()V
    .locals 1

    .prologue
    .line 887
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/SlidingDrawer;->mLocked:Z

    .line 888
    return-void
.end method
