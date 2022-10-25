.class public Lcom/vk/core/util/AnimationUtils;
.super Ljava/lang/Object;
.source "AnimationUtils.java"


# static fields
.field public static final DELAY_MID:I = 0x96

.field public static final DURATION_LONG:I = 0x177

.field public static final DURATION_MID:I = 0xe1

.field public static final DURATION_MULTIPLIER:F = 1.0f

.field public static final DURATION_SHORT:I = 0xc3

.field public static final START_DELAY:J = 0x10L

.field public static final accelerateDecelerateInterpolator:Landroid/view/animation/AccelerateDecelerateInterpolator;

.field public static final accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

.field public static final accelerateInterpolator2:Landroid/view/animation/AccelerateInterpolator;

.field public static final accelerationCurve:Landroid/support/v4/view/animation/FastOutLinearInInterpolator;

.field public static final decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

.field public static final decelerateInterpolator2:Landroid/view/animation/DecelerateInterpolator;

.field public static final decelerationCurve:Landroid/support/v4/view/animation/LinearOutSlowInInterpolator;

.field public static final standartCurve:Landroid/support/v4/view/animation/FastOutSlowInInterpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/high16 v1, 0x40000000    # 2.0f

    .line 27
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    sput-object v0, Lcom/vk/core/util/AnimationUtils;->accelerateDecelerateInterpolator:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 28
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    sput-object v0, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    .line 29
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    sput-object v0, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    .line 30
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    sput-object v0, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator2:Landroid/view/animation/DecelerateInterpolator;

    .line 31
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0, v1}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    sput-object v0, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator2:Landroid/view/animation/AccelerateInterpolator;

    .line 32
    new-instance v0, Landroid/support/v4/view/animation/FastOutSlowInInterpolator;

    invoke-direct {v0}, Landroid/support/v4/view/animation/FastOutSlowInInterpolator;-><init>()V

    sput-object v0, Lcom/vk/core/util/AnimationUtils;->standartCurve:Landroid/support/v4/view/animation/FastOutSlowInInterpolator;

    .line 33
    new-instance v0, Landroid/support/v4/view/animation/LinearOutSlowInInterpolator;

    invoke-direct {v0}, Landroid/support/v4/view/animation/LinearOutSlowInInterpolator;-><init>()V

    sput-object v0, Lcom/vk/core/util/AnimationUtils;->decelerationCurve:Landroid/support/v4/view/animation/LinearOutSlowInInterpolator;

    .line 34
    new-instance v0, Landroid/support/v4/view/animation/FastOutLinearInInterpolator;

    invoke-direct {v0}, Landroid/support/v4/view/animation/FastOutLinearInInterpolator;-><init>()V

    sput-object v0, Lcom/vk/core/util/AnimationUtils;->accelerationCurve:Landroid/support/v4/view/animation/FastOutLinearInInterpolator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accelerate(Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 1
    .param p0, "oa"    # Landroid/animation/Animator;

    .prologue
    .line 73
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 74
    return-object p0
.end method

.method public static accelerate2(Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 1
    .param p0, "oa"    # Landroid/animation/Animator;

    .prologue
    .line 83
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->accelerateInterpolator2:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 84
    return-object p0
.end method

.method public static accelerateCurve(Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 1
    .param p0, "oa"    # Landroid/animation/Animator;

    .prologue
    .line 103
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->accelerationCurve:Landroid/support/v4/view/animation/FastOutLinearInInterpolator;

    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 104
    return-object p0
.end method

.method public static accelerateDecelerate(Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 1
    .param p0, "oa"    # Landroid/animation/Animator;

    .prologue
    .line 88
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->accelerateDecelerateInterpolator:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 89
    return-object p0
.end method

.method public static accelerateDecelerate2(Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 1
    .param p0, "oa"    # Landroid/animation/Animator;

    .prologue
    .line 93
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->accelerateDecelerateInterpolator:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 94
    return-object p0
.end method

.method public static decelerate(Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 1
    .param p0, "oa"    # Landroid/animation/Animator;

    .prologue
    .line 68
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 69
    return-object p0
.end method

.method public static decelerate2(Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 1
    .param p0, "oa"    # Landroid/animation/Animator;

    .prologue
    .line 78
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator2:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 79
    return-object p0
.end method

.method public static decelerateCurve(Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 1
    .param p0, "oa"    # Landroid/animation/Animator;

    .prologue
    .line 108
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->decelerationCurve:Landroid/support/v4/view/animation/LinearOutSlowInInterpolator;

    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 109
    return-object p0
.end method

.method public static delay(Landroid/animation/Animator;I)Landroid/animation/Animator;
    .locals 5
    .param p0, "oa"    # Landroid/animation/Animator;
    .param p1, "delay"    # I

    .prologue
    const/4 v4, 0x2

    .line 113
    new-array v2, v4, [F

    fill-array-data v2, :array_0

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 114
    .local v0, "anim":Landroid/animation/ValueAnimator;
    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 116
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 117
    .local v1, "set":Landroid/animation/AnimatorSet;
    new-array v2, v4, [Landroid/animation/Animator;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v3, 0x1

    aput-object p0, v2, v3

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 119
    return-object v1

    .line 113
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static interpolate(FFF)F
    .locals 1
    .param p0, "amount"    # F
    .param p1, "min"    # F
    .param p2, "max"    # F

    .prologue
    .line 123
    sub-float v0, p2, p1

    mul-float/2addr v0, p0

    add-float/2addr v0, p1

    return v0
.end method

.method public static varargs layersForAnimator(Landroid/animation/Animator;[Landroid/view/View;)V
    .locals 4
    .param p0, "animator"    # Landroid/animation/Animator;
    .param p1, "views"    # [Landroid/view/View;

    .prologue
    .line 37
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 38
    aget-object v1, p1, v0

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 37
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 40
    :cond_0
    new-instance v1, Lcom/vk/core/util/AnimationUtils$1;

    invoke-direct {v1, p1}, Lcom/vk/core/util/AnimationUtils$1;-><init>([Landroid/view/View;)V

    invoke-virtual {p0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    return-void
.end method

.method public static mix(FFF)F
    .locals 1
    .param p0, "fraction"    # F
    .param p1, "startValue"    # F
    .param p2, "endValue"    # F

    .prologue
    .line 166
    sub-float v0, p2, p1

    mul-float/2addr v0, p0

    add-float/2addr v0, p1

    return v0
.end method

.method public static mix(FII)I
    .locals 1
    .param p0, "fraction"    # F
    .param p1, "startValue"    # I
    .param p2, "endValue"    # I

    .prologue
    .line 162
    sub-int v0, p2, p1

    int-to-float v0, v0

    mul-float/2addr v0, p0

    float-to-int v0, v0

    add-int/2addr v0, p1

    return v0
.end method

.method public static mixArgb(FII)I
    .locals 12
    .param p0, "fraction"    # F
    .param p1, "startValue"    # I
    .param p2, "endValue"    # I

    .prologue
    .line 143
    move v8, p1

    .line 144
    .local v8, "startInt":I
    shr-int/lit8 v10, v8, 0x18

    and-int/lit16 v5, v10, 0xff

    .line 145
    .local v5, "startA":I
    shr-int/lit8 v10, v8, 0x10

    and-int/lit16 v9, v10, 0xff

    .line 146
    .local v9, "startR":I
    shr-int/lit8 v10, v8, 0x8

    and-int/lit16 v7, v10, 0xff

    .line 147
    .local v7, "startG":I
    and-int/lit16 v6, v8, 0xff

    .line 149
    .local v6, "startB":I
    move v3, p2

    .line 150
    .local v3, "endInt":I
    shr-int/lit8 v10, v3, 0x18

    and-int/lit16 v0, v10, 0xff

    .line 151
    .local v0, "endA":I
    shr-int/lit8 v10, v3, 0x10

    and-int/lit16 v4, v10, 0xff

    .line 152
    .local v4, "endR":I
    shr-int/lit8 v10, v3, 0x8

    and-int/lit16 v2, v10, 0xff

    .line 153
    .local v2, "endG":I
    and-int/lit16 v1, v3, 0xff

    .line 155
    .local v1, "endB":I
    sub-int v10, v0, v5

    int-to-float v10, v10

    mul-float/2addr v10, p0

    float-to-int v10, v10

    add-int/2addr v10, v5

    shl-int/lit8 v10, v10, 0x18

    sub-int v11, v4, v9

    int-to-float v11, v11

    mul-float/2addr v11, p0

    float-to-int v11, v11

    add-int/2addr v11, v9

    shl-int/lit8 v11, v11, 0x10

    or-int/2addr v10, v11

    sub-int v11, v2, v7

    int-to-float v11, v11

    mul-float/2addr v11, p0

    float-to-int v11, v11

    add-int/2addr v11, v7

    shl-int/lit8 v11, v11, 0x8

    or-int/2addr v10, v11

    sub-int v11, v1, v6

    int-to-float v11, v11

    mul-float/2addr v11, p0

    float-to-int v11, v11

    add-int/2addr v11, v6

    or-int/2addr v10, v11

    return v10
.end method

.method public static varargs ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;
    .locals 2
    .param p2, "values"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Landroid/util/Property",
            "<TT;",
            "Ljava/lang/Integer;",
            ">;[I)",
            "Landroid/animation/ObjectAnimator;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "target":Ljava/lang/Object;, "TT;"
    .local p1, "propertyName":Landroid/util/Property;, "Landroid/util/Property<TT;Ljava/lang/Integer;>;"
    invoke-static {p0, p1, p2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 63
    .local v0, "animator":Landroid/animation/ObjectAnimator;
    invoke-static {}, Lcom/vk/core/util/ArgbEvaluator;->getInstance()Lcom/vk/core/util/ArgbEvaluator;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 64
    return-object v0
.end method

.method public static varargs ofArgb(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;
    .locals 2
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "values"    # [I

    .prologue
    .line 56
    invoke-static {p0, p1, p2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 57
    .local v0, "animator":Landroid/animation/ObjectAnimator;
    invoke-static {}, Lcom/vk/core/util/ArgbEvaluator;->getInstance()Lcom/vk/core/util/ArgbEvaluator;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 58
    return-object v0
.end method

.method public static reset(Landroid/view/View;)V
    .locals 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    const/high16 v0, 0x3f800000    # 1.0f

    .line 127
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 128
    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 129
    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 130
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 131
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 135
    return-void
.end method

.method public static setScale(Landroid/view/View;F)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;
    .param p1, "scale"    # F

    .prologue
    .line 138
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 139
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 140
    return-void
.end method

.method public static standartCurve(Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 1
    .param p0, "oa"    # Landroid/animation/Animator;

    .prologue
    .line 98
    sget-object v0, Lcom/vk/core/util/AnimationUtils;->standartCurve:Landroid/support/v4/view/animation/FastOutSlowInInterpolator;

    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 99
    return-object p0
.end method
