.class Lcom/vkontakte/android/data/PurchasesManager$6;
.super Ljava/lang/Object;
.source "PurchasesManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/PurchasesManager;->showNotEnoughVotesDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/data/PurchasesManager;

.field final synthetic val$price:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/data/PurchasesManager;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/data/PurchasesManager;

    .prologue
    .line 501
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$6;, "Lcom/vkontakte/android/data/PurchasesManager$6;"
    iput-object p1, p0, Lcom/vkontakte/android/data/PurchasesManager$6;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    iput p2, p0, Lcom/vkontakte/android/data/PurchasesManager$6;->val$price:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 504
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager$6;, "Lcom/vkontakte/android/data/PurchasesManager$6;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 505
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "requiredBalance"

    iget v2, p0, Lcom/vkontakte/android/data/PurchasesManager$6;->val$price:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 506
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/VotesFragment;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    iget-object v2, p0, Lcom/vkontakte/android/data/PurchasesManager$6;->this$0:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {v2}, Lcom/vkontakte/android/data/PurchasesManager;->access$300(Lcom/vkontakte/android/data/PurchasesManager;)Landroid/app/Activity;

    move-result-object v2

    const/16 v3, 0x3ea

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Activity;I)Z

    .line 507
    return-void
.end method
