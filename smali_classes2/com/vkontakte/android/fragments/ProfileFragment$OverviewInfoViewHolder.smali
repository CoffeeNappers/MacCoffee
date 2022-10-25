.class Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$DisableableClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OverviewInfoViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$DisableableClickable;"
    }
.end annotation


# instance fields
.field private icon:Landroid/widget/ImageView;

.field private photos:Lcom/vkontakte/android/ui/PhotoStripView;

.field private text:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 3

    .prologue
    .line 3837
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 3838
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0301d6

    invoke-static {p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6300(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/content/Context;ILandroid/view/ViewGroup;)V

    .line 3839
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1001c3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->text:Landroid/widget/TextView;

    .line 3840
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100127

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->icon:Landroid/widget/ImageView;

    .line 3841
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1004c2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/PhotoStripView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    .line 3842
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    const v1, 0x3f4ccccd    # 0.8f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setOverlapOffset(F)V

    .line 3843
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setPadding(I)V

    .line 3844
    return-void
.end method


# virtual methods
.method public isEnabled()Z
    .locals 1

    .prologue
    .line 3860
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->onClick:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    .prologue
    .line 3848
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->text:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->text:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3849
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->icon:Landroid/widget/ImageView;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 3850
    iget-object v0, p1, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 3851
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setVisibility(I)V

    .line 3856
    :goto_0
    return-void

    .line 3853
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setVisibility(I)V

    .line 3854
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->load(Ljava/util/List;)V

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 3831
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;)V

    return-void
.end method

.method public onClick()V
    .locals 1

    .prologue
    .line 3865
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->onClick:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 3866
    return-void
.end method
