.class final Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;
.super Ljava/lang/Object;
.source "AudioFileDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/DataSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;
    }
.end annotation


# instance fields
.field private bytesRemaining:J

.field private file:Ljava/io/RandomAccessFile;

.field private final listener:Lcom/google/android/exoplayer2/upstream/TransferListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;",
            ">;"
        }
    .end annotation
.end field

.field private opened:Z

.field private uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;-><init>(Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    .line 37
    return-void
.end method

.method constructor <init>(Lcom/google/android/exoplayer2/upstream/TransferListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "listener":Lcom/google/android/exoplayer2/upstream/TransferListener;, "Lcom/google/android/exoplayer2/upstream/TransferListener<-Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    .line 44
    return-void
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 104
    iput-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->uri:Landroid/net/Uri;

    .line 106
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->file:Ljava/io/RandomAccessFile;

    if-eqz v1, :cond_0

    .line 107
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    :cond_0
    iput-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->file:Ljava/io/RandomAccessFile;

    .line 113
    iget-boolean v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->opened:Z

    if-eqz v1, :cond_1

    .line 114
    iput-boolean v3, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->opened:Z

    .line 115
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v1, :cond_1

    .line 116
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v1, p0}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onTransferEnd(Ljava/lang/Object;)V

    .line 120
    :cond_1
    return-void

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v1, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    iput-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->file:Ljava/io/RandomAccessFile;

    .line 113
    iget-boolean v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->opened:Z

    if-eqz v2, :cond_2

    .line 114
    iput-boolean v3, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->opened:Z

    .line 115
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v2, :cond_2

    .line 116
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v2, p0}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onTransferEnd(Ljava/lang/Object;)V

    :cond_2
    throw v1
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->uri:Landroid/net/Uri;

    return-object v0
.end method

.method public open(Lcom/google/android/exoplayer2/upstream/DataSpec;)J
    .locals 6
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;
        }
    .end annotation

    .prologue
    .line 49
    :try_start_0
    iget-object v1, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->getPlayedUrlFromUrl(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->uri:Landroid/net/Uri;

    .line 50
    new-instance v1, Ljava/io/RandomAccessFile;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->uri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "r"

    invoke-direct {v1, v2, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->file:Ljava/io/RandomAccessFile;

    .line 51
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->file:Ljava/io/RandomAccessFile;

    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->position:J

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 52
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    iget-wide v4, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->position:J

    sub-long/2addr v2, v4

    :goto_0
    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->bytesRemaining:J

    .line 54
    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->bytesRemaining:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-gez v1, :cond_1

    .line 55
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v1

    .line 52
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    :try_start_1
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 61
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->opened:Z

    .line 62
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v1, :cond_2

    .line 63
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v1, p0, p1}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onTransferStart(Ljava/lang/Object;Lcom/google/android/exoplayer2/upstream/DataSpec;)V

    .line 65
    :cond_2
    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->bytesRemaining:J

    return-wide v2
.end method

.method public read([BII)I
    .locals 10
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;
        }
    .end annotation

    .prologue
    .line 70
    if-nez p3, :cond_1

    .line 71
    const/4 v0, 0x0

    .line 93
    :cond_0
    :goto_0
    return v0

    .line 72
    :cond_1
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->bytesRemaining:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_2

    .line 73
    const/4 v0, -0x1

    goto :goto_0

    .line 77
    :cond_2
    :try_start_0
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v2

    .line 79
    .local v2, "filePointer":J
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->file:Ljava/io/RandomAccessFile;

    iget-wide v6, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->bytesRemaining:J

    int-to-long v8, p3

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v5, v6

    invoke-virtual {v4, p1, p2, v5}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v0

    .line 81
    .local v0, "bytesRead":I
    invoke-static {p1, p2, v0, v2, v3}, Lcom/vkontakte/android/audio/utils/Utils;->doXor([BIIJ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    if-lez v0, :cond_0

    .line 87
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->bytesRemaining:J

    int-to-long v6, v0

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->bytesRemaining:J

    .line 88
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v4, :cond_0

    .line 89
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v4, p0, v0}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onBytesTransferred(Ljava/lang/Object;I)V

    goto :goto_0

    .line 82
    .end local v0    # "bytesRead":I
    .end local v2    # "filePointer":J
    :catch_0
    move-exception v1

    .line 83
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;

    invoke-direct {v4, v1}, Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v4
.end method
