.class public Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;
.super Ljava/lang/Object;
.source "StoreGetCatalog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/store/StoreGetCatalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation


# instance fields
.field public banners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/store/StoreGetCatalog$Banner;",
            ">;"
        }
    .end annotation
.end field

.field public sections:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "source"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    const-string/jumbo v3, "banners"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 113
    .local v0, "banners":Lorg/json/JSONArray;
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v3, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;->banners:Ljava/util/List;

    .line 114
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 115
    iget-object v3, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;->banners:Ljava/util/List;

    new-instance v4, Lcom/vkontakte/android/api/store/StoreGetCatalog$Banner;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vkontakte/android/api/store/StoreGetCatalog$Banner;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 118
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;->banners:Ljava/util/List;

    invoke-static {}, Lcom/vkontakte/android/api/store/StoreGetCatalog$Result$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/functions/F1;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/stickers/Stickers;->fillLocalInfo(Ljava/util/Collection;Lcom/vkontakte/android/functions/F1;)V

    .line 120
    const-string/jumbo v3, "sections"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 121
    .local v2, "sections":Lorg/json/JSONArray;
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v3, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;->sections:Ljava/util/List;

    .line 122
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 123
    iget-object v3, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Result;->sections:Ljava/util/List;

    new-instance v4, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 126
    :cond_1
    return-void
.end method

.method static synthetic lambda$new$0(Lcom/vkontakte/android/api/store/StoreGetCatalog$Banner;)Lcom/vkontakte/android/data/orm/StickerStockItem;
    .locals 1
    .param p0, "banner"    # Lcom/vkontakte/android/api/store/StoreGetCatalog$Banner;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Banner;->stock_item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    return-object v0
.end method
