.class Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$1;
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
        "Lcom/vkontakte/android/MoneyTransfer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;

    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$1;->val$view:Landroid/view/View;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/MoneyTransfer;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/MoneyTransfer;

    .prologue
    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$1;->val$view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iget-object v1, p1, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    iget v2, p1, Lcom/vkontakte/android/MoneyTransfer;->id:I

    const/4 v3, 0x2

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->start(Landroid/app/Activity;Ljava/lang/String;II)V

    .line 136
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 132
    check-cast p1, Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$1;->success(Lcom/vkontakte/android/MoneyTransfer;)V

    return-void
.end method
