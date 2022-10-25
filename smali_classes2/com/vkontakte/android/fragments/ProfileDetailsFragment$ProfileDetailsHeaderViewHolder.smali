.class Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsHeaderViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileDetailsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileDetailsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProfileDetailsHeaderViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileDetailsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/ProfileDetailsFragment;)V
    .locals 3

    .prologue
    .line 187
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsHeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileDetailsFragment;

    .line 188
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0301db

    invoke-static {p1}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment;->access$700(Lcom/vkontakte/android/fragments/ProfileDetailsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/content/Context;ILandroid/view/ViewGroup;)V

    .line 189
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsHeaderViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 185
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsHeaderViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;)V

    return-void
.end method
