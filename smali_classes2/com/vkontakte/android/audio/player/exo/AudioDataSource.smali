.class final Lcom/vkontakte/android/audio/player/exo/AudioDataSource;
.super Ljava/lang/Object;
.source "AudioDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/DataSource;


# static fields
.field private static final SCHEME_ASSET:Ljava/lang/String; = "asset"

.field private static final SCHEME_CONTENT:Ljava/lang/String; = "content"

.field static final SCHEME_VK_AUDIO_FILE:Ljava/lang/String; = "afile"

.field static final SCHEME_VK_AUDIO_HTTP:Ljava/lang/String; = "ahttp"


# instance fields
.field private final assetDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private final baseDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private bytesLoaded:J

.field private final contentDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private final fileDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private lastUri:Ljava/lang/String;

.field private loadTime:J

.field private needSendStats:Z

.field private startLoadTime:J

.field private final vkAFileDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private wasError:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer2/upstream/TransferListener;Lcom/google/android/exoplayer2/upstream/DataSource;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "baseDataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/google/android/exoplayer2/upstream/DataSource;",
            ">;",
            "Lcom/google/android/exoplayer2/upstream/DataSource;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "listener":Lcom/google/android/exoplayer2/upstream/TransferListener;, "Lcom/google/android/exoplayer2/upstream/TransferListener<-Lcom/google/android/exoplayer2/upstream/DataSource;>;"
    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->lastUri:Ljava/lang/String;

    .line 34
    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->needSendStats:Z

    .line 35
    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->startLoadTime:J

    .line 36
    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->loadTime:J

    .line 37
    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->bytesLoaded:J

    .line 38
    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->wasError:Z

    .line 60
    invoke-static {p3}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/upstream/DataSource;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->baseDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 61
    new-instance v0, Lcom/google/android/exoplayer2/upstream/FileDataSource;

    invoke-direct {v0, p2}, Lcom/google/android/exoplayer2/upstream/FileDataSource;-><init>(Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->fileDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 62
    new-instance v0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;

    invoke-direct {v0, p2}, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;-><init>(Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->vkAFileDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 63
    new-instance v0, Lcom/google/android/exoplayer2/upstream/AssetDataSource;

    invoke-direct {v0, p1, p2}, Lcom/google/android/exoplayer2/upstream/AssetDataSource;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->assetDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 64
    new-instance v0, Lcom/google/android/exoplayer2/upstream/ContentDataSource;

    invoke-direct {v0, p1, p2}, Lcom/google/android/exoplayer2/upstream/ContentDataSource;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->contentDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 65
    return-void
.end method

.method private endLoad(I)V
    .locals 6
    .param p1, "bytesCount"    # I

    .prologue
    .line 54
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->bytesLoaded:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->bytesLoaded:J

    .line 55
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->loadTime:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->startLoadTime:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->loadTime:J

    .line 56
    return-void
.end method

.method private initStatsValues()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->lastUri:Ljava/lang/String;

    .line 42
    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->needSendStats:Z

    .line 43
    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->startLoadTime:J

    .line 44
    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->loadTime:J

    .line 45
    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->bytesLoaded:J

    .line 46
    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->wasError:Z

    .line 47
    return-void
.end method

.method private startLoad()V
    .locals 2

    .prologue
    .line 50
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->startLoadTime:J

    .line 51
    return-void
.end method


# virtual methods
.method public close()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    if-eqz v0, :cond_0

    .line 137
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/upstream/DataSource;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    iput-object v7, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 142
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->needSendStats:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->wasError:Z

    if-nez v0, :cond_1

    .line 143
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->lastUri:Ljava/lang/String;

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->bytesLoaded:J

    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->loadTime:J

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v7}, Lcom/vkontakte/android/data/BenchmarkTracker;->trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V

    .line 145
    :cond_1
    return-void

    .line 139
    :catchall_0
    move-exception v0

    iput-object v7, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    throw v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/upstream/DataSource;->getUri()Landroid/net/Uri;

    move-result-object v0

    goto :goto_0
.end method

.method public open(Lcom/google/android/exoplayer2/upstream/DataSpec;)J
    .locals 11
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v6, 0x0

    .line 69
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->initStatsValues()V

    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 72
    iget-object v0, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v10

    .line 73
    .local v10, "scheme":Ljava/lang/String;
    const-string/jumbo v0, "afile"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->vkAFileDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 90
    :goto_1
    iget-object v0, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->lastUri:Ljava/lang/String;

    .line 92
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->startLoad()V

    .line 95
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-interface {v0, p1}, Lcom/google/android/exoplayer2/upstream/DataSource;->open(Lcom/google/android/exoplayer2/upstream/DataSpec;)J

    move-result-wide v8

    .line 96
    .local v8, "ret":J
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->endLoad(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    return-wide v8

    .end local v8    # "ret":J
    .end local v10    # "scheme":Ljava/lang/String;
    :cond_0
    move v0, v6

    .line 70
    goto :goto_0

    .line 75
    .restart local v10    # "scheme":Ljava/lang/String;
    :cond_1
    iget-object v0, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Util;->isLocalFileUri(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 76
    iget-object v0, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "/android_asset/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 77
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->assetDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    goto :goto_1

    .line 79
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->fileDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    goto :goto_1

    .line 81
    :cond_3
    const-string/jumbo v0, "asset"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->assetDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    goto :goto_1

    .line 83
    :cond_4
    const-string/jumbo v0, "content"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->contentDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    goto :goto_1

    .line 86
    :cond_5
    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->needSendStats:Z

    .line 87
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->baseDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    goto :goto_1

    .line 98
    :catch_0
    move-exception v7

    .line 99
    .local v7, "e":Ljava/lang/Exception;
    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->endLoad(I)V

    .line 101
    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->wasError:Z

    .line 102
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->needSendStats:Z

    if-eqz v0, :cond_6

    .line 103
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->lastUri:Ljava/lang/String;

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->bytesLoaded:J

    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->loadTime:J

    invoke-virtual/range {v0 .. v7}, Lcom/vkontakte/android/data/BenchmarkTracker;->trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V

    .line 105
    :cond_6
    throw v7
.end method

.method public read([BII)I
    .locals 9
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 111
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->startLoad()V

    .line 114
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/android/exoplayer2/upstream/DataSource;->read([BII)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    .line 124
    .local v8, "ret":I
    invoke-direct {p0, p3}, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->endLoad(I)V

    .line 125
    return v8

    .line 115
    .end local v8    # "ret":I
    :catch_0
    move-exception v7

    .line 116
    .local v7, "e":Ljava/lang/Exception;
    invoke-direct {p0, v6}, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->endLoad(I)V

    .line 118
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->wasError:Z

    .line 119
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->needSendStats:Z

    if-eqz v0, :cond_0

    .line 120
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->lastUri:Ljava/lang/String;

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->bytesLoaded:J

    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;->loadTime:J

    invoke-virtual/range {v0 .. v7}, Lcom/vkontakte/android/data/BenchmarkTracker;->trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V

    .line 122
    :cond_0
    throw v7
.end method
