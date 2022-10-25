.class public final Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;
.super Ljava/lang/Object;
.source "OfflineLicenseHelper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/google/android/exoplayer2/drm/ExoMediaCrypto;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final conditionVariable:Landroid/os/ConditionVariable;

.field private final drmSessionManager:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final handlerThread:Landroid/os/HandlerThread;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/drm/ExoMediaDrm;Lcom/google/android/exoplayer2/drm/MediaDrmCallback;Ljava/util/HashMap;)V
    .locals 7
    .param p2, "callback"    # Lcom/google/android/exoplayer2/drm/MediaDrmCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/drm/ExoMediaDrm",
            "<TT;>;",
            "Lcom/google/android/exoplayer2/drm/MediaDrmCallback;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper<TT;>;"
    .local p1, "mediaDrm":Lcom/google/android/exoplayer2/drm/ExoMediaDrm;, "Lcom/google/android/exoplayer2/drm/ExoMediaDrm<TT;>;"
    .local p3, "optionalKeyRequestParameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "OfflineLicenseHelper"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->handlerThread:Landroid/os/HandlerThread;

    .line 132
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 134
    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->conditionVariable:Landroid/os/ConditionVariable;

    .line 135
    new-instance v6, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;

    invoke-direct {v6, p0}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;-><init>(Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;)V

    .line 156
    .local v6, "eventListener":Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$EventListener;
    new-instance v0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    sget-object v1, Lcom/google/android/exoplayer2/C;->WIDEVINE_UUID:Ljava/util/UUID;

    new-instance v5, Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->handlerThread:Landroid/os/HandlerThread;

    .line 157
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v5, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;-><init>(Ljava/util/UUID;Lcom/google/android/exoplayer2/drm/ExoMediaDrm;Lcom/google/android/exoplayer2/drm/MediaDrmCallback;Ljava/util/HashMap;Landroid/os/Handler;Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$EventListener;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->drmSessionManager:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 158
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;)Landroid/os/ConditionVariable;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->conditionVariable:Landroid/os/ConditionVariable;

    return-object v0
.end method

