.class Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "MoneyTransferDetailsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->lambda$onViewCreated$0(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/MoneyTransfer;",
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
    .line 156
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/MoneyTransfer;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/MoneyTransfer;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->access$002(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;Lcom/vkontakte/android/MoneyTransfer;)Lcom/vkontakte/android/MoneyTransfer;

    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->access$100(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)V

    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->access$000(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)Lcom/vkontakte/android/MoneyTransfer;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->access$000(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)Lcom/vkontakte/android/MoneyTransfer;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/MoneyTransfer;->id:I

    const/4 v3, 0x2

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->start(Landroid/app/Fragment;Ljava/lang/String;II)V

    .line 162
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 156
    check-cast p1, Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$2;->success(Lcom/vkontakte/android/MoneyTransfer;)V

    return-void
.end method
