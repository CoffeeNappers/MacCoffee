.class Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;
.super Lcom/vkontakte/android/ui/holder/UserHolder;
.source "FriendsImportFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UserHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/UserHolder",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;


# direct methods
.method protected constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Landroid/view/ViewGroup;)V
    .locals 6
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v3, 0x1

    .line 334
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .line 335
    const v2, 0x7f03020d

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p2

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/UserHolder;-><init>(Landroid/view/ViewGroup;IZZZ)V

    .line 336
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 340
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    .line 341
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 342
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 332
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 346
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->itemView:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 347
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->openProfile(Lcom/vkontakte/android/UserProfile;)V

    .line 349
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->mActionButton:Landroid/view/View;

    if-ne p1, v0, :cond_1

    .line 350
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->getAdapterPosition()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->addFriend(Lcom/vkontakte/android/UserProfile;I)V

    .line 352
    :cond_1
    return-void
.end method
