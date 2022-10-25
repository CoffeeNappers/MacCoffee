.class public Lcom/vkontakte/android/api/store/StoreHasNewItems;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "StoreHasNewItems.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 9
    const-string/jumbo v0, "store.hasNewItems"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 10
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "stickers"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/store/StoreHasNewItems;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    const-string/jumbo v0, "merchant"

    const-string/jumbo v1, "google"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/store/StoreHasNewItems;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;
    .locals 2
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 16
    new-instance v0, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;

    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;-><init>(Lorg/json/JSONObject;)V

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
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/store/StoreHasNewItems;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;

    move-result-object v0

    return-object v0
.end method
