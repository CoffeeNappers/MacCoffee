.class public final Lcom/vk/music/graphics/PlaceholderDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "PlaceholderDrawable.java"


# static fields
.field static final PLACEHOLDER_BG_COLOR:I

.field static final PLACEHOLDER_ICON_TINT_COLOR:I


# instance fields
.field private final drawable:Landroid/graphics/drawable/LayerDrawable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 29
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0f0099

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/vk/music/graphics/PlaceholderDrawable;->PLACEHOLDER_BG_COLOR:I

    .line 30
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0f009a

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/vk/music/graphics/PlaceholderDrawable;->PLACEHOLDER_ICON_TINT_COLOR:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "size"    # I
    .param p2, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 35
    invoke-direct {p0, p1, p1, p2}, Lcom/vk/music/graphics/PlaceholderDrawable;-><init>(III)V

    .line 36
    return-void
.end method

.method public constructor <init>(III)V
    .locals 12
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 39
    new-instance v1, Landroid/graphics/drawable/shapes/RectShape;

    invoke-direct {v1}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V

    .line 40
    .local v1, "bgRect":Landroid/graphics/drawable/shapes/Shape;
    int-to-float v9, p1

    int-to-float v10, p2

    invoke-virtual {v1, v9, v10}, Landroid/graphics/drawable/shapes/Shape;->resize(FF)V

    .line 41
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 42
    .local v0, "bgDrawable":Landroid/graphics/drawable/ShapeDrawable;
    new-instance v9, Landroid/graphics/PorterDuffColorFilter;

    sget v10, Lcom/vk/music/graphics/PlaceholderDrawable;->PLACEHOLDER_BG_COLOR:I

    sget-object v11, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v9, v10, v11}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v9}, Landroid/graphics/drawable/ShapeDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 44
    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 45
    .local v7, "res":Landroid/content/res/Resources;
    invoke-static {v7, p3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 46
    .local v2, "icon":Landroid/graphics/Bitmap;
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v3, v7, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 47
    .local v3, "iconDrawable":Landroid/graphics/drawable/BitmapDrawable;
    const/4 v9, 0x1

    invoke-virtual {v3, v9}, Landroid/graphics/drawable/BitmapDrawable;->setAntiAlias(Z)V

    .line 48
    new-instance v9, Landroid/graphics/PorterDuffColorFilter;

    sget v10, Lcom/vk/music/graphics/PlaceholderDrawable;->PLACEHOLDER_ICON_TINT_COLOR:I

    sget-object v11, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v9, v10, v11}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v3, v9}, Landroid/graphics/drawable/BitmapDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 49
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    .line 50
    .local v5, "iconWidth":I
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 51
    .local v4, "iconHeight":I
    sub-int v9, p1, v5

    div-int/lit8 v6, v9, 0x2

    .line 52
    .local v6, "left":I
    sub-int v9, p2, v4

    div-int/lit8 v8, v9, 0x2

    .line 53
    .local v8, "top":I
    add-int v9, v6, v5

    add-int v10, v8, v4

    invoke-virtual {v3, v6, v8, v9, v10}, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V

    .line 54
    const/16 v9, 0x11

    invoke-virtual {v3, v9}, Landroid/graphics/drawable/BitmapDrawable;->setGravity(I)V

    .line 56
    new-instance v9, Landroid/graphics/drawable/LayerDrawable;

    const/4 v10, 0x2

    new-array v10, v10, [Landroid/graphics/drawable/Drawable;

    const/4 v11, 0x0

    aput-object v0, v10, v11

    const/4 v11, 0x1

    aput-object v3, v10, v11

    invoke-direct {v9, v10}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object v9, p0, Lcom/vk/music/graphics/PlaceholderDrawable;->drawable:Landroid/graphics/drawable/LayerDrawable;

    .line 57
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vk/music/graphics/PlaceholderDrawable;->drawable:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/LayerDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 62
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vk/music/graphics/PlaceholderDrawable;->drawable:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method public setAlpha(I)V
    .locals 1
    .param p1, "alpha"    # I

    .prologue
    .line 66
    iget-object v0, p0, Lcom/vk/music/graphics/PlaceholderDrawable;->drawable:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/LayerDrawable;->setAlpha(I)V

    .line 67
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vk/music/graphics/PlaceholderDrawable;->drawable:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/LayerDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 72
    return-void
.end method
