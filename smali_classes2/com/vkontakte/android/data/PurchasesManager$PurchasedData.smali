.class Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;
.super Ljava/lang/Object;
.source "PurchasesManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/PurchasesManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PurchasedData"
.end annotation


# instance fields
.field autoRenewing:Z

.field developerPayload:Ljava/lang/String;

.field orderId:Ljava/lang/String;

.field packageName:Ljava/lang/String;

.field productId:Ljava/lang/String;

.field purchaseState:I

.field purchaseTime:J

.field purchaseToken:Ljava/lang/String;

.field signature:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "signature"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 602
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 603
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 604
    .local v0, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v1, "orderId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->orderId:Ljava/lang/String;

    .line 605
    const-string/jumbo v1, "packageName"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->packageName:Ljava/lang/String;

    .line 606
    const-string/jumbo v1, "productId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->productId:Ljava/lang/String;

    .line 607
    const-string/jumbo v1, "purchaseTime"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->purchaseTime:J

    .line 608
    const-string/jumbo v1, "purchaseState"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->purchaseState:I

    .line 609
    const-string/jumbo v1, "developerPayload"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->developerPayload:Ljava/lang/String;

    .line 610
    const-string/jumbo v1, "purchaseToken"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->purchaseToken:Ljava/lang/String;

    .line 611
    const-string/jumbo v1, "autoRenewing"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->autoRenewing:Z

    .line 612
    iput-object p2, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->signature:Ljava/lang/String;

    .line 613
    return-void
.end method


# virtual methods
.method getId()I
    .locals 2

    .prologue
    .line 616
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->developerPayload:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->developerPayload:Ljava/lang/String;

    const-string/jumbo v1, "[0-9]+,[0-9]+,[0-9A-Za-z_]+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 617
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->developerPayload:Ljava/lang/String;

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 621
    :goto_0
    return v0

    .line 618
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->developerPayload:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->developerPayload:Ljava/lang/String;

    const-string/jumbo v1, "[0-9]+,1,[0-9]+,[0-9A-Za-z_]+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 619
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->developerPayload:Ljava/lang/String;

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 621
    :cond_1
    const/4 v0, -0x1

    goto :goto_0
.end method
