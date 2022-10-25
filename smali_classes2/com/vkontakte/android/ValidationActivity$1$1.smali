.class Lcom/vkontakte/android/ValidationActivity$1$1;
.super Ljava/lang/Object;
.source "ValidationActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ValidationActivity$1;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
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
        "Lcom/vkontakte/android/data/PurchasesManager$Product;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ValidationActivity$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ValidationActivity$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ValidationActivity$1;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/vkontakte/android/ValidationActivity$1$1;->this$1:Lcom/vkontakte/android/ValidationActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vkontakte/android/data/PurchasesManager$Product;)V
    .locals 3
    .param p1, "product"    # Lcom/vkontakte/android/data/PurchasesManager$Product;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity$1$1;->this$1:Lcom/vkontakte/android/ValidationActivity$1;

    iget-object v0, v0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    new-instance v1, Lcom/vkontakte/android/data/PurchasesManager;

    iget-object v2, p0, Lcom/vkontakte/android/ValidationActivity$1$1;->this$1:Lcom/vkontakte/android/ValidationActivity$1;

    iget-object v2, v2, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/data/PurchasesManager;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1}, Lcom/vkontakte/android/data/PurchasesManager;->ignoreValidation()Lcom/vkontakte/android/data/PurchasesManager;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ValidationActivity;->access$102(Lcom/vkontakte/android/ValidationActivity;Lcom/vkontakte/android/data/PurchasesManager;)Lcom/vkontakte/android/data/PurchasesManager;

    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity$1$1;->this$1:Lcom/vkontakte/android/ValidationActivity$1;

    iget-object v0, v0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-static {v0}, Lcom/vkontakte/android/ValidationActivity;->access$100(Lcom/vkontakte/android/ValidationActivity;)Lcom/vkontakte/android/data/PurchasesManager;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ValidationActivity$1$1$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ValidationActivity$1$1$1;-><init>(Lcom/vkontakte/android/ValidationActivity$1$1;)V

    invoke-virtual {v0, p1, v1}, Lcom/vkontakte/android/data/PurchasesManager;->purchase(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    .line 96
    return-void
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
    .line 82
    check-cast p1, Lcom/vkontakte/android/data/PurchasesManager$Product;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ValidationActivity$1$1;->accept(Lcom/vkontakte/android/data/PurchasesManager$Product;)V

    return-void
.end method
