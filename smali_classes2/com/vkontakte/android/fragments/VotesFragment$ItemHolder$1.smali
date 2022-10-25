.class Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder$1;
.super Ljava/lang/Object;
.source "VotesFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder;

    .prologue
    .line 269
    iput-object p1, p0, Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder$1;->this$1:Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 272
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder$1;->this$1:Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/VotesFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/VotesFragment;->access$1000(Lcom/vkontakte/android/fragments/VotesFragment;)Lcom/vkontakte/android/data/PurchasesManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder$1;->this$1:Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder;->access$800(Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder;)Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder$1$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder$1$1;-><init>(Lcom/vkontakte/android/fragments/VotesFragment$ItemHolder$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/PurchasesManager;->purchase(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    .line 278
    return-void
.end method
