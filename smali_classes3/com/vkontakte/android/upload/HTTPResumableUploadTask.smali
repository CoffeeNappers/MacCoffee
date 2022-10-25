.class public abstract Lcom/vkontakte/android/upload/HTTPResumableUploadTask;
.super Lcom/vkontakte/android/upload/UploadTask;
.source "HTTPResumableUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;,
        Lcom/vkontakte/android/upload/HTTPResumableUploadTask$UploadEntity;
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


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x4000

.field private static final DEFAULT_CHUNK_SIZE:I = 0x100000

.field private static final HTTP_RESPONSE_CODE_OK:I = 0xc8

.field private static final INTERVAL_PATTERN:Ljava/lang/String; = "\\d*-\\d*\\/(\\d*|\\*)(,\\d*-\\d*\\/(\\d*|\\*))*$"

.field private static final LOG_ENABLED:Z = true

.field private static final MAX_ATTEMPTS:I = 0x5

.field private static final PREFERENCE_ATTEMPT:Ljava/lang/String; = ".attempt"

.field private static final PREFERENCE_KEY:Ljava/lang/String; = "http.resumable.upload.task."

.field private static final PREFERENCE_PRE_PROCESS_FILE:Ljava/lang/String; = ".preprocess"

.field private static final PREFERENCE_RANGE:Ljava/lang/String; = ".range"

.field private static final PREFERENCE_SESSION:Ljava/lang/String; = ".session"

.field private static final PROGRESS_UPDATE_DELAY:I = 0x96

.field private static final TAG:Ljava/lang/String; = "HTTPResumableUploadTask"


# instance fields
.field private attempt:I

.field private currentRequest:Lokhttp3/Call;

.field protected final file:Ljava/lang/String;

.field private fileWriteFinished:Z

.field private preProcessFilePath:Ljava/lang/String;

.field private final preferences:Landroid/content/SharedPreferences;

.field private ranges:Ljava/lang/String;

.field protected server:Ljava/lang/String;

.field private sessionID:Ljava/lang/String;

.field private final waitLock:Ljava/lang/Object;

