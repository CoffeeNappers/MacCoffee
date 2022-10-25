.class public Lcom/vkontakte/android/ui/widget/WaveformView;
.super Landroid/view/View;
.source "WaveformView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;,
        Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;
    }
.end annotation


# static fields
.field private static final BAR_WIDTH:I = 0x2

.field private static final BAR_WIDTH_TOTAL:I = 0x3

.field private static final THUMB_IND_DELAY:J = 0x1f4L

.field private static final THUMB_IND_DURATION:J = 0x9c4L

.field private static final THUMB_IND_WIDTH:F = 0.2f

.field private static final barWidth:I

.field private static final barWidthTotal:I

.field private static final displayMetrics:Landroid/util/DisplayMetrics;

.field private static final radius:F


# instance fields
.field private final barRect:Landroid/graphics/RectF;

.field private bitmap:Landroid/graphics/Bitmap;

.field private centerY:I

.field private curDrawData:Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;

.field private delegate:Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;

.field private height:I

.field private indProgress:F

.field private final indeterminateAnimator:Landroid/animation/ObjectAnimator;

.field private final paintPrimary:Landroid/graphics/Paint;

.field private final paintProgress:Landroid/graphics/Paint;

.field private pressed:Z

.field private scrollParentView:Landroid/view/ViewParent;

.field private startDragging:Z

.field private startX:F

.field private thumbX:Ljava/lang/Integer;

.field private totalBarsCount:F

.field private waveCanvas:Landroid/graphics/Canvas;

