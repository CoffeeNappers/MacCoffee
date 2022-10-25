.class public Lcom/vk/imageloader/view/VKLayerImageView;
.super Lcom/vk/imageloader/view/VKMultiImageView;
.source "VKLayerImageView.java"


# instance fields
.field private final insets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;)V

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKLayerImageView;->insets:Ljava/util/ArrayList;

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layersCount"    # I

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;)V

    .line 17
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vk/imageloader/view/VKLayerImageView;->insets:Ljava/util/ArrayList;

    .line 34
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_0

    .line 35
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKLayerImageView;->addLayer()V

    .line 34
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 37
    :cond_0
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
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKLayerImageView;->insets:Ljava/util/ArrayList;

    .line 25
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
    .line 28
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKLayerImageView;->insets:Ljava/util/ArrayList;

    .line 29
    return-void
.end method


# virtual methods
.method public addLayer()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 40
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKLayerImageView;->addImage()V

    .line 43
    iget-object v0, p0, Lcom/vk/imageloader/view/VKLayerImageView;->insets:Ljava/util/ArrayList;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v2, v2, v2, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 68
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vk/imageloader/view/VKLayerImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v3}, Lcom/facebook/drawee/view/MultiDraweeHolder;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 69
    iget-object v3, p0, Lcom/vk/imageloader/view/VKLayerImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v3, v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v0

    .line 70
    .local v0, "d":Lcom/facebook/drawee/view/DraweeHolder;, "Lcom/facebook/drawee/view/DraweeHolder<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 71
    iget-object v3, p0, Lcom/vk/imageloader/view/VKLayerImageView;->insets:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Rect;

    .line 72
    .local v2, "in":Landroid/graphics/Rect;
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget v4, v2, Landroid/graphics/Rect;->left:I

    add-int/lit8 v4, v4, 0x0

    iget v5, v2, Landroid/graphics/Rect;->top:I

    add-int/lit8 v5, v5, 0x0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v6

    iget v7, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v6, v7

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v7

    iget v8, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 74
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 68
    .end local v2    # "in":Landroid/graphics/Rect;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 77
    .end local v0    # "d":Lcom/facebook/drawee/view/DraweeHolder;, "Lcom/facebook/drawee/view/DraweeHolder<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    :cond_1
    return-void
.end method

.method public setLayerCorners(IIIII)V
    .locals 5
    .param p1, "index"    # I
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/imageloader/view/VKLayerImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    int-to-float v1, p2

    int-to-float v2, p3

    int-to-float v3, p4

    int-to-float v4, p5

    invoke-static {v1, v2, v3, v4}, Lcom/facebook/drawee/generic/RoundingParams;->fromCornersRadii(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setRoundingParams(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 53
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKLayerImageView;->invalidate()V

    .line 54
    return-void
.end method

.method public setLayerInset(IIIII)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vk/imageloader/view/VKLayerImageView;->insets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    invoke-virtual {v0, p2, p3, p4, p5}, Landroid/graphics/Rect;->set(IIII)V

    .line 48
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKLayerImageView;->invalidate()V

    .line 49
    return-void
.end method

.method public setLayerPlaceholderColor(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "placeholderColor"    # I

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/imageloader/view/VKLayerImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, p2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V

    .line 58
    return-void
.end method

.method public setLayerPlaceholders(I)V
    .locals 2
    .param p1, "placeholderColor"    # I

    .prologue
    .line 61
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vk/imageloader/view/VKLayerImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 62
    invoke-virtual {p0, v0, p1}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerPlaceholderColor(II)V

    .line 61
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 64
    :cond_0
    return-void
.end method
