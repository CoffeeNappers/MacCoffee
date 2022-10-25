.class public Lcom/vkontakte/android/api/store/StoreGetCatalog;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "StoreGetCatalog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;,
        Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;,
        Lcom/vkontakte/android/api/store/StoreGetCatalog$Type;,
        Lcom/vkontakte/android/api/store/StoreGetCatalog$Banner;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 26
    const-string/jumbo v1, "execute.getStickersCatalog"

    invoke-direct {p0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 27
    const-string/jumbo v1, "type"

    const-string/jumbo v2, "stickers"

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/api/store/StoreGetCatalog;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    const-string/jumbo v1, "merchant"

    const-string/jumbo v2, "google"

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/api/store/StoreGetCatalog;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 29
    const-string/jumbo v1, "force_inapp"

    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/store/StoreGetCatalog;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 30
    const-string/jumbo v1, "no_inapp"

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->canUseInApps()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/store/StoreGetCatalog;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 31
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;
    .locals 2
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 35
    new-instance v0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;

    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;-><init>(Lorg/json/JSONObject;)V

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
    .line 23
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/store/StoreGetCatalog;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;

    move-result-object v0

    return-object v0
.end method
