.class public Lcom/vkontakte/android/api/market/MarketGetMarketPage$Response;
.super Lcom/vkontakte/android/data/VKList;
.source "MarketGetMarketPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/market/MarketGetMarketPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Response"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/data/Good;",
        ">;"
    }
.end annotation


# instance fields
.field public albumTitle:Ljava/lang/String;

.field public albums:Lcom/vkontakte/android/data/VKList;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/data/GoodAlbum;",
            ">;"
        }
    .end annotation
.end field

.field public currency:Ljava/lang/String;

.field public hasMarket:Z

.field public maxPrice:J

.field public minPrice:J


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;Ljava/lang/Class;)V
    .locals 1
    .param p1, "obj"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/Class",
            "<",
            "Lcom/vkontakte/android/data/Good;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 50
    .local p2, "cls":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/vkontakte/android/data/Good;>;"
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Ljava/lang/Class;)V

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/api/market/MarketGetMarketPage$Response;->albums:Lcom/vkontakte/android/data/VKList;

    .line 51
    return-void
.end method
