.class public Lcom/vkontakte/android/api/store/StoreMarkAsViewed;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "StoreMarkAsViewed.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "reset"    # Ljava/lang/String;

    .prologue
    .line 17
    const-string/jumbo v0, "store.markAsViewed"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 18
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "stickers"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    const-string/jumbo v0, "reset"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 20
    return-void
.end method

.method public static markGlobalPromotionAsViewed()Lcom/vkontakte/android/api/store/StoreMarkAsViewed;
    .locals 2

    .prologue
    .line 9
    new-instance v0, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;

    const-string/jumbo v1, "global_promotion"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static markNewItemsAsViewed()Lcom/vkontakte/android/api/store/StoreMarkAsViewed;
    .locals 2

    .prologue
    .line 13
    new-instance v0, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;

    const-string/jumbo v1, "store_new_items"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 24
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

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
    .line 6
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;->parse(Lorg/json/JSONObject;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
