.class Lcom/vk/stories/view/ShutterButton$10;
.super Ljava/lang/Object;
.source "ShutterButton.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/ShutterButton;->toMasksShutter(Z)Landroid/animation/AnimatorSet;
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
    .line 463
    iput-object p1, p0, Lcom/vk/stories/view/ShutterButton$10;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 466
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton$10;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v2}, Lcom/vk/stories/view/ShutterButton;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 468
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton$10;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v2, v4}, Lcom/vk/stories/view/ShutterButton;->setForwardArrowAlpha(F)V

    .line 469
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton$10;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-static {}, Lcom/vk/stories/view/ShutterButton;->access$200()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Lcom/vk/stories/view/ShutterButton;->setCircleRadius(F)V

    .line 470
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton$10;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v2, v4}, Lcom/vk/stories/view/ShutterButton;->setRedProgress(F)V

    .line 471
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton$10;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v2, v4}, Lcom/vk/stories/view/ShutterButton;->setRedProgressAlpha(F)V

    .line 473
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton$10;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v2}, Lcom/vk/stories/view/ShutterButton;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 474
    .local v1, "vp":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 475
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    const/16 v3, 0x30

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    sub-int v0, v2, v3

    .line 476
    .local v0, "ty":I
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton$10;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v2, v4}, Lcom/vk/stories/view/ShutterButton;->setTranslationX(F)V

    .line 477
    iget-object v2, p0, Lcom/vk/stories/view/ShutterButton$10;->this$0:Lcom/vk/stories/view/ShutterButton;

    int-to-float v3, v0

    invoke-virtual {v2, v3}, Lcom/vk/stories/view/ShutterButton;->setTranslationY(F)V

    .line 480
    .end local v0    # "ty":I
    :cond_0
    const/4 v2, 0x0

    return v2
.end method
