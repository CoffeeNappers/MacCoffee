.class public Lcom/vk/attachpicker/screen/TrimScreen;
.super Lcom/vk/core/simplescreen/BaseScreen;
.source "TrimScreen.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/screen/TrimScreen$Delegate;
    }
.end annotation


# static fields
.field public static final MIN_TIME_FRAME:I = 0x3e8


# instance fields
.field private final UPDATE_STEP:I

.field private bottomShadow:Landroid/view/View;

.field private clickHandler:Landroid/view/View;

.field private closeButton:Landroid/view/View;

.field private closeButtonContainer:Landroid/view/View;

.field private container:Landroid/widget/FrameLayout;

.field private controlsEnabled:Z

.field private final delegate:Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

.field private final handler:Landroid/os/Handler;

.field private leftProgressText:Landroid/widget/TextView;

.field private final locker:Lcom/vk/attachpicker/util/OrientationLocker;

.field private final maxLengthMs:J

.field private maxLengthToast:Landroid/widget/Toast;

.field private onEverySecond:Ljava/lang/Runnable;

.field private playButton:Landroid/view/View;

.field private prevProgress:F

.field private previewView:Lcom/vk/imageloader/view/VKImageView;

.field private rightProgressText:Landroid/widget/TextView;

.field private seekOnNextStart:I

.field private shouldPlayOpenAnimation:Z

.field private timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

.field private trimPanel:Landroid/view/View;

.field private videoDuration:I

.field private final videoPath:Ljava/lang/String;

.field private final videoUri:Landroid/net/Uri;

.field private videoView:Lcom/vk/attachpicker/widget/TextureVideoView;


# direct methods
.method public constructor <init>(Landroid/net/Uri;JLcom/vk/attachpicker/screen/TrimScreen$Delegate;)V
    .locals 2
    .param p1, "videoUri"    # Landroid/net/Uri;
    .param p2, "maxLengthMs"    # J
    .param p4, "delegate"    # Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/vk/core/simplescreen/BaseScreen;-><init>()V

    .line 49
    const/16 v0, 0x10

    iput v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->UPDATE_STEP:I

    .line 50
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->handler:Landroid/os/Handler;

    .line 51
    new-instance v0, Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-direct {v0}, Lcom/vk/attachpicker/util/OrientationLocker;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    .line 76
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->seekOnNextStart:I

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->controlsEnabled:Z

    .line 525
    new-instance v0, Lcom/vk/attachpicker/screen/TrimScreen$6;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/screen/TrimScreen$6;-><init>(Lcom/vk/attachpicker/screen/TrimScreen;)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->onEverySecond:Ljava/lang/Runnable;

    .line 82
    iput-wide p2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->maxLengthMs:J

    .line 83
    iput-object p1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoUri:Landroid/net/Uri;

    .line 84
    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoPath:Ljava/lang/String;

    .line 85
    iput-object p4, p0, Lcom/vk/attachpicker/screen/TrimScreen;->delegate:Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

    .line 86
    return-void
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/screen/TrimScreen;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->onEverySecond:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/util/OrientationLocker;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vk/attachpicker/screen/TrimScreen;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/TrimScreen;->setControlsEnabled(Z)V

    return-void
.end method

