.class public Lcom/vk/attachpicker/screen/ViewerScreen;
.super Lcom/vk/core/simplescreen/BaseScreen;
.source "ViewerScreen.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;,
        Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;,
        Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    }
.end annotation


# static fields
.field public static final ANIMATION_DURATION:I = 0xfa

.field private static final TAG:Ljava/lang/String; = "ImageViewer"

.field private static final handler:Landroid/os/Handler;

.field public static final interpolator:Landroid/view/animation/Interpolator;


# instance fields
.field private actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

.field private final actionLock:Lcom/vk/core/util/TimeoutLock;

.field private animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

.field private final animationInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

.field private final backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

.field private final backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

.field private bottomPadding:I

.field private bottomPanel:Landroid/view/View;

.field private containerView:Landroid/widget/FrameLayout;

.field private currentPosition:I

.field private dragY:F

.field private draggingDown:Z

.field private editButton:Lcom/vk/attachpicker/widget/EditButton;

.field private galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

.field private final isVisible:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private maximumVelocity:I

.field private minimumVelocity:I

.field private moveStartX:F

.field private final openIndex:I

.field private final orientationLocker:Lcom/vk/attachpicker/util/OrientationLocker;

.field private parentActivity:Landroid/app/Activity;

.field private photoViewerProvider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

.field private final photos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/MediaStoreEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final preventStyling:Z

.field private final preventStylingPhoto:Z

.field private final preventStylingVideo:Z

.field private final provider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

.field private final selectionContext:Lcom/vk/attachpicker/SelectionContext;

.field private final selectionUpdateListener:Lcom/vk/attachpicker/events/NotificationListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/attachpicker/events/NotificationListener",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final singleMode:Z

.field private final thumb:Z

.field private final totalCount:I

.field private translationY:F

.field private velocityTracker:Landroid/view/VelocityTracker;

.field private videoMaxLengthMs:J

.field private windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 45
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vk/attachpicker/screen/ViewerScreen;->handler:Landroid/os/Handler;

    .line 91
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    sput-object v0, Lcom/vk/attachpicker/screen/ViewerScreen;->interpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;ILcom/vk/attachpicker/SelectionContext;Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;ZZZJZZ)V
    .locals 4
    .param p2, "openIndex"    # I
    .param p3, "selectionContext"    # Lcom/vk/attachpicker/SelectionContext;
    .param p4, "provider"    # Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;
    .param p5, "preventStyling"    # Z
    .param p6, "preventStylingPhoto"    # Z
    .param p7, "preventStylingVideo"    # Z
    .param p8, "videoMaxLengthMs"    # J
    .param p10, "singleMode"    # Z
    .param p11, "thumb"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/MediaStoreEntry;",
            ">;I",
            "Lcom/vk/attachpicker/SelectionContext;",
            "Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;",
            "ZZZJZZ)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p1, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/MediaStoreEntry;>;"
    invoke-direct {p0}, Lcom/vk/core/simplescreen/BaseScreen;-><init>()V

    .line 47
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const v1, 0x7f0f00bc

    invoke-static {v1}, Lcom/vk/attachpicker/Picker;->color(I)I

    move-result v1

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    .line 48
    new-instance v0, Lcom/vk/attachpicker/screen/ViewerScreen$1;

    const v1, 0x7f0f00bc

    invoke-static {v1}, Lcom/vk/attachpicker/Picker;->color(I)I

    move-result v1

    invoke-direct {v0, p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen$1;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;I)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    .line 54
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionLock:Lcom/vk/core/util/TimeoutLock;

    .line 55
    new-instance v0, Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-direct {v0}, Lcom/vk/attachpicker/util/OrientationLocker;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->orientationLocker:Lcom/vk/attachpicker/util/OrientationLocker;

    .line 72
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->currentPosition:I

    .line 92
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animationInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 93
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->isVisible:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 95
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->draggingDown:Z

    .line 96
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->translationY:F

    .line 103
    iput p2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->openIndex:I

    .line 104
    iput-object p1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photos:Ljava/util/ArrayList;

    .line 105
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->totalCount:I

    .line 106
    iput-object p4, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->provider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    .line 107
    iput-object p3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    .line 108
    iput-boolean p5, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->preventStyling:Z

    .line 109
    iput-boolean p6, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->preventStylingPhoto:Z

    .line 110
    iput-boolean p7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->preventStylingVideo:Z

    .line 111
    iput-boolean p10, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->singleMode:Z

    .line 112
    iput-boolean p11, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->thumb:Z

    .line 113
    iput-wide p8, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->videoMaxLengthMs:J

    .line 115
    invoke-static {p0, p3}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;Lcom/vk/attachpicker/SelectionContext;)Lcom/vk/attachpicker/events/NotificationListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionUpdateListener:Lcom/vk/attachpicker/events/NotificationListener;

    .line 120
    return-void
.end method

