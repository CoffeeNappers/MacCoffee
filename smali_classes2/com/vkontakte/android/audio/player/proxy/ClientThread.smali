.class final Lcom/vkontakte/android/audio/player/proxy/ClientThread;
.super Ljava/lang/Thread;
.source "ClientThread.java"


# static fields
.field private static final CACHE_QUEUE:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field private static final LAST_PLAYED_MIDS:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_CACHED_TRACKS:I = 0x3

.field private static volatile sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mHeaderSent:Z

.field private final mMid:Ljava/lang/String;

.field private final mQueryData:Lcom/vkontakte/android/audio/player/proxy/QueryData;

.field private final mSocket:Ljava/nio/channels/SocketChannel;

.field private mSocketClosed:Z

.field private mUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->LAST_PLAYED_MIDS:Ljava/util/LinkedList;

    .line 42
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->CACHE_QUEUE:Ljava/util/LinkedList;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/nio/channels/SocketChannel;Lcom/vkontakte/android/audio/player/proxy/QueryData;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mid"    # Ljava/lang/String;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "socket"    # Ljava/nio/channels/SocketChannel;
    .param p5, "queryData"    # Lcom/vkontakte/android/audio/player/proxy/QueryData;
    .param p6, "client"    # I

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 53
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mContext:Landroid/content/Context;

    .line 54
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mMid:Ljava/lang/String;

    .line 55
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    .line 56
    iput-object p4, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    .line 57
    iput-object p5, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mQueryData:Lcom/vkontakte/android/audio/player/proxy/QueryData;

    .line 58
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "PlayerProxy"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "Client created"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "mid"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    aput-object p2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "client"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 59
    return-void
.end method

