.class Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;
.super Ljava/lang/Object;
.source "DocumentAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/gifs/GifViewer$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

.field final synthetic val$locationInWindow:[I

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;Landroid/view/View;[I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    .prologue
    .line 570
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iput-object p2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$view:Landroid/view/View;

    iput-object p3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$locationInWindow:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getClipTopBottom()[I
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 596
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$view:Landroid/view/View;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->getViewOffset(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v0

    .line 597
    .local v0, "offset":Landroid/graphics/Point;
    const/4 v1, 0x2

    new-array v3, v1, [I

    iget v1, v0, Landroid/graphics/Point;->y:I

    if-gez v1, :cond_1

    iget v1, v0, Landroid/graphics/Point;->y:I

    neg-int v1, v1

    :goto_0
    aput v1, v3, v2

    const/4 v1, 0x1

    iget v4, v0, Landroid/graphics/Point;->y:I

    iget-object v5, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$view:Landroid/view/View;

    .line 599
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v5, v5, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v5

    if-le v4, v5, :cond_0

    iget v2, v0, Landroid/graphics/Point;->y:I

    iget-object v4, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$view:Landroid/view/View;

    .line 600
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    add-int/2addr v2, v4

    iget-object v4, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v4, v4, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->listView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v4

    sub-int/2addr v2, v4

    :cond_0
    aput v2, v3, v1

    return-object v3

    :cond_1
    move v1, v2

    .line 597
    goto :goto_0
.end method

.method public getPreview()Landroid/graphics/Bitmap;
    .locals 2

    .prologue
    .line 606
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 607
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->getRenderingBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 613
    :goto_0
    return-object v1

    .line 609
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 610
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v1, :cond_1

    .line 611
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 613
    .restart local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getViewLocation()Landroid/graphics/Rect;
    .locals 8

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 580
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$view:Landroid/view/View;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$locationInWindow:[I

    invoke-virtual {v2, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 581
    new-instance v1, Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$locationInWindow:[I

    aget v2, v2, v7

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$locationInWindow:[I

    aget v3, v3, v6

    iget-object v4, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$locationInWindow:[I

    aget v4, v4, v7

    iget-object v5, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$view:Landroid/view/View;

    .line 584
    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$locationInWindow:[I

    aget v5, v5, v6

    iget-object v6, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$view:Landroid/view/View;

    .line 585
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    add-int/2addr v5, v6

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 587
    .local v1, "rect":Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget v2, v2, Lcom/vkontakte/android/attachments/DocumentAttachment;->height:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->width:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    const v3, 0x3faa9fbe    # 1.333f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 588
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$view:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->width:I

    mul-int/2addr v2, v3

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->height:I

    div-int v0, v2, v3

    .line 589
    .local v0, "displayedWidth":I
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$view:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v2, v0

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v2, v7}, Landroid/graphics/Rect;->inset(II)V

    .line 591
    .end local v0    # "displayedWidth":I
    :cond_0
    return-object v1
.end method

.method public hasPreviewLocationData()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 574
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$view:Landroid/view/View;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$locationInWindow:[I

    invoke-virtual {v2, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 575
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-boolean v2, v2, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->attached:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$locationInWindow:[I

    aget v2, v2, v1

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->val$locationInWindow:[I

    aget v2, v2, v0

    if-eqz v2, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_1

    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public onFinish(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 620
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-eqz v0, :cond_1

    .line 621
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$1002(Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vkontakte/android/gifs/GifViewer;)Lcom/vkontakte/android/gifs/GifViewer;

    .line 622
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 623
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->seek(I)V

    .line 625
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->play(Z)V

    .line 627
    :cond_1
    return-void
.end method
