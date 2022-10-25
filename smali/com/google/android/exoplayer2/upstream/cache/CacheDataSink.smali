.class public final Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;
.super Ljava/lang/Object;
.source "CacheDataSink.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/DataSink;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink$CacheDataSinkException;
    }
.end annotation


# instance fields
.field private final bufferSize:I

.field private bufferedOutputStream:Lcom/google/android/exoplayer2/util/ReusableBufferedOutputStream;

.field private final cache:Lcom/google/android/exoplayer2/upstream/cache/Cache;

.field private dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

.field private dataSpecBytesWritten:J

.field private file:Ljava/io/File;

.field private final maxCacheFileSize:J

.field private outputStream:Ljava/io/OutputStream;

.field private outputStreamBytesWritten:J

.field private underlyingFileOutputStream:Ljava/io/FileOutputStream;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/upstream/cache/Cache;J)V
    .locals 2
    .param p1, "cache"    # Lcom/google/android/exoplayer2/upstream/cache/Cache;
    .param p2, "maxCacheFileSize"    # J

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;-><init>(Lcom/google/android/exoplayer2/upstream/cache/Cache;JI)V

    .line 66
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/upstream/cache/Cache;JI)V
    .locals 2
    .param p1, "cache"    # Lcom/google/android/exoplayer2/upstream/cache/Cache;
    .param p2, "maxCacheFileSize"    # J
    .param p4, "bufferSize"    # I

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/upstream/cache/Cache;

    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->cache:Lcom/google/android/exoplayer2/upstream/cache/Cache;

    .line 78
    iput-wide p2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->maxCacheFileSize:J

    .line 79
    iput p4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->bufferSize:I

    .line 80
    return-void
.end method

.method private closeCurrentOutputStream()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 156
    iget-object v2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStream:Ljava/io/OutputStream;

    if-nez v2, :cond_0

    .line 176
    :goto_0
    return-void

    .line 160
    :cond_0
    const/4 v1, 0x0

    .line 162
    .local v1, "success":Z
    :try_start_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 163
    iget-object v2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->underlyingFileOutputStream:Ljava/io/FileOutputStream;

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/FileDescriptor;->sync()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    const/4 v1, 0x1

    .line 166
    iget-object v2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStream:Ljava/io/OutputStream;

    invoke-static {v2}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 167
    iput-object v4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStream:Ljava/io/OutputStream;

    .line 168
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    .line 169
    .local v0, "fileToCommit":Ljava/io/File;
    iput-object v4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    .line 170
    if-eqz v1, :cond_1

    .line 171
    iget-object v2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->cache:Lcom/google/android/exoplayer2/upstream/cache/Cache;

    invoke-interface {v2, v0}, Lcom/google/android/exoplayer2/upstream/cache/Cache;->commitFile(Ljava/io/File;)V

    goto :goto_0

    .line 173
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 166
    .end local v0    # "fileToCommit":Ljava/io/File;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStream:Ljava/io/OutputStream;

    invoke-static {v3}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 167
    iput-object v4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStream:Ljava/io/OutputStream;

    .line 168
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    .line 169
    .restart local v0    # "fileToCommit":Ljava/io/File;
    iput-object v4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    .line 170
    if-eqz v1, :cond_2

    .line 171
    iget-object v3, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->cache:Lcom/google/android/exoplayer2/upstream/cache/Cache;

    invoke-interface {v3, v0}, Lcom/google/android/exoplayer2/upstream/cache/Cache;->commitFile(Ljava/io/File;)V

    .line 175
    :goto_1
    throw v2

    .line 173
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_1
.end method

