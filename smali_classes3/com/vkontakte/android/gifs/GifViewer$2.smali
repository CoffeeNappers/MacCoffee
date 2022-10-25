.class Lcom/vkontakte/android/gifs/GifViewer$2;
.super Ljava/lang/Object;
.source "GifViewer.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/gifs/GifViewer;->animateIn()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/gifs/GifViewer;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/gifs/GifViewer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/gifs/GifViewer;

    .prologue
    .line 312
    iput-object p1, p0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 26

    .prologue
    .line 315
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vkontakte/android/ui/widget/RatioImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 317
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v18, v0

    fill-array-data v18, :array_0

    .line 318
    .local v18, "viewPosition":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/RatioImageView;->getLocationOnScreen([I)V

    .line 320
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/vkontakte/android/gifs/GifViewer$Provider;->getViewLocation()Landroid/graphics/Rect;

    move-result-object v6

    .line 321
    .local v6, "originalLocation":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mProvider:Lcom/vkontakte/android/gifs/GifViewer$Provider;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/vkontakte/android/gifs/GifViewer$Provider;->getClipTopBottom()[I

    move-result-object v2

    .line 322
    .local v2, "clip":[I
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v8

    .line 323
    .local v8, "rectWidth":I
    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v7

    .line 325
    .local v7, "rectHeight":I
    int-to-float v0, v8

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/ui/widget/RatioImageView;->getWidth()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v10, v19, v20

    .line 326
    .local v10, "scaleX":F
    int-to-float v0, v7

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/ui/widget/RatioImageView;->getHeight()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v11, v19, v20

    .line 327
    .local v11, "scaleY":F
    iget v0, v6, Landroid/graphics/Rect;->left:I

    move/from16 v19, v0

    const/16 v20, 0x0

    aget v20, v18, v20

    sub-int v19, v19, v20

    move/from16 v0, v19

    int-to-float v15, v0

    .line 328
    .local v15, "transX":F
    iget v0, v6, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    const/16 v20, 0x1

    aget v20, v18, v20

    sub-int v19, v19, v20

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v16, v0

    .line 330
    .local v16, "transY":F
    invoke-static {v10, v11}, Ljava/lang/Math;->max(FF)F

    move-result v9

    .line 331
    .local v9, "scale":F
    int-to-float v0, v8

    move/from16 v19, v0

    int-to-float v0, v7

    move/from16 v20, v0

    div-float v13, v19, v20

    .line 332
    .local v13, "tRatio":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vkontakte/android/ui/widget/RatioImageView;->getWidth()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/ui/widget/RatioImageView;->getHeight()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v5, v19, v20

    .line 333
    .local v5, "ivRatio":F
    const/4 v4, 0x0

    .local v4, "clipV":I
    const/4 v3, 0x0

    .line 334
    .local v3, "clipH":I
    cmpl-float v19, v13, v5

    if-eqz v19, :cond_0

    .line 335
    cmpl-float v19, v13, v5

    if-lez v19, :cond_1

    .line 336
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vkontakte/android/ui/widget/RatioImageView;->getHeight()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    mul-float v14, v19, v9

    .line 337
    .local v14, "th":F
    int-to-float v0, v7

    move/from16 v19, v0

    sub-float v19, v14, v19

    const/high16 v20, 0x40000000    # 2.0f

    div-float v19, v19, v20

    div-float v19, v19, v9

    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 338
    int-to-float v0, v7

    move/from16 v19, v0

    sub-float v19, v14, v19

    const/high16 v20, 0x40000000    # 2.0f

    div-float v19, v19, v20

    sub-float v16, v16, v19

    .line 345
    .end local v14    # "th":F
    :cond_0
    :goto_0
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 346
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 347
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDragView:Landroid/view/View;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setPivotX(F)V

    .line 348
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDragView:Landroid/view/View;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setPivotY(F)V

    .line 349
    new-instance v12, Landroid/animation/AnimatorSet;

    invoke-direct {v12}, Landroid/animation/AnimatorSet;-><init>()V

    .line 350
    .local v12, "set":Landroid/animation/AnimatorSet;
    const/16 v19, 0x9

    move/from16 v0, v19

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDragView:Landroid/view/View;

    move-object/from16 v21, v0

    const-string/jumbo v22, "scaleX"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v9, v23, v24

    const/16 v24, 0x1

    const/high16 v25, 0x3f800000    # 1.0f

    aput v25, v23, v24

    .line 351
    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDragView:Landroid/view/View;

    move-object/from16 v21, v0

    const-string/jumbo v22, "scaleY"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v9, v23, v24

    const/16 v24, 0x1

    const/high16 v25, 0x3f800000    # 1.0f

    aput v25, v23, v24

    .line 352
    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDragView:Landroid/view/View;

    move-object/from16 v21, v0

    const-string/jumbo v22, "translationX"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v15, v23, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput v25, v23, v24

    .line 353
    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDragView:Landroid/view/View;

    move-object/from16 v21, v0

    const-string/jumbo v22, "translationY"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v16, v23, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput v25, v23, v24

    .line 354
    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mRootView:Lcom/vkontakte/android/gifs/GifRootLayout;

    move-object/from16 v21, v0

    const-string/jumbo v22, "backgroundAlpha"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v23, v0

    fill-array-data v23, :array_1

    .line 355
    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v21, v0

    const-string/jumbo v22, "clipTop"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const/16 v25, 0x0

    aget v25, v2, v25

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    div-float v25, v25, v9

    .line 356
    invoke-static/range {v25 .. v25}, Ljava/lang/Math;->round(F)I

    move-result v25

    add-int v25, v25, v4

    aput v25, v23, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput v25, v23, v24

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v21, v0

    const-string/jumbo v22, "clipBottom"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const/16 v25, 0x1

    aget v25, v2, v25

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    div-float v25, v25, v9

    .line 357
    invoke-static/range {v25 .. v25}, Ljava/lang/Math;->round(F)I

    move-result v25

    add-int v25, v25, v4

    aput v25, v23, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput v25, v23, v24

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v21, v0

    const-string/jumbo v22, "clipHorizontal"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v3, v23, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput v25, v23, v24

    .line 358
    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mErrorLayout:Landroid/view/View;

    move-object/from16 v21, v0

    const-string/jumbo v22, "alpha"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    fill-array-data v23, :array_2

    .line 359
    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    .line 350
    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 361
    const-wide/16 v20, 0x12c

    move-wide/from16 v0, v20

    invoke-virtual {v12, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 362
    sget-object v19, Lcom/vkontakte/android/ui/PhotoView;->interpolatorIn:Landroid/view/animation/Interpolator;

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 363
    invoke-virtual {v12}, Landroid/animation/AnimatorSet;->start()V

    .line 364
    const/16 v19, 0x1

    return v19

    .line 340
    .end local v12    # "set":Landroid/animation/AnimatorSet;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$2;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vkontakte/android/ui/widget/RatioImageView;->getWidth()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    mul-float v17, v19, v9

    .line 341
    .local v17, "tw":F
    int-to-float v0, v8

    move/from16 v19, v0

    sub-float v19, v17, v19

    const/high16 v20, 0x40000000    # 2.0f

    div-float v19, v19, v20

    div-float v19, v19, v9

    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 342
    int-to-float v0, v8

    move/from16 v19, v0

    sub-float v19, v17, v19

    const/high16 v20, 0x40000000    # 2.0f

    div-float v19, v19, v20

    sub-float v15, v15, v19

    goto/16 :goto_0

    .line 317
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data

    .line 354
    :array_1
    .array-data 4
        0x0
        0xff
    .end array-data

    .line 358
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
