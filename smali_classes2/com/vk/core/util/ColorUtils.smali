.class public Lcom/vk/core/util/ColorUtils;
.super Ljava/lang/Object;
.source "ColorUtils.java"


# static fields
.field public static LUMA_BORDER:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 7
    const/high16 v0, 0x3f400000    # 0.75f

    sput v0, Lcom/vk/core/util/ColorUtils;->LUMA_BORDER:F

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static ave(IIF)I
    .locals 1
    .param p0, "src"    # I
    .param p1, "dst"    # I
    .param p2, "p"    # F

    .prologue
    .line 18
    sub-int v0, p1, p0

    int-to-float v0, v0

    mul-float/2addr v0, p2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/2addr v0, p0

    return v0
.end method

.method public static getOverlayColor(I)I
    .locals 3
    .param p0, "rgb"    # I

    .prologue
    .line 22
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/vk/core/util/ColorUtils;->getOverlayColor(III)I

    move-result v0

    return v0
.end method

.method public static getOverlayColor(III)I
    .locals 8
    .param p0, "_r"    # I
    .param p1, "_g"    # I
    .param p2, "_b"    # I

    .prologue
    const/high16 v5, 0x437f0000    # 255.0f

    const/16 v7, 0xff

    .line 38
    int-to-float v4, p0

    div-float v3, v4, v5

    .line 39
    .local v3, "r":F
    int-to-float v4, p1

    div-float v1, v4, v5

    .line 40
    .local v1, "g":F
    int-to-float v4, p2

    div-float v0, v4, v5

    .line 41
    .local v0, "b":F
    const v4, 0x3e59b3d0    # 0.2126f

    mul-float/2addr v4, v3

    const v5, 0x3f371759    # 0.7152f

    mul-float/2addr v5, v1

    add-float/2addr v4, v5

    const v5, 0x3d93dd98    # 0.0722f

    mul-float/2addr v5, v0

    add-float v2, v4, v5

    .line 42
    .local v2, "luma":F
    sget v4, Lcom/vk/core/util/ColorUtils;->LUMA_BORDER:F

    cmpl-float v4, v2, v4

    if-lez v4, :cond_0

    .line 43
    const/16 v4, 0x49

    const/16 v5, 0x4f

    const/16 v6, 0x5c

    invoke-static {v7, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    .line 45
    :goto_0
    return v4

    :cond_0
    invoke-static {v7, v7, v7, v7}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    goto :goto_0
.end method

.method public static interpolateColors(IIF)I
    .locals 6
    .param p0, "c0"    # I
    .param p1, "c1"    # I
    .param p2, "p"    # F

    .prologue
    .line 10
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    invoke-static {v4, v5, p2}, Lcom/vk/core/util/ColorUtils;->ave(IIF)I

    move-result v0

    .line 11
    .local v0, "a":I
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v5

    invoke-static {v4, v5, p2}, Lcom/vk/core/util/ColorUtils;->ave(IIF)I

    move-result v3

    .line 12
    .local v3, "r":I
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v5

    invoke-static {v4, v5, p2}, Lcom/vk/core/util/ColorUtils;->ave(IIF)I

    move-result v2

    .line 13
    .local v2, "g":I
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    invoke-static {v4, v5, p2}, Lcom/vk/core/util/ColorUtils;->ave(IIF)I

    move-result v1

    .line 14
    .local v1, "b":I
    invoke-static {v0, v3, v2, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    return v4
.end method

.method public static luma(I)F
    .locals 3
    .param p0, "rgb"    # I

    .prologue
    .line 26
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/vk/core/util/ColorUtils;->luma(III)F

    move-result v0

    return v0
.end method

.method public static luma(III)F
    .locals 6
    .param p0, "_r"    # I
    .param p1, "_g"    # I
    .param p2, "_b"    # I

    .prologue
    const/high16 v5, 0x437f0000    # 255.0f

    .line 30
    int-to-float v4, p0

    div-float v3, v4, v5

    .line 31
    .local v3, "r":F
    int-to-float v4, p1

    div-float v1, v4, v5

    .line 32
    .local v1, "g":F
    int-to-float v4, p2

    div-float v0, v4, v5

    .line 33
    .local v0, "b":F
    const v4, 0x3e59b3d0    # 0.2126f

    mul-float/2addr v4, v3

    const v5, 0x3f371759    # 0.7152f

    mul-float/2addr v5, v1

    add-float/2addr v4, v5

    const v5, 0x3d93dd98    # 0.0722f

    mul-float/2addr v5, v0

    add-float v2, v4, v5

    .line 34
    .local v2, "luma":F
    return v2
.end method

.method public static modifyAlpha(IF)I
    .locals 1
    .param p0, "color"    # I
    .param p1, "alpha"    # F

    .prologue
    .line 50
    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr v0, p1

    float-to-int v0, v0

    invoke-static {p0, v0}, Lcom/vk/core/util/ColorUtils;->modifyAlpha(II)I

    move-result v0

    return v0
.end method

.method public static modifyAlpha(II)I
    .locals 2
    .param p0, "color"    # I
    .param p1, "alpha"    # I

    .prologue
    .line 54
    const v0, 0xffffff

    and-int/2addr v0, p0

    shl-int/lit8 v1, p1, 0x18

    or-int/2addr v0, v1

    return v0
.end method
