.class public Lcom/vkontakte/android/ui/PhotoView;
.super Landroid/view/View;
.source "PhotoView.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;
.implements Landroid/view/GestureDetector$OnDoubleTapListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/PhotoView$ZoomListener;,
        Lcom/vkontakte/android/ui/PhotoView$DismissListener;,
        Lcom/vkontakte/android/ui/PhotoView$RunnableFuture;,
        Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;,
        Lcom/vkontakte/android/ui/PhotoView$Texture;,
        Lcom/vkontakte/android/ui/PhotoView$NavigationListener;,
        Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;
    }
.end annotation


# static fields
.field public static final PAGE_SPACING:I

.field private static final TAG:Ljava/lang/String; = "vk_photoview"

.field public static final THUMB_ANIM_DURATION:I = 0x12c

.field public static interpolatorIn:Landroid/view/animation/Interpolator;

.field public static interpolatorOut:Landroid/view/animation/Interpolator;


# instance fields
.field private adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

.field private animDuration:J

.field private animScale:F

.field private animStartTime:J

.field private animTx:F

.field private animTy:F

.field private bgAlpha:F

.field private bgPaint:Landroid/graphics/Paint;

.field private bitmapPaint:Landroid/graphics/Paint;

.field private cancelerThread:Lme/grishka/appkit/utils/WorkerThread;

.field private clickListener:Landroid/view/View$OnClickListener;

.field private customOverlayContainer:Landroid/widget/FrameLayout;

.field private density:F

.field private detector:Landroid/view/GestureDetector;

.field private disallowZoom:Z

.field private dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

.field private dismissed:Z

.field private dismissing:Z

.field private doubleTap:Z

.field private dragStartPointerID:I

.field private dragStartTx:F

.field private dragStartTy:F

.field private dragStartX:F

.field private dragStartY:F

.field private dragging:Z

.field private dropTouches:Z

.field private error:Landroid/view/View;

.field private firstResume:Z

.field private fitBySmallestSide:Z

.field private inAnimDone:Z

.field private inited:Z

.field private isList:Z

.field private itrp:Landroid/view/animation/Interpolator;

.field private limitX:I

.field private limitY:I

.field private listPosition:I

.field private loaderThread:Lme/grishka/appkit/utils/WorkerThread;

.field private loadingBitmaps:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;",
            ">;"
        }
    .end annotation
.end field

.field private maxScale:F

.field private maxX:I

.field private maxY:I

.field private minScale:F

.field private minX:I

.field private minY:I

.field private navListener:Lcom/vkontakte/android/ui/PhotoView$NavigationListener;

.field private outAnimDone:Z

.field private overlay:Landroid/widget/FrameLayout;

.field private overlayViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private pinchCenterX:F

.field private pinchCenterY:F

.field private pinchEndTime:J

.field private pinchStartDist:F

.field private pinchStartScale:F

.field private postedPhotoSwitch:Ljava/lang/Runnable;

.field private prevCallbackPos:I

.field private prevSwitchFwd:Z

.field private prevViewportH:F

.field private prevViewportW:F

.field private progressBar:Lcom/vkontakte/android/ui/CircularProgressBar;

.field private queueLock:Ljava/util/concurrent/Semaphore;

.field private receiver:Landroid/content/BroadcastReceiver;

.field private resetOnResize:Z

.field private scale:F

.field private scaleNext:F

.field private scalePrev:F

.field private scaleStartTx:F

.field private scaleStartTy:F

.field private scroller:Landroid/widget/Scroller;

.field private secondIsNext:Z

.field private showProgress:Ljava/lang/Runnable;

.field private texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

.field private texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

.field private textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

.field private texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

.field private thumbRect:Landroid/graphics/Rect;

.field private thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

.field private touchslop:F

.field private translateX:F

.field private translateY:F

.field private viewportH:F

.field private viewportW:F

.field private windowBg:Landroid/graphics/drawable/ColorDrawable;

.field private zoomListener:Lcom/vkontakte/android/ui/PhotoView$ZoomListener;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    .line 48
    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    .line 110
    new-instance v1, Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    const-wide v2, 0x3fe28f5c28f5c28fL    # 0.58

    const-wide v4, 0x3fe8a3d70a3d70a4L    # 0.77

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-direct/range {v1 .. v9}, Lcom/vkontakte/android/ui/CubicBezierInterpolator;-><init>(DDDD)V

    sput-object v1, Lcom/vkontakte/android/ui/PhotoView;->interpolatorIn:Landroid/view/animation/Interpolator;

    .line 111
    new-instance v1, Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    const-wide v2, 0x3fdae147ae147ae1L    # 0.42

    const-wide v4, 0x3fd51eb851eb851fL    # 0.33

    const-wide/16 v8, 0x0

    invoke-direct/range {v1 .. v9}, Lcom/vkontakte/android/ui/CubicBezierInterpolator;-><init>(DDDD)V

    sput-object v1, Lcom/vkontakte/android/ui/PhotoView;->interpolatorOut:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 131
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 58
    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    .line 61
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartPointerID:I

    .line 64
    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    .line 68
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->itrp:Landroid/view/animation/Interpolator;

    .line 70
    new-instance v0, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    .line 72
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchEndTime:J

    .line 73
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->doubleTap:Z

    .line 74
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->isList:Z

    .line 75
    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    .line 76
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->secondIsNext:Z

    .line 77
    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleNext:F

    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->scalePrev:F

    .line 80
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->inited:Z

    .line 82
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->loadingBitmaps:Ljava/util/Vector;

    .line 85
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->firstResume:Z

    .line 86
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->fitBySmallestSide:Z

    .line 87
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->resetOnResize:Z

    .line 88
    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->limitX:I

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->limitY:I

    .line 91
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->dropTouches:Z

    .line 92
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->inAnimDone:Z

    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->outAnimDone:Z

    .line 93
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v1, -0x1000000

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->windowBg:Landroid/graphics/drawable/ColorDrawable;

    .line 94
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->dragging:Z

    .line 97
    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->bgAlpha:F

    .line 99
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->bgPaint:Landroid/graphics/Paint;

    .line 101
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissed:Z

    .line 103
    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->prevCallbackPos:I

    .line 104
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->prevSwitchFwd:Z

    .line 105
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->disallowZoom:Z

    .line 107
    new-instance v0, Lme/grishka/appkit/utils/WorkerThread;

    const-string/jumbo v1, "PhotoView Image Loader"

    invoke-direct {v0, v1}, Lme/grishka/appkit/utils/WorkerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->loaderThread:Lme/grishka/appkit/utils/WorkerThread;

    .line 108
    new-instance v0, Lme/grishka/appkit/utils/WorkerThread;

    const-string/jumbo v1, "PhotoView Load Canceling"

    invoke-direct {v0, v1}, Lme/grishka/appkit/utils/WorkerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->cancelerThread:Lme/grishka/appkit/utils/WorkerThread;

    .line 109
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v3, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->queueLock:Ljava/util/concurrent/Semaphore;

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlayViews:Ljava/util/ArrayList;

    .line 116
    new-instance v0, Lcom/vkontakte/android/ui/PhotoView$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/PhotoView$1;-><init>(Lcom/vkontakte/android/ui/PhotoView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->receiver:Landroid/content/BroadcastReceiver;

    .line 132
    invoke-direct {p0}, Lcom/vkontakte/android/ui/PhotoView;->init()V

    .line 133
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 136
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    .line 61
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartPointerID:I

    .line 64
    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    .line 68
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->itrp:Landroid/view/animation/Interpolator;

    .line 70
    new-instance v0, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    .line 72
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchEndTime:J

    .line 73
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->doubleTap:Z

    .line 74
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->isList:Z

    .line 75
    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    .line 76
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->secondIsNext:Z

    .line 77
    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleNext:F

    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->scalePrev:F

    .line 80
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->inited:Z

    .line 82
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->loadingBitmaps:Ljava/util/Vector;

    .line 85
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->firstResume:Z

    .line 86
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->fitBySmallestSide:Z

    .line 87
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->resetOnResize:Z

    .line 88
    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->limitX:I

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->limitY:I

    .line 91
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->dropTouches:Z

    .line 92
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->inAnimDone:Z

    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->outAnimDone:Z

    .line 93
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v1, -0x1000000

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->windowBg:Landroid/graphics/drawable/ColorDrawable;

    .line 94
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->dragging:Z

    .line 97
    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->bgAlpha:F

    .line 99
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->bgPaint:Landroid/graphics/Paint;

    .line 101
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissed:Z

    .line 103
    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->prevCallbackPos:I

    .line 104
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->prevSwitchFwd:Z

    .line 105
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->disallowZoom:Z

    .line 107
    new-instance v0, Lme/grishka/appkit/utils/WorkerThread;

    const-string/jumbo v1, "PhotoView Image Loader"

    invoke-direct {v0, v1}, Lme/grishka/appkit/utils/WorkerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->loaderThread:Lme/grishka/appkit/utils/WorkerThread;

    .line 108
    new-instance v0, Lme/grishka/appkit/utils/WorkerThread;

    const-string/jumbo v1, "PhotoView Load Canceling"

    invoke-direct {v0, v1}, Lme/grishka/appkit/utils/WorkerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->cancelerThread:Lme/grishka/appkit/utils/WorkerThread;

    .line 109
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v3, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->queueLock:Ljava/util/concurrent/Semaphore;

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlayViews:Ljava/util/ArrayList;

    .line 116
    new-instance v0, Lcom/vkontakte/android/ui/PhotoView$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/PhotoView$1;-><init>(Lcom/vkontakte/android/ui/PhotoView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->receiver:Landroid/content/BroadcastReceiver;

    .line 137
    invoke-direct {p0}, Lcom/vkontakte/android/ui/PhotoView;->init()V

    .line 138
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    return v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/ui/PhotoView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # F

    .prologue
    .line 45
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    return p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    return v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/ui/PhotoView;FFF)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # F
    .param p2, "x2"    # F
    .param p3, "x3"    # F

    .prologue
    .line 45
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v0

    return v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/ui/PhotoView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # F

    .prologue
    .line 45
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    return p1
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    return v0
.end method

.method static synthetic access$1102(Lcom/vkontakte/android/ui/PhotoView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # F

    .prologue
    .line 45
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    return p1
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/ui/PhotoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    return v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/ui/PhotoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    return v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/ui/PhotoView;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/CircularProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->progressBar:Lcom/vkontakte/android/ui/CircularProgressBar;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/ui/PhotoView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/ui/PhotoView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView;->inAnimDone:Z

    return v0
.end method

.method static synthetic access$1702(Lcom/vkontakte/android/ui/PhotoView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/PhotoView;->inAnimDone:Z

    return p1
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/ui/PhotoView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView;->outAnimDone:Z

    return v0
.end method

.method static synthetic access$1802(Lcom/vkontakte/android/ui/PhotoView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/PhotoView;->outAnimDone:Z

    return p1
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/ui/PhotoView;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-wide v0, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->prevViewportH:F

    return v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/ui/PhotoView;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-wide v0, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    return-wide v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/ui/PhotoView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # F

    .prologue
    .line 45
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->prevViewportH:F

    return p1
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/ui/PhotoView;)Landroid/view/animation/Interpolator;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->itrp:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->animTx:F

    return v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->animTy:F

    return v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/ui/PhotoView;)Landroid/graphics/Rect;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/ui/PhotoView;)Landroid/graphics/Paint;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->bgPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/ClippingImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/ui/PhotoView;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/vkontakte/android/ui/PhotoView;)Landroid/graphics/drawable/ColorDrawable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->windowBg:Landroid/graphics/drawable/ColorDrawable;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->prevViewportW:F

    return v0