.field private waveformBytes:[B

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/high16 v1, 0x40000000    # 2.0f

    .line 36
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/widget/WaveformView;->displayMetrics:Landroid/util/DisplayMetrics;

    .line 37
    const/high16 v0, 0x40400000    # 3.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/widget/WaveformView;->barWidthTotal:I

    .line 38
    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/widget/WaveformView;->barWidth:I

    .line 39
    sget v0, Lcom/vkontakte/android/ui/widget/WaveformView;->barWidth:I

    int-to-float v0, v0

    div-float/2addr v0, v1

    sput v0, Lcom/vkontakte/android/ui/widget/WaveformView;->radius:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WaveformView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WaveformView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x1

    .line 72
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintPrimary:Landroid/graphics/Paint;

    .line 42
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintProgress:Landroid/graphics/Paint;

    .line 43
    const-string/jumbo v0, "indProgress"

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    .line 44
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->barRect:Landroid/graphics/RectF;

    .line 45
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indProgress:F

    .line 73
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/WaveformView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 74
    return-void

    .line 43
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 78
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 40
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintPrimary:Landroid/graphics/Paint;

    .line 42
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintProgress:Landroid/graphics/Paint;

    .line 43
    const-string/jumbo v0, "indProgress"

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    .line 44
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->barRect:Landroid/graphics/RectF;

    .line 45
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indProgress:F

    .line 79
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/WaveformView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 80
    return-void

    .line 43
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method private static calcDrawData([BI)Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;
    .locals 3
    .param p0, "waveformBytes"    # [B
    .param p1, "newSize"    # I

    .prologue
    .line 273
    if-nez p0, :cond_0

    .line 274
    const/4 v1, 0x0

    .line 277
    :goto_0
    return-object v1

    .line 276
    :cond_0
    invoke-static {p0, p1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->resizeWaveform([BI)[B

    move-result-object v0

    .line 277
    .local v0, "result":[B
    new-instance v1, Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/WaveformView;->getMaxValue([B)B

    move-result v2

    invoke-direct {v1, v0, v2}, Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;-><init>([BB)V

    goto :goto_0
.end method

.method private drawBar(IILandroid/graphics/Paint;)V
    .locals 8
    .param p1, "left"    # I
    .param p2, "barHeight"    # I
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 260
    sget v3, Lcom/vkontakte/android/ui/widget/WaveformView;->barWidth:I

    add-int/2addr v3, p1

    int-to-float v1, v3

    .line 261
    .local v1, "right":F
    int-to-float v3, p2

    sget v4, Lcom/vkontakte/android/ui/widget/WaveformView;->radius:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_0

    .line 262
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->barRect:Landroid/graphics/RectF;

    int-to-float v4, p1

    iget v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->centerY:I

    int-to-float v5, v5

    sget v6, Lcom/vkontakte/android/ui/widget/WaveformView;->radius:F

    sub-float/2addr v5, v6

    iget v6, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->centerY:I

    int-to-float v6, v6

    sget v7, Lcom/vkontakte/android/ui/widget/WaveformView;->radius:F

    add-float/2addr v6, v7

    invoke-virtual {v3, v4, v5, v1, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 263
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveCanvas:Landroid/graphics/Canvas;

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->barRect:Landroid/graphics/RectF;

    sget v5, Lcom/vkontakte/android/ui/widget/WaveformView;->radius:F

    sget v6, Lcom/vkontakte/android/ui/widget/WaveformView;->radius:F

    invoke-virtual {v3, v4, v5, v6, p3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 270
    :goto_0
    return-void

    .line 265
    :cond_0
    iget v3, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->centerY:I

    iget v4, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->centerY:I

    sub-int/2addr v4, p2

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v2, v3

    .line 266
    .local v2, "top":F
    iget v3, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->centerY:I

    iget v4, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->centerY:I

    add-int/2addr v4, p2

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v0, v3

    .line 267
    .local v0, "bottom":F
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->barRect:Landroid/graphics/RectF;

    int-to-float v4, p1

    invoke-virtual {v3, v4, v2, v1, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 268
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveCanvas:Landroid/graphics/Canvas;

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->barRect:Landroid/graphics/RectF;

    sget v5, Lcom/vkontakte/android/ui/widget/WaveformView;->radius:F

    sget v6, Lcom/vkontakte/android/ui/widget/WaveformView;->radius:F

    invoke-virtual {v3, v4, v5, v6, p3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method private static getMaxValue([B)B
    .locals 4
    .param p0, "source"    # [B

    .prologue
    .line 282
    const/16 v0, -0x80

    .line 283
    .local v0, "max":B
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-byte v1, p0, v2

    .line 284
    .local v1, "val":B
    if-le v1, v0, :cond_0

    .line 285
    move v0, v1

    .line 283
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 288
    .end local v1    # "val":B
    :cond_1
    return v0
.end method

.method private static getPixelsInCM(FZ)F
    .locals 2
    .param p0, "cm"    # F
    .param p1, "isX"    # Z

    .prologue
    .line 292
    const v0, 0x40228f5c    # 2.54f

    div-float v1, p0, v0

    if-eqz p1, :cond_0

    sget-object v0, Lcom/vkontakte/android/ui/widget/WaveformView;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->xdpi:F

    :goto_0
    mul-float/2addr v0, v1

    return v0

    :cond_0
    sget-object v0, Lcom/vkontakte/android/ui/widget/WaveformView;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->ydpi:F

    goto :goto_0
.end method

.method private static getScrollParent(Landroid/view/View;)Landroid/view/ViewParent;
    .locals 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 296
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 297
    .local v0, "parent":Landroid/view/ViewParent;
    :goto_0
    if-eqz v0, :cond_1

    .line 298
    instance-of v1, v0, Landroid/support/v7/widget/RecyclerView;

    if-eqz v1, :cond_0

    .line 304
    .end local v0    # "parent":Landroid/view/ViewParent;
    :goto_1
    return-object v0

    .line 301
    .restart local v0    # "parent":Landroid/view/ViewParent;
    :cond_0
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_0

    .line 304
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/high16 v3, -0x1000000

    .line 83
    if-eqz p2, :cond_0

    .line 84
    sget-object v1, Lcom/vkontakte/android/R$styleable;->WaveformView:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 85
    .local v0, "a":Landroid/content/res/TypedArray;
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintPrimary:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintProgress:Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 87
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 89
    .end local v0    # "a":Landroid/content/res/TypedArray;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v2, 0x9c4

    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 90
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 91
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    new-instance v2, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 92
    return-void
.end method

.method private stopAnimation()V
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 145
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indProgress:F

    .line 147
    :cond_0
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 151
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 152
    invoke-static {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->getScrollParent(Landroid/view/View;)Landroid/view/ViewParent;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->scrollParentView:Landroid/view/ViewParent;

    .line 153
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 158
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indProgress:F

    .line 159
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 160
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v10, 0x0

    .line 236
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 237
    iget v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->totalBarsCount:F

    const v8, 0x3dcccccd    # 0.1f

    cmpl-float v7, v7, v8

    if-lez v7, :cond_5

    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->curDrawData:Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveCanvas:Landroid/graphics/Canvas;

    if-eqz v7, :cond_5

    .line 238
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveCanvas:Landroid/graphics/Canvas;

    const/4 v8, 0x0

    sget-object v9, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 239
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->curDrawData:Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;

    iget-object v7, v7, Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;->waveform:[B

    array-length v7, v7

    int-to-float v2, v7

    .line 240
    .local v2, "length":F
    const/4 v0, 0x0

    .local v0, "bar":I
    :goto_0
    int-to-float v7, v0

    cmpg-float v7, v7, v2

    if-gez v7, :cond_4

    .line 241
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->curDrawData:Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;

    iget-object v7, v7, Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;->waveform:[B

    aget-byte v5, v7, v0

    .line 242
    .local v5, "value":B
    sget v7, Lcom/vkontakte/android/ui/widget/WaveformView;->barWidthTotal:I

    mul-int v6, v0, v7

    .line 243
    .local v6, "x":I
    int-to-float v7, v5

    const/high16 v8, 0x41f80000    # 31.0f

    div-float/2addr v7, v8

    iget v8, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->centerY:I

    int-to-float v8, v8

    mul-float/2addr v7, v8

    float-to-int v1, v7

    .line 246
    .local v1, "barHeight":I
    iget v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indProgress:F

    cmpl-float v7, v7, v10

    if-ltz v7, :cond_1

    .line 247
    int-to-float v7, v0

    div-float v4, v7, v2

    .line 248
    .local v4, "prg":F
    iget v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indProgress:F

    cmpl-float v7, v4, v7

    if-ltz v7, :cond_0

    iget v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indProgress:F

    const v8, 0x3e4ccccd    # 0.2f

    add-float/2addr v7, v8

    cmpg-float v7, v4, v7

    if-gtz v7, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintPrimary:Landroid/graphics/Paint;

    .line 253
    .end local v4    # "prg":F
    .local v3, "paint":Landroid/graphics/Paint;
    :goto_1
    invoke-direct {p0, v6, v1, v3}, Lcom/vkontakte/android/ui/widget/WaveformView;->drawBar(IILandroid/graphics/Paint;)V

    .line 240
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 248
    .end local v3    # "paint":Landroid/graphics/Paint;
    .restart local v4    # "prg":F
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintProgress:Landroid/graphics/Paint;

    goto :goto_1

    .line 250
    .end local v4    # "prg":F
    :cond_1
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ge v6, v7, :cond_3

    sget v7, Lcom/vkontakte/android/ui/widget/WaveformView;->barWidth:I

    add-int/2addr v7, v6

    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ge v7, v8, :cond_3

    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintPrimary:Landroid/graphics/Paint;

    .restart local v3    # "paint":Landroid/graphics/Paint;
    :goto_2
    goto :goto_1

    .end local v3    # "paint":Landroid/graphics/Paint;
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintProgress:Landroid/graphics/Paint;

    goto :goto_2

    .line 255
    .end local v1    # "barHeight":I
    .end local v5    # "value":B
    .end local v6    # "x":I
    :cond_4
    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->bitmap:Landroid/graphics/Bitmap;

    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintPrimary:Landroid/graphics/Paint;

    invoke-virtual {p1, v7, v10, v10, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 257
    .end local v0    # "bar":I
    .end local v2    # "length":F
    :cond_5
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 5
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/4 v4, 0x0

    .line 210
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 211
    if-lez p1, :cond_2

    if-lez p2, :cond_2

    .line 213
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/ui/widget/WaveformView;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->width:I

    .line 214
    sget-object v1, Lcom/vkontakte/android/ui/widget/WaveformView;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->height:I

    .line 215
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->getPaddingTop()I

    move-result v1

    add-int/2addr v1, p2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->centerY:I

    .line 216
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    .line 217
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 219
    :cond_0
    iget v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->width:I

    iget v2, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->height:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->bitmap:Landroid/graphics/Bitmap;

    .line 220
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveCanvas:Landroid/graphics/Canvas;

    .line 221
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->isInEditMode()Z

    move-result v1

    if-nez v1, :cond_1

    .line 222
    sget v1, Lcom/vkontakte/android/ui/widget/WaveformView;->barWidthTotal:I

    div-int v1, p1, v1

    int-to-float v1, v1

    iput v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->totalBarsCount:F

    .line 224
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveformBytes:[B

    iget v2, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->totalBarsCount:F

    float-to-int v2, v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/widget/WaveformView;->calcDrawData([BI)Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->curDrawData:Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    :goto_0
    return-void

    .line 225
    :catch_0
    move-exception v0

    .line 226
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " size is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/analytics/Analytics;->log(Ljava/lang/String;)V

    .line 227
    iput-object v4, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveCanvas:Landroid/graphics/Canvas;

    goto :goto_0

    .line 230
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    iput-object v4, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveCanvas:Landroid/graphics/Canvas;

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/high16 v8, -0x40800000    # -1.0f

    const/4 v7, 0x0

    const/4 v1, 0x0

    const/4 v4, 0x1

    .line 164
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 165
    .local v2, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 166
    .local v3, "y":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 167
    .local v0, "action":I
    if-nez v0, :cond_1

    .line 168
    cmpg-float v5, v1, v2

    if-gtz v5, :cond_a

    iget v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->width:I

    int-to-float v5, v5

    cmpg-float v5, v2, v5

    if-gtz v5, :cond_a

    cmpl-float v5, v3, v1

    if-ltz v5, :cond_a

    iget v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->height:I

    int-to-float v5, v5

    cmpg-float v5, v3, v5

    if-gtz v5, :cond_a

    .line 169
    iput v2, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->startX:F

    .line 170
    iput-boolean v4, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->pressed:Z

    .line 171
    iput-boolean v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->startDragging:Z

    .line 205
    :cond_0
    :goto_0
    return v4

    .line 174
    :cond_1
    if-eq v0, v4, :cond_2

    const/4 v5, 0x3

    if-ne v0, v5, :cond_5

    .line 175
    :cond_2
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->pressed:Z

    if-eqz v5, :cond_a

    .line 176
    if-ne v0, v4, :cond_3

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->delegate:Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;

    if-eqz v5, :cond_3

    .line 177
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    if-nez v5, :cond_4

    .line 178
    .local v1, "delta":F
    :goto_1
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->delegate:Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;

    iget v6, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->width:I

    int-to-float v6, v6

    div-float v6, v1, v6

    invoke-interface {v5, v6}, Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;->onSeekBarDrag(F)V

    .line 180
    .end local v1    # "delta":F
    :cond_3
    iput-boolean v7, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->pressed:Z

    .line 181
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->invalidate()V

    goto :goto_0

    .line 177
    :cond_4
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-float v1, v5

    goto :goto_1

    .line 184
    :cond_5
    const/4 v5, 0x2

    if-ne v0, v5, :cond_a

    .line 185
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->pressed:Z

    if-eqz v5, :cond_a

    .line 186
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->startDragging:Z

    if-eqz v5, :cond_7

    .line 187
    float-to-int v5, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    .line 188
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-gez v5, :cond_9

    .line 189
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    .line 193
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->invalidate()V

    .line 195
    :cond_7
    iget v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->startX:F

    cmpl-float v5, v5, v8

    if-eqz v5, :cond_0

    iget v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->startX:F

    sub-float v5, v2, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const v6, 0x3e4ccccd    # 0.2f

    invoke-static {v6, v4}, Lcom/vkontakte/android/ui/widget/WaveformView;->getPixelsInCM(FZ)F

    move-result v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_0

    .line 196
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->scrollParentView:Landroid/view/ViewParent;

    if-eqz v5, :cond_8

    .line 197
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->scrollParentView:Landroid/view/ViewParent;

    invoke-interface {v5, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 199
    :cond_8
    iput-boolean v4, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->startDragging:Z

    .line 200
    iput v8, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->startX:F

    goto :goto_0

    .line 190
    :cond_9
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->width:I

    if-le v5, v6, :cond_6

    .line 191
    iget v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->width:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    goto :goto_2

    .line 205
    :cond_a
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    goto/16 :goto_0
.end method

.method public setColors(II)V
    .locals 1
    .param p1, "primary"    # I
    .param p2, "progress"    # I

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintPrimary:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->paintProgress:Landroid/graphics/Paint;

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 101
    return-void
.end method

.method public setIndProgress(F)V
    .locals 0
    .param p1, "progress"    # F

    .prologue
    .line 104
    iput p1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indProgress:F

    .line 105
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->invalidate()V

    .line 106
    return-void
.end method

.method public setProgress(Ljava/lang/Float;)V
    .locals 4
    .param p1, "progress"    # Ljava/lang/Float;

    .prologue
    .line 118
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->pressed:Z

    if-nez v0, :cond_0

    .line 119
    if-nez p1, :cond_1

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    .line 121
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->stopAnimation()V

    .line 122
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->invalidate()V

    .line 140
    :cond_0
    :goto_0
    return-void

    .line 123
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_2

    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x3

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->indeterminateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0

    .line 128
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    mul-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gez v0, :cond_4

    .line 131
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    .line 136
    :cond_3
    :goto_1
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->stopAnimation()V

    .line 137
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->invalidate()V

    goto :goto_0

    .line 132
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->getWidth()I

    move-result v1

    if-le v0, v1, :cond_3

    .line 133
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->getWidth()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->thumbX:Ljava/lang/Integer;

    goto :goto_1

    .line 124
    nop

    :array_0
    .array-data 4
        0x0
        0x3f4ccccd    # 0.8f
        0x0
    .end array-data
.end method

.method public setSeekBarDelegate(Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;)V
    .locals 0
    .param p1, "delegate"    # Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->delegate:Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;

    .line 96
    return-void
.end method

.method public setWaveform([B)V
    .locals 2
    .param p1, "waveform"    # [B

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveformBytes:[B

    if-nez v0, :cond_0

    if-eqz p1, :cond_1

    .line 110
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveformBytes:[B

    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->waveformBytes:[B

    iget v1, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->totalBarsCount:F

    float-to-int v1, v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/widget/WaveformView;->calcDrawData([BI)Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveformView;->curDrawData:Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;

    .line 112
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveformView;->invalidate()V

    .line 113
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/WaveformView;->setProgress(Ljava/lang/Float;)V

    .line 115
    :cond_1
    return-void
.end method
