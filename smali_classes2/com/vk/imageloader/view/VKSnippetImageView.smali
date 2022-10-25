.class public Lcom/vk/imageloader/view/VKSnippetImageView;
.super Lcom/vk/imageloader/view/VKImageView;
.source "VKSnippetImageView.java"


# static fields
.field private static final DEFAULT_BORDER_COLOR:I = 0x3d000c1a

.field private static final DEFAULT_BORDER_WIDTH:F

.field private static final DEFAULT_DRAW_BORDER:Z = true

.field public static final TYPE_HORIZONTAL:I = 0x0

.field public static final TYPE_NONE:I = 0x2

.field public static final TYPE_VERTICAL:I = 0x1


# instance fields
.field private borderColor:I

.field private borderWidth:F

.field private drawBorder:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/high16 v0, 0x3f000000    # 0.5f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    int-to-float v0, v0

    sput v0, Lcom/vk/imageloader/view/VKSnippetImageView;->DEFAULT_BORDER_WIDTH:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 23
    sget v0, Lcom/vk/imageloader/view/VKSnippetImageView;->DEFAULT_BORDER_WIDTH:F

    iput v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderWidth:F

    .line 24
    const v0, 0x3d000c1a

    iput v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderColor:I

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->drawBorder:Z

    .line 29
    invoke-direct {p0}, Lcom/vk/imageloader/view/VKSnippetImageView;->init()V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    sget v0, Lcom/vk/imageloader/view/VKSnippetImageView;->DEFAULT_BORDER_WIDTH:F

    iput v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderWidth:F

    .line 24
    const v0, 0x3d000c1a

    iput v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderColor:I

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->drawBorder:Z

    .line 34
    invoke-direct {p0}, Lcom/vk/imageloader/view/VKSnippetImageView;->init()V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    sget v0, Lcom/vk/imageloader/view/VKSnippetImageView;->DEFAULT_BORDER_WIDTH:F

    iput v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderWidth:F

    .line 24
    const v0, 0x3d000c1a

    iput v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderColor:I

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->drawBorder:Z

    .line 39
    invoke-direct {p0}, Lcom/vk/imageloader/view/VKSnippetImageView;->init()V

    .line 40
    return-void
.end method

.method private init()V
    .locals 1

    .prologue
    .line 43
    const v0, 0x7f02006a

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/VKSnippetImageView;->setBackgroundResource(I)V

    .line 44
    return-void
.end method

.method private setCorners(FFFF)V
    .locals 3
    .param p1, "topLeft"    # F
    .param p2, "topRight"    # F
    .param p3, "bottomRight"    # F
    .param p4, "bottomLeft"    # F

    .prologue
    .line 56
    invoke-static {p1, p2, p3, p4}, Lcom/facebook/drawee/generic/RoundingParams;->fromCornersRadii(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v0

    .line 58
    .local v0, "roundingParams":Lcom/facebook/drawee/generic/RoundingParams;
    iget-boolean v1, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->drawBorder:Z

    if-eqz v1, :cond_0

    .line 59
    iget v1, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderWidth:F

    .line 60
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->setBorderWidth(F)Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v1

    iget v2, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderColor:I

    .line 61
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->setBorderColor(I)Lcom/facebook/drawee/generic/RoundingParams;

    .line 64
    :cond_0
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKSnippetImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {v1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setRoundingParams(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 65
    return-void
.end method


# virtual methods
.method protected buildHierarchy(Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;)V
    .locals 3
    .param p1, "builder"    # Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .prologue
    const/high16 v1, 0x40000000    # 2.0f

    const/4 v2, 0x0

    .line 48
    sget-object v0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 50
    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    int-to-float v0, v0

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-static {v0, v1, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->fromCornersRadii(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v0

    const/high16 v1, 0x3f000000    # 0.5f

    .line 51
    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->setBorderWidth(F)Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v0

    const v1, 0x3d000c1a

    .line 52
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->setBorderColor(I)Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v0

    .line 49
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setRoundingParams(Lcom/facebook/drawee/generic/RoundingParams;)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 53
    return-void
.end method

.method public getBorderColor()I
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderColor:I

    return v0
.end method

.method public getBorderWidth()F
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderWidth:F

    return v0
.end method

.method public isDrawBorder()Z
    .locals 1

    .prologue
    .line 84
    iget-boolean v0, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->drawBorder:Z

    return v0
.end method

.method public setBorderColor(I)V
    .locals 0
    .param p1, "borderColor"    # I

    .prologue
    .line 80
    iput p1, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderColor:I

    .line 81
    return-void
.end method

.method public setBorderWidth(F)V
    .locals 0
    .param p1, "borderWidth"    # F

    .prologue
    .line 72
    iput p1, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->borderWidth:F

    .line 73
    return-void
.end method

.method public setDrawBorder(Z)V
    .locals 0
    .param p1, "drawBorder"    # Z

    .prologue
    .line 88
    iput-boolean p1, p0, Lcom/vk/imageloader/view/VKSnippetImageView;->drawBorder:Z

    .line 89
    return-void
.end method

.method public setType(I)V
    .locals 4
    .param p1, "type"    # I

    .prologue
    const/4 v2, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    .line 92
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 93
    const v0, 0x7f02006a

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/VKSnippetImageView;->setBackgroundResource(I)V

    .line 94
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    int-to-float v0, v0

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0, v0, v1, v2, v2}, Lcom/vk/imageloader/view/VKSnippetImageView;->setCorners(FFFF)V

    .line 102
    :goto_0
    return-void

    .line 95
    :cond_0
    if-nez p1, :cond_1

    .line 96
    const v0, 0x7f020069

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/VKSnippetImageView;->setBackgroundResource(I)V

    .line 97
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    int-to-float v0, v0

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0, v0, v2, v2, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->setCorners(FFFF)V

    goto :goto_0

    .line 99
    :cond_1
    const v0, 0x7f020068

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/VKSnippetImageView;->setBackgroundResource(I)V

    .line 100
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    int-to-float v0, v0

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    int-to-float v3, v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/vk/imageloader/view/VKSnippetImageView;->setCorners(FFFF)V

    goto :goto_0
.end method