.end method

.method static synthetic access$3000(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    return v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/ui/PhotoView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # F

    .prologue
    .line 45
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->prevViewportW:F

    return p1
.end method

.method static synthetic access$3100(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->bgAlpha:F

    return v0
.end method

.method static synthetic access$3202(Lcom/vkontakte/android/ui/PhotoView;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView;->postedPhotoSwitch:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$3300(Lcom/vkontakte/android/ui/PhotoView;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/PhotoView;->switchPhoto(Z)V

    return-void
.end method

.method static synthetic access$3400(Lcom/vkontakte/android/ui/PhotoView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView;->inited:Z

    return v0
.end method

.method static synthetic access$3500(Lcom/vkontakte/android/ui/PhotoView;)Ljava/util/Vector;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->loadingBitmaps:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$3600(Lcom/vkontakte/android/ui/PhotoView;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/PhotoView;->loadPhotos(Z)V

    return-void
.end method

.method static synthetic access$3700(Lcom/vkontakte/android/ui/PhotoView;)Lme/grishka/appkit/utils/WorkerThread;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->cancelerThread:Lme/grishka/appkit/utils/WorkerThread;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/vkontakte/android/ui/PhotoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/PhotoView;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/PhotoView;->updateScale(Z)V

    return-void
.end method

.method static synthetic access$4000(Lcom/vkontakte/android/ui/PhotoView;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->showProgress:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$4002(Lcom/vkontakte/android/ui/PhotoView;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView;->showProgress:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$4100(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    return-object v0
.end method

.method static synthetic access$4200(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    return-object v0
.end method

.method static synthetic access$4300(Lcom/vkontakte/android/ui/PhotoView;)Ljava/util/concurrent/Semaphore;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->queueLock:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    return v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/ui/PhotoView;F)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # F

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/PhotoView;->updateMinMax(F)V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/ui/PhotoView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    return v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/ui/PhotoView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p1, "x1"    # F

    .prologue
    .line 45
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/ui/PhotoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    return v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/ui/PhotoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    return v0
.end method

.method private animateTo(FFF)V
    .locals 3
    .param p1, "newScale"    # F
    .param p2, "newTx"    # F
    .param p3, "newTy"    # F

    .prologue
    .line 941
    const-string/jumbo v0, "vk_photoview"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "animate to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 942
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->animScale:F

    .line 943
    iput p2, p0, Lcom/vkontakte/android/ui/PhotoView;->animTx:F

    .line 944
    iput p3, p0, Lcom/vkontakte/android/ui/PhotoView;->animTy:F

    .line 945
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    .line 946
    const-wide/16 v0, 0x12c

    iput-wide v0, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    .line 947
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->postInvalidate()V

    .line 948
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->postInvalidate()V

    .line 949
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->zoomListener:Lcom/vkontakte/android/ui/PhotoView$ZoomListener;

    if-eqz v0, :cond_0

    .line 950
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->zoomListener:Lcom/vkontakte/android/ui/PhotoView$ZoomListener;

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    invoke-interface {v0, p1, v1, v2}, Lcom/vkontakte/android/ui/PhotoView$ZoomListener;->onZoomChanged(FFF)V

    .line 952
    :cond_0
    return-void
.end method

.method private applyOverlayTransform()V
    .locals 10

    .prologue
    .line 719
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    if-eqz v6, :cond_1

    .line 721
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    sub-long/2addr v6, v8

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    cmp-long v6, v6, v8

    if-gez v6, :cond_0

    .line 722
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    sub-long/2addr v6, v8

    long-to-float v6, v6

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    long-to-float v7, v8

    div-float v0, v6, v7

    .line 723
    .local v0, "a":F
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->itrp:Landroid/view/animation/Interpolator;

    invoke-interface {v6, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    .line 724
    .local v1, "ai":F
    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->animScale:F

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    sub-float/2addr v7, v8

    mul-float/2addr v7, v1

    add-float v2, v6, v7

    .line 725
    .local v2, "ts":F
    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->animTx:F

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    sub-float/2addr v7, v8

    mul-float/2addr v7, v1

    add-float v3, v6, v7

    .line 726
    .local v3, "tx":F
    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->animTy:F

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    sub-float/2addr v7, v8

    mul-float/2addr v7, v1

    add-float v4, v6, v7

    .line 732
    .end local v0    # "a":F
    .end local v1    # "ai":F
    .local v4, "ty":F
    :goto_0
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v6, v3}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 733
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v6, v4}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 734
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    div-float v7, v2, v7

    invoke-virtual {v6, v7}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 735
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    div-float v7, v2, v7

    invoke-virtual {v6, v7}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 736
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->overlayViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 737
    .local v5, "v":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->invalidate()V

    goto :goto_1

    .line 728
    .end local v2    # "ts":F
    .end local v3    # "tx":F
    .end local v4    # "ty":F
    .end local v5    # "v":Landroid/view/View;
    :cond_0
    iget v3, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 729
    .restart local v3    # "tx":F
    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 730
    .restart local v4    # "ty":F
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    .restart local v2    # "ts":F
    goto :goto_0

    .line 740
    .end local v2    # "ts":F
    .end local v3    # "tx":F
    .end local v4    # "ty":F
    :cond_1
    return-void
.end method

.method private callPositionChanged(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 933
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->navListener:Lcom/vkontakte/android/ui/PhotoView$NavigationListener;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->prevCallbackPos:I

    if-eq p1, v0, :cond_0

    .line 934
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->navListener:Lcom/vkontakte/android/ui/PhotoView$NavigationListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/ui/PhotoView$NavigationListener;->onPositionChanged(I)V

    .line 936
    :cond_0
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->prevCallbackPos:I

    .line 938
    return-void
.end method

.method private clamp(FFF)F
    .locals 1
    .param p1, "x"    # F
    .param p2, "min"    # F
    .param p3, "max"    # F

    .prologue
    .line 453
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {v0, p3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method private init()V
    .locals 7

    .prologue
    const v6, 0x7f1001a2

    const v5, 0x7f1001a1

    const/4 v4, -0x1

    const/4 v3, 0x1

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->loaderThread:Lme/grishka/appkit/utils/WorkerThread;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/WorkerThread;->start()V

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->cancelerThread:Lme/grishka/appkit/utils/WorkerThread;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/WorkerThread;->start()V

    .line 143
    new-instance v0, Lcom/vkontakte/android/ui/PhotoView$Texture;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/PhotoView$Texture;-><init>(Lcom/vkontakte/android/ui/PhotoView;I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 144
    new-instance v0, Lcom/vkontakte/android/ui/PhotoView$Texture;

    invoke-direct {v0, p0, v3}, Lcom/vkontakte/android/ui/PhotoView$Texture;-><init>(Lcom/vkontakte/android/ui/PhotoView;I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 145
    new-instance v0, Lcom/vkontakte/android/ui/PhotoView$Texture;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/PhotoView$Texture;-><init>(Lcom/vkontakte/android/ui/PhotoView;I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->bgPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 148
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->bitmapPaint:Landroid/graphics/Paint;

    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 151
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    .line 153
    new-instance v0, Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/CircularProgressBar;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->progressBar:Lcom/vkontakte/android/ui/CircularProgressBar;

    .line 154
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f030026

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/PhotoView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    .line 155
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 156
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0801f6

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0805d6

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/ui/PhotoView$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/PhotoView;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    new-instance v0, Lcom/vkontakte/android/ui/ClippingImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/ClippingImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    .line 162
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->detector:Landroid/view/GestureDetector;

    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->detector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p0}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 164
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoView;->density:F

    .line 165
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/PhotoView;->setFocusable(Z)V

    .line 166
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/PhotoView;->setFocusableInTouchMode(Z)V

    .line 167
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->requestFocus()Z

    .line 168
    const-string/jumbo v0, "vk_photoview"

    const-string/jumbo v1, "photo viewer init"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    const/high16 v1, -0x45000000    # -0.001953125f

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 181
    return-void
.end method

.method private load(Ljava/util/List;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "tasks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;>;"
    const/4 v10, 0x0

    .line 1223
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1225
    :try_start_0
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->queueLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v6}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1228
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1229
    .local v1, "indexes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    .line 1230
    .local v4, "t":Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;
    iget v7, v4, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->index:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1231
    const/4 v0, 0x0

    .line 1232
    .local v0, "found":Z
    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoView;->loadingBitmaps:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    .line 1233
    .local v3, "s":Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;
    iget v8, v3, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->index:I

    iget v9, v4, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->index:I

    if-ne v8, v9, :cond_1

    .line 1234
    iget-boolean v7, v3, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->onlyIfCached:Z

    if-eqz v7, :cond_3

    iget-boolean v7, v4, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->onlyIfCached:Z

    if-nez v7, :cond_3

    iget-object v7, v3, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->loader:Lcom/vkontakte/android/ui/PhotoView$RunnableFuture;

    if-nez v7, :cond_3

    .line 1235
    invoke-virtual {v3}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->cancel()V

    .line 1236
    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoView;->loadingBitmaps:Ljava/util/Vector;

    invoke-virtual {v7, v3}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 1237
    const-string/jumbo v7, "vk_photoview"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Replacing cache-only task with full for "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v4, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->index:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1244
    .end local v3    # "s":Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;
    :cond_2
    :goto_2
    if-nez v0, :cond_0

    .line 1245
    iget-object v7, v4, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->tex:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iput-boolean v10, v7, Lcom/vkontakte/android/ui/PhotoView$Texture;->loaded:Z

    .line 1246
    iget-object v7, v4, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->tex:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iput-boolean v10, v7, Lcom/vkontakte/android/ui/PhotoView$Texture;->thumb:Z

    .line 1247
    invoke-virtual {v4}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->preRun()V

    .line 1248
    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoView;->loaderThread:Lme/grishka/appkit/utils/WorkerThread;

    invoke-virtual {v7, v4, v10}, Lme/grishka/appkit/utils/WorkerThread;->postRunnable(Ljava/lang/Runnable;I)V

    .line 1249
    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoView;->loadingBitmaps:Ljava/util/Vector;

    invoke-virtual {v7, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1239
    .restart local v3    # "s":Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;
    :cond_3
    const/4 v0, 0x1

    .line 1241
    goto :goto_2

    .line 1252
    .end local v0    # "found":Z
    .end local v3    # "s":Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;
    .end local v4    # "t":Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;
    :cond_4
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->loadingBitmaps:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1253
    .local v2, "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;>;"
    :cond_5
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 1254
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    .line 1255
    .local v5, "task":Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;
    iget v6, v5, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->index:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 1256
    invoke-virtual {v5}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->cancel()V

    .line 1257
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_3

    .line 1260
    .end local v5    # "task":Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;
    :cond_6
    const-string/jumbo v6, "vk_photoview"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Current queue: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/ui/PhotoView;->loadingBitmaps:Ljava/util/Vector;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1261
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->queueLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v6}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1262
    return-void

    .line 1226
    .end local v1    # "indexes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v2    # "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;>;"
    :catch_0
    move-exception v6

    goto/16 :goto_0
.end method

.method private loadPhotos(Z)V
    .locals 6
    .param p1, "fwd"    # Z

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1159
    if-eqz p1, :cond_3

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 1160
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/PhotoView$Texture;->loaded:Z

    if-nez v0, :cond_8

    .line 1162
    new-array v4, v4, [Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    new-instance v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    invoke-direct {v0, p0, v1, v2, v5}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;-><init>(Lcom/vkontakte/android/ui/PhotoView;IZLcom/vkontakte/android/ui/PhotoView$Texture;)V

    aput-object v0, v4, v2

    new-instance v5, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    if-eqz p1, :cond_6

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v0, v0, 0x1

    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->shouldPreload()Z

    move-result v1

    if-nez v1, :cond_1

    move v2, v3

    :cond_1
    if-eqz p1, :cond_7

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    :goto_1
    invoke-direct {v5, p0, v0, v2, v1}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;-><init>(Lcom/vkontakte/android/ui/PhotoView;IZLcom/vkontakte/android/ui/PhotoView$Texture;)V

    aput-object v5, v4, v3

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/PhotoView;->load(Ljava/util/List;)V

    .line 1198
    :cond_2
    :goto_2
    return-void

    .line 1159
    :cond_3
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v0, v0, -0x1

    if-gez v0, :cond_0

    .line 1168
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/PhotoView$Texture;->loaded:Z

    if-nez v0, :cond_2

    .line 1170
    new-array v4, v4, [Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    new-instance v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    invoke-direct {v0, p0, v1, v2, v5}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;-><init>(Lcom/vkontakte/android/ui/PhotoView;IZLcom/vkontakte/android/ui/PhotoView$Texture;)V

    aput-object v0, v4, v2

    new-instance v5, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    if-eqz p1, :cond_c

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v0, v0, 0x1

    :goto_3
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->shouldPreload()Z

    move-result v1

    if-nez v1, :cond_5

    move v2, v3

    :cond_5
    if-eqz p1, :cond_d

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    :goto_4
    invoke-direct {v5, p0, v0, v2, v1}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;-><init>(Lcom/vkontakte/android/ui/PhotoView;IZLcom/vkontakte/android/ui/PhotoView$Texture;)V

    aput-object v5, v4, v3

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/PhotoView;->load(Ljava/util/List;)V

    goto :goto_2

    .line 1162
    :cond_6
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_7
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    goto :goto_1

    .line 1165
    :cond_8
    new-array v4, v3, [Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    new-instance v5, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    if-eqz p1, :cond_9

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v0, v0, 0x1

    :goto_5
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->shouldPreload()Z

    move-result v1

    if-nez v1, :cond_a

    :goto_6
    if-eqz p1, :cond_b

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    :goto_7
    invoke-direct {v5, p0, v0, v3, v1}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;-><init>(Lcom/vkontakte/android/ui/PhotoView;IZLcom/vkontakte/android/ui/PhotoView$Texture;)V

    aput-object v5, v4, v2

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/PhotoView;->load(Ljava/util/List;)V

    goto :goto_2

    :cond_9
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v0, v0, -0x1

    goto :goto_5

    :cond_a
    move v3, v2

    goto :goto_6

    :cond_b
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    goto :goto_7

    .line 1170
    :cond_c
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    :cond_d
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    goto :goto_4
.end method

.method private postSwitch(Z)V
    .locals 6
    .param p1, "fwd"    # Z

    .prologue
    .line 1080
    new-instance v0, Lcom/vkontakte/android/ui/PhotoView$6;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/ui/PhotoView$6;-><init>(Lcom/vkontakte/android/ui/PhotoView;Z)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->postedPhotoSwitch:Ljava/lang/Runnable;

    iget-wide v2, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    const-wide/16 v4, 0x32

    add-long/2addr v2, v4

    invoke-virtual {p0, v0, v2, v3}, Lcom/vkontakte/android/ui/PhotoView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1087
    return-void
.end method

.method private switchPhoto(Z)V
    .locals 5
    .param p1, "fwd"    # Z

    .prologue
    const/4 v4, 0x0

    .line 1096
    if-eqz p1, :cond_7

    .line 1097
    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    .line 1101
    :goto_0
    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    if-gez v1, :cond_0

    .line 1103
    iput v4, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    .line 1105
    :cond_0
    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v2}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->getCount()I

    move-result v2

    if-lt v1, v2, :cond_1

    .line 1107
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    .line 1109
    :cond_1
    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/PhotoView;->callPositionChanged(I)V

    .line 1110
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->navListener:Lcom/vkontakte/android/ui/PhotoView$NavigationListener;

    if-eqz v1, :cond_2

    .line 1111
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->navListener:Lcom/vkontakte/android/ui/PhotoView$NavigationListener;

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    invoke-interface {v1, v2}, Lcom/vkontakte/android/ui/PhotoView$NavigationListener;->onPositionConfirmed(I)V

    .line 1113
    :cond_2
    if-eqz p1, :cond_8

    .line 1114
    const-string/jumbo v1, "vk_photoview"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Switch photo >> ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1115
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 1116
    .local v0, "tmp":Lcom/vkontakte/android/ui/PhotoView$Texture;
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iput-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 1117
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iput-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 1119
    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 1130
    :goto_1
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/PhotoView;->updateScale(Z)V

    .line 1131
    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/PhotoView;->updateMinMax(F)V

    .line 1132
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/PhotoView;->loadPhotos(Z)V

    .line 1133
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v1, v1, Lcom/vkontakte/android/ui/PhotoView$Texture;->thumb:Z

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v1, v1, Lcom/vkontakte/android/ui/PhotoView$Texture;->data:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_9

    .line 1134
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v2, v2, Lcom/vkontakte/android/ui/PhotoView$Texture;->data:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/ClippingImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 1135
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/ui/ClippingImageView;->setVisibility(I)V

    .line 1136
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->invalidate()V

    .line 1140
    :goto_2
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/PhotoView;->prevSwitchFwd:Z

    if-eq v1, p1, :cond_3

    .line 1141
    const-string/jumbo v1, "vk_photoview"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Switch dir was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->prevSwitchFwd:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", now "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1143
    :cond_3
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/PhotoView;->prevSwitchFwd:Z

    .line 1144
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-ne v1, v2, :cond_4

    .line 1145
    const-string/jumbo v1, "vk_photoview"

    const-string/jumbo v2, "OH SHIT!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1147
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-ne v1, v2, :cond_5

    .line 1148
    const-string/jumbo v1, "vk_photoview"

    const-string/jumbo v2, "OH SHIT!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1150
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-ne v1, v2, :cond_6

    .line 1151
    const-string/jumbo v1, "vk_photoview"

    const-string/jumbo v2, "OH SHIT!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1153
    :cond_6
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->progressBar:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-static {v1, v4}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1154
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->invalidate()V

    .line 1155
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 1156
    return-void

    .line 1099
    .end local v0    # "tmp":Lcom/vkontakte/android/ui/PhotoView$Texture;
    :cond_7
    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    goto/16 :goto_0

    .line 1121
    :cond_8
    const-string/jumbo v1, "vk_photoview"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Switch photo << ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1122
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 1123
    .restart local v0    # "tmp":Lcom/vkontakte/android/ui/PhotoView$Texture;
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iput-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 1124
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iput-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 1126
    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    goto/16 :goto_1

    .line 1138
    :cond_9
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/ClippingImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_2
.end method

.method private updateMinMax(F)V
    .locals 7
    .param p1, "scale"    # F

    .prologue
    const/4 v6, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    .line 306
    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v2, v2, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v3, v3, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v3, v3

    div-float v0, v2, v3

    .local v0, "iratio":F
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    iget v3, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    div-float v1, v2, v3

    .line 307
    .local v1, "sratio":F
    cmpl-float v2, v0, v1

    if-lez v2, :cond_3

    .line 308
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v2, p1, v2

    if-gtz v2, :cond_0

    iget-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->fitBySmallestSide:Z

    if-eqz v2, :cond_2

    .line 309
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v2, v2, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v2, v2

    mul-float/2addr v2, p1

    div-float/2addr v2, v5

    iget v3, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    div-float/2addr v3, v5

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->limitX:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    .line 310
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    neg-int v2, v2

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    .line 311
    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v2, v2, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v2, v2

    mul-float/2addr v2, p1

    iget v3, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->limitY:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    .line 312
    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v2, v2, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v2, v2

    mul-float/2addr v2, p1

    div-float/2addr v2, v5

    iget v3, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    div-float/2addr v3, v5

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->limitY:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    .line 313
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    neg-int v2, v2

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    .line 339
    :goto_0
    return-void

    .line 315
    :cond_1
    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    goto :goto_0

    .line 318
    :cond_2
    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    goto :goto_0

    .line 321
    :cond_3
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v2, p1, v2

    if-gtz v2, :cond_4

    iget-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->fitBySmallestSide:Z

    if-eqz v2, :cond_6

    .line 322
    :cond_4
    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v2, v2, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v2, v2

    mul-float/2addr v2, p1

    div-float/2addr v2, v5

    iget v3, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    div-float/2addr v3, v5

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->limitY:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    .line 323
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    neg-int v2, v2

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    .line 324
    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v2, v2, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v2, v2

    mul-float/2addr v2, p1

    iget v3, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_5

    .line 325
    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v2, v2, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v2, v2

    mul-float/2addr v2, p1

    div-float/2addr v2, v5

    iget v3, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    div-float/2addr v3, v5

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->limitX:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    .line 326
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    neg-int v2, v2

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    goto :goto_0

    .line 328
    :cond_5
    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    goto :goto_0

    .line 331
    :cond_6
    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    iput v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    goto :goto_0
.end method

.method private updateScale(Z)V
    .locals 13
    .param p1, "changed"    # Z

    .prologue
    .line 263
    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v10, v10

    iget-object v11, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v11, v11, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v11, v11

    div-float v5, v10, v11

    .local v5, "iratio":F
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    iget v11, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    div-float v8, v10, v11

    .line 264
    .local v8, "sratio":F
    cmpl-float v10, v5, v8

    if-gtz v10, :cond_0

    iget-boolean v10, p0, Lcom/vkontakte/android/ui/PhotoView;->fitBySmallestSide:Z

    if-eqz v10, :cond_b

    .line 265
    :cond_0
    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    .local v1, "fw":F
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    .line 266
    .local v0, "fh":F
    iget-boolean v10, p0, Lcom/vkontakte/android/ui/PhotoView;->fitBySmallestSide:Z

    if-eqz v10, :cond_1

    .line 267
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->limitX:I

    mul-int/lit8 v10, v10, 0x2

    int-to-float v10, v10

    sub-float/2addr v1, v10

    .line 268
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->limitY:I

    mul-int/lit8 v10, v10, 0x2

    int-to-float v10, v10

    sub-float/2addr v0, v10

    .line 270
    :cond_1
    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v10, v10

    div-float v10, v1, v10

    iput v10, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    .line 271
    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v10, v10

    div-float v10, v0, v10

    iput v10, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    .line 276
    .end local v0    # "fh":F
    .end local v1    # "fw":F
    :goto_0
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    const/high16 v11, 0x40400000    # 3.0f

    cmpg-float v10, v10, v11

    if-gez v10, :cond_2

    .line 277
    const/high16 v10, 0x40400000    # 3.0f

    iput v10, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    .line 280
    :cond_2
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v11, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpg-float v10, v10, v11

    if-ltz v10, :cond_3

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v11, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    cmpl-float v10, v10, v11

    if-gtz v10, :cond_3

    if-eqz p1, :cond_4

    .line 281
    :cond_3
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    iput v10, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    .line 282
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    iput v10, p0, Lcom/vkontakte/android/ui/PhotoView;->animScale:F

    .line 285
    :cond_4
    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v7, v10

    .local v7, "iw":F
    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v4, v10

    .local v4, "ih":F
    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eqz v10, :cond_c

    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v3, v10

    .local v3, "i2w":F
    :goto_1
    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eqz v10, :cond_d

    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v2, v10

    .line 286
    .local v2, "i2h":F
    :goto_2
    const/4 v10, 0x0

    cmpl-float v10, v7, v10

    if-eqz v10, :cond_5

    const/4 v10, 0x0

    cmpl-float v10, v4, v10

    if-nez v10, :cond_6

    .line 287
    :cond_5
    const/high16 v4, 0x3f800000    # 1.0f

    move v7, v4

    .line 289
    :cond_6
    const/4 v10, 0x0

    cmpl-float v10, v3, v10

    if-eqz v10, :cond_7

    const/4 v10, 0x0

    cmpl-float v10, v2, v10

    if-nez v10, :cond_8

    .line 290
    :cond_7
    const/high16 v2, 0x3f800000    # 1.0f

    move v3, v2

    .line 292
    :cond_8
    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eqz v10, :cond_a

    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->loaded:Z

    if-nez v10, :cond_9

    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->thumb:Z

    if-eqz v10, :cond_a

    .line 293
    :cond_9
    div-float v6, v3, v2

    .local v6, "iratio2":F
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    iget v11, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    div-float v9, v10, v11

    .line 294
    .local v9, "sratio2":F
    cmpl-float v10, v6, v9

    if-lez v10, :cond_e

    .line 295
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    div-float/2addr v10, v3

    iput v10, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleNext:F

    .line 300
    .end local v6    # "iratio2":F
    .end local v9    # "sratio2":F
    :cond_a
    :goto_3
    const-string/jumbo v10, "vk_photoview"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Update scale, min="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, ", max="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, ", next="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleNext:F

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, ", current="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    return-void

    .line 273
    .end local v2    # "i2h":F
    .end local v3    # "i2w":F
    .end local v4    # "ih":F
    .end local v7    # "iw":F
    :cond_b
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    iget-object v11, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v11, v11, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v11, v11

    div-float/2addr v10, v11

    iput v10, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    .line 274
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    iget-object v11, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v11, v11, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v11, v11

    div-float/2addr v10, v11

    iput v10, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    goto/16 :goto_0

    .line 285
    .restart local v4    # "ih":F
    .restart local v7    # "iw":F
    :cond_c
    const/high16 v3, 0x3f800000    # 1.0f

    goto/16 :goto_1

    .restart local v3    # "i2w":F
    :cond_d
    const/high16 v2, 0x3f800000    # 1.0f

    goto/16 :goto_2

    .line 297
    .restart local v2    # "i2h":F
    .restart local v6    # "iratio2":F
    .restart local v9    # "sratio2":F
    :cond_e
    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    div-float/2addr v10, v2

    iput v10, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleNext:F

    goto :goto_3
.end method

.method private updateTextures()V
    .locals 5

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    const/4 v3, 0x0

    .line 457
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView;->isList:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    if-eqz v0, :cond_1

    :cond_0
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_5

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_5

    .line 458
    :cond_1
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2

    .line 459
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    div-float/2addr v1, v4

    add-float/2addr v0, v1

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 461
    :cond_2
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_3

    .line 462
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    div-float/2addr v1, v4

    add-float/2addr v0, v1

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 464
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eqz v0, :cond_4

    .line 465
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 466
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/PhotoView;->updateScale(Z)V

    .line 483
    :cond_4
    :goto_0
    return-void

    .line 469
    :cond_5
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_6

    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eq v0, v1, :cond_6

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    if-lez v0, :cond_6

    .line 471
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texturePrev:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 472
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->secondIsNext:Z

    .line 473
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/PhotoView;->updateScale(Z)V

    goto :goto_0

    .line 475
    :cond_6
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_4

    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eq v0, v1, :cond_4

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 477
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    .line 478
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView;->secondIsNext:Z

    .line 479
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/PhotoView;->updateScale(Z)V

    goto :goto_0
.end method

.method private updateViewportSizeDelayed()V
    .locals 2

    .prologue
    .line 201
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/PhotoView$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/PhotoView$2;-><init>(Lcom/vkontakte/android/ui/PhotoView;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 218
    return-void
.end method


# virtual methods
.method public addOverlayView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 425
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    if-nez v0, :cond_0

    .line 426
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    .line 427
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 428
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 430
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->customOverlayContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 431
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlayViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 432
    return-void
.end method

.method public animateIn(Landroid/graphics/Rect;II)V
    .locals 2
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "clipSize"    # I
    .param p3, "clipBottom"    # I

    .prologue
    .line 743
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbRect:Landroid/graphics/Rect;

    .line 744
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbRect:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, p2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 745
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbRect:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, p3

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 746
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView;->inAnimDone:Z

    .line 747
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->windowBg:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 748
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ClippingImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/PhotoView$4;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/vkontakte/android/ui/PhotoView$4;-><init>(Lcom/vkontakte/android/ui/PhotoView;Landroid/graphics/Rect;II)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 804
    return-void
.end method

.method public animateOut(Landroid/graphics/Rect;IILjava/lang/Runnable;)V
    .locals 7
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "clipSize"    # I
    .param p3, "clipBottom"    # I
    .param p4, "after"    # Ljava/lang/Runnable;

    .prologue
    .line 807
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView;->inAnimDone:Z

    if-nez v0, :cond_0

    .line 883
    :goto_0
    return-void

    .line 810
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ClippingImageView;->setVisibility(I)V

    .line 811
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ClippingImageView;->clearAnimation()V

    .line 812
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v0, v0, Lcom/vkontakte/android/ui/PhotoView$Texture;->data:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 813
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v1, v1, Lcom/vkontakte/android/ui/PhotoView$Texture;->data:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ClippingImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 815
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->requestLayout()V

    .line 816
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ClippingImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v6

    new-instance v0, Lcom/vkontakte/android/ui/PhotoView$5;

    move-object v1, p0

    move-object v2, p1

    move v3, p3

    move v4, p2

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/PhotoView$5;-><init>(Lcom/vkontakte/android/ui/PhotoView;Landroid/graphics/Rect;IILjava/lang/Runnable;)V

    invoke-virtual {v6, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_0
.end method

.method public getOverlayView()Landroid/view/View;
    .locals 6

    .prologue
    const/high16 v4, 0x42a00000    # 80.0f

    .line 342
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    .line 421
    :goto_0
    return-object v0

    .line 345
    :cond_0
    new-instance v0, Lcom/vkontakte/android/ui/PhotoView$3;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/PhotoView$3;-><init>(Lcom/vkontakte/android/ui/PhotoView;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    .line 416
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 417
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 418
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->progressBar:Lcom/vkontakte/android/ui/CircularProgressBar;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    const/16 v5, 0x11

    invoke-direct {v2, v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 419
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 421
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    goto :goto_0
.end method

.method public getPhotoHeight()I
    .locals 1

    .prologue
    .line 1336
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v0, v0, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    return v0
.end method

.method public getPhotoWidth()I
    .locals 1

    .prologue
    .line 1332
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v0, v0, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    return v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 449
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    return v0
.end method

.method public getScale()F
    .locals 1

    .prologue
    .line 1328
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    return v0
.end method

.method public getTranslateX()F
    .locals 1

    .prologue
    .line 1320
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    return v0
.end method

.method public getTranslateY()F
    .locals 1

    .prologue
    .line 1324
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    return v0
.end method

.method public goToNext()V
    .locals 3

    .prologue
    .line 1067
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v1, v1

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sub-float/2addr v1, v2

    sget v2, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/PhotoView;->animateTo(FFF)V

    .line 1068
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/PhotoView;->postSwitch(Z)V

    .line 1070
    return-void
.end method

.method public goToPrev()V
    .locals 3

    .prologue
    .line 1073
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v1, v1

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    add-float/2addr v1, v2

    sget v2, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/PhotoView;->animateTo(FFF)V

    .line 1074
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/PhotoView;->postSwitch(Z)V

    .line 1077
    return-void
.end method

.method synthetic lambda$init$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 158
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->onRetryClick()V

    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 4

    .prologue
    .line 222
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 223
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 224
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 3

    .prologue
    .line 228
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 230
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->queueLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->loadingBitmaps:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    .line 234
    .local v0, "t":Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;
    invoke-virtual {v0}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;->cancel()V

    goto :goto_1

    .line 236
    .end local v0    # "t":Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->loadingBitmaps:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->clear()V

    .line 237
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->queueLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 238
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 239
    return-void

    .line 231
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    const/4 v9, 0x0

    const/4 v2, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    .line 966
    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v4, v4, v5

    if-nez v4, :cond_1

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v4, v4, v9

    if-lez v4, :cond_1

    .line 988
    :cond_0
    :goto_0
    return v2

    .line 969
    :cond_1
    iget-wide v4, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    iget-wide v6, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    add-long/2addr v4, v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gtz v4, :cond_0

    .line 972
    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v5, v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    add-float/2addr v5, v6

    cmpl-float v4, v4, v5

    if-gtz v4, :cond_0

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v5, v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    sub-float/2addr v5, v6

    cmpg-float v4, v4, v5

    if-ltz v4, :cond_0

    .line 975
    iget-object v4, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v4, v4, Lcom/vkontakte/android/ui/PhotoView$Texture;->loaded:Z

    if-eqz v4, :cond_0

    .line 979
    :cond_2
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    cmpg-float v2, v2, v4

    if-gez v2, :cond_3

    .line 980
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    div-float/2addr v4, v8

    sub-float/2addr v2, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    div-float/2addr v5, v8

    sub-float/2addr v4, v5

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    sub-float/2addr v4, v5

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    div-float/2addr v5, v6

    mul-float/2addr v4, v5

    sub-float v0, v2, v4

    .line 981
    .local v0, "atx":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    div-float/2addr v4, v8

    sub-float/2addr v2, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    div-float/2addr v5, v8

    sub-float/2addr v4, v5

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    sub-float/2addr v4, v5

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    div-float/2addr v5, v6

    mul-float/2addr v4, v5

    sub-float v1, v2, v4

    .line 982
    .local v1, "aty":F
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/PhotoView;->updateMinMax(F)V

    .line 983
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v4, v4

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v5, v5

    invoke-direct {p0, v0, v4, v5}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v4

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    int-to-float v5, v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    int-to-float v6, v6

    invoke-direct {p0, v1, v5, v6}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v5

    invoke-direct {p0, v2, v4, v5}, Lcom/vkontakte/android/ui/PhotoView;->animateTo(FFF)V

    .line 987
    .end local v0    # "atx":F
    .end local v1    # "aty":F
    :goto_1
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/PhotoView;->doubleTap:Z

    move v2, v3

    .line 988
    goto/16 :goto_0

    .line 985
    :cond_3
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    invoke-direct {p0, v2, v9, v9}, Lcom/vkontakte/android/ui/PhotoView;->animateTo(FFF)V

    goto :goto_1
.end method

.method public onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 994
    const/4 v0, 0x0

    return v0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 1009
    const/4 v0, 0x0

    return v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 14
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 1348
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/PhotoView;->inAnimDone:Z

    if-eqz v9, :cond_0

    iget-boolean v9, p0, Lcom/vkontakte/android/ui/PhotoView;->outAnimDone:Z

    if-nez v9, :cond_1

    .line 1451
    :cond_0
    :goto_0
    return-void

    .line 1353
    :cond_1
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbRect:Landroid/graphics/Rect;

    if-eqz v9, :cond_2

    .line 1354
    const/4 v9, 0x2

    new-array v4, v9, [I

    fill-array-data v4, :array_0

    .line 1355
    .local v4, "f":[I
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/ui/PhotoView;->getLocationOnScreen([I)V

    .line 1356
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 1357
    const/4 v9, 0x0

    const/4 v10, 0x1

    aget v10, v4, v10

    neg-int v10, v10

    int-to-float v10, v10

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1358
    const/4 v9, 0x0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingTop()I

    move-result v10

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v11

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v12

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingBottom()I

    move-result v13

    sub-int/2addr v12, v13

    invoke-virtual {p1, v9, v10, v11, v12}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 1359
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbRect:Landroid/graphics/Rect;

    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->bgPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 1360
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 1363
    .end local v4    # "f":[I
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 1364
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getWidth()I

    move-result v9

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingLeft()I

    move-result v10

    sub-int/2addr v9, v10

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingRight()I

    move-result v10

    sub-int/2addr v9, v10

    div-int/lit8 v9, v9, 0x2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingLeft()I

    move-result v10

    add-int/2addr v9, v10

    int-to-float v9, v9

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getHeight()I

    move-result v10

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingTop()I

    move-result v11

    sub-int/2addr v10, v11

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingBottom()I

    move-result v11

    sub-int/2addr v10, v11

    div-int/lit8 v10, v10, 0x2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingTop()I

    move-result v11

    add-int/2addr v10, v11

    int-to-float v10, v10

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1365
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 1366
    .local v2, "aty":F
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    iget-wide v12, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    sub-long/2addr v10, v12

    iget-wide v12, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    cmp-long v9, v10, v12

    if-gez v9, :cond_e

    .line 1367
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->isFinished()Z

    move-result v9

    if-nez v9, :cond_3

    .line 1368
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1370
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    iget-wide v12, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    sub-long/2addr v10, v12

    long-to-float v9, v10

    iget-wide v10, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    long-to-float v10, v10

    div-float v0, v9, v10

    .line 1371
    .local v0, "a":F
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->itrp:Landroid/view/animation/Interpolator;

    invoke-interface {v9, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    .line 1372
    .local v1, "ai":F
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->animScale:F

    iget v11, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    sub-float/2addr v10, v11

    mul-float/2addr v10, v1

    add-float v6, v9, v10

    .line 1373
    .local v6, "ts":F
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->animTx:F

    iget v11, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    sub-float/2addr v10, v11

    mul-float/2addr v10, v1

    add-float v7, v9, v10

    .line 1374
    .local v7, "tx":F
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->animTy:F

    iget v11, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    sub-float/2addr v10, v11

    mul-float/2addr v10, v1

    add-float v8, v9, v10

    .line 1375
    .local v8, "ty":F
    div-float/2addr v7, v6

    .line 1376
    div-float/2addr v8, v6

    .line 1377
    move v2, v8

    .line 1378
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v9, v9

    sub-float v9, v7, v9

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getWidth()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    int-to-float v10, v10

    cmpl-float v9, v9, v10

    if-lez v9, :cond_d

    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    if-lez v9, :cond_d

    .line 1379
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v9, v9, -0x1

    invoke-direct {p0, v9}, Lcom/vkontakte/android/ui/PhotoView;->callPositionChanged(I)V

    .line 1383
    :cond_4
    :goto_1
    invoke-virtual {p1, v6, v6}, Landroid/graphics/Canvas;->scale(FF)V

    .line 1384
    invoke-virtual {p1, v7, v8}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1385
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->invalidate()V

    .line 1417
    .end local v0    # "a":F
    .end local v1    # "ai":F
    .end local v6    # "ts":F
    .end local v7    # "tx":F
    .end local v8    # "ty":F
    :goto_2
    const/16 v3, 0xff

    .line 1418
    .local v3, "ba":I
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v9, v9, v10

    if-nez v9, :cond_7

    .line 1419
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 1420
    const/4 v2, 0x0

    .line 1422
    :cond_5
    const/high16 v9, 0x3f800000    # 1.0f

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v10

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getHeight()I

    move-result v11

    int-to-float v11, v11

    div-float/2addr v10, v11

    sub-float/2addr v9, v10

    iput v9, p0, Lcom/vkontakte/android/ui/PhotoView;->bgAlpha:F

    .line 1423
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    if-eqz v9, :cond_6

    .line 1424
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->bgAlpha:F

    invoke-interface {v9, v10}, Lcom/vkontakte/android/ui/PhotoView$DismissListener;->onBackgroundAlphaChanged(F)V

    .line 1426
    :cond_6
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->bgAlpha:F

    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 1429
    :cond_7
    shl-int/lit8 v9, v3, 0x18

    invoke-virtual {p1, v9}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 1431
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eqz v9, :cond_a

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->loaded:Z

    if-nez v9, :cond_8

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->thumb:Z

    if-eqz v9, :cond_a

    :cond_8
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->data:Landroid/graphics/Bitmap;

    if-eqz v9, :cond_a

    .line 1432
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->progressBar:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-virtual {v9}, Lcom/vkontakte/android/ui/CircularProgressBar;->getVisibility()I

    move-result v9

    const/16 v10, 0x8

    if-eq v9, v10, :cond_9

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->thumb:Z

    if-nez v9, :cond_9

    .line 1433
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->progressBar:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->cancelVisibilityAnimation(Landroid/view/View;)V

    .line 1434
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->progressBar:Lcom/vkontakte/android/ui/CircularProgressBar;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/ui/CircularProgressBar;->setVisibility(I)V

    .line 1439
    :cond_9
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->data:Landroid/graphics/Bitmap;

    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    neg-int v10, v10

    int-to-float v10, v10

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    iget-object v11, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v11, v11, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    neg-int v11, v11

    int-to-float v11, v11

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v11, v12

    iget-object v12, p0, Lcom/vkontakte/android/ui/PhotoView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v9, v10, v11, v12}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 1441
    :cond_a
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v9, v9, v10

    if-ltz v9, :cond_c

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eqz v9, :cond_c

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->data:Landroid/graphics/Bitmap;

    if-eqz v9, :cond_c

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->loaded:Z

    if-nez v9, :cond_b

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->thumb:Z

    if-eqz v9, :cond_c

    .line 1442
    :cond_b
    const/4 v9, 0x0

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    neg-float v10, v10

    iget v11, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    div-float/2addr v10, v11

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1443
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/PhotoView;->secondIsNext:Z

    if-eqz v9, :cond_14

    const/high16 v5, 0x3f800000    # 1.0f

    .line 1444
    .local v5, "k":F
    :goto_3
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v10, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v10, v10

    add-float/2addr v9, v10

    mul-float/2addr v9, v5

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    div-float/2addr v9, v10

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    const/4 v10, 0x0

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1445
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleNext:F

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    div-float/2addr v9, v10

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleNext:F

    iget v11, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    div-float/2addr v10, v11

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Canvas;->scale(FF)V

    .line 1446
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v10, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v10, v10

    add-float/2addr v9, v10

    mul-float/2addr v9, v5

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleNext:F

    div-float/2addr v9, v10

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    const/4 v10, 0x0

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1447
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-object v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->data:Landroid/graphics/Bitmap;

    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    neg-int v10, v10

    int-to-float v10, v10

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    iget-object v11, p0, Lcom/vkontakte/android/ui/PhotoView;->texture2:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget v11, v11, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    neg-int v11, v11

    int-to-float v11, v11

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v11, v12

    iget-object v12, p0, Lcom/vkontakte/android/ui/PhotoView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v9, v10, v11, v12}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 1449
    .end local v5    # "k":F
    :cond_c
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 1450
    invoke-direct {p0}, Lcom/vkontakte/android/ui/PhotoView;->applyOverlayTransform()V

    goto/16 :goto_0

    .line 1380
    .end local v3    # "ba":I
    .restart local v0    # "a":F
    .restart local v1    # "ai":F
    .restart local v6    # "ts":F
    .restart local v7    # "tx":F
    .restart local v8    # "ty":F
    :cond_d
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v9, v9

    sub-float v9, v7, v9

    neg-float v9, v9

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getWidth()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    int-to-float v10, v10

    cmpl-float v9, v9, v10

    if-lez v9, :cond_4

    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v10}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->getCount()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    if-ge v9, v10, :cond_4

    .line 1381
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v9, v9, 0x1

    invoke-direct {p0, v9}, Lcom/vkontakte/android/ui/PhotoView;->callPositionChanged(I)V

    goto/16 :goto_1

    .line 1387
    .end local v0    # "a":F
    .end local v1    # "ai":F
    .end local v6    # "ts":F
    .end local v7    # "tx":F
    .end local v8    # "ty":F
    :cond_e
    iget-wide v10, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    const-wide/16 v12, 0x0

    cmp-long v9, v10, v12

    if-eqz v9, :cond_10

    .line 1388
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->animTx:F

    iput v9, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 1389
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->animTy:F

    iput v9, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 1390
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->animScale:F

    iput v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    .line 1391
    const/high16 v9, 0x3f800000    # 1.0f

    iput v9, p0, Lcom/vkontakte/android/ui/PhotoView;->bgAlpha:F

    .line 1392
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    if-eqz v9, :cond_f

    .line 1393
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->bgAlpha:F

    invoke-interface {v9, v10}, Lcom/vkontakte/android/ui/PhotoView$DismissListener;->onBackgroundAlphaChanged(F)V

    .line 1395
    :cond_f
    const-wide/16 v10, 0x0

    iput-wide v10, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    .line 1396
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    invoke-direct {p0, v9}, Lcom/vkontakte/android/ui/PhotoView;->updateMinMax(F)V

    .line 1398
    :cond_10
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->isFinished()Z

    move-result v9

    if-nez v9, :cond_13

    .line 1399
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v9

    if-eqz v9, :cond_13

    .line 1400
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->getStartX()I

    move-result v9

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    if-ge v9, v10, :cond_11

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->getStartX()I

    move-result v9

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    if-le v9, v10, :cond_11

    .line 1401
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->getCurrX()I

    move-result v9

    int-to-float v9, v9

    iput v9, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 1403
    :cond_11
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->getStartY()I

    move-result v9

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    if-ge v9, v10, :cond_12

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->getStartY()I

    move-result v9

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    if-le v9, v10, :cond_12

    .line 1404
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->getCurrY()I

    move-result v9

    int-to-float v9, v9

    iput v9, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 1407
    :cond_12
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->invalidate()V

    .line 1411
    :cond_13
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1412
    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v10, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Canvas;->scale(FF)V

    .line 1413
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 1414
    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    invoke-virtual {v9}, Landroid/widget/FrameLayout;->invalidate()V

    goto/16 :goto_2

    .line 1443
    .restart local v3    # "ba":I
    :cond_14
    const/high16 v5, -0x40800000    # -1.0f

    goto/16 :goto_3

    .line 1354
    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 10
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/4 v9, 0x1

    const/4 v3, 0x0

    .line 1014
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    if-eqz v0, :cond_1

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x447a0000    # 1000.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 1015
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    if-eqz v0, :cond_1

    .line 1016
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/PhotoView$DismissListener;->onDismiss()V

    .line 1017
    iput-boolean v9, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissed:Z

    .line 1037
    :cond_0
    :goto_0
    return v9

    .line 1021
    :cond_1
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    cmpl-float v0, v0, v3

    if-gtz v0, :cond_2

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    neg-float v0, v0

    cmpl-float v0, v0, v3

    if-lez v0, :cond_4

    .line 1022
    :cond_2
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x44228000    # 650.0f

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->density:F

    mul-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_4

    .line 1023
    const-string/jumbo v0, "vk_photoview"

    const-string/jumbo v1, "Switch by velocity"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1024
    cmpl-float v0, p3, v3

    if-lez v0, :cond_3

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    if-lez v0, :cond_3

    .line 1026
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->goToPrev()V

    goto :goto_0

    .line 1027
    :cond_3
    cmpg-float v0, p3, v3

    if-gez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 1028
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->goToNext()V

    goto :goto_0

    .line 1033
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchEndTime:J

    const-wide/16 v4, 0x12c

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 1034
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result v4

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 1035
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->postInvalidate()V

    goto :goto_0
.end method

.method public onLayout(ZIIII)V
    .locals 1
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 188
    if-eqz p1, :cond_0

    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/ui/PhotoView;->updateViewportSizeDelayed()V

    .line 191
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoView;->inited:Z

    .line 192
    return-void
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 1044
    return-void
.end method

.method onRetryClick()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 184
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    new-instance v1, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    invoke-direct {v1, p0, v2, v4, v3}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;-><init>(Lcom/vkontakte/android/ui/PhotoView;IZLcom/vkontakte/android/ui/PhotoView$Texture;)V

    aput-object v1, v0, v4

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/PhotoView;->load(Ljava/util/List;)V

    .line 185
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 1050
    const/4 v0, 0x0

    return v0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 1057
    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 999
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->clickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    .line 1000
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->clickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 1001
    const/4 v0, 0x1

    .line 1003
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 1062
    const/4 v0, 0x0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 488
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    sub-long/2addr v6, v8

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    cmp-long v5, v6, v8

    if-gez v5, :cond_0

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->animScale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    cmpl-float v5, v5, v6

    if-eqz v5, :cond_0

    .line 489
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dropTouches:Z

    .line 491
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eqz v5, :cond_1

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->inited:Z

    if-eqz v5, :cond_1

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dropTouches:Z

    if-nez v5, :cond_1

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->inAnimDone:Z

    if-eqz v5, :cond_1

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->outAnimDone:Z

    if-eqz v5, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->isEnabled()Z

    move-result v5

    if-nez v5, :cond_3

    .line 492
    :cond_1
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dropTouches:Z

    .line 493
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    .line 494
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dropTouches:Z

    .line 496
    :cond_2
    const/4 v5, 0x1

    .line 715
    :goto_0
    return v5

    .line 498
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_5

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    iget-boolean v5, v5, Lcom/vkontakte/android/ui/PhotoView$Texture;->loaded:Z

    if-nez v5, :cond_5

    .line 499
    :cond_4
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dropTouches:Z

    .line 500
    const/4 v5, 0x1

    goto :goto_0

    .line 502
    :cond_5
    const/4 v3, 0x0

    .line 503
    .local v3, "d":Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_6

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->detector:Landroid/view/GestureDetector;

    invoke-virtual {v5, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    if-eqz v3, :cond_6

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->doubleTap:Z

    if-eqz v5, :cond_6

    .line 504
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->doubleTap:Z

    .line 505
    const/4 v5, 0x1

    goto :goto_0

    .line 507
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_d

    .line 508
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    if-eqz v5, :cond_8

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    const/high16 v7, 0x40800000    # 4.0f

    div-float/2addr v6, v7

    cmpl-float v5, v5, v6

    if-lez v5, :cond_8

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissed:Z

    if-nez v5, :cond_8

    .line 509
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    if-eqz v5, :cond_7

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissed:Z

    if-nez v5, :cond_7

    .line 510
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    invoke-interface {v5}, Lcom/vkontakte/android/ui/PhotoView$DismissListener;->onDismiss()V

    .line 512
    :cond_7
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    .line 513
    const/4 v5, 0x1

    goto :goto_0

    .line 515
    :cond_8
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragging:Z

    .line 516
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    .line 517
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    invoke-direct {p0, v5, v6, v7}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v5

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->updateMinMax(F)V

    .line 518
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    sub-long/2addr v6, v8

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    cmp-long v5, v6, v8

    if-gez v5, :cond_9

    .line 519
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 521
    :cond_9
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getWidth()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_a

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    if-lez v5, :cond_a

    .line 522
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->goToPrev()V

    .line 523
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 525
    :cond_a
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    neg-float v5, v5

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getWidth()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_b

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v6}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->getCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v5, v6, :cond_b

    .line 526
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->goToNext()V

    .line 527
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 529
    :cond_b
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v6, v6

    cmpg-float v5, v5, v6

    if-ltz v5, :cond_c

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-gtz v5, :cond_c

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    int-to-float v6, v6

    cmpg-float v5, v5, v6

    if-ltz v5, :cond_c

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_d

    .line 530
    :cond_c
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    invoke-direct {p0, v5, v6, v7}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v7, v7

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v8, v8

    invoke-direct {p0, v6, v7, v8}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v6

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    int-to-float v8, v8

    iget v9, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    int-to-float v9, v9

    invoke-direct {p0, v7, v8, v9}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v7

    invoke-direct {p0, v5, v6, v7}, Lcom/vkontakte/android/ui/PhotoView;->animateTo(FFF)V

    .line 536
    :cond_d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    if-nez v5, :cond_12

    .line 537
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->isFinished()Z

    move-result v5

    if-nez v5, :cond_e

    .line 538
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->abortAnimation()V

    .line 540
    :cond_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    sub-long/2addr v6, v8

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    cmp-long v5, v6, v8

    if-gez v5, :cond_f

    .line 542
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->itrp:Landroid/view/animation/Interpolator;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    sub-long/2addr v6, v8

    long-to-float v6, v6

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    long-to-float v7, v8

    div-float/2addr v6, v7

    invoke-interface {v5, v6}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    .line 543
    .local v0, "at":F
    const-wide/16 v6, 0x0

    iput-wide v6, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    .line 544
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->animTx:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    sub-float/2addr v6, v7

    mul-float/2addr v6, v0

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 545
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->animTy:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    sub-float/2addr v6, v7

    mul-float/2addr v6, v0

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 546
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->animScale:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    sub-float/2addr v6, v7

    mul-float/2addr v6, v0

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    .line 547
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->invalidate()V

    .line 549
    .end local v0    # "at":F
    :cond_f
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->postedPhotoSwitch:Ljava/lang/Runnable;

    if-eqz v5, :cond_10

    .line 550
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->postedPhotoSwitch:Ljava/lang/Runnable;

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 551
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->postedPhotoSwitch:Ljava/lang/Runnable;

    .line 553
    :cond_10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    .line 554
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartY:F

    .line 555
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartTx:F

    .line 556
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartTy:F

    .line 557
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartPointerID:I

    .line 558
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->prevCallbackPos:I

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    if-eq v5, v6, :cond_12

    .line 559
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->prevCallbackPos:I

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v6, v6, 0x1

    if-ne v5, v6, :cond_14

    .line 560
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v7, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    .line 561
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v7, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 562
    const/4 v5, 0x1

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->switchPhoto(Z)V

    .line 568
    :cond_11
    :goto_1
    invoke-direct {p0}, Lcom/vkontakte/android/ui/PhotoView;->updateTextures()V

    .line 569
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->invalidate()V

    .line 571
    const-string/jumbo v5, "vk_photoview"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Already switched "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->prevCallbackPos:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    :cond_12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_1e

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1e

    .line 575
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchEndTime:J

    const-wide/16 v10, 0x12c

    add-long/2addr v8, v10

    cmp-long v5, v6, v8

    if-ltz v5, :cond_13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    sub-long/2addr v6, v8

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    cmp-long v5, v6, v8

    if-gez v5, :cond_15

    .line 577
    :cond_13
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 563
    :cond_14
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->prevCallbackPos:I

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v6, v6, -0x1

    if-ne v5, v6, :cond_11

    .line 564
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v7, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    .line 565
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v7, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 566
    const/4 v5, 0x0

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->switchPhoto(Z)V

    goto :goto_1

    .line 579
    :cond_15
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartPointerID:I

    const/4 v6, 0x0

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    if-eq v5, v6, :cond_16

    .line 580
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    .line 581
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartY:F

    .line 582
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartTx:F

    .line 583
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartTy:F

    .line 584
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartPointerID:I

    .line 585
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 590
    :cond_16
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    if-gtz v5, :cond_17

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->isList:Z

    if-eqz v5, :cond_20

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    if-nez v5, :cond_20

    .line 591
    :cond_17
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartTx:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    add-float/2addr v5, v6

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 592
    invoke-direct {p0}, Lcom/vkontakte/android/ui/PhotoView;->updateTextures()V

    .line 596
    :goto_2
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v5, v5, v6

    if-nez v5, :cond_19

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    cmpl-float v5, v5, v6

    if-gtz v5, :cond_18

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    cmpg-float v5, v5, v6

    if-gez v5, :cond_19

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragging:Z

    if-nez v5, :cond_19

    .line 597
    :cond_18
    const/4 v5, 0x0

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 599
    :cond_19
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v5, v5, v6

    if-nez v5, :cond_1a

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1a

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragging:Z

    if-nez v5, :cond_1a

    .line 600
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragging:Z

    .line 601
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    const/4 v6, 0x0

    cmpl-float v5, v5, v6

    if-lez v5, :cond_21

    .line 602
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    .line 603
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 610
    :cond_1a
    :goto_3
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartTy:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    add-float/2addr v5, v6

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartY:F

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 611
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v5, v5, v6

    if-eqz v5, :cond_22

    .line 612
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1b

    .line 613
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    int-to-float v5, v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    int-to-float v7, v7

    sub-float/2addr v6, v7

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 615
    :cond_1b
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    int-to-float v6, v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_1c

    .line 616
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    int-to-float v5, v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    int-to-float v7, v7

    sub-float/2addr v6, v7

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 640
    :cond_1c
    :goto_4
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getWidth()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_28

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    if-lez v5, :cond_28

    .line 641
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v5, v5, -0x1

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->callPositionChanged(I)V

    .line 647
    :goto_5
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v5, v5, v6

    if-nez v5, :cond_1d

    .line 649
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    const/4 v6, 0x0

    cmpg-float v5, v5, v6

    if-gez v5, :cond_2a

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    neg-float v5, v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v7, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    cmpl-float v5, v5, v6

    if-lez v5, :cond_2a

    .line 650
    const/4 v5, 0x1

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->switchPhoto(Z)V

    .line 651
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v7, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    .line 652
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v7, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 659
    :cond_1d
    :goto_6
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->invalidate()V

    .line 660
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/ClippingImageView;->getVisibility()I

    move-result v5

    if-nez v5, :cond_1e

    .line 661
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    invoke-virtual {v5}, Landroid/widget/FrameLayout;->invalidate()V

    .line 664
    :cond_1e
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    if-nez v5, :cond_1f

    iget-wide v6, p0, Lcom/vkontakte/android/ui/PhotoView;->animStartTime:J

    iget-wide v8, p0, Lcom/vkontakte/android/ui/PhotoView;->animDuration:J

    add-long/2addr v6, v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-lez v5, :cond_2b

    :cond_1f
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_2b

    .line 665
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 594
    :cond_20
    const/4 v5, 0x0

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    goto/16 :goto_2

    .line 605
    :cond_21
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    .line 606
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    goto/16 :goto_3

    .line 618
    :cond_22
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpl-float v5, v5, v6

    if-nez v5, :cond_1c

    .line 619
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    cmpl-float v5, v5, v6

    if-gtz v5, :cond_24

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    cmpg-float v5, v5, v6

    if-gez v5, :cond_23

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    if-eqz v5, :cond_24

    :cond_23
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragging:Z

    if-eqz v5, :cond_25

    .line 620
    :cond_24
    const/4 v5, 0x0

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    goto/16 :goto_4

    .line 621
    :cond_25
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1c

    .line 626
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    if-eqz v5, :cond_26

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    if-nez v5, :cond_26

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissed:Z

    if-nez v5, :cond_26

    .line 627
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    invoke-interface {v5}, Lcom/vkontakte/android/ui/PhotoView$DismissListener;->onPrepareDismiss()V

    .line 628
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    const/4 v6, 0x0

    cmpl-float v5, v5, v6

    if-lez v5, :cond_27

    .line 629
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartY:F

    .line 630
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 636
    :cond_26
    :goto_7
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    goto/16 :goto_4

    .line 632
    :cond_27
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartY:F

    .line 633
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    goto :goto_7

    .line 642
    :cond_28
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    neg-float v5, v5

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->getWidth()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_29

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v6}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->getCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v5, v6, :cond_29

    .line 643
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v5, v5, 0x1

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->callPositionChanged(I)V

    goto/16 :goto_5

    .line 645
    :cond_29
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->callPositionChanged(I)V

    goto/16 :goto_5

    .line 653
    :cond_2a
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    const/4 v6, 0x0

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1d

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v7, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1d

    .line 654
    const/4 v5, 0x0

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->switchPhoto(Z)V

    .line 655
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v7, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    add-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartX:F

    .line 656
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    sget v7, Lcom/vkontakte/android/ui/PhotoView;->PAGE_SPACING:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    goto/16 :goto_6

    .line 668
    :cond_2b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    and-int/lit16 v5, v5, 0xff

    const/4 v6, 0x5

    if-ne v5, v6, :cond_2e

    .line 671
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    neg-float v5, v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    cmpl-float v5, v5, v6

    if-gtz v5, :cond_2c

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->touchslop:F

    cmpl-float v5, v5, v6

    if-lez v5, :cond_2d

    .line 672
    :cond_2c
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->disallowZoom:Z

    .line 673
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 675
    :cond_2d
    const/4 v5, 0x1

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    sub-float/2addr v5, v6

    float-to-double v6, v5

    const/4 v5, 0x1

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    const/4 v8, 0x0

    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    sub-float/2addr v5, v8

    float-to-double v8, v5

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    double-to-float v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchStartDist:F

    .line 676
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchStartScale:F

    .line 677
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    const/4 v6, 0x1

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    add-float/2addr v5, v6

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchCenterX:F

    .line 678
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    const/4 v6, 0x1

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    add-float/2addr v5, v6

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchCenterY:F

    .line 679
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleStartTx:F

    .line 680
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleStartTy:F

    .line 682
    :cond_2e
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    and-int/lit16 v5, v5, 0xff

    const/4 v6, 0x6

    if-ne v5, v6, :cond_31

    .line 683
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->disallowZoom:Z

    if-eqz v5, :cond_2f

    .line 684
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->disallowZoom:Z

    .line 685
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 687
    :cond_2f
    const/4 v5, -0x1

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dragStartPointerID:I

    .line 688
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    cmpg-float v5, v5, v6

    if-gez v5, :cond_33

    .line 689
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {p0, v5, v6, v7}, Lcom/vkontakte/android/ui/PhotoView;->animateTo(FFF)V

    .line 690
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->updateMinMax(F)V

    .line 697
    :cond_30
    :goto_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchEndTime:J

    .line 699
    :cond_31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    and-int/lit16 v5, v5, 0xff

    const/4 v6, 0x2

    if-ne v5, v6, :cond_37

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_37

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    if-eqz v5, :cond_32

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    invoke-interface {v5, v6}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->allowZoom(I)Z

    move-result v5

    if-eqz v5, :cond_37

    .line 700
    :cond_32
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->disallowZoom:Z

    if-eqz v5, :cond_34

    .line 701
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 691
    :cond_33
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    cmpl-float v5, v5, v6

    if-lez v5, :cond_30

    .line 692
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/PhotoView;->updateMinMax(F)V

    .line 693
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v6, v6

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v7, v7

    invoke-direct {p0, v5, v6, v7}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v1

    .line 694
    .local v1, "atx":F
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    int-to-float v6, v6

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    int-to-float v7, v7

    invoke-direct {p0, v5, v6, v7}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v2

    .line 695
    .local v2, "aty":F
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    invoke-direct {p0, v5, v1, v2}, Lcom/vkontakte/android/ui/PhotoView;->animateTo(FFF)V

    goto :goto_8

    .line 703
    .end local v1    # "atx":F
    .end local v2    # "aty":F
    :cond_34
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissing:Z

    if-eqz v5, :cond_35

    .line 704
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 706
    :cond_35
    const/4 v5, 0x1

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    sub-float/2addr v5, v6

    float-to-double v6, v5

    const/4 v5, 0x1

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    const/4 v8, 0x0

    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    sub-float/2addr v5, v8

    float-to-double v8, v5

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    double-to-float v4, v6

    .line 707
    .local v4, "pinchDist":F
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchStartDist:F

    div-float v5, v4, v5

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchStartScale:F

    mul-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    .line 708
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchCenterX:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    sub-float/2addr v5, v6

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchCenterX:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportW:F

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v7, v8

    sub-float/2addr v6, v7

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleStartTx:F

    sub-float/2addr v6, v7

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchStartScale:F

    div-float/2addr v7, v8

    mul-float/2addr v6, v7

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 709
    iget v5, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchCenterY:F

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    sub-float/2addr v5, v6

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchCenterY:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->viewportH:F

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v7, v8

    sub-float/2addr v6, v7

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->scaleStartTy:F

    sub-float/2addr v6, v7

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoView;->pinchStartScale:F

    div-float/2addr v7, v8

    mul-float/2addr v6, v7

    sub-float/2addr v5, v6

    iput v5, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 710
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->zoomListener:Lcom/vkontakte/android/ui/PhotoView$ZoomListener;

    if-eqz v5, :cond_36

    .line 711
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->zoomListener:Lcom/vkontakte/android/ui/PhotoView$ZoomListener;

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v7, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    invoke-interface {v5, v6, v7, v8}, Lcom/vkontakte/android/ui/PhotoView$ZoomListener;->onZoomChanged(FFF)V

    .line 713
    :cond_36
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->invalidate()V

    .line 715
    .end local v4    # "pinchDist":F
    :cond_37
    const/4 v5, 0x1

    goto/16 :goto_0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/high16 v4, 0x42480000    # 50.0f

    const/4 v3, 0x0

    .line 894
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 895
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    mul-float/2addr v1, v4

    add-float/2addr v0, v1

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->minX:I

    int-to-float v1, v1

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxX:I

    int-to-float v2, v2

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 896
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    mul-float/2addr v1, v4

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->minY:I

    int-to-float v1, v1

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->maxY:I

    int-to-float v2, v2

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/PhotoView;->clamp(FFF)F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    .line 897
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->postInvalidate()V

    .line 899
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    .line 900
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_2

    .line 901
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->maxScale:F

    iget v1, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/PhotoView;->animateTo(FFF)V

    .line 906
    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 903
    :cond_2
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoView;->minScale:F

    invoke-direct {p0, v0, v3, v3}, Lcom/vkontakte/android/ui/PhotoView;->animateTo(FFF)V

    goto :goto_0
.end method

.method public setAdapter(Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;)V
    .locals 3
    .param p1, "a"    # Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    .prologue
    .line 1201
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    .line 1202
    iget-boolean v2, p0, Lcom/vkontakte/android/ui/PhotoView;->inited:Z

    if-eqz v2, :cond_0

    .line 1203
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/PhotoView;->loadPhotos(Z)V

    .line 1220
    :goto_0
    return-void

    .line 1205
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1206
    .local v0, "tt":J
    new-instance v2, Lcom/vkontakte/android/ui/PhotoView$7;

    invoke-direct {v2, p0, v0, v1}, Lcom/vkontakte/android/ui/PhotoView$7;-><init>(Lcom/vkontakte/android/ui/PhotoView;J)V

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/PhotoView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public setBgColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 259
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->bgPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 260
    return-void
.end method

.method public setDismissListener(Lcom/vkontakte/android/ui/PhotoView$DismissListener;)V
    .locals 0
    .param p1, "l"    # Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    .prologue
    .line 925
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    .line 926
    return-void
.end method

.method public setErrorText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 446
    return-void
.end method

.method public setFitBySmallestSide(Z)V
    .locals 0
    .param p1, "fit"    # Z

    .prologue
    .line 1340
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/PhotoView;->fitBySmallestSide:Z

    .line 1341
    return-void
.end method

.method public setLimitOffsets(II)V
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 915
    iput p2, p0, Lcom/vkontakte/android/ui/PhotoView;->limitY:I

    .line 916
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->limitX:I

    .line 918
    return-void
.end method

.method public setNavigationListener(Lcom/vkontakte/android/ui/PhotoView$NavigationListener;)V
    .locals 0
    .param p1, "l"    # Lcom/vkontakte/android/ui/PhotoView$NavigationListener;

    .prologue
    .line 921
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView;->navListener:Lcom/vkontakte/android/ui/PhotoView$NavigationListener;

    .line 922
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 911
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView;->clickListener:Landroid/view/View$OnClickListener;

    .line 912
    return-void
.end method

.method public setPadding(IIII)V
    .locals 0
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 196
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 197
    invoke-direct {p0}, Lcom/vkontakte/android/ui/PhotoView;->updateViewportSizeDelayed()V

    .line 198
    return-void
.end method

.method public setPosition(I)V
    .locals 6
    .param p1, "p"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 242
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    if-ne v2, p1, :cond_1

    .line 256
    :cond_0
    :goto_0
    return-void

    .line 245
    :cond_1
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    .line 246
    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    if-eqz v2, :cond_0

    .line 249
    const/4 v2, 0x0

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->translateY:F

    iput v2, p0, Lcom/vkontakte/android/ui/PhotoView;->translateX:F

    .line 250
    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/PhotoView;->updateScale(Z)V

    .line 251
    iget v2, p0, Lcom/vkontakte/android/ui/PhotoView;->scale:F

    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/PhotoView;->updateMinMax(F)V

    .line 252
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView;->postInvalidate()V

    .line 254
    const/4 v2, 0x2

    new-array v2, v2, [Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    new-instance v3, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->texture:Lcom/vkontakte/android/ui/PhotoView$Texture;

    invoke-direct {v3, p0, v4, v0, v5}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;-><init>(Lcom/vkontakte/android/ui/PhotoView;IZLcom/vkontakte/android/ui/PhotoView$Texture;)V

    aput-object v3, v2, v0

    new-instance v3, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;

    iget v4, p0, Lcom/vkontakte/android/ui/PhotoView;->listPosition:I

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->adapter:Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;

    invoke-interface {v5}, Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;->shouldPreload()Z

    move-result v5

    if-nez v5, :cond_2

    move v0, v1

    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView;->textureNext:Lcom/vkontakte/android/ui/PhotoView$Texture;

    invoke-direct {v3, p0, v4, v0, v5}, Lcom/vkontakte/android/ui/PhotoView$ImageLoadTask;-><init>(Lcom/vkontakte/android/ui/PhotoView;IZLcom/vkontakte/android/ui/PhotoView$Texture;)V

    aput-object v3, v2, v1

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/PhotoView;->load(Ljava/util/List;)V

    .line 255
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoView;->prevCallbackPos:I

    goto :goto_0
.end method

.method public setResetOnResize(Z)V
    .locals 0
    .param p1, "reset"    # Z

    .prologue
    .line 1344
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/PhotoView;->resetOnResize:Z

    .line 1345
    return-void
.end method

.method public setThumb(Landroid/graphics/Bitmap;Z)V
    .locals 2
    .param p1, "thumb"    # Landroid/graphics/Bitmap;
    .param p2, "showProgress"    # Z

    .prologue
    const/16 v0, 0x8

    .line 435
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/ui/ClippingImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 436
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbView:Lcom/vkontakte/android/ui/ClippingImageView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/ClippingImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/ViewParent;->requestLayout()V

    .line 437
    if-eqz p2, :cond_0

    .line 438
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->error:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 440
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->progressBar:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->cancelVisibilityAnimation(Landroid/view/View;)V

    .line 441
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView;->progressBar:Lcom/vkontakte/android/ui/CircularProgressBar;

    if-eqz p2, :cond_1

    const/4 v0, 0x0

    :cond_1
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/CircularProgressBar;->setVisibility(I)V

    .line 442
    return-void
.end method

.method public setThumbBounds(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "r"    # Landroid/graphics/Rect;

    .prologue
    .line 1454
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbRect:Landroid/graphics/Rect;

    if-eqz v0, :cond_0

    .line 1455
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->thumbRect:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 1457
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->overlay:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 1458
    return-void
.end method

.method public setWindowBgAlpha(I)V
    .locals 3
    .param p1, "alpha"    # I

    .prologue
    .line 886
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->windowBg:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/ColorDrawable;->setAlpha(I)V

    .line 887
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    if-eqz v0, :cond_0

    .line 888
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView;->dismissListener:Lcom/vkontakte/android/ui/PhotoView$DismissListener;

    int-to-float v1, p1

    const v2, 0x44028000    # 522.0f

    div-float/2addr v1, v2

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/PhotoView$DismissListener;->onBackgroundAlphaChanged(F)V

    .line 890
    :cond_0
    return-void
.end method

.method public setZoomListener(Lcom/vkontakte/android/ui/PhotoView$ZoomListener;)V
    .locals 0
    .param p1, "l"    # Lcom/vkontakte/android/ui/PhotoView$ZoomListener;

    .prologue
    .line 929
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView;->zoomListener:Lcom/vkontakte/android/ui/PhotoView$ZoomListener;

    .line 930
    return-void
.end method
