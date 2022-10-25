.class Lcom/vkontakte/android/data/PurchasesManager$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PurchasesManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/PurchasesManager;->purchaseFreeItem(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/PurchasesManager$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/data/PurchasesManager;

.field final synthetic val$onSuccess:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

.field final synthetic val$product:Lcom/vkontakte/android/data/PurchasesManager$Product;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/data/PurchasesManager;Landroid/content/Context;Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/data/PurchasesManager;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 269
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$2;, "Lcom/vkontakte/android/data/PurchasesManager$2;"
    iput-object p1, p0, Lcom/vkontakte/android/data/PurchasesManager$2;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    iput-object p3, p0, Lcom/vkontakte/android/data/PurchasesManager$2;->val$product:Lcom/vkontakte/android/data/PurchasesManager$Product;

    iput-object p4, p0, Lcom/vkontakte/android/data/PurchasesManager$2;->val$onSuccess:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/PurchasesManager$Result;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/data/PurchasesManager$Result;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$2;, "Lcom/vkontakte/android/data/PurchasesManager$2;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 272
    iget-object v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->message:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->error_message:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 273
    :cond_0
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$2;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v1}, Lcom/vkontakte/android/data/PurchasesManager;->access$300(Lcom/vkontakte/android/data/PurchasesManager;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    .line 274
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->message:Ljava/lang/String;

    .line 275
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->message:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    .line 276
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 277
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 279
    :cond_1
    iget v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->success:I

    if-eq v0, v3, :cond_2

    iget v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->state:I

    if-ne v0, v3, :cond_3

    .line 280
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$2;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v0, v2}, Lcom/vkontakte/android/data/PurchasesManager;->access$402(Lcom/vkontakte/android/data/PurchasesManager;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$2;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v0, v2}, Lcom/vkontakte/android/data/PurchasesManager;->access$502(Lcom/vkontakte/android/data/PurchasesManager;Lcom/vkontakte/android/data/PurchasesManager$Product;)Lcom/vkontakte/android/data/PurchasesManager$Product;

    .line 282
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$2;->val$product:Lcom/vkontakte/android/data/PurchasesManager$Product;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->afterPurchased(Lcom/vkontakte/android/data/PurchasesManager$Result;)V

    .line 283
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$2;->val$onSuccess:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    if-eqz v0, :cond_3

    .line 284
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$2;->val$onSuccess:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$2;->val$product:Lcom/vkontakte/android/data/PurchasesManager$Product;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;->onSuccess(Ljava/lang/Object;)V

    .line 287
    :cond_3
    return-void

    .line 275
    :cond_4
    iget-object v0, p1, Lcom/vkontakte/android/data/PurchasesManager$Result;->error_message:Ljava/lang/String;

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 269
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$2;, "Lcom/vkontakte/android/data/PurchasesManager$2;"
    check-cast p1, Lcom/vkontakte/android/data/PurchasesManager$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/PurchasesManager$2;->success(Lcom/vkontakte/android/data/PurchasesManager$Result;)V

    return-void
.end method
