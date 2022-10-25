.class Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "BoardTopicViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PollViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/attachments/PollAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v3, 0x0

    const/high16 v2, 0x41000000    # 8.0f

    .line 765
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 766
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollViewHolder;->itemView:Landroid/view/View;

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v0, v3, v1, v3, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 767
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/attachments/PollAttachment;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 771
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollViewHolder;->itemView:Landroid/view/View;

    check-cast v2, Landroid/view/ViewGroup;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 772
    .local v1, "reusableView":Landroid/view/View;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollViewHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p1, v2, v1}, Lcom/vkontakte/android/attachments/PollAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 773
    .local v0, "newView":Landroid/view/View;
    if-eq v1, v0, :cond_0

    .line 774
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollViewHolder;->itemView:Landroid/view/View;

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 775
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollViewHolder;->itemView:Landroid/view/View;

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 777
    :cond_0
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 762
    check-cast p1, Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollViewHolder;->onBind(Lcom/vkontakte/android/attachments/PollAttachment;)V

    return-void
.end method
