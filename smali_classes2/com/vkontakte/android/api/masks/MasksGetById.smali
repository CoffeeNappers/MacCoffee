.class public Lcom/vkontakte/android/api/masks/MasksGetById;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MasksGetById.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/masks/MasksResponse;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "maskIds"    # Ljava/lang/String;

    .prologue
    .line 10
    const-string/jumbo v0, "masks.getById"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 11
    const-string/jumbo v0, "mask_ids"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/masks/MasksGetById;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "extended"

    const-string/jumbo v1, "1"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/masks/MasksGetById;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;DD)V
    .locals 2
    .param p1, "maskIds"    # Ljava/lang/String;
    .param p2, "latitude"    # D
    .param p4, "longitude"    # D

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/masks/MasksGetById;-><init>(Ljava/lang/String;)V

    .line 17
    const-string/jumbo v0, "latitude"

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/masks/MasksGetById;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 18
    const-string/jumbo v0, "longitude"

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/masks/MasksGetById;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/masks/MasksResponse;
    .locals 2
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 23
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksResponse;

    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/masks/MasksResponse;-><init>(Lorg/json/JSONObject;)V

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
    .line 7
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/masks/MasksGetById;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/masks/MasksResponse;

    move-result-object v0

    return-object v0
.end method
