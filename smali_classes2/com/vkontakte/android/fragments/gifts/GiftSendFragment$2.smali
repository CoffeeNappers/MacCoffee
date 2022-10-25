.class Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;
.super Ljava/lang/Object;
.source "GiftSendFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->sendGift()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/gifts/GiftsSend$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .prologue
    .line 382
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 397
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v1

    const/16 v2, 0x1f8

    if-ne v1, v2, :cond_0

    .line 399
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 400
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "requiredBalance"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mTotalPrice:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 401
    const-class v1, Lcom/vkontakte/android/fragments/VotesFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 405
    .end local v0    # "args":Landroid/os/Bundle;
    :goto_0
    return-void

    .line 403
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v2

    iget-object v3, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0
.end method

.method public success(Lcom/vkontakte/android/api/gifts/GiftsSend$Result;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/api/gifts/GiftsSend$Result;

    .prologue
    .line 386
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 387
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x1

    if-le v0, v2, :cond_1

    const v0, 0x7f080296

    :goto_0
    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 388
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mBalance:I

    iget v2, p1, Lcom/vkontakte/android/api/gifts/GiftsSend$Result;->withdrawn_votes:I

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->notifyBalanceHasChanged(I)V

    .line 389
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v2, p1, Lcom/vkontakte/android/api/gifts/GiftsSend$Result;->user_ids:[I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->notifyGiftHasSent(Lcom/vkontakte/android/api/models/CatalogedGift;[I)V

    .line 390
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 393
    :cond_0
    return-void

    .line 387
    :cond_1
    const v0, 0x7f08028a

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 382
    check-cast p1, Lcom/vkontakte/android/api/gifts/GiftsSend$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$2;->success(Lcom/vkontakte/android/api/gifts/GiftsSend$Result;)V

    return-void
.end method
