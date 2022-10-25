.class Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "StickerRecentsPage.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/StickerRecentsPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StickerHolder"
.end annotation


# instance fields
.field private mLastSticker:Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

.field private final mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/stickers/StickersView$Listener;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "l"    # Lcom/vkontakte/android/stickers/StickersView$Listener;

    .prologue
    .line 198
    new-instance v0, Lcom/vk/imageloader/view/VKStickerImageView;

    invoke-direct {v0, p1}, Lcom/vk/imageloader/view/VKStickerImageView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 199
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKStickerImageView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKStickerImageView;->setAspectRatio(F)V

    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->itemView:Landroid/view/View;

    sget v1, Lcom/vkontakte/android/stickers/StickersConfig;->KEYBOARD_PADDING:I

    sget v2, Lcom/vkontakte/android/stickers/StickersConfig;->KEYBOARD_PADDING:I

    sget v3, Lcom/vkontakte/android/stickers/StickersConfig;->KEYBOARD_PADDING:I

    sget v4, Lcom/vkontakte/android/stickers/StickersConfig;->KEYBOARD_PADDING:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    iput-object p2, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    .line 203
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/stickers/Stickers$RecentSticker;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    .prologue
    .line 206
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mLastSticker:Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10003c

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mLastSticker:Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKStickerImageView;

    iget-object v1, p1, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mStockItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v2, p1, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mId:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getServerStickerKeyboardURL(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKStickerImageView;->load(Ljava/lang/String;)V

    .line 209
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mLastSticker:Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mStockItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-boolean v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->purchased:Z

    if-eqz v0, :cond_1

    .line 214
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    if-eqz v0, :cond_0

    .line 215
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mLastSticker:Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    iget-object v1, v1, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mStockItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v1, v1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mLastSticker:Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    iget v2, v2, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mId:I

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mLastSticker:Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    iget-object v3, v3, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mStockItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mLastSticker:Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    iget v4, v4, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mId:I

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getServerStickerKeyboardURL(I)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "keyboard"

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/stickers/StickersView$Listener;->onStickerSelected(IILjava/lang/String;Ljava/lang/String;)V

    .line 221
    :cond_0
    :goto_0
    return-void

    .line 218
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mLastSticker:Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mStockItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

    const-string/jumbo v1, "keyboard"

    iput-object v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->referrer:Ljava/lang/String;

    .line 219
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerRecentsPage$StickerHolder;->mLastSticker:Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mStockItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/content/Context;)V

    goto :goto_0
.end method