.method static synthetic access$1201(Lcom/vk/attachpicker/screen/TrimScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->finish()V

    return-void
.end method

.method static synthetic access$1300(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/screen/TrimScreen$Delegate;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->delegate:Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/attachpicker/screen/TrimScreen;)F
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    iget v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->prevProgress:F

    return v0
.end method

.method static synthetic access$302(Lcom/vk/attachpicker/screen/TrimScreen;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;
    .param p1, "x1"    # F

    .prologue
    .line 45
    iput p1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->prevProgress:F

    return p1
.end method

.method static synthetic access$400(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->playButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/attachpicker/screen/TrimScreen;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    iget v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoDuration:I

    return v0
.end method

.method static synthetic access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vk/attachpicker/screen/TrimScreen;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;
    .param p1, "x1"    # I

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/screen/TrimScreen;->progressOnNextStart(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/vk/attachpicker/screen/TrimScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->updateTrimText()V

    return-void
.end method

.method static synthetic access$902(Lcom/vk/attachpicker/screen/TrimScreen;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/screen/TrimScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->shouldPlayOpenAnimation:Z

    return p1
.end method

.method static synthetic access$lambda$0(Lcom/vk/attachpicker/screen/TrimScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->openAnimation()V

    return-void
.end method

.method private closeAnimation()V
    .locals 15

    .prologue
    .line 335
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->getActivity()Landroid/app/Activity;

    move-result-object v7

    .line 336
    .local v7, "activity":Landroid/app/Activity;
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-virtual {v1, v7}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 337
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/TrimScreen;->setControlsEnabled(Z)V

    .line 338
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->previewView:Lcom/vk/imageloader/view/VKImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 340
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->previewView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->getImageAspectRatio()F

    move-result v0

    .line 342
    .local v0, "ar":F
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    .line 343
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    .line 344
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 342
    invoke-static/range {v0 .. v6}, Lcom/vk/attachpicker/crop/CropUtils;->calculatePosition(FFFFFFF)Landroid/graphics/RectF;

    move-result-object v8

    .line 347
    .local v8, "editorRect":Landroid/graphics/RectF;
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    .line 348
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    .line 349
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v2

    const/16 v3, 0x6c

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v2, v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 347
    invoke-static/range {v0 .. v6}, Lcom/vk/attachpicker/crop/CropUtils;->calculatePosition(FFFFFFF)Landroid/graphics/RectF;

    move-result-object v13

    .line 352
    .local v13, "viewerRect":Landroid/graphics/RectF;
    invoke-virtual {v13}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float v9, v1, v2

    .line 353
    .local v9, "scaleBefore":F
    iget v1, v13, Landroid/graphics/RectF;->top:F

    iget v2, v8, Landroid/graphics/RectF;->top:F

    sub-float v12, v1, v2

    .line 354
    .local v12, "translationYBefore":F
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v9

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    neg-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v11, v1, v2

    .line 356
    .local v11, "translationXBefore":F
    new-instance v10, Landroid/animation/AnimatorSet;

    invoke-direct {v10}, Landroid/animation/AnimatorSet;-><init>()V

    .line 357
    .local v10, "set":Landroid/animation/AnimatorSet;
    sget-object v1, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {v10, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 359
    const/16 v1, 0x9

    new-array v1, v1, [Landroid/animation/Animator;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->closeButtonContainer:Landroid/view/View;

    const-string/jumbo v4, "alpha"

    const/4 v5, 0x2

    new-array v5, v5, [F

    fill-array-data v5, :array_0

    .line 360
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    const-string/jumbo v4, "translationX"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/4 v14, 0x0

    aput v14, v5, v6

    const/4 v6, 0x1

    aput v11, v5, v6

    .line 361
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    const-string/jumbo v4, "translationY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/4 v14, 0x0

    aput v14, v5, v6

    const/4 v6, 0x1

    aput v12, v5, v6

    .line 362
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    const-string/jumbo v4, "scaleX"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    aput v14, v5, v6

    const/4 v6, 0x1

    aput v9, v5, v6

    .line 363
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    const-string/jumbo v4, "scaleY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    aput v14, v5, v6

    const/4 v6, 0x1

    aput v9, v5, v6

    .line 364
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->playButton:Landroid/view/View;

    const-string/jumbo v4, "scaleX"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    aput v14, v5, v6

    const/4 v6, 0x1

    const/high16 v14, 0x3f800000    # 1.0f

    div-float/2addr v14, v9

    aput v14, v5, v6

    .line 365
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->playButton:Landroid/view/View;

    const-string/jumbo v4, "scaleY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    aput v14, v5, v6

    const/4 v6, 0x1

    const/high16 v14, 0x3f800000    # 1.0f

    div-float/2addr v14, v9

    aput v14, v5, v6

    .line 366
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->trimPanel:Landroid/view/View;

    const-string/jumbo v4, "translationY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/4 v14, 0x0

    aput v14, v5, v6

    const/4 v6, 0x1

    iget-object v14, p0, Lcom/vk/attachpicker/screen/TrimScreen;->trimPanel:Landroid/view/View;

    .line 367
    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v14

    int-to-float v14, v14

    aput v14, v5, v6

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x8

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->bottomShadow:Landroid/view/View;

    const-string/jumbo v4, "translationY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/4 v14, 0x0

    aput v14, v5, v6

    const/4 v6, 0x1

    iget-object v14, p0, Lcom/vk/attachpicker/screen/TrimScreen;->trimPanel:Landroid/view/View;

    .line 368
    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v14

    int-to-float v14, v14

    aput v14, v5, v6

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 359
    invoke-virtual {v10, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 370
    new-instance v1, Lcom/vk/attachpicker/screen/TrimScreen$4;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/TrimScreen$4;-><init>(Lcom/vk/attachpicker/screen/TrimScreen;)V

    invoke-virtual {v10, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 383
    const-wide/16 v2, 0xaf

    invoke-virtual {v10, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 384
    invoke-virtual {v10}, Landroid/animation/AnimatorSet;->start()V

    .line 386
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->shouldPlayOpenAnimation:Z

    .line 387
    return-void

    .line 359
    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private millisToText(I)Ljava/lang/String;
    .locals 12
    .param p1, "millis"    # I

    .prologue
    const-wide/16 v10, 0x3c

    .line 516
    div-int/lit16 v3, p1, 0x3e8

    int-to-long v4, v3

    .line 517
    .local v4, "seconds":J
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    .line 518
    .local v0, "absSeconds":J
    const-string/jumbo v3, "%01d:%02d"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-wide/16 v8, 0xe10

    rem-long v8, v0, v8

    div-long/2addr v8, v10

    .line 520
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    rem-long v8, v0, v10

    .line 521
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    .line 518
    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 522
    .local v2, "positive":Ljava/lang/String;
    return-object v2
.end method

.method private onSaveClicked()V
    .locals 14

    .prologue
    .line 390
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->getActivity()Landroid/app/Activity;

    move-result-object v2

    .line 391
    .local v2, "a":Landroid/app/Activity;
    if-nez v2, :cond_0

    .line 465
    .end local v2    # "a":Landroid/app/Activity;
    :goto_0
    return-void

    .line 395
    .restart local v2    # "a":Landroid/app/Activity;
    :cond_0
    iget v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoDuration:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v1

    mul-float/2addr v0, v1

    float-to-int v10, v0

    .line 396
    .local v10, "startPosition":I
    iget v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoDuration:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result v1

    mul-float/2addr v0, v1

    float-to-int v8, v0

    .line 397
    .local v8, "endPosition":I
    sub-int v11, v8, v10

    .line 398
    .local v11, "timeVideo":I
    iget-wide v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->maxLengthMs:J

    const-wide/16 v12, 0x0

    cmp-long v0, v0, v12

    if-lez v0, :cond_1

    int-to-long v0, v11

    iget-wide v12, p0, Lcom/vk/attachpicker/screen/TrimScreen;->maxLengthMs:J

    cmp-long v0, v0, v12

    if-lez v0, :cond_1

    .line 399
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->showMaxLengthToast()V

    goto :goto_0

    .line 403
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v0

    const v1, 0x3c23d70a    # 0.01f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_2

    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result v0

    const v1, 0x3f7d70a4    # 0.99f

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_2

    .line 404
    check-cast v2, Lcom/vk/attachpicker/AttachResulter;

    .end local v2    # "a":Landroid/app/Activity;
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoUri:Landroid/net/Uri;

    invoke-static {v0}, Lcom/vk/attachpicker/SelectionContext;->packSingleVideo(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    invoke-interface {v2, v0}, Lcom/vk/attachpicker/AttachResulter;->setResultAndFinish(Landroid/content/Intent;)V

    goto :goto_0

    .line 407
    .restart local v2    # "a":Landroid/app/Activity;
    :cond_2
    if-ltz v10, :cond_3

    iget v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoDuration:I

    if-le v8, v0, :cond_4

    .line 408
    :cond_3
    check-cast v2, Lcom/vk/attachpicker/AttachResulter;

    .end local v2    # "a":Landroid/app/Activity;
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoUri:Landroid/net/Uri;

    invoke-static {v0}, Lcom/vk/attachpicker/SelectionContext;->packSingleVideo(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    invoke-interface {v2, v0}, Lcom/vk/attachpicker/AttachResulter;->setResultAndFinish(Landroid/content/Intent;)V

    goto :goto_0

    .line 412
    .restart local v2    # "a":Landroid/app/Activity;
    :cond_4
    new-instance v9, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v9}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 413
    .local v9, "mediaMetadataRetriever":Landroid/media/MediaMetadataRetriever;
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoPath:Ljava/lang/String;

    invoke-virtual {v9, v0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 414
    const/16 v0, 0x9

    invoke-virtual {v9, v0}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    .line 416
    .local v6, "METADATA_KEY_DURATION":J
    new-instance v3, Ljava/io/File;

    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoPath:Ljava/lang/String;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 418
    .local v3, "file":Ljava/io/File;
    const/16 v0, 0x3e8

    if-ge v11, v0, :cond_5

    .line 420
    int-to-long v0, v8

    sub-long v0, v6, v0

    rsub-int v12, v11, 0x3e8

    int-to-long v12, v12

    cmp-long v0, v0, v12

    if-lez v0, :cond_6

    .line 421
    rsub-int v0, v11, 0x3e8

    add-int/2addr v8, v0

    .line 428
    :cond_5
    :goto_1
    move v4, v10

    .line 429
    .local v4, "finalStartPosition":I
    move v5, v8

    .line 430
    .local v5, "finalEndPosition":I
    new-instance v0, Lcom/vk/attachpicker/screen/TrimScreen$5;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/vk/attachpicker/screen/TrimScreen$5;-><init>(Lcom/vk/attachpicker/screen/TrimScreen;Landroid/app/Activity;Ljava/io/File;II)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    .line 463
    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/screen/TrimScreen$5;->execPool([Ljava/lang/Object;)Lcom/vk/attachpicker/util/AsyncTask;

    goto/16 :goto_0

    .line 422
    .end local v4    # "finalStartPosition":I
    .end local v5    # "finalEndPosition":I
    :cond_6
    rsub-int v0, v11, 0x3e8

    if-le v10, v0, :cond_5

    .line 423
    rsub-int v0, v11, 0x3e8

    sub-int/2addr v10, v0

    goto :goto_1
.end method

.method private onStart()V
    .locals 2

    .prologue
    .line 502
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->onEverySecond:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 503
    return-void
.end method

.method private openAnimation()V
    .locals 15

    .prologue
    .line 286
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->getActivity()Landroid/app/Activity;

    move-result-object v7

    .line 287
    .local v7, "activity":Landroid/app/Activity;
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->locker:Lcom/vk/attachpicker/util/OrientationLocker;

    invoke-virtual {v1, v7}, Lcom/vk/attachpicker/util/OrientationLocker;->lockOrientation(Landroid/app/Activity;)V

    .line 288
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/TrimScreen;->setControlsEnabled(Z)V

    .line 290
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->previewView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->getImageAspectRatio()F

    move-result v0

    .line 292
    .local v0, "ar":F
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    .line 293
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    .line 294
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 292
    invoke-static/range {v0 .. v6}, Lcom/vk/attachpicker/crop/CropUtils;->calculatePosition(FFFFFFF)Landroid/graphics/RectF;

    move-result-object v8

    .line 297
    .local v8, "editorRect":Landroid/graphics/RectF;
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    .line 298
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    .line 299
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v2

    const/16 v3, 0x6c

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v2, v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 297
    invoke-static/range {v0 .. v6}, Lcom/vk/attachpicker/crop/CropUtils;->calculatePosition(FFFFFFF)Landroid/graphics/RectF;

    move-result-object v13

    .line 302
    .local v13, "viewerRect":Landroid/graphics/RectF;
    invoke-virtual {v13}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float v9, v1, v2

    .line 303
    .local v9, "scaleBefore":F
    iget v1, v13, Landroid/graphics/RectF;->top:F

    iget v2, v8, Landroid/graphics/RectF;->top:F

    sub-float v12, v1, v2

    .line 304
    .local v12, "translationYBefore":F
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v9

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    neg-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v11, v1, v2

    .line 306
    .local v11, "translationXBefore":F
    new-instance v10, Landroid/animation/AnimatorSet;

    invoke-direct {v10}, Landroid/animation/AnimatorSet;-><init>()V

    .line 307
    .local v10, "set":Landroid/animation/AnimatorSet;
    sget-object v1, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v10, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 309
    const/16 v1, 0x9

    new-array v1, v1, [Landroid/animation/Animator;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->closeButtonContainer:Landroid/view/View;

    const-string/jumbo v4, "alpha"

    const/4 v5, 0x2

    new-array v5, v5, [F

    fill-array-data v5, :array_0

    .line 310
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    const-string/jumbo v4, "translationX"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput v11, v5, v6

    const/4 v6, 0x1

    const/4 v14, 0x0

    aput v14, v5, v6

    .line 311
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    const-string/jumbo v4, "translationY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput v12, v5, v6

    const/4 v6, 0x1

    const/4 v14, 0x0

    aput v14, v5, v6

    .line 312
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    const-string/jumbo v4, "scaleX"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput v9, v5, v6

    const/4 v6, 0x1

    const/high16 v14, 0x3f800000    # 1.0f

    aput v14, v5, v6

    .line 313
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    const-string/jumbo v4, "scaleY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput v9, v5, v6

    const/4 v6, 0x1

    const/high16 v14, 0x3f800000    # 1.0f

    aput v14, v5, v6

    .line 314
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->playButton:Landroid/view/View;

    const-string/jumbo v4, "scaleX"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    div-float/2addr v14, v9

    aput v14, v5, v6

    const/4 v6, 0x1

    const/high16 v14, 0x3f800000    # 1.0f

    aput v14, v5, v6

    .line 315
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->playButton:Landroid/view/View;

    const-string/jumbo v4, "scaleY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    div-float/2addr v14, v9

    aput v14, v5, v6

    const/4 v6, 0x1

    const/high16 v14, 0x3f800000    # 1.0f

    aput v14, v5, v6

    .line 316
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->trimPanel:Landroid/view/View;

    const-string/jumbo v4, "translationY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    iget-object v14, p0, Lcom/vk/attachpicker/screen/TrimScreen;->trimPanel:Landroid/view/View;

    .line 317
    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v14

    int-to-float v14, v14

    aput v14, v5, v6

    const/4 v6, 0x1

    const/4 v14, 0x0

    aput v14, v5, v6

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x8

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen;->bottomShadow:Landroid/view/View;

    const-string/jumbo v4, "translationY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    iget-object v14, p0, Lcom/vk/attachpicker/screen/TrimScreen;->trimPanel:Landroid/view/View;

    .line 318
    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v14

    int-to-float v14, v14

    aput v14, v5, v6

    const/4 v6, 0x1

    const/4 v14, 0x0

    aput v14, v5, v6

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 309
    invoke-virtual {v10, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 320
    new-instance v1, Lcom/vk/attachpicker/screen/TrimScreen$3;

    invoke-direct {v1, p0, v7}, Lcom/vk/attachpicker/screen/TrimScreen$3;-><init>(Lcom/vk/attachpicker/screen/TrimScreen;Landroid/app/Activity;)V

    invoke-virtual {v10, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 328
    const-wide/16 v2, 0xaf

    invoke-virtual {v10, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 329
    invoke-virtual {v10}, Landroid/animation/AnimatorSet;->start()V

    .line 331
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->shouldPlayOpenAnimation:Z

    .line 332
    return-void

    .line 309
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private playPause()V
    .locals 2

    .prologue
    .line 468
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 469
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->pause()V

    .line 470
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->playButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 480
    :goto_0
    return-void

    .line 472
    :cond_0
    iget v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->seekOnNextStart:I

    if-ltz v0, :cond_1

    .line 473
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    iget v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->seekOnNextStart:I

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->seekTo(I)V

    .line 474
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->seekOnNextStart:I

    .line 476
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->start()V

    .line 477
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->playButton:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 478
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->onStart()V

    goto :goto_0
.end method

.method private progressOnNextStart(I)V
    .locals 1
    .param p1, "progress"    # I

    .prologue
    .line 506
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->prevProgress:F

    .line 507
    iput p1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->seekOnNextStart:I

    .line 508
    return-void
.end method

.method private setControlsEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 280
    iput-boolean p1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->controlsEnabled:Z

    .line 282
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->closeButton:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 283
    return-void
.end method

.method private updateTrimText()V
    .locals 3

    .prologue
    .line 511
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->leftProgressText:Landroid/widget/TextView;

    iget v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoDuration:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v2

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/TrimScreen;->millisToText(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 512
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->rightProgressText:Landroid/widget/TextView;

    iget v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoDuration:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result v2

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/screen/TrimScreen;->millisToText(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 513
    return-void
.end method


# virtual methods
.method public createView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    const/4 v3, 0x4

    .line 90
    const v1, 0x7f0301aa

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 92
    .local v0, "v":Landroid/view/View;
    const v1, 0x7f100476

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->previewView:Lcom/vk/imageloader/view/VKImageView;

    .line 93
    const v1, 0x7f1004b1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    .line 94
    const v1, 0x7f1004b2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->leftProgressText:Landroid/widget/TextView;

    .line 95
    const v1, 0x7f1004b3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->rightProgressText:Landroid/widget/TextView;

    .line 96
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->leftProgressText:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 97
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->rightProgressText:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 98
    const v1, 0x7f1004b0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->trimPanel:Landroid/view/View;

    .line 99
    const v1, 0x7f10045b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->bottomShadow:Landroid/view/View;

    .line 101
    const v1, 0x7f100461

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->container:Landroid/widget/FrameLayout;

    .line 102
    const v1, 0x7f1004ae

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/TextureVideoView;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    .line 103
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->setVideoPath(Ljava/lang/String;)V

    .line 104
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 119
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/media/MediaPlayer$OnCompletionListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 123
    const v1, 0x7f1004af

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->playButton:Landroid/view/View;

    .line 124
    const v1, 0x7f100335

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->clickHandler:Landroid/view/View;

    .line 125
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->clickHandler:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$3;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->setVideoPath(Ljava/lang/String;)V

    .line 130
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    new-instance v2, Lcom/vk/attachpicker/screen/TrimScreen$1;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/screen/TrimScreen$1;-><init>(Lcom/vk/attachpicker/screen/TrimScreen;)V

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->setDelegate(Lcom/vk/attachpicker/videotrim/VideoTimelineView$VideoTimelineViewDelegate;)V

    .line 206
    const v1, 0x7f1004ac

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->closeButtonContainer:Landroid/view/View;

    .line 207
    const v1, 0x7f10015e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->closeButton:Landroid/view/View;

    .line 208
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->closeButton:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$4;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 212
    const v1, 0x7f1004a1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$5;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 216
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->previewView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoUri:Landroid/net/Uri;

    sget-object v3, Lcom/vk/imageloader/ImageSize;->VERY_BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v1, v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    .line 217
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->previewView:Lcom/vk/imageloader/view/VKImageView;

    new-instance v2, Lcom/vk/attachpicker/screen/TrimScreen$2;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/screen/TrimScreen$2;-><init>(Lcom/vk/attachpicker/screen/TrimScreen;)V

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setOnLoadCallback(Lcom/vk/imageloader/OnLoadCallback;)V

    .line 228
    return-object v0
.end method

.method public finish()V
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->delegate:Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->previewView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->hasImage()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 254
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->closeAnimation()V

    .line 261
    :cond_0
    :goto_0
    return-void

    .line 256
    :cond_1
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->finish()V

    .line 257
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->delegate:Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

    if-eqz v0, :cond_0

    .line 258
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->delegate:Lcom/vk/attachpicker/screen/TrimScreen$Delegate;

    invoke-interface {v0}, Lcom/vk/attachpicker/screen/TrimScreen$Delegate;->startEditorCloseAnimation()V

    goto :goto_0
.end method

.method synthetic lambda$createView$2(Landroid/media/MediaPlayer;)V
    .locals 4
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    const/4 v2, 0x0

    .line 105
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoDuration:I

    .line 106
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    iget v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoDuration:I

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->setDuration(I)V

    .line 107
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->onStart()V

    .line 109
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->leftProgressText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 110
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->rightProgressText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 111
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->updateTrimText()V

    .line 112
    invoke-static {p0}, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$8;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/attachpicker/Picker;->run(Ljava/lang/Runnable;)V

    .line 115
    invoke-static {p0}, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$9;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x12c

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 118
    return-void
.end method

.method synthetic lambda$createView$3(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v0

    iget v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoDuration:I

    int-to-float v1, v1

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/screen/TrimScreen;->progressOnNextStart(I)V

    .line 121
    return-void
.end method

.method synthetic lambda$createView$4(Landroid/view/View;)V
    .locals 0
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 126
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->playPause()V

    .line 127
    return-void
.end method

.method synthetic lambda$createView$5(Landroid/view/View;)V
    .locals 0
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 209
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->finish()V

    .line 210
    return-void
.end method

.method synthetic lambda$createView$6(Landroid/view/View;)V
    .locals 0
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 213
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->onSaveClicked()V

    .line 214
    return-void
.end method

.method synthetic lambda$null$0()V
    .locals 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->seekTo(I)V

    .line 114
    return-void
.end method

.method synthetic lambda$null$1()V
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->previewView:Lcom/vk/imageloader/view/VKImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 117
    return-void
.end method

.method synthetic lambda$showMaxLengthToast$7()V
    .locals 8

    .prologue
    .line 266
    :try_start_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->maxLengthToast:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 267
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->maxLengthToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 269
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->maxLengthToast:Landroid/widget/Toast;

    .line 271
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0807a4

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/screen/TrimScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/vk/attachpicker/screen/TrimScreen;->maxLengthMs:J

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->maxLengthToast:Landroid/widget/Toast;

    .line 272
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->maxLengthToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 276
    :goto_0
    return-void

    .line 273
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onBackPressed()Z
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 243
    iget-boolean v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->controlsEnabled:Z

    if-eqz v0, :cond_0

    .line 244
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/TrimScreen;->finish()V

    .line 247
    :cond_0
    return v1
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 489
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->onDestroy()V

    .line 490
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->pause()V

    .line 491
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->suspend()V

    .line 492
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->destroy()V

    .line 493
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 484
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->onPause()V

    .line 485
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 233
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->onResume()V

    .line 234
    iget-boolean v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->shouldPlayOpenAnimation:Z

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->timelineView:Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$6;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/util/Utils;->runOnPreDraw(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 239
    :goto_0
    return-void

    .line 237
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen;->videoView:Lcom/vk/attachpicker/widget/TextureVideoView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->getCurrentPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->seekTo(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onTopPaddingChanged(I)V
    .locals 2
    .param p1, "topPadding"    # I

    .prologue
    const/4 v1, 0x0

    .line 497
    invoke-super {p0, p1}, Lcom/vk/core/simplescreen/BaseScreen;->onTopPaddingChanged(I)V

    .line 498
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->closeButtonContainer:Landroid/view/View;

    invoke-virtual {v0, v1, p1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 499
    return-void
.end method

.method public showMaxLengthToast()V
    .locals 2

    .prologue
    .line 264
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/TrimScreen$$Lambda$7;->lambdaFactory$(Lcom/vk/attachpicker/screen/TrimScreen;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 277
    return-void
.end method
