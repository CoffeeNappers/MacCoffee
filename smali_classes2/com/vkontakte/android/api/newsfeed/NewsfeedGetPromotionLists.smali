.class public Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "NewsfeedGetPromotionLists.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    const-string/jumbo v0, "newsfeed.getPromotionLists"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 14
    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 10
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists;->parse(Lorg/json/JSONObject;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/json/JSONObject;)Ljava/util/ArrayList;
    .locals 10
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 19
    :try_start_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .local v5, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;>;"
    const-string/jumbo v6, "response"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 21
    .local v4, "response":Lorg/json/JSONObject;
    const-string/jumbo v6, "items"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 22
    .local v2, "items":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v1, v6, :cond_2

    .line 23
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 24
    .local v3, "obj":Lorg/json/JSONObject;
    new-instance v7, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;

    const-string/jumbo v6, "id"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v6, "title"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v6, "hidden"

    .line 25
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string/jumbo v6, "is_hidden"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    :cond_0
    const/4 v6, 0x1

    :goto_1
    invoke-direct {v7, v8, v9, v6}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 24
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 25
    :cond_1
    const/4 v6, 0x0

    goto :goto_1

    .line 28
    .end local v1    # "i":I
    .end local v2    # "items":Lorg/json/JSONArray;
    .end local v3    # "obj":Lorg/json/JSONObject;
    .end local v4    # "response":Lorg/json/JSONObject;
    .end local v5    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;>;"
    :catch_0
    move-exception v0

    .line 29
    .local v0, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    return-object v5
.end method
