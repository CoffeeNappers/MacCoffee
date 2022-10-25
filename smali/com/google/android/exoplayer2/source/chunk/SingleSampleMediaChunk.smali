.class public final Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;
.super Lcom/google/android/exoplayer2/source/chunk/BaseMediaChunk;
.source "SingleSampleMediaChunk.java"


# instance fields
.field private volatile bytesLoaded:I

.field private volatile loadCanceled:Z

.field private volatile loadCompleted:Z

.field private final sampleFormat:Lcom/google/android/exoplayer2/Format;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;JJILcom/google/android/exoplayer2/Format;)V
    .locals 0
    .param p1, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .param p3, "trackFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p4, "trackSelectionReason"    # I
    .param p5, "trackSelectionData"    # Ljava/lang/Object;
    .param p6, "startTimeUs"    # J
    .param p8, "endTimeUs"    # J
    .param p10, "chunkIndex"    # I
    .param p11, "sampleFormat"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 52
    invoke-direct/range {p0 .. p10}, Lcom/google/android/exoplayer2/source/chunk/BaseMediaChunk;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;JJI)V

    .line 54
    iput-object p11, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->sampleFormat:Lcom/google/android/exoplayer2/Format;

    .line 55
    return-void
.end method


# virtual methods
.method public bytesLoaded()J
    .locals 2

    .prologue
    .line 64
    iget v0, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public cancelLoad()V
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->loadCanceled:Z

    .line 72
    return-void
.end method

.method public isLoadCanceled()Z
    .locals 1

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->loadCanceled:Z

    return v0
.end method

.method public isLoadCompleted()Z
    .locals 1

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->loadCompleted:Z

    return v0
.end method

.method public load()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget v2, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    invoke-static {v1, v2}, Lcom/google/android/exoplayer2/util/Util;->getRemainderDataSpec(Lcom/google/android/exoplayer2/upstream/DataSpec;I)Lcom/google/android/exoplayer2/upstream/DataSpec;

    move-result-object v6

    .line 85
    .local v6, "loadDataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    :try_start_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-interface {v1, v6}, Lcom/google/android/exoplayer2/upstream/DataSource;->open(Lcom/google/android/exoplayer2/upstream/DataSpec;)J

    move-result-wide v4

    .line 86
    .local v4, "length":J
    const-wide/16 v2, -0x1

    cmp-long v1, v4, v2

    if-eqz v1, :cond_0

    .line 87
    iget v1, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    int-to-long v2, v1

    add-long/2addr v4, v2

    .line 89
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultExtractorInput;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iget v2, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    int-to-long v2, v2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/extractor/DefaultExtractorInput;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;JJ)V

    .line 90
    .local v0, "extractorInput":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->getTrackOutput()Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    move-result-object v7

    .line 91
    .local v7, "trackOutput":Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->sampleFormat:Lcom/google/android/exoplayer2/Format;

    const-wide/16 v2, 0x0

    invoke-virtual {v7, v1, v2, v3}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->formatWithOffset(Lcom/google/android/exoplayer2/Format;J)V

    .line 93
    const/4 v14, 0x0

    .line 94
    .local v14, "result":I
    :goto_0
    const/4 v1, -0x1

    if-eq v14, v1, :cond_1

    .line 95
    iget v1, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    add-int/2addr v1, v14

    iput v1, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    .line 96
    const v1, 0x7fffffff

    const/4 v2, 0x1

    invoke-virtual {v7, v0, v1, v2}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->sampleData(Lcom/google/android/exoplayer2/extractor/ExtractorInput;IZ)I

    move-result v14

    goto :goto_0

    .line 98
    :cond_1
    iget v11, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    .line 99
    .local v11, "sampleSize":I
    iget-wide v8, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->startTimeUs:J

    const/4 v10, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual/range {v7 .. v13}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->sampleMetadata(JIII[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-static {v1}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Lcom/google/android/exoplayer2/upstream/DataSource;)V

    .line 103
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->loadCompleted:Z

    .line 104
    return-void

    .line 101
    .end local v0    # "extractorInput":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .end local v4    # "length":J
    .end local v7    # "trackOutput":Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;
    .end local v11    # "sampleSize":I
    .end local v14    # "result":I
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-static {v2}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Lcom/google/android/exoplayer2/upstream/DataSource;)V

    throw v1
.end method