.method public static varargs declared-synchronized cache(Landroid/content/Context;[Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "tracks"    # [Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 62
    const-class v1, Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    monitor-enter v1

    :try_start_0
    array-length v0, p1

    if-lez v0, :cond_0

    .line 63
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->CACHE_QUEUE:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 64
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->CACHE_QUEUE:Ljava/util/LinkedList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 66
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    if-nez v0, :cond_1

    .line 67
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->cacheNext(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    :cond_0
    :goto_0
    monitor-exit v1

    return-void

    .line 68
    :cond_1
    :try_start_1
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->hasSocket()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->getMid()Ljava/lang/String;

    move-result-object v2

    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->CACHE_QUEUE:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->cacheNext(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 62
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static declared-synchronized cacheNext(Landroid/content/Context;Ljava/lang/String;)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "currentMid"    # Ljava/lang/String;

    .prologue
    .line 95
    const-class v9, Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    monitor-enter v9

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    if-eqz v0, :cond_0

    .line 96
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->interrupt()V

    .line 97
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    .line 100
    :cond_0
    if-eqz p1, :cond_1

    .line 102
    :goto_0
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->CACHE_QUEUE:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/audio/MusicTrack;

    .line 103
    .local v8, "track":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v8, :cond_1

    invoke-virtual {v8}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 110
    .end local v8    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_1
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->CACHE_QUEUE:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/audio/MusicTrack;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    .restart local v8    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v8, :cond_2

    .line 113
    :try_start_1
    new-instance v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-virtual {v8}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v8, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    sget-object v1, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->CACHE_QUEUE:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    neg-int v6, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/nio/channels/SocketChannel;Lcom/vkontakte/android/audio/player/proxy/QueryData;I)V

    sput-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    .line 114
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    :cond_2
    :goto_1
    monitor-exit v9

    return-void

    .line 106
    :cond_3
    :try_start_2
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->CACHE_QUEUE:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 95
    .end local v8    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    :catchall_0
    move-exception v0

    monitor-exit v9

    throw v0

    .line 115
    .restart local v8    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    :catch_0
    move-exception v7

    .line 116
    .local v7, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-static {v7}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method private handleHttp()V
    .locals 49

    .prologue
    .line 238
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mMid:Ljava/lang/String;

    invoke-static {v4}, Lcom/vkontakte/android/audio/AudioFacade;->getTrackTmpFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v29

    .line 240
    .local v29, "file":Ljava/io/File;
    invoke-static/range {v29 .. v29}, Lcom/vkontakte/android/audio/player/proxy/LockFile;->lock(Ljava/io/File;)Lcom/vkontakte/android/audio/player/proxy/LockFile;

    move-result-object v36

    .line 243
    .local v36, "lockFile":Lcom/vkontakte/android/audio/player/proxy/LockFile;
    :try_start_0
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 245
    const/16 v41, 0x0

    .line 246
    .local v41, "range":Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v4, :cond_0

    .line 247
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mQueryData:Lcom/vkontakte/android/audio/player/proxy/QueryData;

    invoke-virtual {v4}, Lcom/vkontakte/android/audio/player/proxy/QueryData;->getRange()Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;

    move-result-object v41

    .line 248
    if-eqz v41, :cond_0

    invoke-virtual/range {v41 .. v41}, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->isValid()Z

    move-result v4

    if-nez v4, :cond_0

    .line 249
    const/16 v4, 0x1a0

    const-string/jumbo v5, "Requested Range Not Satisfiable"

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderError(ILjava/lang/String;)Z

    .line 251
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "Requested Range not satisfiable"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 465
    .end local v41    # "range":Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    :catch_0
    move-exception v25

    .line 466
    .local v25, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    :try_start_1
    new-array v4, v4, [Ljava/lang/Object;

    move-object/from16 v0, v25

    invoke-static {v0, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 467
    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string/jumbo v8, "PlayerProxy"

    aput-object v8, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v8, "Error"

    aput-object v8, v4, v5

    const/4 v5, 0x2

    const-string/jumbo v8, "exception"

    aput-object v8, v4, v5

    const/4 v5, 0x3

    aput-object v25, v4, v5

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 469
    invoke-virtual/range {v36 .. v36}, Lcom/vkontakte/android/audio/player/proxy/LockFile;->unlock()V

    .line 471
    .end local v25    # "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 255
    .restart local v41    # "range":Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    :cond_0
    const/4 v4, 0x4

    :try_start_2
    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string/jumbo v8, "PlayerProxy"

    aput-object v8, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v8, "Range"

    aput-object v8, v4, v5

    const/4 v5, 0x2

    const-string/jumbo v8, "range"

    aput-object v8, v4, v5

    const/4 v5, 0x3

    aput-object v41, v4, v5

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 257
    new-instance v31, Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    move-object/from16 v0, v31

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;-><init>(Ljava/io/File;)V

    .line 258
    .local v31, "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->exists()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v30

    .line 259
    .local v30, "fileExists":Z
    if-eqz v30, :cond_1

    .line 261
    :try_start_3
    invoke-virtual/range {v31 .. v31}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->load()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 272
    :goto_1
    const/4 v4, 0x4

    :try_start_4
    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string/jumbo v8, "PlayerProxy"

    aput-object v8, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v8, "FileInfo"

    aput-object v8, v4, v5

    const/4 v5, 0x2

    const-string/jumbo v8, "fileInfo"

    aput-object v8, v4, v5

    const/4 v5, 0x3

    aput-object v31, v4, v5

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 274
    move-object/from16 v0, v31

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->split(Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;)Ljava/util/List;

    move-result-object v40

    .line 275
    .local v40, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;>;"
    invoke-interface/range {v40 .. v40}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v39

    check-cast v39, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;

    .line 276
    .local v39, "part":Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "PlayerProxy"

    aput-object v9, v5, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "Part"

    aput-object v9, v5, v8

    const/4 v8, 0x2

    const-string/jumbo v9, "part"

    aput-object v9, v5, v8

    const/4 v8, 0x3

    aput-object v39, v5, v8

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 469
    .end local v30    # "fileExists":Z
    .end local v31    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    .end local v39    # "part":Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    .end local v40    # "parts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;>;"
    .end local v41    # "range":Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    :catchall_0
    move-exception v4

    invoke-virtual/range {v36 .. v36}, Lcom/vkontakte/android/audio/player/proxy/LockFile;->unlock()V

    throw v4

    .line 262
    .restart local v30    # "fileExists":Z
    .restart local v31    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    .restart local v41    # "range":Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    :catch_1
    move-exception v25

    .line 264
    .local v25, "e":Ljava/io/IOException;
    :try_start_5
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->delete()Z

    .line 265
    const/16 v30, 0x0

    .line 266
    goto :goto_1

    .line 268
    .end local v25    # "e":Ljava/io/IOException;
    :cond_1
    invoke-virtual/range {v31 .. v31}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->delete()V

    .line 269
    const/16 v30, 0x0

    goto :goto_1

    .line 277
    .restart local v40    # "parts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;>;"
    :cond_2
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string/jumbo v8, "PlayerProxy"

    aput-object v8, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v8, "Processing parts"

    aput-object v8, v4, v5

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 278
    invoke-interface/range {v40 .. v40}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v39

    check-cast v39, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;

    .line 279
    .restart local v39    # "part":Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "PlayerProxy"

    aput-object v9, v4, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "Part started"

    aput-object v9, v4, v8

    const/4 v8, 0x2

    const-string/jumbo v9, "part"

    aput-object v9, v4, v8

    const/4 v8, 0x3

    aput-object v39, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 281
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->isInterrupted()Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result v4

    if-eqz v4, :cond_3

    .line 469
    invoke-virtual/range {v36 .. v36}, Lcom/vkontakte/android/audio/player/proxy/LockFile;->unlock()V

    goto/16 :goto_0

    .line 284
    :cond_3
    :try_start_6
    move-object/from16 v0, v39

    iget-boolean v4, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->downloaded:Z

    if-eqz v4, :cond_b

    .line 285
    if-nez v30, :cond_4

    .line 286
    const/16 v4, 0x194

    const-string/jumbo v5, "Not Found"

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderError(ILjava/lang/String;)Z

    .line 288
    new-instance v4, Ljava/lang/RuntimeException;

    const-string/jumbo v5, "Part is downloaded but file is not exists"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 291
    :cond_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v4, :cond_9

    .line 292
    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderSuccess(Lcom/vkontakte/android/audio/player/proxy/FileInfo;Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;)Z

    .line 294
    new-instance v28, Ljava/io/RandomAccessFile;

    const-string/jumbo v4, "r"

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-direct {v0, v1, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 296
    .local v28, "f":Ljava/io/RandomAccessFile;
    :try_start_7
    move-object/from16 v0, v39

    iget-wide v8, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    move-object/from16 v0, v28

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 297
    const/16 v4, 0x2800

    new-array v0, v4, [B

    move-object/from16 v20, v0

    .line 298
    .local v20, "buff":[B
    invoke-static/range {v20 .. v20}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v21

    .line 299
    .local v21, "buffer":Ljava/nio/ByteBuffer;
    move-object/from16 v0, v39

    iget-wide v8, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->to:J

    const-wide/16 v12, 0x0

    cmp-long v4, v8, v12

    if-ltz v4, :cond_6

    move-object/from16 v0, v39

    iget-wide v8, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->to:J

    move-object/from16 v0, v39

    iget-wide v12, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    sub-long/2addr v8, v12

    const-wide/16 v12, 0x1

    add-long v26, v8, v12

    .line 301
    .local v26, "elapsed":J
    :goto_4
    move-object/from16 v0, v39

    iget-wide v0, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    move-wide/from16 v42, v0

    .line 303
    .local v42, "pos":J
    :cond_5
    const/4 v4, 0x0

    move-object/from16 v0, v20

    array-length v8, v0

    int-to-long v8, v8

    move-wide/from16 v0, v26

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    long-to-int v8, v8

    move-object/from16 v0, v28

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v4, v8}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v35

    .local v35, "len":I
    if-ltz v35, :cond_8

    .line 305
    move-object/from16 v0, v20

    move/from16 v1, v35

    move-wide/from16 v2, v42

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/audio/utils/Utils;->doXor([BIJ)V

    .line 306
    move/from16 v0, v35

    int-to-long v8, v0

    add-long v42, v42, v8

    .line 308
    invoke-virtual/range {v21 .. v21}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 309
    move-object/from16 v0, v21

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 311
    :goto_5
    invoke-virtual/range {v21 .. v21}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 312
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->writeToTheSocket(Ljava/nio/ByteBuffer;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_5

    .line 321
    .end local v20    # "buff":[B
    .end local v21    # "buffer":Ljava/nio/ByteBuffer;
    .end local v26    # "elapsed":J
    .end local v35    # "len":I
    .end local v42    # "pos":J
    :catchall_1
    move-exception v4

    :try_start_8
    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    throw v4

    .line 299
    .restart local v20    # "buff":[B
    .restart local v21    # "buffer":Ljava/nio/ByteBuffer;
    :cond_6
    const-wide v26, 0x7fffffffffffffffL

    goto :goto_4

    .line 314
    .restart local v26    # "elapsed":J
    .restart local v35    # "len":I
    .restart local v42    # "pos":J
    :cond_7
    move/from16 v0, v35

    int-to-long v8, v0

    sub-long v26, v26, v8

    .line 315
    const-wide/16 v8, 0x0

    cmp-long v4, v26, v8

    if-gtz v4, :cond_a

    .line 321
    :cond_8
    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 463
    .end local v20    # "buff":[B
    .end local v21    # "buffer":Ljava/nio/ByteBuffer;
    .end local v26    # "elapsed":J
    .end local v28    # "f":Ljava/io/RandomAccessFile;
    .end local v35    # "len":I
    .end local v42    # "pos":J
    :cond_9
    :goto_6
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "PlayerProxy"

    aput-object v9, v4, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "Part finished"

    aput-object v9, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_3

    .line 317
    .restart local v20    # "buff":[B
    .restart local v21    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v26    # "elapsed":J
    .restart local v28    # "f":Ljava/io/RandomAccessFile;
    .restart local v35    # "len":I
    .restart local v42    # "pos":J
    :cond_a
    :try_start_9
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->isInterrupted()Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    move-result v4

    if-eqz v4, :cond_5

    .line 321
    :try_start_a
    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 469
    invoke-virtual/range {v36 .. v36}, Lcom/vkontakte/android/audio/player/proxy/LockFile;->unlock()V

    goto/16 :goto_0

    .line 325
    .end local v20    # "buff":[B
    .end local v21    # "buffer":Ljava/nio/ByteBuffer;
    .end local v26    # "elapsed":J
    .end local v28    # "f":Ljava/io/RandomAccessFile;
    .end local v35    # "len":I
    .end local v42    # "pos":J
    :cond_b
    :try_start_b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/vkontakte/android/audio/utils/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_d

    .line 326
    const/16 v4, 0x194

    const-string/jumbo v5, "Not Found"

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderError(ILjava/lang/String;)Z

    .line 327
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v4, :cond_c

    .line 328
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerIntents;->stop()V

    .line 330
    :cond_c
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "No connection"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 334
    :cond_d
    const/4 v10, 0x0

    .line 335
    .local v10, "statusCode":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    move-result-wide v46

    .line 336
    .local v46, "startLoadTime":J
    const-wide/16 v6, 0x0

    .line 340
    .local v6, "bytesLoaded":J
    :try_start_c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mMid:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    move-object/from16 v0, v39

    invoke-static {v0, v4, v8}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->requestWithUpdateUrl(Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/util/Pair;

    move-result-object v38

    .line 341
    .local v38, "pair":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lokhttp3/Response;Ljava/lang/String;>;"
    move-object/from16 v0, v38

    iget-object v0, v0, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    move-object/from16 v44, v0

    check-cast v44, Lokhttp3/Response;

    .line 342
    .local v44, "response":Lokhttp3/Response;
    move-object/from16 v0, v38

    iget-object v4, v0, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    .line 343
    invoke-virtual/range {v44 .. v44}, Lokhttp3/Response;->code()I

    move-result v10

    .line 345
    const/16 v4, 0xce

    if-eq v10, v4, :cond_f

    .line 346
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Invalid status code: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 449
    .end local v38    # "pair":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lokhttp3/Response;Ljava/lang/String;>;"
    .end local v44    # "response":Lokhttp3/Response;
    :catch_2
    move-exception v11

    .line 450
    .local v11, "e1":Ljava/lang/Exception;
    :try_start_d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    if-eqz v4, :cond_e

    .line 451
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    .line 452
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v8, v8, v46

    .line 451
    invoke-virtual/range {v4 .. v11}, Lcom/vkontakte/android/data/BenchmarkTracker;->trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V

    .line 454
    :cond_e
    throw v11
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 348
    .end local v11    # "e1":Ljava/lang/Exception;
    .restart local v38    # "pair":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lokhttp3/Response;Ljava/lang/String;>;"
    .restart local v44    # "response":Lokhttp3/Response;
    :cond_f
    :try_start_e
    invoke-virtual/range {v44 .. v44}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v22

    .line 350
    .local v22, "contentLength":J
    if-eqz v30, :cond_12

    .line 351
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "PlayerProxy"

    aput-object v9, v4, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "File exists"

    aput-object v9, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 396
    :goto_7
    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderSuccess(Lcom/vkontakte/android/audio/player/proxy/FileInfo;Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;)Z

    .line 398
    new-instance v34, Ljava/io/BufferedInputStream;

    invoke-virtual/range {v44 .. v44}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v4

    move-object/from16 v0, v34

    invoke-direct {v0, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_2
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .line 400
    .local v34, "in":Ljava/io/InputStream;
    const/4 v4, 0x2

    :try_start_f
    new-array v4, v4, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "PlayerProxy"

    aput-object v9, v4, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "Downloading part"

    aput-object v9, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .line 401
    const/16 v45, 0x0

    .line 403
    .local v45, "writtenCount":I
    :try_start_10
    new-instance v28, Ljava/io/RandomAccessFile;

    const-string/jumbo v4, "rws"

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-direct {v0, v1, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    .line 405
    .restart local v28    # "f":Ljava/io/RandomAccessFile;
    :try_start_11
    move-object/from16 v0, v39

    iget-wide v8, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    move-object/from16 v0, v28

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 407
    const/16 v4, 0x2800

    new-array v0, v4, [B

    move-object/from16 v20, v0

    .line 408
    .restart local v20    # "buff":[B
    invoke-static/range {v20 .. v20}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v21

    .line 410
    .restart local v21    # "buffer":Ljava/nio/ByteBuffer;
    move-object/from16 v0, v39

    iget-wide v0, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    move-wide/from16 v42, v0

    .line 412
    .restart local v42    # "pos":J
    :cond_10
    move-object/from16 v0, v34

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v35

    .restart local v35    # "len":I
    if-ltz v35, :cond_19

    .line 413
    move/from16 v0, v35

    int-to-long v8, v0

    add-long/2addr v6, v8

    .line 415
    move-object/from16 v0, v20

    move/from16 v1, v35

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v48

    .line 417
    .local v48, "xoredBuff":[B
    move-object/from16 v0, v48

    move/from16 v1, v35

    move-wide/from16 v2, v42

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/audio/utils/Utils;->doXor([BIJ)V

    .line 418
    move/from16 v0, v35

    int-to-long v8, v0

    add-long v42, v42, v8

    .line 419
    const/4 v4, 0x0

    move-object/from16 v0, v28

    move-object/from16 v1, v48

    move/from16 v2, v35

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 420
    add-int v45, v45, v35

    .line 422
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v4, :cond_17

    .line 423
    invoke-virtual/range {v21 .. v21}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 424
    move-object/from16 v0, v21

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 425
    :goto_8
    invoke-virtual/range {v21 .. v21}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-eqz v4, :cond_16

    .line 426
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->writeToTheSocket(Ljava/nio/ByteBuffer;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    goto :goto_8

    .line 435
    .end local v20    # "buff":[B
    .end local v21    # "buffer":Ljava/nio/ByteBuffer;
    .end local v35    # "len":I
    .end local v42    # "pos":J
    .end local v48    # "xoredBuff":[B
    :catchall_2
    move-exception v4

    :try_start_12
    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    throw v4
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    .line 438
    .end local v28    # "f":Ljava/io/RandomAccessFile;
    :catchall_3
    move-exception v4

    if-lez v45, :cond_11

    .line 439
    :try_start_13
    move-object/from16 v0, v39

    iget-wide v8, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    move-object/from16 v0, v39

    iget-wide v12, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    move/from16 v0, v45

    int-to-long v14, v0

    add-long/2addr v12, v14

    const-wide/16 v14, 0x1

    sub-long/2addr v12, v14

    move-object/from16 v0, v31

    invoke-virtual {v0, v8, v9, v12, v13}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->addRange(JJ)V

    .line 440
    invoke-virtual/range {v31 .. v31}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->save()V

    :cond_11
    throw v4
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_4

    .line 444
    .end local v45    # "writtenCount":I
    :catchall_4
    move-exception v4

    const/4 v5, 0x2

    :try_start_14
    new-array v5, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "PlayerProxy"

    aput-object v9, v5, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "Part downloaded"

    aput-object v9, v5, v8

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 445
    invoke-static/range {v34 .. v34}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    throw v4

    .line 353
    .end local v34    # "in":Ljava/io/InputStream;
    :cond_12
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "PlayerProxy"

    aput-object v9, v4, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "Creating new file"

    aput-object v9, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 355
    const-wide/16 v8, 0x0

    cmp-long v4, v22, v8

    if-nez v4, :cond_13

    .line 356
    const/16 v4, 0x1f4

    const-string/jumbo v5, "Internal Server Error"

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderError(ILjava/lang/String;)Z

    .line 358
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "No contentLength header"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 361
    :cond_13
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v32

    .line 362
    .local v32, "freeSpace":J
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/audio/player/CacheUtils;->clearOldCache(Ljava/io/File;)V

    .line 363
    const-wide/32 v8, 0x1400000

    move-wide/from16 v0, v22

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    cmp-long v4, v32, v8

    if-gez v4, :cond_14

    .line 364
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/audio/player/CacheUtils;->clearCache(Ljava/io/File;)V

    .line 365
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v32

    .line 366
    const-wide/32 v8, 0x1400000

    move-wide/from16 v0, v22

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    cmp-long v4, v32, v8

    if-gez v4, :cond_14

    .line 367
    const/16 v4, 0x1f4

    const-string/jumbo v5, "Internal Server Error"

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderError(ILjava/lang/String;)Z

    .line 369
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Not enough free space: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v32

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 373
    :cond_14
    new-instance v37, Ljava/io/FileOutputStream;

    move-object/from16 v0, v37

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_2
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    .line 375
    .local v37, "out":Ljava/io/FileOutputStream;
    const/high16 v4, 0x20000

    :try_start_15
    new-array v0, v4, [B

    move-object/from16 v20, v0

    .line 376
    .restart local v20    # "buff":[B
    move-wide/from16 v26, v22

    .line 377
    .restart local v26    # "elapsed":J
    :goto_9
    const-wide/16 v8, 0x0

    cmp-long v4, v26, v8

    if-lez v4, :cond_15

    .line 378
    move-object/from16 v0, v20

    array-length v4, v0

    int-to-long v8, v4

    move-wide/from16 v0, v26

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    long-to-int v0, v8

    move/from16 v24, v0

    .line 379
    .local v24, "count":I
    const/4 v4, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, v20

    move/from16 v2, v24

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/FileOutputStream;->write([BII)V

    .line 380
    move/from16 v0, v24

    int-to-long v8, v0

    sub-long v26, v26, v8

    .line 381
    goto :goto_9

    .line 382
    .end local v24    # "count":I
    :cond_15
    invoke-virtual/range {v37 .. v37}, Ljava/io/FileOutputStream;->flush()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_5

    .line 384
    :try_start_16
    invoke-static/range {v37 .. v37}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 387
    move-object/from16 v0, v31

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->setContentLength(J)V

    .line 388
    invoke-virtual/range {v44 .. v44}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->contentType()Lokhttp3/MediaType;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/MediaType;->type()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->setContentType(Ljava/lang/String;)V

    .line 389
    invoke-virtual/range {v31 .. v31}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->save()V

    .line 391
    const/16 v30, 0x1

    .line 393
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "PlayerProxy"

    aput-object v9, v4, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "File created"

    aput-object v9, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 384
    .end local v20    # "buff":[B
    .end local v26    # "elapsed":J
    :catchall_5
    move-exception v4

    invoke-static/range {v37 .. v37}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    throw v4
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_2
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    .line 428
    .end local v32    # "freeSpace":J
    .end local v37    # "out":Ljava/io/FileOutputStream;
    .restart local v20    # "buff":[B
    .restart local v21    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v28    # "f":Ljava/io/RandomAccessFile;
    .restart local v34    # "in":Ljava/io/InputStream;
    .restart local v35    # "len":I
    .restart local v42    # "pos":J
    .restart local v45    # "writtenCount":I
    .restart local v48    # "xoredBuff":[B
    :cond_16
    :try_start_17
    invoke-virtual/range {v21 .. v21}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 430
    :cond_17
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->isInterrupted()Z
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_2

    move-result v4

    if-eqz v4, :cond_10

    .line 435
    :try_start_18
    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_3

    .line 438
    if-lez v45, :cond_18

    .line 439
    :try_start_19
    move-object/from16 v0, v39

    iget-wide v4, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    move-object/from16 v0, v39

    iget-wide v8, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    move/from16 v0, v45

    int-to-long v12, v0

    add-long/2addr v8, v12

    const-wide/16 v12, 0x1

    sub-long/2addr v8, v12

    move-object/from16 v0, v31

    invoke-virtual {v0, v4, v5, v8, v9}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->addRange(JJ)V

    .line 440
    invoke-virtual/range {v31 .. v31}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->save()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_4

    .line 444
    :cond_18
    const/4 v4, 0x2

    :try_start_1a
    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string/jumbo v8, "PlayerProxy"

    aput-object v8, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v8, "Part downloaded"

    aput-object v8, v4, v5

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 445
    invoke-static/range {v34 .. v34}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_2
    .catchall {:try_start_1a .. :try_end_1a} :catchall_0

    .line 469
    invoke-virtual/range {v36 .. v36}, Lcom/vkontakte/android/audio/player/proxy/LockFile;->unlock()V

    goto/16 :goto_0

    .line 433
    .end local v48    # "xoredBuff":[B
    :cond_19
    :try_start_1b
    invoke-virtual/range {v28 .. v28}, Ljava/io/RandomAccessFile;->getFD()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/FileDescriptor;->sync()V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_2

    .line 435
    :try_start_1c
    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_3

    .line 438
    if-lez v45, :cond_1a

    .line 439
    :try_start_1d
    move-object/from16 v0, v39

    iget-wide v8, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    move-object/from16 v0, v39

    iget-wide v12, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    move/from16 v0, v45

    int-to-long v14, v0

    add-long/2addr v12, v14

    const-wide/16 v14, 0x1

    sub-long/2addr v12, v14

    move-object/from16 v0, v31

    invoke-virtual {v0, v8, v9, v12, v13}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->addRange(JJ)V

    .line 440
    invoke-virtual/range {v31 .. v31}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->save()V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_4

    .line 444
    :cond_1a
    const/4 v4, 0x2

    :try_start_1e
    new-array v4, v4, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "PlayerProxy"

    aput-object v9, v4, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "Part downloaded"

    aput-object v9, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 445
    invoke-static/range {v34 .. v34}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_2
    .catchall {:try_start_1e .. :try_end_1e} :catchall_0

    .line 456
    :try_start_1f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    if-eqz v4, :cond_9

    .line 457
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    .line 458
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v16, v8, v46

    const/16 v19, 0x0

    move-wide v14, v6

    move/from16 v18, v10

    .line 457
    invoke-virtual/range {v12 .. v19}, Lcom/vkontakte/android/data/BenchmarkTracker;->trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_0
    .catchall {:try_start_1f .. :try_end_1f} :catchall_0

    goto/16 :goto_6

    .line 469
    .end local v6    # "bytesLoaded":J
    .end local v10    # "statusCode":I
    .end local v20    # "buff":[B
    .end local v21    # "buffer":Ljava/nio/ByteBuffer;
    .end local v22    # "contentLength":J
    .end local v28    # "f":Ljava/io/RandomAccessFile;
    .end local v34    # "in":Ljava/io/InputStream;
    .end local v35    # "len":I
    .end local v38    # "pair":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lokhttp3/Response;Ljava/lang/String;>;"
    .end local v39    # "part":Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    .end local v42    # "pos":J
    .end local v44    # "response":Lokhttp3/Response;
    .end local v45    # "writtenCount":I
    .end local v46    # "startLoadTime":J
    :cond_1b
    invoke-virtual/range {v36 .. v36}, Lcom/vkontakte/android/audio/player/proxy/LockFile;->unlock()V

    goto/16 :goto_0
.end method

.method private handleUri()V
    .locals 22

    .prologue
    .line 159
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-nez v15, :cond_0

    .line 235
    :goto_0
    return-void

    .line 163
    :cond_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    const-string/jumbo v18, "content://"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-result v15

    if-nez v15, :cond_1

    const/4 v10, 0x1

    .line 167
    .local v10, "isXored":Z
    :goto_1
    :try_start_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mContext:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move-result-object v7

    .line 174
    .local v7, "in":Ljava/io/InputStream;
    if-nez v7, :cond_2

    .line 175
    const/16 v15, 0x194

    :try_start_2
    const-string/jumbo v18, "Not found"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v15, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderError(ILjava/lang/String;)Z

    .line 177
    new-instance v15, Ljava/io/IOException;

    const-string/jumbo v18, "Input stream is null"

    move-object/from16 v0, v18

    invoke-direct {v15, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15
    :try_end_2
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 228
    .end local v7    # "in":Ljava/io/InputStream;
    .end local v10    # "isXored":Z
    :catch_0
    move-exception v6

    .line 229
    .local v6, "e":Ljava/io/IOException;
    :goto_2
    const/4 v15, 0x4

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v18, 0x0

    const-string/jumbo v19, "PlayerProxy"

    aput-object v19, v15, v18

    const/16 v18, 0x1

    const-string/jumbo v19, "Error"

    aput-object v19, v15, v18

    const/16 v18, 0x2

    const-string/jumbo v19, "exception"

    aput-object v19, v15, v18

    const/16 v18, 0x3

    aput-object v6, v15, v18

    invoke-static {v15}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    goto :goto_0

    .line 163
    .end local v6    # "e":Ljava/io/IOException;
    :cond_1
    const/4 v10, 0x0

    goto :goto_1

    .line 168
    .restart local v10    # "isXored":Z
    :catch_1
    move-exception v6

    .line 169
    .local v6, "e":Ljava/io/FileNotFoundException;
    const/16 v15, 0x194

    :try_start_3
    const-string/jumbo v18, "Not Found"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v15, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderError(ILjava/lang/String;)Z

    .line 171
    throw v6
    :try_end_3
    .catch Ljava/net/SocketException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 228
    .end local v6    # "e":Ljava/io/FileNotFoundException;
    .end local v10    # "isXored":Z
    :catch_2
    move-exception v6

    goto :goto_2

    .line 181
    .restart local v7    # "in":Ljava/io/InputStream;
    .restart local v10    # "isXored":Z
    :cond_2
    :try_start_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mQueryData:Lcom/vkontakte/android/audio/player/proxy/QueryData;

    invoke-virtual {v15}, Lcom/vkontakte/android/audio/player/proxy/QueryData;->getRange()Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;

    move-result-object v14

    .line 182
    .local v14, "range":Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    if-eqz v14, :cond_3

    invoke-virtual {v14}, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->isValid()Z

    move-result v15

    if-nez v15, :cond_3

    .line 183
    const/16 v15, 0x1a0

    const-string/jumbo v18, "Requested Range Not Satisfiable"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v15, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderError(ILjava/lang/String;)Z

    .line 185
    new-instance v15, Ljava/io/IOException;

    const-string/jumbo v18, "Requested Range not satisfiable"

    move-object/from16 v0, v18

    invoke-direct {v15, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 226
    .end local v14    # "range":Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    :catchall_0
    move-exception v15

    :try_start_5
    invoke-static {v7}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    throw v15
    :try_end_5
    .catch Ljava/net/SocketException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 230
    .end local v7    # "in":Ljava/io/InputStream;
    .end local v10    # "isXored":Z
    :catch_3
    move-exception v6

    .line 231
    .local v6, "e":Ljava/lang/Exception;
    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/Object;

    invoke-static {v6, v15}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 233
    const/4 v15, 0x4

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v18, 0x0

    const-string/jumbo v19, "PlayerProxy"

    aput-object v19, v15, v18

    const/16 v18, 0x1

    const-string/jumbo v19, "Error"

    aput-object v19, v15, v18

    const/16 v18, 0x2

    const-string/jumbo v19, "exception"

    aput-object v19, v15, v18

    const/16 v18, 0x3

    aput-object v6, v15, v18

    invoke-static {v15}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 188
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v7    # "in":Ljava/io/InputStream;
    .restart local v10    # "isXored":Z
    .restart local v14    # "range":Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    :cond_3
    :try_start_6
    invoke-virtual {v7}, Ljava/io/InputStream;->available()I

    move-result v15

    int-to-long v0, v15

    move-wide/from16 v18, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v14, v1, v2}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendHeaderSuccess(Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;J)Z

    .line 190
    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v18, 0x0

    const-string/jumbo v19, "PlayerProxy"

    aput-object v19, v15, v18

    const/16 v18, 0x1

    const-string/jumbo v19, "Sending file"

    aput-object v19, v15, v18

    invoke-static {v15}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 192
    const/16 v15, 0x2800

    new-array v4, v15, [B

    .line 193
    .local v4, "buff":[B
    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 195
    .local v5, "buffer":Ljava/nio/ByteBuffer;
    if-eqz v14, :cond_4

    .line 196
    iget-wide v0, v14, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    move-wide/from16 v16, v0

    .line 197
    .local v16, "skipCount":J
    :goto_3
    const-wide/16 v18, 0x0

    cmp-long v15, v16, v18

    if-lez v15, :cond_4

    .line 198
    move-wide/from16 v0, v16

    invoke-virtual {v7, v0, v1}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v18

    sub-long v16, v16, v18

    goto :goto_3

    .line 201
    .end local v16    # "skipCount":J
    :cond_4
    if-eqz v14, :cond_5

    iget-object v15, v14, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    if-nez v15, :cond_8

    :cond_5
    const-wide v8, 0x7fffffffffffffffL

    .line 203
    .local v8, "elapsed":J
    :goto_4
    if-eqz v14, :cond_9

    iget-wide v12, v14, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    .line 205
    .local v12, "pos":J
    :cond_6
    :goto_5
    const/4 v15, 0x0

    array-length v0, v4

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v18

    move-wide/from16 v0, v18

    long-to-int v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-virtual {v7, v4, v15, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v11

    .local v11, "len":I
    if-ltz v11, :cond_b

    .line 206
    if-eqz v10, :cond_7

    .line 208
    invoke-static {v4, v11, v12, v13}, Lcom/vkontakte/android/audio/utils/Utils;->doXor([BIJ)V

    .line 209
    int-to-long v0, v11

    move-wide/from16 v18, v0

    add-long v12, v12, v18

    .line 212
    :cond_7
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 213
    invoke-virtual {v5, v11}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 214
    :goto_6
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v15

    if-eqz v15, :cond_a

    .line 215
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->writeToTheSocket(Ljava/nio/ByteBuffer;)V

    goto :goto_6

    .line 201
    .end local v8    # "elapsed":J
    .end local v11    # "len":I
    .end local v12    # "pos":J
    :cond_8
    iget-object v15, v14, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    move-result-wide v18

    iget-wide v0, v14, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    move-wide/from16 v20, v0

    sub-long v18, v18, v20

    const-wide/16 v20, 0x1

    add-long v8, v18, v20

    goto :goto_4

    .line 203
    .restart local v8    # "elapsed":J
    :cond_9
    const-wide/16 v12, 0x0

    goto :goto_5

    .line 217
    .restart local v11    # "len":I
    .restart local v12    # "pos":J
    :cond_a
    int-to-long v0, v11

    move-wide/from16 v18, v0

    sub-long v8, v8, v18

    .line 218
    const-wide/16 v18, 0x0

    cmp-long v15, v8, v18

    if-gtz v15, :cond_c

    .line 224
    :cond_b
    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v18, 0x0

    const-string/jumbo v19, "PlayerProxy"

    aput-object v19, v15, v18

    const/16 v18, 0x1

    const-string/jumbo v19, "File sent"

    aput-object v19, v15, v18

    invoke-static {v15}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 226
    :try_start_7
    invoke-static {v7}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V
    :try_end_7
    .catch Ljava/net/SocketException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    goto/16 :goto_0

    .line 220
    :cond_c
    :try_start_8
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->isInterrupted()Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    move-result v15

    if-eqz v15, :cond_6

    .line 226
    :try_start_9
    invoke-static {v7}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V
    :try_end_9
    .catch Ljava/net/SocketException; {:try_start_9 .. :try_end_9} :catch_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    goto/16 :goto_0
.end method

.method private hasSocket()Z
    .locals 1

    .prologue
    .line 528
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized play(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/nio/channels/SocketChannel;Lcom/vkontakte/android/audio/player/proxy/QueryData;I)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mid"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "socket"    # Ljava/nio/channels/SocketChannel;
    .param p4, "queryData"    # Lcom/vkontakte/android/audio/player/proxy/QueryData;
    .param p5, "client"    # I

    .prologue
    .line 74
    const-class v8, Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    monitor-enter v8

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->LAST_PLAYED_MIDS:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v7

    .line 75
    .local v7, "removed":Z
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->LAST_PLAYED_MIDS:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 76
    if-nez v7, :cond_0

    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->LAST_PLAYED_MIDS:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/4 v1, 0x3

    if-le v0, v1, :cond_0

    .line 77
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->LAST_PLAYED_MIDS:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 79
    :cond_0
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    if-eqz v0, :cond_1

    .line 80
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->interrupt()V

    .line 82
    :cond_1
    new-instance v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/nio/channels/SocketChannel;Lcom/vkontakte/android/audio/player/proxy/QueryData;I)V

    sput-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    .line 83
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    monitor-exit v8

    return-void

    .line 74
    .end local v7    # "removed":Z
    :catchall_0
    move-exception v0

    monitor-exit v8

    throw v0
.end method

.method private static request(Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;Ljava/lang/String;)Lokhttp3/Response;
    .locals 8
    .param p0, "part"    # Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 501
    new-array v2, v7, [Ljava/lang/Object;

    aput-object p1, v2, v6

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 502
    new-instance v2, Lokhttp3/Request$Builder;

    invoke-direct {v2}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v2, p1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v0

    .line 503
    .local v0, "builder":Lokhttp3/Request$Builder;
    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->to:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 504
    const-string/jumbo v2, "Range"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "bytes="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->to:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 508
    :goto_0
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v2

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    invoke-virtual {v2, v3}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v2

    invoke-interface {v2}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1

    .line 509
    .local v1, "response":Lokhttp3/Response;
    new-array v2, v7, [Ljava/lang/Object;

    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 510
    return-object v1

    .line 506
    .end local v1    # "response":Lokhttp3/Response;
    :cond_0
    const-string/jumbo v2, "Range"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "bytes="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_0
.end method

.method private static requestWithUpdateUrl(Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/util/Pair;
    .locals 8
    .param p0, "part"    # Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    .param p1, "mid"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lokhttp3/Response;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x3

    const/4 v7, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 474
    new-array v3, v3, [Ljava/lang/Object;

    const-string/jumbo v4, "Old link"

    aput-object v4, v3, v6

    aput-object p1, v3, v5

    aput-object p2, v3, v7

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 475
    if-nez p2, :cond_0

    .line 477
    :try_start_0
    invoke-static {p1}, Lcom/vkontakte/android/audio/MusicApp;->getActualLink(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p2

    .line 481
    :goto_0
    invoke-static {p0, p2}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->request(Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;Ljava/lang/String;)Lokhttp3/Response;

    move-result-object v3

    invoke-static {v3, p2}, Landroid/support/v4/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/support/v4/util/Pair;

    move-result-object v3

    .line 496
    :goto_1
    return-object v3

    .line 478
    :catch_0
    move-exception v0

    .line 479
    .local v0, "e":Ljava/lang/Exception;
    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 483
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    new-array v3, v7, [Ljava/lang/Object;

    aput-object p0, v3, v6

    aput-object p2, v3, v5

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 484
    invoke-static {p0, p2}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->request(Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;Ljava/lang/String;)Lokhttp3/Response;

    move-result-object v1

    .line 485
    .local v1, "response":Lokhttp3/Response;
    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result v2

    .line 486
    .local v2, "statusCode":I
    const/16 v3, 0x194

    if-ne v2, v3, :cond_1

    .line 488
    :try_start_1
    invoke-static {p1}, Lcom/vkontakte/android/audio/MusicApp;->getActualLink(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 489
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "New link"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const/4 v4, 0x2

    aput-object p2, v3, v4

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 490
    invoke-static {p0, p2}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->request(Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;Ljava/lang/String;)Lokhttp3/Response;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 496
    :cond_1
    :goto_2
    invoke-static {v1, p2}, Landroid/support/v4/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/support/v4/util/Pair;

    move-result-object v3

    goto :goto_1

    .line 491
    :catch_1
    move-exception v0

    .line 492
    .restart local v0    # "e":Ljava/lang/Exception;
    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_2
.end method

.method private sendHeaderError(ILjava/lang/String;)Z
    .locals 3
    .param p1, "errorCode"    # I
    .param p2, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 592
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mHeaderSent:Z

    if-eqz v1, :cond_1

    .line 593
    :cond_0
    const/4 v0, 0x0

    .line 605
    :goto_0
    return v0

    .line 595
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "HTTP/1.1 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 596
    const-string/jumbo v1, "Server: local proxy server"

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 597
    const-string/jumbo v1, "Connection: close"

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 598
    const-string/jumbo v1, "Content-Type: text/plain"

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 599
    const-string/jumbo v1, "Content-Length: 0"

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 600
    const-string/jumbo v1, ""

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 601
    const-string/jumbo v1, ""

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 603
    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mHeaderSent:Z

    goto :goto_0
.end method

.method private sendHeaderSuccess(Lcom/vkontakte/android/audio/player/proxy/FileInfo;Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;)Z
    .locals 12
    .param p1, "fileInfo"    # Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    .param p2, "range"    # Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v10, 0x1

    const/4 v3, 0x1

    .line 536
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v6, :cond_0

    iget-boolean v6, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mHeaderSent:Z

    if-eqz v6, :cond_1

    .line 537
    :cond_0
    const/4 v3, 0x0

    .line 562
    :goto_0
    return v3

    .line 539
    :cond_1
    if-nez p2, :cond_4

    .line 540
    const-string/jumbo v6, "HTTP/1.1 200 OK"

    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 543
    :goto_1
    const-string/jumbo v6, "Server: local proxy server"

    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 544
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->getContentType()Ljava/lang/String;

    move-result-object v2

    .line 545
    .local v2, "contentType":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 546
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Content-Type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 547
    :cond_2
    const-string/jumbo v6, "Connection: close"

    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 548
    if-nez p2, :cond_3

    .line 549
    const-string/jumbo v6, "Accept-Ranges: bytes"

    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 550
    :cond_3
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->getContentLength()J

    move-result-wide v0

    .line 551
    .local v0, "contentLength":J
    if-nez p2, :cond_5

    .line 552
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Content-Length: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 558
    :goto_2
    const-string/jumbo v6, ""

    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 560
    iput-boolean v3, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mHeaderSent:Z

    goto :goto_0

    .line 542
    .end local v0    # "contentLength":J
    .end local v2    # "contentType":Ljava/lang/String;
    :cond_4
    const-string/jumbo v6, "HTTP/1.1 206 Partial content"

    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    goto :goto_1

    .line 554
    .restart local v0    # "contentLength":J
    .restart local v2    # "contentType":Ljava/lang/String;
    :cond_5
    iget-object v6, p2, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    if-nez v6, :cond_6

    sub-long v4, v0, v10

    .line 555
    .local v4, "to":J
    :goto_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Content-Range: bytes "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v8, p2, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x2d

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x2f

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 556
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Content-Length: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v8, p2, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    sub-long v8, v4, v8

    add-long/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    goto :goto_2

    .line 554
    .end local v4    # "to":J
    :cond_6
    iget-object v6, p2, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    goto :goto_3
.end method

.method private sendHeaderSuccess(Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;J)Z
    .locals 8
    .param p1, "range"    # Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    .param p2, "contentLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x1

    const/4 v2, 0x1

    .line 566
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mHeaderSent:Z

    if-eqz v3, :cond_1

    .line 567
    :cond_0
    const/4 v2, 0x0

    .line 588
    :goto_0
    return v2

    .line 569
    :cond_1
    if-nez p1, :cond_3

    .line 570
    const-string/jumbo v3, "HTTP/1.1 200 OK"

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 573
    :goto_1
    const-string/jumbo v3, "Server: local proxy server"

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 574
    const-string/jumbo v3, "Connection: close"

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 575
    if-nez p1, :cond_2

    .line 576
    const-string/jumbo v3, "Accept-Ranges: bytes"

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 577
    :cond_2
    if-nez p1, :cond_4

    .line 578
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Content-Length: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 584
    :goto_2
    const-string/jumbo v3, ""

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 586
    iput-boolean v2, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mHeaderSent:Z

    goto :goto_0

    .line 572
    :cond_3
    const-string/jumbo v3, "HTTP/1.1 206 Partial content"

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    goto :goto_1

    .line 580
    :cond_4
    iget-object v3, p1, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    if-nez v3, :cond_5

    sub-long v0, p2, v6

    .line 581
    .local v0, "to":J
    :goto_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Content-Range: bytes "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p1, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2f

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    .line 582
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Content-Length: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p1, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    sub-long v4, v0, v4

    add-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sendLine(Ljava/lang/String;)V

    goto :goto_2

    .line 580
    .end local v0    # "to":J
    :cond_5
    iget-object v3, p1, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_3
.end method

.method private sendLine(Ljava/lang/String;)V
    .locals 4
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 609
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 610
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 611
    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->writeToTheSocket(Ljava/nio/ByteBuffer;)V

    goto :goto_0

    .line 613
    :cond_0
    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "PlayerProxy"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "sendLine"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "line"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object p1, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 614
    return-void
.end method

.method static declared-synchronized stopAll()V
    .locals 2

    .prologue
    .line 87
    const-class v1, Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->CACHE_QUEUE:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 88
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    if-eqz v0, :cond_0

    .line 89
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->interrupt()V

    .line 90
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    :cond_0
    monitor-exit v1

    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private writeToTheSocket(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 617
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, p1}, Ljava/nio/channels/SocketChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 618
    return-void
.end method


# virtual methods
.method public getMid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 532
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mMid:Ljava/lang/String;

    return-object v0
.end method

.method public interrupt()V
    .locals 2

    .prologue
    .line 515
    invoke-super {p0}, Ljava/lang/Thread;->interrupt()V

    .line 517
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v0, :cond_1

    .line 518
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    monitor-enter v1

    .line 519
    :try_start_0
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocketClosed:Z

    if-nez v0, :cond_0

    .line 520
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocketClosed:Z

    .line 521
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 523
    :cond_0
    monitor-exit v1

    .line 525
    :cond_1
    return-void

    .line 523
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 5

    .prologue
    const-wide/16 v2, 0x3e8

    .line 123
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-nez v1, :cond_0

    .line 124
    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    .line 125
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->isInterrupted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 156
    :goto_0
    return-void

    .line 130
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    const-string/jumbo v2, "file:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mUrl:Ljava/lang/String;

    const-string/jumbo v2, "content:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 131
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->handleUri()V

    .line 136
    :goto_1
    const-wide/16 v2, 0x3e8

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 140
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v1, :cond_3

    .line 141
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    monitor-enter v2

    .line 142
    :try_start_1
    iget-boolean v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocketClosed:Z

    if-nez v1, :cond_2

    .line 143
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocketClosed:Z

    .line 144
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    invoke-static {v1}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 146
    :cond_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 148
    :cond_3
    const-class v2, Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    monitor-enter v2

    .line 149
    :try_start_2
    sget-object v1, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    if-ne v1, p0, :cond_4

    .line 150
    sget-object v1, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->interrupt()V

    .line 151
    const/4 v1, 0x0

    sput-object v1, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    .line 152
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mMid:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->cacheNext(Landroid/content/Context;Ljava/lang/String;)V

    .line 154
    :cond_4
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 133
    :cond_5
    :try_start_3
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->handleHttp()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    goto :goto_1

    .line 137
    :catch_0
    move-exception v0

    .line 138
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    :try_start_4
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 140
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v1, :cond_7

    .line 141
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    monitor-enter v2

    .line 142
    :try_start_5
    iget-boolean v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocketClosed:Z

    if-nez v1, :cond_6

    .line 143
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocketClosed:Z

    .line 144
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    invoke-static {v1}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 146
    :cond_6
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 148
    :cond_7
    const-class v2, Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    monitor-enter v2

    .line 149
    :try_start_6
    sget-object v1, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    if-ne v1, p0, :cond_8

    .line 150
    sget-object v1, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->interrupt()V

    .line 151
    const/4 v1, 0x0

    sput-object v1, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    .line 152
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mMid:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->cacheNext(Landroid/content/Context;Ljava/lang/String;)V

    .line 154
    :cond_8
    monitor-exit v2

    goto/16 :goto_0

    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v1

    .line 146
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_2
    move-exception v1

    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw v1

    .restart local v0    # "e":Ljava/lang/Exception;
    :catchall_3
    move-exception v1

    :try_start_8
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    throw v1

    .line 140
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_4
    move-exception v1

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    if-eqz v2, :cond_a

    .line 141
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    monitor-enter v2

    .line 142
    :try_start_9
    iget-boolean v3, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocketClosed:Z

    if-nez v3, :cond_9

    .line 143
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocketClosed:Z

    .line 144
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mSocket:Ljava/nio/channels/SocketChannel;

    invoke-static {v3}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 146
    :cond_9
    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 148
    :cond_a
    const-class v2, Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    monitor-enter v2

    .line 149
    :try_start_a
    sget-object v3, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    if-ne v3, p0, :cond_b

    .line 150
    sget-object v3, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->interrupt()V

    .line 151
    const/4 v3, 0x0

    sput-object v3, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->sClientThread:Lcom/vkontakte/android/audio/player/proxy/ClientThread;

    .line 152
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->mMid:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->cacheNext(Landroid/content/Context;Ljava/lang/String;)V

    .line 154
    :cond_b
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    throw v1

    .line 146
    :catchall_5
    move-exception v1

    :try_start_b
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    throw v1

    .line 154
    :catchall_6
    move-exception v1

    :try_start_c
    monitor-exit v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    throw v1
.end method
