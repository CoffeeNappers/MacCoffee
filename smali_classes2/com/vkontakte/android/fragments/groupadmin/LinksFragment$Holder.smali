.class Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$Holder;
.super Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment$Holder;
.source "LinksFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/groupadmin/LinksFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Holder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment$Holder",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "fragment"    # Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 333
    const v0, 0x7f0300cc

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment$Holder;-><init>(Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment;Landroid/view/ViewGroup;I)V

    .line 334
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 338
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment$Holder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    .line 339
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$Holder;->mOnline:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 340
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 330
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/LinksFragment$Holder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method
