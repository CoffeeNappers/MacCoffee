.class public Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;
.super Ljava/lang/Object;
.source "MarketGoodGetFullPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/market/MarketGoodGetFullPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GoodFullPage"
.end annotation


# instance fields
.field public final comments:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;"
        }
    .end annotation
.end field

.field public final contact_id:I

.field public final contact_name:Ljava/lang/String;

.field public final contact_photo_100:Ljava/lang/String;

.field public final contact_photo_200:Ljava/lang/String;

.field public final contact_photo_50:Ljava/lang/String;

.field public final good:Lcom/vkontakte/android/data/Good;

.field public final likes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final offset:I

.field public final owner_id:I

.field public final owner_name:Ljava/lang/String;

.field public final owner_photo_100:Ljava/lang/String;

.field public final owner_photo_200:Ljava/lang/String;

.field public final owner_photo_50:Ljava/lang/String;

.field public final wiki_title:Ljava/lang/String;

.field public final wiki_view_url:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lorg/json/JSONObject;)V
    .locals 10
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const-string/jumbo v6, "response"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 47
    const-string/jumbo v6, "good"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string/jumbo v6, "good"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    new-instance v6, Lcom/vkontakte/android/data/Good;

    const-string/jumbo v8, "good"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-direct {v6, v8}, Lcom/vkontakte/android/data/Good;-><init>(Lorg/json/JSONObject;)V

    :goto_0
    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->good:Lcom/vkontakte/android/data/Good;

    .line 48
    const-string/jumbo v6, "owner_name"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->owner_name:Ljava/lang/String;

    .line 49
    const-string/jumbo v6, "owner_id"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->owner_id:I

    .line 50
    const-string/jumbo v6, "offset"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->offset:I

    .line 51
    const-string/jumbo v6, "owner_photo_50"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->owner_photo_50:Ljava/lang/String;

    .line 52
    const-string/jumbo v6, "owner_photo_100"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->owner_photo_100:Ljava/lang/String;

    .line 53
    const-string/jumbo v6, "owner_photo_200"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->owner_photo_200:Ljava/lang/String;

    .line 54
    const-string/jumbo v6, "wiki_title"

    invoke-static {p1, v6}, Lcom/vkontakte/android/utils/Utils;->optString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->wiki_title:Ljava/lang/String;

    .line 55
    const-string/jumbo v6, "wiki_view_url"

    invoke-static {p1, v6}, Lcom/vkontakte/android/utils/Utils;->optString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->wiki_view_url:Ljava/lang/String;

    .line 57
    const-string/jumbo v6, "contact_id"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->contact_id:I

    .line 58
    const-string/jumbo v6, "contact_name"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->contact_name:Ljava/lang/String;

    .line 59
    const-string/jumbo v6, "contact_photo_50"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->contact_photo_50:Ljava/lang/String;

    .line 60
    const-string/jumbo v6, "contact_photo_100"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->contact_photo_100:Ljava/lang/String;

    .line 61
    const-string/jumbo v6, "contact_photo_200"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->contact_photo_200:Ljava/lang/String;

    .line 63
    const-string/jumbo v6, "likes"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/data/LikeInfo;->parse(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->likes:Ljava/util/List;

    .line 65
    const-string/jumbo v6, "comments"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    const-string/jumbo v6, "comments"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_5

    const-string/jumbo v6, "comments"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    instance-of v6, v6, Lorg/json/JSONObject;

    if-eqz v6, :cond_5

    .line 66
    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    .line 67
    .local v2, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v5, Landroid/util/SparseArray;

    invoke-direct {v5}, Landroid/util/SparseArray;-><init>()V

    .line 68
    .local v5, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    .line 70
    .local v3, "names_dat":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const-string/jumbo v6, "comments"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string/jumbo v7, "profiles"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 71
    .local v1, "jprofiles":Lorg/json/JSONArray;
    if-eqz v1, :cond_2

    .line 72
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v0, v6, :cond_2

    .line 73
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 74
    .local v4, "p":Lorg/json/JSONObject;
    const-string/jumbo v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "first_name"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x20

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "last_name"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 75
    const-string/jumbo v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string/jumbo v7, "first_name_dat"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 76
    const-string/jumbo v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    sget v6, Lcom/vkontakte/android/Global;->displayDensity:F

    cmpl-float v6, v6, v9

    if-lez v6, :cond_1

    const-string/jumbo v6, "photo_medium_rec"

    :goto_2
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v7, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 72
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "i":I
    .end local v1    # "jprofiles":Lorg/json/JSONArray;
    .end local v2    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v3    # "names_dat":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v4    # "p":Lorg/json/JSONObject;
    .end local v5    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :cond_0
    move-object v6, v7

    .line 47
    goto/16 :goto_0

    .line 76
    .restart local v0    # "i":I
    .restart local v1    # "jprofiles":Lorg/json/JSONArray;
    .restart local v2    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v3    # "names_dat":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v4    # "p":Lorg/json/JSONObject;
    .restart local v5    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :cond_1
    const-string/jumbo v6, "photo_rec"

    goto :goto_2

    .line 80
    .end local v0    # "i":I
    .end local v4    # "p":Lorg/json/JSONObject;
    :cond_2
    const-string/jumbo v6, "comments"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string/jumbo v7, "groups"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 81
    if-eqz v1, :cond_4

    .line 82
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_3
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v0, v6, :cond_4

    .line 83
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 84
    .restart local v4    # "p":Lorg/json/JSONObject;
    const-string/jumbo v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    neg-int v6, v6

    const-string/jumbo v7, "name"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 85
    const-string/jumbo v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    neg-int v7, v6

    sget v6, Lcom/vkontakte/android/Global;->displayDensity:F

    cmpl-float v6, v6, v9

    if-lez v6, :cond_3

    const-string/jumbo v6, "photo_200"

    :goto_4
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v7, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 82
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 85
    :cond_3
    const-string/jumbo v6, "photo_100"

    goto :goto_4

    .line 89
    .end local v0    # "i":I
    .end local v4    # "p":Lorg/json/JSONObject;
    :cond_4
    new-instance v6, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v7, "comments"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    new-instance v8, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage$1;

    invoke-direct {v8, p0, v2, v5, v3}, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage$1;-><init>(Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    invoke-direct {v6, v7, v8}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V

    iput-object v6, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->comments:Lcom/vkontakte/android/data/VKList;

    .line 100
    .end local v1    # "jprofiles":Lorg/json/JSONArray;
    .end local v2    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v3    # "names_dat":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v5    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :goto_5
    return-void

    .line 98
    :cond_5
    iput-object v7, p0, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;->comments:Lcom/vkontakte/android/data/VKList;

    goto :goto_5
.end method

.method synthetic constructor <init>(Lorg/json/JSONObject;Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/json/JSONObject;
    .param p2, "x1"    # Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$1;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/market/MarketGoodGetFullPage$GoodFullPage;-><init>(Lorg/json/JSONObject;)V

    return-void
.end method
