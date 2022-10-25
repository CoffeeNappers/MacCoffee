.class final Lcom/vk/emoji/OkHttp3Downloader;
.super Ljava/lang/Object;
.source "OkHttp3Downloader.java"

# interfaces
.implements Lcom/squareup/picasso/Downloader;


# static fields
.field private static final MAX_DISK_CACHE_SIZE:I = 0x3200000

.field private static final MIN_DISK_CACHE_SIZE:I = 0x500000

.field private static final PICASSO_CACHE:Ljava/lang/String; = "picasso-cache"


# instance fields
.field private final cache:Lokhttp3/Cache;

.field private final client:Lokhttp3/Call$Factory;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 72
    invoke-static {p1}, Lcom/vk/emoji/OkHttp3Downloader;->defaultCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/emoji/OkHttp3Downloader;-><init>(Ljava/io/File;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;J)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "maxSize"    # J

    .prologue
    .line 92
    invoke-static {p1}, Lcom/vk/emoji/OkHttp3Downloader;->defaultCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lcom/vk/emoji/OkHttp3Downloader;-><init>(Ljava/io/File;J)V

    .line 93
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 2
    .param p1, "cacheDir"    # Ljava/io/File;

    .prologue
    .line 82
    invoke-static {p1}, Lcom/vk/emoji/OkHttp3Downloader;->calculateDiskCacheSize(Ljava/io/File;)J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lcom/vk/emoji/OkHttp3Downloader;-><init>(Ljava/io/File;J)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/io/File;J)V
    .locals 2
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "maxSize"    # J

    .prologue
    .line 103
    invoke-static {p1, p2, p3}, Lcom/vk/emoji/OkHttp3Downloader;->createOkHttpClient(Ljava/io/File;J)Lokhttp3/OkHttpClient;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/emoji/OkHttp3Downloader;-><init>(Lokhttp3/OkHttpClient;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Lokhttp3/Call$Factory;Lokhttp3/Cache;)V
    .locals 0
    .param p1, "client"    # Lokhttp3/Call$Factory;
    .param p2, "cache"    # Lokhttp3/Cache;

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object p1, p0, Lcom/vk/emoji/OkHttp3Downloader;->client:Lokhttp3/Call$Factory;

    .line 113
    iput-object p2, p0, Lcom/vk/emoji/OkHttp3Downloader;->cache:Lokhttp3/Cache;

    .line 114
    return-void
.end method

.method public constructor <init>(Lokhttp3/OkHttpClient;)V
    .locals 1
    .param p1, "client"    # Lokhttp3/OkHttpClient;

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object p1, p0, Lcom/vk/emoji/OkHttp3Downloader;->client:Lokhttp3/Call$Factory;

    .line 108
    invoke-virtual {p1}, Lokhttp3/OkHttpClient;->cache()Lokhttp3/Cache;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/emoji/OkHttp3Downloader;->cache:Lokhttp3/Cache;

    .line 109
    return-void
.end method

.method private static calculateDiskCacheSize(Ljava/io/File;)J
    .locals 10
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 34
    const-wide/32 v2, 0x500000

    .line 37
    .local v2, "size":J
    :try_start_0
    new-instance v4, Landroid/os/StatFs;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 38
    .local v4, "statFs":Landroid/os/StatFs;
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockCount()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v5

    int-to-long v8, v5

    mul-long v0, v6, v8

    .line 40
    .local v0, "available":J
    const-wide/16 v6, 0x32

    div-long v2, v0, v6
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .end local v0    # "available":J
    .end local v4    # "statFs":Landroid/os/StatFs;
    :goto_0
    const-wide/32 v6, 0x3200000

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    const-wide/32 v8, 0x500000

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    return-wide v6

    .line 41
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public static createDefaultCache(Landroid/content/Context;)Lokhttp3/Cache;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    invoke-static {p0}, Lcom/vk/emoji/OkHttp3Downloader;->defaultCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 55
    .local v0, "dir":Ljava/io/File;
    new-instance v1, Lokhttp3/Cache;

    invoke-static {v0}, Lcom/vk/emoji/OkHttp3Downloader;->calculateDiskCacheSize(Ljava/io/File;)J

    move-result-wide v2

    invoke-direct {v1, v0, v2, v3}, Lokhttp3/Cache;-><init>(Ljava/io/File;J)V

    return-object v1
.end method

