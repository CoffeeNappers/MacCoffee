.class Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;
.super Ljava/lang/Object;
.source "ExoVideoPlayer.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/DataSource$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/ExoVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CustomHttpDataSourceFactory"
.end annotation


# instance fields
.field private client:Lokhttp3/Call$Factory;

.field private factory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

.field private lastHost:Ljava/lang/String;

.field private useProxy:Z


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/upstream/TransferListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/google/android/exoplayer2/upstream/DataSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 865
    .local p1, "listener":Lcom/google/android/exoplayer2/upstream/TransferListener;, "Lcom/google/android/exoplayer2/upstream/TransferListener<-Lcom/google/android/exoplayer2/upstream/DataSource;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 843
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->useProxy:Z

    .line 846
    new-instance v1, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory$1;-><init>(Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;)V

    iput-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->client:Lokhttp3/Call$Factory;

    .line 866
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->getUserAgent()Lcom/vk/core/network/NetworkUserAgent;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkUserAgent;->userAgent()Ljava/lang/String;

    move-result-object v0

    .line 867
    .local v0, "userAgent":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->useProxy:Z

    if-eqz v1, :cond_0

    .line 868
    new-instance v1, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSourceFactory;

    iget-object v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->client:Lokhttp3/Call$Factory;

    invoke-direct {v1, v2, v0, p1}, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSourceFactory;-><init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    iput-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->factory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    .line 872
    :goto_0
    return-void

    .line 870
    :cond_0
    new-instance v1, Lcom/google/android/exoplayer2/upstream/DefaultHttpDataSourceFactory;

    invoke-direct {v1, v0, p1}, Lcom/google/android/exoplayer2/upstream/DefaultHttpDataSourceFactory;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    iput-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->factory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    goto :goto_0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

    .prologue
    .line 841
    iget-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->useProxy:Z

    return v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

    .prologue
    .line 841
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->lastHost:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$902(Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 841
    iput-object p1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->lastHost:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public createDataSource()Lcom/google/android/exoplayer2/upstream/DataSource;
    .locals 1

    .prologue
    .line 876
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->factory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/upstream/DataSource$Factory;->createDataSource()Lcom/google/android/exoplayer2/upstream/DataSource;

    move-result-object v0

    return-object v0
.end method
