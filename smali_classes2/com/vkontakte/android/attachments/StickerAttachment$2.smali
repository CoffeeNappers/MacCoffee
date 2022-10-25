.class Lcom/vkontakte/android/attachments/StickerAttachment$2;
.super Ljava/lang/Object;
.source "StickerAttachment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/StickerAttachment;->getFullView(Landroid/content/Context;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/StickerAttachment;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/StickerAttachment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/StickerAttachment;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/vkontakte/android/attachments/StickerAttachment$2;->this$0:Lcom/vkontakte/android/attachments/StickerAttachment;

    iput-object p2, p0, Lcom/vkontakte/android/attachments/StickerAttachment$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 108
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/StickerAttachment$2;->this$0:Lcom/vkontakte/android/attachments/StickerAttachment;

    iget v2, v2, Lcom/vkontakte/android/attachments/StickerAttachment;->packID:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/stickers/Stickers;->getById(I)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    .line 109
    .local v0, "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    if-eqz v0, :cond_1

    iget-boolean v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->active:Z

    if-nez v1, :cond_0

    iget-boolean v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->promoted:Z

    if-eqz v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/StickerAttachment$2;->this$0:Lcom/vkontakte/android/attachments/StickerAttachment;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/StickerAttachment;->access$000(Lcom/vkontakte/android/attachments/StickerAttachment;)Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 110
    iget-object v1, p0, Lcom/vkontakte/android/attachments/StickerAttachment$2;->this$0:Lcom/vkontakte/android/attachments/StickerAttachment;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/StickerAttachment;->access$000(Lcom/vkontakte/android/attachments/StickerAttachment;)Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/StickerAttachment$2;->this$0:Lcom/vkontakte/android/attachments/StickerAttachment;

    iget v2, v2, Lcom/vkontakte/android/attachments/StickerAttachment;->packID:I

    invoke-interface {v1, v2}, Lcom/vkontakte/android/attachments/StickerAttachment$Callback;->openStickerKeyboard(I)V

    .line 120
    :goto_0
    return-void

    .line 112
    :cond_1
    if-nez v0, :cond_2

    .line 114
    iget-object v1, p0, Lcom/vkontakte/android/attachments/StickerAttachment$2;->this$0:Lcom/vkontakte/android/attachments/StickerAttachment;

    iget v1, v1, Lcom/vkontakte/android/attachments/StickerAttachment;->packID:I

    const-string/jumbo v2, "message"

    iget-object v3, p0, Lcom/vkontakte/android/attachments/StickerAttachment$2;->val$context:Landroid/content/Context;

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(ILjava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    .line 116
    :cond_2
    const-string/jumbo v1, "message"

    iput-object v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->referrer:Ljava/lang/String;

    .line 117
    iget-object v1, p0, Lcom/vkontakte/android/attachments/StickerAttachment$2;->val$context:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/content/Context;)V

    goto :goto_0
.end method
