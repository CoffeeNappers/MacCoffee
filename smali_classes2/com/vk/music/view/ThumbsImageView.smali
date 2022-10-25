.class public final Lcom/vk/music/view/ThumbsImageView;
.super Lcom/vk/imageloader/view/VKMultiImageView;
.source "ThumbsImageView.java"


# static fields
.field private static final MAX_IMAGES:I = 0x4


# instance fields
.field private cornerRadiusBottomLeft:I

.field private cornerRadiusBottomRight:I

.field private cornerRadiusTopLeft:I

.field private cornerRadiusTopRight:I

.field private emptyDrawable:Landroid/graphics/drawable/Drawable;

.field private imageCanvas:Landroid/graphics/Canvas;

.field private imagePaint:Landroid/graphics/Paint;

.field private imagePath:Landroid/graphics/Path;

.field private imageRect:Landroid/graphics/RectF;

.field private imagesToLoad:[Ljava/lang/String;

.field private imagesToLoadCount:I

.field private loadingDrawable:Landroid/graphics/drawable/Drawable;

.field private placeholderDrawable:Landroid/graphics/drawable/Drawable;

.field private sizes:[I

.field private thumbs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Thumb;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x4

    .line 95
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;)V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    .line 89
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoad:[Ljava/lang/String;

    .line 90
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    .line 92
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->sizes:[I

    .line 96
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x4

    .line 99
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    .line 89
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoad:[Ljava/lang/String;

    .line 90
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    .line 92
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->sizes:[I

    .line 100
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, 0x4

    .line 103
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    .line 89
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoad:[Ljava/lang/String;

    .line 90
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    .line 92
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->sizes:[I

    .line 104
    return-void
.end method

.method private bindThumbs()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x4

    .line 180
    iget-object v1, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoad:[Ljava/lang/String;

    invoke-static {v1, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 182
    iget-object v1, p0, Lcom/vk/music/view/ThumbsImageView;->thumbs:Ljava/util/List;

    invoke-static {v1, v2}, Lcom/vk/core/util/CollectionUtils;->countIfNotGreater(Ljava/util/Collection;I)I

    move-result v1

    iput v1, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    .line 183
    iget v1, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    if-lez v1, :cond_0

    iget v1, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    if-gt v1, v2, :cond_0

    .line 184
    iget-object v1, p0, Lcom/vk/music/view/ThumbsImageView;->sizes:[I

    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getWidth()I

    move-result v2

    iget v3, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    invoke-static {v1, v2, v3}, Lcom/vk/music/view/ThumbsImageView;->calcSizes([III)V

    .line 185
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    if-ge v0, v1, :cond_1

    .line 186
    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoad:[Ljava/lang/String;

    iget-object v1, p0, Lcom/vk/music/view/ThumbsImageView;->thumbs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/music/dto/Thumb;

    iget-object v3, p0, Lcom/vk/music/view/ThumbsImageView;->sizes:[I

    aget v3, v3, v0

    invoke-virtual {v1, v3}, Lcom/vk/music/dto/Thumb;->getForSize(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v0

    .line 185
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 189
    .end local v0    # "i":I
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->clear()V

    .line 192
    :cond_1
    invoke-direct {p0}, Lcom/vk/music/view/ThumbsImageView;->updateDrawableBounds()V

    .line 194
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    iget v1, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    if-ge v0, v1, :cond_2

    .line 195
    iget-object v1, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoad:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/view/ThumbsImageView;->load(ILjava/lang/String;)V

    .line 194
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 198
    :cond_2
    iput-object v4, p0, Lcom/vk/music/view/ThumbsImageView;->thumbs:Ljava/util/List;

    .line 199
    return-void
.end method

.method private buildDrawImageParams()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v6, -0x1

    const/4 v5, 0x1

    const/high16 v4, 0x42b40000    # 90.0f

    .line 263
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusTopRight:I

    iget v1, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusBottomRight:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusBottomRight:I

    iget v1, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusBottomLeft:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusBottomLeft:I

    iget v1, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusTopLeft:I

    if-eq v0, v1, :cond_1

    .line 267
    :cond_0
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    .line 268
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget v3, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusTopRight:I

    int-to-float v3, v3

    invoke-static {v1, v2, v3, v6, v5}, Lcom/vk/music/view/ThumbsImageView;->cornerRect(FFFII)Landroid/graphics/RectF;

    move-result-object v1

    const/high16 v2, 0x43870000    # 270.0f

    invoke-virtual {v0, v1, v2, v4, v5}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 269
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget v3, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusBottomRight:I

    int-to-float v3, v3

    invoke-static {v1, v2, v3, v6, v6}, Lcom/vk/music/view/ThumbsImageView;->cornerRect(FFFII)Landroid/graphics/RectF;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v4, v7}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 270
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget v3, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusBottomLeft:I

    int-to-float v3, v3

    invoke-static {v1, v2, v3, v5, v6}, Lcom/vk/music/view/ThumbsImageView;->cornerRect(FFFII)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1, v4, v4, v7}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 271
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget v3, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusTopLeft:I

    int-to-float v3, v3

    invoke-static {v1, v2, v3, v5, v5}, Lcom/vk/music/view/ThumbsImageView;->cornerRect(FFFII)Landroid/graphics/RectF;

    move-result-object v1

    const/high16 v2, 0x43340000    # 180.0f

    invoke-virtual {v0, v1, v2, v4, v7}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 272
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 276
    :goto_0
    return-void

    .line 274
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    goto :goto_0
.end method

.method private static calcSizes([III)V
    .locals 4
    .param p0, "sizes"    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "viewSize"    # I
    .param p2, "imagesCount"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 39
    invoke-static {p0, v2}, Ljava/util/Arrays;->fill([II)V

    .line 40
    packed-switch p2, :pswitch_data_0

    .line 65
    :cond_0
    :goto_0
    return-void

    .line 42
    :pswitch_0
    aput p1, p0, v2

    goto :goto_0

    .line 46
    :pswitch_1
    aput p1, p0, v2

    .line 47
    aput p1, p0, v3

    goto :goto_0

    .line 51
    :pswitch_2
    div-int/lit8 v1, p1, 0x2

    .line 52
    .local v1, "viewSize2":I
    aput p1, p0, v2

    .line 53
    aput v1, p0, v3

    .line 54
    const/4 v2, 0x2

    aput v1, p0, v2

    goto :goto_0

    .line 58
    .end local v1    # "viewSize2":I
    :pswitch_3
    div-int/lit8 v1, p1, 0x2

    .line 59
    .restart local v1    # "viewSize2":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_0

    .line 60
    aput v1, p0, v0

    .line 59
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 40
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static cornerRect(FFFII)Landroid/graphics/RectF;
    .locals 5
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "r"    # F
    .param p3, "signX"    # I
    .param p4, "signY"    # I

    .prologue
    .line 279
    int-to-float v0, p3

    mul-float/2addr v0, p2

    add-float/2addr p0, v0

    .line 280
    int-to-float v0, p4

    mul-float/2addr v0, p2

    add-float/2addr p1, v0

    .line 281
    new-instance v0, Landroid/graphics/RectF;

    sub-float v1, p0, p2

    sub-float v2, p1, p2

    add-float v3, p0, p2

    add-float v4, p1, p2

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method private drawImage(Landroid/graphics/Canvas;)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    if-nez v0, :cond_0

    .line 256
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusTopLeft:I

    int-to-float v1, v1

    iget v2, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusTopLeft:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/vk/music/view/ThumbsImageView;->imagePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 260
    :goto_0
    return-void

    .line 258
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->imagePath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/vk/music/view/ThumbsImageView;->imagePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_0
.end method

.method private updateDrawableBounds()V
    .locals 13

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 202
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getPaddingLeft()I

    move-result v4

    .line 203
    .local v4, "l":I
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getPaddingTop()I

    move-result v5

    .line 204
    .local v5, "t":I
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getWidth()I

    move-result v8

    sub-int/2addr v8, v4

    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getPaddingRight()I

    move-result v9

    sub-int v6, v8, v9

    .line 205
    .local v6, "w":I
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getHeight()I

    move-result v8

    sub-int/2addr v8, v5

    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getPaddingBottom()I

    move-result v9

    sub-int v2, v8, v9

    .line 206
    .local v2, "h":I
    div-int/lit8 v7, v6, 0x2

    .line 207
    .local v7, "w2":I
    div-int/lit8 v3, v2, 0x2

    .line 209
    .local v3, "h2":I
    const/4 v1, 0x0

    .line 210
    .local v1, "div":I
    const/4 v0, 0x0

    .line 212
    .local v0, "d2":I
    iget v8, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    packed-switch v8, :pswitch_data_0

    .line 231
    :goto_0
    return-void

    .line 214
    :pswitch_0
    iget-object v8, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v10}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v6

    add-int v10, v5, v2

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0

    .line 217
    :pswitch_1
    iget-object v8, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v10}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v2

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 218
    iget-object v8, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v11}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v6

    add-int v11, v5, v2

    invoke-virtual {v8, v9, v5, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0

    .line 221
    :pswitch_2
    iget-object v8, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v10}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v2

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 222
    iget-object v8, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v11}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v6

    add-int v11, v5, v3

    add-int/lit8 v11, v11, 0x0

    invoke-virtual {v8, v9, v5, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 223
    iget-object v8, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v12}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v3

    add-int/lit8 v10, v10, 0x0

    add-int v11, v4, v6

    add-int v12, v5, v2

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0

    .line 226
    :pswitch_3
    iget-object v8, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v10}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v3

    add-int/lit8 v10, v10, 0x0

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 227
    iget-object v8, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v11}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v5, v3

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v7

    add-int/lit8 v10, v10, 0x0

    add-int v11, v5, v2

    invoke-virtual {v8, v4, v9, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 228
    iget-object v8, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v12}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v6

    add-int v11, v5, v3

    add-int/lit8 v11, v11, 0x0

    invoke-virtual {v8, v9, v5, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 229
    iget-object v8, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v3

    add-int/lit8 v10, v10, 0x0

    add-int v11, v4, v6

    add-int v12, v5, v2

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto/16 :goto_0

    .line 212
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 235
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;->draw(Landroid/graphics/Canvas;)V

    .line 236
    return-void
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    .line 108
    invoke-super {p0, p1, p2}, Lcom/vk/imageloader/view/VKMultiImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 110
    if-eqz p2, :cond_1

    .line 111
    sget-object v2, Lcom/vkontakte/android/R$styleable;->GenericDraweeHierarchy:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 112
    .local v0, "array":Landroid/content/res/TypedArray;
    const/16 v2, 0x10

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/vk/music/view/ThumbsImageView;->setCornerRadius(I)V

    .line 114
    const/16 v2, 0xc

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->loadingDrawable:Landroid/graphics/drawable/Drawable;

    .line 115
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->emptyDrawable:Landroid/graphics/drawable/Drawable;

    .line 116
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 121
    .end local v0    # "array":Landroid/content/res/TypedArray;
    :goto_0
    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->emptyDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_0

    .line 122
    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->emptyDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v2}, Lcom/vk/music/view/ThumbsImageView;->setPlaceholderDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 125
    :cond_0
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    .line 126
    invoke-direct {p0}, Lcom/vk/music/view/ThumbsImageView;->buildDrawImageParams()V

    .line 127
    new-instance v2, Landroid/graphics/Paint;

    const/4 v3, 0x7

    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->imagePaint:Landroid/graphics/Paint;

    .line 129
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    const/4 v2, 0x4

    if-ge v1, v2, :cond_2

    .line 130
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->addImage()V

    .line 129
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 118
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p0, v3}, Lcom/vk/music/view/ThumbsImageView;->setCornerRadius(I)V

    goto :goto_0

    .line 132
    .restart local v1    # "i":I
    :cond_2
    sget-object v2, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {p0, v2}, Lcom/vk/music/view/ThumbsImageView;->setScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 133
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 240
    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->imageCanvas:Landroid/graphics/Canvas;

    const/4 v3, 0x0

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 241
    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_0

    .line 242
    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v3, p0, Lcom/vk/music/view/ThumbsImageView;->imageCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 244
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/vk/music/view/ThumbsImageView;->imagesToLoadCount:I

    if-ge v1, v2, :cond_2

    .line 245
    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v2, v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 246
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_1

    .line 247
    iget-object v2, p0, Lcom/vk/music/view/ThumbsImageView;->imageCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 244
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 251
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_2
    invoke-direct {p0, p1}, Lcom/vk/music/view/ThumbsImageView;->drawImage(Landroid/graphics/Canvas;)V

    .line 252
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 12
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 155
    iget-object v7, p0, Lcom/vk/music/view/ThumbsImageView;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_0

    .line 156
    iget-object v7, p0, Lcom/vk/music/view/ThumbsImageView;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 159
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getPaddingLeft()I

    move-result v4

    .line 160
    .local v4, "paddingLeft":I
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getPaddingRight()I

    move-result v5

    .line 161
    .local v5, "paddingRight":I
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getPaddingTop()I

    move-result v6

    .line 162
    .local v6, "paddingTop":I
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getPaddingBottom()I

    move-result v3

    .line 164
    .local v3, "paddingBottom":I
    sub-int v2, p1, v5

    .line 165
    .local v2, "imageWidth":I
    sub-int v1, p2, v3

    .line 166
    .local v1, "imageHeight":I
    iget-object v7, p0, Lcom/vk/music/view/ThumbsImageView;->imageRect:Landroid/graphics/RectF;

    int-to-float v8, v4

    int-to-float v9, v6

    int-to-float v10, v2

    int-to-float v11, v1

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/RectF;->set(FFFF)V

    .line 167
    invoke-direct {p0}, Lcom/vk/music/view/ThumbsImageView;->buildDrawImageParams()V

    .line 168
    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v1, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 169
    .local v0, "imageBitmap":Landroid/graphics/Bitmap;
    new-instance v7, Landroid/graphics/Canvas;

    invoke-direct {v7, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v7, p0, Lcom/vk/music/view/ThumbsImageView;->imageCanvas:Landroid/graphics/Canvas;

    .line 171
    iget-object v7, p0, Lcom/vk/music/view/ThumbsImageView;->imagePaint:Landroid/graphics/Paint;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 172
    iget-object v7, p0, Lcom/vk/music/view/ThumbsImageView;->imagePaint:Landroid/graphics/Paint;

    new-instance v8, Landroid/graphics/BitmapShader;

    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v10, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v8, v0, v9, v10}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 174
    iget-object v7, p0, Lcom/vk/music/view/ThumbsImageView;->thumbs:Ljava/util/List;

    if-eqz v7, :cond_1

    .line 175
    invoke-direct {p0}, Lcom/vk/music/view/ThumbsImageView;->bindThumbs()V

    .line 177
    :cond_1
    return-void
.end method

.method public setCornerRadius(I)V
    .locals 0
    .param p1, "cornerRadius"    # I

    .prologue
    .line 136
    invoke-virtual {p0, p1, p1, p1, p1}, Lcom/vk/music/view/ThumbsImageView;->setCornerRadius(IIII)V

    .line 137
    return-void
.end method

.method public setCornerRadius(IIII)V
    .locals 0
    .param p1, "cornerRadiusTopLeft"    # I
    .param p2, "cornerRadiusTopRight"    # I
    .param p3, "cornerRadiusBottomLeft"    # I
    .param p4, "cornerRadiusBottomRight"    # I

    .prologue
    .line 141
    iput p1, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusTopLeft:I

    .line 142
    iput p2, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusTopRight:I

    .line 143
    iput p3, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusBottomLeft:I

    .line 144
    iput p4, p0, Lcom/vk/music/view/ThumbsImageView;->cornerRadiusBottomRight:I

    .line 146
    invoke-direct {p0}, Lcom/vk/music/view/ThumbsImageView;->buildDrawImageParams()V

    .line 147
    return-void
.end method

.method public setPlaceholderDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v3, 0x0

    .line 298
    iput-object p1, p0, Lcom/vk/music/view/ThumbsImageView;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    .line 299
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getHeight()I

    move-result v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 300
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->invalidate()V

    .line 301
    return-void
.end method

.method public setPlaceholderImage(I)V
    .locals 1
    .param p1, "placeholderImage"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->emptyDrawable:Landroid/graphics/drawable/Drawable;

    .line 151
    return-void
.end method

.method public setThumb(Lcom/vk/music/dto/Thumb;)V
    .locals 1
    .param p1, "thumb"    # Lcom/vk/music/dto/Thumb;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 304
    if-eqz p1, :cond_0

    .line 305
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/ThumbsImageView;->setThumbs(Ljava/util/List;)V

    .line 309
    :goto_0
    return-void

    .line 307
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/ThumbsImageView;->setThumbs(Ljava/util/List;)V

    goto :goto_0
.end method

.method public setThumbs(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Thumb;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 285
    .local p1, "thumbs":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/dto/Thumb;>;"
    iput-object p1, p0, Lcom/vk/music/view/ThumbsImageView;->thumbs:Ljava/util/List;

    .line 286
    invoke-static {p1}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 287
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->emptyDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/vk/music/view/ThumbsImageView;->setPlaceholderDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 288
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->clear()V

    .line 295
    :cond_0
    :goto_0
    return-void

    .line 290
    :cond_1
    iget-object v0, p0, Lcom/vk/music/view/ThumbsImageView;->loadingDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/vk/music/view/ThumbsImageView;->setPlaceholderDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 291
    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getWidth()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/music/view/ThumbsImageView;->getHeight()I

    move-result v0

    if-lez v0, :cond_0

    .line 292
    invoke-direct {p0}, Lcom/vk/music/view/ThumbsImageView;->bindThumbs()V

    goto :goto_0
.end method
