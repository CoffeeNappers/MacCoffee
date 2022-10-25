.class public Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;
.super Ljava/lang/Object;
.source "DefaultDashChunkSource.java"

# interfaces
.implements Lcom/google/android/exoplayer2/source/dash/DashChunkSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;,
        Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$Factory;
    }
.end annotation


# instance fields
.field private final adaptationSetIndex:I

.field private final dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private final elapsedRealtimeOffsetMs:J

.field private fatalError:Ljava/io/IOException;

.field private manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

.field private final manifestLoaderErrorThrower:Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;

.field private final maxSegmentsPerLoad:I

.field private missingLastSegment:Z

.field private periodIndex:I

.field private final representationHolders:[Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

.field private final trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;IILcom/google/android/exoplayer2/trackselection/TrackSelection;Lcom/google/android/exoplayer2/upstream/DataSource;JI)V
    .locals 9
    .param p1, "manifestLoaderErrorThrower"    # Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;
    .param p2, "manifest"    # Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;
    .param p3, "periodIndex"    # I
    .param p4, "adaptationSetIndex"    # I
    .param p5, "trackSelection"    # Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .param p6, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p7, "elapsedRealtimeOffsetMs"    # J
    .param p9, "maxSegmentsPerLoad"    # I

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifestLoaderErrorThrower:Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;

    .line 113
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    .line 114
    iput p4, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->adaptationSetIndex:I

    .line 115
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    .line 116
    iput-object p6, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 117
    iput p3, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->periodIndex:I

    .line 118
    move-wide/from16 v0, p7

    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->elapsedRealtimeOffsetMs:J

    .line 119
    move/from16 v0, p9

    iput v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->maxSegmentsPerLoad:I

    .line 121
    invoke-virtual {p2, p3}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->getPeriodDurationUs(I)J

    move-result-wide v4

    .line 122
    .local v4, "periodDurationUs":J
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->getRepresentations()Ljava/util/List;

    move-result-object v6

    .line 123
    .local v6, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Representation;>;"
    invoke-interface {p5}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->length()I

    move-result v7

    new-array v7, v7, [Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

    iput-object v7, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->representationHolders:[Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

    .line 124
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->representationHolders:[Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

    array-length v7, v7

    if-ge v2, v7, :cond_0

    .line 125
    invoke-interface {p5, v2}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getIndexInTrackGroup(I)I

    move-result v7

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;

    .line 126
    .local v3, "representation":Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->representationHolders:[Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

    new-instance v8, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

    invoke-direct {v8, v4, v5, v3}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;-><init>(JLcom/google/android/exoplayer2/source/dash/manifest/Representation;)V

    aput-object v8, v7, v2

    .line 124
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 128
    .end local v3    # "representation":Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    :cond_0
    return-void
.end method

.method private getNowUnixTimeUs()J
    .locals 6

    .prologue
    const-wide/16 v4, 0x3e8

    .line 291
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->elapsedRealtimeOffsetMs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 292
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->elapsedRealtimeOffsetMs:J

    add-long/2addr v0, v2

    mul-long/2addr v0, v4

    .line 294
    :goto_0
    return-wide v0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    mul-long/2addr v0, v4

    goto :goto_0
.end method

.method private getRepresentations()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/Representation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 287
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    iget v1, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->periodIndex:I

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->getPeriod(I)Lcom/google/android/exoplayer2/source/dash/manifest/Period;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/exoplayer2/source/dash/manifest/Period;->adaptationSets:Ljava/util/List;

    iget v1, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->adaptationSetIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;

    iget-object v0, v0, Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;->representations:Ljava/util/List;

    return-object v0
.end method

.method private static newInitializationChunk(Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;)Lcom/google/android/exoplayer2/source/chunk/Chunk;
    .locals 12
    .param p0, "representationHolder"    # Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;
    .param p1, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p2, "trackFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p3, "trackSelectionReason"    # I
    .param p4, "trackSelectionData"    # Ljava/lang/Object;
    .param p5, "initializationUri"    # Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .param p6, "indexUri"    # Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    .prologue
    .line 302
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer2/source/dash/manifest/Representation;

    iget-object v10, v3, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->baseUrl:Ljava/lang/String;

    .line 303
    .local v10, "baseUrl":Ljava/lang/String;
    if-eqz p5, :cond_1

    .line 306
    move-object/from16 v0, p5

    move-object/from16 v1, p6

    invoke-virtual {v0, v1, v10}, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->attemptMerge(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v11

    .line 307
    .local v11, "requestUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    if-nez v11, :cond_0

    .line 308
    move-object/from16 v11, p5

    .line 313
    :cond_0
    :goto_0
    new-instance v2, Lcom/google/android/exoplayer2/upstream/DataSpec;

    invoke-virtual {v11, v10}, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->resolveUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-wide v4, v11, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->start:J

    iget-wide v6, v11, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->length:J

    iget-object v8, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer2/source/dash/manifest/Representation;

    .line 314
    invoke-virtual {v8}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->getCacheKey()Ljava/lang/String;

    move-result-object v8

    invoke-direct/range {v2 .. v8}, Lcom/google/android/exoplayer2/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 315
    .local v2, "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    new-instance v3, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;

    iget-object v9, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->extractorWrapper:Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;

    move-object v4, p1

    move-object v5, v2

    move-object v6, p2

    move v7, p3

    move-object/from16 v8, p4

    invoke-direct/range {v3 .. v9}, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;)V

    return-object v3

    .line 311
    .end local v2    # "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    .end local v11    # "requestUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    :cond_1
    move-object/from16 v11, p6

    .restart local v11    # "requestUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    goto :goto_0
.end method

.method private static newMediaChunk(Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;Lcom/google/android/exoplayer2/Format;II)Lcom/google/android/exoplayer2/source/chunk/Chunk;
    .locals 28
    .param p0, "representationHolder"    # Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;
    .param p1, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p2, "trackFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p3, "trackSelectionReason"    # I
    .param p4, "trackSelectionData"    # Ljava/lang/Object;
    .param p5, "sampleFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p6, "firstSegmentNum"    # I
    .param p7, "maxSegmentCount"    # I

    .prologue
    .line 322
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer2/source/dash/manifest/Representation;

    move-object/from16 v26, v0

    .line 323
    .local v26, "representation":Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    move-object/from16 v0, p0

    move/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getSegmentStartTimeUs(I)J

    move-result-wide v12

    .line 324
    .local v12, "startTimeUs":J
    move-object/from16 v0, p0

    move/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getSegmentUrl(I)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v27

    .line 325
    .local v27, "segmentUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->baseUrl:Ljava/lang/String;

    move-object/from16 v22, v0

    .line 326
    .local v22, "baseUrl":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->extractorWrapper:Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;

    if-nez v5, :cond_0

    .line 327
    move-object/from16 v0, p0

    move/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getSegmentEndTimeUs(I)J

    move-result-wide v14

    .line 328
    .local v14, "endTimeUs":J
    new-instance v4, Lcom/google/android/exoplayer2/upstream/DataSpec;

    move-object/from16 v0, v27

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->resolveUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    move-object/from16 v0, v27

    iget-wide v6, v0, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->start:J

    move-object/from16 v0, v27

    iget-wide v8, v0, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->length:J

    .line 329
    invoke-virtual/range {v26 .. v26}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->getCacheKey()Ljava/lang/String;

    move-result-object v10

    invoke-direct/range {v4 .. v10}, Lcom/google/android/exoplayer2/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 330
    .local v4, "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    new-instance v6, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;

    move-object/from16 v7, p1

    move-object v8, v4

    move-object/from16 v9, p2

    move/from16 v10, p3

    move-object/from16 v11, p4

    move/from16 v16, p6

    move-object/from16 v17, p2

    invoke-direct/range {v6 .. v17}, Lcom/google/android/exoplayer2/source/chunk/SingleSampleMediaChunk;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;JJILcom/google/android/exoplayer2/Format;)V

    .line 348
    :goto_0
    return-object v6

    .line 333
    .end local v4    # "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    .end local v14    # "endTimeUs":J
    :cond_0
    const/16 v17, 0x1

    .line 334
    .local v17, "segmentCount":I
    const/16 v23, 0x1

    .local v23, "i":I
    :goto_1
    move/from16 v0, v23

    move/from16 v1, p7

    if-ge v0, v1, :cond_1

    .line 335
    add-int v5, p6, v23

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getSegmentUrl(I)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v25

    .line 336
    .local v25, "nextSegmentUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    move-object/from16 v0, v27

    move-object/from16 v1, v25

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->attemptMerge(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v24

    .line 337
    .local v24, "mergedSegmentUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    if-nez v24, :cond_2

    .line 344
    .end local v24    # "mergedSegmentUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .end local v25    # "nextSegmentUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    :cond_1
    add-int v5, p6, v17

    add-int/lit8 v5, v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getSegmentEndTimeUs(I)J

    move-result-wide v14

    .line 345
    .restart local v14    # "endTimeUs":J
    new-instance v4, Lcom/google/android/exoplayer2/upstream/DataSpec;

    move-object/from16 v0, v27

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->resolveUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    move-object/from16 v0, v27

    iget-wide v6, v0, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->start:J

    move-object/from16 v0, v27

    iget-wide v8, v0, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;->length:J

    .line 346
    invoke-virtual/range {v26 .. v26}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->getCacheKey()Ljava/lang/String;

    move-result-object v10

    invoke-direct/range {v4 .. v10}, Lcom/google/android/exoplayer2/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 347
    .restart local v4    # "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    move-object/from16 v0, v26

    iget-wide v6, v0, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->presentationTimeOffsetUs:J

    neg-long v0, v6

    move-wide/from16 v18, v0

    .line 348
    .local v18, "sampleOffsetUs":J
    new-instance v6, Lcom/google/android/exoplayer2/source/chunk/ContainerMediaChunk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->extractorWrapper:Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;

    move-object/from16 v20, v0

    move-object/from16 v7, p1

    move-object v8, v4

    move-object/from16 v9, p2

    move/from16 v10, p3

    move-object/from16 v11, p4

    move/from16 v16, p6

    move-object/from16 v21, p5

    invoke-direct/range {v6 .. v21}, Lcom/google/android/exoplayer2/source/chunk/ContainerMediaChunk;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;JJIIJLcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;Lcom/google/android/exoplayer2/Format;)V

    goto :goto_0

    .line 341
    .end local v4    # "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    .end local v14    # "endTimeUs":J
    .end local v18    # "sampleOffsetUs":J
    .restart local v24    # "mergedSegmentUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .restart local v25    # "nextSegmentUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    :cond_2
    move-object/from16 v27, v24

    .line 342
    add-int/lit8 v17, v17, 0x1

    .line 334
    add-int/lit8 v23, v23, 0x1

    goto :goto_1
.end method


# virtual methods
.method public final getNextChunk(Lcom/google/android/exoplayer2/source/chunk/MediaChunk;JLcom/google/android/exoplayer2/source/chunk/ChunkHolder;)V
    .locals 34
    .param p1, "previous"    # Lcom/google/android/exoplayer2/source/chunk/MediaChunk;
    .param p2, "playbackPositionUs"    # J
    .param p4, "out"    # Lcom/google/android/exoplayer2/source/chunk/ChunkHolder;

    .prologue
    .line 165
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v3, :cond_0

    .line 238
    :goto_0
    return-void

    .line 169
    :cond_0
    if-eqz p1, :cond_4

    move-object/from16 v0, p1

    iget-wide v4, v0, Lcom/google/android/exoplayer2/source/chunk/MediaChunk;->endTimeUs:J

    sub-long v20, v4, p2

    .line 170
    .local v20, "bufferedDurationUs":J
    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-wide/from16 v0, v20

    invoke-interface {v3, v0, v1}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->updateSelectedTrack(J)V

    .line 172
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->representationHolders:[Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    .line 173
    invoke-interface {v4}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectedIndex()I

    move-result v4

    aget-object v2, v3, v4

    .line 174
    .local v2, "representationHolder":Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;
    iget-object v0, v2, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer2/source/dash/manifest/Representation;

    move-object/from16 v33, v0

    .line 175
    .local v33, "selectedRepresentation":Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    iget-object v0, v2, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;

    move-object/from16 v32, v0

    .line 177
    .local v32, "segmentIndex":Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;
    const/4 v7, 0x0

    .line 178
    .local v7, "pendingInitializationUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    const/4 v8, 0x0

    .line 179
    .local v8, "pendingIndexUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    iget-object v14, v2, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->sampleFormat:Lcom/google/android/exoplayer2/Format;

    .line 180
    .local v14, "sampleFormat":Lcom/google/android/exoplayer2/Format;
    if-nez v14, :cond_1

    .line 181
    invoke-virtual/range {v33 .. v33}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->getInitializationUri()Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v7

    .line 183
    :cond_1
    if-nez v32, :cond_2

    .line 184
    invoke-virtual/range {v33 .. v33}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->getIndexUri()Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v8

    .line 186
    :cond_2
    if-nez v7, :cond_3

    if-eqz v8, :cond_5

    .line 188
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    .line 189
    invoke-interface {v4}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectedFormat()Lcom/google/android/exoplayer2/Format;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v5}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectionReason()I

    move-result v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    .line 190
    invoke-interface {v6}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectionData()Ljava/lang/Object;

    move-result-object v6

    .line 188
    invoke-static/range {v2 .. v8}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->newInitializationChunk(Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;)Lcom/google/android/exoplayer2/source/chunk/Chunk;

    move-result-object v3

    move-object/from16 v0, p4

    iput-object v3, v0, Lcom/google/android/exoplayer2/source/chunk/ChunkHolder;->chunk:Lcom/google/android/exoplayer2/source/chunk/Chunk;

    goto :goto_0

    .line 169
    .end local v2    # "representationHolder":Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;
    .end local v7    # "pendingInitializationUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .end local v8    # "pendingIndexUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .end local v14    # "sampleFormat":Lcom/google/android/exoplayer2/Format;
    .end local v20    # "bufferedDurationUs":J
    .end local v32    # "segmentIndex":Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;
    .end local v33    # "selectedRepresentation":Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    :cond_4
    const-wide/16 v20, 0x0

    goto :goto_1

    .line 194
    .restart local v2    # "representationHolder":Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;
    .restart local v7    # "pendingInitializationUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .restart local v8    # "pendingIndexUri":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .restart local v14    # "sampleFormat":Lcom/google/android/exoplayer2/Format;
    .restart local v20    # "bufferedDurationUs":J
    .restart local v32    # "segmentIndex":Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;
    .restart local v33    # "selectedRepresentation":Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->getNowUnixTimeUs()J

    move-result-wide v28

    .line 195
    .local v28, "nowUs":J
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getFirstSegmentNum()I

    move-result v17

    .line 196
    .local v17, "firstAvailableSegmentNum":I
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getLastSegmentNum()I

    move-result v23

    .line 197
    .local v23, "lastAvailableSegmentNum":I
    const/4 v3, -0x1

    move/from16 v0, v23

    if-ne v0, v3, :cond_b

    const/16 v22, 0x1

    .line 198
    .local v22, "indexUnbounded":Z
    :goto_2
    if-eqz v22, :cond_7

    .line 201
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    iget-wide v4, v3, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->availabilityStartTime:J

    const-wide/16 v10, 0x3e8

    mul-long/2addr v4, v10

    sub-long v26, v28, v4

    .line 202
    .local v26, "liveEdgeTimeUs":J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->periodIndex:I

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->getPeriod(I)Lcom/google/android/exoplayer2/source/dash/manifest/Period;

    move-result-object v3

    iget-wide v4, v3, Lcom/google/android/exoplayer2/source/dash/manifest/Period;->startMs:J

    const-wide/16 v10, 0x3e8

    mul-long v30, v4, v10

    .line 203
    .local v30, "periodStartUs":J
    sub-long v24, v26, v30

    .line 204
    .local v24, "liveEdgeTimeInPeriodUs":J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    iget-wide v4, v3, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->timeShiftBufferDepth:J

    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v3, v4, v10

    if-eqz v3, :cond_6

    .line 205
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    iget-wide v4, v3, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->timeShiftBufferDepth:J

    const-wide/16 v10, 0x3e8

    mul-long v18, v4, v10

    .line 206
    .local v18, "bufferDepthUs":J
    sub-long v4, v24, v18

    .line 207
    invoke-virtual {v2, v4, v5}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getSegmentNum(J)I

    move-result v3

    .line 206
    move/from16 v0, v17

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v17

    .line 211
    .end local v18    # "bufferDepthUs":J
    :cond_6
    move-wide/from16 v0, v24

    invoke-virtual {v2, v0, v1}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getSegmentNum(J)I

    move-result v3

    add-int/lit8 v23, v3, -0x1

    .line 215
    .end local v24    # "liveEdgeTimeInPeriodUs":J
    .end local v26    # "liveEdgeTimeUs":J
    .end local v30    # "periodStartUs":J
    :cond_7
    if-nez p1, :cond_c

    .line 216
    move-wide/from16 v0, p2

    invoke-virtual {v2, v0, v1}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getSegmentNum(J)I

    move-result v3

    move/from16 v0, v17

    move/from16 v1, v23

    invoke-static {v3, v0, v1}, Lcom/google/android/exoplayer2/util/Util;->constrainValue(III)I

    move-result v15

    .line 227
    .local v15, "segmentNum":I
    :cond_8
    move/from16 v0, v23

    if-gt v15, v0, :cond_9

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->missingLastSegment:Z

    if-eqz v3, :cond_e

    move/from16 v0, v23

    if-lt v15, v0, :cond_e

    .line 230
    :cond_9
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    iget-boolean v3, v3, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->dynamic:Z

    if-eqz v3, :cond_a

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->periodIndex:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    invoke-virtual {v4}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->getPeriodCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_d

    :cond_a
    const/4 v3, 0x1

    :goto_3
    move-object/from16 v0, p4

    iput-boolean v3, v0, Lcom/google/android/exoplayer2/source/chunk/ChunkHolder;->endOfStream:Z

    goto/16 :goto_0

    .line 197
    .end local v15    # "segmentNum":I
    .end local v22    # "indexUnbounded":Z
    :cond_b
    const/16 v22, 0x0

    goto/16 :goto_2

    .line 219
    .restart local v22    # "indexUnbounded":Z
    :cond_c
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/source/chunk/MediaChunk;->getNextChunkIndex()I

    move-result v15

    .line 220
    .restart local v15    # "segmentNum":I
    move/from16 v0, v17

    if-ge v15, v0, :cond_8

    .line 222
    new-instance v3, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;

    invoke-direct {v3}, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->fatalError:Ljava/io/IOException;

    goto/16 :goto_0

    .line 230
    :cond_d
    const/4 v3, 0x0

    goto :goto_3

    .line 234
    :cond_e
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->maxSegmentsPerLoad:I

    sub-int v4, v23, v15

    add-int/lit8 v4, v4, 0x1

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v16

    .line 235
    .local v16, "maxSegmentCount":I
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v3}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectedFormat()Lcom/google/android/exoplayer2/Format;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    .line 236
    invoke-interface {v3}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectionReason()I

    move-result v12

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v3}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectionData()Ljava/lang/Object;

    move-result-object v13

    move-object v9, v2

    .line 235
    invoke-static/range {v9 .. v16}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->newMediaChunk(Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;Lcom/google/android/exoplayer2/Format;II)Lcom/google/android/exoplayer2/source/chunk/Chunk;

    move-result-object v3

    move-object/from16 v0, p4

    iput-object v3, v0, Lcom/google/android/exoplayer2/source/chunk/ChunkHolder;->chunk:Lcom/google/android/exoplayer2/source/chunk/Chunk;

    goto/16 :goto_0
.end method

.method public getPreferredQueueSize(JLjava/util/List;)I
    .locals 3
    .param p1, "playbackPositionUs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/exoplayer2/source/chunk/MediaChunk;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 157
    .local p3, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer2/source/chunk/MediaChunk;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->fatalError:Ljava/io/IOException;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->length()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_1

    .line 158
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    .line 160
    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->evaluateQueueSize(JLjava/util/List;)I

    move-result v0

    goto :goto_0
.end method

.method public maybeThrowError()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->fatalError:Ljava/io/IOException;

    throw v0

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifestLoaderErrorThrower:Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;->maybeThrowError()V

    .line 153
    return-void
.end method

.method public onChunkLoadCompleted(Lcom/google/android/exoplayer2/source/chunk/Chunk;)V
    .locals 7
    .param p1, "chunk"    # Lcom/google/android/exoplayer2/source/chunk/Chunk;

    .prologue
    .line 242
    instance-of v4, p1, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;

    if-eqz v4, :cond_1

    move-object v0, p1

    .line 243
    check-cast v0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;

    .line 244
    .local v0, "initializationChunk":Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->representationHolders:[Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

    iget-object v5, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->trackFormat:Lcom/google/android/exoplayer2/Format;

    .line 245
    invoke-interface {v5, v6}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->indexOf(Lcom/google/android/exoplayer2/Format;)I

    move-result v5

    aget-object v1, v4, v5

    .line 246
    .local v1, "representationHolder":Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->getSampleFormat()Lcom/google/android/exoplayer2/Format;

    move-result-object v2

    .line 247
    .local v2, "sampleFormat":Lcom/google/android/exoplayer2/Format;
    if-eqz v2, :cond_0

    .line 248
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->setSampleFormat(Lcom/google/android/exoplayer2/Format;)V

    .line 253
    :cond_0
    iget-object v4, v1, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;

    if-nez v4, :cond_1

    .line 254
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;->getSeekMap()Lcom/google/android/exoplayer2/extractor/SeekMap;

    move-result-object v3

    .line 255
    .local v3, "seekMap":Lcom/google/android/exoplayer2/extractor/SeekMap;
    if-eqz v3, :cond_1

    .line 256
    new-instance v4, Lcom/google/android/exoplayer2/source/dash/DashWrappingSegmentIndex;

    check-cast v3, Lcom/google/android/exoplayer2/extractor/ChunkIndex;

    .end local v3    # "seekMap":Lcom/google/android/exoplayer2/extractor/SeekMap;
    invoke-direct {v4, v3}, Lcom/google/android/exoplayer2/source/dash/DashWrappingSegmentIndex;-><init>(Lcom/google/android/exoplayer2/extractor/ChunkIndex;)V

    iput-object v4, v1, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;

    .line 260
    .end local v0    # "initializationChunk":Lcom/google/android/exoplayer2/source/chunk/InitializationChunk;
    .end local v1    # "representationHolder":Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;
    .end local v2    # "sampleFormat":Lcom/google/android/exoplayer2/Format;
    :cond_1
    return-void
.end method

.method public onChunkLoadError(Lcom/google/android/exoplayer2/source/chunk/Chunk;ZLjava/lang/Exception;)Z
    .locals 6
    .param p1, "chunk"    # Lcom/google/android/exoplayer2/source/chunk/Chunk;
    .param p2, "cancelable"    # Z
    .param p3, "e"    # Ljava/lang/Exception;

    .prologue
    const/4 v3, 0x1

    .line 264
    if-nez p2, :cond_0

    .line 265
    const/4 v2, 0x0

    .line 280
    :goto_0
    return v2

    .line 268
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    iget-boolean v2, v2, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->dynamic:Z

    if-nez v2, :cond_1

    instance-of v2, p1, Lcom/google/android/exoplayer2/source/chunk/MediaChunk;

    if-eqz v2, :cond_1

    instance-of v2, p3, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    if-eqz v2, :cond_1

    move-object v2, p3

    check-cast v2, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    iget v2, v2, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;->responseCode:I

    const/16 v4, 0x194

    if-ne v2, v4, :cond_1

    .line 271
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->representationHolders:[Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    iget-object v5, p1, Lcom/google/android/exoplayer2/source/chunk/Chunk;->trackFormat:Lcom/google/android/exoplayer2/Format;

    .line 272
    invoke-interface {v4, v5}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->indexOf(Lcom/google/android/exoplayer2/Format;)I

    move-result v4

    aget-object v1, v2, v4

    .line 273
    .local v1, "representationHolder":Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->getLastSegmentNum()I

    move-result v0

    .local v0, "lastAvailableSegmentNum":I
    move-object v2, p1

    .line 274
    check-cast v2, Lcom/google/android/exoplayer2/source/chunk/MediaChunk;

    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/chunk/MediaChunk;->getNextChunkIndex()I

    move-result v2

    if-le v2, v0, :cond_1

    .line 275
    iput-boolean v3, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->missingLastSegment:Z

    move v2, v3

    .line 276
    goto :goto_0

    .line 280
    .end local v0    # "lastAvailableSegmentNum":I
    .end local v1    # "representationHolder":Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;
    :cond_1
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    iget-object v4, p1, Lcom/google/android/exoplayer2/source/chunk/Chunk;->trackFormat:Lcom/google/android/exoplayer2/Format;

    .line 281
    invoke-interface {v3, v4}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->indexOf(Lcom/google/android/exoplayer2/Format;)I

    move-result v3

    .line 280
    invoke-static {v2, v3, p3}, Lcom/google/android/exoplayer2/source/chunk/ChunkedTrackBlacklistUtil;->maybeBlacklistTrack(Lcom/google/android/exoplayer2/trackselection/TrackSelection;ILjava/lang/Exception;)Z

    move-result v2

    goto :goto_0
.end method

.method public updateManifest(Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;I)V
    .locals 8
    .param p1, "newManifest"    # Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;
    .param p2, "newPeriodIndex"    # I

    .prologue
    .line 133
    :try_start_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    .line 134
    iput p2, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->periodIndex:I

    .line 135
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->manifest:Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    iget v7, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->periodIndex:I

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;->getPeriodDurationUs(I)J

    move-result-wide v2

    .line 136
    .local v2, "periodDurationUs":J
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->getRepresentations()Ljava/util/List;

    move-result-object v5

    .line 137
    .local v5, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Representation;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->representationHolders:[Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

    array-length v6, v6

    if-ge v1, v6, :cond_0

    .line 138
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v6, v1}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getIndexInTrackGroup(I)I

    move-result v6

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;

    .line 139
    .local v4, "representation":Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->representationHolders:[Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;

    aget-object v6, v6, v1

    invoke-virtual {v6, v2, v3, v4}, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource$RepresentationHolder;->updateRepresentation(JLcom/google/android/exoplayer2/source/dash/manifest/Representation;)V
    :try_end_0
    .catch Lcom/google/android/exoplayer2/source/BehindLiveWindowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 141
    .end local v1    # "i":I
    .end local v2    # "periodDurationUs":J
    .end local v4    # "representation":Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    .end local v5    # "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Representation;>;"
    :catch_0
    move-exception v0

    .line 142
    .local v0, "e":Lcom/google/android/exoplayer2/source/BehindLiveWindowException;
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DefaultDashChunkSource;->fatalError:Ljava/io/IOException;

    .line 144
    .end local v0    # "e":Lcom/google/android/exoplayer2/source/BehindLiveWindowException;
    :cond_0
    return-void
.end method
