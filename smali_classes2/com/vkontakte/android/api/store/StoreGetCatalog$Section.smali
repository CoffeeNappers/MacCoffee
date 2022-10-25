.class public Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;
.super Ljava/lang/Object;
.source "StoreGetCatalog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/store/StoreGetCatalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Section"
.end annotation


# instance fields
.field public name:Ljava/lang/String;

.field public stickers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field public title:Ljava/lang/String;


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
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    const-string/jumbo v2, "title"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->title:Ljava/lang/String;

    .line 93
    const-string/jumbo v2, "name"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->name:Ljava/lang/String;

    .line 95
    const-string/jumbo v2, "stickers"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "items"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 97
    .local v1, "stickers":Lorg/json/JSONArray;
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    .line 98
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 99
    iget-object v2, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    new-instance v3, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/data/orm/StickerStockItem;-><init>(Lorg/json/JSONObject;I)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 102
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    invoke-static {}, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/functions/F1;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/stickers/Stickers;->fillLocalInfo(Ljava/util/Collection;Lcom/vkontakte/android/functions/F1;)V

    .line 103
    return-void
.end method

.method static synthetic lambda$new$0(Lcom/vkontakte/android/data/orm/StickerStockItem;)Lcom/vkontakte/android/data/orm/StickerStockItem;
    .locals 0
    .param p0, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 102
    return-object p0
.end method
