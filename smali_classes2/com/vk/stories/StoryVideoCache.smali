.class public Lcom/vk/stories/StoryVideoCache;
.super Ljava/lang/Object;
.source "StoryVideoCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/StoryVideoCache$UrlCallback;
    }
.end annotation


# static fields
.field private static final CACHE_SIZE_BYTES:I = 0x2faf080

.field private static final CACHE_SIZE_ENTRIES:I = 0xa

.field private static final TAG:Ljava/lang/String; = "StoryVideoCache"

.field private static final downloadExecutor:Ljava/util/concurrent/Executor;

.field private static final linkExecutor:Ljava/util/concurrent/Executor;

.field private static final pendingVideoRequests:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/vk/stories/model/StoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private static videoCache:Lcom/danikula/videocache/HttpProxyCacheServer;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 30
    new-instance v0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;-><init>(Landroid/content/Context;)V

    .line 31
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVideoCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->cacheDirectory(Ljava/io/File;)Lcom/danikula/videocache/HttpProxyCacheServer$Builder;

    move-result-object v0

    const/16 v1, 0xa

    .line 32
    invoke-virtual {v0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->maxCacheFilesCount(I)Lcom/danikula/videocache/HttpProxyCacheServer$Builder;

    move-result-object v0

    const-wide/32 v2, 0x2faf080

    .line 33
    invoke-virtual {v0, v2, v3}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->maxCacheSize(J)Lcom/danikula/videocache/HttpProxyCacheServer$Builder;

    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->build()Lcom/danikula/videocache/HttpProxyCacheServer;

    move-result-object v0

    sput-object v0, Lcom/vk/stories/StoryVideoCache;->videoCache:Lcom/danikula/videocache/HttpProxyCacheServer;

    .line 36
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/stories/StoryVideoCache;->downloadExecutor:Ljava/util/concurrent/Executor;

    .line 37
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/stories/StoryVideoCache;->linkExecutor:Ljava/util/concurrent/Executor;

    .line 38
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/vk/stories/StoryVideoCache;->pendingVideoRequests:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/danikula/videocache/HttpProxyCacheServer;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/vk/stories/StoryVideoCache;->videoCache:Lcom/danikula/videocache/HttpProxyCacheServer;

    return-object v0
.end method

.method static synthetic access$100()Ljava/util/Set;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/vk/stories/StoryVideoCache;->pendingVideoRequests:Ljava/util/Set;

    return-object v0
.end method

.method public static getVideoUrl(Lcom/vk/stories/model/StoryEntry;Lcom/vk/stories/StoryVideoCache$UrlCallback;)V
    .locals 2
    .param p0, "entry"    # Lcom/vk/stories/model/StoryEntry;
    .param p1, "urlCallback"    # Lcom/vk/stories/StoryVideoCache$UrlCallback;

    .prologue
    .line 41
    sget-object v0, Lcom/vk/stories/StoryVideoCache;->linkExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/vk/stories/StoryVideoCache$1;

    invoke-direct {v1, p1, p0}, Lcom/vk/stories/StoryVideoCache$1;-><init>(Lcom/vk/stories/StoryVideoCache$UrlCallback;Lcom/vk/stories/model/StoryEntry;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 47
    return-void
.end method

.method public static prefetchVideo(Lcom/vk/stories/model/StoryEntry;)V
    .locals 3
    .param p0, "entry"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 51
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/vk/stories/model/StoryEntry;->getVideoUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 86
    :cond_0
    :goto_0
    return-void

    .line 56
    :cond_1
    sget-object v1, Lcom/vk/stories/StoryVideoCache;->pendingVideoRequests:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 59
    sget-object v1, Lcom/vk/stories/StoryVideoCache;->pendingVideoRequests:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 62
    invoke-virtual {p0}, Lcom/vk/stories/model/StoryEntry;->getVideoUrl()Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "url":Ljava/lang/String;
    sget-object v1, Lcom/vk/stories/StoryVideoCache;->downloadExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/vk/stories/StoryVideoCache$2;

    invoke-direct {v2, v0, p0}, Lcom/vk/stories/StoryVideoCache$2;-><init>(Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
