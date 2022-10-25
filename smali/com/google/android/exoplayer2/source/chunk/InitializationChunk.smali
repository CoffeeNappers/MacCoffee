.class public final Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;
.super Lcom/google/android/exoplayer2/source/chunk/Chunk;
.source "InitializationChunk.java"

# interfaces
.implements Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper$SeekMapOutput;
.implements Lcom/google/android/exoplayer2/extractor/TrackOutput;


# instance fields
.field private volatile bytesLoaded:I

.field private final extractorWrapper:Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;

.field private volatile loadCanceled:Z

.field private sampleFormat:Lcom/google/android/exoplayer2/Format;

.field private seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;)V
    .locals 14
    .param p1, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .param p3, "trackFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p4, "trackSelectionReason"    # I
    .param p5, "trackSelectionData"    # Ljava/lang/Object;
    .param p6, "extractorWrapper"    # Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;

    .prologue
    .line 61
    const/4 v6, 0x2

    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    move-object v3, p0

    move-object v4, p1

    move-object/from16 v5, p2

    move-object/from16 v7, p3

    move/from16 v8, p4

    move-object/from16 v9, p5

    invoke-direct/range {v3 .. v13}, Lcom/google/android/exoplayer2/source/chunk/Chunk;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;ILcom/google/android/exoplayer2/Format;ILjava/lang/Object;JJ)V

    .line 63
    move-object/from16 v0, p6

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->extractorWrapper:Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;

    .line 64
    return-void
.end method


# virtual methods
.method public bytesLoaded()J
    .locals 2

    .prologue
    .line 68
    iget v0, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->bytesLoaded:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public cancelLoad()V
    .locals 1

    .prologue
    .line 124
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->loadCanceled:Z

    .line 125
    return-void
.end method

.method public format(Lcom/google/android/exoplayer2/Format;)V
    .locals 0
    .param p1, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->sampleFormat:Lcom/google/android/exoplayer2/Format;

    .line 101
    return-void
.end method

.method public getSampleFormat()Lcom/google/android/exoplayer2/Format;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->sampleFormat:Lcom/google/android/exoplayer2/Format;

    return-object v0
.end method

.method public getSeekMap()Lcom/google/android/exoplayer2/extractor/SeekMap;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    return-object v0
.end method

.method public isLoadCanceled()Z
    .locals 1

    .prologue
    .line 129
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->loadCanceled:Z

    return v0
.end method

.method public load()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 135
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget v2, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->bytesLoaded:I

    invoke-static {v1, v2}, Lcom/google/android/exoplayer2/util/Util;->getRemainderDataSpec(Lcom/google/android/exoplayer2/upstream/DataSpec;I)Lcom/google/android/exoplayer2/upstream/DataSpec;

    move-result-object v7

    .line 138
    .local v7, "loadDataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    :try_start_0
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultExtractorInput;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iget-wide v2, v7, Lcom/google/android/exoplayer2/upstream/DataSpec;->absoluteStreamPosition:J

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 139
    invoke-interface {v4, v7}, Lcom/google/android/exoplayer2/upstream/DataSource;->open(Lcom/google/android/exoplayer2/upstream/DataSpec;)J

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/extractor/DefaultExtractorInput;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;JJ)V

    .line 140
    .local v0, "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    iget v1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->bytesLoaded:I

    if-nez v1, :cond_0

    .line 142
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->extractorWrapper:Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;

    invoke-virtual {v1, p0, p0}, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->init(Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper$SeekMapOutput;Lcom/google/android/exoplayer2/extractor/TrackOutput;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 146
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->extractorWrapper:Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;

    iget-object v6, v1, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    .line 147
    .local v6, "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    const/4 v8, 0x0

    .line 148
    .local v8, "result":I
    :goto_0
    if-nez v8, :cond_1

    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->loadCanceled:Z

    if-nez v1, :cond_1

    .line 149
    const/4 v1, 0x0

    invoke-interface {v6, v0, v1}, Lcom/google/android/exoplayer2/extractor/Extractor;->read(Lcom/google/android/exoplayer2/extractor/ExtractorInput;Lcom/google/android/exoplayer2/extractor/PositionHolder;)I

    move-result v8

    goto :goto_0

    .line 151
    :cond_1
    if-eq v8, v9, :cond_2

    move v1, v9

    :goto_1
    invoke-static {v1}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 153
    :try_start_2
    invoke-interface {v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-wide v4, v1, Lcom/google/android/exoplayer2/upstream/DataSpec;->absoluteStreamPosition:J

    sub-long/2addr v2, v4

    long-to-int v1, v2

    iput v1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->bytesLoaded:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 156
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-static {v1}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Lcom/google/android/exoplayer2/upstream/DataSource;)V

    .line 158
    return-void

    .line 151
    :cond_2
    const/4 v1, 0x0

    goto :goto_1

    .line 153
    .end local v6    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    .end local v8    # "result":I
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-interface {v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-wide v4, v4, Lcom/google/android/exoplayer2/upstream/DataSpec;->absoluteStreamPosition:J

    sub-long/2addr v2, v4

    long-to-int v2, v2

    iput v2, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->bytesLoaded:I

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 156
    .end local v0    # "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    :catchall_1
    move-exception v1

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-static {v2}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Lcom/google/android/exoplayer2/upstream/DataSource;)V

    throw v1
.end method

.method public sampleData(Lcom/google/android/exoplayer2/extractor/ExtractorInput;IZ)I
    .locals 2
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .param p2, "length"    # I
    .param p3, "allowEndOfInput"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 106
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Unexpected sample data in initialization chunk"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V
    .locals 2
    .param p1, "data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p2, "length"    # I

    .prologue
    .line 111
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Unexpected sample data in initialization chunk"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sampleMetadata(JIII[B)V
    .locals 2
    .param p1, "timeUs"    # J
    .param p3, "flags"    # I
    .param p4, "size"    # I
    .param p5, "offset"    # I
    .param p6, "encryptionKey"    # [B

    .prologue
    .line 117
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Unexpected sample data in initialization chunk"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public seekMap(Lcom/google/android/exoplayer2/extractor/SeekMap;)V
    .locals 0
    .param p1, "seekMap"    # Lcom/google/android/exoplayer2/extractor/SeekMap;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    .line 94
    return-void
.end method
