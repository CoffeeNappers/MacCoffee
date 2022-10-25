.class public Lcom/vkontakte/android/ui/CircularProgressView;
.super Landroid/view/View;
.source "CircularProgressView.java"


# static fields
.field private static final INDETERMINANT_MIN_SWEEP:F = 15.0f


# instance fields
.field private actualProgress:F

.field private animDuration:I

.field private animSteps:I

.field private animSwoopDuration:I

.field private animSyncDuration:I

.field private autostartAnimation:Z

.field private bounds:Landroid/graphics/RectF;

.field private color:I

.field private currentProgress:F

.field private indeterminateAnimator:Landroid/animation/AnimatorSet;

.field private indeterminateRotateOffset:F

.field private indeterminateSweep:F

.field private initialStartAngle:F

.field private isIndeterminate:Z

.field private maxProgress:F

.field private paint:Landroid/graphics/Paint;

.field private progressAnimator:Landroid/animation/ValueAnimator;

.field private size:I

.field private startAngle:F

.field private startAngleRotate:Landroid/animation/ValueAnimator;

.field private thickness:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 43
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 27
    iput v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->size:I

    .line 44
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/ui/CircularProgressView;->init(Landroid/util/AttributeSet;I)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    iput v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->size:I

    .line 49
    invoke-virtual {p0, p2, v0}, Lcom/vkontakte/android/ui/CircularProgressView;->init(Landroid/util/AttributeSet;I)V

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 53
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->size:I

    .line 54
    invoke-virtual {p0, p2, p3}, Lcom/vkontakte/android/ui/CircularProgressView;->init(Landroid/util/AttributeSet;I)V

    .line 55
    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/ui/CircularProgressView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/CircularProgressView;
    .param p1, "x1"    # F

    .prologue
    .line 22
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->actualProgress:F

    return p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/CircularProgressView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/CircularProgressView;

    .prologue
    .line 22
    iget v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngle:F

    return v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/ui/CircularProgressView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/CircularProgressView;
    .param p1, "x1"    # F

    .prologue
    .line 22
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngle:F

    return p1
.end method

