.class public Lcom/vk/imageloader/view/VKStickerImageView;
.super Lcom/vk/imageloader/view/VKImageView;
.source "VKStickerImageView.java"


# static fields
.field public static final OVERLAY_COLOR:I = 0x33000000

.field private static final sEnabled:Landroid/graphics/ColorFilter;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 14
    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    const/high16 v1, 0x33000000

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    sput-object v0, Lcom/vk/imageloader/view/VKStickerImageView;->sEnabled:Landroid/graphics/ColorFilter;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 18
    invoke-direct {p0}, Lcom/vk/imageloader/view/VKStickerImageView;->init()V

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    invoke-direct {p0}, Lcom/vk/imageloader/view/VKStickerImageView;->init()V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    invoke-direct {p0}, Lcom/vk/imageloader/view/VKStickerImageView;->init()V

    .line 29
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 32
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKStickerImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 33
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKStickerImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    sget-object v1, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_CENTER:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 35
    :cond_0
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 39
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 40
    .local v0, "action":I
    if-nez v0, :cond_1

    .line 41
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKStickerImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 42
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKStickerImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    sget-object v2, Lcom/vk/imageloader/view/VKStickerImageView;->sEnabled:Landroid/graphics/ColorFilter;

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageColorFilter(Landroid/graphics/ColorFilter;)V

    .line 50
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKImageView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1

    .line 44
    :cond_1
    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 45
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKStickerImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKStickerImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_0
.end method
