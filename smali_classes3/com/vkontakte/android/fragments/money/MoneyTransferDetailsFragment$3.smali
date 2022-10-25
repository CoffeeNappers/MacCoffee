.class Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$3;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "MoneyTransferDetailsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->declineTransfer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    .prologue
    .line 187
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .line 191
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.ACTION_MONEY_TRANSFER_CANCELLED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 193
    .local v0, "broadcastIntent":Landroid/content/Intent;
    const-string/jumbo v1, "transfer_id"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->access$000(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)Lcom/vkontakte/android/MoneyTransfer;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/MoneyTransfer;->id:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 194
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 199
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 200
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 187
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$3;->success(Ljava/lang/Integer;)V

    return-void
.end method
