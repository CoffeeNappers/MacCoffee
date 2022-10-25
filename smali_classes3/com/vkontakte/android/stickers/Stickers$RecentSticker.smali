.class public Lcom/vkontakte/android/stickers/Stickers$RecentSticker;
.super Ljava/lang/Object;
.source "Stickers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/Stickers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RecentSticker"
.end annotation


# instance fields
.field public final mId:I

.field public mStockItem:Lcom/vkontakte/android/data/orm/StickerStockItem;


# direct methods
.method public constructor <init>(ILcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 826
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 827
    iput p1, p0, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mId:I

    .line 828
    iput-object p2, p0, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mStockItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 829
    return-void
.end method

.method public static create(ILjava/util/Collection;)Lcom/vkontakte/android/stickers/Stickers$RecentSticker;
    .locals 6
    .param p0, "id"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;)",
            "Lcom/vkontakte/android/stickers/Stickers$RecentSticker;"
        }
    .end annotation

    .prologue
    .line 814
    .local p1, "items":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 815
    .local v0, "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    iget-object v2, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->sticker_ids:[I

    if-eqz v2, :cond_0

    .line 816
    iget-object v4, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->sticker_ids:[I

    array-length v5, v4

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v5, :cond_0

    aget v1, v4, v2

    .line 817
    .local v1, "sticker_id":I
    if-ne p0, v1, :cond_1

    .line 818
    new-instance v2, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;-><init>(ILcom/vkontakte/android/data/orm/StickerStockItem;)V

    .line 823
    .end local v0    # "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    .end local v1    # "sticker_id":I
    :goto_1
    return-object v2

    .line 816
    .restart local v0    # "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    .restart local v1    # "sticker_id":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 823
    .end local v0    # "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    .end local v1    # "sticker_id":I
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method
