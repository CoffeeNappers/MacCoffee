.class public Lcom/vkontakte/android/api/stats/StatsTrackDownloadServerState;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "StatsTrackDownloadServerState.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJILjava/lang/Exception;)V
    .locals 7
    .param p1, "patternType"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "byteSize"    # J
    .param p5, "loadTimeMilliseconds"    # J
    .param p7, "responseCode"    # I
    .param p8, "exception"    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 11
    const-string/jumbo v4, "stats.trackDownloadServerState"

    invoke-direct {p0, v4}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 12
    const-string/jumbo v4, "pattern_type"

    invoke-virtual {p0, v4, p1}, Lcom/vkontakte/android/api/stats/StatsTrackDownloadServerState;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    const-string/jumbo v4, "download_url"

    invoke-virtual {p0, v4, p2}, Lcom/vkontakte/android/api/stats/StatsTrackDownloadServerState;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    const-string/jumbo v5, "state"

    if-nez p8, :cond_5

    const-string/jumbo v4, "success"

    :goto_0
    invoke-virtual {p0, v5, v4}, Lcom/vkontakte/android/api/stats/StatsTrackDownloadServerState;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    if-eqz p7, :cond_0

    .line 17
    const-string/jumbo v4, "http_status"

    invoke-virtual {p0, v4, p7}, Lcom/vkontakte/android/api/stats/StatsTrackDownloadServerState;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    :cond_0
    if-eqz p8, :cond_2

    .line 20
    invoke-virtual {p8}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    .line 21
    .local v3, "trace":[Ljava/lang/StackTraceElement;
    if-eqz v3, :cond_1

    array-length v4, v3

    if-nez v4, :cond_6

    :cond_1
    const-string/jumbo v0, ""

    .line 22
    .local v0, "line":Ljava/lang/String;
    :goto_1
    invoke-virtual {p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    .line 23
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p8}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-nez v4, :cond_7

    .line 24
    invoke-virtual {p8}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 26
    .local v1, "msg":Ljava/lang/String;
    :goto_2
    const-string/jumbo v5, "error_msg"

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_8

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_3
    invoke-virtual {p0, v5, v4}, Lcom/vkontakte/android/api/stats/StatsTrackDownloadServerState;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    .end local v0    # "line":Ljava/lang/String;
    .end local v1    # "msg":Ljava/lang/String;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "trace":[Ljava/lang/StackTraceElement;
    :cond_2
    const-wide/16 v4, 0x0

    cmp-long v4, p5, v4

    if-lez v4, :cond_3

    .line 29
    const-string/jumbo v4, "time"

    invoke-virtual {p0, v4, p5, p6}, Lcom/vkontakte/android/api/stats/StatsTrackDownloadServerState;->param(Ljava/lang/String;J)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 31
    :cond_3
    const-wide/16 v4, 0x0

    cmp-long v4, p3, v4

    if-lez v4, :cond_4

    .line 32
    const-string/jumbo v4, "file_size"

    invoke-virtual {p0, v4, p3, p4}, Lcom/vkontakte/android/api/stats/StatsTrackDownloadServerState;->param(Ljava/lang/String;J)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 34
    :cond_4
    return-void

    .line 14
    :cond_5
    const-string/jumbo v4, "error"

    goto :goto_0

    .line 21
    .restart local v3    # "trace":[Ljava/lang/StackTraceElement;
    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v5, v3, v5

    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 24
    .restart local v0    # "line":Ljava/lang/String;
    .restart local v2    # "name":Ljava/lang/String;
    :cond_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    invoke-virtual {p8}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p8}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 26
    .restart local v1    # "msg":Ljava/lang/String;
    :cond_8
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, "\n"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_3
.end method
