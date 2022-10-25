.class Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
.super Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewInfoItem"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field public view:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V
    .locals 3
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 3569
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V

    .line 3570
    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->view:Landroid/view/View;

    .line 3571
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-nez v0, :cond_0

    .line 3573
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3575
    :cond_0
    return-void
.end method


# virtual methods
.method public createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 3

    .prologue
    .line 3584
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->view:Landroid/view/View;

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 3579
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    return v0
.end method
