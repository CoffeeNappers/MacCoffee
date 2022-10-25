.class Lcom/vkontakte/android/ui/AttachmentsEditorView$8;
.super Ljava/lang/Object;
.source "AttachmentsEditorView.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 560
    iput-object p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    const v6, 0x3f8ccccd    # 1.1f

    const-wide/16 v4, 0x0

    .line 563
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$600(Lcom/vkontakte/android/ui/AttachmentsEditorView;)F

    move-result v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$502(Lcom/vkontakte/android/ui/AttachmentsEditorView;F)F

    .line 564
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$800(Lcom/vkontakte/android/ui/AttachmentsEditorView;)F

    move-result v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$702(Lcom/vkontakte/android/ui/AttachmentsEditorView;F)F

    .line 565
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1, v7}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$402(Lcom/vkontakte/android/ui/AttachmentsEditorView;I)I

    .line 566
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 567
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-ne v1, p1, :cond_1

    .line 568
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1, v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$402(Lcom/vkontakte/android/ui/AttachmentsEditorView;I)I

    .line 572
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1, p1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$302(Lcom/vkontakte/android/ui/AttachmentsEditorView;Landroid/view/View;)Landroid/view/View;

    .line 573
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v9, v2}, Landroid/animation/LayoutTransition;->setAnimator(ILandroid/animation/Animator;)V

    .line 574
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v1

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/animation/LayoutTransition;->setAnimator(ILandroid/animation/Animator;)V

    .line 575
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v1

    invoke-virtual {v1, v8, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 576
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v1

    invoke-virtual {v1, v7, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 577
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v1

    invoke-virtual {v1, v9, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 578
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v2, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 579
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->invalidate()V

    .line 580
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0xc8

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 581
    return v8

    .line 566
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0
.end method
