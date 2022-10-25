.class public Lcom/vkontakte/android/upload/AudioMessageUploadTask;
.super Lcom/vkontakte/android/upload/DocumentUploadTask;
.source "AudioMessageUploadTask.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/upload/AudioMessageUploadTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private waveform:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 202
    new-instance v0, Lcom/vkontakte/android/upload/AudioMessageUploadTask$1;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/AudioMessageUploadTask$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;[BI)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "waveform"    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "oid"    # I

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p4, v0}, Lcom/vkontakte/android/upload/DocumentUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZ)V

    .line 36
    iput-object p3, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->waveform:[B

    .line 37
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/DocumentUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 42
    .local v0, "size":I
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->waveform:[B

    .line 43
    iget-object v1, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->waveform:[B

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readByteArray([B)V

    .line 44
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/upload/AudioMessageUploadTask$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/upload/AudioMessageUploadTask$1;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private removeTempFile()V
    .locals 2

    .prologue
    .line 191
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->file:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 192
    .local v0, "tempFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 193
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 195
    :cond_0
    return-void
.end method


# virtual methods
.method public afterUpload()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 175
    invoke-super {p0}, Lcom/vkontakte/android/upload/DocumentUploadTask;->afterUpload()V

    .line 176
    iget-object v1, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->result:Lcom/vkontakte/android/api/Document;

    if-nez v1, :cond_0

    .line 177
    invoke-direct {p0}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->removeTempFile()V

    .line 188
    :goto_0
    return-void

    .line 179
    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->context:Landroid/content/Context;

    const-class v2, Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 180
    .local v0, "intentPlayer":Landroid/content/Intent;
    const-string/jumbo v1, "action"

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 181
    const-string/jumbo v1, "url"

    iget-object v2, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->file:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 182
    const-string/jumbo v1, "oid"

    iget v2, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->ownerID:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 183
    const-string/jumbo v1, "did"

    invoke-virtual {p0}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->getID()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 184
    const-string/jumbo v1, "new_oid"

    iget-object v2, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->result:Lcom/vkontakte/android/api/Document;

    iget v2, v2, Lcom/vkontakte/android/api/Document;->oid:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 185
    const-string/jumbo v1, "new_did"

    iget-object v2, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->result:Lcom/vkontakte/android/api/Document;

    iget v2, v2, Lcom/vkontakte/android/api/Document;->did:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 186
    iget-object v1, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0
.end method

.method public cancel()V
    .locals 0

    .prologue
    .line 169
    invoke-super {p0}, Lcom/vkontakte/android/upload/DocumentUploadTask;->cancel()V

    .line 170
    invoke-direct {p0}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->removeTempFile()V

    .line 171
    return-void
.end method

.method public doUpload()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 60
    const/4 v2, 0x3

    .line 61
    .local v2, "retriesCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v3, 0x3

    if-ge v1, v3, :cond_1

    .line 63
    :try_start_0
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->upload()V
    :try_end_0
    .catch Lcom/vkontakte/android/upload/UploadException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    return-void

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Lcom/vkontakte/android/upload/UploadException;
    const/4 v3, 0x2

    if-ge v1, v3, :cond_0

    .line 67
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->getServer()V

    .line 61
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 72
    .end local v0    # "e":Lcom/vkontakte/android/upload/UploadException;
    :cond_1
    new-instance v3, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v4, "can\'t upload"

    invoke-direct {v3, v4}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public bridge synthetic getResult()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->getResult()Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .locals 2

    .prologue
    .line 199
    new-instance v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    iget-object v1, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->result:Lcom/vkontakte/android/api/Document;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;-><init>(Lcom/vkontakte/android/api/Document;)V

    return-object v0
.end method

.method public bridge synthetic getResult()Lcom/vkontakte/android/attachments/DocumentAttachment;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->getResult()Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    move-result-object v0

    return-object v0
.end method

.method protected getServerRequest()Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 55
    new-instance v0, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;

    iget v1, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->ownerID:I

    const-string/jumbo v2, "audio_message"

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public upload()V
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->isCanceled()Z

    move-result v15

    if-eqz v15, :cond_1

    .line 165
    :cond_0
    return-void

    .line 80
    :cond_1
    new-instance v5, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->file:Ljava/lang/String;

    invoke-direct {v5, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 82
    .local v5, "fileFd":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->waveform:[B

    invoke-static {v15}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v15

    const-string/jumbo v16, " "

    const-string/jumbo v17, ""

    invoke-virtual/range {v15 .. v17}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 83
    .local v3, "data":Ljava/lang/String;
    new-instance v15, Lokhttp3/MultipartBody$Builder;

    invoke-direct {v15}, Lokhttp3/MultipartBody$Builder;-><init>()V

    sget-object v16, Lokhttp3/MultipartBody;->FORM:Lokhttp3/MediaType;

    .line 84
    invoke-virtual/range {v15 .. v16}, Lokhttp3/MultipartBody$Builder;->setType(Lokhttp3/MediaType;)Lokhttp3/MultipartBody$Builder;

    move-result-object v15

    const-string/jumbo v16, "waveform"

    .line 85
    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v3}, Lokhttp3/MultipartBody$Builder;->addFormDataPart(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/MultipartBody$Builder;

    move-result-object v15

    const-string/jumbo v16, "file"

    const-string/jumbo v17, "Audio Message"

    const-string/jumbo v18, "audio/ogg"

    .line 86
    invoke-static/range {v18 .. v18}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v18

    new-instance v19, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->file:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static/range {v18 .. v19}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/io/File;)Lokhttp3/RequestBody;

    move-result-object v18

    invoke-virtual/range {v15 .. v18}, Lokhttp3/MultipartBody$Builder;->addFormDataPart(Ljava/lang/String;Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/MultipartBody$Builder;

    move-result-object v15

    .line 87
    invoke-virtual {v15}, Lokhttp3/MultipartBody$Builder;->build()Lokhttp3/MultipartBody;

    move-result-object v7

    .line 89
    .local v7, "reqBody":Lokhttp3/RequestBody;
    new-instance v15, Lokhttp3/Request$Builder;

    invoke-direct {v15}, Lokhttp3/Request$Builder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->server:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 90
    invoke-virtual/range {v15 .. v16}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v15

    .line 91
    invoke-virtual {v15, v7}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v15

    const-string/jumbo v16, "User-Agent"

    sget-object v17, Lcom/vkontakte/android/api/APIController;->USER_AGENT:Ljava/lang/String;

    .line 92
    invoke-virtual/range {v15 .. v17}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v15

    .line 93
    invoke-virtual {v15}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v6

    .line 94
    .local v6, "req":Lokhttp3/Request;
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v15

    invoke-virtual {v15, v6}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v2

    .line 95
    .local v2, "call":Lokhttp3/Call;
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->currentRequest:Lokhttp3/Call;

    .line 97
    const/4 v8, 0x0

    .line 98
    .local v8, "response":Lokhttp3/Response;
    const/4 v10, -0x1

    .line 99
    .local v10, "responseHttpStatus":I
    const-string/jumbo v9, ""

    .line 100
    .local v9, "responseBody":Ljava/lang/String;
    const/4 v14, 0x0

    .line 101
    .local v14, "uploadException":Ljava/lang/Exception;
    const/4 v13, 0x0

    .line 103
    .local v13, "statsState":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_start_0
    invoke-interface {v2}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v8

    .line 104
    invoke-virtual {v8}, Lokhttp3/Response;->code()I

    move-result v10

    .line 105
    invoke-virtual {v8}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v15

    invoke-virtual {v15}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v9

    .line 106
    sget-boolean v15, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v15, :cond_2

    .line 107
    const-string/jumbo v15, "vk"

    invoke-static {v15, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    :cond_2
    const/16 v15, 0xc8

    if-ne v10, v15, :cond_5

    .line 111
    :try_start_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->extractArgsForSaveFromUploadResponse(Ljava/lang/String;)V

    .line 112
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->SUCCESS:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_end_1
    .catch Lcom/vkontakte/android/upload/UploadException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 133
    :goto_0
    if-eqz v8, :cond_3

    .line 134
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    .line 138
    :cond_3
    :goto_1
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->currentRequest:Lokhttp3/Call;

    .line 140
    new-instance v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;

    invoke-direct {v11}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;-><init>()V

    .line 141
    .local v11, "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->statsGetMethodNameForUploadUrl()Ljava/lang/String;

    move-result-object v15

    iput-object v15, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->methodName:Ljava/lang/String;

    .line 142
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->server:Ljava/lang/String;

    iput-object v15, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->uploadUrl:Ljava/lang/String;

    .line 143
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v16

    move-wide/from16 v0, v16

    iput-wide v0, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileSize:J

    .line 144
    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v15

    iput-object v15, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileName:Ljava/lang/String;

    .line 145
    iput-object v13, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->state:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 146
    iput v10, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->httpStatus:I

    .line 147
    sget-object v15, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->SUCCESS:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    if-ne v13, v15, :cond_4

    const-string/jumbo v9, ""

    .end local v9    # "responseBody":Ljava/lang/String;
    :cond_4
    iput-object v9, v11, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->httpError:Ljava/lang/String;

    .line 151
    new-instance v12, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;

    invoke-direct {v12, v11}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;-><init>(Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;)V

    .line 152
    .local v12, "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    invoke-virtual {v12}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->persistWithToken()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 153
    const/4 v15, 0x1

    iput-boolean v15, v12, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->background:Z

    .line 154
    invoke-virtual {v12}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 156
    if-eqz v14, :cond_0

    .line 157
    instance-of v15, v14, Lcom/vkontakte/android/upload/UploadException;

    if-eqz v15, :cond_8

    .line 158
    const-string/jumbo v15, "vk"

    invoke-static {v15, v14}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 159
    check-cast v14, Lcom/vkontakte/android/upload/UploadException;

    .end local v14    # "uploadException":Ljava/lang/Exception;
    throw v14

    .line 113
    .end local v11    # "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    .end local v12    # "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    .restart local v9    # "responseBody":Ljava/lang/String;
    .restart local v14    # "uploadException":Ljava/lang/Exception;
    :catch_0
    move-exception v4

    .line 114
    .local v4, "ex":Lcom/vkontakte/android/upload/UploadException;
    :try_start_2
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->BAD_RESPONSE:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 115
    move-object v14, v4

    .line 116
    goto :goto_0

    .line 118
    .end local v4    # "ex":Lcom/vkontakte/android/upload/UploadException;
    :cond_5
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->BAD_SERVER:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 119
    new-instance v14, Lcom/vkontakte/android/upload/BadUploadServerException;

    .end local v14    # "uploadException":Ljava/lang/Exception;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Incorrect httpStatus = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lcom/vkontakte/android/upload/BadUploadServerException;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .restart local v14    # "uploadException":Ljava/lang/Exception;
    goto :goto_0

    .line 121
    .end local v14    # "uploadException":Ljava/lang/Exception;
    :catch_1
    move-exception v4

    .line 122
    .local v4, "ex":Ljava/net/SocketTimeoutException;
    :try_start_3
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->TIMEOUT:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 123
    move-object v14, v4

    .line 133
    .restart local v14    # "uploadException":Ljava/lang/Exception;
    if-eqz v8, :cond_3

    .line 134
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    goto :goto_1

    .line 124
    .end local v4    # "ex":Ljava/net/SocketTimeoutException;
    .end local v14    # "uploadException":Ljava/lang/Exception;
    :catch_2
    move-exception v4

    .line 125
    .local v4, "ex":Ljava/io/IOException;
    :try_start_4
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v15

    if-eqz v15, :cond_6

    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->UNKNOWN:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 128
    :goto_2
    move-object v14, v4

    .line 133
    .restart local v14    # "uploadException":Ljava/lang/Exception;
    if-eqz v8, :cond_3

    .line 134
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    goto/16 :goto_1

    .line 125
    .end local v14    # "uploadException":Ljava/lang/Exception;
    :cond_6
    :try_start_5
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->NO_NETWORK:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    goto :goto_2

    .line 129
    .end local v4    # "ex":Ljava/io/IOException;
    :catch_3
    move-exception v4

    .line 130
    .local v4, "ex":Ljava/lang/Exception;
    sget-object v13, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->UNKNOWN:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 131
    move-object v14, v4

    .line 133
    .restart local v14    # "uploadException":Ljava/lang/Exception;
    if-eqz v8, :cond_3

    .line 134
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    goto/16 :goto_1

    .line 133
    .end local v4    # "ex":Ljava/lang/Exception;
    .end local v14    # "uploadException":Ljava/lang/Exception;
    :catchall_0
    move-exception v15

    if-eqz v8, :cond_7

    .line 134
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    :cond_7
    throw v15

    .line 161
    .end local v9    # "responseBody":Ljava/lang/String;
    .restart local v11    # "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    .restart local v12    # "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    .restart local v14    # "uploadException":Ljava/lang/Exception;
    :cond_8
    const-string/jumbo v15, "vk"

    invoke-static {v15, v14}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 162
    new-instance v15, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v16, "can\'t upload"

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v14}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 48
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/DocumentUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->waveform:[B

    array-length v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->waveform:[B

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByteArray([B)V

    .line 51
    return-void
.end method
