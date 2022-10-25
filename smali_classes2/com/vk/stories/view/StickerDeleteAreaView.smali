.class public Lcom/vk/stories/view/StickerDeleteAreaView;
.super Landroid/view/View;
.source "StickerDeleteAreaView.java"


# static fields
.field private static final MAX_RADIUS:I

.field private static final MIN_RADIUS:I

.field public static final PROGRESS:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/stories/view/StickerDeleteAreaView;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final SHADOW_RATIO:F = 1.5454545f

.field private static final redColor:I = -0x18bcbd

.field private static final whiteColor:I = -0x1


# instance fields
.field private animator:Landroid/animation/AnimatorSet;

.field private bgShadow:Landroid/graphics/Bitmap;

.field private final bitmapPaint:Landroid/graphics/Paint;

.field private final bitmapRectF:Landroid/graphics/RectF;

.field private final circlePaint:Landroid/graphics/Paint;

.field private closedTrash:Landroid/graphics/Bitmap;

.field private openedTrash:Landroid/graphics/Bitmap;

.field private progress:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 26
    new-instance v0, Lcom/vk/stories/view/StickerDeleteAreaView$1;

    const-class v1, Ljava/lang/Float;

    const-string/jumbo v2, "progress"

    invoke-direct {v0, v1, v2}, Lcom/vk/stories/view/StickerDeleteAreaView$1;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/stories/view/StickerDeleteAreaView;->PROGRESS:Landroid/util/Property;

    .line 38
    const/16 v0, 0x38

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sput v0, Lcom/vk/stories/view/StickerDeleteAreaView;->MIN_RADIUS:I

    .line 39
    const/16 v0, 0x40

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sput v0, Lcom/vk/stories/view/StickerDeleteAreaView;->MAX_RADIUS:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 45
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->circlePaint:Landroid/graphics/Paint;

    .line 46
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapPaint:Landroid/graphics/Paint;

    .line 47
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapRectF:Landroid/graphics/RectF;

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->progress:F

    .line 59
    invoke-direct {p0}, Lcom/vk/stories/view/StickerDeleteAreaView;->init()V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 45
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->circlePaint:Landroid/graphics/Paint;

    .line 46
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapPaint:Landroid/graphics/Paint;

    .line 47
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapRectF:Landroid/graphics/RectF;

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->progress:F

    .line 65
    invoke-direct {p0}, Lcom/vk/stories/view/StickerDeleteAreaView;->init()V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 69
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->circlePaint:Landroid/graphics/Paint;

    .line 46
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapPaint:Landroid/graphics/Paint;

    .line 47
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapRectF:Landroid/graphics/RectF;

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->progress:F

    .line 70
    invoke-direct {p0}, Lcom/vk/stories/view/StickerDeleteAreaView;->init()V

    .line 71
    return-void
.end method

.method static synthetic access$002(Lcom/vk/stories/view/StickerDeleteAreaView;Landroid/animation/AnimatorSet;)Landroid/animation/AnimatorSet;
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/view/StickerDeleteAreaView;
    .param p1, "x1"    # Landroid/animation/AnimatorSet;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->animator:Landroid/animation/AnimatorSet;

    return-object p1
.end method

.method private cancelCurrentAnimator()V
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->animator:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->animator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->animator:Landroid/animation/AnimatorSet;

    .line 152
    :cond_0
    return-void
.end method

