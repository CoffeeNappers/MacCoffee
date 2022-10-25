.class Lcom/vk/attachpicker/screen/EditorScreen$4;
.super Ljava/lang/Object;
.source "EditorScreen.java"

# interfaces
.implements Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/EditorScreen;->createView(Landroid/view/LayoutInflater;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/screen/EditorScreen;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 400
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEnterRemoveArea()V
    .locals 4

    .prologue
    .line 412
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$700(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 413
    return-void
.end method

.method public onLeaveRemoveArea()V
    .locals 4

    .prologue
    .line 417
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$700(Lcom/vk/attachpicker/screen/EditorScreen;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 418
    return-void
.end method

.method public onStartMove()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 403
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$300(Lcom/vk/attachpicker/screen/EditorScreen;Z)V

    .line 404
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$400(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/widget/FiltersViewPager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->setSwipeEnabled(Z)V

    .line 405
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$500(Lcom/vk/attachpicker/screen/EditorScreen;Z)V

    .line 407
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$600(Lcom/vk/attachpicker/screen/EditorScreen;)V

    .line 408
    return-void
.end method

.method public onTwoFingerGesture()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 429
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$300(Lcom/vk/attachpicker/screen/EditorScreen;Z)V

    .line 430
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$400(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/widget/FiltersViewPager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->setSwipeEnabled(Z)V

    .line 431
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$800(Lcom/vk/attachpicker/screen/EditorScreen;Z)V

    .line 433
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$600(Lcom/vk/attachpicker/screen/EditorScreen;)V

    .line 434
    return-void
.end method

.method public onUp()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 422
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$300(Lcom/vk/attachpicker/screen/EditorScreen;Z)V

    .line 423
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$400(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/widget/FiltersViewPager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/FiltersViewPager;->setSwipeEnabled(Z)V

    .line 424
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$4;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$800(Lcom/vk/attachpicker/screen/EditorScreen;Z)V

    .line 425
    return-void
.end method
