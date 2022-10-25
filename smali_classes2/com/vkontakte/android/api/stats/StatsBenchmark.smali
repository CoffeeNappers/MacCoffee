.class public Lcom/vkontakte/android/api/stats/StatsBenchmark;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "StatsBenchmark.java"


# instance fields
.field private haveDataToSend:Z


# direct methods
.method public constructor <init>(ILjava/util/ArrayList;ILjava/util/HashMap;III)V
    .locals 5
    .param p1, "apiResponseTime"    # I
    .param p3, "imageLoadTime"    # I
    .param p5, "audioLoadTime"    # I
    .param p6, "audioFailCount"    # I
    .param p7, "videoSpeedBytesPerSecond"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;III)V"
        }
    .end annotation

    .prologue
    .local p2, "apiFailCount":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .local p4, "imageLoadFailures":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v4, 0x1

    .line 32
    const-string/jumbo v2, "stats.benchmark"

    invoke-direct {p0, v2}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 34
    if-eqz p1, :cond_0

    .line 35
    const-string/jumbo v2, "api_response_time"

    invoke-virtual {p0, v2, p1}, Lcom/vkontakte/android/api/stats/StatsBenchmark;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 36
    iput-boolean v4, p0, Lcom/vkontakte/android/api/stats/StatsBenchmark;->haveDataToSend:Z

    .line 39
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 40
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p2}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 41
    .local v0, "failCountJsonArray":Lorg/json/JSONArray;
    const-string/jumbo v2, "api_fail_count"

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/api/stats/StatsBenchmark;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 42
    iput-boolean v4, p0, Lcom/vkontakte/android/api/stats/StatsBenchmark;->haveDataToSend:Z

    .line 45
    .end local v0    # "failCountJsonArray":Lorg/json/JSONArray;
    :cond_1
    if-eqz p3, :cond_2

    .line 46
    const-string/jumbo v2, "image_load_time"

    invoke-virtual {p0, v2, p3}, Lcom/vkontakte/android/api/stats/StatsBenchmark;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 47
    iput-boolean v4, p0, Lcom/vkontakte/android/api/stats/StatsBenchmark;->haveDataToSend:Z

    .line 50
    :cond_2
    invoke-virtual {p4}, Ljava/util/HashMap;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 51
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 52
    .local v1, "imageFailuresJson":Lorg/json/JSONObject;
    const-string/jumbo v2, "image_fail_count"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/api/stats/StatsBenchmark;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 53
    iput-boolean v4, p0, Lcom/vkontakte/android/api/stats/StatsBenchmark;->haveDataToSend:Z

    .line 56
    .end local v1    # "imageFailuresJson":Lorg/json/JSONObject;
    :cond_3
    if-lez p5, :cond_4

    .line 57
    const-string/jumbo v2, "audio_load_time"

    invoke-virtual {p0, v2, p5}, Lcom/vkontakte/android/api/stats/StatsBenchmark;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 58
    iput-boolean v4, p0, Lcom/vkontakte/android/api/stats/StatsBenchmark;->haveDataToSend:Z

    .line 61
    :cond_4
    if-lez p6, :cond_5

    .line 62
    const-string/jumbo v2, "audio_fail_count"

    invoke-virtual {p0, v2, p6}, Lcom/vkontakte/android/api/stats/StatsBenchmark;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 63
    iput-boolean v4, p0, Lcom/vkontakte/android/api/stats/StatsBenchmark;->haveDataToSend:Z

    .line 66
    :cond_5
    if-lez p7, :cond_6

    .line 67
    const-string/jumbo v2, "video_speed"

    div-int/lit16 v3, p7, 0x3e8

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/api/stats/StatsBenchmark;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 68
    iput-boolean v4, p0, Lcom/vkontakte/android/api/stats/StatsBenchmark;->haveDataToSend:Z

    .line 71
    :cond_6
    return-void
.end method


# virtual methods
.method public getHaveDataToSend()Z
    .locals 1

    .prologue
    .line 20
    iget-boolean v0, p0, Lcom/vkontakte/android/api/stats/StatsBenchmark;->haveDataToSend:Z

    return v0
.end method
