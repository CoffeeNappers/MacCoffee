.class public Lcom/vk/imageloader/VKCacheKeyFactory;
.super Lcom/facebook/imagepipeline/cache/DefaultCacheKeyFactory;
.source "VKCacheKeyFactory.java"


# static fields
.field private static sInstance:Lcom/vk/imageloader/VKCacheKeyFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const/4 v0, 0x0

    sput-object v0, Lcom/vk/imageloader/VKCacheKeyFactory;->sInstance:Lcom/vk/imageloader/VKCacheKeyFactory;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/facebook/imagepipeline/cache/DefaultCacheKeyFactory;-><init>()V

    .line 11
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/vk/imageloader/VKCacheKeyFactory;
    .locals 2

    .prologue
    .line 14
    const-class v1, Lcom/vk/imageloader/VKCacheKeyFactory;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/vk/imageloader/VKCacheKeyFactory;->sInstance:Lcom/vk/imageloader/VKCacheKeyFactory;

    if-nez v0, :cond_0

    .line 15
    new-instance v0, Lcom/vk/imageloader/VKCacheKeyFactory;

    invoke-direct {v0}, Lcom/vk/imageloader/VKCacheKeyFactory;-><init>()V

    sput-object v0, Lcom/vk/imageloader/VKCacheKeyFactory;->sInstance:Lcom/vk/imageloader/VKCacheKeyFactory;

    .line 17
    :cond_0
    sget-object v0, Lcom/vk/imageloader/VKCacheKeyFactory;->sInstance:Lcom/vk/imageloader/VKCacheKeyFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 14
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getRawUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 39
    const/4 v0, 0x0

    const-string/jumbo v1, "?"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private isDocWithParamsImage(Ljava/lang/String;)Z
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 34
    const-string/jumbo v0, "https://vk.com/doc"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "http://vk.com/doc"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const-string/jumbo v0, "?"

    .line 35
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected getCacheKeySourceUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 2
    .param p1, "sourceUri"    # Landroid/net/Uri;

    .prologue
    .line 22
    if-nez p1, :cond_1

    .line 23
    const/4 p1, 0x0

    .line 29
    .end local p1    # "sourceUri":Landroid/net/Uri;
    :cond_0
    :goto_0
    return-object p1

    .line 25
    .restart local p1    # "sourceUri":Landroid/net/Uri;
    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "url":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/vk/imageloader/VKCacheKeyFactory;->isDocWithParamsImage(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 27
    invoke-direct {p0, v0}, Lcom/vk/imageloader/VKCacheKeyFactory;->getRawUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_0
.end method
