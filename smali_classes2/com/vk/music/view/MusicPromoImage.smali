.class public Lcom/vk/music/view/MusicPromoImage;
.super Landroid/view/View;
.source "MusicPromoImage.java"


# instance fields
.field private initialized:Z

.field private maskDrawable:Landroid/graphics/drawable/BitmapDrawable;

.field private maskPaint:Landroid/graphics/Paint;

.field private phoneDrawable:Landroid/graphics/drawable/BitmapDrawable;

.field private screenDrawable:Landroid/graphics/drawable/BitmapDrawable;

.field private tmpBitmap:Landroid/graphics/Bitmap;

.field private tmpCanvas:Landroid/graphics/Canvas;

.field private tmpDx:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/music/view/MusicPromoImage;->initialized:Z

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/music/view/MusicPromoImage;->initialized:Z

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/music/view/MusicPromoImage;->initialized:Z

    .line 37
    return-void
.end method

.method private drawable(I)Landroid/graphics/drawable/BitmapDrawable;
    .locals 4
    .param p1, "drawableRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    .line 58
    invoke-virtual {p0}, Lcom/vk/music/view/MusicPromoImage;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 59
    .local v0, "bd":Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    move-result v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V

    .line 60
    return-object v0
.end method


# virtual methods
.method protected getSuggestedMinimumHeight()I
    .locals 2

    .prologue
    .line 75
    invoke-super {p0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    move-result v0

    .line 76
    .local v0, "maxHeight":I
    iget-boolean v1, p0, Lcom/vk/music/view/MusicPromoImage;->initialized:Z

    if-eqz v1, :cond_0

    .line 77
    iget-object v1, p0, Lcom/vk/music/view/MusicPromoImage;->phoneDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getMinimumHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 78
    iget-object v1, p0, Lcom/vk/music/view/MusicPromoImage;->screenDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getMinimumHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 80
    :cond_0
    return v0
.end method

.method protected getSuggestedMinimumWidth()I
    .locals 2

    .prologue
    .line 65
    invoke-super {p0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    move-result v0

    .line 66
    .local v0, "maxWidth":I
    iget-boolean v1, p0, Lcom/vk/music/view/MusicPromoImage;->initialized:Z

    if-eqz v1, :cond_0

    .line 67
    iget-object v1, p0, Lcom/vk/music/view/MusicPromoImage;->phoneDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getMinimumWidth()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 68
    iget-object v1, p0, Lcom/vk/music/view/MusicPromoImage;->screenDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getMinimumWidth()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 70
    :cond_0
    return v0
.end method

.method public initialize(III)V
    .locals 4
    .param p1, "phoneDrawable"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "screenDrawable"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3, "bottomMask"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x1

    .line 42
    invoke-direct {p0, p1}, Lcom/vk/music/view/MusicPromoImage;->drawable(I)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/MusicPromoImage;->phoneDrawable:Landroid/graphics/drawable/BitmapDrawable;

    .line 43
    invoke-direct {p0, p2}, Lcom/vk/music/view/MusicPromoImage;->drawable(I)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/MusicPromoImage;->screenDrawable:Landroid/graphics/drawable/BitmapDrawable;

    .line 44
    invoke-direct {p0, p3}, Lcom/vk/music/view/MusicPromoImage;->drawable(I)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/MusicPromoImage;->maskDrawable:Landroid/graphics/drawable/BitmapDrawable;

    .line 46
    iget-object v0, p0, Lcom/vk/music/view/MusicPromoImage;->phoneDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    move-result v0

    iget-object v1, p0, Lcom/vk/music/view/MusicPromoImage;->phoneDrawable:Landroid/graphics/drawable/BitmapDrawable;

    .line 47
    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 46
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/MusicPromoImage;->tmpBitmap:Landroid/graphics/Bitmap;

    .line 48
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/vk/music/view/MusicPromoImage;->tmpBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/vk/music/view/MusicPromoImage;->tmpCanvas:Landroid/graphics/Canvas;

    .line 50
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vk/music/view/MusicPromoImage;->maskPaint:Landroid/graphics/Paint;

    .line 51
    iget-object v0, p0, Lcom/vk/music/view/MusicPromoImage;->maskPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 52
    iget-object v0, p0, Lcom/vk/music/view/MusicPromoImage;->maskPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 54
    iput-boolean v3, p0, Lcom/vk/music/view/MusicPromoImage;->initialized:Z

    .line 55
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 92
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 93
    iget-boolean v2, p0, Lcom/vk/music/view/MusicPromoImage;->initialized:Z

    if-eqz v2, :cond_1

    .line 94
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2, v5}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 96
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpCanvas:Landroid/graphics/Canvas;

    iget-object v3, p0, Lcom/vk/music/view/MusicPromoImage;->phoneDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v2, v3, v7, v7, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 98
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->phoneDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    move-result v2

    iget-object v3, p0, Lcom/vk/music/view/MusicPromoImage;->screenDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v1, v2, 0x2

    .line 99
    .local v1, "dw":I
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->phoneDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    move-result v2

    iget-object v3, p0, Lcom/vk/music/view/MusicPromoImage;->screenDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v0, v2, 0x2

    .line 101
    .local v0, "dh":I
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    .line 102
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpCanvas:Landroid/graphics/Canvas;

    int-to-float v3, v1

    int-to-float v4, v0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 103
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpCanvas:Landroid/graphics/Canvas;

    iget-object v3, p0, Lcom/vk/music/view/MusicPromoImage;->screenDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v2, v3, v7, v7, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 104
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2}, Landroid/graphics/Canvas;->restore()V

    .line 106
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->phoneDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/vk/music/view/MusicPromoImage;->getHeight()I

    move-result v3

    if-le v2, v3, :cond_0

    .line 107
    iput v5, p0, Lcom/vk/music/view/MusicPromoImage;->tmpDx:I

    :goto_0
    iget v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpDx:I

    invoke-virtual {p0}, Lcom/vk/music/view/MusicPromoImage;->getWidth()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 108
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpCanvas:Landroid/graphics/Canvas;

    iget-object v3, p0, Lcom/vk/music/view/MusicPromoImage;->maskDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    iget v4, p0, Lcom/vk/music/view/MusicPromoImage;->tmpDx:I

    int-to-float v4, v4

    invoke-virtual {p0}, Lcom/vk/music/view/MusicPromoImage;->getHeight()I

    move-result v5

    iget-object v6, p0, Lcom/vk/music/view/MusicPromoImage;->maskDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    iget-object v6, p0, Lcom/vk/music/view/MusicPromoImage;->maskPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 107
    iget v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpDx:I

    iget-object v3, p0, Lcom/vk/music/view/MusicPromoImage;->maskDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpDx:I

    goto :goto_0

    .line 112
    :cond_0
    iget-object v2, p0, Lcom/vk/music/view/MusicPromoImage;->tmpBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v2, v7, v7, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 114
    .end local v0    # "dh":I
    .end local v1    # "dw":I
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v4, 0x0

    .line 85
    invoke-virtual {p0}, Lcom/vk/music/view/MusicPromoImage;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/vk/music/view/MusicPromoImage;->getPaddingRight()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/vk/music/view/MusicPromoImage;->getSuggestedMinimumWidth()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 86
    .local v1, "w":I
    invoke-virtual {p0}, Lcom/vk/music/view/MusicPromoImage;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/vk/music/view/MusicPromoImage;->getPaddingBottom()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/vk/music/view/MusicPromoImage;->getSuggestedMinimumHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 87
    .local v0, "h":I
    invoke-static {v1, p1, v4}, Lcom/vk/music/view/MusicPromoImage;->resolveSizeAndState(III)I

    move-result v2

    invoke-static {v0, p2, v4}, Lcom/vk/music/view/MusicPromoImage;->resolveSizeAndState(III)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/vk/music/view/MusicPromoImage;->setMeasuredDimension(II)V

    .line 88
    return-void
.end method
