.class public Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;
.super Ljava/lang/Object;
.source "GetGiftsStockBalance.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/store/GetGiftsStockBalance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Result"
.end annotation


# instance fields
.field public balance:I

.field public products:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/api/store/GetGiftsStockBalance;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/api/store/GetGiftsStockBalance;Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "this$0"    # Lcom/vkontakte/android/api/store/GetGiftsStockBalance;
    .param p2, "source"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;
        }
    .end annotation

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;->this$0:Lcom/vkontakte/android/api/store/GetGiftsStockBalance;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const-string/jumbo v2, "balance"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 44
    .local v1, "votes":Lorg/json/JSONObject;
    if-nez v1, :cond_0

    const/4 v2, 0x0

    :goto_0
    iput v2, p0, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;->balance:I

    .line 45
    new-instance v2, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v3, "products"

    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Ljava/lang/Class;)V

    iput-object v2, p0, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;->products:Lcom/vkontakte/android/data/VKList;

    .line 47
    iget-object v2, p0, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;->products:Lcom/vkontakte/android/data/VKList;

    new-instance v3, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result$1;

    invoke-direct {v3, p0, p1}, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result$1;-><init>(Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;Lcom/vkontakte/android/api/store/GetGiftsStockBalance;)V

    invoke-static {v2, v3}, Lcom/vkontakte/android/functions/Functions;->map(Ljava/util/Collection;Lcom/vkontakte/android/functions/F1;)Ljava/util/Map;

    move-result-object v0

    .line 54
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;>;"
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->canUseInApps()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 55
    new-instance v2, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result$2;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result$2;-><init>(Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;Lcom/vkontakte/android/api/store/GetGiftsStockBalance;)V

    invoke-static {v0, v2}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayPrices(Ljava/util/Map;Lcom/vkontakte/android/functions/F2;)V

    .line 65
    return-void

    .line 44
    .end local v0    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;>;"
    :cond_0
    const-string/jumbo v2, "votes"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_0

    .line 63
    .restart local v0    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/vkontakte/android/api/store/GetGiftsStockBalance$VotesProduct;>;"
    :cond_1
    new-instance v2, Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;

    invoke-direct {v2}, Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;-><init>()V

    throw v2
.end method
