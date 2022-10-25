.class public Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;
.super Ljava/lang/Object;
.source "StoreHasNewItems.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/store/StoreHasNewItems;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Response"
.end annotation


# instance fields
.field public final globalPromotion:I

.field public final stickersVersionHash:Ljava/lang/String;

.field public final storeNewItems:I


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-string/jumbo v0, "global_promotion"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->globalPromotion:I

    .line 26
    const-string/jumbo v0, "store_new_items"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->storeNewItems:I

    .line 27
    const-string/jumbo v0, "stickers_version_hash"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->stickersVersionHash:Ljava/lang/String;

    .line 28
    return-void
.end method
