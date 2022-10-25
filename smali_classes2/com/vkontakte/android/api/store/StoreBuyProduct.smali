.class public Lcom/vkontakte/android/api/store/StoreBuyProduct;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "StoreBuyProduct.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/data/PurchasesManager$Result;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "productID"    # I
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "referrer"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 16
    const-string/jumbo v4, "store.buyProduct"

    invoke-direct {p0, v4}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 17
    const-string/jumbo v4, "type"

    invoke-virtual {p0, v4, p2}, Lcom/vkontakte/android/api/store/StoreBuyProduct;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 18
    const-string/jumbo v4, "product_id"

    invoke-virtual {p0, v4, p1}, Lcom/vkontakte/android/api/store/StoreBuyProduct;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    if-eqz p3, :cond_0

    const-string/jumbo v4, ""

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 20
    const-string/jumbo v4, "sticker_referrer"

    invoke-virtual {p0, v4, p3}, Lcom/vkontakte/android/api/store/StoreBuyProduct;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 22
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 23
    .local v0, "accessToken":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x4

    if-ge v4, v5, :cond_2

    :cond_1
    const-string/jumbo v0, "0000"

    .line 24
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr v4, v5

    const/4 v5, 0x2

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    shl-int/lit8 v5, v5, 0x10

    or-int/2addr v4, v5

    const/4 v5, 0x3

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    shl-int/lit8 v5, v5, 0x18

    or-int/2addr v4, v5

    xor-int v1, p1, v4

    .line 25
    .local v1, "guid":I
    const-string/jumbo v4, "guid"

    invoke-virtual {p0, v4, v1}, Lcom/vkontakte/android/api/store/StoreBuyProduct;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 26
    const-string/jumbo v4, "force_inapp"

    invoke-virtual {p0, v4, v3}, Lcom/vkontakte/android/api/store/StoreBuyProduct;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 27
    const-string/jumbo v4, "no_inapp"

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->canUseInApps()Z

    move-result v5

    if-nez v5, :cond_3

    :goto_0
    invoke-virtual {p0, v4, v2}, Lcom/vkontakte/android/api/store/StoreBuyProduct;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    return-void

    :cond_3
    move v2, v3

    .line 27
    goto :goto_0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/PurchasesManager$Result;
    .locals 2
    .param p1, "source"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    new-instance v0, Lcom/vkontakte/android/data/PurchasesManager$Result;

    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/PurchasesManager$Result;-><init>(Lorg/json/JSONObject;)V

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
    .line 14
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/store/StoreBuyProduct;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/PurchasesManager$Result;

    move-result-object v0

    return-object v0
.end method
