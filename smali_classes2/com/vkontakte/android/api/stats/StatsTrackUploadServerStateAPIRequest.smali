.class public Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "StatsTrackUploadServerStateAPIRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;,
        Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;)V
    .locals 6
    .param p1, "args"    # Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;

    .prologue
    .line 31
    const-string/jumbo v1, "stats.trackUploadServerState"

    invoke-direct {p0, v1}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 33
    if-nez p1, :cond_0

    .line 34
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "args is null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 36
    :cond_0
    iget-object v1, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->methodName:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 37
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "methodName is null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 39
    :cond_1
    iget-object v1, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->uploadUrl:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 40
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "uploadUrl is null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 42
    :cond_2
    iget-object v1, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->state:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    if-nez v1, :cond_3

    .line 43
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "state is null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 45
    :cond_3
    iget-object v1, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileName:Ljava/lang/String;

    if-nez v1, :cond_4

    .line 46
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "fileName is null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 49
    :cond_4
    const-string/jumbo v1, "method_name"

    iget-object v2, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->methodName:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 50
    const-string/jumbo v1, "upload_url"

    iget-object v2, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->uploadUrl:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 53
    sget-object v1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$1;->$SwitchMap$com$vkontakte$android$api$stats$StatsTrackUploadServerStateAPIRequest$State:[I

    iget-object v2, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->state:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    invoke-virtual {v2}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 71
    const-string/jumbo v0, "unknown"

    .line 74
    .local v0, "state":Ljava/lang/String;
    :goto_0
    const-string/jumbo v1, "state"

    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 76
    const-string/jumbo v1, "http_status"

    iget v2, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->httpStatus:I

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 77
    const-string/jumbo v2, "http_error"

    iget-object v1, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->httpError:Ljava/lang/String;

    if-nez v1, :cond_6

    const-string/jumbo v1, ""

    :goto_1
    invoke-virtual {p0, v2, v1}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 79
    iget-wide v2, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileSize:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-ltz v1, :cond_5

    .line 80
    const-string/jumbo v1, "file_size"

    iget-wide v2, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileSize:J

    invoke-virtual {p0, v1, v2, v3}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->param(Ljava/lang/String;J)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 82
    :cond_5
    const-string/jumbo v2, "file_name"

    iget-object v1, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileName:Ljava/lang/String;

    if-nez v1, :cond_7

    const-string/jumbo v1, ""

    :goto_2
    invoke-virtual {p0, v2, v1}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 83
    return-void

    .line 55
    .end local v0    # "state":Ljava/lang/String;
    :pswitch_0
    const-string/jumbo v0, "success"

    .line 56
    .restart local v0    # "state":Ljava/lang/String;
    goto :goto_0

    .line 58
    .end local v0    # "state":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v0, "timeout"

    .line 59
    .restart local v0    # "state":Ljava/lang/String;
    goto :goto_0

    .line 61
    .end local v0    # "state":Ljava/lang/String;
    :pswitch_2
    const-string/jumbo v0, "no_network"

    .line 62
    .restart local v0    # "state":Ljava/lang/String;
    goto :goto_0

    .line 64
    .end local v0    # "state":Ljava/lang/String;
    :pswitch_3
    const-string/jumbo v0, "bad_server"

    .line 65
    .restart local v0    # "state":Ljava/lang/String;
    goto :goto_0

    .line 67
    .end local v0    # "state":Ljava/lang/String;
    :pswitch_4
    const-string/jumbo v0, "bad_response"

    .line 68
    .restart local v0    # "state":Ljava/lang/String;
    goto :goto_0

    .line 77
    :cond_6
    iget-object v1, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->httpError:Ljava/lang/String;

    goto :goto_1

    .line 82
    :cond_7
    iget-object v1, p1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileName:Ljava/lang/String;

    goto :goto_2

    .line 53
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
