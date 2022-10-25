.class final Lcom/vk/stories/StoryVideoCache$2;
.super Ljava/lang/Object;
.source "StoryVideoCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoryVideoCache;->prefetchVideo(Lcom/vk/stories/model/StoryEntry;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$entry:Lcom/vk/stories/model/StoryEntry;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;)V
    .locals 0

    .prologue
    .line 63
    iput-object p1, p0, Lcom/vk/stories/StoryVideoCache$2;->val$url:Ljava/lang/String;

    iput-object p2, p0, Lcom/vk/stories/StoryVideoCache$2;->val$entry:Lcom/vk/stories/model/StoryEntry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 68
    :try_start_0
    invoke-static {}, Lcom/vk/stories/StoryVideoCache;->access$000()Lcom/danikula/videocache/HttpProxyCacheServer;

    move-result-object v3

    iget-object v4, p0, Lcom/vk/stories/StoryVideoCache$2;->val$url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/danikula/videocache/HttpProxyCacheServer;->isCached(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_0

    .line 81
    invoke-static {}, Lcom/vk/stories/StoryVideoCache;->access$100()Ljava/util/Set;

    move-result-object v3

    iget-object v4, p0, Lcom/vk/stories/StoryVideoCache$2;->val$entry:Lcom/vk/stories/model/StoryEntry;

    invoke-interface {v3, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 83
    :goto_0
    return-void

    .line 74
    :cond_0
    :try_start_1
    new-instance v3, Lokhttp3/Request$Builder;

    invoke-direct {v3}, Lokhttp3/Request$Builder;-><init>()V

    invoke-static {}, Lcom/vk/stories/StoryVideoCache;->access$000()Lcom/danikula/videocache/HttpProxyCacheServer;

    move-result-object v4

    iget-object v5, p0, Lcom/vk/stories/StoryVideoCache$2;->val$entry:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v5}, Lcom/vk/stories/model/StoryEntry;->getVideoUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/danikula/videocache/HttpProxyCacheServer;->getProxyUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    .line 75
    .local v1, "request":Lokhttp3/Request;
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v3

    invoke-virtual {v3, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v3

    invoke-interface {v3}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v2

    .line 76
    .local v2, "response":Lokhttp3/Response;
    invoke-virtual {v2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v3

    invoke-static {}, Lokio/Okio;->blackhole()Lokio/Sink;

    move-result-object v4

    invoke-interface {v3, v4}, Lokio/BufferedSource;->readAll(Lokio/Sink;)J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 81
    .end local v1    # "request":Lokhttp3/Request;
    .end local v2    # "response":Lokhttp3/Response;
    :goto_1
    invoke-static {}, Lcom/vk/stories/StoryVideoCache;->access$100()Ljava/util/Set;

    move-result-object v3

    iget-object v4, p0, Lcom/vk/stories/StoryVideoCache$2;->val$entry:Lcom/vk/stories/model/StoryEntry;

    invoke-interface {v3, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    const-string/jumbo v3, "StoryVideoCache"

    const-string/jumbo v4, "Error while caching video"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 81
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-static {}, Lcom/vk/stories/StoryVideoCache;->access$100()Ljava/util/Set;

    move-result-object v4

    iget-object v5, p0, Lcom/vk/stories/StoryVideoCache$2;->val$entry:Lcom/vk/stories/model/StoryEntry;

    invoke-interface {v4, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    throw v3
.end method