.method private _internalOnTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 14
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/high16 v13, 0x40000000    # 2.0f

    const/high16 v12, 0x3f800000    # 1.0f

    const/high16 v11, 0x3f000000    # 0.5f

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 979
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->isAnimationInProgress()Z

    move-result v9

    if-nez v9, :cond_0

    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photoViewerProvider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    if-nez v9, :cond_1

    .line 1058
    :cond_0
    :goto_0
    return v8

    .line 983
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    if-eqz v9, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    const/4 v10, 0x5

    if-ne v9, v10, :cond_3

    .line 984
    :cond_2
    iget-boolean v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->draggingDown:Z

    if-nez v9, :cond_0

    .line 985
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v9

    if-ne v9, v7, :cond_0

    .line 986
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    iput v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->moveStartX:F

    .line 987
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    iput v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->dragY:F

    .line 988
    iput-boolean v8, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->draggingDown:Z

    .line 989
    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->orientationLocker:Lcom/vk/attachpicker/util/OrientationLocker;

    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    invoke-virtual {v7, v9}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 991
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v7

    iput-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    .line 992
    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 995
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    const/4 v10, 0x2

    if-ne v9, v10, :cond_8

    .line 996
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v9

    if-ne v9, v7, :cond_0

    .line 997
    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    if-eqz v9, :cond_4

    .line 998
    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1001
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v9

    iget v10, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->moveStartX:F

    sub-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 1002
    .local v1, "dx":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    iget v10, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->dragY:F

    sub-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 1003
    .local v2, "dy":F
    iget-boolean v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->draggingDown:Z

    if-nez v9, :cond_5

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getCurrentZoom()F

    move-result v9

    cmpl-float v9, v9, v12

    if-nez v9, :cond_5

    const/16 v9, 0x1e

    invoke-static {v9}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v9

    int-to-float v9, v9

    cmpl-float v9, v2, v9

    if-ltz v9, :cond_5

    div-float v9, v2, v13

    cmpl-float v9, v9, v1

    if-lez v9, :cond_5

    .line 1004
    iput-boolean v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->draggingDown:Z

    .line 1005
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    iput v8, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->dragY:F

    move v8, v7

    .line 1006
    goto/16 :goto_0

    .line 1007
    :cond_5
    iget-boolean v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->draggingDown:Z

    if-eqz v7, :cond_7

    .line 1008
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    iget v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->dragY:F

    sub-float/2addr v7, v9

    iput v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->translationY:F

    .line 1009
    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    invoke-virtual {v7}, Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;->getHeight()I

    move-result v7

    int-to-float v7, v7

    div-float v3, v7, v13

    .line 1010
    .local v3, "maxValue":F
    iget v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->translationY:F

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    invoke-static {v7, v3}, Ljava/lang/Math;->min(FF)F

    move-result v7

    div-float/2addr v7, v3

    sub-float v0, v12, v7

    .line 1012
    .local v0, "dragScale":F
    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    const/high16 v9, 0x42fe0000    # 127.0f

    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v10, v0

    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v9

    float-to-int v9, v9

    invoke-virtual {v7, v9}, Landroid/graphics/drawable/ColorDrawable;->setAlpha(I)V

    .line 1013
    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    const/high16 v9, 0x42fe0000    # 127.0f

    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v10, v0

    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v9

    float-to-int v9, v9

    invoke-virtual {v7, v9}, Landroid/graphics/drawable/ColorDrawable;->setAlpha(I)V

    .line 1014
    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    iget v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->translationY:F

    invoke-virtual {v7, v9}, Lcom/vk/attachpicker/widget/VkViewPager;->setTranslationY(F)V

    .line 1016
    const v4, 0x3f666666    # 0.9f

    .line 1018
    .local v4, "minScale":F
    cmpl-float v7, v0, v11

    if-ltz v7, :cond_6

    cmpg-float v7, v0, v12

    if-gtz v7, :cond_6

    .line 1019
    const v7, 0x3f666666    # 0.9f

    const v9, 0x3dccccd0    # 0.100000024f

    sub-float v10, v0, v11

    div-float/2addr v10, v11

    mul-float/2addr v9, v10

    add-float v5, v7, v9

    .line 1023
    .local v5, "targetScale":F
    :goto_1
    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    invoke-virtual {v7, v5}, Lcom/vk/attachpicker/widget/VkViewPager;->setScaleX(F)V

    .line 1024
    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    invoke-virtual {v7, v5}, Lcom/vk/attachpicker/widget/VkViewPager;->setScaleY(F)V

    goto/16 :goto_0

    .line 1021
    .end local v5    # "targetScale":F
    :cond_6
    const v5, 0x3f666666    # 0.9f

    .restart local v5    # "targetScale":F
    goto :goto_1

    .line 1026
    .end local v0    # "dragScale":F
    .end local v3    # "maxValue":F
    .end local v4    # "minScale":F
    .end local v5    # "targetScale":F
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    iput v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->moveStartX:F

    goto/16 :goto_0

    .line 1029
    .end local v1    # "dx":F
    .end local v2    # "dy":F
    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    const/4 v10, 0x3

    if-eq v9, v10, :cond_9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    if-eq v9, v7, :cond_9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    const/4 v10, 0x6

    if-ne v9, v10, :cond_0

    .line 1031
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    if-eq v9, v7, :cond_a

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    const/4 v10, 0x6

    if-ne v9, v10, :cond_b

    .line 1032
    :cond_a
    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    if-eqz v9, :cond_b

    .line 1033
    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1034
    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    const/16 v10, 0x3e8

    invoke-virtual {v9, v10}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 1038
    :cond_b
    iget-boolean v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->draggingDown:Z

    if-eqz v9, :cond_10

    .line 1039
    const/4 v6, 0x1

    .line 1040
    .local v6, "validVelocity":Z
    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    if-eqz v9, :cond_c

    .line 1041
    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    iget v10, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->minimumVelocity:I

    int-to-float v10, v10

    cmpl-float v9, v9, v10

    if-lez v9, :cond_e

    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    iget v10, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->maximumVelocity:I

    int-to-float v10, v10

    cmpg-float v9, v9, v10

    if-gez v9, :cond_e

    move v6, v7

    .line 1043
    :cond_c
    :goto_2
    iget v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->dragY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    sub-float/2addr v7, v9

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    invoke-virtual {v9}, Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;->getHeight()I

    move-result v9

    int-to-float v9, v9

    const/high16 v10, 0x40c00000    # 6.0f

    div-float/2addr v9, v10

    cmpl-float v7, v7, v9

    if-gtz v7, :cond_d

    if-eqz v6, :cond_f

    .line 1044
    :cond_d
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->animateOut()V

    .line 1048
    :goto_3
    iput-boolean v8, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->draggingDown:Z

    .line 1053
    .end local v6    # "validVelocity":Z
    :goto_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v7

    const/4 v9, 0x3

    if-ne v7, v9, :cond_0

    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    if-eqz v7, :cond_0

    .line 1054
    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7}, Landroid/view/VelocityTracker;->recycle()V

    .line 1055
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->velocityTracker:Landroid/view/VelocityTracker;

    goto/16 :goto_0

    .restart local v6    # "validVelocity":Z
    :cond_e
    move v6, v8

    .line 1041
    goto :goto_2

    .line 1046
    :cond_f
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->animateViewPagerToDefaultPosition()V

    goto :goto_3

    .line 1050
    .end local v6    # "validVelocity":Z
    :cond_10
    iget-object v7, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->orientationLocker:Lcom/vk/attachpicker/util/OrientationLocker;

    iget-object v9, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    invoke-virtual {v7, v9}, Lcom/vk/attachpicker/util/OrientationLocker;->unlockOrientation(Landroid/app/Activity;)V

    goto :goto_4
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ViewerToolbar;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/screen/ViewerScreen;IZ)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/vk/attachpicker/screen/ViewerScreen;->onPhotoOpened(IZ)V

    return-void
.end method

.method static synthetic access$1000()I
    .locals 1

    .prologue
    .line 40
    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->getStatusBarHeight()I

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vk/attachpicker/screen/ViewerScreen;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPadding:I

    return v0
.end method

