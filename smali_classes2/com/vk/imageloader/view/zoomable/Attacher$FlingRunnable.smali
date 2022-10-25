.class Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;
.super Ljava/lang/Object;
.source "Attacher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/imageloader/view/zoomable/Attacher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FlingRunnable"
.end annotation


# instance fields
.field private mCurrentX:I

.field private mCurrentY:I

.field private final mScroller:Landroid/support/v4/widget/ScrollerCompat;

.field final synthetic this$0:Lcom/vk/imageloader/view/zoomable/Attacher;


# direct methods
.method public constructor <init>(Lcom/vk/imageloader/view/zoomable/Attacher;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 481
    iput-object p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 482
    invoke-static {p2}, Landroid/support/v4/widget/ScrollerCompat;->create(Landroid/content/Context;)Landroid/support/v4/widget/ScrollerCompat;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    .line 483
    return-void
.end method


# virtual methods
.method public cancelFling()V
    .locals 1

    .prologue
    .line 486
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    .line 487
    return-void
.end method

.method public fling(IIII)V
    .locals 12
    .param p1, "viewWidth"    # I
    .param p2, "viewHeight"    # I
    .param p3, "velocityX"    # I
    .param p4, "velocityY"    # I

    .prologue
    .line 490
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v11

    .line 491
    .local v11, "rect":Landroid/graphics/RectF;
    if-nez v11, :cond_1

    .line 519
    :cond_0
    :goto_0
    return-void

    .line 495
    :cond_1
    iget v0, v11, Landroid/graphics/RectF;->left:F

    neg-float v0, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 498
    .local v1, "startX":I
    int-to-float v0, p1

    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_3

    .line 499
    const/4 v5, 0x0

    .line 500
    .local v5, "minX":I
    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v0

    int-to-float v3, p1

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 505
    .local v6, "maxX":I
    :goto_1
    iget v0, v11, Landroid/graphics/RectF;->top:F

    neg-float v0, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 506
    .local v2, "startY":I
    int-to-float v0, p2

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_4

    .line 507
    const/4 v7, 0x0

    .line 508
    .local v7, "minY":I
    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v0

    int-to-float v3, p2

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 513
    .local v8, "maxY":I
    :goto_2
    iput v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mCurrentX:I

    .line 514
    iput v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mCurrentY:I

    .line 516
    if-ne v1, v6, :cond_2

    if-eq v2, v8, :cond_0

    .line 517
    :cond_2
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    const/4 v9, 0x0

    const/4 v10, 0x0

    move v3, p3

    move/from16 v4, p4

    invoke-virtual/range {v0 .. v10}, Landroid/support/v4/widget/ScrollerCompat;->fling(IIIIIIIIII)V

    goto :goto_0

    .line 502
    .end local v2    # "startY":I
    .end local v5    # "minX":I
    .end local v6    # "maxX":I
    .end local v7    # "minY":I
    .end local v8    # "maxY":I
    :cond_3
    move v6, v1

    .restart local v6    # "maxX":I
    move v5, v1

    .restart local v5    # "minX":I
    goto :goto_1

    .line 510
    .restart local v2    # "startY":I
    :cond_4
    move v8, v2

    .restart local v8    # "maxY":I
    move v7, v2

    .restart local v7    # "minY":I
    goto :goto_2
.end method

.method public run()V
    .locals 6

    .prologue
    .line 522
    iget-object v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/ScrollerCompat;->isFinished()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 537
    :cond_0
    :goto_0
    return-void

    .line 526
    :cond_1
    iget-object v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v3}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v0

    .line 528
    .local v0, "draweeView":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<Lcom/facebook/drawee/generic/GenericDraweeHierarchy;>;"
    if-eqz v0, :cond_0

    iget-object v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/ScrollerCompat;->computeScrollOffset()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 529
    iget-object v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/ScrollerCompat;->getCurrX()I

    move-result v1

    .line 530
    .local v1, "newX":I
    iget-object v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/ScrollerCompat;->getCurrY()I

    move-result v2

    .line 531
    .local v2, "newY":I
    iget-object v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-static {v3}, Lcom/vk/imageloader/view/zoomable/Attacher;->access$400(Lcom/vk/imageloader/view/zoomable/Attacher;)Landroid/graphics/Matrix;

    move-result-object v3

    iget v4, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mCurrentX:I

    sub-int/2addr v4, v1

    int-to-float v4, v4

    iget v5, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mCurrentY:I

    sub-int/2addr v5, v2

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 532
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKDraweeView;->invalidate()V

    .line 533
    iput v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mCurrentX:I

    .line 534
    iput v2, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->mCurrentY:I

    .line 535
    iget-object v3, p0, Lcom/vk/imageloader/view/zoomable/Attacher$FlingRunnable;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-static {v3, v0, p0}, Lcom/vk/imageloader/view/zoomable/Attacher;->access$100(Lcom/vk/imageloader/view/zoomable/Attacher;Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_0
.end method
