.class final Lcom/vkontakte/android/data/Analytics$3;
.super Ljava/lang/Object;
.source "Analytics.java"

# interfaces
.implements Lcom/vkontakte/android/statistics/StatisticSender;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/Analytics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public send(Lcom/vkontakte/android/statistics/StatisticBase;)Z
    .locals 7
    .param p1, "statistic"    # Lcom/vkontakte/android/statistics/StatisticBase;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 227
    instance-of v2, p1, Lcom/vkontakte/android/statistics/StatisticUrl;

    if-eqz v2, :cond_5

    move-object v1, p1

    .line 228
    check-cast v1, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 230
    .local v1, "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    sget-boolean v2, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v2, :cond_0

    .line 231
    const-string/jumbo v2, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Sending external request: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    :cond_0
    iget-object v2, v1, Lcom/vkontakte/android/statistics/StatisticUrl;->value:Ljava/lang/String;

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->sendRequest(Ljava/lang/String;)[B

    move-result-object v0

    .line 234
    .local v0, "res":[B
    sget-boolean v2, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v2, :cond_1

    .line 235
    const-string/jumbo v5, "vk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Request done, got "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz v0, :cond_3

    array-length v2, v0

    :goto_0
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v6, " bytes"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    :cond_1
    if-eqz v0, :cond_2

    .line 238
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string/jumbo v5, "Statistics sent"

    aput-object v5, v2, v4

    aput-object v1, v2, v3

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 240
    :cond_2
    if-eqz v0, :cond_4

    move v2, v3

    .line 243
    .end local v0    # "res":[B
    .end local v1    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :goto_1
    return v2

    .line 235
    .restart local v0    # "res":[B
    .restart local v1    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_3
    const/4 v2, -0x1

    goto :goto_0

    :cond_4
    move v2, v4

    .line 240
    goto :goto_1

    .end local v0    # "res":[B
    .end local v1    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_5
    move v2, v4

    .line 243
    goto :goto_1
.end method
