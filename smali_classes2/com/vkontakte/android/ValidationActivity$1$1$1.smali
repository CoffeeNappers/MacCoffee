.class Lcom/vkontakte/android/ValidationActivity$1$1$1;
.super Ljava/lang/Object;
.source "ValidationActivity.java"

# interfaces
.implements Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ValidationActivity$1$1;->accept(Lcom/vkontakte/android/data/PurchasesManager$Product;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
        "<",
        "Lcom/vkontakte/android/data/PurchasesManager$Product;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vkontakte/android/ValidationActivity$1$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ValidationActivity$1$1;)V
    .locals 0
    .param p1, "this$2"    # Lcom/vkontakte/android/ValidationActivity$1$1;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/vkontakte/android/ValidationActivity$1$1$1;->this$2:Lcom/vkontakte/android/ValidationActivity$1$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccess(Lcom/vkontakte/android/data/PurchasesManager$Product;)V
    .locals 3
    .param p1, "o"    # Lcom/vkontakte/android/data/PurchasesManager$Product;

    .prologue
    .line 89
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 90
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "access_token"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getAccessToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 91
    iget-object v1, p0, Lcom/vkontakte/android/ValidationActivity$1$1$1;->this$2:Lcom/vkontakte/android/ValidationActivity$1$1;

    iget-object v1, v1, Lcom/vkontakte/android/ValidationActivity$1$1;->this$1:Lcom/vkontakte/android/ValidationActivity$1;

    iget-object v1, v1, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/ValidationActivity;->setResult(ILandroid/content/Intent;)V

    .line 92
    const/4 v1, 0x2

    sput v1, Lcom/vkontakte/android/ValidationActivity;->result:I

    .line 93
    iget-object v1, p0, Lcom/vkontakte/android/ValidationActivity$1$1$1;->this$2:Lcom/vkontakte/android/ValidationActivity$1$1;

    iget-object v1, v1, Lcom/vkontakte/android/ValidationActivity$1$1;->this$1:Lcom/vkontakte/android/ValidationActivity$1;

    iget-object v1, v1, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/ValidationActivity;->finish()V

    .line 94
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 86
    check-cast p1, Lcom/vkontakte/android/data/PurchasesManager$Product;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ValidationActivity$1$1$1;->onSuccess(Lcom/vkontakte/android/data/PurchasesManager$Product;)V

    return-void
.end method
