.class public abstract Lcom/vkontakte/android/upload/HTTPFileUploadTask;
.super Lcom/vkontakte/android/upload/UploadTask;
.source "HTTPFileUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/upload/HTTPFileUploadTask$UploadEntity;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S::",
        "Landroid/os/Parcelable;",
        ">",
        "Lcom/vkontakte/android/upload/UploadTask",
        "<TS;>;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# instance fields
.field protected currentRequest:Lokhttp3/Call;

.field protected file:Ljava/lang/String;

.field protected server:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 44
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/UploadTask;-><init>(Landroid/content/Context;)V

    .line 45
    iput-object p2, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->file:Ljava/lang/String;

    .line 46
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 349
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/UploadTask;-><init>(Landroid/os/Parcel;)V

    .line 350
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->file:Ljava/lang/String;

    .line 351
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->server:Ljava/lang/String;

    .line 352
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->id:I

    .line 353
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 211
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    invoke-super {p0}, Lcom/vkontakte/android/upload/UploadTask;->cancel()V

    .line 212
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->currentRequest:Lokhttp3/Call;

    if-eqz v0, :cond_0

    .line 213
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;-><init>(Lcom/vkontakte/android/upload/HTTPFileUploadTask;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 221
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 223
    :cond_0
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 337
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public doUpload()V
    .locals 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->preProcessFile()Ljava/lang/String;

    move-result-object v6

    .line 60
    .local v6, "newFile":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->isCanceled()Z

    move-result v23

    if-eqz v23, :cond_1

    .line 162
    :cond_0
    return-void

    .line 64
    :cond_1
    if-nez v6, :cond_7

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->file:Ljava/lang/String;

    .line 67
    .local v14, "targetFileName":Ljava/lang/String;
    :goto_0
    const-string/jumbo v23, "/"

    move-object/from16 v0, v23

    invoke-virtual {v14, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_2

    .line 68
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "file://"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 70
    :cond_2
    invoke-static {v14}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v15

    .line 72
    .local v15, "targetFileUri":Landroid/net/Uri;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    .line 73
    .local v18, "timeBeforeCall":J
    const/16 v20, 0x0

    .line 75
    .local v20, "totalTime":I
    new-instance v23, Lokhttp3/Request$Builder;

    invoke-direct/range {v23 .. v23}, Lokhttp3/Request$Builder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->server:Ljava/lang/String;

    move-object/from16 v24, v0

    .line 76
    invoke-virtual/range {v23 .. v24}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v23

    new-instance v24, Lcom/vkontakte/android/upload/HTTPFileUploadTask$UploadEntity;

    .line 77
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->getPostFieldName()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v14, v2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask$UploadEntity;-><init>(Lcom/vkontakte/android/upload/HTTPFileUploadTask;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {v23 .. v24}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v23

    const-string/jumbo v24, "User-Agent"

    sget-object v25, Lcom/vkontakte/android/api/APIController;->USER_AGENT:Ljava/lang/String;

    .line 78
    invoke-virtual/range {v23 .. v25}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v23

    .line 79
    invoke-virtual/range {v23 .. v23}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v7

    .line 80
    .local v7, "req":Lokhttp3/Request;
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v4

    .line 81
    .local v4, "call":Lokhttp3/Call;
    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->currentRequest:Lokhttp3/Call;

    .line 83
    const/4 v8, 0x0

    .line 84
    .local v8, "response":Lokhttp3/Response;
    const/4 v10, -0x1

    .line 85
    .local v10, "responseHttpStatus":I
    const-string/jumbo v9, ""

    .line 86
    .local v9, "responseBody":Ljava/lang/String;
    const/16 v21, 0x0

    .line 87
    .local v21, "uploadException":Ljava/lang/Exception;
    const/4 v13, 0x0

    .line 89
    .local v13, "statsState":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_start_0
    invoke-interface {v4}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v8

    .line 90
    invoke-virtual {v8}, Lokhttp3/Response;->code()I

    move-result v10

    .line 91
    invoke-virtual {v8}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v9

    .line 93
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    .line 94
    .local v16, "timeAfterCall":J
    sub-long v24, v16, v18

    const-wide/16 v26, 0x0

    cmp-long v23, v24, v26

    if-lez v23, :cond_3

    sub-long v24, v16, v18

    const-wide/32 v26, 0x7fffffff

    cmp-long v23, v24, v26

    if-gez v23, :cond_3

    .line 95
    sub-long v24, v16, v18

    move-wide/from16 v0, v24

    long-to-int v0, v0

    move/from16 v20, v0

    .line 98
    :cond_3
    sget-boolean v23, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v23, :cond_4

    .line 99
    const-string/jumbo v23, "vk"

    move-object/from16 v0, v23

    invoke-static {v0, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    :cond_4
    const/16 v23, 0xc8

    move/from16 v0, v23

    if-ne v10, v0, :cond_8

    .line 103
    :try_start_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->extractArgsForSaveFromUploadResponse(Ljava/lang/String;)V

    .line 104
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->SUCCESS:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_end_1
    .catch Lcom/vkontakte/android/upload/UploadException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    :goto_1
    if-eqz v8, :cond_5

    .line 131
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    .line 135
    .end local v16    # "timeAfterCall":J
    :cond_5
    :goto_2
    const/16 v23, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->currentRequest:Lokhttp3/Call;

    .line 137
    new-instance v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;

    invoke-direct {v11}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;-><init>()V

    .line 138
    .local v11, "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->statsGetMethodNameForUploadUrl()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    iput-object v0, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->methodName:Ljava/lang/String;

    .line 139
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->server:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iput-object v0, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->uploadUrl:Ljava/lang/String;

    .line 140
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->getFileSize(Landroid/net/Uri;)J

    move-result-wide v24

    move-wide/from16 v0, v24

    iput-wide v0, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileSize:J

    .line 141
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->getFileName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    iput-object v0, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileName:Ljava/lang/String;

    .line 142
    iput-object v13, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->state:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 143
    iput v10, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->httpStatus:I

    .line 144
    sget-object v23, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->SUCCESS:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    move-object/from16 v0, v23

    if-ne v13, v0, :cond_6

    const-string/jumbo v9, ""

    .end local v9    # "responseBody":Ljava/lang/String;
    :cond_6
    iput-object v9, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->httpError:Ljava/lang/String;

    .line 148
    new-instance v12, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;

    invoke-direct {v12, v11}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;-><init>(Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;)V

    .line 149
    .local v12, "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    invoke-virtual {v12}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->persistWithToken()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 150
    const/16 v23, 0x1

    move/from16 v0, v23

    iput-boolean v0, v12, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->background:Z

    .line 151
    invoke-virtual {v12}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 153
    if-eqz v21, :cond_0

    .line 154
    move-object/from16 v0, v21

    instance-of v0, v0, Lcom/vkontakte/android/upload/UploadException;

    move/from16 v23, v0

    if-eqz v23, :cond_b

    .line 155
    const-string/jumbo v23, "vk"

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 156
    check-cast v21, Lcom/vkontakte/android/upload/UploadException;

    .end local v21    # "uploadException":Ljava/lang/Exception;
    throw v21

    .end local v4    # "call":Lokhttp3/Call;
    .end local v7    # "req":Lokhttp3/Request;
    .end local v8    # "response":Lokhttp3/Response;
    .end local v10    # "responseHttpStatus":I
    .end local v11    # "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    .end local v12    # "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    .end local v13    # "statsState":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    .end local v14    # "targetFileName":Ljava/lang/String;
    .end local v15    # "targetFileUri":Landroid/net/Uri;
    .end local v18    # "timeBeforeCall":J
    .end local v20    # "totalTime":I
    :cond_7
    move-object v14, v6

    .line 64
    goto/16 :goto_0

    .line 105
    .restart local v4    # "call":Lokhttp3/Call;
    .restart local v7    # "req":Lokhttp3/Request;
    .restart local v8    # "response":Lokhttp3/Response;
    .restart local v9    # "responseBody":Ljava/lang/String;
    .restart local v10    # "responseHttpStatus":I
    .restart local v13    # "statsState":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    .restart local v14    # "targetFileName":Ljava/lang/String;
    .restart local v15    # "targetFileUri":Landroid/net/Uri;
    .restart local v16    # "timeAfterCall":J
    .restart local v18    # "timeBeforeCall":J
    .restart local v20    # "totalTime":I
    .restart local v21    # "uploadException":Ljava/lang/Exception;
    :catch_0
    move-exception v5

    .line 106
    .local v5, "ex":Lcom/vkontakte/android/upload/UploadException;
    :try_start_2
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->BAD_RESPONSE:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 107
    move-object/from16 v21, v5

    .line 108
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->trackErrorApiUpload(I)V
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 115
    .end local v5    # "ex":Lcom/vkontakte/android/upload/UploadException;
    .end local v16    # "timeAfterCall":J
    :catch_1
    move-exception v5

    .line 116
    .local v5, "ex":Ljava/net/SocketTimeoutException;
    :goto_3
    :try_start_3
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->TIMEOUT:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 117
    move-object/from16 v21, v5

    .line 118
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->trackFailureUpload()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 130
    if-eqz v8, :cond_5

    .line 131
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    goto/16 :goto_2

    .line 111
    .end local v5    # "ex":Ljava/net/SocketTimeoutException;
    .restart local v16    # "timeAfterCall":J
    :cond_8
    :try_start_4
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->BAD_SERVER:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 112
    new-instance v22, Lcom/vkontakte/android/upload/BadUploadServerException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "Incorrect httpStatus = "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lcom/vkontakte/android/upload/BadUploadServerException;-><init>(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 113
    .end local v21    # "uploadException":Ljava/lang/Exception;
    .local v22, "uploadException":Ljava/lang/Exception;
    :try_start_5
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->trackErrorApiUpload(I)V
    :try_end_5
    .catch Ljava/net/SocketTimeoutException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-object/from16 v21, v22

    .end local v22    # "uploadException":Ljava/lang/Exception;
    .restart local v21    # "uploadException":Ljava/lang/Exception;
    goto/16 :goto_1

    .line 119
    .end local v16    # "timeAfterCall":J
    :catch_2
    move-exception v5

    .line 120
    .local v5, "ex":Ljava/io/IOException;
    :goto_4
    :try_start_6
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v23

    if-eqz v23, :cond_9

    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->UNKNOWN:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 123
    :goto_5
    move-object/from16 v21, v5

    .line 124
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->trackFailureUpload()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 130
    if-eqz v8, :cond_5

    .line 131
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    goto/16 :goto_2

    .line 120
    :cond_9
    :try_start_7
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->NO_NETWORK:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    goto :goto_5

    .line 125
    .end local v5    # "ex":Ljava/io/IOException;
    :catch_3
    move-exception v5

    .line 126
    .local v5, "ex":Ljava/lang/Exception;
    :goto_6
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->UNKNOWN:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 127
    move-object/from16 v21, v5

    .line 128
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->trackFailureUpload()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 130
    if-eqz v8, :cond_5

    .line 131
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    goto/16 :goto_2

    .line 130
    .end local v5    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v23

    :goto_7
    if-eqz v8, :cond_a

    .line 131
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    :cond_a
    throw v23

    .line 158
    .end local v9    # "responseBody":Ljava/lang/String;
    .restart local v11    # "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    .restart local v12    # "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    :cond_b
    const-string/jumbo v23, "vk"

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 159
    new-instance v23, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v24, "can\'t upload"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v23

    .line 130
    .end local v11    # "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    .end local v12    # "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    .end local v21    # "uploadException":Ljava/lang/Exception;
    .restart local v9    # "responseBody":Ljava/lang/String;
    .restart local v16    # "timeAfterCall":J
    .restart local v22    # "uploadException":Ljava/lang/Exception;
    :catchall_1
    move-exception v23

    move-object/from16 v21, v22

    .end local v22    # "uploadException":Ljava/lang/Exception;
    .restart local v21    # "uploadException":Ljava/lang/Exception;
    goto :goto_7

    .line 125
    .end local v21    # "uploadException":Ljava/lang/Exception;
    .restart local v22    # "uploadException":Ljava/lang/Exception;
    :catch_4
    move-exception v5

    move-object/from16 v21, v22

    .end local v22    # "uploadException":Ljava/lang/Exception;
    .restart local v21    # "uploadException":Ljava/lang/Exception;
    goto :goto_6

    .line 119
    .end local v21    # "uploadException":Ljava/lang/Exception;
    .restart local v22    # "uploadException":Ljava/lang/Exception;
    :catch_5
    move-exception v5

    move-object/from16 v21, v22

    .end local v22    # "uploadException":Ljava/lang/Exception;
    .restart local v21    # "uploadException":Ljava/lang/Exception;
    goto :goto_4

    .line 115
    .end local v21    # "uploadException":Ljava/lang/Exception;
    .restart local v22    # "uploadException":Ljava/lang/Exception;
    :catch_6
    move-exception v5

    move-object/from16 v21, v22

    .end local v22    # "uploadException":Ljava/lang/Exception;
    .restart local v21    # "uploadException":Ljava/lang/Exception;
    goto/16 :goto_3
.end method

.method protected extractArgsForSaveFromUploadResponse(Ljava/lang/String;)V
    .locals 0
    .param p1, "response"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    return-void
.end method

.method protected getFileName(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 180
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "content"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    invoke-static {p1}, Lcom/vkontakte/android/upload/UploadUtils;->resolveName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 183
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected getFileSize(Landroid/net/Uri;)J
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    const-wide/16 v2, -0x1

    .line 187
    const/4 v0, 0x0

    .line 189
    .local v0, "afd":Landroid/content/res/AssetFileDescriptor;
    :try_start_0
    iget-object v4, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->context:Landroid/content/Context;

    .line 190
    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string/jumbo v5, "r"

    .line 191
    invoke-virtual {v4, p1, v5}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 192
    if-nez v0, :cond_1

    .line 199
    :goto_0
    if-eqz v0, :cond_0

    .line 201
    :try_start_1
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 204
    :cond_0
    :goto_1
    return-wide v2

    .line 194
    :cond_1
    :try_start_2
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getLength()J
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-wide v2

    goto :goto_0

    .line 195
    :catch_0
    move-exception v1

    .line 196
    .local v1, "ex":Ljava/io/FileNotFoundException;
    :try_start_3
    const-string/jumbo v4, "vk"

    invoke-static {v4, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 199
    if-eqz v0, :cond_0

    .line 201
    :try_start_4
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 202
    :catch_1
    move-exception v4

    goto :goto_1

    .line 199
    .end local v1    # "ex":Ljava/io/FileNotFoundException;
    :catchall_0
    move-exception v2

    if-eqz v0, :cond_2

    .line 201
    :try_start_5
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 204
    :cond_2
    :goto_2
    throw v2

    .line 202
    :catch_2
    move-exception v4

    goto :goto_1

    :catch_3
    move-exception v3

    goto :goto_2
.end method

.method protected abstract getPostFieldName()Ljava/lang/String;
.end method

.method protected preProcessFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract statsGetMethodNameForUploadUrl()Ljava/lang/String;
.end method

.method protected trackErrorApiUpload(I)V
    .locals 0
    .param p1, "totalTime"    # I

    .prologue
    .line 176
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    return-void
.end method

.method protected trackFailureUpload()V
    .locals 0

    .prologue
    .line 177
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    return-void
.end method

.method protected trackSuccessfulUpload(IJ)V
    .locals 0
    .param p1, "totalTime"    # I
    .param p2, "byteSize"    # J

    .prologue
    .line 175
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 342
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask<TS;>;"
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/UploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->file:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 344
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->server:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 345
    iget v0, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 346
    return-void
.end method
