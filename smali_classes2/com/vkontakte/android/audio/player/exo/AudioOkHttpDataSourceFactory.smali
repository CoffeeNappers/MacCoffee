.class public final Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;
.super Ljava/lang/Object;
.source "AudioOkHttpDataSourceFactory.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/HttpDataSource$Factory;


# instance fields
.field private final cacheControl:Lokhttp3/CacheControl;

.field private final callFactory:Lokhttp3/Call$Factory;

.field private final listener:Lcom/google/android/exoplayer2/upstream/TransferListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/google/android/exoplayer2/upstream/DataSource;",
            ">;"
        }
    .end annotation
.end field

.field private final userAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/TransferListener;)V
    .locals 1
    .param p1, "callFactory"    # Lokhttp3/Call$Factory;
    .param p2, "userAgent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Call$Factory;",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/google/android/exoplayer2/upstream/DataSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p3, "listener":Lcom/google/android/exoplayer2/upstream/TransferListener;, "Lcom/google/android/exoplayer2/upstream/TransferListener<-Lcom/google/android/exoplayer2/upstream/DataSource;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;-><init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/TransferListener;Lokhttp3/CacheControl;)V

    .line 46
    return-void
.end method

.method private constructor <init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/TransferListener;Lokhttp3/CacheControl;)V
    .locals 0
    .param p1, "callFactory"    # Lokhttp3/Call$Factory;
    .param p2, "userAgent"    # Ljava/lang/String;
    .param p4, "cacheControl"    # Lokhttp3/CacheControl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Call$Factory;",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/google/android/exoplayer2/upstream/DataSource;",
            ">;",
            "Lokhttp3/CacheControl;",
            ")V"
        }
    .end annotation

    .prologue
    .line 56
    .local p3, "listener":Lcom/google/android/exoplayer2/upstream/TransferListener;, "Lcom/google/android/exoplayer2/upstream/TransferListener<-Lcom/google/android/exoplayer2/upstream/DataSource;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;->callFactory:Lokhttp3/Call$Factory;

    .line 58
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;->userAgent:Ljava/lang/String;

    .line 59
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    .line 60
    iput-object p4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;->cacheControl:Lokhttp3/CacheControl;

    .line 61
    return-void
.end method


# virtual methods
.method public clearAllDefaultRequestProperties()V
    .locals 0

    .prologue
    .line 81
    return-void
.end method

.method public clearDefaultRequestProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 76
    return-void
.end method

.method public bridge synthetic createDataSource()Lcom/google/android/exoplayer2/upstream/DataSource;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;->createDataSource()Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic createDataSource()Lcom/google/android/exoplayer2/upstream/HttpDataSource;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;->createDataSource()Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;

    move-result-object v0

    return-object v0
.end method

.method public createDataSource()Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;
    .locals 6

    .prologue
    .line 65
    new-instance v0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;->callFactory:Lokhttp3/Call$Factory;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;->userAgent:Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    iget-object v5, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;->cacheControl:Lokhttp3/CacheControl;

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;-><init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/util/Predicate;Lcom/google/android/exoplayer2/upstream/TransferListener;Lokhttp3/CacheControl;)V

    return-object v0
.end method

.method public setDefaultRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 71
    return-void
.end method
