.class Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContentTitleViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private button:Landroid/widget/TextView;

.field private text:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 3

    .prologue
    .line 3873
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 3874
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0301c8

    invoke-static {p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6400(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/content/Context;ILandroid/view/ViewGroup;)V

    .line 3875
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1001c3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->text:Landroid/widget/TextView;

    .line 3876
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->text:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3877
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10010f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->button:Landroid/widget/TextView;

    .line 3878
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->button:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3879
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    .prologue
    const/4 v1, 0x0

    .line 3883
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->text:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->text:Ljava/lang/CharSequence;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3884
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->text:Landroid/widget/TextView;

    iget-object v0, p1, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->onClick:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 3885
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->button:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v2

    if-gez v2, :cond_2

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3886
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v0

    if-gez v0, :cond_0

    .line 3887
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->button:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->buttonText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3889
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 3884
    goto :goto_0

    .line 3885
    :cond_2
    const/16 v1, 0x8

    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 3869
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 3893
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->text:Landroid/widget/TextView;

    if-ne p1, v0, :cond_1

    .line 3894
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->onClick:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 3902
    :cond_0
    :goto_0
    return-void

    .line 3895
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->button:Landroid/widget/TextView;

    if-ne p1, v0, :cond_0

    .line 3896
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->onButtonClick:Ljava/lang/Runnable;

    if-eqz v0, :cond_2

    .line 3897
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->onButtonClick:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 3899
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->onClick:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method