.method private createAnimatorSet()Landroid/animation/AnimatorSet;
    .locals 2

    .prologue
    .line 155
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 156
    .local v0, "defaultAnimator":Landroid/animation/AnimatorSet;
    new-instance v1, Lcom/vk/stories/view/StickerDeleteAreaView$2;

    invoke-direct {v1, p0}, Lcom/vk/stories/view/StickerDeleteAreaView$2;-><init>(Lcom/vk/stories/view/StickerDeleteAreaView;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 168
    return-object v0
.end method

.method private init()V
    .locals 3

    .prologue
    .line 74
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 75
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 76
    invoke-virtual {p0}, Lcom/vk/stories/view/StickerDeleteAreaView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f02007c

    invoke-static {v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bgShadow:Landroid/graphics/Bitmap;

    .line 77
    invoke-virtual {p0}, Lcom/vk/stories/view/StickerDeleteAreaView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020197

    invoke-static {v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->closedTrash:Landroid/graphics/Bitmap;

    .line 78
    invoke-virtual {p0}, Lcom/vk/stories/view/StickerDeleteAreaView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020198

    invoke-static {v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->openedTrash:Landroid/graphics/Bitmap;

    .line 79
    return-void
.end method


# virtual methods
.method public closedState()Landroid/animation/AnimatorSet;
    .locals 1

    .prologue
    .line 128
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/StickerDeleteAreaView;->setProgressAnimated(F)Landroid/animation/AnimatorSet;

    move-result-object v0

    return-object v0
.end method

.method public getProgress()F
    .locals 1

    .prologue
    .line 119
    iget v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->progress:F

    return v0
.end method

.method public hasOverlappingRendering()Z
    .locals 1

    .prologue
    .line 83
    const/4 v0, 0x0

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 88
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 90
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    int-to-float v3, v7

    .line 91
    .local v3, "cx":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    int-to-float v4, v7

    .line 92
    .local v4, "cy":F
    iget v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->progress:F

    sget v8, Lcom/vk/stories/view/StickerDeleteAreaView;->MIN_RADIUS:I

    sget v9, Lcom/vk/stories/view/StickerDeleteAreaView;->MAX_RADIUS:I

    invoke-static {v7, v8, v9}, Lcom/vk/core/util/AnimationUtils;->mix(FII)I

    move-result v7

    int-to-float v2, v7

    .line 95
    .local v2, "circleRadius":F
    const v7, 0x3fc5d174

    mul-float v6, v2, v7

    .line 96
    .local v6, "shadowSize":F
    iget-object v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapRectF:Landroid/graphics/RectF;

    sub-float v8, v3, v6

    sub-float v9, v4, v6

    add-float v10, v3, v6

    add-float v11, v4, v6

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/RectF;->set(FFFF)V

    .line 97
    iget-object v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapPaint:Landroid/graphics/Paint;

    const/16 v8, 0xff

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 98
    iget-object v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bgShadow:Landroid/graphics/Bitmap;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapRectF:Landroid/graphics/RectF;

    iget-object v10, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v7, v8, v9, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 101
    iget v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->progress:F

    const/4 v8, -0x1

    const v9, -0x18bcbd

    invoke-static {v7, v8, v9}, Lcom/vk/core/util/AnimationUtils;->mixArgb(FII)I

    move-result v1

    .line 102
    .local v1, "circleColor":I
    iget-object v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->circlePaint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 103
    iget-object v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->circlePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v2, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 106
    iget-object v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapRectF:Landroid/graphics/RectF;

    sget v8, Lcom/vk/stories/view/StickerDeleteAreaView;->MIN_RADIUS:I

    int-to-float v8, v8

    sub-float v8, v3, v8

    sget v9, Lcom/vk/stories/view/StickerDeleteAreaView;->MIN_RADIUS:I

    int-to-float v9, v9

    sub-float v9, v4, v9

    sget v10, Lcom/vk/stories/view/StickerDeleteAreaView;->MIN_RADIUS:I

    int-to-float v10, v10

    add-float/2addr v10, v3

    sget v11, Lcom/vk/stories/view/StickerDeleteAreaView;->MIN_RADIUS:I

    int-to-float v11, v11

    add-float/2addr v11, v4

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/RectF;->set(FFFF)V

    .line 107
    iget v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->progress:F

    float-to-double v8, v7

    const-wide/high16 v10, 0x3fe0000000000000L    # 0.5

    cmpg-double v7, v8, v10

    if-gez v7, :cond_0

    .line 108
    iget v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->progress:F

    const/high16 v8, 0x3f000000    # 0.5f

    div-float v5, v7, v8

    .line 109
    .local v5, "dissapearingProgress":F
    iget-object v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapPaint:Landroid/graphics/Paint;

    const/16 v8, 0xff

    const/4 v9, 0x0

    invoke-static {v5, v8, v9}, Lcom/vk/core/util/AnimationUtils;->mix(FII)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 110
    iget-object v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->closedTrash:Landroid/graphics/Bitmap;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapRectF:Landroid/graphics/RectF;

    iget-object v10, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v7, v8, v9, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 116
    .end local v5    # "dissapearingProgress":F
    :goto_0
    return-void

    .line 112
    :cond_0
    iget v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->progress:F

    const/high16 v8, 0x3f000000    # 0.5f

    sub-float/2addr v7, v8

    const/high16 v8, 0x3f000000    # 0.5f

    div-float v0, v7, v8

    .line 113
    .local v0, "appearingProgress":F
    iget-object v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapPaint:Landroid/graphics/Paint;

    const/4 v8, 0x0

    const/16 v9, 0xff

    invoke-static {v0, v8, v9}, Lcom/vk/core/util/AnimationUtils;->mix(FII)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 114
    iget-object v7, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->openedTrash:Landroid/graphics/Bitmap;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapRectF:Landroid/graphics/RectF;

    iget-object v10, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v7, v8, v9, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public openedState()Landroid/animation/AnimatorSet;
    .locals 1

    .prologue
    .line 132
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/StickerDeleteAreaView;->setProgressAnimated(F)Landroid/animation/AnimatorSet;

    move-result-object v0

    return-object v0
.end method

.method public setProgress(F)V
    .locals 0
    .param p1, "progress"    # F

    .prologue
    .line 123
    iput p1, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->progress:F

    .line 124
    invoke-virtual {p0}, Lcom/vk/stories/view/StickerDeleteAreaView;->invalidate()V

    .line 125
    return-void
.end method

.method public setProgressAnimated(F)Landroid/animation/AnimatorSet;
    .locals 7
    .param p1, "progress"    # F

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 136
    invoke-direct {p0}, Lcom/vk/stories/view/StickerDeleteAreaView;->cancelCurrentAnimator()V

    .line 138
    invoke-direct {p0}, Lcom/vk/stories/view/StickerDeleteAreaView;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->animator:Landroid/animation/AnimatorSet;

    .line 139
    iget-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->animator:Landroid/animation/AnimatorSet;

    new-array v1, v3, [Landroid/animation/Animator;

    sget-object v2, Lcom/vk/stories/view/StickerDeleteAreaView;->PROGRESS:Landroid/util/Property;

    new-array v3, v3, [F

    aput p1, v3, v6

    .line 140
    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    const-wide/16 v4, 0xe1

    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/AnimationUtils;->standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v1, v6

    .line 139
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 142
    iget-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->animator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 144
    iget-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView;->animator:Landroid/animation/AnimatorSet;

    return-object v0
.end method
