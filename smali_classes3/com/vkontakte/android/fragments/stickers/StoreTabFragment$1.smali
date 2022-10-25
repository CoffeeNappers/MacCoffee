.class Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$1;
.super Ljava/lang/Object;
.source "StoreTabFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$onClick$0(Landroid/view/View;)V
    .locals 1
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 50
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 49
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 50
    invoke-static {p1}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$1$$Lambda$1;->lambdaFactory$(Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x12c

    invoke-virtual {p1, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 53
    .local v0, "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    iget-boolean v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->purchased:Z

    if-nez v1, :cond_0

    .line 54
    const-string/jumbo v1, "store"

    iput-object v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->referrer:Ljava/lang/String;

    .line 55
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$000(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/data/PurchasesManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/data/PurchasesManager;->purchase(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    .line 57
    :cond_0
    return-void
.end method
