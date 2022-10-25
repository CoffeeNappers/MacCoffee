.class public Lcom/vk/stories/view/StoryPageTransformer;
.super Ljava/lang/Object;
.source "StoryPageTransformer.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$PageTransformer;


# static fields
.field private static final MIN_ALPHA:F = 0.4f

.field private static final MIN_SCALE:F = 0.9f


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public transformPage(Landroid/view/View;F)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # F

    .prologue
    const/4 v4, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 16
    .local v1, "pageWidth":I
    const/high16 v3, -0x40800000    # -1.0f

    cmpg-float v3, p2, v3

    if-gez v3, :cond_0

    .line 18
    invoke-virtual {p1, v4}, Landroid/view/View;->setAlpha(F)V

    .line 45
    :goto_0
    return-void

    .line 20
    :cond_0
    cmpg-float v3, p2, v4

    if-gtz v3, :cond_1

    .line 22
    invoke-virtual {p1, v6}, Landroid/view/View;->setAlpha(F)V

    .line 23
    invoke-virtual {p1, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 24
    invoke-virtual {p1, v6}, Landroid/view/View;->setScaleX(F)V

    .line 25
    invoke-virtual {p1, v6}, Landroid/view/View;->setScaleY(F)V

    goto :goto_0

    .line 27
    :cond_1
    cmpg-float v3, p2, v6

    if-gtz v3, :cond_2

    .line 29
    sub-float v0, v6, p2

    .line 30
    .local v0, "alphaProgress":F
    const v3, 0x3ecccccd    # 0.4f

    invoke-static {v0, v3, v6}, Lcom/vk/core/util/AnimationUtils;->mix(FFF)F

    move-result v3

    invoke-virtual {p1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 33
    int-to-float v3, v1

    neg-float v4, p2

    mul-float/2addr v3, v4

    invoke-virtual {p1, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 36
    const v3, 0x3f666666    # 0.9f

    const v4, 0x3dccccd0    # 0.100000024f

    .line 37
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    sub-float v5, v6, v5

    mul-float/2addr v4, v5

    add-float v2, v3, v4

    .line 38
    .local v2, "scaleFactor":F
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleX(F)V

    .line 39
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleY(F)V

    goto :goto_0

    .line 43
    .end local v0    # "alphaProgress":F
    .end local v2    # "scaleFactor":F
    :cond_2
    invoke-virtual {p1, v4}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0
.end method
