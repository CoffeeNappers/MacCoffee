.class Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "EditorStickerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/stickers/EditorStickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StickerHolder"
.end annotation


# instance fields
.field private item:Lcom/vkontakte/android/data/orm/StickerStockItem;

.field private mId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;

    .prologue
    .line 241
    new-instance v1, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder$1;

    invoke-direct {v1, p1}, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder$1;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 247
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->itemView:Landroid/view/View;

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(F)V

    .line 249
    const/16 v1, 0x8

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    .line 250
    .local v0, "p":I
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 252
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->itemView:Landroid/view/View;

    invoke-static {p0, p2}, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 265
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/data/orm/StickerStockItem;I)V
    .locals 3
    .param p1, "ssi"    # Lcom/vkontakte/android/data/orm/StickerStockItem;
    .param p2, "id"    # I

    .prologue
    .line 268
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 269
    iput p2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->mId:I

    .line 270
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/data/orm/StickerStockItem;->isAllowedSticker(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 271
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0, p1, p2}, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->getEditorURL(Lcom/vkontakte/android/data/orm/StickerStockItem;I)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/vk/imageloader/ImageSize;->SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0, v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 272
    return-void

    .line 270
    :cond_0
    const v0, 0x3e99999a    # 0.3f

    goto :goto_0
.end method

.method public getEditorURL(Lcom/vkontakte/android/data/orm/StickerStockItem;I)Ljava/lang/String;
    .locals 3
    .param p1, "ssi"    # Lcom/vkontakte/android/data/orm/StickerStockItem;
    .param p2, "id"    # I

    .prologue
    .line 275
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->stickers_base_url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x3

    const/4 v2, 0x5

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-static {v1, v2}, Lcom/vkontakte/android/data/orm/StickerStockItem;->adjustSize(I[I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x40
        0x80
        0x100
        0x160
        0x200
    .end array-data
.end method

.method synthetic lambda$new$1(Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;Landroid/view/View;)V
    .locals 4
    .param p1, "listener"    # Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 253
    invoke-static {}, Lcom/vk/attachpicker/stickers/EditorStickerView;->access$300()Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 264
    :cond_0
    :goto_0
    return-void

    .line 256
    :cond_1
    invoke-static {}, Lcom/vk/attachpicker/stickers/EditorStickerView;->access$300()Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 258
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-boolean v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->purchased:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->mId:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/orm/StickerStockItem;->isAllowedSticker(I)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 259
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    iget v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->mId:I

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v3, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->mId:I

    invoke-virtual {p0, v2, v3}, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->getEditorURL(Lcom/vkontakte/android/data/orm/StickerStockItem;I)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "keyboard"

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;->onStickerSelected(IILjava/lang/String;Ljava/lang/String;)V

    .line 260
    invoke-static {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x1f4

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0
.end method

.method synthetic lambda$null$0()V
    .locals 3

    .prologue
    .line 261
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    iget v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->mId:I

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v2, v2, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/stickers/Stickers;->addRecent(II)V

    .line 262
    return-void
.end method
