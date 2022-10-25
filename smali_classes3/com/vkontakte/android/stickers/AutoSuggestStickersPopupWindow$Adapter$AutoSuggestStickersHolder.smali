.class Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "AutoSuggestStickersPopupWindow.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AutoSuggestStickersHolder"
.end annotation


# instance fields
.field private mId:I

.field private mIsUserSticker:Z

.field final synthetic this$0:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;Landroid/view/View;)V
    .locals 2
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 313
    iput-object p1, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->this$0:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;

    .line 314
    invoke-direct {p0, p2}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 315
    iget-object v0, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    sget v1, Lcom/vkontakte/android/stickers/StickersConfig;->STICKER_AUTOSUGGEST_ITEM_SIZE:I

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setFixedSize(I)V

    .line 317
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 318
    return-void
.end method

.method private getUri()Ljava/lang/String;
    .locals 3

    .prologue
    .line 310
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->this$0:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;->access$100(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;)Lcom/vkontakte/android/data/orm/StickersDictionaryItem;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->base_url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/vkontakte/android/stickers/StickersConfig;->STICKER_AUTOSUGGEST_ITEM_SIZE:I

    const/4 v2, 0x5

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-static {v1, v2}, Lcom/vkontakte/android/data/orm/StickerStockItem;->adjustSize(I[I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "b.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :array_0
    .array-data 4
        0x40
        0x80
        0x100
        0x160
        0x200
    .end array-data
.end method


# virtual methods
.method public bind(IZ)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "isUserSticker"    # Z

    .prologue
    .line 321
    iput p1, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->mId:I

    .line 322
    iput-boolean p2, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->mIsUserSticker:Z

    .line 324
    iget-object v0, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10003c

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 326
    iget-object v1, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->itemView:Landroid/view/View;

    iget-boolean v0, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->mIsUserSticker:Z

    if-eqz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 328
    iget-object v0, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {p0}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 329
    return-void

    .line 326
    :cond_0
    const/high16 v0, 0x3f000000    # 0.5f

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 334
    iget-boolean v2, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->mIsUserSticker:Z

    if-eqz v2, :cond_3

    .line 335
    iget-object v2, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->this$0:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;->access$200(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;)Lcom/vkontakte/android/stickers/StickersView$Listener;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 336
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->mId:I

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/stickers/Stickers;->getByStickerId(I)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v1

    .line 338
    .local v1, "stockItem":Lcom/vkontakte/android/data/orm/StickerStockItem;
    if-eqz v1, :cond_0

    .line 339
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->mId:I

    iget v4, v1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/stickers/Stickers;->addRecent(II)V

    .line 342
    :cond_0
    if-nez v1, :cond_2

    const/4 v0, 0x0

    .line 343
    .local v0, "packId":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->this$0:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;->access$200(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;)Lcom/vkontakte/android/stickers/StickersView$Listener;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->mId:I

    invoke-direct {p0}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->getUri()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "suggestion_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->this$0:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;

    invoke-static {v6}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;->access$100(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;)Lcom/vkontakte/android/data/orm/StickersDictionaryItem;

    move-result-object v6

    iget-object v6, v6, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->dictionary_key:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v0, v3, v4, v5}, Lcom/vkontakte/android/stickers/StickersView$Listener;->onStickerSelected(IILjava/lang/String;Ljava/lang/String;)V

    .line 352
    .end local v0    # "packId":I
    .end local v1    # "stockItem":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :cond_1
    :goto_1
    return-void

    .line 342
    .restart local v1    # "stockItem":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :cond_2
    iget v0, v1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    goto :goto_0

    .line 346
    .end local v1    # "stockItem":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :cond_3
    iget v2, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->mId:I

    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter$AutoSuggestStickersHolder;->this$0:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;

    .line 348
    invoke-static {v3}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;->access$100(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;)Lcom/vkontakte/android/data/orm/StickersDictionaryItem;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->dictionary_key:Ljava/lang/String;

    invoke-static {v3}, Lcom/vkontakte/android/data/orm/Product;->getReferrerSuggestion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 349
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    const/4 v5, 0x1

    .line 346
    invoke-static {v2, v3, v4, v5}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->showByStickerId(ILjava/lang/String;Landroid/app/Activity;Z)V

    goto :goto_1
.end method
