.class public Lcom/vkontakte/android/ui/AudioSquareImageView;
.super Lcom/vk/imageloader/view/VKImageView;
.source "AudioSquareImageView.java"


# instance fields
.field private opB:I

.field private opL:I

.field private opR:I

.field private opT:I

.field private rect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 16
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->rect:Landroid/graphics/Rect;

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->rect:Landroid/graphics/Rect;

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->rect:Landroid/graphics/Rect;

    .line 28
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 52
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 53
    iget-object v1, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getPaddingLeft()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 54
    iget-object v1, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getPaddingTop()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 55
    iget-object v1, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, v1, Landroid/graphics/Rect;->right:I

    .line 56
    iget-object v1, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 57
    iget-object v1, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->rect:Landroid/graphics/Rect;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 59
    :try_start_0
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKImageView;->onDraw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 64
    return-void

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onMeasure(II)V
    .locals 8
    .param p1, "wms"    # I
    .param p2, "hms"    # I

    .prologue
    .line 31
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/AlbumScrollView;

    .line 32
    .local v2, "sv":Lcom/vkontakte/android/ui/AlbumScrollView;
    iget v4, v2, Lcom/vkontakte/android/ui/AlbumScrollView;->heightMSpec:I

    invoke-static {v4}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Lcom/vkontakte/android/ui/AlbumScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    sub-int v1, v4, v5

    .line 33
    .local v1, "sh":I
    iget v4, v2, Lcom/vkontakte/android/ui/AlbumScrollView;->widthMSpec:I

    invoke-static {v4}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 34
    .local v3, "sw":I
    iget v4, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->opL:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    .line 35
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getPaddingLeft()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->opL:I

    .line 36
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getPaddingRight()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->opR:I

    .line 37
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getPaddingTop()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->opT:I

    .line 38
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AudioSquareImageView;->getPaddingBottom()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->opB:I

    .line 41
    :cond_0
    if-ge v1, v3, :cond_1

    .line 42
    invoke-virtual {p0, v1, v1}, Lcom/vkontakte/android/ui/AudioSquareImageView;->setMeasuredDimension(II)V

    .line 43
    const/4 v0, 0x0

    .line 48
    .local v0, "padding":I
    :goto_0
    iget v4, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->opL:I

    iget v5, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->opT:I

    add-int/2addr v5, v0

    iget v6, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->opR:I

    iget v7, p0, Lcom/vkontakte/android/ui/AudioSquareImageView;->opB:I

    add-int/2addr v7, v0

    invoke-virtual {p0, v4, v5, v6, v7}, Lcom/vkontakte/android/ui/AudioSquareImageView;->setPadding(IIII)V

    .line 49
    return-void

    .line 45
    .end local v0    # "padding":I
    :cond_1
    invoke-virtual {p0, v3, v1}, Lcom/vkontakte/android/ui/AudioSquareImageView;->setMeasuredDimension(II)V

    .line 46
    sub-int v4, v1, v3

    div-int/lit8 v0, v4, 0x2

    .restart local v0    # "padding":I
    goto :goto_0
.end method
