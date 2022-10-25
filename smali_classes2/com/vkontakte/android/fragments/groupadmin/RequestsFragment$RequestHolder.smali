.class Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment$RequestHolder;
.super Lcom/vkontakte/android/ui/holder/FriendRequestHolder;
.source "RequestsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RequestHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;Landroid/view/ViewGroup;)V
    .locals 2
    .param p1    # Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment$RequestHolder;->this$0:Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;

    .line 118
    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;-><init>(Landroid/view/ViewGroup;)V

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment$RequestHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1002b3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f08029e

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment$RequestHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1002b4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0802cc

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 121
    return-void
.end method
