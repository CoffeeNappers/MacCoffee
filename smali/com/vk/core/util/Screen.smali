.class public Lcom/vk/core/util/Screen;
.super Ljava/lang/Object;
.source "Screen.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/util/Screen$ViewCallback;,
        Lcom/vk/core/util/Screen$ScreenSize;
    }
.end annotation


# static fields
.field private static isTablet:Ljava/lang/Boolean;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/vk/core/util/Screen;->isTablet:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static density()F
    .locals 1

    .prologue
    .line 60
    invoke-static {}, Lcom/vk/core/util/Screen;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    return v0
.end method

.method public static dp(F)I
    .locals 3
    .param p0, "dp"    # F

    .prologue
    .line 55
    invoke-static {}, Lcom/vk/core/util/Screen;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 56
    .local v0, "scale":F
    mul-float v1, p0, v0

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v1, v2

    float-to-int v1, v1

    return v1
.end method

.method public static dp(I)I
    .locals 1
    .param p0, "dp"    # I

    .prologue
    .line 51
    int-to-float v0, p0

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(F)I

    move-result v0

    return v0
.end method

.method public static getDisplayMetrics()Landroid/util/DisplayMetrics;
    .locals 1

    .prologue
    .line 73
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    return-object v0
.end method

.method private static getScreenSize(Landroid/content/Context;)Lcom/vk/core/util/Screen$ScreenSize;
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 41
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/vk/core/R$string;->screen_size:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 42
    .local v1, "value":Ljava/lang/String;
    invoke-static {}, Lcom/vk/core/util/Screen$ScreenSize;->values()[Lcom/vk/core/util/Screen$ScreenSize;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v0, v3, v2

    .line 43
    .local v0, "type":Lcom/vk/core/util/Screen$ScreenSize;
    invoke-virtual {v0}, Lcom/vk/core/util/Screen$ScreenSize;->name()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 47
    .end local v0    # "type":Lcom/vk/core/util/Screen$ScreenSize;
    :goto_1
    return-object v0

    .line 42
    .restart local v0    # "type":Lcom/vk/core/util/Screen$ScreenSize;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 47
    .end local v0    # "type":Lcom/vk/core/util/Screen$ScreenSize;
    :cond_1
    sget-object v0, Lcom/vk/core/util/Screen$ScreenSize;->normal:Lcom/vk/core/util/Screen$ScreenSize;

    goto :goto_1
.end method

.method public static height()I
    .locals 1

    .prologue
    .line 89
    invoke-static {}, Lcom/vk/core/util/Screen;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    return v0
.end method

.method public static isTablet()Z
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 26
    sget-object v0, Lcom/vk/core/util/Screen;->isTablet:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 27
    sget-object v0, Lcom/vk/core/util/AppContextHolder;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vk/core/util/Screen;->getScreenSize(Landroid/content/Context;)Lcom/vk/core/util/Screen$ScreenSize;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/Screen$ScreenSize;->ordinal()I

    move-result v0

    sget-object v1, Lcom/vk/core/util/Screen$ScreenSize;->normal:Lcom/vk/core/util/Screen$ScreenSize;

    invoke-virtual {v1}, Lcom/vk/core/util/Screen$ScreenSize;->ordinal()I

    move-result v1

    if-le v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/vk/core/util/Screen;->isTablet:Ljava/lang/Boolean;

    .line 29
    :cond_0
    sget-object v0, Lcom/vk/core/util/Screen;->isTablet:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 27
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isTablet(Landroid/content/Context;)Z
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 36
    invoke-static {p0}, Lcom/vk/core/util/Screen;->getScreenSize(Landroid/content/Context;)Lcom/vk/core/util/Screen$ScreenSize;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/Screen$ScreenSize;->ordinal()I

    move-result v0

    sget-object v1, Lcom/vk/core/util/Screen$ScreenSize;->normal:Lcom/vk/core/util/Screen$ScreenSize;

    invoke-virtual {v1}, Lcom/vk/core/util/Screen$ScreenSize;->ordinal()I

    move-result v1

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static iterateOverViews(Landroid/view/ViewGroup;Lcom/vk/core/util/Screen$ViewCallback;)V
    .locals 3
    .param p0, "viewGroup"    # Landroid/view/ViewGroup;
    .param p1, "callback"    # Lcom/vk/core/util/Screen$ViewCallback;

    .prologue
    .line 94
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 95
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 96
    .local v1, "v":Landroid/view/View;
    invoke-interface {p1, v1}, Lcom/vk/core/util/Screen$ViewCallback;->view(Landroid/view/View;)V

    .line 97
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    .line 98
    check-cast v1, Landroid/view/ViewGroup;

    .end local v1    # "v":Landroid/view/View;
    invoke-static {v1, p1}, Lcom/vk/core/util/Screen;->iterateOverViews(Landroid/view/ViewGroup;Lcom/vk/core/util/Screen$ViewCallback;)V

    .line 94
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 101
    :cond_1
    return-void
.end method

.method public static realHeight()I
    .locals 2

    .prologue
    .line 81
    invoke-static {}, Lcom/vk/core/util/Screen;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {}, Lcom/vk/core/util/Screen;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public static realWidth()I
    .locals 2

    .prologue
    .line 77
    invoke-static {}, Lcom/vk/core/util/Screen;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {}, Lcom/vk/core/util/Screen;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method public static sp(F)I
    .locals 3
    .param p0, "sp"    # F

    .prologue
    .line 68
    invoke-static {}, Lcom/vk/core/util/Screen;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 69
    .local v0, "scale":F
    mul-float v1, p0, v0

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v1, v2

    float-to-int v1, v1

    return v1
.end method

.method public static sp(I)I
    .locals 1
    .param p0, "sp"    # I

    .prologue
    .line 64
    int-to-float v0, p0

    invoke-static {v0}, Lcom/vk/core/util/Screen;->sp(F)I

    move-result v0

    return v0
.end method

.method public static width()I
    .locals 1

    .prologue
    .line 85
    invoke-static {}, Lcom/vk/core/util/Screen;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    return v0
.end method
