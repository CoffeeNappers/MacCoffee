.class Lcom/vk/attachpicker/screen/ViewerScreen$6$1;
.super Ljava/lang/Object;
.source "ViewerScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/ViewerScreen$6;->onPreDraw()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/ViewerScreen$6;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/attachpicker/screen/ViewerScreen$6;

    .prologue
    .line 431
    iput-object p1, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 26

    .prologue
    .line 434
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->val$object:Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/util/Utils;->getXOnScreen(Landroid/view/View;)I

    move-result v14

    .line 435
    .local v14, "viewX":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->val$object:Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/util/Utils;->getYOnScreen(Landroid/view/View;)I

    move-result v19

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1000()I

    move-result v20

    sub-int v15, v19, v20

    .line 437
    .local v15, "viewY":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->val$object:Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    move-object/from16 v19, v0

    .line 438
    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/widget/LocalImageView;->getWidth()I

    move-result v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->val$object:Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/vk/attachpicker/widget/LocalImageView;->getHeight()I

    move-result v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->val$object:Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->thumbImageWidth:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->val$object:Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->thumbImageHeight:I

    move/from16 v22, v0

    const/16 v23, 0x0

    .line 437
    invoke-static/range {v19 .. v23}, Lcom/vk/attachpicker/widget/LocalImageView;->computeBounds(IIIIZ)Landroid/graphics/RectF;

    move-result-object v8

    .line 442
    .local v8, "drawRegion":Landroid/graphics/RectF;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/widget/ClippingView;->setVisibility(I)V

    .line 443
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->val$object:Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v19 .. v21}, Lcom/vk/attachpicker/widget/ClippingView;->setImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Z)V

    .line 444
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    const/high16 v20, 0x3f800000    # 1.0f

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/widget/ClippingView;->setAlpha(F)V

    .line 445
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/widget/ClippingView;->setPivotX(F)V

    .line 446
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/widget/ClippingView;->setPivotY(F)V

    .line 447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    const/high16 v20, 0x3f800000    # 1.0f

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/widget/ClippingView;->setScaleX(F)V

    .line 448
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    const/high16 v20, 0x3f800000    # 1.0f

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/widget/ClippingView;->setScaleY(F)V

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    int-to-float v0, v14

    move/from16 v20, v0

    iget v0, v8, Landroid/graphics/RectF;->left:F

    move/from16 v21, v0

    add-float v20, v20, v21

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/widget/ClippingView;->setTranslationX(F)V

    .line 450
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    int-to-float v0, v15

    move/from16 v20, v0

    iget v0, v8, Landroid/graphics/RectF;->top:F

    move/from16 v21, v0

    add-float v20, v20, v21

    invoke-virtual/range {v19 .. v20}, Lcom/vk/attachpicker/widget/ClippingView;->setTranslationY(F)V

    .line 451
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/widget/ClippingView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    .line 452
    .local v10, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    iget v0, v8, Landroid/graphics/RectF;->right:F

    move/from16 v19, v0

    iget v0, v8, Landroid/graphics/RectF;->left:F

    move/from16 v20, v0

    sub-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    iput v0, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 453
    iget v0, v8, Landroid/graphics/RectF;->bottom:F

    move/from16 v19, v0

    iget v0, v8, Landroid/graphics/RectF;->top:F

    move/from16 v20, v0

    sub-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    iput v0, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 454
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Lcom/vk/attachpicker/widget/ClippingView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 457
    invoke-static {}, Lcom/vk/core/util/Screen;->width()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v12, v19, v20

    .line 458
    .local v12, "scaleX":F
    invoke-static {}, Lcom/vk/core/util/Screen;->height()I

    move-result v19

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1000()I

    move-result v20

    sub-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1200(Lcom/vk/attachpicker/screen/ViewerScreen;)I

    move-result v20

    sub-int v19, v19, v20

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v13, v19, v20

    .line 459
    .local v13, "scaleY":F
    invoke-static {v12, v13}, Ljava/lang/Math;->min(FF)F

    move-result v11

    .line 460
    .local v11, "scale":F
    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    mul-float v16, v19, v11

    .line 461
    .local v16, "width":F
    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    mul-float v9, v19, v11

    .line 462
    .local v9, "height":F
    invoke-static {}, Lcom/vk/core/util/Screen;->width()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    sub-float v19, v19, v16

    const/high16 v20, 0x40000000    # 2.0f

    div-float v17, v19, v20

    .line 463
    .local v17, "xPos":F
    invoke-static {}, Lcom/vk/core/util/Screen;->height()I

    move-result v19

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1000()I

    move-result v20

    sub-int v19, v19, v20

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    sub-float v19, v19, v9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1200(Lcom/vk/attachpicker/screen/ViewerScreen;)I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    sub-float v19, v19, v20

    const/high16 v20, 0x40000000    # 2.0f

    div-float v18, v19, v20

    .line 464
    .local v18, "yPos":F
    iget v0, v8, Landroid/graphics/RectF;->left:F

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->abs(F)F

    move-result v19

    move/from16 v0, v19

    float-to-int v4, v0

    .line 465
    .local v4, "clipHorizontal":I
    iget v0, v8, Landroid/graphics/RectF;->top:F

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->abs(F)F

    move-result v19

    move/from16 v0, v19

    float-to-int v6, v0

    .line 466
    .local v6, "clipVertical":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Lcom/vk/attachpicker/widget/ClippingView;->setClipHorizontal(I)V

    .line 467
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Lcom/vk/attachpicker/widget/ClippingView;->setClipVertical(I)V

    .line 469
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v7, v0, [I

    .line 470
    .local v7, "coords2":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->val$object:Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->parentView:Landroid/view/View;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 471
    const/16 v19, 0x1

    aget v19, v7, v19

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1000()I

    move-result v20

    sub-int v19, v19, v20

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    int-to-float v0, v15

    move/from16 v20, v0

    iget v0, v8, Landroid/graphics/RectF;->top:F

    move/from16 v21, v0

    add-float v20, v20, v21

    sub-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v5, v0

    .line 472
    .local v5, "clipTop":I
    if-gez v5, :cond_0

    .line 473
    const/4 v5, 0x0

    .line 475
    :cond_0
    int-to-float v0, v15

    move/from16 v19, v0

    iget v0, v8, Landroid/graphics/RectF;->top:F

    move/from16 v20, v0

    add-float v19, v19, v20

    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    add-float v19, v19, v20

    const/16 v20, 0x1

    aget v20, v7, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->val$object:Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->parentView:Landroid/view/View;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getHeight()I

    move-result v21

    add-int v20, v20, v21

    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1000()I

    move-result v21

    sub-int v20, v20, v21

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    sub-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v3, v0

    .line 476
    .local v3, "clipBottom":I
    if-gez v3, :cond_1

    .line 477
    const/4 v3, 0x0

    .line 479
    :cond_1
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 480
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 482
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 483
    .local v2, "animatorSet":Landroid/animation/AnimatorSet;
    const/16 v19, 0xb

    move/from16 v0, v19

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 484
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v21

    sget-object v22, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v11, v23, v24

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 485
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v21

    sget-object v22, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v11, v23, v24

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 486
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v21

    sget-object v22, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v17, v23, v24

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 487
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v21

    sget-object v22, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v18, v23, v24

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 488
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1300(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/graphics/drawable/ColorDrawable;

    move-result-object v21

    const-string/jumbo v22, "alpha"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v23, v0

    fill-array-data v23, :array_0

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 489
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v21

    sget-object v22, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_HORIZONTAL:Landroid/util/Property;

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v4, v23, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput v25, v23, v24

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 490
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v21

    sget-object v22, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_TOP:Landroid/util/Property;

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v5, v23, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput v25, v23, v24

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 491
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v21

    sget-object v22, Lcom/vk/attachpicker/widget/ClippingView;->CLIP_BOTTOM:Landroid/util/Property;

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput v3, v23, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput v25, v23, v24

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 492
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1400(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/view/View;

    move-result-object v21

    sget-object v22, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    fill-array-data v23, :array_1

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 493
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$400(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/EditButton;

    move-result-object v21

    sget-object v22, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    fill-array-data v23, :array_2

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0xa

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    move-object/from16 v21, v0

    .line 494
    invoke-static/range {v21 .. v21}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$000(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ViewerToolbar;

    move-result-object v21

    sget-object v22, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [F

    move-object/from16 v23, v0

    fill-array-data v23, :array_3

    invoke-static/range {v21 .. v23}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v21

    aput-object v21, v19, v20

    .line 483
    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 496
    sget-object v19, Lcom/vk/attachpicker/screen/ViewerScreen;->interpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 498
    const-wide/16 v20, 0xfa

    move-wide/from16 v0, v20

    invoke-virtual {v2, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 499
    new-instance v19, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen$6$1;)V

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 538
    const-wide/16 v20, 0x10

    move-wide/from16 v0, v20

    invoke-virtual {v2, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 539
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 541
    return-void

    .line 488
    nop

    :array_0
    .array-data 4
        0x0
        0xff
    .end array-data

    .line 492
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 493
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 494
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
