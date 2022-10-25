.class Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ProfileGiftsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->lambda$showGiftDeleteDialog$1(Lcom/vkontakte/android/api/models/GiftItem;Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

.field final synthetic val$giftItem:Lcom/vkontakte/android/api/models/GiftItem;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;Lcom/vkontakte/android/api/models/GiftItem;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;->val$giftItem:Lcom/vkontakte/android/api/models/GiftItem;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 161
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->access$600(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;->val$giftItem:Lcom/vkontakte/android/api/models/GiftItem;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->updateList()V

    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f080286

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 166
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 158
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$1;->success(Ljava/lang/Boolean;)V

    return-void
.end method
