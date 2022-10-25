.class Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "MoneyTransferHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->onClick(Landroid/view/View;)V
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
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;

.field final synthetic val$id:I

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;Landroid/view/View;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;->this$0:Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;

    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;->val$view:Landroid/view/View;

    iput p3, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;->val$id:I

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .line 149
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;->val$view:Landroid/view/View;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;->val$view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 150
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.ACTION_MONEY_TRANSFER_CANCELLED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 152
    .local v0, "broadcastIntent":Landroid/content/Intent;
    const-string/jumbo v1, "transfer_id"

    iget v2, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;->val$id:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 153
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;->val$view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 156
    .end local v0    # "broadcastIntent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 146
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;->success(Ljava/lang/Integer;)V

    return-void
.end method
