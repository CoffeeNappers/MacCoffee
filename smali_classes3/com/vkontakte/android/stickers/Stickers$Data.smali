.class Lcom/vkontakte/android/stickers/Stickers$Data;
.super Ljava/lang/Object;
.source "Stickers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/Stickers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Data"
.end annotation


# instance fields
.field activatedStickers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field allStickers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field allStickersByStickerId:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field promotedStickers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field recentStickers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/stickers/Stickers$RecentSticker;",
            ">;"
        }
    .end annotation
.end field

.field updates:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 636
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 638
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    .line 640
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->promotedStickers:Ljava/util/List;

    .line 641
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    .line 642
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    .line 643
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickersByStickerId:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/stickers/Stickers$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/stickers/Stickers$1;

    .prologue
    .line 636
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers$Data;-><init>()V

    return-void
.end method


# virtual methods
.method add(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 3
    .param p1, "stickerStockItem"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 647
    iget-boolean v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->promoted:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->purchased:Z

    if-nez v1, :cond_0

    .line 648
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->promotedStickers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 651
    :cond_0
    iget-boolean v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->active:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->purchased:Z

    if-eqz v1, :cond_1

    .line 652
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 654
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    iget v2, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 656
    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->sticker_ids:[I

    if-eqz v1, :cond_2

    .line 657
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->sticker_ids:[I

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 658
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickersByStickerId:Ljava/util/Map;

    iget-object v2, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->sticker_ids:[I

    aget v2, v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 657
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 661
    .end local v0    # "i":I
    :cond_2
    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->disallowed_sticker_ids:[I

    if-eqz v1, :cond_3

    .line 662
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->disallowed_sticker_ids:[I

    array-length v1, v1

    if-ge v0, v1, :cond_3

    .line 663
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickersByStickerId:Ljava/util/Map;

    iget-object v2, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->disallowed_sticker_ids:[I

    aget v2, v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 662
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 666
    .end local v0    # "i":I
    :cond_3
    return-void
.end method

.method addRecent(II)V
    .locals 9
    .param p1, "id"    # I
    .param p2, "stockItemId"    # I

    .prologue
    const/16 v8, 0x20

    const/4 v7, 0x0

    .line 701
    const/4 v0, 0x0

    .line 702
    .local v0, "found":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 703
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    .line 704
    .local v2, "sticker":Lcom/vkontakte/android/stickers/Stickers$RecentSticker;
    iget v3, v2, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mId:I

    if-ne v3, p1, :cond_3

    iget-object v3, v2, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mStockItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v3, v3, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    if-ne v3, p2, :cond_3

    .line 705
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    invoke-static {v3, v7, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 706
    const/4 v0, 0x1

    .line 710
    .end local v2    # "sticker":Lcom/vkontakte/android/stickers/Stickers$RecentSticker;
    :cond_0
    if-nez v0, :cond_1

    .line 711
    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    new-instance v5, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-direct {v5, p1, v3}, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;-><init>(ILcom/vkontakte/android/data/orm/StickerStockItem;)V

    invoke-interface {v4, v7, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 714
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, v8, :cond_2

    .line 715
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {v3, v8, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 717
    :cond_2
    return-void

    .line 702
    .restart local v2    # "sticker":Lcom/vkontakte/android/stickers/Stickers$RecentSticker;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public clearAll()V
    .locals 1

    .prologue
    .line 720
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 721
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 724
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->promotedStickers:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 725
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->promotedStickers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 728
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 729
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 731
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    if-eqz v0, :cond_3

    .line 732
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 735
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickersByStickerId:Ljava/util/Map;

    if-eqz v0, :cond_4

    .line 736
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickersByStickerId:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 738
    :cond_4
    return-void
.end method

.method fillRecents(Ljava/lang/String;)V
    .locals 7
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 685
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 686
    const-string/jumbo v5, ","

    invoke-virtual {p1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 687
    .local v0, "array":[Ljava/lang/String;
    array-length v5, v0

    const/4 v6, 0x2

    if-lt v5, v6, :cond_1

    .line 688
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, v0

    if-ge v1, v5, :cond_1

    .line 689
    aget-object v5, v0, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 690
    .local v4, "stockItemId":I
    add-int/lit8 v5, v1, 0x1

    aget-object v5, v0, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 691
    .local v2, "id":I
    iget-object v5, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 692
    .local v3, "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    if-eqz v3, :cond_0

    .line 693
    iget-object v5, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    new-instance v6, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    invoke-direct {v6, v2, v3}, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;-><init>(ILcom/vkontakte/android/data/orm/StickerStockItem;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 688
    :cond_0
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 698
    .end local v0    # "array":[Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "id":I
    .end local v3    # "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    .end local v4    # "stockItemId":I
    :cond_1
    return-void
.end method

.method serializeRecents()Ljava/lang/String;
    .locals 6

    .prologue
    const/16 v5, 0x2c

    .line 669
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 670
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x1

    .line 671
    .local v0, "firstTime":Z
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    .line 672
    .local v2, "sticker":Lcom/vkontakte/android/stickers/Stickers$RecentSticker;
    if-eqz v0, :cond_0

    .line 673
    const/4 v0, 0x0

    .line 677
    :goto_1
    iget-object v4, v2, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mStockItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v4, v4, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 678
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 679
    iget v4, v2, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mId:I

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 675
    :cond_0
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 681
    .end local v2    # "sticker":Lcom/vkontakte/android/stickers/Stickers$RecentSticker;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
