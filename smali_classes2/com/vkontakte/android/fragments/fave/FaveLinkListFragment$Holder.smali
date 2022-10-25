.class Lcom/vkontakte/android/fragments/fave/FaveLinkListFragment$Holder;
.super Lcom/vkontakte/android/ui/holder/UserHolder;
.source "FaveLinkListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/fave/FaveLinkListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Holder"
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/fave/FaveLinkListFragment;


# direct methods
.method protected constructor <init>(Lcom/vkontakte/android/fragments/fave/FaveLinkListFragment;Landroid/view/ViewGroup;)V
    .locals 6
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v3, 0x1

    .line 76
    iput-object p1, p0, Lcom/vkontakte/android/fragments/fave/FaveLinkListFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/fave/FaveLinkListFragment;

    .line 77
    const v2, 0x7f03021e

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p2

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/UserHolder;-><init>(Landroid/view/ViewGroup;IZZZ)V

    .line 78
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 82
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/fragments/fave/FaveLinkListFragment$Holder;->mSubtitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 74
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/fave/FaveLinkListFragment$Holder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method
