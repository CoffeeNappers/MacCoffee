.class public Lcom/vkontakte/android/stickers/StickersBackgroundView;
.super Lcom/vk/imageloader/view/VKMultiImageView;
.source "StickersBackgroundView.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$PageTransformer;
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;
.implements Landroid/graphics/drawable/Drawable$Callback;


# instance fields
.field private final alphas:[I

.field private currentPosition:I

.field private uris:[Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/stickers/StickersViewPage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p2, "pages":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/stickers/StickersViewPage;>;"
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;)V

    .line 16
    const/4 v0, 0x3

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->alphas:[I

    .line 22
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->addImage()V

    .line 23
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->addImage()V

    .line 24
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->addImage()V

    .line 25
    sget-object v0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->setScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 26
    const/4 v0, 0x0

    invoke-virtual {p0, p2, v0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->setPages(Ljava/util/List;I)V

    .line 27
    return-void
.end method

.method private static getPageAlpha(F)I
    .locals 2
    .param p0, "position"    # F

    .prologue
    const/high16 v1, 0x437f0000    # 255.0f

    .line 95
    const/high16 v0, -0x40800000    # -1.0f

    cmpg-float v0, p0, v0

    if-lez v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p0, v0

    if-ltz v0, :cond_1

    .line 96
    :cond_0
    const/4 v0, 0x0

    .line 100
    :goto_0
    return v0

    .line 97
    :cond_1
    const/4 v0, 0x0

    cmpl-float v0, p0, v0

    if-nez v0, :cond_2

    .line 98
    const/16 v0, 0xff

    goto :goto_0

    .line 100
    :cond_2
    mul-float v0, p0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    sub-float v0, v1, v0

    float-to-int v0, v0

    goto :goto_0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    .line 44
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 45
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_0

    .line 46
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 47
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->alphas:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 48
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 50
    :cond_0
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 92
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 69
    return-void
.end method

.method public onPageSelected(I)V
    .locals 5
    .param p1, "position"    # I

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 73
    iput p1, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->currentPosition:I

    .line 74
    if-lez p1, :cond_0

    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->uris:[Landroid/net/Uri;

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    invoke-virtual {p0, v2, v0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->load(ILandroid/net/Uri;)V

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->uris:[Landroid/net/Uri;

    array-length v0, v0

    if-ge p1, v0, :cond_1

    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->uris:[Landroid/net/Uri;

    aget-object v0, v0, p1

    invoke-virtual {p0, v3, v0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->load(ILandroid/net/Uri;)V

    .line 80
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->uris:[Landroid/net/Uri;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_2

    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->uris:[Landroid/net/Uri;

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {p0, v4, v0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->load(ILandroid/net/Uri;)V

    .line 83
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->alphas:[I

    aput v2, v0, v2

    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->alphas:[I

    const/16 v1, 0xff

    aput v1, v0, v3

    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->alphas:[I

    aput v2, v0, v4

    .line 86
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->invalidate()V

    .line 87
    return-void
.end method

.method public setPages(Ljava/util/List;I)V
    .locals 4
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/stickers/StickersViewPage;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "pages":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/stickers/StickersViewPage;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Landroid/net/Uri;

    iput-object v2, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->uris:[Landroid/net/Uri;

    .line 31
    iput p2, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->currentPosition:I

    .line 33
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 34
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/stickers/StickersViewPage;

    .line 35
    .local v1, "page":Lcom/vkontakte/android/stickers/StickersViewPage;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/StickersViewPage;->getServerBackgroundURL()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 36
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->uris:[Landroid/net/Uri;

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/StickersViewPage;->getServerBackgroundURL()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    aput-object v3, v2, v0

    .line 33
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 39
    .end local v1    # "page":Lcom/vkontakte/android/stickers/StickersViewPage;
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->invalidate()V

    .line 40
    return-void
.end method

.method public transformPage(Landroid/view/View;F)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # F

    .prologue
    .line 54
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 56
    .local v0, "index":I
    iget v1, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->currentPosition:I

    if-ge v0, v1, :cond_0

    .line 57
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->alphas:[I

    const/4 v2, 0x0

    invoke-static {p2}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->getPageAlpha(F)I

    move-result v3

    aput v3, v1, v2

    .line 64
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->invalidate()V

    .line 65
    return-void

    .line 58
    :cond_0
    iget v1, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->currentPosition:I

    if-ne v0, v1, :cond_1

    .line 59
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->alphas:[I

    const/4 v2, 0x1

    invoke-static {p2}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->getPageAlpha(F)I

    move-result v3

    aput v3, v1, v2

    goto :goto_0

    .line 61
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersBackgroundView;->alphas:[I

    const/4 v2, 0x2

    invoke-static {p2}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->getPageAlpha(F)I

    move-result v3

    aput v3, v1, v2

    goto :goto_0
.end method