.method static synthetic access$1300(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/graphics/drawable/ColorDrawable;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPanel:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/graphics/drawable/ColorDrawable;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vk/attachpicker/screen/ViewerScreen;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photos:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/vk/attachpicker/screen/ViewerScreen;Ljava/util/ArrayList;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/ViewerScreen;->initPagerAdapter(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/vk/attachpicker/screen/ViewerScreen;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->openIndex:I

    return v0
.end method

.method static synthetic access$200()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/vk/attachpicker/screen/ViewerScreen;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$2002(Lcom/vk/attachpicker/screen/ViewerScreen;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;
    .param p1, "x1"    # F

    .prologue
    .line 40
    iput p1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->translationY:F

    return p1
.end method

.method static synthetic access$2100(Lcom/vk/attachpicker/screen/ViewerScreen;Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;
    .param p1, "x1"    # Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/ViewerScreen;->onPhotoClosed(Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;)V

    return-void
.end method

.method static synthetic access$2200(Lcom/vk/attachpicker/screen/ViewerScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->closeImageViewer()V

    return-void
.end method

.method static synthetic access$2300(Lcom/vk/attachpicker/screen/ViewerScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->closeImageViewerInternal()V

    return-void
.end method

.method static synthetic access$2400(Lcom/vk/attachpicker/screen/ViewerScreen;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;
    .param p1, "x1"    # Landroid/view/MotionEvent;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/ViewerScreen;->_internalOnTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/vk/attachpicker/screen/ViewerScreen;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;
    .param p1, "x1"    # I

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/ViewerScreen;->setUpPhotoViewAttachers(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/EditButton;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/attachpicker/screen/ViewerScreen;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/ViewerScreen;->setControlsEnabled(Z)V

    return-void
.end method

.method static synthetic access$600(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/util/OrientationLocker;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->orientationLocker:Lcom/vk/attachpicker/util/OrientationLocker;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->containerView:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/VkViewPager;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/ViewerScreen;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    return-object v0
.end method

.method static synthetic access$lambda$0(Lcom/vk/attachpicker/screen/ViewerScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->closeEditorAnimation()V

    return-void
.end method

.method static synthetic access$lambda$1(Lcom/vk/attachpicker/screen/ViewerScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->closeEditorAnimation()V

    return-void
.end method

.method static synthetic access$lambda$2(Lcom/vk/attachpicker/screen/ViewerScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->closeEditorAnimation()V

    return-void
.end method

.method private animateViewPagerToDefaultPosition()V
    .locals 11

    .prologue
    const/16 v10, 0xff

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 910
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 911
    .local v0, "animatorSet":Landroid/animation/AnimatorSet;
    const/4 v1, 0x5

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    const-string/jumbo v3, "translationY"

    new-array v4, v8, [F

    const/4 v5, 0x0

    aput v5, v4, v7

    .line 912
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v7

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    const-string/jumbo v3, "scaleY"

    new-array v4, v8, [F

    aput v6, v4, v7

    .line 913
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v8

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    const-string/jumbo v3, "scaleX"

    new-array v4, v8, [F

    aput v6, v4, v7

    .line 914
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v9

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    const-string/jumbo v4, "alpha"

    new-array v5, v9, [I

    iget-object v6, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    .line 915
    invoke-virtual {v6}, Landroid/graphics/drawable/ColorDrawable;->getAlpha()I

    move-result v6

    aput v6, v5, v7

    aput v10, v5, v8

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    const-string/jumbo v4, "alpha"

    new-array v5, v9, [I

    iget-object v6, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawable:Landroid/graphics/drawable/ColorDrawable;

    .line 916
    invoke-virtual {v6}, Landroid/graphics/drawable/ColorDrawable;->getAlpha()I

    move-result v6

    aput v6, v5, v7

    aput v10, v5, v8

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 911
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 918
    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 919
    new-instance v1, Lcom/vk/attachpicker/screen/ViewerScreen$12;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/ViewerScreen$12;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 926
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 927
    return-void
.end method

.method private closeEditorAnimation()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x2

    .line 373
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->orientationLocker:Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 374
    invoke-virtual {p0, v8}, Lcom/vk/attachpicker/screen/ViewerScreen;->setAnimationInProgress(Z)V

    .line 375
    invoke-direct {p0, v7}, Lcom/vk/attachpicker/screen/ViewerScreen;->setControlsEnabled(Z)V

    .line 377
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 378
    .local v0, "set":Landroid/animation/AnimatorSet;
    sget-object v1, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 380
    const/4 v1, 0x3

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    const-string/jumbo v3, "alpha"

    new-array v4, v6, [F

    fill-array-data v4, :array_0

    .line 381
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v7

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    const-string/jumbo v3, "alpha"

    new-array v4, v6, [F

    fill-array-data v4, :array_1

    .line 382
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v8

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPanel:Landroid/view/View;

    const-string/jumbo v3, "translationY"

    new-array v4, v6, [F

    iget-object v5, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPanel:Landroid/view/View;

    .line 383
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    aput v5, v4, v7

    const/4 v5, 0x0

    aput v5, v4, v8

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v6

    .line 380
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 385
    new-instance v1, Lcom/vk/attachpicker/screen/ViewerScreen$5;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/ViewerScreen$5;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 393
    const-wide/16 v2, 0xaf

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 394
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 395
    return-void

    .line 380
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 381
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private closeImageViewer()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 931
    :try_start_0
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 932
    .local v1, "set":Landroid/animation/AnimatorSet;
    const/4 v2, 0x1

    new-array v2, v2, [Landroid/animation/Animator;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    const-string/jumbo v5, "alpha"

    const/4 v6, 0x2

    new-array v6, v6, [F

    fill-array-data v6, :array_0

    .line 933
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v2, v3

    .line 932
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 935
    const-wide/16 v2, 0x53

    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 937
    new-instance v2, Lcom/vk/attachpicker/screen/ViewerScreen$13;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/screen/ViewerScreen$13;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;)V

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 951
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 955
    .end local v1    # "set":Landroid/animation/AnimatorSet;
    :goto_0
    return-void

    .line 952
    :catch_0
    move-exception v0

    .line 953
    .local v0, "e":Ljava/lang/Exception;
    new-array v2, v9, [Ljava/lang/Object;

    const-string/jumbo v3, "ImageViewer"

    aput-object v3, v2, v7

    aput-object v0, v2, v8

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0

    .line 932
    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private closeImageViewerInternal()V
    .locals 4

    .prologue
    .line 959
    const/4 v1, 0x0

    :try_start_0
    iput v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->translationY:F

    .line 960
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/VkViewPager;->setTranslationY(F)V

    .line 961
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/VkViewPager;->setScaleX(F)V

    .line 962
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/VkViewPager;->setScaleY(F)V

    .line 964
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/ClippingView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 965
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->realDismiss()V

    .line 966
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    if-eqz v1, :cond_0

    .line 967
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/ClippingView;->setAlpha(F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 972
    :cond_0
    :goto_0
    return-void

    .line 969
    :catch_0
    move-exception v0

    .line 970
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "ImageViewer"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private getCurrentMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .locals 2

    .prologue
    .line 891
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photos:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/VkViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    return-object v0
.end method

.method private getCurrentZoom()F
    .locals 2

    .prologue
    .line 883
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getCurrentZoomableImageView()Lcom/vk/attachpicker/widget/ImageViewerImageView;

    move-result-object v0

    .line 884
    .local v0, "currentImageView":Lcom/vk/attachpicker/widget/ImageViewerImageView;
    if-eqz v0, :cond_0

    .line 885
    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getScale()F

    move-result v1

    .line 887
    :goto_0
    return v1

    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0
.end method

.method private getCurrentZoomableImageView()Lcom/vk/attachpicker/widget/ImageViewerImageView;
    .locals 3

    .prologue
    .line 870
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    if-eqz v1, :cond_0

    .line 871
    const/4 v1, 0x1

    new-array v0, v1, [Lcom/vk/attachpicker/widget/ImageViewerImageView;

    .line 872
    .local v0, "array":[Lcom/vk/attachpicker/widget/ImageViewerImageView;
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    invoke-static {p0, v0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$6;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;[Lcom/vk/attachpicker/widget/ImageViewerImageView;)Lcom/vk/core/util/Screen$ViewCallback;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/core/util/Screen;->iterateOverViews(Landroid/view/ViewGroup;Lcom/vk/core/util/Screen$ViewCallback;)V

    .line 877
    const/4 v1, 0x0

    aget-object v1, v0, v1

    .line 879
    .end local v0    # "array":[Lcom/vk/attachpicker/widget/ImageViewerImageView;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getStatusBarHeight()I
    .locals 6

    .prologue
    .line 1078
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0004

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1079
    const/4 v1, 0x0

    .line 1086
    .local v0, "resourceId":I
    .local v1, "result":I
    :cond_0
    :goto_0
    return v1

    .line 1081
    .end local v0    # "resourceId":I
    .end local v1    # "result":I
    :cond_1
    const/16 v2, 0x18

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    .line 1082
    .restart local v1    # "result":I
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string/jumbo v3, "status_bar_height"

    const-string/jumbo v4, "dimen"

    const-string/jumbo v5, "android"

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1083
    .restart local v0    # "resourceId":I
    if-lez v0, :cond_0

    .line 1084
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto :goto_0
.end method

.method private initPagerAdapter(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/MediaStoreEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 838
    .local p1, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/MediaStoreEntry;>;"
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    new-instance v1, Lcom/vk/attachpicker/screen/ViewerScreen$10;

    invoke-direct {v1, p0, p1}, Lcom/vk/attachpicker/screen/ViewerScreen$10;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 867
    return-void
.end method

.method static synthetic lambda$null$9(Lcom/vk/attachpicker/screen/TrimScreen;)V
    .locals 0
    .param p0, "trimScreen"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 273
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->showMaxLengthToast()V

    .line 274
    return-void
.end method

.method private onPhotoClosed(Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;)V
    .locals 2
    .param p1, "object"    # Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    .prologue
    .line 825
    if-eqz p1, :cond_0

    .line 826
    iget-object v0, p1, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->containerView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 828
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->currentPosition:I

    .line 829
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    new-instance v1, Lcom/vk/attachpicker/screen/ViewerScreen$9;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/ViewerScreen$9;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;->post(Ljava/lang/Runnable;)Z

    .line 835
    return-void
.end method

.method private onPhotoOpened(IZ)V
    .locals 7
    .param p1, "index"    # I
    .param p2, "animated"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 810
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photoViewerProvider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    if-eqz v0, :cond_0

    .line 811
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photoViewerProvider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    iget v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->currentPosition:I

    invoke-interface {v0, v3, p1}, Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;->onPhotoSwitch(II)V

    .line 813
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    iget-object v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    const v4, 0x7f0804c6

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    add-int/lit8 v6, p1, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    iget v6, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->totalCount:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {v3, v4, v5}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setTitle(Ljava/lang/String;)V

    .line 814
    iget-object v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    iget-object v4, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    invoke-virtual {v4, v0}, Lcom/vk/attachpicker/SelectionContext;->isSelected(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Z

    move-result v0

    invoke-virtual {v3, v0}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setChecked(Z)V

    .line 815
    iget-object v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    iget-boolean v0, v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isVideo:Z

    invoke-virtual {v3, v0}, Lcom/vk/attachpicker/widget/EditButton;->setTrimMode(Z)V

    .line 816
    iget-boolean v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->preventStyling:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->preventStylingPhoto:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    iget-boolean v0, v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isVideo:Z

    if-eqz v0, :cond_2

    :cond_1
    iget-boolean v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->preventStylingVideo:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    iget-boolean v0, v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isVideo:Z

    if-eqz v0, :cond_3

    .line 817
    :cond_2
    invoke-direct {p0, v2, p2}, Lcom/vk/attachpicker/screen/ViewerScreen;->setEditButtonVisibility(ZZ)V

    .line 821
    :goto_0
    iput p1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->currentPosition:I

    .line 822
    return-void

    .line 819
    :cond_3
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v0}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isCorrupted()Z

    move-result v0

    if-nez v0, :cond_4

    move v0, v1

    :goto_1
    invoke-direct {p0, v0, p2}, Lcom/vk/attachpicker/screen/ViewerScreen;->setEditButtonVisibility(ZZ)V

    goto :goto_0

    :cond_4
    move v0, v2

    goto :goto_1
.end method

.method private openEditorAnimation(Ljava/lang/Runnable;)V
    .locals 9
    .param p1, "runAfter"    # Ljava/lang/Runnable;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 344
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->orientationLocker:Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 345
    invoke-virtual {p0, v6}, Lcom/vk/attachpicker/screen/ViewerScreen;->setAnimationInProgress(Z)V

    .line 346
    invoke-direct {p0, v8}, Lcom/vk/attachpicker/screen/ViewerScreen;->setControlsEnabled(Z)V

    .line 348
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getCurrentZoomableImageView()Lcom/vk/attachpicker/widget/ImageViewerImageView;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 349
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getCurrentZoomableImageView()Lcom/vk/attachpicker/widget/ImageViewerImageView;

    move-result-object v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2, v6}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->setScale(FZ)V

    .line 352
    :cond_0
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 353
    .local v0, "set":Landroid/animation/AnimatorSet;
    sget-object v1, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 355
    const/4 v1, 0x3

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    const-string/jumbo v3, "alpha"

    new-array v4, v7, [F

    fill-array-data v4, :array_0

    .line 356
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v8

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    const-string/jumbo v3, "alpha"

    new-array v4, v7, [F

    fill-array-data v4, :array_1

    .line 357
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPanel:Landroid/view/View;

    const-string/jumbo v3, "translationY"

    new-array v4, v7, [F

    const/4 v5, 0x0

    aput v5, v4, v8

    iget-object v5, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPanel:Landroid/view/View;

    .line 358
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    aput v5, v4, v6

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v7

    .line 355
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 360
    new-instance v1, Lcom/vk/attachpicker/screen/ViewerScreen$4;

    invoke-direct {v1, p0, p1}, Lcom/vk/attachpicker/screen/ViewerScreen$4;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 368
    const-wide/16 v2, 0xaf

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 369
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 370
    return-void

    .line 355
    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 356
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private setControlsEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 807
    return-void
.end method

.method private setEditButtonVisibility(ZZ)V
    .locals 6
    .param p1, "visible"    # Z
    .param p2, "animated"    # Z

    .prologue
    const-wide/16 v4, 0xc8

    const/4 v3, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 314
    if-eqz p2, :cond_1

    .line 315
    if-eqz p1, :cond_0

    .line 316
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-virtual {v0, v3}, Lcom/vk/attachpicker/widget/EditButton;->setVisibility(I)V

    .line 317
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/EditButton;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 318
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 319
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 320
    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 321
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 341
    :goto_0
    return-void

    .line 323
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/EditButton;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 324
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/vk/attachpicker/screen/ViewerScreen$3;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/ViewerScreen$3;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;)V

    .line 325
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 330
    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0

    .line 333
    :cond_1
    if-eqz p1, :cond_2

    .line 334
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/widget/EditButton;->setAlpha(F)V

    .line 335
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-virtual {v0, v3}, Lcom/vk/attachpicker/widget/EditButton;->setVisibility(I)V

    goto :goto_0

    .line 337
    :cond_2
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/EditButton;->setAlpha(F)V

    .line 338
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/EditButton;->setVisibility(I)V

    goto :goto_0
.end method

.method private setUpPhotoViewAttachers(I)V
    .locals 2
    .param p1, "currentPosition"    # I

    .prologue
    .line 895
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    if-eqz v0, :cond_0

    .line 896
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    new-instance v1, Lcom/vk/attachpicker/screen/ViewerScreen$11;

    invoke-direct {v1, p0, p1}, Lcom/vk/attachpicker/screen/ViewerScreen$11;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;I)V

    invoke-static {v0, v1}, Lcom/vk/core/util/Screen;->iterateOverViews(Landroid/view/ViewGroup;Lcom/vk/core/util/Screen$ViewCallback;)V

    .line 907
    :cond_0
    return-void
.end method


# virtual methods
.method public final $(I)Landroid/view/View;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 975
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public animateIn()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 398
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->isAnimationInProgress()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 578
    :goto_0
    return-void

    .line 402
    :cond_0
    iget v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->openIndex:I

    invoke-direct {p0, v2, v4}, Lcom/vk/attachpicker/screen/ViewerScreen;->onPhotoOpened(IZ)V

    .line 405
    :try_start_0
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->provider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->provider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    iget v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->openIndex:I

    invoke-interface {v2, v3}, Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;->getPlaceForPhoto(I)Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->provider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    iget v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->openIndex:I

    invoke-interface {v2, v3}, Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;->getPlaceForPhoto(I)Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->hasImage()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 407
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->provider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    iget v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->openIndex:I

    invoke-interface {v2, v3}, Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;->getPlaceForPhoto(I)Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-result-object v1

    .line 408
    .local v1, "object":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->provider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    iput-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photoViewerProvider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    .line 411
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    iget-object v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    invoke-static {v2, v3}, Lcom/vk/core/util/CompatUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 412
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/ColorDrawable;->setAlpha(I)V

    .line 413
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPanel:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 414
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/EditButton;->setAlpha(F)V

    .line 415
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setAlpha(F)V

    .line 416
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/ClippingView;->setAlpha(F)V

    .line 418
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->containerView:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    new-instance v3, Lcom/vk/attachpicker/screen/ViewerScreen$6;

    invoke-direct {v3, p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen$6;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 571
    .end local v1    # "object":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    :catch_0
    move-exception v0

    .line 572
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string/jumbo v3, "ImageViewer"

    aput-object v3, v2, v4

    aput-object v0, v2, v5

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 573
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->closeImageViewerInternal()V

    .line 574
    invoke-virtual {p0, v4}, Lcom/vk/attachpicker/screen/ViewerScreen;->setIsVisible(Z)V

    .line 575
    invoke-virtual {p0, v4}, Lcom/vk/attachpicker/screen/ViewerScreen;->setAnimationInProgress(Z)V

    goto :goto_0

    .line 548
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v2, 0x0

    :try_start_1
    iput-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photoViewerProvider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    .line 550
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    const/16 v3, 0xff

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/ColorDrawable;->setAlpha(I)V

    .line 551
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setAlpha(F)V

    .line 552
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPanel:Landroid/view/View;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 553
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/EditButton;->setAlpha(F)V

    .line 555
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->photos:Ljava/util/ArrayList;

    invoke-direct {p0, v2}, Lcom/vk/attachpicker/screen/ViewerScreen;->initPagerAdapter(Ljava/util/ArrayList;)V

    .line 558
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    iget v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->openIndex:I

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/VkViewPager;->setCurrentItem(I)V

    .line 559
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/VkViewPager;->setVisibility(I)V

    .line 560
    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/ClippingView;->setVisibility(I)V

    .line 561
    sget-object v2, Lcom/vk/attachpicker/screen/ViewerScreen;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/vk/attachpicker/screen/ViewerScreen$7;

    invoke-direct {v3, p0}, Lcom/vk/attachpicker/screen/ViewerScreen$7;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 567
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/vk/attachpicker/screen/ViewerScreen;->setControlsEnabled(Z)V

    .line 568
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/vk/attachpicker/screen/ViewerScreen;->setIsVisible(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public animateOut()V
    .locals 40

    .prologue
    .line 582
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    move-object/from16 v32, v0

    if-eqz v32, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->isAnimationInProgress()Z

    move-result v32

    if-eqz v32, :cond_1

    .line 762
    :cond_0
    :goto_0
    return-void

    .line 586
    :cond_1
    const/16 v21, 0x0

    .line 588
    .local v21, "placeProviderObject":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->photoViewerProvider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    move-object/from16 v32, v0

    if-eqz v32, :cond_f

    .line 590
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->photoViewerProvider:Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->currentPosition:I

    move/from16 v33, v0

    invoke-interface/range {v32 .. v33}, Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;->getPlaceForPhoto(I)Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-result-object v21

    .line 591
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getCurrentZoom()F

    move-result v15

    .line 592
    .local v15, "currentZoom":F
    const/16 v31, 0x0

    .line 593
    .local v31, "zoomDisplayRect":Landroid/graphics/RectF;
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getCurrentZoomableImageView()Lcom/vk/attachpicker/widget/ImageViewerImageView;

    move-result-object v9

    .line 594
    .local v9, "centerImage":Lcom/vk/attachpicker/widget/ImageViewerImageView;
    if-eqz v9, :cond_2

    .line 595
    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v31

    .line 599
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    move-object/from16 v33, v0

    invoke-static/range {v32 .. v33}, Lcom/vk/core/util/CompatUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 600
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->orientationLocker:Lcom/vk/attachpicker/util/OrientationLocker;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    move-object/from16 v33, v0

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 601
    const/16 v32, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->setAnimationInProgress(Z)V

    .line 602
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/ClippingView;->setVisibility(I)V

    .line 603
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v32, v0

    const/16 v33, 0x4

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->setVisibility(I)V

    .line 604
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 605
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->setControlsEnabled(Z)V

    .line 608
    const/16 v16, 0x0

    .line 609
    .local v16, "drawRegion":Landroid/graphics/RectF;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/vk/attachpicker/widget/ClippingView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v19

    .line 610
    .local v19, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v21, :cond_a

    invoke-virtual/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->hasImage()Z

    move-result v32

    if-eqz v32, :cond_a

    .line 611
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    move-object/from16 v32, v0

    .line 612
    invoke-virtual/range {v32 .. v32}, Lcom/vk/attachpicker/widget/LocalImageView;->getWidth()I

    move-result v32

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/vk/attachpicker/widget/LocalImageView;->getHeight()I

    move-result v33

    move-object/from16 v0, v21

    iget v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->thumbImageWidth:I

    move/from16 v34, v0

    move-object/from16 v0, v21

    iget v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->thumbImageHeight:I

    move/from16 v35, v0

    const/16 v36, 0x0

    .line 611
    invoke-static/range {v32 .. v36}, Lcom/vk/attachpicker/widget/LocalImageView;->computeBounds(IIIIZ)Landroid/graphics/RectF;

    move-result-object v16

    .line 615
    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v32, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v33, v0

    sub-float v32, v32, v33

    move/from16 v0, v32

    float-to-int v0, v0

    move/from16 v32, v0

    move/from16 v0, v32

    move-object/from16 v1, v19

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 616
    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v32, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v33, v0

    sub-float v32, v32, v33

    move/from16 v0, v32

    float-to-int v0, v0

    move/from16 v32, v0

    move/from16 v0, v32

    move-object/from16 v1, v19

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 618
    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->hasImage()Z

    move-result v32

    if-eqz v32, :cond_9

    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getImageAspectRatio()F

    move-result v32

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/RectF;->width()F

    move-result v33

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/RectF;->height()F

    move-result v34

    div-float v33, v33, v34

    sub-float v32, v32, v33

    invoke-static/range {v32 .. v32}, Ljava/lang/Math;->abs(F)F

    move-result v32

    const v33, 0x3a83126f    # 0.001f

    cmpg-float v32, v32, v33

    if-gez v32, :cond_9

    .line 619
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v33

    const/16 v34, 0x1

    invoke-virtual/range {v32 .. v34}, Lcom/vk/attachpicker/widget/ClippingView;->setImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Z)V

    .line 620
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    move-object/from16 v32, v0

    .line 621
    invoke-virtual/range {v32 .. v32}, Lcom/vk/attachpicker/widget/LocalImageView;->getWidth()I

    move-result v32

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/vk/attachpicker/widget/LocalImageView;->getHeight()I

    move-result v33

    .line 622
    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getImageWidth()I

    move-result v34

    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getImageHeight()I

    move-result v35

    const/16 v36, 0x0

    .line 620
    invoke-static/range {v32 .. v36}, Lcom/vk/attachpicker/widget/LocalImageView;->computeBounds(IIIIZ)Landroid/graphics/RectF;

    move-result-object v32

    move-object/from16 v0, v16

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 634
    :cond_3
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ClippingView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 636
    invoke-static {}, Lcom/vk/core/util/Screen;->width()I

    move-result v32

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v33, v0

    move/from16 v0, v33

    int-to-float v0, v0

    move/from16 v33, v0

    div-float v24, v32, v33

    .line 637
    .local v24, "scaleX":F
    invoke-static {}, Lcom/vk/core/util/Screen;->height()I

    move-result v32

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->getStatusBarHeight()I

    move-result v33

    sub-int v32, v32, v33

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPadding:I

    move/from16 v33, v0

    sub-int v32, v32, v33

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v33, v0

    move/from16 v0, v33

    int-to-float v0, v0

    move/from16 v33, v0

    div-float v25, v32, v33

    .line 638
    .local v25, "scaleY":F
    cmpl-float v32, v24, v25

    if-lez v32, :cond_b

    move/from16 v23, v25

    .line 639
    .local v23, "scale2":F
    :goto_2
    move-object/from16 v0, v19

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v32, v0

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    mul-float v32, v32, v15

    mul-float v32, v32, v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->getScaleX()F

    move-result v33

    mul-float v28, v32, v33

    .line 640
    .local v28, "width":F
    move-object/from16 v0, v19

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v32, v0

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    mul-float v32, v32, v15

    mul-float v32, v32, v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->getScaleY()F

    move-result v33

    mul-float v18, v32, v33

    .line 641
    .local v18, "height":F
    invoke-static {}, Lcom/vk/core/util/Screen;->width()I

    move-result v32

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    sub-float v32, v32, v28

    const/high16 v33, 0x40000000    # 2.0f

    div-float v29, v32, v33

    .line 642
    .local v29, "xPos":F
    invoke-static {}, Lcom/vk/core/util/Screen;->height()I

    move-result v32

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->getStatusBarHeight()I

    move-result v33

    sub-int v32, v32, v33

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    sub-float v32, v32, v18

    const/high16 v33, 0x40000000    # 2.0f

    div-float v30, v32, v33

    .line 643
    .local v30, "yPos":F
    const/high16 v32, 0x3f800000    # 1.0f

    cmpl-float v32, v15, v32

    if-eqz v32, :cond_4

    if-nez v31, :cond_c

    .line 644
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ClippingView;->setTranslationX(F)V

    .line 645
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->translationY:F

    move/from16 v33, v0

    add-float v33, v33, v30

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPadding:I

    move/from16 v34, v0

    div-int/lit8 v34, v34, 0x2

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    sub-float v33, v33, v34

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/ClippingView;->setTranslationY(F)V

    .line 655
    :cond_5
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    mul-float v33, v15, v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v34, v0

    invoke-virtual/range {v34 .. v34}, Lcom/vk/attachpicker/widget/VkViewPager;->getScaleX()F

    move-result v34

    mul-float v33, v33, v34

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/ClippingView;->setScaleX(F)V

    .line 656
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    mul-float v33, v15, v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v34, v0

    invoke-virtual/range {v34 .. v34}, Lcom/vk/attachpicker/widget/VkViewPager;->getScaleY()F

    move-result v34

    mul-float v33, v33, v34

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/ClippingView;->setScaleY(F)V

    .line 659
    new-instance v8, Landroid/animation/AnimatorSet;

    invoke-direct {v8}, Landroid/animation/AnimatorSet;-><init>()V

    .line 660
    .local v8, "animatorSet":Landroid/animation/AnimatorSet;
    if-eqz v21, :cond_d

    .line 662
    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v32, v0

    invoke-static/range {v32 .. v32}, Ljava/lang/Math;->abs(F)F

    move-result v32

    move/from16 v0, v32

    float-to-int v11, v0

    .line 663
    .local v11, "clipHorizontal":I
    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v32, v0

    invoke-static/range {v32 .. v32}, Ljava/lang/Math;->abs(F)F

    move-result v32

    move/from16 v0, v32

    float-to-int v13, v0

    .line 665
    .local v13, "clipVertical":I
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    move-object/from16 v32, v0

    invoke-static/range {v32 .. v32}, Lcom/vk/attachpicker/util/Utils;->getXOnScreen(Landroid/view/View;)I

    move-result v26

    .line 666
    .local v26, "viewX":I
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    move-object/from16 v32, v0

    invoke-static/range {v32 .. v32}, Lcom/vk/attachpicker/util/Utils;->getYOnScreen(Landroid/view/View;)I

    move-result v32

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->getStatusBarHeight()I

    move-result v33

    sub-int v27, v32, v33

    .line 668
    .local v27, "viewY":I
    const/16 v32, 0x2

    move/from16 v0, v32

    new-array v14, v0, [I

    .line 669
    .local v14, "coords2":[I
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->parentView:Landroid/view/View;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    invoke-virtual {v0, v14}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 671
    const/16 v32, 0x1

    aget v32, v14, v32

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->getStatusBarHeight()I

    move-result v33

    sub-int v32, v32, v33

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v33, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v34, v0

    add-float v33, v33, v34

    sub-float v32, v32, v33

    move/from16 v0, v32

    float-to-int v12, v0

    .line 672
    .local v12, "clipTop":I
    if-gez v12, :cond_6

    .line 673
    const/4 v12, 0x0

    .line 675
    :cond_6
    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v32, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v33, v0

    add-float v32, v32, v33

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v33, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v34, v0

    sub-float v33, v33, v34

    add-float v32, v32, v33

    const/16 v33, 0x1

    aget v33, v14, v33

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->parentView:Landroid/view/View;

    move-object/from16 v34, v0

    invoke-virtual/range {v34 .. v34}, Landroid/view/View;->getHeight()I

    move-result v34

    add-int v33, v33, v34

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->getStatusBarHeight()I

    move-result v34

    sub-int v33, v33, v34

    move/from16 v0, v33

    int-to-float v0, v0

    move/from16 v33, v0

    sub-float v32, v32, v33

    move/from16 v0, v32

    float-to-int v10, v0

    .line 676
    .local v10, "clipBottom":I
    if-gez v10, :cond_7

    .line 677
    const/4 v10, 0x0

    .line 680
    :cond_7
    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 681
    invoke-static {v10, v13}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 683
    const/16 v32, 0xb

    move/from16 v0, v32

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/high16 v38, 0x3f800000    # 1.0f

    aput v38, v36, v37

    .line 684
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    const/16 v33, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/high16 v38, 0x3f800000    # 1.0f

    aput v38, v36, v37

    .line 685
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    const/16 v33, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    const/16 v37, 0x0

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v38, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v39, v0

    add-float v38, v38, v39

    aput v38, v36, v37

    .line 686
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    const/16 v33, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    const/16 v37, 0x0

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v38, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v39, v0

    add-float v38, v38, v39

    aput v38, v36, v37

    .line 687
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    const/16 v33, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    move-object/from16 v34, v0

    const-string/jumbo v35, "alpha"

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [I

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v38, 0x0

    aput v38, v36, v37

    .line 688
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    const/16 v33, 0x5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v34, v0

    sget-object v35, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_HORIZONTAL:Landroid/util/Property;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [I

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput v11, v36, v37

    .line 689
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    const/16 v33, 0x6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v34, v0

    sget-object v35, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_TOP:Landroid/util/Property;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [I

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput v12, v36, v37

    .line 690
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    const/16 v33, 0x7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v34, v0

    sget-object v35, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_BOTTOM:Landroid/util/Property;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [I

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput v10, v36, v37

    .line 691
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    const/16 v33, 0x8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPanel:Landroid/view/View;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    fill-array-data v36, :array_0

    .line 692
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    const/16 v33, 0x9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    fill-array-data v36, :array_1

    .line 693
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    const/16 v33, 0xa

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    fill-array-data v36, :array_2

    .line 694
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v32, v33

    .line 683
    move-object/from16 v0, v32

    invoke-virtual {v8, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 707
    .end local v10    # "clipBottom":I
    .end local v11    # "clipHorizontal":I
    .end local v12    # "clipTop":I
    .end local v13    # "clipVertical":I
    .end local v14    # "coords2":[I
    .end local v26    # "viewX":I
    .end local v27    # "viewY":I
    :goto_4
    move-object/from16 v22, v21

    .line 708
    .local v22, "ppo":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    const-wide/16 v32, 0xfa

    move-wide/from16 v0, v32

    invoke-virtual {v8, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 709
    new-instance v32, Lcom/vk/attachpicker/screen/ViewerScreen$8;

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/screen/ViewerScreen$8;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;)V

    move-object/from16 v0, v32

    invoke-virtual {v8, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 729
    sget-object v32, Lcom/vk/attachpicker/screen/ViewerScreen;->interpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, v32

    invoke-virtual {v8, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 730
    const-wide/16 v32, 0x10

    move-wide/from16 v0, v32

    invoke-virtual {v8, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 731
    invoke-virtual {v8}, Landroid/animation/AnimatorSet;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 746
    .end local v8    # "animatorSet":Landroid/animation/AnimatorSet;
    .end local v9    # "centerImage":Lcom/vk/attachpicker/widget/ImageViewerImageView;
    .end local v15    # "currentZoom":F
    .end local v16    # "drawRegion":Landroid/graphics/RectF;
    .end local v18    # "height":F
    .end local v19    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v22    # "ppo":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    .end local v23    # "scale2":F
    .end local v24    # "scaleX":F
    .end local v25    # "scaleY":F
    .end local v28    # "width":F
    .end local v29    # "xPos":F
    .end local v30    # "yPos":F
    .end local v31    # "zoomDisplayRect":Landroid/graphics/RectF;
    :catch_0
    move-exception v17

    .line 747
    .local v17, "e":Ljava/lang/Exception;
    const/16 v32, 0x2

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    const-string/jumbo v34, "ImageViewer"

    aput-object v34, v32, v33

    const/16 v33, 0x1

    aput-object v17, v32, v33

    invoke-static/range {v32 .. v32}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 749
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vk/attachpicker/screen/ViewerScreen;->translationY:F

    .line 750
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->setTranslationY(F)V

    .line 751
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v32, v0

    const/high16 v33, 0x3f800000    # 1.0f

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->setScaleX(F)V

    .line 752
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v32, v0

    const/high16 v33, 0x3f800000    # 1.0f

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->setScaleY(F)V

    .line 753
    if-eqz v21, :cond_8

    .line 754
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->containerView:Landroid/view/View;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    invoke-virtual/range {v32 .. v33}, Landroid/view/View;->setVisibility(I)V

    .line 756
    :cond_8
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->closeImageViewerInternal()V

    .line 758
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->orientationLocker:Lcom/vk/attachpicker/util/OrientationLocker;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    move-object/from16 v33, v0

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/util/OrientationLocker;->unlockOrientation(Landroid/app/Activity;)V

    .line 759
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->setIsVisible(Z)V

    .line 760
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->setAnimationInProgress(Z)V

    goto/16 :goto_0

    .line 624
    .end local v17    # "e":Ljava/lang/Exception;
    .restart local v9    # "centerImage":Lcom/vk/attachpicker/widget/ImageViewerImageView;
    .restart local v15    # "currentZoom":F
    .restart local v16    # "drawRegion":Landroid/graphics/RectF;
    .restart local v19    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .restart local v31    # "zoomDisplayRect":Landroid/graphics/RectF;
    :cond_9
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v33

    const/16 v34, 0x0

    invoke-virtual/range {v32 .. v34}, Lcom/vk/attachpicker/widget/ClippingView;->setImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Z)V

    goto/16 :goto_1

    .line 627
    :cond_a
    if-eqz v9, :cond_3

    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->hasImage()Z

    move-result v32

    if-eqz v32, :cond_3

    .line 628
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v33

    const/16 v34, 0x1

    invoke-virtual/range {v32 .. v34}, Lcom/vk/attachpicker/widget/ClippingView;->setImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Z)V

    .line 630
    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getWidth()I

    move-result v32

    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getHeight()I

    move-result v33

    .line 631
    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getImageWidth()I

    move-result v34

    invoke-virtual {v9}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getImageHeight()I

    move-result v35

    const/16 v36, 0x0

    .line 629
    invoke-static/range {v32 .. v36}, Lcom/vk/attachpicker/widget/LocalImageView;->computeBounds(IIIIZ)Landroid/graphics/RectF;

    move-result-object v16

    goto/16 :goto_1

    .restart local v24    # "scaleX":F
    .restart local v25    # "scaleY":F
    :cond_b
    move/from16 v23, v24

    .line 638
    goto/16 :goto_2

    .line 646
    .restart local v18    # "height":F
    .restart local v23    # "scale2":F
    .restart local v28    # "width":F
    .restart local v29    # "xPos":F
    .restart local v30    # "yPos":F
    :cond_c
    if-eqz v31, :cond_5

    .line 647
    new-instance v20, Landroid/graphics/RectF;

    add-float v32, v29, v28

    add-float v33, v30, v18

    move-object/from16 v0, v20

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v32

    move/from16 v4, v33

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 649
    .local v20, "normalizedAnimRect":Landroid/graphics/RectF;
    invoke-virtual/range {v31 .. v31}, Landroid/graphics/RectF;->centerX()F

    move-result v32

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/RectF;->centerX()F

    move-result v33

    sub-float v6, v32, v33

    .line 650
    .local v6, "_translationX":F
    invoke-virtual/range {v31 .. v31}, Landroid/graphics/RectF;->centerY()F

    move-result v32

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/RectF;->centerY()F

    move-result v33

    sub-float v32, v32, v33

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->getStatusBarHeight()I

    move-result v33

    move/from16 v0, v33

    int-to-float v0, v0

    move/from16 v33, v0

    add-float v7, v32, v33

    .line 652
    .local v7, "_translationY":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    add-float v33, v29, v6

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/ClippingView;->setTranslationX(F)V

    .line 653
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v32, v0

    add-float v33, v30, v7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPadding:I

    move/from16 v34, v0

    div-int/lit8 v34, v34, 0x2

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    sub-float v33, v33, v34

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/ClippingView;->setTranslationY(F)V

    goto/16 :goto_3

    .line 697
    .end local v6    # "_translationX":F
    .end local v7    # "_translationY":F
    .end local v20    # "normalizedAnimRect":Landroid/graphics/RectF;
    .restart local v8    # "animatorSet":Landroid/animation/AnimatorSet;
    :cond_d
    const/16 v32, 0x6

    move/from16 v0, v32

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v33, v0

    const/16 v32, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    move-object/from16 v34, v0

    const-string/jumbo v35, "alpha"

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [I

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v38, 0x0

    aput v38, v36, v37

    .line 698
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v33, v32

    const/16 v32, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v38, 0x0

    aput v38, v36, v37

    .line 699
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v33, v32

    const/16 v34, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    move-object/from16 v35, v0

    sget-object v36, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/16 v32, 0x1

    move/from16 v0, v32

    new-array v0, v0, [F

    move-object/from16 v37, v0

    const/16 v38, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->translationY:F

    move/from16 v32, v0

    const/16 v39, 0x0

    cmpl-float v32, v32, v39

    if-ltz v32, :cond_e

    .line 700
    invoke-static {}, Lcom/vk/core/util/Screen;->height()I

    move-result v32

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    :goto_5
    aput v32, v37, v38

    invoke-static/range {v35 .. v37}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v32

    aput-object v32, v33, v34

    const/16 v32, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPanel:Landroid/view/View;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    fill-array-data v36, :array_3

    .line 701
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v33, v32

    const/16 v32, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    fill-array-data v36, :array_4

    .line 702
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v33, v32

    const/16 v32, 0x5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    move-object/from16 v34, v0

    sget-object v35, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [F

    move-object/from16 v36, v0

    fill-array-data v36, :array_5

    .line 703
    invoke-static/range {v34 .. v36}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v34

    aput-object v34, v33, v32

    .line 697
    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    goto/16 :goto_4

    .line 700
    :cond_e
    invoke-static {}, Lcom/vk/core/util/Screen;->height()I

    move-result v32

    move/from16 v0, v32

    neg-int v0, v0

    move/from16 v32, v0

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    goto :goto_5

    .line 733
    .end local v8    # "animatorSet":Landroid/animation/AnimatorSet;
    .end local v9    # "centerImage":Lcom/vk/attachpicker/widget/ImageViewerImageView;
    .end local v15    # "currentZoom":F
    .end local v16    # "drawRegion":Landroid/graphics/RectF;
    .end local v18    # "height":F
    .end local v19    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v23    # "scale2":F
    .end local v24    # "scaleX":F
    .end local v25    # "scaleY":F
    .end local v28    # "width":F
    .end local v29    # "xPos":F
    .end local v30    # "yPos":F
    .end local v31    # "zoomDisplayRect":Landroid/graphics/RectF;
    :cond_f
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vk/attachpicker/screen/ViewerScreen;->translationY:F

    .line 734
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->setTranslationY(F)V

    .line 735
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v32, v0

    const/high16 v33, 0x3f800000    # 1.0f

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->setScaleX(F)V

    .line 736
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v32, v0

    const/high16 v33, 0x3f800000    # 1.0f

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->setScaleY(F)V

    .line 737
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v32, v0

    const/16 v33, 0x4

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->setVisibility(I)V

    .line 738
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/widget/VkViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 739
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->setControlsEnabled(Z)V

    .line 740
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->onPhotoClosed(Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;)V

    .line 743
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->orientationLocker:Lcom/vk/attachpicker/util/OrientationLocker;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    move-object/from16 v33, v0

    invoke-virtual/range {v32 .. v33}, Lcom/vk/attachpicker/util/OrientationLocker;->unlockOrientation(Landroid/app/Activity;)V

    .line 744
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->setIsVisible(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 691
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 692
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 693
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 700
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 701
    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 702
    :array_5
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public createView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/16 v4, 0x8

    .line 130
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    .line 131
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090131

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPadding:I

    .line 132
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->getInstance()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionUpdateListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v1, v6, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(ILcom/vk/attachpicker/events/NotificationListener;)V

    .line 135
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 136
    .local v0, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    iput v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->minimumVelocity:I

    .line 137
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->maximumVelocity:I

    .line 139
    new-instance v1, Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    invoke-direct {v1, p0, v2}, Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    .line 140
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->backgroundDrawableAnimation:Landroid/graphics/drawable/ColorDrawable;

    invoke-static {v1, v2}, Lcom/vk/core/util/CompatUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 141
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    invoke-virtual {v1, v5}, Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;->setFocusable(Z)V

    .line 143
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0301a1

    iget-object v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 144
    const v1, 0x7f100461

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->containerView:Landroid/widget/FrameLayout;

    .line 145
    const v1, 0x7f100470

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/VkViewPager;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    .line 146
    const v1, 0x7f100479

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/ViewerToolbar;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    .line 147
    const v1, 0x7f100478

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/ClippingView;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animatingImageView:Lcom/vk/attachpicker/widget/ClippingView;

    .line 148
    const v1, 0x7f10047a

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/EditButton;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    .line 149
    const v1, 0x7f100455

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->$(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->bottomPanel:Landroid/view/View;

    .line 150
    const v1, 0x7f100456

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/AttachCounterView;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    .line 151
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v2}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/AttachCounterView;->setCount(I)V

    .line 153
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setOnBackListener(Landroid/view/View$OnClickListener;)V

    .line 154
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    if-eqz v1, :cond_2

    .line 155
    iget-boolean v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->singleMode:Z

    if-eqz v1, :cond_0

    .line 156
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    invoke-virtual {v1, v7}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setOnCheckListener(Landroid/view/View$OnClickListener;)V

    .line 191
    :goto_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v1}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 192
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-virtual {v1, v4}, Lcom/vk/attachpicker/widget/EditButton;->setVisibility(I)V

    .line 201
    :goto_1
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    const/16 v2, 0xa

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/VkViewPager;->setPageMargin(I)V

    .line 202
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    invoke-virtual {v1, v6}, Lcom/vk/attachpicker/widget/VkViewPager;->setOffscreenPageLimit(I)V

    .line 203
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->galleryViewPager:Lcom/vk/attachpicker/widget/VkViewPager;

    new-instance v2, Lcom/vk/attachpicker/screen/ViewerScreen$2;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/screen/ViewerScreen$2;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen;)V

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/VkViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 221
    iget-boolean v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->preventStyling:Z

    if-eqz v1, :cond_3

    .line 222
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-virtual {v1, v4}, Lcom/vk/attachpicker/widget/EditButton;->setVisibility(I)V

    .line 254
    :goto_2
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$5;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/AttachCounterView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 287
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->windowView:Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    return-object v1

    .line 158
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$3;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setOnCheckListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 194
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-virtual {v1, v5}, Lcom/vk/attachpicker/widget/EditButton;->setVisibility(I)V

    goto :goto_1

    .line 197
    :cond_2
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-virtual {v1, v4}, Lcom/vk/attachpicker/widget/EditButton;->setVisibility(I)V

    .line 198
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    invoke-virtual {v1, v7}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setOnCheckListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 224
    :cond_3
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$4;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/EditButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2
.end method

.method public isAnimationInProgress()Z
    .locals 1

    .prologue
    .line 769
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animationInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public isVisible()Z
    .locals 1

    .prologue
    .line 777
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->isVisible:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method synthetic lambda$createView$1(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 153
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->animateOut()V

    return-void
.end method

.method synthetic lambda$createView$11(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 255
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getCurrentMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v0

    .line 256
    .local v0, "entry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    if-nez v0, :cond_1

    .line 285
    :cond_0
    :goto_0
    return-void

    .line 260
    :cond_1
    iget-boolean v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->thumb:Z

    if-eqz v1, :cond_2

    .line 261
    new-instance v1, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;

    invoke-direct {v1, v0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;-><init>(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    goto :goto_0

    .line 263
    :cond_2
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v1}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v1

    if-nez v1, :cond_4

    .line 264
    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isCorrupted()Z

    move-result v1

    if-nez v1, :cond_0

    .line 265
    iget-boolean v1, v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isVideo:Z

    if-eqz v1, :cond_3

    iget-wide v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->videoMaxLengthMs:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_3

    iget v1, v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->duration:I

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v2, v1

    iget-wide v4, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->videoMaxLengthMs:J

    cmp-long v1, v2, v4

    if-lez v1, :cond_3

    .line 266
    invoke-static {p0, v0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$7;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->openEditorAnimation(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 277
    :cond_3
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    check-cast v1, Lcom/vk/attachpicker/AttachResulter;

    invoke-static {v0}, Lcom/vk/attachpicker/SelectionContext;->packSingleEntry(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Landroid/content/Intent;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/vk/attachpicker/AttachResulter;->setResultAndFinish(Landroid/content/Intent;)V

    goto :goto_0

    .line 281
    :cond_4
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/SelectionContext;->addSelection(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)I

    .line 282
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->parentActivity:Landroid/app/Activity;

    check-cast v1, Lcom/vk/attachpicker/AttachResulter;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v2}, Lcom/vk/attachpicker/SelectionContext;->getPackedSelection()Landroid/content/Intent;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/vk/attachpicker/AttachResulter;->setResultAndFinish(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method synthetic lambda$createView$2(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    .line 159
    sget-object v1, Lcom/vk/attachpicker/SelectionContext;->globalCheckLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 188
    :cond_0
    :goto_0
    return-void

    .line 162
    :cond_1
    sget-object v1, Lcom/vk/attachpicker/SelectionContext;->globalCheckLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 164
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v1

    if-nez v1, :cond_0

    .line 167
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 169
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getCurrentMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v0

    .line 170
    .local v0, "storeEntry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isCorrupted()Z

    move-result v1

    if-nez v1, :cond_0

    .line 173
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 174
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/SelectionContext;->isSelected(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 175
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/SelectionContext;->removeSelection(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Z

    .line 176
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    iget-object v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v3, v0}, Lcom/vk/attachpicker/SelectionContext;->isSelected(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Z

    move-result v3

    invoke-virtual {v1, v3}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setChecked(Z)V

    .line 182
    :goto_1
    iget-boolean v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->preventStyling:Z

    if-eqz v1, :cond_3

    .line 183
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->editButton:Lcom/vk/attachpicker/widget/EditButton;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/EditButton;->setVisibility(I)V

    goto :goto_0

    .line 178
    :cond_2
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/SelectionContext;->addSelection(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)I

    .line 179
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    iget-object v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v3, v0}, Lcom/vk/attachpicker/SelectionContext;->isSelected(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Z

    move-result v3

    invoke-virtual {v1, v3}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setChecked(Z)V

    goto :goto_1

    .line 185
    :cond_3
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v1}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isCorrupted()Z

    move-result v1

    if-nez v1, :cond_4

    move v1, v2

    :goto_2
    invoke-direct {p0, v1, v2}, Lcom/vk/attachpicker/screen/ViewerScreen;->setEditButtonVisibility(ZZ)V

    goto :goto_0

    :cond_4
    const/4 v1, 0x0

    goto :goto_2
.end method

.method synthetic lambda$createView$7(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 225
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 251
    :cond_0
    :goto_0
    return-void

    .line 228
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 230
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getCurrentMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v0

    .line 231
    .local v0, "storeEntry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isCorrupted()Z

    move-result v1

    if-nez v1, :cond_0

    .line 235
    iget-boolean v1, v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isVideo:Z

    if-eqz v1, :cond_2

    .line 236
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->getInstance()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(I)V

    .line 239
    invoke-static {p0, v0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$11;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->openEditorAnimation(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 245
    :cond_2
    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$12;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->openEditorAnimation(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method synthetic lambda$getCurrentZoomableImageView$12([Lcom/vk/attachpicker/widget/ImageViewerImageView;Landroid/view/View;)V
    .locals 2
    .param p1, "array"    # [Lcom/vk/attachpicker/widget/ImageViewerImageView;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 873
    instance-of v0, p2, Lcom/vk/attachpicker/widget/ImageViewerImageView;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/vk/attachpicker/widget/ImageViewerImageView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/ImageViewerImageView;->getPosition()I

    move-result v0

    iget v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->currentPosition:I

    if-ne v0, v1, :cond_0

    .line 874
    const/4 v0, 0x0

    check-cast p2, Lcom/vk/attachpicker/widget/ImageViewerImageView;

    .end local p2    # "view":Landroid/view/View;
    aput-object p2, p1, v0

    .line 876
    :cond_0
    return-void
.end method

.method synthetic lambda$new$0(Lcom/vk/attachpicker/SelectionContext;IILjava/lang/Void;)V
    .locals 2
    .param p1, "selectionContext"    # Lcom/vk/attachpicker/SelectionContext;
    .param p2, "eventType"    # I
    .param p3, "eventId"    # I
    .param p4, "eventArgs"    # Ljava/lang/Void;

    .prologue
    .line 116
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 117
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    invoke-virtual {p1}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/AttachCounterView;->setCount(I)V

    .line 119
    :cond_0
    return-void
.end method

.method synthetic lambda$null$10(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 5
    .param p1, "entry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 267
    new-instance v0, Lcom/vk/attachpicker/screen/TrimScreen;

    iget-object v1, p1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    iget-wide v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->videoMaxLengthMs:J

    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$8;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vk/attachpicker/screen/TrimScreen;-><init>(Landroid/net/Uri;JLcom/vk/attachpicker/screen/TrimScreen$Delegate;)V

    .line 270
    .local v0, "trimScreen":Lcom/vk/attachpicker/screen/TrimScreen;
    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/ViewerScreen;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    .line 272
    invoke-static {v0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$9;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x12c

    invoke-virtual {p0, v1, v2, v3}, Lcom/vk/attachpicker/screen/ViewerScreen;->postDelayed(Ljava/lang/Runnable;J)V

    .line 275
    return-void
.end method

.method synthetic lambda$null$3()V
    .locals 1

    .prologue
    .line 241
    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$16;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/attachpicker/Picker;->run(Ljava/lang/Runnable;)V

    .line 242
    return-void
.end method

.method synthetic lambda$null$4(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 5
    .param p1, "storeEntry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 240
    new-instance v0, Lcom/vk/attachpicker/screen/TrimScreen;

    iget-object v1, p1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    iget-wide v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->videoMaxLengthMs:J

    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$15;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vk/attachpicker/screen/TrimScreen;-><init>(Landroid/net/Uri;JLcom/vk/attachpicker/screen/TrimScreen$Delegate;)V

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/ViewerScreen;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    .line 243
    return-void
.end method

.method synthetic lambda$null$5()V
    .locals 1

    .prologue
    .line 247
    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$14;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/attachpicker/Picker;->run(Ljava/lang/Runnable;)V

    .line 248
    return-void
.end method

.method synthetic lambda$null$6()V
    .locals 4

    .prologue
    .line 246
    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->getCurrentMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$13;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/screen/EditorScreen$Delegate;

    move-result-object v2

    iget-boolean v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->thumb:Z

    invoke-direct {v0, v1, v2, v3}, Lcom/vk/attachpicker/screen/EditorScreen;-><init>(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Lcom/vk/attachpicker/screen/EditorScreen$Delegate;Z)V

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/screen/ViewerScreen;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    .line 249
    return-void
.end method

.method synthetic lambda$null$8()V
    .locals 1

    .prologue
    .line 268
    invoke-static {p0}, Lcom/vk/attachpicker/screen/ViewerScreen$$Lambda$10;->lambdaFactory$(Lcom/vk/attachpicker/screen/ViewerScreen;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/attachpicker/Picker;->run(Ljava/lang/Runnable;)V

    .line 269
    return-void
.end method

.method public onBackPressed()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 297
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->isAnimationInProgress()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 306
    :goto_0
    return v0

    .line 301
    :cond_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 302
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/ViewerScreen;->animateOut()V

    goto :goto_0

    .line 306
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 124
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->onDestroy()V

    .line 125
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->getInstance()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->selectionUpdateListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V

    .line 126
    return-void
.end method

.method public onTopPaddingChanged(I)V
    .locals 4
    .param p1, "topPadding"    # I

    .prologue
    .line 292
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/ViewerToolbar;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/ViewerToolbar;->getPaddingRight()I

    move-result v2

    iget-object v3, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->actionBarView:Lcom/vk/attachpicker/widget/ViewerToolbar;

    invoke-virtual {v3}, Lcom/vk/attachpicker/widget/ViewerToolbar;->getPaddingBottom()I

    move-result v3

    invoke-virtual {v0, v1, p1, v2, v3}, Lcom/vk/attachpicker/widget/ViewerToolbar;->setPadding(IIII)V

    .line 293
    return-void
.end method

.method public realDismiss()V
    .locals 0

    .prologue
    .line 310
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->finish()V

    .line 311
    return-void
.end method

.method public setAnimationInProgress(Z)V
    .locals 1
    .param p1, "isAnimationInProgress"    # Z

    .prologue
    .line 765
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->animationInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 766
    return-void
.end method

.method public setIsVisible(Z)V
    .locals 1
    .param p1, "isVisible"    # Z

    .prologue
    .line 773
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen;->isVisible:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 774
    return-void
.end method
