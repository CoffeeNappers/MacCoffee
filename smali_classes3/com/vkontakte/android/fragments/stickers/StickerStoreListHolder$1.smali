.class Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder$1;
.super Ljava/lang/Object;
.source "StickerStoreListHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;-><init>(Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->getIsPurchaseNotAllowedWithReason(Lcom/vkontakte/android/data/orm/StickerStockItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-object v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->no_purchase_reason:Ljava/lang/String;

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 76
    :goto_0
    return-void

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->access$000(Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;)Landroid/view/View$OnClickListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method