.method static synthetic access$202(Lcom/vkontakte/android/ui/CircularProgressView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/CircularProgressView;
    .param p1, "x1"    # F

    .prologue
    .line 22
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateSweep:F

    return p1
.end method

.method static synthetic access$302(Lcom/vkontakte/android/ui/CircularProgressView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/CircularProgressView;
    .param p1, "x1"    # F

    .prologue
    .line 22
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateRotateOffset:F

    return p1
.end method

.method private createIndeterminateAnimator(F)Landroid/animation/AnimatorSet;
    .locals 11
    .param p1, "step"    # F

    .prologue
    .line 397
    const/high16 v7, 0x43b40000    # 360.0f

    iget v8, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    add-int/lit8 v8, v8, -0x1

    int-to-float v8, v8

    mul-float/2addr v7, v8

    iget v8, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    int-to-float v8, v8

    div-float/2addr v7, v8

    const/high16 v8, 0x41700000    # 15.0f

    add-float v2, v7, v8

    .line 398
    .local v2, "maxSweep":F
    const/high16 v7, -0x3d4c0000    # -90.0f

    const/high16 v8, 0x41700000    # 15.0f

    sub-float v8, v2, v8

    mul-float/2addr v8, p1

    add-float v6, v7, v8

    .line 401
    .local v6, "start":F
    const/4 v7, 0x2

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/high16 v9, 0x41700000    # 15.0f

    aput v9, v7, v8

    const/4 v8, 0x1

    aput v2, v7, v8

    invoke-static {v7}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    .line 402
    .local v1, "frontEndExtend":Landroid/animation/ValueAnimator;
    iget v7, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animDuration:I

    iget v8, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    div-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x2

    int-to-long v8, v7

    invoke-virtual {v1, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 403
    new-instance v7, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v7, v8}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v1, v7}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 404
    new-instance v7, Lcom/vkontakte/android/ui/CircularProgressView$5;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/ui/CircularProgressView$5;-><init>(Lcom/vkontakte/android/ui/CircularProgressView;)V

    invoke-virtual {v1, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 413
    const/4 v7, 0x2

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/high16 v9, 0x44340000    # 720.0f

    mul-float/2addr v9, p1

    iget v10, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    int-to-float v10, v10

    div-float/2addr v9, v10

    aput v9, v7, v8

    const/4 v8, 0x1

    const/high16 v9, 0x3f000000    # 0.5f

    add-float/2addr v9, p1

    const/high16 v10, 0x44340000    # 720.0f

    mul-float/2addr v9, v10

    iget v10, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    int-to-float v10, v10

    div-float/2addr v9, v10

    aput v9, v7, v8

    invoke-static {v7}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v3

    .line 414
    .local v3, "rotateAnimator1":Landroid/animation/ValueAnimator;
    iget v7, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animDuration:I

    iget v8, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    div-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x2

    int-to-long v8, v7

    invoke-virtual {v3, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 415
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v3, v7}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 416
    new-instance v7, Lcom/vkontakte/android/ui/CircularProgressView$6;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/ui/CircularProgressView$6;-><init>(Lcom/vkontakte/android/ui/CircularProgressView;)V

    invoke-virtual {v3, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 426
    const/4 v7, 0x2

    new-array v7, v7, [F

    const/4 v8, 0x0

    aput v6, v7, v8

    const/4 v8, 0x1

    add-float v9, v6, v2

    const/high16 v10, 0x41700000    # 15.0f

    sub-float/2addr v9, v10

    aput v9, v7, v8

    invoke-static {v7}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 427
    .local v0, "backEndRetract":Landroid/animation/ValueAnimator;
    iget v7, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animDuration:I

    iget v8, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    div-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x2

    int-to-long v8, v7

    invoke-virtual {v0, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 428
    new-instance v7, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v7, v8}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v7}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 429
    new-instance v7, Lcom/vkontakte/android/ui/CircularProgressView$7;

    invoke-direct {v7, p0, v2, v6}, Lcom/vkontakte/android/ui/CircularProgressView$7;-><init>(Lcom/vkontakte/android/ui/CircularProgressView;FF)V

    invoke-virtual {v0, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 439
    const/4 v7, 0x2

    new-array v7, v7, [F

    const/4 v8, 0x0

    const/high16 v9, 0x3f000000    # 0.5f

    add-float/2addr v9, p1

    const/high16 v10, 0x44340000    # 720.0f

    mul-float/2addr v9, v10

    iget v10, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    int-to-float v10, v10

    div-float/2addr v9, v10

    aput v9, v7, v8

    const/4 v8, 0x1

    const/high16 v9, 0x3f800000    # 1.0f

    add-float/2addr v9, p1

    const/high16 v10, 0x44340000    # 720.0f

    mul-float/2addr v9, v10

    iget v10, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    int-to-float v10, v10

    div-float/2addr v9, v10

    aput v9, v7, v8

    invoke-static {v7}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v4

    .line 440
    .local v4, "rotateAnimator2":Landroid/animation/ValueAnimator;
    iget v7, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animDuration:I

    iget v8, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    div-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x2

    int-to-long v8, v7

    invoke-virtual {v4, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 441
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v4, v7}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 442
    new-instance v7, Lcom/vkontakte/android/ui/CircularProgressView$8;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/ui/CircularProgressView$8;-><init>(Lcom/vkontakte/android/ui/CircularProgressView;)V

    invoke-virtual {v4, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 449
    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 450
    .local v5, "set":Landroid/animation/AnimatorSet;
    invoke-virtual {v5, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 451
    invoke-virtual {v5, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 452
    return-object v5
.end method

.method private initAttributes(Landroid/util/AttributeSet;I)V
    .locals 12
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyle"    # I

    .prologue
    const/4 v11, 0x5

    const v10, 0x7f0f0040

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 68
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/vkontakte/android/R$styleable;->CircularProgressView:[I

    invoke-virtual {v4, p1, v5, p2, v8}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 71
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 74
    .local v2, "resources":Landroid/content/res/Resources;
    const v4, 0x7f0a0013

    .line 75
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    int-to-float v4, v4

    .line 74
    invoke-virtual {v0, v8, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->currentProgress:F

    .line 76
    const v4, 0x7f0a0012

    .line 77
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    int-to-float v4, v4

    .line 76
    invoke-virtual {v0, v9, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->maxProgress:F

    .line 78
    const/4 v4, 0x6

    const v5, 0x7f0900c0

    .line 79
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 78
    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->thickness:I

    .line 80
    const/4 v4, 0x7

    const v5, 0x7f0e0009

    .line 81
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    .line 80
    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->isIndeterminate:Z

    .line 82
    const/16 v4, 0x8

    const v5, 0x7f0e0008

    .line 83
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    .line 82
    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->autostartAnimation:Z

    .line 84
    const/16 v4, 0xa

    const v5, 0x7f0a0014

    .line 85
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    int-to-float v5, v5

    .line 84
    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->initialStartAngle:F

    .line 86
    iget v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->initialStartAngle:F

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngle:F

    .line 88
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string/jumbo v5, "colorAccent"

    const-string/jumbo v6, "attr"

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 91
    .local v1, "accentColor":I
    invoke-virtual {v0, v11}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 92
    invoke-virtual {v2, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v0, v11, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->color:I

    .line 109
    :goto_0
    const/4 v4, 0x2

    const v5, 0x7f0a000e

    .line 110
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    .line 109
    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animDuration:I

    .line 111
    const/4 v4, 0x3

    const v5, 0x7f0a0010

    .line 112
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    .line 111
    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSwoopDuration:I

    .line 113
    const/4 v4, 0x4

    const v5, 0x7f0a0011

    .line 114
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    .line 113
    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSyncDuration:I

    .line 115
    const/16 v4, 0x9

    const v5, 0x7f0a000f

    .line 116
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    .line 115
    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    .line 117
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 118
    return-void

    .line 95
    :cond_0
    if-eqz v1, :cond_1

    .line 96
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 97
    .local v3, "t":Landroid/util/TypedValue;
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    invoke-virtual {v4, v1, v3, v9}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 98
    iget v4, v3, Landroid/util/TypedValue;->data:I

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->color:I

    goto :goto_0

    .line 101
    .end local v3    # "t":Landroid/util/TypedValue;
    :cond_1
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-lt v4, v5, :cond_2

    .line 102
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getContext()Landroid/content/Context;

    move-result-object v4

    new-array v5, v9, [I

    const v6, 0x1010435

    aput v6, v5, v8

    invoke-virtual {v4, v5}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 103
    .local v3, "t":Landroid/content/res/TypedArray;
    invoke-virtual {v2, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v8, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->color:I

    goto :goto_0

    .line 106
    .end local v3    # "t":Landroid/content/res/TypedArray;
    :cond_2
    invoke-virtual {v2, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->color:I

    goto :goto_0
.end method

.method private updateBounds()V
    .locals 8

    .prologue
    .line 140
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getPaddingLeft()I

    move-result v0

    .line 141
    .local v0, "paddingLeft":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getPaddingTop()I

    move-result v1

    .line 142
    .local v1, "paddingTop":I
    iget-object v2, p0, Lcom/vkontakte/android/ui/CircularProgressView;->bounds:Landroid/graphics/RectF;

    iget v3, p0, Lcom/vkontakte/android/ui/CircularProgressView;->thickness:I

    add-int/2addr v3, v0

    int-to-float v3, v3

    iget v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->thickness:I

    add-int/2addr v4, v1

    int-to-float v4, v4

    iget v5, p0, Lcom/vkontakte/android/ui/CircularProgressView;->size:I

    sub-int/2addr v5, v0

    iget v6, p0, Lcom/vkontakte/android/ui/CircularProgressView;->thickness:I

    sub-int/2addr v5, v6

    int-to-float v5, v5

    iget v6, p0, Lcom/vkontakte/android/ui/CircularProgressView;->size:I

    sub-int/2addr v6, v1

    iget v7, p0, Lcom/vkontakte/android/ui/CircularProgressView;->thickness:I

    sub-int/2addr v6, v7

    int-to-float v6, v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 143
    return-void
.end method

.method private updatePaint()V
    .locals 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->thickness:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 150
    return-void
.end method


# virtual methods
.method public getColor()I
    .locals 1

    .prologue
    .line 212
    iget v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->color:I

    return v0
.end method

.method public getMaxProgress()F
    .locals 1

    .prologue
    .line 232
    iget v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->maxProgress:F

    return v0
.end method

.method public getProgress()F
    .locals 1

    .prologue
    .line 249
    iget v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->currentProgress:F

    return v0
.end method

.method public getThickness()I
    .locals 1

    .prologue
    .line 193
    iget v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->thickness:I

    return v0
.end method

.method protected init(Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyle"    # I

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/CircularProgressView;->initAttributes(Landroid/util/AttributeSet;I)V

    .line 61
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->paint:Landroid/graphics/Paint;

    .line 62
    invoke-direct {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->updatePaint()V

    .line 64
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->bounds:Landroid/graphics/RectF;

    .line 65
    return-void
.end method

.method public isIndeterminate()Z
    .locals 1

    .prologue
    .line 170
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->isIndeterminate:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 457
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 458
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->autostartAnimation:Z

    if-eqz v0, :cond_0

    .line 459
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->startAnimation()V

    .line 460
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 464
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 465
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->stopAnimation()V

    .line 466
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    const/high16 v2, 0x43b40000    # 360.0f

    .line 154
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 157
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->currentProgress:F

    iget v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->maxProgress:F

    div-float/2addr v0, v1

    mul-float v3, v0, v2

    .line 158
    .local v3, "sweepAngle":F
    :goto_0
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->isIndeterminate:Z

    if-nez v0, :cond_1

    .line 159
    iget-object v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->bounds:Landroid/graphics/RectF;

    iget v2, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngle:F

    iget-object v5, p0, Lcom/vkontakte/android/ui/CircularProgressView;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 162
    :goto_1
    return-void

    .line 157
    .end local v3    # "sweepAngle":F
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->actualProgress:F

    iget v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->maxProgress:F

    div-float/2addr v0, v1

    mul-float v3, v0, v2

    goto :goto_0

    .line 161
    .restart local v3    # "sweepAngle":F
    :cond_1
    iget-object v6, p0, Lcom/vkontakte/android/ui/CircularProgressView;->bounds:Landroid/graphics/RectF;

    iget v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngle:F

    iget v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateRotateOffset:F

    add-float v7, v0, v1

    iget v8, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateSweep:F

    iget-object v10, p0, Lcom/vkontakte/android/ui/CircularProgressView;->paint:Landroid/graphics/Paint;

    move-object v5, p1

    move v9, v4

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto :goto_1
.end method

.method protected onMeasure(II)V
    .locals 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 122
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 123
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getPaddingLeft()I

    move-result v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getPaddingRight()I

    move-result v5

    add-int v2, v4, v5

    .line 124
    .local v2, "xPad":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getPaddingTop()I

    move-result v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getPaddingBottom()I

    move-result v5

    add-int v3, v4, v5

    .line 125
    .local v3, "yPad":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getMeasuredWidth()I

    move-result v4

    sub-int v1, v4, v2

    .line 126
    .local v1, "width":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getMeasuredHeight()I

    move-result v4

    sub-int v0, v4, v3

    .line 127
    .local v0, "height":I
    if-ge v1, v0, :cond_0

    .end local v1    # "width":I
    :goto_0
    iput v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->size:I

    .line 128
    iget v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->size:I

    add-int/2addr v4, v2

    iget v5, p0, Lcom/vkontakte/android/ui/CircularProgressView;->size:I

    add-int/2addr v5, v3

    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/ui/CircularProgressView;->setMeasuredDimension(II)V

    .line 130
    return-void

    .restart local v1    # "width":I
    :cond_0
    move v1, v0

    .line 127
    goto :goto_0
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 134
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 135
    if-ge p1, p2, :cond_0

    .end local p1    # "w":I
    :goto_0
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->size:I

    .line 136
    invoke-direct {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->updateBounds()V

    .line 137
    return-void

    .restart local p1    # "w":I
    :cond_0
    move p1, p2

    .line 135
    goto :goto_0
.end method

.method public resetAnimation()V
    .locals 11

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 298
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 299
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->cancel()V

    .line 300
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 301
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->cancel()V

    .line 302
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateAnimator:Landroid/animation/AnimatorSet;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 303
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->cancel()V

    .line 306
    :cond_2
    iget-boolean v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->isIndeterminate:Z

    if-nez v4, :cond_4

    .line 308
    iget v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->initialStartAngle:F

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngle:F

    .line 309
    new-array v4, v10, [F

    iget v5, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngle:F

    aput v5, v4, v8

    iget v5, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngle:F

    const/high16 v6, 0x43b40000    # 360.0f

    add-float/2addr v5, v6

    aput v5, v4, v9

    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    .line 310
    iget v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSwoopDuration:I

    if-lez v4, :cond_3

    .line 311
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    iget v5, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSwoopDuration:I

    int-to-long v6, v5

    invoke-virtual {v4, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 312
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    new-instance v5, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v6, 0x40000000    # 2.0f

    invoke-direct {v5, v6}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 318
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    new-instance v5, Lcom/vkontakte/android/ui/CircularProgressView$2;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/ui/CircularProgressView$2;-><init>(Lcom/vkontakte/android/ui/CircularProgressView;)V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 325
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->start()V

    .line 328
    const/4 v4, 0x0

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->actualProgress:F

    .line 329
    new-array v4, v10, [F

    iget v5, p0, Lcom/vkontakte/android/ui/CircularProgressView;->actualProgress:F

    aput v5, v4, v8

    iget v5, p0, Lcom/vkontakte/android/ui/CircularProgressView;->currentProgress:F

    aput v5, v4, v9

    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    .line 330
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    iget v5, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSyncDuration:I

    int-to-long v6, v5

    invoke-virtual {v4, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 331
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    new-instance v5, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 332
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    new-instance v5, Lcom/vkontakte/android/ui/CircularProgressView$3;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/ui/CircularProgressView$3;-><init>(Lcom/vkontakte/android/ui/CircularProgressView;)V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 339
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->start()V

    .line 374
    :goto_1
    return-void

    .line 314
    :cond_3
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    const-wide/16 v6, 0x9c4

    invoke-virtual {v4, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 315
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 316
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    new-instance v5, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    goto :goto_0

    .line 343
    :cond_4
    const/high16 v4, 0x41700000    # 15.0f

    iput v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateSweep:F

    .line 345
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateAnimator:Landroid/animation/AnimatorSet;

    .line 346
    const/4 v3, 0x0

    .line 347
    .local v3, "prevSet":Landroid/animation/AnimatorSet;
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_2
    iget v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSteps:I

    if-ge v1, v4, :cond_6

    .line 348
    int-to-float v4, v1

    invoke-direct {p0, v4}, Lcom/vkontakte/android/ui/CircularProgressView;->createIndeterminateAnimator(F)Landroid/animation/AnimatorSet;

    move-result-object v2

    .line 349
    .local v2, "nextSet":Landroid/animation/AnimatorSet;
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v4, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v0

    .line 350
    .local v0, "builder":Landroid/animation/AnimatorSet$Builder;
    if-eqz v3, :cond_5

    .line 351
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 352
    :cond_5
    move-object v3, v2

    .line 347
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 356
    .end local v0    # "builder":Landroid/animation/AnimatorSet$Builder;
    .end local v2    # "nextSet":Landroid/animation/AnimatorSet;
    :cond_6
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateAnimator:Landroid/animation/AnimatorSet;

    new-instance v5, Lcom/vkontakte/android/ui/CircularProgressView$4;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/ui/CircularProgressView$4;-><init>(Lcom/vkontakte/android/ui/CircularProgressView;)V

    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 370
    iget-object v4, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_1
.end method

.method public setColor(I)V
    .locals 0
    .param p1, "color"    # I

    .prologue
    .line 221
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->color:I

    .line 222
    invoke-direct {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->updatePaint()V

    .line 223
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->invalidate()V

    .line 224
    return-void
.end method

.method public setIndeterminate(Z)V
    .locals 2
    .param p1, "isIndeterminate"    # Z

    .prologue
    .line 180
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->isIndeterminate:Z

    if-ne v1, p1, :cond_1

    const/4 v0, 0x1

    .line 181
    .local v0, "reset":Z
    :goto_0
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->isIndeterminate:Z

    .line 182
    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->resetAnimation()V

    .line 185
    :cond_0
    return-void

    .line 180
    .end local v0    # "reset":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setMaxProgress(F)V
    .locals 0
    .param p1, "maxProgress"    # F

    .prologue
    .line 241
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->maxProgress:F

    .line 242
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->invalidate()V

    .line 243
    return-void
.end method

.method public setProgress(F)V
    .locals 4
    .param p1, "currentProgress"    # F

    .prologue
    .line 258
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->currentProgress:F

    .line 260
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->isIndeterminate:Z

    if-nez v0, :cond_1

    .line 261
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 262
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 263
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v1, 0x0

    iget v2, p0, Lcom/vkontakte/android/ui/CircularProgressView;->actualProgress:F

    aput v2, v0, v1

    const/4 v1, 0x1

    aput p1, v0, v1

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    .line 264
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    iget v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->animSyncDuration:I

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 265
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 266
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/vkontakte/android/ui/CircularProgressView$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/CircularProgressView$1;-><init>(Lcom/vkontakte/android/ui/CircularProgressView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 274
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 276
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->invalidate()V

    .line 277
    return-void
.end method

.method public setProgressNoAnim(F)V
    .locals 0
    .param p1, "currentProgress"    # F

    .prologue
    .line 280
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->actualProgress:F

    .line 281
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->currentProgress:F

    .line 282
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->invalidate()V

    .line 283
    return-void
.end method

.method public setThickness(I)V
    .locals 0
    .param p1, "thickness"    # I

    .prologue
    .line 202
    iput p1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->thickness:I

    .line 203
    invoke-direct {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->updatePaint()V

    .line 204
    invoke-direct {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->updateBounds()V

    .line 205
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->invalidate()V

    .line 206
    return-void
.end method

.method public setVisibility(I)V
    .locals 2
    .param p1, "visibility"    # I

    .prologue
    .line 470
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->getVisibility()I

    move-result v0

    .line 471
    .local v0, "currentVisibility":I
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 472
    if-eq p1, v0, :cond_0

    .line 473
    if-nez p1, :cond_1

    .line 474
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->resetAnimation()V

    .line 479
    :cond_0
    :goto_0
    return-void

    .line 475
    :cond_1
    const/16 v1, 0x8

    if-eq p1, v1, :cond_2

    const/4 v1, 0x4

    if-ne p1, v1, :cond_0

    .line 476
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->stopAnimation()V

    goto :goto_0
.end method

.method public startAnimation()V
    .locals 0

    .prologue
    .line 290
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CircularProgressView;->resetAnimation()V

    .line 291
    return-void
.end method

.method public stopAnimation()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 381
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 382
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 383
    iput-object v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->startAngleRotate:Landroid/animation/ValueAnimator;

    .line 385
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_1

    .line 386
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 387
    iput-object v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->progressAnimator:Landroid/animation/ValueAnimator;

    .line 389
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateAnimator:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_2

    .line 390
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 391
    iput-object v1, p0, Lcom/vkontakte/android/ui/CircularProgressView;->indeterminateAnimator:Landroid/animation/AnimatorSet;

    .line 393
    :cond_2
    return-void
.end method
