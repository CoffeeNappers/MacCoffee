.class Lcom/vk/stories/view/ShutterButton$8;
.super Ljava/lang/Object;
.source "ShutterButton.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/ShutterButton;->toArrowShutter(Z)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/ShutterButton;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/ShutterButton;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/ShutterButton;

    .prologue
    .line 400
    iput-object p1, p0, Lcom/vk/stories/view/ShutterButton$8;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 7

    .prologue
    const/16 v6, 0x28

    const/4 v5, 0x0

    .line 403
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton$8;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v3}, Lcom/vk/stories/view/ShutterButton;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 405
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton$8;->this$0:Lcom/vk/stories/view/ShutterButton;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4}, Lcom/vk/stories/view/ShutterButton;->setForwardArrowAlpha(F)V

    .line 406
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton$8;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-static {}, Lcom/vk/stories/view/ShutterButton;->access$000()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Lcom/vk/stories/view/ShutterButton;->setCircleRadius(F)V

    .line 407
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton$8;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-static {}, Lcom/vk/stories/view/ShutterButton;->access$100()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Lcom/vk/stories/view/ShutterButton;->setBorderSize(F)V

    .line 408
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton$8;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v3, v5}, Lcom/vk/stories/view/ShutterButton;->setRedProgress(F)V

    .line 409
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton$8;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v3, v5}, Lcom/vk/stories/view/ShutterButton;->setRedProgressAlpha(F)V

    .line 411
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton$8;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v3}, Lcom/vk/stories/view/ShutterButton;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 412
    .local v2, "vp":Landroid/view/View;
    if-eqz v2, :cond_0

    .line 413
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    invoke-static {v6}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    sub-int v0, v3, v4

    .line 414
    .local v0, "tx":I
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    invoke-static {v6}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    sub-int v1, v3, v4

    .line 415
    .local v1, "ty":I
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton$8;->this$0:Lcom/vk/stories/view/ShutterButton;

    int-to-float v4, v0

    invoke-virtual {v3, v4}, Lcom/vk/stories/view/ShutterButton;->setTranslationX(F)V

    .line 416
    iget-object v3, p0, Lcom/vk/stories/view/ShutterButton$8;->this$0:Lcom/vk/stories/view/ShutterButton;

    int-to-float v4, v1

    invoke-virtual {v3, v4}, Lcom/vk/stories/view/ShutterButton;->setTranslationY(F)V

    .line 419
    .end local v0    # "tx":I
    .end local v1    # "ty":I
    :cond_0
    const/4 v3, 0x0

    return v3
.end method
