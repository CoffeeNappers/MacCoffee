.class Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ViewerScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/ViewerScreen$6$1;)V
    .locals 0
    .param p1, "this$2"    # Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    .prologue
    .line 499
    iput-object p1, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 535
    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 536
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 513
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1500(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/screen/ViewerScreen$FrameLayoutTouchListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v1, v1, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v1, v1, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1600(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/graphics/drawable/ColorDrawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/core/util/CompatUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 515
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v1, v1, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v1, v1, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1700(Lcom/vk/attachpicker/screen/ViewerScreen;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1800(Lcom/vk/attachpicker/screen/ViewerScreen;Ljava/util/ArrayList;)V

    .line 516
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$900(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/VkViewPager;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v1, v1, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v1, v1, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1900(Lcom/vk/attachpicker/screen/ViewerScreen;)I

    move-result v1

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/widget/VkViewPager;->setCurrentItem(IZ)V

    .line 517
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$900(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/VkViewPager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/widget/VkViewPager;->setVisibility(I)V

    .line 518
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$1100(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/widget/ClippingView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ClippingView;->setVisibility(I)V

    .line 519
    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$200()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1$2;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1$2;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 527
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$600(Lcom/vk/attachpicker/screen/ViewerScreen;)Lcom/vk/attachpicker/util/OrientationLocker;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v1, v1, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v1, v1, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$800(Lcom/vk/attachpicker/screen/ViewerScreen;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/util/OrientationLocker;->unlockOrientation(Landroid/app/Activity;)V

    .line 528
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-static {v0, v3}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$500(Lcom/vk/attachpicker/screen/ViewerScreen;Z)V

    .line 529
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/screen/ViewerScreen;->setAnimationInProgress(Z)V

    .line 530
    iget-object v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;->this$2:Lcom/vk/attachpicker/screen/ViewerScreen$6$1;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6$1;->this$1:Lcom/vk/attachpicker/screen/ViewerScreen$6;

    iget-object v0, v0, Lcom/vk/attachpicker/screen/ViewerScreen$6;->this$0:Lcom/vk/attachpicker/screen/ViewerScreen;

    invoke-virtual {v0, v3}, Lcom/vk/attachpicker/screen/ViewerScreen;->setIsVisible(Z)V

    .line 531
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 503
    invoke-static {}, Lcom/vk/attachpicker/screen/ViewerScreen;->access$200()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1$1;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1$1;-><init>(Lcom/vk/attachpicker/screen/ViewerScreen$6$1$1;)V

    const-wide/16 v2, 0x46

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 509
    return-void
.end method