.field private writtenFileBytesCount:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 69
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/UploadTask;-><init>(Landroid/content/Context;)V

    .line 55
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->waitLock:Ljava/lang/Object;

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->fileWriteFinished:Z

    .line 70
    iput-object p2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->file:Ljava/lang/String;

    .line 71
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preferences:Landroid/content/SharedPreferences;

    .line 72
    invoke-direct {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->init()V

    .line 73
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    const/4 v0, 0x1

    .line 76
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/UploadTask;-><init>(Landroid/os/Parcel;)V

    .line 55
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->waitLock:Ljava/lang/Object;

    .line 65
    iput-boolean v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->fileWriteFinished:Z

    .line 77
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->file:Ljava/lang/String;

    .line 78
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->server:Ljava/lang/String;

    .line 79
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    .line 80
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->setFileWriteFinished(Z)V

    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preferences:Landroid/content/SharedPreferences;

    .line 82
    invoke-direct {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->init()V

    .line 84
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->isFileWriteFinished()Z

    move-result v0

    if-nez v0, :cond_0

    .line 85
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->setWrittenFileBytesCount(J)V

    .line 86
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->dropState()V

    .line 87
    invoke-direct {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->cleanPreferences()V

    .line 89
    :cond_0
    return-void

    .line 80
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/upload/HTTPResumableUploadTask;)Lokhttp3/Call;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/HTTPResumableUploadTask;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->currentRequest:Lokhttp3/Call;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/upload/HTTPResumableUploadTask;Lokhttp3/Call;)Lokhttp3/Call;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/HTTPResumableUploadTask;
    .param p1, "x1"    # Lokhttp3/Call;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->currentRequest:Lokhttp3/Call;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/upload/HTTPResumableUploadTask;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/HTTPResumableUploadTask;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->cleanPreferences()V

    return-void
.end method

.method private cleanPreferences()V
    .locals 3

    .prologue
    .line 386
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".preprocess"

    .line 387
    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".session"

    .line 388
    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".range"

    .line 389
    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".attempt"

    .line 390
    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 391
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 392
    return-void
.end method

.method private getFileName(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 328
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    const-string/jumbo v1, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 329
    invoke-static {p1}, Lcom/vkontakte/android/upload/UploadUtils;->resolveName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 333
    .local v0, "name":Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->getUserAgent()Lcom/vk/core/network/NetworkUserAgent;

    invoke-static {v0}, Lcom/vk/core/network/NetworkUserAgent;->toHumanReadableAscii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_1
    return-object v1

    .line 331
    .end local v0    # "name":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "name":Ljava/lang/String;
    goto :goto_0

    .line 333
    :cond_1
    const-string/jumbo v1, "video.mp4"

    goto :goto_1
.end method

.method private static getNextRange(Ljava/util/List;JZJ)Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    .locals 17
    .param p1, "fileLength"    # J
    .param p3, "fileLengthFinal"    # Z
    .param p4, "skipNFirstBytesUntilFileIsReady"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;",
            ">;JZJ)",
            "Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 427
    .local p0, "ranges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 428
    if-eqz p3, :cond_0

    .line 429
    const-wide/16 v8, 0x0

    move-wide/from16 v0, p1

    move/from16 v2, p3

    invoke-static {v8, v9, v0, v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getRange(JJZ)Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    move-result-object v7

    .line 446
    :goto_0
    return-object v7

    .line 431
    :cond_0
    move-wide/from16 v0, p4

    move-wide/from16 v2, p1

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getRange(JJZ)Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    move-result-object v7

    goto :goto_0

    .line 433
    :cond_1
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_3

    .line 434
    const/4 v7, 0x0

    move-object/from16 v0, p0

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    .line 435
    .local v6, "first":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    invoke-static {v6}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$000(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v8

    const-wide/16 v10, 0x1

    sub-long v10, p1, v10

    cmp-long v7, v8, v10

    if-nez v7, :cond_2

    .line 436
    new-instance v7, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    invoke-static {v6}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$100(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v8

    const-wide/32 v10, 0x100000

    sub-long/2addr v8, v10

    const-wide/16 v10, 0x0

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    invoke-static {v6}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$100(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v10

    const-wide/16 v12, 0x1

    sub-long/2addr v10, v12

    move-wide/from16 v12, p1

    move/from16 v14, p3

    invoke-direct/range {v7 .. v14}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;-><init>(JJJZ)V

    goto :goto_0

    .line 438
    :cond_2
    invoke-static {v6}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$000(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v8

    move-wide/from16 v0, p1

    move/from16 v2, p3

    invoke-static {v8, v9, v0, v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getRange(JJZ)Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    move-result-object v7

    goto :goto_0

    .line 441
    .end local v6    # "first":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    :cond_3
    const/4 v7, 0x0

    move-object/from16 v0, p0

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    .line 442
    .restart local v6    # "first":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    const/4 v7, 0x1

    move-object/from16 v0, p0

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    .line 443
    .local v15, "second":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    invoke-static {v15}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$100(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v8

    invoke-static {v6}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$000(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v10

    sub-long/2addr v8, v10

    const-wide/32 v10, 0x100000

    cmp-long v7, v8, v10

    if-gtz v7, :cond_4

    .line 444
    new-instance v7, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    invoke-static {v6}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$000(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v8

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    invoke-static {v15}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$100(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v10

    const-wide/16 v12, 0x1

    sub-long/2addr v10, v12

    move-wide/from16 v12, p1

    move/from16 v14, p3

    invoke-direct/range {v7 .. v14}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;-><init>(JJJZ)V

    goto/16 :goto_0

    .line 446
    :cond_4
    invoke-static {v6}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$000(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v8

    move-wide/from16 v0, p1

    move/from16 v2, p3

    invoke-static {v8, v9, v0, v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getRange(JJZ)Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    move-result-object v7

    goto/16 :goto_0
.end method

.method private static getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "taskId"    # I
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 396
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http.resumable.upload.task."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getRange(JJZ)Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    .locals 12
    .param p0, "offset"    # J
    .param p2, "fileLength"    # J
    .param p4, "fileLengthFinal"    # Z

    .prologue
    .line 452
    sub-long v0, p2, p0

    const-wide/32 v2, 0x100000

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    .line 453
    .local v10, "chunk":J
    add-long v0, p0, v10

    const-wide/16 v2, 0x1

    sub-long v4, v0, v2

    .line 454
    .local v4, "end":J
    new-instance v1, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    move-wide v2, p0

    move-wide v6, p2

    move/from16 v8, p4

    invoke-direct/range {v1 .. v8}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;-><init>(JJJZ)V

    return-object v1
.end method

.method private static getUploadedLength(Ljava/util/List;)J
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;",
            ">;)J"
        }
    .end annotation

    .prologue
    .line 400
    .local p0, "ranges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    const-wide/16 v2, 0x0

    .line 401
    .local v2, "upload":J
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    .line 402
    .local v0, "range":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    invoke-static {v0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$400(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 403
    goto :goto_0

    .line 404
    .end local v0    # "range":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    :cond_0
    return-wide v2
.end method

.method private static getUploadedRanges(Ljava/lang/String;JZ)Ljava/util/List;
    .locals 19
    .param p0, "intervals"    # Ljava/lang/String;
    .param p1, "fileLength"    # J
    .param p3, "fileLengthFinal"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "JZ)",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;",
            ">;"
        }
    .end annotation

    .prologue
    .line 408
    if-eqz p0, :cond_0

    const-string/jumbo v3, "\\d*-\\d*\\/(\\d*|\\*)(,\\d*-\\d*\\/(\\d*|\\*))*$"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 409
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    .line 419
    :goto_0
    return-object v3

    .line 411
    :cond_1
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 412
    .local v15, "uploadedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    const-string/jumbo v3, ","

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v18, v0

    const/4 v3, 0x0

    move/from16 v16, v3

    :goto_1
    move/from16 v0, v16

    move/from16 v1, v18

    if-ge v0, v1, :cond_3

    aget-object v12, v17, v16

    .line 413
    .local v12, "interval":Ljava/lang/String;
    const-string/jumbo v3, "-"

    invoke-virtual {v12, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 414
    .local v2, "dash":I
    const-string/jumbo v3, "/"

    invoke-virtual {v12, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v13

    .line 415
    .local v13, "slash":I
    const/4 v3, 0x0

    invoke-virtual {v12, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    .line 416
    .local v14, "start":Ljava/lang/String;
    add-int/lit8 v3, v2, 0x1

    if-lez v13, :cond_2

    .end local v13    # "slash":I
    :goto_2
    invoke-virtual {v12, v3, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    .line 417
    .local v11, "end":Ljava/lang/String;
    new-instance v3, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    move-wide/from16 v8, p1

    move/from16 v10, p3

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;-><init>(JJJZ)V

    invoke-interface {v15, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 412
    add-int/lit8 v3, v16, 0x1

    move/from16 v16, v3

    goto :goto_1

    .line 416
    .end local v11    # "end":Ljava/lang/String;
    .restart local v13    # "slash":I
    :cond_2
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v13

    goto :goto_2

    .line 419
    .end local v2    # "dash":I
    .end local v12    # "interval":Ljava/lang/String;
    .end local v13    # "slash":I
    .end local v14    # "start":Ljava/lang/String;
    :cond_3
    move/from16 v0, p3

    invoke-static {v15, v0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->merge(Ljava/util/List;Z)Ljava/util/List;

    move-result-object v3

    goto :goto_0
.end method

.method private init()V
    .locals 4

    .prologue
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    const/4 v3, 0x0

    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preferences:Landroid/content/SharedPreferences;

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".session"

    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->sessionID:Ljava/lang/String;

    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preferences:Landroid/content/SharedPreferences;

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".preprocess"

    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFilePath:Ljava/lang/String;

    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preferences:Landroid/content/SharedPreferences;

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".range"

    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->ranges:Ljava/lang/String;

    .line 95
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preferences:Landroid/content/SharedPreferences;

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".attempt"

    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->attempt:I

    .line 96
    return-void
.end method

.method private saveToPreferences()V
    .locals 3

    .prologue
    .line 377
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".preprocess"

    .line 378
    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFilePath:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".session"

    .line 379
    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->sessionID:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".range"

    .line 380
    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->ranges:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    const-string/jumbo v2, ".attempt"

    .line 381
    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getPreferenceFullKey(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->attempt:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 382
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 383
    return-void
.end method


# virtual methods
.method public afterUpload()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 339
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    invoke-super {p0}, Lcom/vkontakte/android/upload/UploadTask;->afterUpload()V

    .line 340
    invoke-direct {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->cleanPreferences()V

    .line 341
    return-void
.end method

.method public cancel()V
    .locals 2

    .prologue
    .line 345
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    invoke-super {p0}, Lcom/vkontakte/android/upload/UploadTask;->cancel()V

    .line 346
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->currentRequest:Lokhttp3/Call;

    if-eqz v0, :cond_0

    .line 347
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;-><init>(Lcom/vkontakte/android/upload/HTTPResumableUploadTask;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 356
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 358
    :cond_0
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 364
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public doUpload()V
    .locals 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 154
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFilePath:Ljava/lang/String;

    if-nez v8, :cond_0

    .line 155
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFile()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFilePath:Ljava/lang/String;

    .line 156
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->saveToPreferences()V

    .line 159
    :cond_0
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFilePath:Ljava/lang/String;

    if-nez v8, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->file:Ljava/lang/String;

    move-object/from16 v25, v0

    .line 160
    .local v25, "uploadFile":Ljava/lang/String;
    :goto_0
    new-instance v23, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$UploadEntity;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$UploadEntity;-><init>(Lcom/vkontakte/android/upload/HTTPResumableUploadTask;Ljava/lang/String;)V

    .line 162
    .local v23, "uploadEntity":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$UploadEntity;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>.UploadEntity;"
    const/4 v14, 0x0

    .line 163
    .local v14, "isAllUploaded":Z
    :cond_1
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->isCanceled()Z

    move-result v8

    if-eqz v8, :cond_2

    move-object/from16 v0, p0

    iget v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->attempt:I

    const/4 v9, 0x5

    if-ge v8, v9, :cond_c

    .line 165
    :cond_2
    const-string/jumbo v8, "HTTPResumableUploadTask"

    const-string/jumbo v9, "--------------------"

    invoke-static {v8, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->isFileWriteFinished()Z

    move-result v7

    .line 170
    .local v7, "isFileWriteFinished":Z
    if-eqz v7, :cond_5

    .line 171
    invoke-virtual/range {v23 .. v23}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$UploadEntity;->getFileLength()J

    move-result-wide v5

    .line 176
    .local v5, "fileLength":J
    :goto_2
    const-string/jumbo v8, "HTTPResumableUploadTask"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v28, "File length: "

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->ranges:Ljava/lang/String;

    invoke-static {v8, v5, v6, v7}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getUploadedRanges(Ljava/lang/String;JZ)Ljava/util/List;

    move-result-object v4

    .line 182
    .local v4, "uploadedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    const-string/jumbo v8, "HTTPResumableUploadTask"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v28, "Uploaded ranges: "

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-interface {v4, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->skipNFirstBytesUntilFileIsReady()J

    move-result-wide v8

    cmp-long v8, v5, v8

    if-gtz v8, :cond_6

    const/16 v27, 0x1

    .line 187
    .local v27, "waitingForFirstBytes":Z
    :goto_3
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_7

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    invoke-static {v8}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$000(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v8

    const-wide/16 v28, 0x1

    sub-long v28, v5, v28

    cmp-long v8, v8, v28

    if-nez v8, :cond_7

    const/16 v26, 0x1

    .line 188
    .local v26, "waitingForContinuationBytes":Z
    :goto_4
    if-nez v7, :cond_8

    if-nez v27, :cond_3

    if-eqz v26, :cond_8

    .line 190
    :cond_3
    const-string/jumbo v8, "HTTPResumableUploadTask"

    const-string/jumbo v9, "Waiting for new bytes..."

    invoke-static {v8, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    :try_start_0
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->waitNewBytesWritten(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 194
    :catch_0
    move-exception v12

    .line 196
    .local v12, "e":Ljava/lang/Exception;
    const-string/jumbo v8, "HTTPResumableUploadTask"

    invoke-static {v8, v12}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 197
    new-instance v8, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v9, "can\'t upload"

    invoke-direct {v8, v9, v12}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 159
    .end local v4    # "uploadedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    .end local v5    # "fileLength":J
    .end local v7    # "isFileWriteFinished":Z
    .end local v12    # "e":Ljava/lang/Exception;
    .end local v14    # "isAllUploaded":Z
    .end local v23    # "uploadEntity":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$UploadEntity;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>.UploadEntity;"
    .end local v25    # "uploadFile":Ljava/lang/String;
    .end local v26    # "waitingForContinuationBytes":Z
    .end local v27    # "waitingForFirstBytes":Z
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFilePath:Ljava/lang/String;

    move-object/from16 v25, v0

    goto/16 :goto_0

    .line 173
    .restart local v7    # "isFileWriteFinished":Z
    .restart local v14    # "isAllUploaded":Z
    .restart local v23    # "uploadEntity":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$UploadEntity;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>.UploadEntity;"
    .restart local v25    # "uploadFile":Ljava/lang/String;
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getWrittenFileBytesCount()J

    move-result-wide v5

    .restart local v5    # "fileLength":J
    goto/16 :goto_2

    .line 186
    .restart local v4    # "uploadedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    :cond_6
    const/16 v27, 0x0

    goto :goto_3

    .line 187
    .restart local v27    # "waitingForFirstBytes":Z
    :cond_7
    const/16 v26, 0x0

    goto :goto_4

    .line 202
    .restart local v26    # "waitingForContinuationBytes":Z
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->skipNFirstBytesUntilFileIsReady()J

    move-result-wide v8

    invoke-static/range {v4 .. v9}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getNextRange(Ljava/util/List;JZJ)Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    move-result-object v15

    .line 203
    .local v15, "range":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    invoke-static {v4}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getUploadedLength(Ljava/util/List;)J

    move-result-wide v8

    move-object/from16 v0, v23

    invoke-virtual {v0, v8, v9}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$UploadEntity;->setUploadedLength(J)V

    .line 204
    move-object/from16 v0, v23

    invoke-virtual {v0, v15}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$UploadEntity;->setRange(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)V

    .line 207
    const-string/jumbo v8, "HTTPResumableUploadTask"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v28, "Next upload range: "

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v15}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$100(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v28

    move-wide/from16 v0, v28

    invoke-virtual {v8, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v15}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->access$000(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J

    move-result-wide v28

    move-wide/from16 v0, v28

    invoke-virtual {v8, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 211
    .local v10, "bytes":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-eqz v7, :cond_d

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    :goto_5
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 213
    new-instance v8, Lokhttp3/Request$Builder;

    invoke-direct {v8}, Lokhttp3/Request$Builder;-><init>()V

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->server:Ljava/lang/String;

    .line 214
    invoke-virtual {v8, v9}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v8

    .line 215
    move-object/from16 v0, v23

    invoke-virtual {v8, v0}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v8

    const-string/jumbo v9, "Session-ID"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->sessionID:Ljava/lang/String;

    move-object/from16 v28, v0

    .line 216
    move-object/from16 v0, v28

    invoke-virtual {v8, v9, v0}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v8

    const-string/jumbo v9, "Connection"

    const-string/jumbo v28, "Keep-Alive"

    .line 217
    move-object/from16 v0, v28

    invoke-virtual {v8, v9, v0}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v8

    const-string/jumbo v9, "Content-Disposition"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v29, "attachment; filename=\""

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->file:Ljava/lang/String;

    move-object/from16 v29, v0

    .line 218
    invoke-static/range {v29 .. v29}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v29

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getFileName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string/jumbo v29, "\""

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v8, v9, v0}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v8

    const-string/jumbo v9, "Content-Range"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v29, "bytes "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    .line 219
    move-object/from16 v0, v28

    invoke-virtual {v8, v9, v0}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v8

    .line 220
    invoke-virtual {v8}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v16

    .line 221
    .local v16, "req":Lokhttp3/Request;
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v8

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v11

    .line 222
    .local v11, "call":Lokhttp3/Call;
    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->currentRequest:Lokhttp3/Call;

    .line 225
    const-string/jumbo v8, "HTTPResumableUploadTask"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v28, "Request Content-Range: bytes "

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    const/16 v17, 0x0

    .line 229
    .local v17, "response":Lokhttp3/Response;
    const/16 v19, -0x1

    .line 230
    .local v19, "responseHttpStatus":I
    const-string/jumbo v18, ""

    .line 231
    .local v18, "responseBody":Ljava/lang/String;
    const/16 v24, 0x0

    .line 232
    .local v24, "uploadException":Ljava/lang/Exception;
    const/16 v22, 0x0

    .line 234
    .local v22, "statsState":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_start_1
    invoke-interface {v11}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v17

    .line 235
    const-string/jumbo v8, "Range"

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->ranges:Ljava/lang/String;

    .line 236
    invoke-virtual/range {v17 .. v17}, Lokhttp3/Response;->code()I

    move-result v19

    .line 237
    invoke-virtual/range {v17 .. v17}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v8

    invoke-virtual {v8}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v18

    .line 240
    const-string/jumbo v8, "HTTPResumableUploadTask"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v28, "Response code: "

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    const-string/jumbo v8, "HTTPResumableUploadTask"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v28, "Response range: "

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->ranges:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    const-string/jumbo v8, "HTTPResumableUploadTask"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v28, "Response body: "

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    sget-boolean v8, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v8, :cond_9

    .line 246
    const-string/jumbo v8, "vk"

    move-object/from16 v0, v18

    invoke-static {v8, v0}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    :cond_9
    invoke-virtual/range {v17 .. v17}, Lokhttp3/Response;->isSuccessful()Z

    move-result v8

    if-eqz v8, :cond_f

    .line 250
    const/4 v8, 0x0

    move-object/from16 v0, p0

    iput v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->attempt:I
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 251
    const/16 v8, 0xc8

    move/from16 v0, v19

    if-ne v0, v8, :cond_e

    .line 253
    :try_start_2
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->extractArgsForSaveFromUploadResponse(Ljava/lang/String;)V

    .line 254
    sget-object v22, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->SUCCESS:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_end_2
    .catch Lcom/vkontakte/android/upload/UploadException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 255
    const/4 v14, 0x1

    .line 280
    :goto_6
    if-eqz v17, :cond_a

    .line 281
    invoke-virtual/range {v17 .. v17}, Lokhttp3/Response;->close()V

    .line 285
    :cond_a
    :goto_7
    const/4 v8, 0x0

    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->currentRequest:Lokhttp3/Call;

    .line 286
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->saveToPreferences()V

    .line 288
    new-instance v20, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;

    invoke-direct/range {v20 .. v20}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;-><init>()V

    .line 289
    .local v20, "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->statsGetMethodNameForUploadUrl()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, v20

    iput-object v8, v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->methodName:Ljava/lang/String;

    .line 290
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->server:Ljava/lang/String;

    move-object/from16 v0, v20

    iput-object v8, v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->uploadUrl:Ljava/lang/String;

    .line 291
    if-eqz v7, :cond_12

    .end local v5    # "fileLength":J
    :goto_8
    move-object/from16 v0, v20

    iput-wide v5, v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileSize:J

    .line 292
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->file:Ljava/lang/String;

    invoke-static {v8}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getFileName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, v20

    iput-object v8, v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->fileName:Ljava/lang/String;

    .line 293
    move-object/from16 v0, v22

    move-object/from16 v1, v20

    iput-object v0, v1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->state:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 294
    move/from16 v0, v19

    move-object/from16 v1, v20

    iput v0, v1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->httpStatus:I

    .line 295
    sget-object v8, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->SUCCESS:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    move-object/from16 v0, v22

    if-ne v0, v8, :cond_b

    const-string/jumbo v18, ""

    .end local v18    # "responseBody":Ljava/lang/String;
    :cond_b
    move-object/from16 v0, v18

    move-object/from16 v1, v20

    iput-object v0, v1, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;->httpError:Ljava/lang/String;

    .line 299
    new-instance v21, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;-><init>(Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;)V

    .line 300
    .local v21, "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->persistWithToken()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 301
    const/4 v8, 0x1

    move-object/from16 v0, v21

    iput-boolean v8, v0, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->background:Z

    .line 302
    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 304
    if-eqz v14, :cond_13

    .line 317
    .end local v4    # "uploadedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    .end local v7    # "isFileWriteFinished":Z
    .end local v10    # "bytes":Ljava/lang/String;
    .end local v11    # "call":Lokhttp3/Call;
    .end local v15    # "range":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    .end local v16    # "req":Lokhttp3/Request;
    .end local v17    # "response":Lokhttp3/Response;
    .end local v19    # "responseHttpStatus":I
    .end local v20    # "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    .end local v21    # "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    .end local v22    # "statsState":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    .end local v24    # "uploadException":Ljava/lang/Exception;
    .end local v26    # "waitingForContinuationBytes":Z
    .end local v27    # "waitingForFirstBytes":Z
    :cond_c
    move-object/from16 v0, p0

    iget v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->attempt:I

    const/4 v9, 0x5

    if-lt v8, v9, :cond_15

    .line 318
    new-instance v8, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v9, "can\'t upload: max attempts reached"

    invoke-direct {v8, v9}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 211
    .restart local v4    # "uploadedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    .restart local v5    # "fileLength":J
    .restart local v7    # "isFileWriteFinished":Z
    .restart local v10    # "bytes":Ljava/lang/String;
    .restart local v15    # "range":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    .restart local v26    # "waitingForContinuationBytes":Z
    .restart local v27    # "waitingForFirstBytes":Z
    :cond_d
    const-string/jumbo v8, "*"

    goto/16 :goto_5

    .line 256
    .restart local v11    # "call":Lokhttp3/Call;
    .restart local v16    # "req":Lokhttp3/Request;
    .restart local v17    # "response":Lokhttp3/Response;
    .restart local v18    # "responseBody":Ljava/lang/String;
    .restart local v19    # "responseHttpStatus":I
    .restart local v22    # "statsState":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    .restart local v24    # "uploadException":Ljava/lang/Exception;
    :catch_1
    move-exception v13

    .line 257
    .local v13, "ex":Lcom/vkontakte/android/upload/UploadException;
    :try_start_3
    sget-object v22, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->BAD_RESPONSE:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 258
    move-object/from16 v24, v13

    .line 259
    goto/16 :goto_6

    .line 261
    .end local v13    # "ex":Lcom/vkontakte/android/upload/UploadException;
    :cond_e
    sget-object v22, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->SUCCESS:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    goto/16 :goto_6

    .line 264
    :cond_f
    const-string/jumbo v8, "vk"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v28, "Unexpected response "

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    sget-object v22, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->BAD_SERVER:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    .line 266
    move-object/from16 v0, p0

    iget v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->attempt:I

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p0

    iput v8, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->attempt:I
    :try_end_3
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_6

    .line 268
    :catch_2
    move-exception v13

    .line 269
    .local v13, "ex":Ljava/net/SocketTimeoutException;
    :try_start_4
    sget-object v22, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->TIMEOUT:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 270
    move-object/from16 v24, v13

    .line 280
    if-eqz v17, :cond_a

    .line 281
    invoke-virtual/range {v17 .. v17}, Lokhttp3/Response;->close()V

    goto/16 :goto_7

    .line 271
    .end local v13    # "ex":Ljava/net/SocketTimeoutException;
    :catch_3
    move-exception v13

    .line 272
    .local v13, "ex":Ljava/io/IOException;
    :try_start_5
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v8

    if-eqz v8, :cond_10

    sget-object v22, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->UNKNOWN:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 275
    :goto_9
    move-object/from16 v24, v13

    .line 280
    if-eqz v17, :cond_a

    .line 281
    invoke-virtual/range {v17 .. v17}, Lokhttp3/Response;->close()V

    goto/16 :goto_7

    .line 272
    :cond_10
    :try_start_6
    sget-object v22, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->NO_NETWORK:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;

    goto :goto_9

    .line 276
    .end local v13    # "ex":Ljava/io/IOException;
    :catch_4
    move-exception v13

    .line 277
    .local v13, "ex":Ljava/lang/Exception;
    sget-object v22, Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;->UNKNOWN:Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 278
    move-object/from16 v24, v13

    .line 280
    if-eqz v17, :cond_a

    .line 281
    invoke-virtual/range {v17 .. v17}, Lokhttp3/Response;->close()V

    goto/16 :goto_7

    .line 280
    .end local v13    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    if-eqz v17, :cond_11

    .line 281
    invoke-virtual/range {v17 .. v17}, Lokhttp3/Response;->close()V

    :cond_11
    throw v8

    .line 291
    .restart local v20    # "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    :cond_12
    const-wide/16 v5, 0x0

    goto/16 :goto_8

    .line 306
    .end local v5    # "fileLength":J
    .end local v18    # "responseBody":Ljava/lang/String;
    .restart local v21    # "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    :cond_13
    if-eqz v24, :cond_1

    .line 307
    move-object/from16 v0, v24

    instance-of v8, v0, Lcom/vkontakte/android/upload/UploadException;

    if-eqz v8, :cond_14

    .line 308
    const-string/jumbo v8, "vk"

    move-object/from16 v0, v24

    invoke-static {v8, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 309
    check-cast v24, Lcom/vkontakte/android/upload/UploadException;

    .end local v24    # "uploadException":Ljava/lang/Exception;
    throw v24

    .line 311
    .restart local v24    # "uploadException":Ljava/lang/Exception;
    :cond_14
    const-string/jumbo v8, "vk"

    move-object/from16 v0, v24

    invoke-static {v8, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 312
    new-instance v8, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v9, "can\'t upload"

    move-object/from16 v0, v24

    invoke-direct {v8, v9, v0}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 320
    .end local v4    # "uploadedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    .end local v7    # "isFileWriteFinished":Z
    .end local v10    # "bytes":Ljava/lang/String;
    .end local v11    # "call":Lokhttp3/Call;
    .end local v15    # "range":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    .end local v16    # "req":Lokhttp3/Request;
    .end local v17    # "response":Lokhttp3/Response;
    .end local v19    # "responseHttpStatus":I
    .end local v20    # "statsArgs":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$Args;
    .end local v21    # "statsReq":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest;
    .end local v22    # "statsState":Lcom/vkontakte/android/api/stats/StatsTrackUploadServerStateAPIRequest$State;
    .end local v24    # "uploadException":Ljava/lang/Exception;
    .end local v26    # "waitingForContinuationBytes":Z
    .end local v27    # "waitingForFirstBytes":Z
    :cond_15
    return-void
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
    .line 324
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    return-void
.end method

.method protected getPreProcessFilePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFilePath:Ljava/lang/String;

    return-object v0
.end method

.method protected declared-synchronized getWrittenFileBytesCount()J
    .locals 2

    .prologue
    .line 107
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->writtenFileBytesCount:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized isFileWriteFinished()Z
    .locals 1

    .prologue
    .line 99
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->fileWriteFinished:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected notifyNewBytesWritten()V
    .locals 2

    .prologue
    .line 127
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    iget-object v1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->waitLock:Ljava/lang/Object;

    monitor-enter v1

    .line 128
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->waitLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 129
    monitor-exit v1

    .line 130
    return-void

    .line 129
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected preProcessFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 140
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method protected declared-synchronized setFileWriteFinished(Z)V
    .locals 1
    .param p1, "fileWriteFinished"    # Z

    .prologue
    .line 103
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->fileWriteFinished:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    monitor-exit p0

    return-void

    .line 103
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected setPreProcessFilePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 148
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    iput-object p1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFilePath:Ljava/lang/String;

    .line 149
    invoke-direct {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->saveToPreferences()V

    .line 150
    return-void
.end method

.method protected declared-synchronized setWrittenFileBytesCount(J)V
    .locals 1
    .param p1, "writtenFileBytesCount"    # J

    .prologue
    .line 111
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->writtenFileBytesCount:J

    .line 112
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->notifyNewBytesWritten()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    monitor-exit p0

    return-void

    .line 111
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected abstract skipNFirstBytesUntilFileIsReady()J
.end method

.method protected abstract statsGetMethodNameForUploadUrl()Ljava/lang/String;
.end method

.method protected waitNewBytesWritten(J)V
    .locals 7
    .param p1, "fileLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 118
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->getWrittenFileBytesCount()J

    move-result-wide v0

    .line 119
    .local v0, "actualWrittenFileLength":J
    cmp-long v2, v0, p1

    if-nez v2, :cond_0

    .line 120
    iget-object v3, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->waitLock:Ljava/lang/Object;

    monitor-enter v3

    .line 121
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->waitLock:Ljava/lang/Object;

    const-wide/16 v4, 0xbb8

    invoke-virtual {v2, v4, v5}, Ljava/lang/Object;->wait(J)V

    .line 122
    monitor-exit v3

    .line 124
    :cond_0
    return-void

    .line 122
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 369
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask<TS;>;"
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/UploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 370
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->file:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 371
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->server:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 372
    iget v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 373
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->isFileWriteFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 374
    return-void

    .line 373
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