.method private static createOkHttpClient(Ljava/io/File;J)Lokhttp3/OkHttpClient;
    .locals 3
    .param p0, "cacheDir"    # Ljava/io/File;
    .param p1, "maxSize"    # J

    .prologue
    .line 59
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    new-instance v1, Lokhttp3/Cache;

    invoke-direct {v1, p0, p1, p2}, Lokhttp3/Cache;-><init>(Ljava/io/File;J)V

    .line 60
    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->cache(Lokhttp3/Cache;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    return-object v0
.end method

.method private static defaultCacheDir(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string/jumbo v2, "picasso-cache"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 26
    .local v0, "cache":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 28
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 30
    :cond_0
    return-object v0
.end method


# virtual methods
.method public load(Landroid/net/Uri;I)Lcom/squareup/picasso/Downloader$Response;
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "networkPolicy"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    const/4 v1, 0x0

    .line 119
    .local v1, "cacheControl":Lokhttp3/CacheControl;
    if-eqz p2, :cond_0

    .line 120
    invoke-static {p2}, Lcom/squareup/picasso/NetworkPolicy;->isOfflineOnly(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 121
    sget-object v1, Lokhttp3/CacheControl;->FORCE_CACHE:Lokhttp3/CacheControl;

    .line 134
    :cond_0
    :goto_0
    new-instance v6, Lokhttp3/Request$Builder;

    invoke-direct {v6}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 135
    .local v0, "builder":Lokhttp3/Request$Builder;
    if-eqz v1, :cond_1

    .line 136
    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->cacheControl(Lokhttp3/CacheControl;)Lokhttp3/Request$Builder;

    .line 139
    :cond_1
    iget-object v6, p0, Lcom/vk/emoji/OkHttp3Downloader;->client:Lokhttp3/Call$Factory;

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v7

    invoke-interface {v6, v7}, Lokhttp3/Call$Factory;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v6

    invoke-interface {v6}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v3

    .line 140
    .local v3, "response":Lokhttp3/Response;
    invoke-virtual {v3}, Lokhttp3/Response;->code()I

    move-result v5

    .line 141
    .local v5, "responseCode":I
    const/16 v6, 0x12c

    if-lt v5, v6, :cond_5

    .line 142
    invoke-virtual {v3}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/ResponseBody;->close()V

    .line 143
    new-instance v6, Lcom/squareup/picasso/Downloader$ResponseException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p2, v5}, Lcom/squareup/picasso/Downloader$ResponseException;-><init>(Ljava/lang/String;II)V

    throw v6

    .line 123
    .end local v0    # "builder":Lokhttp3/Request$Builder;
    .end local v3    # "response":Lokhttp3/Response;
    .end local v5    # "responseCode":I
    :cond_2
    new-instance v0, Lokhttp3/CacheControl$Builder;

    invoke-direct {v0}, Lokhttp3/CacheControl$Builder;-><init>()V

    .line 124
    .local v0, "builder":Lokhttp3/CacheControl$Builder;
    invoke-static {p2}, Lcom/squareup/picasso/NetworkPolicy;->shouldReadFromDiskCache(I)Z

    move-result v6

    if-nez v6, :cond_3

    .line 125
    invoke-virtual {v0}, Lokhttp3/CacheControl$Builder;->noCache()Lokhttp3/CacheControl$Builder;

    .line 127
    :cond_3
    invoke-static {p2}, Lcom/squareup/picasso/NetworkPolicy;->shouldWriteToDiskCache(I)Z

    move-result v6

    if-nez v6, :cond_4

    .line 128
    invoke-virtual {v0}, Lokhttp3/CacheControl$Builder;->noStore()Lokhttp3/CacheControl$Builder;

    .line 130
    :cond_4
    invoke-virtual {v0}, Lokhttp3/CacheControl$Builder;->build()Lokhttp3/CacheControl;

    move-result-object v1

    goto :goto_0

    .line 147
    .local v0, "builder":Lokhttp3/Request$Builder;
    .restart local v3    # "response":Lokhttp3/Response;
    .restart local v5    # "responseCode":I
    :cond_5
    invoke-virtual {v3}, Lokhttp3/Response;->cacheResponse()Lokhttp3/Response;

    move-result-object v6

    if-eqz v6, :cond_6

    const/4 v2, 0x1

    .line 149
    .local v2, "fromCache":Z
    :goto_1
    invoke-virtual {v3}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v4

    .line 150
    .local v4, "responseBody":Lokhttp3/ResponseBody;
    new-instance v6, Lcom/squareup/picasso/Downloader$Response;

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v8

    invoke-direct {v6, v7, v2, v8, v9}, Lcom/squareup/picasso/Downloader$Response;-><init>(Ljava/io/InputStream;ZJ)V

    return-object v6

    .line 147
    .end local v2    # "fromCache":Z
    .end local v4    # "responseBody":Lokhttp3/ResponseBody;
    :cond_6
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/vk/emoji/OkHttp3Downloader;->cache:Lokhttp3/Cache;

    if-eqz v0, :cond_0

    .line 157
    :try_start_0
    iget-object v0, p0, Lcom/vk/emoji/OkHttp3Downloader;->cache:Lokhttp3/Cache;

    invoke-virtual {v0}, Lokhttp3/Cache;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    :cond_0
    :goto_0
    return-void

    .line 158
    :catch_0
    move-exception v0

    goto :goto_0
.end method
