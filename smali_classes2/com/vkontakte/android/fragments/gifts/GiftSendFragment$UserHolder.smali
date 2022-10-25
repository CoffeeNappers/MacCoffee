.class final Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$UserHolder;
.super Lcom/vkontakte/android/ui/holder/UserHolder;
.source "GiftSendFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;


# direct methods
.method protected constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V
    .locals 6
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v3, 0x0

    .line 628
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$UserHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .line 629
    const v2, 0x7f03021f

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p2

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/UserHolder;-><init>(Landroid/view/ViewGroup;IZZZ)V

    .line 630
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 634
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$UserHolder;->mActionButton:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 635
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$UserHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$UserHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->deleteRecipient(Lcom/vkontakte/android/UserProfile;)V

    .line 639
    :goto_0
    return-void

    .line 637
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method
