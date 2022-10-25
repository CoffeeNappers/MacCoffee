.class final Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "MoneyTransferDetailsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->show(IIILandroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
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
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    iput-object p2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$1;->val$context:Landroid/content/Context;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/MoneyTransfer;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/MoneyTransfer;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$1;->val$context:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->show(Lcom/vkontakte/android/MoneyTransfer;Landroid/content/Context;)V

    .line 50
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 46
    check-cast p1, Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$1;->success(Lcom/vkontakte/android/MoneyTransfer;)V

    return-void
.end method
