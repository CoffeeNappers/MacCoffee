.class public Lme/grishka/appkit/utils/V;
.super Ljava/lang/Object;
.source "V.java"


# static fields
.field private static appContext:Landroid/content/Context;

.field private static visibilityAnims:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lme/grishka/appkit/utils/V;->visibilityAnims:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lme/grishka/appkit/utils/V;->visibilityAnims:Ljava/util/HashMap;

    return-object v0
.end method

.method public static cancelVisibilityAnimation(Landroid/view/View;)V
    .locals 1
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 140
    sget-object v0, Lme/grishka/appkit/utils/V;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 143
    :goto_0
    return-void

    .line 141
    :cond_0
    sget-object v0, Lme/grishka/appkit/utils/V;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 142
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0
.end method

.method public static dp(F)I
    .locals 2
    .param p0, "dp"    # F

    .prologue
    .line 43
    sget-object v0, Lme/grishka/appkit/utils/V;->appContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Application context is not set, call V.setApplicationContext() before using these methods"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_0
    sget-object v0, Lme/grishka/appkit/utils/V;->appContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method public static findClickableChild(Landroid/view/ViewGroup;II)Landroid/view/View;
    .locals 6
    .param p0, "viewGroup"    # Landroid/view/ViewGroup;
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 156
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 157
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 158
    .local v0, "c":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v3

    if-ge v3, p1, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v3

    if-le v3, p1, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    if-ge v3, p2, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v3

    if-le v3, p2, :cond_1

    .line 159
    invoke-virtual {v0}, Landroid/view/View;->isClickable()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 168
    .end local v0    # "c":Landroid/view/View;
    :goto_1
    return-object v0

    .line 161
    .restart local v0    # "c":Landroid/view/View;
    :cond_0
    instance-of v3, v0, Landroid/view/ViewGroup;

    if-eqz v3, :cond_1

    move-object v3, v0

    .line 162
    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v4

    sub-int v4, p1, v4

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v5

    sub-int v5, p2, v5

    invoke-static {v3, v4, v5}, Lme/grishka/appkit/utils/V;->findClickableChild(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v2

    .line 163
    .local v2, "r":Landroid/view/View;
    if-eqz v2, :cond_1

    move-object v0, v2

    .line 164
    goto :goto_1

    .line 156
    .end local v2    # "r":Landroid/view/View;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 168
    .end local v0    # "c":Landroid/view/View;
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public static getViewOffset(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;
    .locals 6
    .param p0, "v1"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "v2"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 146
    new-array v0, v2, [I

    fill-array-data v0, :array_0

    .local v0, "p1":[I
    new-array v1, v2, [I

    fill-array-data v1, :array_1

    .line 147
    .local v1, "p2":[I
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 148
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 149
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 152
    :cond_0
    new-instance v2, Landroid/graphics/Point;

    aget v3, v0, v4

    aget v4, v1, v4

    sub-int/2addr v3, v4

    aget v4, v0, v5

    aget v5, v1, v5

    sub-int/2addr v4, v5

    invoke-direct {v2, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    return-object v2

    .line 146
    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public static setApplicationContext(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    sget-object v0, Lme/grishka/appkit/utils/V;->appContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lme/grishka/appkit/utils/V;->appContext:Landroid/content/Context;

    .line 35
    :cond_0
    return-void
.end method

.method public static setVisibilityAnimated(Landroid/view/View;I)V
    .locals 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "visibility"    # I

    .prologue
    .line 54
    const/4 v0, 0x0

    const/16 v1, 0x12c

    invoke-static {p0, p1, v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 55
    return-void
.end method

.method public static setVisibilityAnimated(Landroid/view/View;IZI)V
    .locals 10
    .param p0, "view"    # Landroid/view/View;
    .param p1, "visibility"    # I
    .param p2, "scale"    # Z
    .param p3, "duration"    # I

    .prologue
    .line 59
    if-nez p0, :cond_1

    .line 136
    :cond_0
    :goto_0
    return-void

    .line 62
    :cond_1
    if-nez p1, :cond_5

    const/4 v4, 0x1

    .line 63
    .local v4, "vis":Z
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_6

    const v5, 0x7f100085

    invoke-virtual {p0, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_6

    const/4 v3, 0x1

    .line 64
    .local v3, "viewVis":Z
    :goto_2
    if-eqz p2, :cond_8

    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_7

    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-nez v5, :cond_7

    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-nez v5, :cond_7

    const/4 v2, 0x1

    .line 67
    .local v2, "scaleVis":Z
    :goto_3
    if-ne v4, v3, :cond_2

    if-eq v2, v3, :cond_0

    .line 70
    :cond_2
    sget-object v5, Lme/grishka/appkit/utils/V;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v5, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 71
    sget-object v5, Lme/grishka/appkit/utils/V;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v5, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/animation/Animator;

    invoke-virtual {v5}, Landroid/animation/Animator;->cancel()V

    .line 72
    sget-object v5, Lme/grishka/appkit/utils/V;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v5, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    :cond_3
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .local v1, "animators":Ljava/util/List;, "Ljava/util/List<Landroid/animation/Animator;>;"
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 76
    .local v0, "anim":Landroid/animation/AnimatorSet;
    if-eqz v4, :cond_c

    .line 77
    if-eqz p2, :cond_4

    .line 78
    sget-object v6, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/4 v5, 0x2

    new-array v7, v5, [F

    const/4 v8, 0x0

    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    move-result v5

    const/high16 v9, 0x3f800000    # 1.0f

    cmpg-float v5, v5, v9

    if-gez v5, :cond_9

    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    move-result v5

    :goto_4
    aput v5, v7, v8

    const/4 v5, 0x1

    const/high16 v8, 0x3f800000    # 1.0f

    aput v8, v7, v5

    invoke-static {p0, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    sget-object v6, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/4 v5, 0x2

    new-array v7, v5, [F

    const/4 v8, 0x0

    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    move-result v5

    const/high16 v9, 0x3f800000    # 1.0f

    cmpg-float v5, v5, v9

    if-gez v5, :cond_a

    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    move-result v5

    :goto_5
    aput v5, v7, v8

    const/4 v5, 0x1

    const/high16 v8, 0x3f800000    # 1.0f

    aput v8, v7, v5

    invoke-static {p0, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    :cond_4
    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v5, 0x2

    new-array v7, v5, [F

    const/4 v8, 0x0

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v5

    const/high16 v9, 0x3f800000    # 1.0f

    cmpg-float v5, v5, v9

    if-gez v5, :cond_b

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v5

    :goto_6
    aput v5, v7, v8

    const/4 v5, 0x1

    const/high16 v8, 0x3f800000    # 1.0f

    aput v8, v7, v5

    invoke-static {p0, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 83
    new-instance v5, Lme/grishka/appkit/utils/V$1;

    invoke-direct {v5, p0, p1}, Lme/grishka/appkit/utils/V$1;-><init>(Landroid/view/View;I)V

    invoke-virtual {v0, v5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 100
    int-to-long v6, p3

    invoke-virtual {v0, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 101
    sget-object v5, Lme/grishka/appkit/utils/V;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v5, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_0

    .line 62
    .end local v0    # "anim":Landroid/animation/AnimatorSet;
    .end local v1    # "animators":Ljava/util/List;, "Ljava/util/List<Landroid/animation/Animator;>;"
    .end local v2    # "scaleVis":Z
    .end local v3    # "viewVis":Z
    .end local v4    # "vis":Z
    :cond_5
    const/4 v4, 0x0

    goto/16 :goto_1

    .line 63
    .restart local v4    # "vis":Z
    :cond_6
    const/4 v3, 0x0

    goto/16 :goto_2

    .line 65
    .restart local v3    # "viewVis":Z
    :cond_7
    const/4 v2, 0x0

    goto/16 :goto_3

    :cond_8
    move v2, v3

    goto/16 :goto_3

    .line 78
    .restart local v0    # "anim":Landroid/animation/AnimatorSet;
    .restart local v1    # "animators":Ljava/util/List;, "Ljava/util/List<Landroid/animation/Animator;>;"
    .restart local v2    # "scaleVis":Z
    :cond_9
    const v5, 0x3dcccccd    # 0.1f

    goto :goto_4

    .line 79
    :cond_a
    const v5, 0x3dcccccd    # 0.1f

    goto :goto_5

    .line 81
    :cond_b
    const/4 v5, 0x0

    goto :goto_6

    .line 104
    :cond_c
    if-eqz p2, :cond_d

    .line 105
    sget-object v5, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/4 v6, 0x1

    new-array v6, v6, [F

    const/4 v7, 0x0

    const v8, 0x3dcccccd    # 0.1f

    aput v8, v6, v7

    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    sget-object v5, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/4 v6, 0x1

    new-array v6, v6, [F

    const/4 v7, 0x0

    const v8, 0x3dcccccd    # 0.1f

    aput v8, v6, v7

    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    :cond_d
    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v6, 0x1

    new-array v6, v6, [F

    const/4 v7, 0x0

    const/4 v8, 0x0

    aput v8, v6, v7

    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 110
    new-instance v5, Lme/grishka/appkit/utils/V$2;

    invoke-direct {v5, p0, p1}, Lme/grishka/appkit/utils/V$2;-><init>(Landroid/view/View;I)V

    invoke-virtual {v0, v5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 131
    const v5, 0x7f100085

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 132
    int-to-long v6, p3

    invoke-virtual {v0, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 133
    sget-object v5, Lme/grishka/appkit/utils/V;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v5, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_0
.end method
