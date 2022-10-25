.class public Lcom/vkontakte/android/api/orders/OrdersBuyItem;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "OrdersBuyItem.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/Order;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .param p1, "appId"    # I
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "item"    # Ljava/lang/String;
    .param p4, "orderId"    # I

    .prologue
    .line 18
    const-string/jumbo v0, "orders.buyItem"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 19
    const-string/jumbo v0, "app_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/orders/OrdersBuyItem;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 20
    const-string/jumbo v0, "type"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/orders/OrdersBuyItem;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 21
    const-string/jumbo v0, "item"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/orders/OrdersBuyItem;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 23
    if-eqz p4, :cond_0

    .line 24
    const-string/jumbo v0, "order_id"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/orders/OrdersBuyItem;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 26
    :cond_0
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/Order;
    .locals 3
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 34
    .local v1, "response":Lorg/json/JSONObject;
    new-instance v0, Lcom/vkontakte/android/api/Order;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/Order;-><init>(Lorg/json/JSONObject;)V

    .line 36
    .local v0, "order":Lcom/vkontakte/android/api/Order;
    return-object v0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/orders/OrdersBuyItem;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/Order;

    move-result-object v0

    return-object v0
.end method
