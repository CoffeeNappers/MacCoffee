.class public Lcom/vkontakte/android/api/money/GetMoneyTransferList;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "GetMoneyTransferList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/MoneyTransfer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(III)V
    .locals 1
    .param p1, "type"    # I
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 38
    const-string/jumbo v0, "money.getTransferList"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;)V

    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;->init(IIII)V

    .line 41
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 1
    .param p1, "type"    # I
    .param p2, "peerId"    # I
    .param p3, "offset"    # I
    .param p4, "count"    # I

    .prologue
    .line 29
    const-string/jumbo v0, "money.getTransferList"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;)V

    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;->init(IIII)V

    .line 32
    return-void
.end method

.method private init(IIII)V
    .locals 2
    .param p1, "type"    # I
    .param p2, "peerId"    # I
    .param p3, "offset"    # I
    .param p4, "count"    # I

    .prologue
    .line 46
    const-string/jumbo v0, "type"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 48
    if-eqz p2, :cond_0

    .line 49
    const-string/jumbo v0, "receiver_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    :cond_0
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 53
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 54
    const-string/jumbo v0, "extended"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 55
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "first_name_gen, last_name_gen, first_name_dat, last_name_dat, photo_50, photo_100, photo_200"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 57
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
    .locals 11
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/MoneyTransfer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 62
    const-string/jumbo v8, "response"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string/jumbo v9, "profiles"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 63
    .local v7, "users":Lorg/json/JSONArray;
    const-string/jumbo v8, "response"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string/jumbo v9, "groups"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 65
    .local v1, "groups":Lorg/json/JSONArray;
    new-instance v6, Landroid/util/SparseArray;

    invoke-direct {v6}, Landroid/util/SparseArray;-><init>()V

    .line 67
    .local v6, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    if-eqz v7, :cond_0

    .line 68
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v2, v8, :cond_0

    .line 69
    invoke-virtual {v7, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 70
    .local v4, "ju":Lorg/json/JSONObject;
    new-instance v5, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v5, v4}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 71
    .local v5, "p":Lcom/vkontakte/android/UserProfile;
    iget v8, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v6, v8, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 68
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 75
    .end local v2    # "i":I
    .end local v4    # "ju":Lorg/json/JSONObject;
    .end local v5    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    if-eqz v1, :cond_1

    .line 76
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v2, v8, :cond_1

    .line 77
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 78
    .local v3, "jg":Lorg/json/JSONObject;
    new-instance v0, Lcom/vkontakte/android/UserProfile;

    new-instance v8, Lcom/vkontakte/android/api/Group;

    invoke-direct {v8, v3}, Lcom/vkontakte/android/api/Group;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v0, v8}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/api/Group;)V

    .line 79
    .local v0, "g":Lcom/vkontakte/android/UserProfile;
    iget v8, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v6, v8, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 76
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 83
    .end local v0    # "g":Lcom/vkontakte/android/UserProfile;
    .end local v2    # "i":I
    .end local v3    # "jg":Lorg/json/JSONObject;
    :cond_1
    new-instance v8, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v9, "response"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    new-instance v10, Lcom/vkontakte/android/api/money/GetMoneyTransferList$1;

    invoke-direct {v10, p0, v6}, Lcom/vkontakte/android/api/money/GetMoneyTransferList$1;-><init>(Lcom/vkontakte/android/api/money/GetMoneyTransferList;Landroid/util/SparseArray;)V

    invoke-direct {v8, v9, v10}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V

    return-object v8
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
