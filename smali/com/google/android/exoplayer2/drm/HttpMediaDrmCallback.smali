.class public final Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;
.super Ljava/lang/Object;
.source "HttpMediaDrmCallback.java"

# interfaces
.implements Lcom/google/android/exoplayer2/drm/MediaDrmCallback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# static fields
.field private static final PLAYREADY_KEY_REQUEST_PROPERTIES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final dataSourceFactory:Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;

.field private final defaultUrl:Ljava/lang/String;

.field private final keyRequestProperties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->PLAYREADY_KEY_REQUEST_PROPERTIES:Ljava/util/Map;

    .line 42
    sget-object v0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->PLAYREADY_KEY_REQUEST_PROPERTIES:Ljava/util/Map;

    const-string/jumbo v1, "Content-Type"

    const-string/jumbo v2, "text/xml"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->PLAYREADY_KEY_REQUEST_PROPERTIES:Ljava/util/Map;

    const-string/jumbo v1, "SOAPAction"

    const-string/jumbo v2, "http://schemas.microsoft.com/DRM/2007/03/protocols/AcquireLicense"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;)V
    .locals 1
    .param p1, "defaultUrl"    # Ljava/lang/String;
    .param p2, "dataSourceFactory"    # Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;

    .prologue
    .line 56
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;Ljava/util/Map;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;Ljava/util/Map;)V
    .locals 0
    .param p1, "defaultUrl"    # Ljava/lang/String;
    .param p2, "dataSourceFactory"    # Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p3, "keyRequestProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p2, p0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->dataSourceFactory:Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;

    .line 67
    iput-object p1, p0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->defaultUrl:Ljava/lang/String;

    .line 68
    iput-object p3, p0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->keyRequestProperties:Ljava/util/Map;

    .line 69
    return-void
.end method

.method private executePost(Ljava/lang/String;[BLjava/util/Map;)[B
    .locals 14
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    .local p3, "requestProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->dataSourceFactory:Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;

    invoke-interface {v2}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;->createDataSource()Lcom/google/android/exoplayer2/upstream/HttpDataSource;

    move-result-object v0

    .line 97
    .local v0, "dataSource":Lcom/google/android/exoplayer2/upstream/HttpDataSource;
    if-eqz p3, :cond_0

    .line 98
    invoke-interface/range {p3 .. p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map$Entry;

    .line 99
    .local v13, "requestProperty":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Lcom/google/android/exoplayer2/upstream/HttpDataSource;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 102
    .end local v13    # "requestProperty":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    new-instance v1, Lcom/google/android/exoplayer2/upstream/DataSpec;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, -0x1

    const/4 v10, 0x0

    const/4 v11, 0x1

    move-object/from16 v3, p2

    invoke-direct/range {v1 .. v11}, Lcom/google/android/exoplayer2/upstream/DataSpec;-><init>(Landroid/net/Uri;[BJJJLjava/lang/String;I)V

    .line 104
    .local v1, "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    new-instance v12, Lcom/google/android/exoplayer2/upstream/DataSourceInputStream;

    invoke-direct {v12, v0, v1}, Lcom/google/android/exoplayer2/upstream/DataSourceInputStream;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;)V

    .line 106
    .local v12, "inputStream":Lcom/google/android/exoplayer2/upstream/DataSourceInputStream;
    :try_start_0
    invoke-static {v12}, Lcom/google/android/exoplayer2/util/Util;->toByteArray(Ljava/io/InputStream;)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 108
    invoke-static {v12}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Ljava/io/Closeable;)V

    return-object v2

    :catchall_0
    move-exception v2

    invoke-static {v12}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v2
.end method


# virtual methods
.method public executeKeyRequest(Ljava/util/UUID;Lcom/google/android/exoplayer2/drm/ExoMediaDrm$KeyRequest;)[B
    .locals 4
    .param p1, "uuid"    # Ljava/util/UUID;
    .param p2, "request"    # Lcom/google/android/exoplayer2/drm/ExoMediaDrm$KeyRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 79
    invoke-interface {p2}, Lcom/google/android/exoplayer2/drm/ExoMediaDrm$KeyRequest;->getDefaultUrl()Ljava/lang/String;

    move-result-object v1

    .line 80
    .local v1, "url":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 81
    iget-object v1, p0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->defaultUrl:Ljava/lang/String;

    .line 83
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 84
    .local v0, "requestProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "Content-Type"

    const-string/jumbo v3, "application/octet-stream"

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v2, Lcom/google/android/exoplayer2/C;->PLAYREADY_UUID:Ljava/util/UUID;

    invoke-virtual {v2, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 86
    sget-object v2, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->PLAYREADY_KEY_REQUEST_PROPERTIES:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 88
    :cond_1
    iget-object v2, p0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->keyRequestProperties:Ljava/util/Map;

    if-eqz v2, :cond_2

    .line 89
    iget-object v2, p0, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->keyRequestProperties:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 91
    :cond_2
    invoke-interface {p2}, Lcom/google/android/exoplayer2/drm/ExoMediaDrm$KeyRequest;->getData()[B

    move-result-object v2

    invoke-direct {p0, v1, v2, v0}, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->executePost(Ljava/lang/String;[BLjava/util/Map;)[B

    move-result-object v2

    return-object v2
.end method

.method public executeProvisionRequest(Ljava/util/UUID;Lcom/google/android/exoplayer2/drm/ExoMediaDrm$ProvisionRequest;)[B
    .locals 4
    .param p1, "uuid"    # Ljava/util/UUID;
    .param p2, "request"    # Lcom/google/android/exoplayer2/drm/ExoMediaDrm$ProvisionRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p2}, Lcom/google/android/exoplayer2/drm/ExoMediaDrm$ProvisionRequest;->getDefaultUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "&signedRequest="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    invoke-interface {p2}, Lcom/google/android/exoplayer2/drm/ExoMediaDrm$ProvisionRequest;->getData()[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 74
    .local v0, "url":Ljava/lang/String;
    const/4 v1, 0x0

    new-array v1, v1, [B

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/google/android/exoplayer2/drm/HttpMediaDrmCallback;->executePost(Ljava/lang/String;[BLjava/util/Map;)[B

    move-result-object v1

    return-object v1
.end method