.method private openNextOutputStream()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-wide v0, v0, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->maxCacheFileSize:J

    .line 137
    .local v4, "maxLength":J
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->cache:Lcom/google/android/exoplayer2/upstream/cache/Cache;

    iget-object v1, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-object v1, v1, Lcom/google/android/exoplayer2/upstream/DataSpec;->key:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-wide v2, v2, Lcom/google/android/exoplayer2/upstream/DataSpec;->absoluteStreamPosition:J

    iget-wide v6, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpecBytesWritten:J

    add-long/2addr v2, v6

    invoke-interface/range {v0 .. v5}, Lcom/google/android/exoplayer2/upstream/cache/Cache;->startFile(Ljava/lang/String;JJ)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    .line 139
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->underlyingFileOutputStream:Ljava/io/FileOutputStream;

    .line 140
    iget v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->bufferSize:I

    if-lez v0, :cond_2

    .line 141
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->bufferedOutputStream:Lcom/google/android/exoplayer2/util/ReusableBufferedOutputStream;

    if-nez v0, :cond_1

    .line 142
    new-instance v0, Lcom/google/android/exoplayer2/util/ReusableBufferedOutputStream;

    iget-object v1, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->underlyingFileOutputStream:Ljava/io/FileOutputStream;

    iget v2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->bufferSize:I

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/util/ReusableBufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->bufferedOutputStream:Lcom/google/android/exoplayer2/util/ReusableBufferedOutputStream;

    .line 147
    :goto_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->bufferedOutputStream:Lcom/google/android/exoplayer2/util/ReusableBufferedOutputStream;

    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStream:Ljava/io/OutputStream;

    .line 151
    :goto_2
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStreamBytesWritten:J

    .line 152
    return-void

    .line 135
    .end local v4    # "maxLength":J
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-wide v0, v0, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J

    iget-wide v2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpecBytesWritten:J

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->maxCacheFileSize:J

    .line 136
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    goto :goto_0

    .line 145
    .restart local v4    # "maxLength":J
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->bufferedOutputStream:Lcom/google/android/exoplayer2/util/ReusableBufferedOutputStream;

    iget-object v1, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->underlyingFileOutputStream:Ljava/io/FileOutputStream;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ReusableBufferedOutputStream;->reset(Ljava/io/OutputStream;)V

    goto :goto_1

    .line 149
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->underlyingFileOutputStream:Ljava/io/FileOutputStream;

    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStream:Ljava/io/OutputStream;

    goto :goto_2
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink$CacheDataSinkException;
        }
    .end annotation

    .prologue
    .line 124
    iget-object v1, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    if-nez v1, :cond_0

    .line 132
    :goto_0
    return-void

    .line 128
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->closeCurrentOutputStream()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 129
    :catch_0
    move-exception v0

    .line 130
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink$CacheDataSinkException;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink$CacheDataSinkException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public open(Lcom/google/android/exoplayer2/upstream/DataSpec;)V
    .locals 6
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink$CacheDataSinkException;
        }
    .end annotation

    .prologue
    .line 84
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    const/4 v1, 0x2

    .line 85
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer2/upstream/DataSpec;->isFlagSet(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 86
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    .line 96
    :goto_0
    return-void

    .line 89
    :cond_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    .line 90
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpecBytesWritten:J

    .line 92
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->openNextOutputStream()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 93
    :catch_0
    move-exception v0

    .line 94
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink$CacheDataSinkException;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink$CacheDataSinkException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public write([BII)V
    .locals 10
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink$CacheDataSinkException;
        }
    .end annotation

    .prologue
    .line 100
    iget-object v3, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    if-nez v3, :cond_1

    .line 120
    :cond_0
    return-void

    .line 104
    :cond_1
    const/4 v1, 0x0

    .line 105
    .local v1, "bytesWritten":I
    :goto_0
    if-ge v1, p3, :cond_0

    .line 106
    :try_start_0
    iget-wide v4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStreamBytesWritten:J

    iget-wide v6, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->maxCacheFileSize:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_2

    .line 107
    invoke-direct {p0}, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->closeCurrentOutputStream()V

    .line 108
    invoke-direct {p0}, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->openNextOutputStream()V

    .line 110
    :cond_2
    sub-int v3, p3, v1

    int-to-long v4, v3

    iget-wide v6, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->maxCacheFileSize:J

    iget-wide v8, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStreamBytesWritten:J

    sub-long/2addr v6, v8

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v0, v4

    .line 112
    .local v0, "bytesToWrite":I
    iget-object v3, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStream:Ljava/io/OutputStream;

    add-int v4, p2, v1

    invoke-virtual {v3, p1, v4, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 113
    add-int/2addr v1, v0

    .line 114
    iget-wide v4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStreamBytesWritten:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->outputStreamBytesWritten:J

    .line 115
    iget-wide v4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpecBytesWritten:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink;->dataSpecBytesWritten:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 117
    .end local v0    # "bytesToWrite":I
    :catch_0
    move-exception v2

    .line 118
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink$CacheDataSinkException;

    invoke-direct {v3, v2}, Lcom/google/android/exoplayer2/upstream/cache/CacheDataSink$CacheDataSinkException;-><init>(Ljava/io/IOException;)V

    throw v3
.end method
