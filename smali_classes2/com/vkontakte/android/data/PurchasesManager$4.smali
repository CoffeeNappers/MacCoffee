.class Lcom/vkontakte/android/data/PurchasesManager$4;
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
        "Lcom/vkontakte/android/data/PurchasesManager$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/data/PurchasesManager;

.field final synthetic val$id:I

.field final synthetic val$orderId:Ljava/lang/String;

.field final synthetic val$productId:Ljava/lang/String;

.field final synthetic val$progress:Landroid/app/ProgressDialog;

.field final synthetic val$service:Lcom/android/vending/billing/IInAppBillingService;

.field final synthetic val$token:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/data/PurchasesManager;Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/data/PurchasesManager;

    .prologue
    .line 456
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$4;, "Lcom/vkontakte/android/data/PurchasesManager$4;"
    iput-object p1, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    iput-object p2, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$service:Lcom/android/vending/billing/IInAppBillingService;

    iput p3, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$id:I

    iput-object p4, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$orderId:Ljava/lang/String;

    iput-object p5, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$productId:Ljava/lang/String;

    iput-object p6, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$token:Ljava/lang/String;

    iput-object p7, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$progress:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vkontakte/android/data/PurchasesManager$Result;)V
    .locals 8
    .param p1, "r"    # Lcom/vkontakte/android/data/PurchasesManager$Result;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$4;, "Lcom/vkontakte/android/data/PurchasesManager$4;"
    const v5, 0x7f080201

    const/4 v4, 0x0

    .line 459
    iget v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->state:I

    if-eqz v0, :cond_0

    iget v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->state:I

    if-gez v0, :cond_1

    iget-boolean v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->error_fatal:Z

    if-eqz v0, :cond_1

    .line 460
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$service:Lcom/android/vending/billing/IInAppBillingService;

    iget v2, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$id:I

    iget-object v3, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$orderId:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$productId:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$token:Ljava/lang/String;

    iget-object v6, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$progress:Landroid/app/ProgressDialog;

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/data/PurchasesManager;->access$700(Lcom/vkontakte/android/data/PurchasesManager;Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V

    .line 480
    :goto_0
    return-void

    .line 461
    :cond_1
    iget v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->state:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 463
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$service:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v1, 0x3

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getPackage()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$token:Ljava/lang/String;

    invoke-interface {v0, v1, v2, v3}, Lcom/android/vending/billing/IInAppBillingService;->consumePurchase(ILjava/lang/String;Ljava/lang/String;)I

    .line 464
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v0}, Lcom/vkontakte/android/data/PurchasesManager;->access$500(Lcom/vkontakte/android/data/PurchasesManager;)Lcom/vkontakte/android/data/PurchasesManager$Product;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->afterPurchased(Lcom/vkontakte/android/data/PurchasesManager$Result;)V

    .line 465
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v0}, Lcom/vkontakte/android/data/PurchasesManager;->access$400(Lcom/vkontakte/android/data/PurchasesManager;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 466
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v0}, Lcom/vkontakte/android/data/PurchasesManager;->access$400(Lcom/vkontakte/android/data/PurchasesManager;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v1}, Lcom/vkontakte/android/data/PurchasesManager;->access$500(Lcom/vkontakte/android/data/PurchasesManager;)Lcom/vkontakte/android/data/PurchasesManager$Product;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;->onSuccess(Ljava/lang/Object;)V

    .line 469
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/PurchasesManager;->access$402(Lcom/vkontakte/android/data/PurchasesManager;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    .line 470
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/PurchasesManager;->access$502(Lcom/vkontakte/android/data/PurchasesManager;Lcom/vkontakte/android/data/PurchasesManager$Product;)Lcom/vkontakte/android/data/PurchasesManager$Product;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 475
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    goto :goto_0

    .line 471
    :catch_0
    move-exception v7

    .line 472
    .local v7, "e":Landroid/os/RemoteException;
    const-string/jumbo v0, "PurchasesManager"

    const-string/jumbo v1, "Error during #consumePurchase"

    invoke-static {v0, v1, v7}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 473
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v0}, Lcom/vkontakte/android/data/PurchasesManager;->access$300(Lcom/vkontakte/android/data/PurchasesManager;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 477
    .end local v7    # "e":Landroid/os/RemoteException;
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v0}, Lcom/vkontakte/android/data/PurchasesManager;->access$300(Lcom/vkontakte/android/data/PurchasesManager;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 478
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$4;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    goto :goto_0
.end method

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
    .line 456
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$4;, "Lcom/vkontakte/android/data/PurchasesManager$4;"
    check-cast p1, Lcom/vkontakte/android/data/PurchasesManager$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/PurchasesManager$4;->accept(Lcom/vkontakte/android/data/PurchasesManager$Result;)V

    return-void
.end method
