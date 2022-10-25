.class Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "StickerPage.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/StickerPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StickerHolder"
.end annotation


# static fields
.field private static final ID:I


# instance fields
.field private final item:Lcom/vkontakte/android/data/orm/StickerStockItem;

.field private mId:I

.field private final mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/stickers/StickersView$Listener;Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "l"    # Lcom/vkontakte/android/stickers/StickersView$Listener;
    .param p3, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 157
    new-instance v0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder$1;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder$1;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKStickerImageView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKStickerImageView;->setAspectRatio(F)V

    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->itemView:Landroid/view/View;

    sget v1, Lcom/vkontakte/android/stickers/StickersConfig;->KEYBOARD_PADDING:I

    sget v2, Lcom/vkontakte/android/stickers/StickersConfig;->KEYBOARD_PADDING:I

    sget v3, Lcom/vkontakte/android/stickers/StickersConfig;->KEYBOARD_PADDING:I

    sget v4, Lcom/vkontakte/android/stickers/StickersConfig;->KEYBOARD_PADDING:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 165
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    iput-object p2, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    .line 167
    iput-object p3, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 168
    return-void
.end method


# virtual methods
.method public bind(I)V
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 171
    iput p1, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->mId:I

    .line 172
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10003c

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 173
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/data/orm/StickerStockItem;->isAllowedSticker(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getServerStickerKeyboardURL(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 175
    return-void

    .line 173
    :cond_0
    const v0, 0x3e99999a    # 0.3f

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-boolean v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->purchased:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v1, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->mId:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/orm/StickerStockItem;->isAllowedSticker(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 180
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->mId:I

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v2, v2, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/stickers/Stickers;->addRecent(II)V

    .line 181
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v1, v1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    iget v2, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->mId:I

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v4, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->mId:I

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getServerStickerKeyboardURL(I)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "keyboard"

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/stickers/StickersView$Listener;->onStickerSelected(IILjava/lang/String;Ljava/lang/String;)V

    .line 188
    :cond_0
    :goto_0
    return-void

    .line 185
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    const-string/jumbo v1, "keyboard"

    iput-object v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->referrer:Ljava/lang/String;

    .line 186
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/content/Context;)V

    goto :goto_0
.end method
