.class Lcom/vkontakte/android/fragments/groupadmin/ManagersFragment$Holder;
.super Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment$Holder;
.source "ManagersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/groupadmin/ManagersFragment;
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
    .line 135
    const v0, 0x7f0300cc

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment$Holder;-><init>(Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment;Landroid/view/ViewGroup;I)V

    .line 136
    return-void
.end method
