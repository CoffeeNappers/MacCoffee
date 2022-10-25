.class public Lcom/vkontakte/android/api/store/GetStockItemByProductId;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "GetStockItemByProductId.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/data/PurchasesManager$Product;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 13
    const-string/jumbo v0, "store.getStockItemByProductId"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 14
    const-string/jumbo v0, "merchant"

    const-string/jumbo v1, "google"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/store/GetStockItemByProductId;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/PurchasesManager$Product;
    .locals 6
    .param p1, "source"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 29
    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 30
    .local v0, "response":Lorg/json/JSONObject;
    const-string/jumbo v2, "product"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v4, "type"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 31
    .local v1, "type":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v2, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 37
    new-instance v2, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-direct {v2, v0, v3}, Lcom/vkontakte/android/data/orm/StickerStockItem;-><init>(Lorg/json/JSONObject;I)V

    :goto_1
    return-object v2

    .line 31
    :sswitch_0
    const-string/jumbo v5, "subscriptions"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v2, v3

    goto :goto_0

    :sswitch_1
    const-string/jumbo v5, "votes"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    .line 33
    :pswitch_0
    new-instance v2, Lcom/vkontakte/android/data/Subscription;

    invoke-direct {v2, v0}, Lcom/vkontakte/android/data/Subscription;-><init>(Lorg/json/JSONObject;)V

    goto :goto_1

    .line 35
    :pswitch_1
    new-instance v2, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;

    invoke-direct {v2, v0}, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;-><init>(Lorg/json/JSONObject;)V

    goto :goto_1

    .line 31
    nop

    :sswitch_data_0
    .sparse-switch
        0x6b30ac9 -> :sswitch_1
        0x7674caf6 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 10
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/store/GetStockItemByProductId;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/PurchasesManager$Product;

    move-result-object v0

    return-object v0
.end method

.method public productId(I)Lcom/vkontakte/android/api/store/GetStockItemByProductId;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 23
    const-string/jumbo v0, "product_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/store/GetStockItemByProductId;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 24
    return-object p0
.end method

.method public type(Ljava/lang/String;)Lcom/vkontakte/android/api/store/GetStockItemByProductId;
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 18
    const-string/jumbo v0, "type"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/store/GetStockItemByProductId;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    return-object p0
.end method
