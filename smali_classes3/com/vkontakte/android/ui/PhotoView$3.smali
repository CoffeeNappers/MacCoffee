.class Lcom/vkontakte/android/ui/PhotoView$3;
.super Landroid/widget/FrameLayout;
.source "PhotoView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/PhotoView;->getOverlayView()Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/PhotoView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/PhotoView;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/PhotoView;
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 345
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 371
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/PhotoView;->access$2400(Lcom/vkontakte/android/ui/PhotoView;)Landroid/graphics/Rect;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 372
    const/4 v1, 0x2

    new-array v0, v1, [I

    fill-array-data v0, :array_0

    .line 373
    .local v0, "f":[I
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/PhotoView$3;->getLocationOnScreen([I)V

    .line 374
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 375
    const/4 v1, 0x0

    const/4 v2, 0x1

    aget v2, v0, v2

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 376
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingTop()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/PhotoView;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 377
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/PhotoView;->access$2400(Lcom/vkontakte/android/ui/PhotoView;)Landroid/graphics/Rect;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/PhotoView;->access$2500(Lcom/vkontakte/android/ui/PhotoView;)Landroid/graphics/Paint;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 378
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 380
    .end local v0    # "f":[I
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 381
    return-void

    .line 372
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "drawingTime"    # J

    .prologue
    .line 348
    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$1400(Lcom/vkontakte/android/ui/PhotoView;)Landroid/widget/FrameLayout;

    move-result-object v3

    if-ne p2, v3, :cond_0

    .line 349
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v2

    .line 367
    :goto_0
    return v2

    .line 351
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$1500(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/CircularProgressBar;

    move-result-object v3

    if-eq p2, v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$1600(Lcom/vkontakte/android/ui/PhotoView;)Landroid/view/View;

    move-result-object v3

    if-ne p2, v3, :cond_3

    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$1700(Lcom/vkontakte/android/ui/PhotoView;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$1800(Lcom/vkontakte/android/ui/PhotoView;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 352
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 354
    :cond_3
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 355
    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$1700(Lcom/vkontakte/android/ui/PhotoView;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$1800(Lcom/vkontakte/android/ui/PhotoView;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 356
    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$700(Lcom/vkontakte/android/ui/PhotoView;)F

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/PhotoView;->access$1100(Lcom/vkontakte/android/ui/PhotoView;)F

    move-result v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 357
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$1900(Lcom/vkontakte/android/ui/PhotoView;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$2000(Lcom/vkontakte/android/ui/PhotoView;)J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-gez v3, :cond_4

    .line 358
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$1900(Lcom/vkontakte/android/ui/PhotoView;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    long-to-float v3, v4

    iget-object v4, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/PhotoView;->access$2000(Lcom/vkontakte/android/ui/PhotoView;)J

    move-result-wide v4

    long-to-float v4, v4

    div-float v0, v3, v4

    .line 359
    .local v0, "a":F
    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$2100(Lcom/vkontakte/android/ui/PhotoView;)Landroid/view/animation/Interpolator;

    move-result-object v3

    invoke-interface {v3, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    .line 360
    .local v1, "ai":F
    iget-object v3, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/PhotoView;->access$2200(Lcom/vkontakte/android/ui/PhotoView;)F

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/PhotoView;->access$700(Lcom/vkontakte/android/ui/PhotoView;)F

    move-result v4

    sub-float/2addr v3, v4

    mul-float/2addr v3, v1

    iget-object v4, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/PhotoView;->access$2300(Lcom/vkontakte/android/ui/PhotoView;)F

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v5}, Lcom/vkontakte/android/ui/PhotoView;->access$1100(Lcom/vkontakte/android/ui/PhotoView;)F

    move-result v5

    sub-float/2addr v4, v5

    mul-float/2addr v4, v1

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 362
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->invalidate()V

    .line 365
    .end local v0    # "a":F
    .end local v1    # "ai":F
    :cond_4
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v2

    .line 366
    .local v2, "result":Z
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto/16 :goto_0
.end method

.method public onLayout(ZIIII)V
    .locals 13
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 384
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 385
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$2600(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/ClippingImageView;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/ClippingImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 386
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 387
    sub-int v6, p4, p2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingLeft()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingRight()I

    move-result v7

    sub-int v5, v6, v7

    .local v5, "w":I
    sub-int v6, p5, p3

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingTop()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingBottom()I

    move-result v7

    sub-int v1, v6, v7

    .line 388
    .local v1, "h":I
    int-to-float v6, v5

    int-to-float v7, v1

    div-float v3, v6, v7

    .line 389
    .local v3, "sr":F
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v7

    int-to-float v7, v7

    div-float v4, v6, v7

    .line 390
    .local v4, "tr":F
    cmpg-float v6, v3, v4

    if-gez v6, :cond_2

    .line 391
    int-to-float v6, v5

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    int-to-float v7, v7

    div-float v2, v6, v7

    .line 392
    .local v2, "scale":F
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$2600(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/ClippingImageView;

    move-result-object v6

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingLeft()I

    move-result v7

    div-int/lit8 v8, v1, 0x2

    int-to-float v8, v8

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v2

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    sub-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingTop()I

    move-result v9

    add-int/2addr v8, v9

    div-int/lit8 v9, v1, 0x2

    int-to-float v9, v9

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v10

    int-to-float v10, v10

    mul-float/2addr v10, v2

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    add-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingTop()I

    move-result v10

    add-int/2addr v9, v10

    invoke-virtual {v6, v7, v8, v5, v9}, Lcom/vkontakte/android/ui/ClippingImageView;->layout(IIII)V

    .line 398
    .end local v1    # "h":I
    .end local v2    # "scale":F
    .end local v3    # "sr":F
    .end local v4    # "tr":F
    .end local v5    # "w":I
    :cond_0
    :goto_0
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$1400(Lcom/vkontakte/android/ui/PhotoView;)Landroid/widget/FrameLayout;

    move-result-object v6

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v6

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v6

    iget v6, v6, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    if-lez v6, :cond_1

    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v6

    iget v6, v6, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    if-lez v6, :cond_1

    .line 399
    sub-int v6, p4, p2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingLeft()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingRight()I

    move-result v7

    sub-int v5, v6, v7

    .restart local v5    # "w":I
    sub-int v6, p5, p3

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingTop()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingBottom()I

    move-result v7

    sub-int v1, v6, v7

    .line 400
    .restart local v1    # "h":I
    int-to-float v6, v5

    int-to-float v7, v1

    div-float v3, v6, v7

    .line 401
    .restart local v3    # "sr":F
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v6

    iget v6, v6, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v6, v6

    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v7}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v7

    iget v7, v7, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v7, v7

    div-float v4, v6, v7

    .line 402
    .restart local v4    # "tr":F
    cmpg-float v6, v3, v4

    if-gez v6, :cond_3

    .line 403
    int-to-float v6, v5

    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v7}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v7

    iget v7, v7, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v7, v7

    div-float v2, v6, v7

    .line 404
    .restart local v2    # "scale":F
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$1400(Lcom/vkontakte/android/ui/PhotoView;)Landroid/widget/FrameLayout;

    move-result-object v6

    const/high16 v7, 0x40000000    # 2.0f

    or-int/2addr v7, v5

    const/high16 v8, 0x40000000    # 2.0f

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v9}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v9

    iget v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v9, v9

    mul-float/2addr v9, v2

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    or-int/2addr v8, v9

    invoke-virtual {v6, v7, v8}, Landroid/widget/FrameLayout;->measure(II)V

    .line 405
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$1400(Lcom/vkontakte/android/ui/PhotoView;)Landroid/widget/FrameLayout;

    move-result-object v6

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingLeft()I

    move-result v7

    div-int/lit8 v8, v1, 0x2

    int-to-float v8, v8

    iget-object v9, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v9}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v9

    iget v9, v9, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v9, v9

    mul-float/2addr v9, v2

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    sub-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingTop()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingLeft()I

    move-result v9

    add-int/2addr v9, v5

    div-int/lit8 v10, v1, 0x2

    int-to-float v10, v10

    iget-object v11, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v11

    iget v11, v11, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v11, v11

    mul-float/2addr v11, v2

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v11, v12

    add-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v10

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingTop()I

    move-result v11

    add-int/2addr v10, v11

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 412
    .end local v1    # "h":I
    .end local v2    # "scale":F
    .end local v3    # "sr":F
    .end local v4    # "tr":F
    .end local v5    # "w":I
    :cond_1
    :goto_1
    return-void

    .line 394
    .restart local v1    # "h":I
    .restart local v3    # "sr":F
    .restart local v4    # "tr":F
    .restart local v5    # "w":I
    :cond_2
    int-to-float v6, v1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v7

    int-to-float v7, v7

    div-float v2, v6, v7

    .line 395
    .restart local v2    # "scale":F
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$2600(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/ClippingImageView;

    move-result-object v6

    div-int/lit8 v7, v5, 0x2

    int-to-float v7, v7

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v2

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v8, v9

    sub-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingLeft()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingTop()I

    move-result v8

    div-int/lit8 v9, v5, 0x2

    int-to-float v9, v9

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v10

    int-to-float v10, v10

    mul-float/2addr v10, v2

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    add-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingTop()I

    move-result v10

    add-int/2addr v10, v1

    invoke-virtual {v6, v7, v8, v9, v10}, Lcom/vkontakte/android/ui/ClippingImageView;->layout(IIII)V

    goto/16 :goto_0

    .line 407
    .end local v2    # "scale":F
    :cond_3
    int-to-float v6, v1

    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v7}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v7

    iget v7, v7, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropHeight:I

    int-to-float v7, v7

    div-float v2, v6, v7

    .line 408
    .restart local v2    # "scale":F
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$1400(Lcom/vkontakte/android/ui/PhotoView;)Landroid/widget/FrameLayout;

    move-result-object v6

    const/high16 v7, 0x40000000    # 2.0f

    iget-object v8, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v8}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v8

    iget v8, v8, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v8, v8

    mul-float/2addr v8, v2

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    or-int/2addr v7, v8

    const/high16 v8, 0x40000000    # 2.0f

    or-int/2addr v8, v1

    invoke-virtual {v6, v7, v8}, Landroid/widget/FrameLayout;->measure(II)V

    .line 409
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/PhotoView;->access$1400(Lcom/vkontakte/android/ui/PhotoView;)Landroid/widget/FrameLayout;

    move-result-object v6

    div-int/lit8 v7, v5, 0x2

    int-to-float v7, v7

    iget-object v8, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v8}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v8

    iget v8, v8, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v8, v8

    mul-float/2addr v8, v2

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v8, v9

    sub-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingLeft()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingTop()I

    move-result v8

    div-int/lit8 v9, v5, 0x2

    int-to-float v9, v9

    iget-object v10, p0, Lcom/vkontakte/android/ui/PhotoView$3;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    invoke-static {v10}, Lcom/vkontakte/android/ui/PhotoView;->access$2700(Lcom/vkontakte/android/ui/PhotoView;)Lcom/vkontakte/android/ui/PhotoView$Texture;

    move-result-object v10

    iget v10, v10, Lcom/vkontakte/android/ui/PhotoView$Texture;->cropWidth:I

    int-to-float v10, v10

    mul-float/2addr v10, v2

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    add-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingLeft()I

    move-result v10

    add-int/2addr v9, v10

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoView$3;->getPaddingTop()I

    move-result v10

    add-int/2addr v10, v1

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/widget/FrameLayout;->layout(IIII)V

    goto/16 :goto_1
.end method
