.class public Lcom/vk/imageloader/view/zoomable/Attacher;
.super Ljava/lang/Object;
.source "Attacher.java"

# interfaces
.implements Lcom/vk/imageloader/view/zoomable/IAttacher;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;,
        Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;
    }
.end annotation


# static fields
.field private static final EDGE_BOTH:I = 0x2

.field private static final EDGE_LEFT:I = 0x0

.field private static final EDGE_NONE:I = -0x1

.field private static final EDGE_RIGHT:I = 0x1


# instance fields
.field private isZoomable:Z

.field private mAllowParentInterceptOnEdge:Z

.field private mBlockParentIntercept:Z

.field private mCurrentFlingRunnable:Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;

.field private final mDisplayRect:Landroid/graphics/RectF;

.field private mDraweeView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vk/imageloader/view/VKDraweeView",
            "<",
            "Lcom/facebook/drawee/generic/GenericDraweeHierarchy;",
            ">;>;"
        }
    .end annotation
.end field

.field private mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

.field private mImageInfoHeight:I

.field private mImageInfoWidth:I

.field private mLongClickListener:Landroid/view/View$OnLongClickListener;

.field private final mMatrix:Landroid/graphics/Matrix;

.field private final mMatrixValues:[F

.field private mMaxScale:F

.field private mMidScale:F

.field private mMinScale:F

.field private mPhotoTapListener:Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;

.field private mScaleChangeListener:Lcom/vk/imageloader/view/zoomable/OnScaleChangeListener;

.field private mScaleDragDetector:Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;

.field private mScrollEdge:I

.field private mViewTapListener:Lcom/vk/imageloader/view/zoomable/OnViewTapListener;

.field private mZoomDuration:J

.field private final mZoomInterpolator:Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>(Lcom/vk/imageloader/view/VKDraweeView;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/imageloader/view/VKDraweeView",
            "<",
            "Lcom/facebook/drawee/generic/GenericDraweeHierarchy;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    const/4 v3, 0x1

    const/4 v2, -0x1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrixValues:[F

    .line 32
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mDisplayRect:Landroid/graphics/RectF;

    .line 33
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mZoomInterpolator:Landroid/view/animation/Interpolator;

    .line 35
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMinScale:F

    .line 36
    const/high16 v0, 0x3fe00000    # 1.75f

    iput v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMidScale:F

    .line 37
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMaxScale:F

    .line 38
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mZoomDuration:J

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mBlockParentIntercept:Z

    .line 44
    iput-boolean v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mAllowParentInterceptOnEdge:Z

    .line 45
    const/4 v0, 0x2

    iput v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScrollEdge:I

    .line 46
    iput-boolean v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->isZoomable:Z

    .line 48
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrix:Landroid/graphics/Matrix;

    .line 49
    iput v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mImageInfoHeight:I

    iput v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mImageInfoWidth:I

    .line 59
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mDraweeView:Ljava/lang/ref/WeakReference;

    .line 60
    invoke-virtual {p1}, Lcom/vk/imageloader/view/VKDraweeView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    sget-object v1, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_CENTER:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 61
    invoke-virtual {p1, p0}, Lcom/vk/imageloader/view/VKDraweeView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 62
    new-instance v0, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;

    invoke-virtual {p1}, Lcom/vk/imageloader/view/VKDraweeView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;-><init>(Landroid/content/Context;Lcom/vk/imageloader/view/zoomable/OnScaleDragGestureListener;)V

    iput-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleDragDetector:Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;

    .line 63
    new-instance v0, Landroid/support/v4/view/GestureDetectorCompat;

    invoke-virtual {p1}, Lcom/vk/imageloader/view/VKDraweeView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/vk/imageloader/view/zoomable/Attacher$1;

    invoke-direct {v2, p0}, Lcom/vk/imageloader/view/zoomable/Attacher$1;-><init>(Lcom/vk/imageloader/view/zoomable/Attacher;)V

    invoke-direct {v0, v1, v2}, Landroid/support/v4/view/GestureDetectorCompat;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    .line 72
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    new-instance v1, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;

    invoke-direct {v1, p0}, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;-><init>(Lcom/vk/imageloader/view/zoomable/Attacher;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/GestureDetectorCompat;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 73
    return-void
.end method

.method static synthetic access$000(Lcom/vk/imageloader/view/zoomable/Attacher;)Landroid/view/View$OnLongClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/imageloader/view/zoomable/Attacher;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/imageloader/view/zoomable/Attacher;Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/imageloader/view/zoomable/Attacher;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # Ljava/lang/Runnable;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/zoomable/Attacher;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vk/imageloader/view/zoomable/Attacher;)J
    .locals 2
    .param p0, "x0"    # Lcom/vk/imageloader/view/zoomable/Attacher;

    .prologue
    .line 24
    iget-wide v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mZoomDuration:J

    return-wide v0
.end method

.method static synthetic access$300(Lcom/vk/imageloader/view/zoomable/Attacher;)Landroid/view/animation/Interpolator;
    .locals 1
    .param p0, "x0"    # Lcom/vk/imageloader/view/zoomable/Attacher;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mZoomInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/imageloader/view/zoomable/Attacher;)Landroid/graphics/Matrix;
    .locals 1
    .param p0, "x0"    # Lcom/vk/imageloader/view/zoomable/Attacher;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method private cancelFling()V
    .locals 1

    .prologue
    .line 541
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mCurrentFlingRunnable:Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;

    if-eqz v0, :cond_0

    .line 542
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mCurrentFlingRunnable:Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->cancelFling()V

    .line 543
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mCurrentFlingRunnable:Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;

    .line 545
    :cond_0
    return-void
.end method

.method private checkScale()V
    .locals 8

    .prologue
    .line 324
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v6

    .line 325
    .local v6, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-nez v6, :cond_1

    .line 340
    :cond_0
    :goto_0
    return-void

    .line 329
    :cond_1
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getScale()F

    move-result v0

    iget v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMinScale:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_2

    .line 330
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v7

    .line 331
    .local v7, "rect":Landroid/graphics/RectF;
    if-eqz v7, :cond_0

    .line 332
    new-instance v0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getScale()F

    move-result v2

    iget v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMinScale:F

    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    .line 333
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;-><init>(Lcom/vk/imageloader/view/zoomable/Attacher;FFFF)V

    .line 332
    invoke-virtual {v6, v0}, Lcom/vk/imageloader/view/VKDraweeView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 335
    .end local v7    # "rect":Landroid/graphics/RectF;
    :cond_2
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getScale()F

    move-result v0

    iget v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMaxScale:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 336
    new-instance v0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getScale()F

    move-result v2

    iget v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMaxScale:F

    .line 337
    invoke-virtual {v6}, Lcom/vk/imageloader/view/VKDraweeView;->getRight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v4, v1

    .line 338
    invoke-virtual {v6}, Lcom/vk/imageloader/view/VKDraweeView;->getBottom()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v5, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;-><init>(Lcom/vk/imageloader/view/zoomable/Attacher;FFFF)V

    .line 336
    invoke-virtual {v6, v0}, Lcom/vk/imageloader/view/VKDraweeView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private static checkZoomLevels(FFF)V
    .locals 2
    .param p0, "minZoom"    # F
    .param p1, "midZoom"    # F
    .param p2, "maxZoom"    # F

    .prologue
    .line 200
    cmpl-float v0, p0, p1

    if-ltz v0, :cond_0

    .line 201
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "MinZoom has to be less than MidZoom"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 202
    :cond_0
    cmpl-float v0, p1, p2

    if-ltz v0, :cond_1

    .line 203
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "MidZoom has to be less than MaxZoom"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 205
    :cond_1
    return-void
.end method

.method private getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .locals 5
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v2, -0x1

    const/4 v4, 0x0

    .line 297
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v0

    .line 298
    .local v0, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-eqz v0, :cond_0

    iget v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mImageInfoWidth:I

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mImageInfoHeight:I

    if-ne v1, v2, :cond_1

    .line 299
    :cond_0
    const/4 v1, 0x0

    .line 304
    :goto_0
    return-object v1

    .line 301
    :cond_1
    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mDisplayRect:Landroid/graphics/RectF;

    iget v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mImageInfoWidth:I

    int-to-float v2, v2

    iget v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mImageInfoHeight:I

    int-to-float v3, v3

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 302
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    iget-object v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->getActualImageBounds(Landroid/graphics/RectF;)V

    .line 303
    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 304
    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mDisplayRect:Landroid/graphics/RectF;

    goto :goto_0
.end method

.method private getMatrixValue(Landroid/graphics/Matrix;I)F
    .locals 1
    .param p1, "matrix"    # Landroid/graphics/Matrix;
    .param p2, "whichValue"    # I

    .prologue
    .line 232
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 233
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrixValues:[F

    aget v0, v0, p2

    return v0
.end method

.method private getViewHeight()I
    .locals 3

    .prologue
    .line 222
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v0

    .line 223
    .local v0, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-eqz v0, :cond_0

    .line 224
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getHeight()I

    move-result v1

    .line 225
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    .line 226
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    .line 228
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getViewWidth()I
    .locals 3

    .prologue
    .line 209
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v0

    .line 211
    .local v0, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-eqz v0, :cond_0

    .line 213
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getWidth()I

    move-result v1

    .line 214
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    .line 215
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    .line 218
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 548
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    .line 549
    invoke-virtual {p1, p2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 553
    :goto_0
    return-void

    .line 551
    :cond_0
    const-wide/16 v0, 0x10

    invoke-virtual {p1, p2, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private resetMatrix()V
    .locals 2

    .prologue
    .line 315
    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 316
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->checkMatrixBounds()Z

    .line 317
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v0

    .line 318
    .local v0, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-eqz v0, :cond_0

    .line 319
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->invalidate()V

    .line 321
    :cond_0
    return-void
.end method

.method private updateBaseMatrix()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 308
    iget v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mImageInfoWidth:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mImageInfoHeight:I

    if-ne v0, v1, :cond_0

    .line 312
    :goto_0
    return-void

    .line 311
    :cond_0
    invoke-direct {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->resetMatrix()V

    goto :goto_0
.end method


# virtual methods
.method public checkMatrixAndInvalidate()V
    .locals 2

    .prologue
    .line 248
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v0

    .line 250
    .local v0, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-nez v0, :cond_1

    .line 257
    :cond_0
    :goto_0
    return-void

    .line 254
    :cond_1
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->checkMatrixBounds()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 255
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->invalidate()V

    goto :goto_0
.end method

.method public checkMatrixBounds()Z
    .locals 13

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/high16 v12, 0x40000000    # 2.0f

    const/4 v11, 0x0

    .line 260
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v3

    .line 261
    .local v3, "rect":Landroid/graphics/RectF;
    if-nez v3, :cond_0

    .line 293
    :goto_0
    return v7

    .line 265
    :cond_0
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v2

    .line 266
    .local v2, "height":F
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v6

    .line 267
    .local v6, "width":F
    const/4 v0, 0x0

    .line 268
    .local v0, "deltaX":F
    const/4 v1, 0x0

    .line 269
    .local v1, "deltaY":F
    invoke-direct {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getViewHeight()I

    move-result v4

    .line 271
    .local v4, "viewHeight":I
    int-to-float v9, v4

    cmpg-float v9, v2, v9

    if-gtz v9, :cond_2

    .line 272
    int-to-float v9, v4

    sub-float/2addr v9, v2

    div-float/2addr v9, v12

    iget v10, v3, Landroid/graphics/RectF;->top:F

    sub-float v1, v9, v10

    .line 278
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getViewWidth()I

    move-result v5

    .line 279
    .local v5, "viewWidth":I
    int-to-float v9, v5

    cmpg-float v9, v6, v9

    if-gtz v9, :cond_4

    .line 280
    int-to-float v7, v5

    sub-float/2addr v7, v6

    div-float/2addr v7, v12

    iget v9, v3, Landroid/graphics/RectF;->left:F

    sub-float v0, v7, v9

    .line 281
    const/4 v7, 0x2

    iput v7, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScrollEdge:I

    .line 292
    :goto_2
    iget-object v7, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v7, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    move v7, v8

    .line 293
    goto :goto_0

    .line 273
    .end local v5    # "viewWidth":I
    :cond_2
    iget v9, v3, Landroid/graphics/RectF;->top:F

    cmpl-float v9, v9, v11

    if-lez v9, :cond_3

    .line 274
    iget v9, v3, Landroid/graphics/RectF;->top:F

    neg-float v1, v9

    goto :goto_1

    .line 275
    :cond_3
    iget v9, v3, Landroid/graphics/RectF;->bottom:F

    int-to-float v10, v4

    cmpg-float v9, v9, v10

    if-gez v9, :cond_1

    .line 276
    int-to-float v9, v4

    iget v10, v3, Landroid/graphics/RectF;->bottom:F

    sub-float v1, v9, v10

    goto :goto_1

    .line 282
    .restart local v5    # "viewWidth":I
    :cond_4
    iget v9, v3, Landroid/graphics/RectF;->left:F

    cmpl-float v9, v9, v11

    if-lez v9, :cond_5

    .line 283
    iget v9, v3, Landroid/graphics/RectF;->left:F

    neg-float v0, v9

    .line 284
    iput v7, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScrollEdge:I

    goto :goto_2

    .line 285
    :cond_5
    iget v7, v3, Landroid/graphics/RectF;->right:F

    int-to-float v9, v5

    cmpg-float v7, v7, v9

    if-gez v7, :cond_6

    .line 286
    int-to-float v7, v5

    iget v9, v3, Landroid/graphics/RectF;->right:F

    sub-float v0, v7, v9

    .line 287
    iput v8, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScrollEdge:I

    goto :goto_2

    .line 289
    :cond_6
    const/4 v7, -0x1

    iput v7, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScrollEdge:I

    goto :goto_2
.end method

.method public getDisplayRect()Landroid/graphics/RectF;
    .locals 1

    .prologue
    .line 242
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->checkMatrixBounds()Z

    .line 243
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getDrawMatrix()Landroid/graphics/Matrix;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vk/imageloader/view/VKDraweeView",
            "<",
            "Lcom/facebook/drawee/generic/GenericDraweeHierarchy;",
            ">;"
        }
    .end annotation

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mDraweeView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKDraweeView;

    return-object v0
.end method

.method public getMaximumScale()F
    .locals 1

    .prologue
    .line 110
    iget v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMaxScale:F

    return v0
.end method

.method public getMediumScale()F
    .locals 1

    .prologue
    .line 104
    iget v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMidScale:F

    return v0
.end method

.method public getMinimumScale()F
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMinScale:F

    return v0
.end method

.method public getOnPhotoTapListener()Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mPhotoTapListener:Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;

    return-object v0
.end method

.method public getOnViewTapListener()Lcom/vk/imageloader/view/zoomable/OnViewTapListener;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mViewTapListener:Lcom/vk/imageloader/view/zoomable/OnViewTapListener;

    return-object v0
.end method

.method public getScale()F
    .locals 6

    .prologue
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 129
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrix:Landroid/graphics/Matrix;

    const/4 v1, 0x0

    .line 130
    invoke-direct {p0, v0, v1}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMatrixValue(Landroid/graphics/Matrix;I)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float v0, v0

    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrix:Landroid/graphics/Matrix;

    const/4 v2, 0x3

    .line 131
    invoke-direct {p0, v1, v2}, Lcom/vk/imageloader/view/zoomable/Attacher;->getMatrixValue(Landroid/graphics/Matrix;I)F

    move-result v1

    float-to-double v2, v1

    .line 130
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-float v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    .line 129
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public isZoomable()Z
    .locals 1

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->isZoomable:Z

    return v0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 556
    invoke-direct {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->cancelFling()V

    .line 557
    return-void
.end method

.method public onDrag(FF)V
    .locals 5
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .prologue
    const/4 v4, 0x1

    .line 357
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v0

    .line 359
    .local v0, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleDragDetector:Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->isScaling()Z

    move-result v2

    if-nez v2, :cond_0

    .line 360
    iget-object v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 361
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->checkMatrixAndInvalidate()V

    .line 363
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 364
    .local v1, "parent":Landroid/view/ViewParent;
    if-nez v1, :cond_1

    .line 380
    .end local v1    # "parent":Landroid/view/ViewParent;
    :cond_0
    :goto_0
    return-void

    .line 368
    .restart local v1    # "parent":Landroid/view/ViewParent;
    :cond_1
    iget-boolean v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mAllowParentInterceptOnEdge:Z

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleDragDetector:Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;

    .line 369
    invoke-virtual {v2}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->isScaling()Z

    move-result v2

    if-nez v2, :cond_4

    iget-boolean v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mBlockParentIntercept:Z

    if-nez v2, :cond_4

    .line 371
    iget v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScrollEdge:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    iget v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScrollEdge:I

    if-nez v2, :cond_2

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v2

    if-gez v2, :cond_3

    :cond_2
    iget v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScrollEdge:I

    if-ne v2, v4, :cond_0

    const/high16 v2, -0x40800000    # -1.0f

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_0

    .line 374
    :cond_3
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_0

    .line 377
    :cond_4
    invoke-interface {v1, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_0
.end method

.method public onFling(FFFF)V
    .locals 6
    .param p1, "startX"    # F
    .param p2, "startY"    # F
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 384
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v0

    .line 385
    .local v0, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-nez v0, :cond_0

    .line 393
    :goto_0
    return-void

    .line 389
    :cond_0
    new-instance v1, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;-><init>(Lcom/vk/imageloader/view/zoomable/Attacher;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mCurrentFlingRunnable:Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;

    .line 390
    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mCurrentFlingRunnable:Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;

    invoke-direct {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getViewWidth()I

    move-result v2

    invoke-direct {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getViewHeight()I

    move-result v3

    float-to-int v4, p3

    float-to-int v5, p4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->fling(IIII)V

    .line 392
    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mCurrentFlingRunnable:Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKDraweeView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public onScale(FFF)V
    .locals 1
    .param p1, "scaleFactor"    # F
    .param p2, "focusX"    # F
    .param p3, "focusY"    # F

    .prologue
    .line 343
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleChangeListener:Lcom/vk/imageloader/view/zoomable/OnScaleChangeListener;

    if-eqz v0, :cond_0

    .line 344
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleChangeListener:Lcom/vk/imageloader/view/zoomable/OnScaleChangeListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/vk/imageloader/view/zoomable/OnScaleChangeListener;->onScaleChange(FFF)V

    .line 347
    :cond_0
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 348
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->checkMatrixAndInvalidate()V

    .line 349
    return-void
.end method

.method public onScaleEnd()V
    .locals 0

    .prologue
    .line 352
    invoke-direct {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->checkScale()V

    .line 353
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 396
    iget-boolean v9, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->isZoomable:Z

    if-nez v9, :cond_0

    .line 433
    :goto_0
    return v8

    .line 400
    :cond_0
    invoke-static {p2}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 401
    .local v0, "action":I
    packed-switch v0, :pswitch_data_0

    .line 420
    :cond_1
    :goto_1
    :pswitch_0
    iget-object v9, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleDragDetector:Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;

    invoke-virtual {v9}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->isScaling()Z

    move-result v6

    .line 421
    .local v6, "wasScaling":Z
    iget-object v9, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleDragDetector:Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;

    invoke-virtual {v9}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->isDragging()Z

    move-result v5

    .line 423
    .local v5, "wasDragging":Z
    iget-object v9, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleDragDetector:Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;

    invoke-virtual {v9, p2}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 425
    .local v1, "handled":Z
    if-nez v6, :cond_4

    iget-object v9, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleDragDetector:Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;

    invoke-virtual {v9}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->isScaling()Z

    move-result v9

    if-nez v9, :cond_4

    move v3, v7

    .line 426
    .local v3, "noScale":Z
    :goto_2
    if-nez v5, :cond_5

    iget-object v9, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleDragDetector:Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;

    invoke-virtual {v9}, Lcom/vk/imageloader/view/zoomable/ScaleDragDetector;->isDragging()Z

    move-result v9

    if-nez v9, :cond_5

    move v2, v7

    .line 427
    .local v2, "noDrag":Z
    :goto_3
    if-eqz v3, :cond_6

    if-eqz v2, :cond_6

    :goto_4
    iput-boolean v7, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mBlockParentIntercept:Z

    .line 429
    iget-object v7, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    invoke-virtual {v7, p2}, Landroid/support/v4/view/GestureDetectorCompat;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 430
    const/4 v1, 0x1

    :cond_2
    move v8, v1

    .line 433
    goto :goto_0

    .line 403
    .end local v1    # "handled":Z
    .end local v2    # "noDrag":Z
    .end local v3    # "noScale":Z
    .end local v5    # "wasDragging":Z
    .end local v6    # "wasScaling":Z
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    .line 404
    .local v4, "parent":Landroid/view/ViewParent;
    if-eqz v4, :cond_3

    .line 405
    invoke-interface {v4, v7}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 407
    :cond_3
    invoke-direct {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->cancelFling()V

    goto :goto_1

    .line 412
    .end local v4    # "parent":Landroid/view/ViewParent;
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    .line 413
    .restart local v4    # "parent":Landroid/view/ViewParent;
    if-eqz v4, :cond_1

    .line 414
    invoke-interface {v4, v8}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_1

    .end local v4    # "parent":Landroid/view/ViewParent;
    .restart local v1    # "handled":Z
    .restart local v5    # "wasDragging":Z
    .restart local v6    # "wasScaling":Z
    :cond_4
    move v3, v8

    .line 425
    goto :goto_2

    .restart local v3    # "noScale":Z
    :cond_5
    move v2, v8

    .line 426
    goto :goto_3

    .restart local v2    # "noDrag":Z
    :cond_6
    move v7, v8

    .line 427
    goto :goto_4

    .line 401
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .locals 0
    .param p1, "allow"    # Z

    .prologue
    .line 166
    iput-boolean p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mAllowParentInterceptOnEdge:Z

    .line 167
    return-void
.end method

.method public setMaximumScale(F)V
    .locals 2
    .param p1, "maximumScale"    # F

    .prologue
    .line 114
    iget v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMinScale:F

    iget v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMidScale:F

    invoke-static {v0, v1, p1}, Lcom/vk/imageloader/view/zoomable/Attacher;->checkZoomLevels(FFF)V

    .line 115
    iput p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMaxScale:F

    .line 116
    return-void
.end method

.method public setMediumScale(F)V
    .locals 2
    .param p1, "mediumScale"    # F

    .prologue
    .line 119
    iget v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMinScale:F

    iget v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMaxScale:F

    invoke-static {v0, p1, v1}, Lcom/vk/imageloader/view/zoomable/Attacher;->checkZoomLevels(FFF)V

    .line 120
    iput p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMidScale:F

    .line 121
    return-void
.end method

.method public setMinimumScale(F)V
    .locals 2
    .param p1, "minimumScale"    # F

    .prologue
    .line 124
    iget v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMidScale:F

    iget v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMaxScale:F

    invoke-static {p1, v0, v1}, Lcom/vk/imageloader/view/zoomable/Attacher;->checkZoomLevels(FFF)V

    .line 125
    iput p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMinScale:F

    .line 126
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 2
    .param p1, "newOnDoubleTapListener"    # Landroid/view/GestureDetector$OnDoubleTapListener;

    .prologue
    .line 76
    if-eqz p1, :cond_0

    .line 77
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/view/GestureDetectorCompat;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 81
    :goto_0
    return-void

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    new-instance v1, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;

    invoke-direct {v1, p0}, Lcom/vk/imageloader/view/zoomable/DefaultOnDoubleTapListener;-><init>(Lcom/vk/imageloader/view/zoomable/Attacher;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/GestureDetectorCompat;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    goto :goto_0
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 174
    iput-object p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 175
    return-void
.end method

.method public setOnPhotoTapListener(Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mPhotoTapListener:Lcom/vk/imageloader/view/zoomable/OnPhotoTapListener;

    .line 179
    return-void
.end method

.method public setOnScaleChangeListener(Lcom/vk/imageloader/view/zoomable/OnScaleChangeListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vk/imageloader/view/zoomable/OnScaleChangeListener;

    .prologue
    .line 170
    iput-object p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mScaleChangeListener:Lcom/vk/imageloader/view/zoomable/OnScaleChangeListener;

    .line 171
    return-void
.end method

.method public setOnViewTapListener(Lcom/vk/imageloader/view/zoomable/OnViewTapListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vk/imageloader/view/zoomable/OnViewTapListener;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mViewTapListener:Lcom/vk/imageloader/view/zoomable/OnViewTapListener;

    .line 183
    return-void
.end method

.method public setScale(F)V
    .locals 1
    .param p1, "scale"    # F

    .prologue
    .line 135
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->setScale(FZ)V

    .line 136
    return-void
.end method

.method public setScale(FFFZ)V
    .locals 7
    .param p1, "scale"    # F
    .param p2, "focalX"    # F
    .param p3, "focalY"    # F
    .param p4, "animate"    # Z

    .prologue
    .line 146
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v6

    .line 148
    .local v6, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-eqz v6, :cond_0

    iget v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMinScale:F

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMaxScale:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1

    .line 158
    :cond_0
    :goto_0
    return-void

    .line 152
    :cond_1
    if-eqz p4, :cond_2

    .line 153
    new-instance v0, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getScale()F

    move-result v2

    move-object v1, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/vk/imageloader/view/zoomable/Attacher$AnimatedZoomRunnable;-><init>(Lcom/vk/imageloader/view/zoomable/Attacher;FFFF)V

    invoke-virtual {v6, v0}, Lcom/vk/imageloader/view/VKDraweeView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 155
    :cond_2
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 156
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->checkMatrixAndInvalidate()V

    goto :goto_0
.end method

.method public setScale(FZ)V
    .locals 4
    .param p1, "scale"    # F
    .param p2, "animate"    # Z

    .prologue
    .line 139
    invoke-virtual {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v0

    .line 140
    .local v0, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getRight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->getBottom()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v1, v2, v3}, Lcom/vk/imageloader/view/zoomable/Attacher;->setScale(FFFZ)V

    .line 143
    :cond_0
    return-void
.end method

.method public setZoomTransitionDuration(J)V
    .locals 3
    .param p1, "duration"    # J

    .prologue
    .line 161
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    const-wide/16 p1, 0xc8

    .line 162
    :cond_0
    iput-wide p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mZoomDuration:J

    .line 163
    return-void
.end method

.method public setZoomable(Z)V
    .locals 0
    .param p1, "zoomable"    # Z

    .prologue
    .line 94
    iput-boolean p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->isZoomable:Z

    .line 95
    return-void
.end method

.method public update(II)V
    .locals 0
    .param p1, "imageInfoWidth"    # I
    .param p2, "imageInfoHeight"    # I

    .prologue
    .line 194
    iput p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mImageInfoWidth:I

    .line 195
    iput p2, p0, Lcom/vk/imageloader/view/zoomable/Attacher;->mImageInfoHeight:I

    .line 196
    invoke-direct {p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->updateBaseMatrix()V

    .line 197
    return-void
.end method
