.class final Lcom/vkontakte/android/data/Analytics$1;
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
    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public send(Lcom/vkontakte/android/statistics/StatisticBase;)Z
    .locals 6
    .param p1, "statistic"    # Lcom/vkontakte/android/statistics/StatisticBase;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 187
    instance-of v3, p1, Lcom/vkontakte/android/statistics/StatisticUrl;

    if-eqz v3, :cond_0

    move-object v0, p1

    .line 188
    check-cast v0, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 190
    .local v0, "statisticUrl":Lcom/vkontakte/android/statistics/StatisticUrl;
    const-string/jumbo v3, "ads/impression"

    invoke-static {v3}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->collapse()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    const-string/jumbo v4, "ad_data_impression"

    iget-object v5, v0, Lcom/vkontakte/android/statistics/StatisticUrl;->value:Ljava/lang/String;

    .line 191
    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    .line 192
    invoke-virtual {v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->flushBuffer()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 194
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string/jumbo v4, "Statistics sent"

    aput-object v4, v3, v2

    aput-object v0, v3, v1

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 199
    .end local v0    # "statisticUrl":Lcom/vkontakte/android/statistics/StatisticUrl;
    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method
