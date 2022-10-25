.class public Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;
.super Landroid/widget/ImageView;
.source "WaveRecordCircleView.java"


# static fields
.field private static final PAINT_ALPHA:I = 0x46


# instance fields
.field private amplitude:F

.field private animateAmplitudeDiff:F

.field private animateToAmplitude:F

.field private lastUpdateTime:J

.field private final minWaveRadius:F

.field private final paintButton:Landroid/graphics/Paint;

.field private final paintRecord:Landroid/graphics/Paint;

.field private final radius:F

.field private scale:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 30
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const v2, 0x7f0f0018

    const/4 v1, 0x1

    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->paintRecord:Landroid/graphics/Paint;

    .line 16
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->paintButton:Landroid/graphics/Paint;

    .line 19
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->scale:F

    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->paintButton:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->paintRecord:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->paintRecord:Landroid/graphics/Paint;

    const/16 v1, 0x46

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090038

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->radius:F

    .line 39
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09003b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->minWaveRadius:F

    .line 40
    return-void
.end method


# virtual methods
.method public getScale()F
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->scale:F

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v6, 0x0

    const/high16 v7, 0x40000000    # 2.0f

    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->lastUpdateTime:J

    sub-long v0, v2, v4

    .line 74
    .local v0, "dt":J
    iget v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateToAmplitude:F

    iget v3, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->amplitude:F

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_1

    .line 75
    iget v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->amplitude:F

    iget v3, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateAmplitudeDiff:F

    long-to-float v4, v0

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    iput v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->amplitude:F

    .line 76
    iget v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateAmplitudeDiff:F

    cmpl-float v2, v2, v6

    if-lez v2, :cond_3

    .line 77
    iget v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->amplitude:F

    iget v3, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateToAmplitude:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 78
    iget v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateToAmplitude:F

    iput v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->amplitude:F

    .line 85
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->invalidate()V

    .line 87
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->lastUpdateTime:J

    .line 88
    iget v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->amplitude:F

    cmpl-float v2, v2, v6

    if-eqz v2, :cond_2

    .line 89
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v7

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->getMeasuredHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v7

    iget v4, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->minWaveRadius:F

    const/high16 v5, 0x42200000    # 40.0f

    .line 90
    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    int-to-float v5, v5

    iget v6, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->amplitude:F

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    iget v5, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->scale:F

    mul-float/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->paintRecord:Landroid/graphics/Paint;

    .line 89
    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 92
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v7

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->getMeasuredHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v7

    iget v4, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->radius:F

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->paintButton:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 93
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 94
    return-void

    .line 81
    :cond_3
    iget v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->amplitude:F

    iget v3, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateToAmplitude:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_0

    .line 82
    iget v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateToAmplitude:F

    iput v2, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->amplitude:F

    goto :goto_0
.end method

.method public setAmplitude(Ljava/lang/Double;)V
    .locals 8
    .param p1, "value"    # Ljava/lang/Double;

    .prologue
    .line 43
    if-nez p1, :cond_0

    .line 44
    const/4 v4, 0x0

    iput v4, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateToAmplitude:F

    .line 50
    :goto_0
    iget v4, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateToAmplitude:F

    iget v5, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->amplitude:F

    sub-float/2addr v4, v5

    const/high16 v5, 0x43160000    # 150.0f

    div-float/2addr v4, v5

    iput v4, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateAmplitudeDiff:F

    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->lastUpdateTime:J

    .line 52
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->invalidate()V

    .line 53
    return-void

    .line 46
    :cond_0
    sget-wide v4, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->SILENCE_VALUE:D

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    .line 47
    .local v0, "max":D
    const-wide/16 v4, 0x0

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    sub-double v6, v0, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    .line 48
    .local v2, "val":D
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    double-to-float v4, v4

    double-to-float v5, v0

    div-float/2addr v4, v5

    iput v4, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->animateToAmplitude:F

    goto :goto_0
.end method

.method public setPaintColor(I)V
    .locals 2
    .param p1, "paintColor"    # I

    .prologue
    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->paintButton:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 66
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->paintRecord:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->paintRecord:Landroid/graphics/Paint;

    const/16 v1, 0x46

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 68
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->invalidate()V

    .line 69
    return-void
.end method

.method public setScale(F)V
    .locals 0
    .param p1, "value"    # F

    .prologue
    .line 60
    iput p1, p0, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->scale:F

    .line 61
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WaveRecordCircleView;->invalidate()V

    .line 62
    return-void
.end method
