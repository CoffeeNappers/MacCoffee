.class Lcom/vkontakte/android/data/PurchasesManager$5;
.super Ljava/lang/Object;
.source "PurchasesManager.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/PurchasesManager;->consumePurchase(Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/data/PurchasesManager;

.field final synthetic val$progress:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/data/PurchasesManager;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/data/PurchasesManager;

    .prologue
    .line 481
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$5;, "Lcom/vkontakte/android/data/PurchasesManager$5;"
    iput-object p1, p0, Lcom/vkontakte/android/data/PurchasesManager$5;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    iput-object p2, p0, Lcom/vkontakte/android/data/PurchasesManager$5;->val$progress:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 481
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$5;, "Lcom/vkontakte/android/data/PurchasesManager$5;"
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/PurchasesManager$5;->accept(Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "throwable"    # Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 484
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$5;, "Lcom/vkontakte/android/data/PurchasesManager$5;"
    instance-of v1, p1, Lcom/vkontakte/android/api/APIException;

    if-eqz v1, :cond_1

    .line 485
    check-cast p1, Lcom/vkontakte/android/api/APIException;

    .end local p1    # "throwable":Ljava/lang/Throwable;
    iget-object v0, p1, Lcom/vkontakte/android/api/APIException;->errorResponse:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .line 486
    .local v0, "err":Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    if-eqz v0, :cond_0

    .line 487
    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$5;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v1}, Lcom/vkontakte/android/data/PurchasesManager;->access$300(Lcom/vkontakte/android/data/PurchasesManager;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v2

    iget-object v3, v0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 489
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$5;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 493
    .end local v0    # "err":Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    :goto_0
    return-void

    .line 491
    .restart local p1    # "throwable":Ljava/lang/Throwable;
    :cond_1
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
