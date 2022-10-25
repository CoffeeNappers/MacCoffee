.class Lcom/vkontakte/android/stickers/Stickers$GetInfo;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "Stickers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/Stickers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GetInfo"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/stickers/Stickers$Data;",
        ">;"
    }
.end annotation


# instance fields
.field final mStickers:Lcom/vkontakte/android/stickers/Stickers;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/stickers/Stickers;)V
    .locals 4
    .param p1, "stickers"    # Lcom/vkontakte/android/stickers/Stickers;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 762
    const-string/jumbo v2, "execute.getStickerProducts"

    invoke-direct {p0, v2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 763
    iput-object p1, p0, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->mStickers:Lcom/vkontakte/android/stickers/Stickers;

    .line 764
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->setBackground(Z)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 765
    const-string/jumbo v2, "type"

    const-string/jumbo v3, "stickers"

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 766
    const-string/jumbo v2, "merchant"

    const-string/jumbo v3, "google"

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 767
    const-string/jumbo v2, "filters"

    const-string/jumbo v3, "purchased,active,promoted,free,new"

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 768
    const-string/jumbo v2, "func_v"

    const/4 v3, 0x2

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 769
    const-string/jumbo v2, "force_inapp"

    invoke-virtual {p0, v2, v1}, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 770
    const-string/jumbo v2, "no_inapp"

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->canUseInApps()Z

    move-result v3

    if-nez v3, :cond_0

    :goto_0
    invoke-virtual {p0, v2, v0}, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 771
    return-void

    :cond_0
    move v0, v1

    .line 770
    goto :goto_0
.end method

.method static synthetic lambda$parse$0(Lcom/vkontakte/android/data/orm/StickerStockItem;)Lcom/vkontakte/android/data/orm/StickerStockItem;
    .locals 0
    .param p0, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 789
    return-object p0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/stickers/Stickers$Data;
    .locals 11
    .param p1, "source"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 775
    new-instance v0, Lcom/vkontakte/android/stickers/Stickers$Data;

    const/4 v9, 0x0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/stickers/Stickers$Data;-><init>(Lcom/vkontakte/android/stickers/Stickers$1;)V

    .line 776
    .local v0, "data":Lcom/vkontakte/android/stickers/Stickers$Data;
    const-string/jumbo v9, "response"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 778
    .local v5, "response":Lorg/json/JSONObject;
    const-string/jumbo v9, "stickers"

    invoke-static {v5, v9}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v8

    .line 780
    .local v8, "stickers":Lcom/vkontakte/android/api/JSONArrayWithCount;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v9, v8, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v1, v9, :cond_0

    .line 782
    :try_start_0
    new-instance v9, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-object v10, v8, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    invoke-virtual {v10, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    invoke-direct {v9, v10, v1}, Lcom/vkontakte/android/data/orm/StickerStockItem;-><init>(Lorg/json/JSONObject;I)V

    invoke-virtual {v0, v9}, Lcom/vkontakte/android/stickers/Stickers$Data;->add(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 780
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 788
    :cond_0
    iget-object v9, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    .line 789
    .local v2, "items":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    iget-object v9, p0, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->mStickers:Lcom/vkontakte/android/stickers/Stickers;

    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers$GetInfo$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/functions/F1;

    move-result-object v10

    invoke-virtual {v9, v2, v10}, Lcom/vkontakte/android/stickers/Stickers;->fillLocalInfo(Ljava/util/Collection;Lcom/vkontakte/android/functions/F1;)V

    .line 791
    const-string/jumbo v9, "recent"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 792
    .local v4, "recent":Lorg/json/JSONObject;
    const-string/jumbo v9, "sticker_ids"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 793
    .local v7, "sticker_ids":Lorg/json/JSONArray;
    if-eqz v7, :cond_2

    .line 794
    const/16 v9, 0x20

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 795
    .local v3, "len":I
    const/4 v1, 0x0

    :goto_2
    if-ge v1, v3, :cond_2

    .line 796
    invoke-virtual {v7, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v9

    invoke-static {v9, v2}, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->create(ILjava/util/Collection;)Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    move-result-object v6

    .line 797
    .local v6, "sticker":Lcom/vkontakte/android/stickers/Stickers$RecentSticker;
    if-eqz v6, :cond_1

    .line 798
    iget-object v9, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    invoke-interface {v9, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 795
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 802
    .end local v3    # "len":I
    .end local v6    # "sticker":Lcom/vkontakte/android/stickers/Stickers$RecentSticker;
    :cond_2
    const-string/jumbo v9, "updates"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    iput v9, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->updates:I

    .line 804
    return-object v0

    .line 783
    .end local v2    # "items":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    .end local v4    # "recent":Lorg/json/JSONObject;
    .end local v7    # "sticker_ids":Lorg/json/JSONArray;
    :catch_0
    move-exception v9

    goto :goto_1
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 757
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/stickers/Stickers$Data;

    move-result-object v0

    return-object v0
.end method
