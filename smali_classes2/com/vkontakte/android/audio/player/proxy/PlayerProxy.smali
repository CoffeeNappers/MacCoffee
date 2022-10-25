.class public final Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;
.super Ljava/lang/Thread;
.source "PlayerProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;
    }
.end annotation


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "PlayerProxy"

.field private static final PARAM_MID:Ljava/lang/String; = "mid"

.field private static final PARAM_SALT:Ljava/lang/String; = "SALT"

.field private static final PARAM_URL:Ljava/lang/String; = "url"

.field private static final PORTS:[I

.field private static sInstance:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

.field private static sPort:I


# instance fields
.field private mClientCounter:I

.field private final mContext:Landroid/content/Context;

.field private final mSocket:Ljava/nio/channels/ServerSocketChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->PORTS:[I

    return-void

    nop

    :array_0
    .array-data 4
        0xbcc9
        0x322e
        0x137a
        0x60cb
    .end array-data
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 33
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->mContext:Landroid/content/Context;

    .line 35
    const/4 v1, 0x0

    .line 36
    .local v1, "exception":Ljava/io/IOException;
    const/4 v3, 0x0

    .line 37
    .local v3, "socket":Ljava/nio/channels/ServerSocketChannel;
    sget-object v5, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->PORTS:[I

    array-length v6, v5

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v6, :cond_0

    aget v2, v5, v4

    .line 39
    .local v2, "port":I
    :try_start_0
    invoke-static {}, Ljava/nio/channels/ServerSocketChannel;->open()Ljava/nio/channels/ServerSocketChannel;

    move-result-object v3

    .line 40
    invoke-virtual {v3}, Ljava/nio/channels/ServerSocketChannel;->socket()Ljava/net/ServerSocket;

    move-result-object v7

    new-instance v8, Ljava/net/InetSocketAddress;

    invoke-direct {v8, v2}, Ljava/net/InetSocketAddress;-><init>(I)V

    invoke-virtual {v7, v8}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;)V

    .line 41
    sput v2, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sPort:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    const/4 v1, 0x0

    .line 48
    .end local v2    # "port":I
    :cond_0
    if-eqz v1, :cond_1

    .line 49
    throw v1

    .line 44
    .restart local v2    # "port":I
    :catch_0
    move-exception v0

    .line 45
    .local v0, "e":Ljava/io/IOException;
    move-object v1, v0

    .line 37
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 50
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "port":I
    :cond_1
    iput-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->mSocket:Ljava/nio/channels/ServerSocketChannel;

    .line 51
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public static varargs declared-synchronized cache(Landroid/content/Context;[Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "tracks"    # [Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 70
    const-class v1, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sInstance:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    if-eqz v0, :cond_0

    .line 71
    invoke-static {p0, p1}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->cache(Landroid/content/Context;[Lcom/vkontakte/android/audio/MusicTrack;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    :cond_0
    monitor-exit v1

    return-void

    .line 70
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized createUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "mid"    # Ljava/lang/String;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 76
    const-class v2, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sInstance:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    if-nez v1, :cond_0

    .line 77
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "Proxy has not been initialized"

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    .line 79
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "http://127.0.0.1:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v3, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sPort:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 80
    .local v0, "builder":Landroid/net/Uri$Builder;
    const-string/jumbo v1, "mid"

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 81
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 82
    const-string/jumbo v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 84
    :cond_1
    const-string/jumbo v1, "SALT"

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 86
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    monitor-exit v2

    return-object v1
.end method

.method public static declared-synchronized startThread(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    const-class v1, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sInstance:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sInstance:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    .line 56
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sInstance:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    :cond_0
    monitor-exit v1

    return-void

    .line 54
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized stopThread()V
    .locals 2

    .prologue
    .line 61
    const-class v1, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sInstance:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    if-eqz v0, :cond_0

    .line 62
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sInstance:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->interrupt()V

    .line 63
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sInstance:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    .line 64
    const/4 v0, 0x0

    sput v0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->sPort:I

    .line 66
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->stopAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    monitor-exit v1

    return-void

    .line 61
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public interrupt()V
    .locals 1

    .prologue
    .line 107
    invoke-super {p0}, Ljava/lang/Thread;->interrupt()V

    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->mSocket:Ljava/nio/channels/ServerSocketChannel;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 110
    return-void
.end method

.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 91
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 93
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_0

    .line 95
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->mSocket:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v2}, Ljava/nio/channels/ServerSocketChannel;->accept()Ljava/nio/channels/SocketChannel;

    move-result-object v1

    .line 96
    .local v1, "socket":Ljava/nio/channels/SocketChannel;
    iget v2, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->mClientCounter:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->mClientCounter:I

    .line 97
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "PlayerProxy"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string/jumbo v4, "Client accepted"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string/jumbo v4, "client"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget v4, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->mClientCounter:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 98
    new-instance v2, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;

    iget v3, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->mClientCounter:I

    invoke-direct {v2, p0, v1, v3}, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;-><init>(Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;Ljava/nio/channels/SocketChannel;I)V

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;->start()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 99
    .end local v1    # "socket":Ljava/nio/channels/SocketChannel;
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/io/IOException;
    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 103
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    return-void
.end method
