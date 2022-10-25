.class public Lcom/vkontakte/android/api/masks/MasksGet;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MasksGet.java"


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
.method public constructor <init>(III)V
    .locals 2
    .param p1, "sectionId"    # I
    .param p2, "count"    # I
    .param p3, "offset"    # I

    .prologue
    .line 9
    const-string/jumbo v0, "masks.get"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 10
    const-string/jumbo v0, "section_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/masks/MasksGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/masks/MasksGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/masks/MasksGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    const-string/jumbo v0, "extended"

    const-string/jumbo v1, "1"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/masks/MasksGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    return-void
.end method

.method public constructor <init>(IIIDD)V
    .locals 2
    .param p1, "sectionId"    # I
    .param p2, "count"    # I
    .param p3, "offset"    # I
    .param p4, "latitude"    # D
    .param p6, "longitude"    # D

    .prologue
    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/api/masks/MasksGet;-><init>(III)V

    .line 18
    const-string/jumbo v0, "latitude"

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/masks/MasksGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    const-string/jumbo v0, "longitude"

    invoke-static {p6, p7}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/masks/MasksGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 20
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
    .line 24
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
    .line 6
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/masks/MasksGet;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/masks/MasksResponse;

    move-result-object v0

    return-object v0
.end method
