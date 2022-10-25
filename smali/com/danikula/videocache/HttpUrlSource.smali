.class public Lcom/danikula/videocache/HttpUrlSource;
.super Ljava/lang/Object;
.source "HttpUrlSource.java"

# interfaces
.implements Lcom/danikula/videocache/Source;


# static fields
.field private static final LOG:Lorg/slf4j/Logger;

.field private static final MAX_REDIRECTS:I = 0x5


# instance fields
.field private connection:Ljava/net/HttpURLConnection;

.field private inputStream:Ljava/io/InputStream;

.field private sourceInfo:Lcom/danikula/videocache/SourceInfo;

.field private final sourceInfoStorage:Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-string/jumbo v0, "HttpUrlSource"

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/danikula/videocache/HttpUrlSource;->LOG:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/danikula/videocache/HttpUrlSource;)V
    .locals 1
    .param p1, "source"    # Lcom/danikula/videocache/HttpUrlSource;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iget-object v0, p1, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iput-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    .line 54
    iget-object v0, p1, Lcom/danikula/videocache/HttpUrlSource;->sourceInfoStorage:Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    iput-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfoStorage:Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-static {}, Lcom/danikula/videocache/sourcestorage/SourceInfoStorageFactory;->newEmptySourceInfoStorage()Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/danikula/videocache/HttpUrlSource;-><init>(Ljava/lang/String;Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "sourceInfoStorage"    # Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    invoke-static {p2}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    iput-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfoStorage:Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    .line 47
    invoke-interface {p2, p1}, Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;->get(Ljava/lang/String;)Lcom/danikula/videocache/SourceInfo;

    move-result-object v0

    .line 48
    .local v0, "sourceInfo":Lcom/danikula/videocache/SourceInfo;
    if-eqz v0, :cond_0

    .line 49
    .end local v0    # "sourceInfo":Lcom/danikula/videocache/SourceInfo;
    :goto_0
    iput-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    .line 50
    return-void

    .line 48
    .restart local v0    # "sourceInfo":Lcom/danikula/videocache/SourceInfo;
    :cond_0
    new-instance v0, Lcom/danikula/videocache/SourceInfo;

    .end local v0    # "sourceInfo":Lcom/danikula/videocache/SourceInfo;
    const/high16 v1, -0x80000000

    .line 49
    invoke-static {p1}, Lcom/danikula/videocache/ProxyCacheUtils;->getSupposablyMime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lcom/danikula/videocache/SourceInfo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_0
.end method

.method private fetchContentInfo()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 114
    sget-object v5, Lcom/danikula/videocache/HttpUrlSource;->LOG:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Read content info from "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v7, v7, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 115
    const/4 v4, 0x0

    .line 116
    .local v4, "urlConnection":Ljava/net/HttpURLConnection;
    const/4 v1, 0x0

    .line 118
    .local v1, "inputStream":Ljava/io/InputStream;
    const/4 v5, 0x0

    const/16 v6, 0x2710

    :try_start_0
    invoke-direct {p0, v5, v6}, Lcom/danikula/videocache/HttpUrlSource;->openConnection(II)Ljava/net/HttpURLConnection;

    move-result-object v4

    .line 119
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v2

    .line 120
    .local v2, "length":I
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v3

    .line 121
    .local v3, "mime":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 122
    new-instance v5, Lcom/danikula/videocache/SourceInfo;

    iget-object v6, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v6, v6, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    invoke-direct {v5, v6, v2, v3}, Lcom/danikula/videocache/SourceInfo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    iput-object v5, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    .line 123
    iget-object v5, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfoStorage:Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    iget-object v6, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v6, v6, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    iget-object v7, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    invoke-interface {v5, v6, v7}, Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;->put(Ljava/lang/String;Lcom/danikula/videocache/SourceInfo;)V

    .line 124
    sget-object v5, Lcom/danikula/videocache/HttpUrlSource;->LOG:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Source info fetched: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    invoke-static {v1}, Lcom/danikula/videocache/ProxyCacheUtils;->close(Ljava/io/Closeable;)V

    .line 129
    if-eqz v4, :cond_0

    .line 130
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 133
    .end local v2    # "length":I
    .end local v3    # "mime":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    sget-object v5, Lcom/danikula/videocache/HttpUrlSource;->LOG:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Error fetching info from "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v7, v7, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    invoke-static {v1}, Lcom/danikula/videocache/ProxyCacheUtils;->close(Ljava/io/Closeable;)V

    .line 129
    if-eqz v4, :cond_0

    .line 130
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    .line 128
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    invoke-static {v1}, Lcom/danikula/videocache/ProxyCacheUtils;->close(Ljava/io/Closeable;)V

    .line 129
    if-eqz v4, :cond_1

    .line 130
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_1
    throw v5
.end method

.method private openConnection(II)Ljava/net/HttpURLConnection;
    .locals 9
    .param p1, "offset"    # I
    .param p2, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 138
    const/4 v2, 0x0

    .line 139
    .local v2, "redirectCount":I
    iget-object v5, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v4, v5, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    .line 141
    .local v4, "url":Ljava/lang/String;
    :cond_0
    sget-object v6, Lcom/danikula/videocache/HttpUrlSource;->LOG:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Open connection "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-lez p1, :cond_5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, " with offset "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_0
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v7, " to "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v6, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 142
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 143
    .local v1, "connection":Ljava/net/HttpURLConnection;
    if-lez p1, :cond_1

    .line 144
    const-string/jumbo v5, "Range"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "bytes="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    :cond_1
    if-lez p2, :cond_2

    .line 147
    invoke-virtual {v1, p2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 148
    invoke-virtual {v1, p2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 150
    :cond_2
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 151
    .local v0, "code":I
    const/16 v5, 0x12d

    if-eq v0, v5, :cond_3

    const/16 v5, 0x12e

    if-eq v0, v5, :cond_3

    const/16 v5, 0x12f

    if-ne v0, v5, :cond_6

    :cond_3
    const/4 v3, 0x1

    .line 152
    .local v3, "redirected":Z
    :goto_1
    if-eqz v3, :cond_4

    .line 153
    const-string/jumbo v5, "Location"

    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 154
    add-int/lit8 v2, v2, 0x1

    .line 155
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 157
    :cond_4
    const/4 v5, 0x5

    if-le v2, v5, :cond_7

    .line 158
    new-instance v5, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Too many redirects: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 141
    .end local v0    # "code":I
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    .end local v3    # "redirected":Z
    :cond_5
    const-string/jumbo v5, ""

    goto/16 :goto_0

    .line 151
    .restart local v0    # "code":I
    .restart local v1    # "connection":Ljava/net/HttpURLConnection;
    :cond_6
    const/4 v3, 0x0

    goto :goto_1

    .line 160
    .restart local v3    # "redirected":Z
    :cond_7
    if-nez v3, :cond_0

    .line 161
    return-object v1
.end method

.method private readSourceAvailableBytes(Ljava/net/HttpURLConnection;II)I
    .locals 2
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .param p2, "offset"    # I
    .param p3, "responseCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v0

    .line 81
    .local v0, "contentLength":I
    const/16 v1, 0xc8

    if-ne p3, v1, :cond_0

    .end local v0    # "contentLength":I
    :goto_0
    return v0

    .restart local v0    # "contentLength":I
    :cond_0
    const/16 v1, 0xce

    if-ne p3, v1, :cond_1

    add-int/2addr v0, p2

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget v0, v1, Lcom/danikula/videocache/SourceInfo;->length:I

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v2, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    if-eqz v2, :cond_0

    .line 89
    :try_start_0
    iget-object v2, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 97
    :cond_0
    return-void

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_0
    const-string/jumbo v1, "Wait... but why? WTF!? Really shouldn\'t happen any more after fixing https://github.com/danikula/AndroidVideoCache/issues/43. If you read it on your device log, please, notify me danikula@gmail.com or create issue here https://github.com/danikula/AndroidVideoCache/issues."

    .line 94
    .local v1, "message":Ljava/lang/String;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 90
    .end local v0    # "e":Ljava/lang/RuntimeException;
    .end local v1    # "message":Ljava/lang/String;
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public declared-synchronized getMime()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 165
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v0, v0, Lcom/danikula/videocache/SourceInfo;->mime:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 166
    invoke-direct {p0}, Lcom/danikula/videocache/HttpUrlSource;->fetchContentInfo()V

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v0, v0, Lcom/danikula/videocache/SourceInfo;->mime:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 165
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v0, v0, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized length()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget v0, v0, Lcom/danikula/videocache/SourceInfo;->length:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_0

    .line 60
    invoke-direct {p0}, Lcom/danikula/videocache/HttpUrlSource;->fetchContentInfo()V

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget v0, v0, Lcom/danikula/videocache/SourceInfo;->length:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public open(I)V
    .locals 6
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 68
    const/4 v3, -0x1

    :try_start_0
    invoke-direct {p0, p1, v3}, Lcom/danikula/videocache/HttpUrlSource;->openConnection(II)Ljava/net/HttpURLConnection;

    move-result-object v3

    iput-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    .line 69
    iget-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v2

    .line 70
    .local v2, "mime":Ljava/lang/String;
    new-instance v3, Ljava/io/BufferedInputStream;

    iget-object v4, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    const/16 v5, 0x2000

    invoke-direct {v3, v4, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->inputStream:Ljava/io/InputStream;

    .line 71
    iget-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    iget-object v4, p0, Lcom/danikula/videocache/HttpUrlSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    invoke-direct {p0, v3, p1, v4}, Lcom/danikula/videocache/HttpUrlSource;->readSourceAvailableBytes(Ljava/net/HttpURLConnection;II)I

    move-result v1

    .line 72
    .local v1, "length":I
    new-instance v3, Lcom/danikula/videocache/SourceInfo;

    iget-object v4, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v4, v4, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    invoke-direct {v3, v4, v1, v2}, Lcom/danikula/videocache/SourceInfo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    iput-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    .line 73
    iget-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfoStorage:Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    iget-object v4, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v4, v4, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    iget-object v5, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    invoke-interface {v3, v4, v5}, Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;->put(Ljava/lang/String;Lcom/danikula/videocache/SourceInfo;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    return-void

    .line 74
    .end local v1    # "length":I
    .end local v2    # "mime":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Error opening connection for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v5, v5, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " with offset "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public read([B)I
    .locals 4
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->inputStream:Ljava/io/InputStream;

    if-nez v1, :cond_0

    .line 102
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Error reading data from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v3, v3, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": connection is absent!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 105
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->inputStream:Ljava/io/InputStream;

    const/4 v2, 0x0

    array-length v3, p1

    invoke-virtual {v1, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I
    :try_end_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    return v1

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Ljava/io/InterruptedIOException;
    new-instance v1, Lcom/danikula/videocache/InterruptedProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Reading source "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v3, v3, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " is interrupted"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/InterruptedProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 108
    .end local v0    # "e":Ljava/io/InterruptedIOException;
    :catch_1
    move-exception v0

    .line 109
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Error reading data from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    iget-object v3, v3, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "HttpUrlSource{sourceInfo=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/danikula/videocache/HttpUrlSource;->sourceInfo:Lcom/danikula/videocache/SourceInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
