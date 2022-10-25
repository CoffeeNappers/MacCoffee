.class public Lcom/vkontakte/android/api/market/MarketGoodGetFullPage;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MarketGoodGetFullPage.java"

# interfaces
.implements Lcom/vkontakte/android/data/ServerKeys;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;",
        ">;",
        "Lcom/vkontakte/android/data/ServerKeys;"
    }
.end annotation


# direct methods
.method public constructor <init>(IIZII)V
    .locals 3
    .param p1, "ownerId"    # I
    .param p2, "item_id"    # I
    .param p3, "forceLoadGood"    # Z
    .param p4, "offset"    # I
    .param p5, "count"    # I

    .prologue
    const/4 v2, 0x1

    .line 104
    const-string/jumbo v0, "execute.getMarketItemFullPage"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 105
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "offset"

    invoke-virtual {v0, v1, p4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "need_likes"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 106
    if-eqz p3, :cond_0

    .line 107
    const-string/jumbo v0, "forceLoadGood"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 109
    :cond_0
    const-string/jumbo v0, "func_v"

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 110
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;
    .locals 4
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 115
    :try_start_0
    new-instance v1, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;

    const/4 v3, 0x0

    invoke-direct {v1, p1, v3}, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$1;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    :goto_0
    return-object v1

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    move-object v1, v2

    .line 118
    goto :goto_0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;

    move-result-object v0

    return-object v0
.end method