.method private blockingKeyRequest(I[BLcom/google/android/exoplayer2/drm/DrmInitData;)V
    .locals 3
    .param p1, "licenseMode"    # I
    .param p2, "offlineLicenseKeySetId"    # [B
    .param p3, "drmInitData"    # Lcom/google/android/exoplayer2/drm/DrmInitData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;
        }
    .end annotation

    .prologue
    .line 271
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->openBlockingKeyRequest(I[BLcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/drm/DrmSession;

    move-result-object v1

    .line 273
    .local v1, "session":Lcom/google/android/exoplayer2/drm/DrmSession;, "Lcom/google/android/exoplayer2/drm/DrmSession<TT;>;"
    invoke-interface {v1}, Lcom/google/android/exoplayer2/drm/DrmSession;->getError()Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;

    move-result-object v0

    .line 274
    .local v0, "error":Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;
    if-eqz v0, :cond_0

    .line 275
    throw v0

    .line 277
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->drmSessionManager:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    invoke-virtual {v2, v1}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->releaseSession(Lcom/google/android/exoplayer2/drm/DrmSession;)V

    .line 278
    return-void
.end method

.method public static downloadManifest(Lcom/google/android/exoplayer2/upstream/HttpDataSource;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;
    .locals 4
    .param p0, "dataSource"    # Lcom/google/android/exoplayer2/upstream/HttpDataSource;
    .param p1, "manifestUriString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DataSourceInputStream;

    new-instance v2, Lcom/google/android/exoplayer2/upstream/DataSpec;

    .line 73
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer2/upstream/DataSpec;-><init>(Landroid/net/Uri;)V

    invoke-direct {v0, p0, v2}, Lcom/google/android/exoplayer2/upstream/DataSourceInputStream;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;)V

    .line 75
    .local v0, "inputStream":Lcom/google/android/exoplayer2/upstream/DataSourceInputStream;
    :try_start_0
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/DataSourceInputStream;->open()V

    .line 76
    new-instance v1, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;

    invoke-direct {v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;-><init>()V

    .line 77
    .local v1, "parser":Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;
    invoke-interface {p0}, Lcom/google/android/exoplayer2/upstream/HttpDataSource;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parse(Landroid/net/Uri;Ljava/io/InputStream;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 79
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/DataSourceInputStream;->close()V

    return-object v2

    .end local v1    # "parser":Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/DataSourceInputStream;->close()V

    throw v2
.end method

.method private static loadInitializationChunk(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/source/dash/manifest/Representation;)Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;
    .locals 10
    .param p0, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p1, "representation"    # Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 293
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->getInitializationUri()Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v8

    .line 294
    .local v8, "rangedUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    if-nez v8, :cond_0

    move-object v1, v9

    .line 303
    :goto_0
    return-object v1

    .line 297
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-object v2, p1, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->baseUrl:Ljava/lang/String;

    invoke-virtual {v8, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->resolveUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-wide v2, v8, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->start:J

    iget-wide v4, v8, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->length:J

    .line 298
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->getCacheKey()Ljava/lang/String;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer2/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 299
    .local v0, "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    new-instance v1, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;

    iget-object v4, p1, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->format:Lcom/google/android/exoplayer2/Format;

    const/4 v5, 0x0

    iget-object v2, p1, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->format:Lcom/google/android/exoplayer2/Format;

    .line 301
    invoke-static {v2}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->newWrappedExtractor(Lcom/google/android/exoplayer2/Format;)Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;

    move-result-object v7

    move-object v2, p0

    move-object v3, v0

    move-object v6, v9

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;)V

    .line 302
    .local v1, "initializationChunk":Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->load()V

    goto :goto_0
.end method

.method public static newWidevineInstance(Lcom/google/android/exoplayer2/drm/MediaDrmCallback;Ljava/util/HashMap;)Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;
    .locals 2
    .param p0, "callback"    # Lcom/google/android/exoplayer2/drm/MediaDrmCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/drm/MediaDrmCallback;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper",
            "<",
            "Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/drm/UnsupportedDrmException;
        }
    .end annotation

    .prologue
    .line 115
    .local p1, "optionalKeyRequestParameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;

    sget-object v1, Lcom/google/android/exoplayer2/C;->WIDEVINE_UUID:Ljava/util/UUID;

    invoke-static {v1}, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->newInstance(Ljava/util/UUID;)Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;

    move-result-object v1

    invoke-direct {v0, v1, p0, p1}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;-><init>(Lcom/google/android/exoplayer2/drm/ExoMediaDrm;Lcom/google/android/exoplayer2/drm/MediaDrmCallback;Ljava/util/HashMap;)V

    return-object v0
.end method

.method public static newWidevineInstance(Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;)Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;
    .locals 2
    .param p0, "licenseUrl"    # Ljava/lang/String;
    .param p1, "httpDataSourceFactory"    # Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;",
            ")",
            "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper",
            "<",
            "Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/drm/UnsupportedDrmException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 95
    new-instance v0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;Ljava/util/Map;)V

    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->newWidevineInstance(Lcom/google/android/exoplayer2/drm/MediaDrmCallback;Ljava/util/HashMap;)Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;

    move-result-object v0

    return-object v0
.end method

.method private static newWrappedExtractor(Lcom/google/android/exoplayer2/Format;)Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;
    .locals 5
    .param p0, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    const/4 v3, 0x0

    .line 307
    iget-object v2, p0, Lcom/google/android/exoplayer2/Format;->containerMimeType:Ljava/lang/String;

    .line 308
    .local v2, "mimeType":Ljava/lang/String;
    const-string/jumbo v4, "video/webm"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string/jumbo v4, "audio/webm"

    .line 309
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    const/4 v1, 0x1

    .line 310
    .local v1, "isWebm":Z
    :goto_0
    if-eqz v1, :cond_2

    new-instance v0, Lcom/google/android/exoplayer2/extractor/mkv/MatroskaExtractor;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/mkv/MatroskaExtractor;-><init>()V

    .line 311
    .local v0, "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :goto_1
    new-instance v4, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;

    invoke-direct {v4, v0, p0, v3, v3}, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;-><init>(Lcom/google/android/exoplayer2/extractor/Extractor;Lcom/google/android/exoplayer2/Format;ZZ)V

    return-object v4

    .end local v0    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    .end local v1    # "isWebm":Z
    :cond_1
    move v1, v3

    .line 309
    goto :goto_0

    .line 310
    .restart local v1    # "isWebm":Z
    :cond_2
    new-instance v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;-><init>()V

    goto :goto_1
.end method

.method private openBlockingKeyRequest(I[BLcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/drm/DrmSession;
    .locals 3
    .param p1, "licenseMode"    # I
    .param p2, "offlineLicenseKeySetId"    # [B
    .param p3, "drmInitData"    # Lcom/google/android/exoplayer2/drm/DrmInitData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[B",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            ")",
            "Lcom/google/android/exoplayer2/drm/DrmSession",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 282
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper<TT;>;"
    iget-object v1, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->drmSessionManager:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    invoke-virtual {v1, p1, p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->setMode(I[B)V

    .line 283
    iget-object v1, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->conditionVariable:Landroid/os/ConditionVariable;

    invoke-virtual {v1}, Landroid/os/ConditionVariable;->close()V

    .line 284
    iget-object v1, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->drmSessionManager:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    iget-object v2, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v1, v2, p3}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->acquireSession(Landroid/os/Looper;Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/drm/DrmSession;

    move-result-object v0

    .line 287
    .local v0, "session":Lcom/google/android/exoplayer2/drm/DrmSession;, "Lcom/google/android/exoplayer2/drm/DrmSession<TT;>;"
    iget-object v1, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->conditionVariable:Landroid/os/ConditionVariable;

    invoke-virtual {v1}, Landroid/os/ConditionVariable;->block()V

    .line 288
    return-object v0
.end method


# virtual methods
.method public download(Lcom/google/android/exoplayer2/upstream/HttpDataSource;Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;)[B
    .locals 13
    .param p1, "dataSource"    # Lcom/google/android/exoplayer2/upstream/HttpDataSource;
    .param p2, "dashManifest"    # Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper<TT;>;"
    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    const/4 v9, -0x1

    const/4 v7, 0x0

    .line 195
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->getPeriodCount()I

    move-result v8

    if-ge v8, v11, :cond_1

    .line 226
    :cond_0
    :goto_0
    return-object v7

    .line 198
    :cond_1
    invoke-virtual {p2, v10}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->getPeriod(I)Lcom/google/android/exoplayer2/source/dash/manifest/Period;

    move-result-object v4

    .line 199
    .local v4, "period":Lcom/google/android/exoplayer2/source/dash/manifest/Period;
    invoke-virtual {v4, v12}, Lcom/google/android/exoplayer2/source/dash/manifest/Period;->getAdaptationSetIndex(I)I

    move-result v1

    .line 200
    .local v1, "adaptationSetIndex":I
    if-ne v1, v9, :cond_2

    .line 201
    invoke-virtual {v4, v11}, Lcom/google/android/exoplayer2/source/dash/manifest/Period;->getAdaptationSetIndex(I)I

    move-result v1

    .line 202
    if-eq v1, v9, :cond_0

    .line 206
    :cond_2
    iget-object v8, v4, Lcom/google/android/exoplayer2/source/dash/manifest/Period;->adaptationSets:Ljava/util/List;

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;

    .line 207
    .local v0, "adaptationSet":Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;
    iget-object v8, v0, Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;->representations:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 210
    iget-object v8, v0, Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;->representations:Ljava/util/List;

    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;

    .line 211
    .local v5, "representation":Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    iget-object v8, v5, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->format:Lcom/google/android/exoplayer2/Format;

    iget-object v2, v8, Lcom/google/android/exoplayer2/Format;->drmInitData:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 212
    .local v2, "drmInitData":Lcom/google/android/exoplayer2/drm/DrmInitData;
    if-nez v2, :cond_4

    .line 213
    invoke-static {p1, v5}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->loadInitializationChunk(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/source/dash/manifest/Representation;)Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;

    move-result-object v3

    .line 214
    .local v3, "initializationChunk":Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;
    if-eqz v3, :cond_0

    .line 217
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->getSampleFormat()Lcom/google/android/exoplayer2/Format;

    move-result-object v6

    .line 218
    .local v6, "sampleFormat":Lcom/google/android/exoplayer2/Format;
    if-eqz v6, :cond_3

    .line 219
    iget-object v2, v6, Lcom/google/android/exoplayer2/Format;->drmInitData:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 221
    :cond_3
    if-eqz v2, :cond_0

    .line 225
    .end local v3    # "initializationChunk":Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;
    .end local v6    # "sampleFormat":Lcom/google/android/exoplayer2/Format;
    :cond_4
    invoke-direct {p0, v12, v7, v2}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->blockingKeyRequest(I[BLcom/google/android/exoplayer2/drm/DrmInitData;)V

    .line 226
    iget-object v7, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->drmSessionManager:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    invoke-virtual {v7}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->getOfflineLicenseKeySetId()[B

    move-result-object v7

    goto :goto_0
.end method

.method public download(Lcom/google/android/exoplayer2/upstream/HttpDataSource;Ljava/lang/String;)[B
    .locals 1
    .param p1, "dataSource"    # Lcom/google/android/exoplayer2/upstream/HttpDataSource;
    .param p2, "manifestUriString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;
        }
    .end annotation

    .prologue
    .line 177
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper<TT;>;"
    invoke-static {p1, p2}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->downloadManifest(Lcom/google/android/exoplayer2/upstream/HttpDataSource;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->download(Lcom/google/android/exoplayer2/upstream/HttpDataSource;Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;)[B

    move-result-object v0

    return-object v0
.end method

.method public getLicenseDurationRemainingSec([B)Landroid/util/Pair;
    .locals 4
    .param p1, "offlineLicenseKeySetId"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;
        }
    .end annotation

    .prologue
    .line 260
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper<TT;>;"
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, v2, p1, v3}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->openBlockingKeyRequest(I[BLcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/drm/DrmSession;

    move-result-object v1

    .line 263
    .local v1, "session":Lcom/google/android/exoplayer2/drm/DrmSession;, "Lcom/google/android/exoplayer2/drm/DrmSession<TT;>;"
    iget-object v2, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->drmSessionManager:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 264
    invoke-static {v2}, Lcom/google/android/exoplayer2/drm/WidevineUtil;->getLicenseDurationRemainingSec(Lcom/google/android/exoplayer2/drm/DrmSession;)Landroid/util/Pair;

    move-result-object v0

    .line 265
    .local v0, "licenseDurationRemainingSec":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    iget-object v2, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->drmSessionManager:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    invoke-virtual {v2, v1}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->releaseSession(Lcom/google/android/exoplayer2/drm/DrmSession;)V

    .line 266
    return-object v0
.end method

.method public release([B)V
    .locals 2
    .param p1, "offlineLicenseKeySetId"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;
        }
    .end annotation

    .prologue
    .line 249
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper<TT;>;"
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->blockingKeyRequest(I[BLcom/google/android/exoplayer2/drm/DrmInitData;)V

    .line 251
    return-void
.end method

.method public releaseResources()V
    .locals 1

    .prologue
    .line 162
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 163
    return-void
.end method

.method public renew([B)[B
    .locals 2
    .param p1, "offlineLicenseKeySetId"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;
        }
    .end annotation

    .prologue
    .line 237
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper<TT;>;"
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->blockingKeyRequest(I[BLcom/google/android/exoplayer2/drm/DrmInitData;)V

    .line 239
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->drmSessionManager:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->getOfflineLicenseKeySetId()[B

    move-result-object v0

    return-object v0
.end method
