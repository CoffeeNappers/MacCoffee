.class final Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;
.super Lcom/google/android/exoplayer2/source/chunk/MediaChunk;
.source "HlsMediaChunk.java"


# static fields
.field private static final AAC_FILE_EXTENSION:Ljava/lang/String; = ".aac"

.field private static final AC3_FILE_EXTENSION:Ljava/lang/String; = ".ac3"

.field private static final EC3_FILE_EXTENSION:Ljava/lang/String; = ".ec3"

.field private static final MP3_FILE_EXTENSION:Ljava/lang/String; = ".mp3"

.field private static final MP4_FILE_EXTENSION:Ljava/lang/String; = ".mp4"

.field private static final PRIV_TIMESTAMP_FRAME_OWNER:Ljava/lang/String; = "com.apple.streaming.transportStreamTimestamp"

.field private static final UID_SOURCE:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final VTT_FILE_EXTENSION:Ljava/lang/String; = ".vtt"

.field private static final WEBVTT_FILE_EXTENSION:Ljava/lang/String; = ".webvtt"


# instance fields
.field private bytesLoaded:I

.field public final discontinuitySequenceNumber:I

.field private extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

.field private extractorOutput:Lcom/google/android/exoplayer2/source/hls/HlsSampleStreamWrapper;

.field public final hlsUrl:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

.field private final id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private final id3Decoder:Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;

.field private final initDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private final initDataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

.field private initLoadCompleted:Z

.field private initSegmentBytesLoaded:I

.field private final isEncrypted:Z

.field private final isMasterTimestampSource:Z

.field private final isPackedAudio:Z

.field private final lastPathSegment:Ljava/lang/String;

.field private volatile loadCanceled:Z

.field private volatile loadCompleted:Z

.field private final needNewExtractor:Z

.field private final previousExtractor:Lcom/google/android/exoplayer2/extractor/Extractor;

.field private final shouldSpliceIn:Z

.field private final timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

.field public final uid:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->UID_SOURCE:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;ILjava/lang/Object;JJIIZLcom/google/android/exoplayer2/util/TimestampAdjuster;Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;[B[B)V
    .locals 13
    .param p1, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .param p3, "initDataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .param p4, "hlsUrl"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;
    .param p5, "trackSelectionReason"    # I
    .param p6, "trackSelectionData"    # Ljava/lang/Object;
    .param p7, "startTimeUs"    # J
    .param p9, "endTimeUs"    # J
    .param p11, "chunkIndex"    # I
    .param p12, "discontinuitySequenceNumber"    # I
    .param p13, "isMasterTimestampSource"    # Z
    .param p14, "timestampAdjuster"    # Lcom/google/android/exoplayer2/util/TimestampAdjuster;
    .param p15, "previousChunk"    # Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;
    .param p16, "encryptionKey"    # [B
    .param p17, "encryptionIv"    # [B

    .prologue
    .line 121
    move-object/from16 v0, p16

    move-object/from16 v1, p17

    invoke-static {p1, v0, v1}, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->buildDataSource(Lcom/google/android/exoplayer2/upstream/DataSource;[B[B)Lcom/google/android/exoplayer2/upstream/DataSource;

    move-result-object v3

    move-object/from16 v0, p4

    iget-object v5, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->format:Lcom/google/android/exoplayer2/Format;

    move-object v2, p0

    move-object v4, p2

    move/from16 v6, p5

    move-object/from16 v7, p6

    move-wide/from16 v8, p7

    move-wide/from16 v10, p9

    move/from16 v12, p11

    invoke-direct/range {v2 .. v12}, Lcom/google/android/exoplayer2/source/chunk/MediaChunk;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;JJI)V

    .line 123
    move-object/from16 v0, p3

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initDataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    .line 124
    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->hlsUrl:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    .line 125
    move/from16 v0, p13

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->isMasterTimestampSource:Z

    .line 126
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    .line 127
    move/from16 v0, p12

    iput v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->discontinuitySequenceNumber:I

    .line 129
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    instance-of v2, v2, Lcom/google/android/exoplayer2/source/hls/Aes128DataSource;

    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->isEncrypted:Z

    .line 130
    iget-object v2, p2, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    .line 131
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v3, ".aac"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v3, ".ac3"

    .line 132
    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v3, ".ec3"

    .line 133
    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v3, ".mp3"

    .line 134
    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    const/4 v2, 0x1

    :goto_0
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->isPackedAudio:Z

    .line 135
    if-eqz p15, :cond_5

    .line 136
    move-object/from16 v0, p15

    iget-object v2, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Decoder:Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;

    iput-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Decoder:Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;

    .line 137
    move-object/from16 v0, p15

    iget-object v2, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iput-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 138
    move-object/from16 v0, p15

    iget-object v2, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    iput-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->previousExtractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    .line 139
    move-object/from16 v0, p15

    iget-object v2, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->hlsUrl:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    move-object/from16 v0, p4

    if-eq v2, v0, :cond_3

    const/4 v2, 0x1

    :goto_1
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->shouldSpliceIn:Z

    .line 140
    move-object/from16 v0, p15

    iget v2, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->discontinuitySequenceNumber:I

    move/from16 v0, p12

    if-ne v2, v0, :cond_1

    iget-boolean v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->shouldSpliceIn:Z

    if-eqz v2, :cond_4

    :cond_1
    const/4 v2, 0x1

    :goto_2
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->needNewExtractor:Z

    .line 149
    :goto_3
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 150
    sget-object v2, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->UID_SOURCE:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    iput v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->uid:I

    .line 151
    return-void

    .line 134
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 139
    :cond_3
    const/4 v2, 0x0

    goto :goto_1

    .line 140
    :cond_4
    const/4 v2, 0x0

    goto :goto_2

    .line 143
    :cond_5
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->isPackedAudio:Z

    if-eqz v2, :cond_6

    new-instance v2, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;

    invoke-direct {v2}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;-><init>()V

    :goto_4
    iput-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Decoder:Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;

    .line 144
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->isPackedAudio:Z

    if-eqz v2, :cond_7

    new-instance v2, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/16 v3, 0xa

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>(I)V

    :goto_5
    iput-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 145
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->previousExtractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    .line 146
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->shouldSpliceIn:Z

    .line 147
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->needNewExtractor:Z

    goto :goto_3

    .line 143
    :cond_6
    const/4 v2, 0x0

    goto :goto_4

    .line 144
    :cond_7
    const/4 v2, 0x0

    goto :goto_5
.end method

.method private static buildDataSource(Lcom/google/android/exoplayer2/upstream/DataSource;[B[B)Lcom/google/android/exoplayer2/upstream/DataSource;
    .locals 1
    .param p0, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p1, "encryptionKey"    # [B
    .param p2, "encryptionIv"    # [B

    .prologue
    .line 326
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 329
    .end local p0    # "dataSource":Lcom/google/android/exoplayer2/upstream/DataSource;
    :cond_0
    :goto_0
    return-object p0

    .restart local p0    # "dataSource":Lcom/google/android/exoplayer2/upstream/DataSource;
    :cond_1
    new-instance v0, Lcom/google/android/exoplayer2/source/hls/Aes128DataSource;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/exoplayer2/source/hls/Aes128DataSource;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;[B[B)V

    move-object p0, v0

    goto :goto_0
.end method

.method private buildPackedAudioExtractor(J)Lcom/google/android/exoplayer2/extractor/Extractor;
    .locals 5
    .param p1, "startTimeUs"    # J

    .prologue
    .line 374
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v2, ".aac"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 375
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/AdtsExtractor;

    invoke-direct {v0, p1, p2}, Lcom/google/android/exoplayer2/extractor/ts/AdtsExtractor;-><init>(J)V

    .line 384
    .local v0, "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractorOutput:Lcom/google/android/exoplayer2/source/hls/HlsSampleStreamWrapper;

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/extractor/Extractor;->init(Lcom/google/android/exoplayer2/extractor/ExtractorOutput;)V

    .line 385
    return-object v0

    .line 376
    .end local v0    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v2, ".ac3"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v2, ".ec3"

    .line 377
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 378
    :cond_1
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/Ac3Extractor;

    invoke-direct {v0, p1, p2}, Lcom/google/android/exoplayer2/extractor/ts/Ac3Extractor;-><init>(J)V

    .restart local v0    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    goto :goto_0

    .line 379
    .end local v0    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :cond_2
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v2, ".mp3"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 380
    new-instance v0, Lcom/google/android/exoplayer2/extractor/mp3/Mp3Extractor;

    invoke-direct {v0, p1, p2}, Lcom/google/android/exoplayer2/extractor/mp3/Mp3Extractor;-><init>(J)V

    .restart local v0    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    goto :goto_0

    .line 382
    .end local v0    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unkown extension for audio file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private createExtractor()Lcom/google/android/exoplayer2/extractor/Extractor;
    .locals 7

    .prologue
    .line 335
    const/4 v3, 0x1

    .line 336
    .local v3, "usingNewExtractor":Z
    const-string/jumbo v4, "text/vtt"

    iget-object v5, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->hlsUrl:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    iget-object v5, v5, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->format:Lcom/google/android/exoplayer2/Format;

    iget-object v5, v5, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v5, ".webvtt"

    .line 337
    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v5, ".vtt"

    .line 338
    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 339
    :cond_0
    new-instance v2, Lcom/google/android/exoplayer2/source/hls/WebvttExtractor;

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->trackFormat:Lcom/google/android/exoplayer2/Format;

    iget-object v4, v4, Lcom/google/android/exoplayer2/Format;->language:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    invoke-direct {v2, v4, v5}, Lcom/google/android/exoplayer2/source/hls/WebvttExtractor;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/util/TimestampAdjuster;)V

    .line 366
    .local v2, "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :goto_0
    if-eqz v3, :cond_1

    .line 367
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractorOutput:Lcom/google/android/exoplayer2/source/hls/HlsSampleStreamWrapper;

    invoke-interface {v2, v4}, Lcom/google/android/exoplayer2/extractor/Extractor;->init(Lcom/google/android/exoplayer2/extractor/ExtractorOutput;)V

    .line 369
    :cond_1
    return-object v2

    .line 340
    .end local v2    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :cond_2
    iget-boolean v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->needNewExtractor:Z

    if-nez v4, :cond_3

    .line 342
    const/4 v3, 0x0

    .line 343
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->previousExtractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    .restart local v2    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    goto :goto_0

    .line 344
    .end local v2    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :cond_3
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->lastPathSegment:Ljava/lang/String;

    const-string/jumbo v5, ".mp4"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 345
    new-instance v2, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    invoke-direct {v2, v4, v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;-><init>(ILcom/google/android/exoplayer2/util/TimestampAdjuster;)V

    .restart local v2    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    goto :goto_0

    .line 350
    .end local v2    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :cond_4
    const/16 v1, 0x10

    .line 351
    .local v1, "esReaderFactoryFlags":I
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->trackFormat:Lcom/google/android/exoplayer2/Format;

    iget-object v0, v4, Lcom/google/android/exoplayer2/Format;->codecs:Ljava/lang/String;

    .line 352
    .local v0, "codecs":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 356
    const-string/jumbo v4, "audio/mp4a-latm"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/MimeTypes;->getAudioMediaMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 357
    or-int/lit8 v1, v1, 0x2

    .line 359
    :cond_5
    const-string/jumbo v4, "video/avc"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/MimeTypes;->getVideoMediaMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 360
    or-int/lit8 v1, v1, 0x4

    .line 363
    :cond_6
    new-instance v2, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    new-instance v5, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;

    invoke-direct {v5, v1}, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;-><init>(I)V

    const/4 v6, 0x1

    invoke-direct {v2, v4, v5, v6}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;-><init>(Lcom/google/android/exoplayer2/util/TimestampAdjuster;Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;Z)V

    .restart local v2    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    goto :goto_0
.end method

.method private loadMedia()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 230
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->isEncrypted:Z

    if-eqz v1, :cond_2

    .line 231
    iget-object v8, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    .line 232
    .local v8, "loadDataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    iget v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->bytesLoaded:I

    if-eqz v1, :cond_1

    move v10, v11

    .line 237
    .local v10, "skipLoadedBytes":Z
    :goto_0
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->isMasterTimestampSource:Z

    if-nez v1, :cond_0

    .line 238
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/util/TimestampAdjuster;->waitUntilInitialized()V

    .line 241
    :cond_0
    :try_start_0
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultExtractorInput;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iget-wide v2, v8, Lcom/google/android/exoplayer2/upstream/DataSpec;->absoluteStreamPosition:J

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 242
    invoke-interface {v4, v8}, Lcom/google/android/exoplayer2/upstream/DataSource;->open(Lcom/google/android/exoplayer2/upstream/DataSpec;)J

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/extractor/DefaultExtractorInput;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;JJ)V

    .line 243
    .local v0, "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    if-nez v1, :cond_4

    .line 245
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->peekId3PrivTimestamp(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)J

    move-result-wide v6

    .line 246
    .local v6, "id3Timestamp":J
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v1, v6, v2

    if-nez v1, :cond_3

    .line 247
    new-instance v1, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v2, "ID3 PRIV timestamp missing."

    invoke-direct {v1, v2}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    .end local v0    # "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .end local v6    # "id3Timestamp":J
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-static {v2}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Lcom/google/android/exoplayer2/upstream/DataSource;)V

    throw v1

    .line 232
    .end local v10    # "skipLoadedBytes":Z
    :cond_1
    const/4 v10, 0x0

    goto :goto_0

    .line 234
    .end local v8    # "loadDataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    :cond_2
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->bytesLoaded:I

    invoke-static {v1, v2}, Lcom/google/android/exoplayer2/util/Util;->getRemainderDataSpec(Lcom/google/android/exoplayer2/upstream/DataSpec;I)Lcom/google/android/exoplayer2/upstream/DataSpec;

    move-result-object v8

    .line 235
    .restart local v8    # "loadDataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    const/4 v10, 0x0

    .restart local v10    # "skipLoadedBytes":Z
    goto :goto_0

    .line 249
    .restart local v0    # "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .restart local v6    # "id3Timestamp":J
    :cond_3
    :try_start_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    invoke-virtual {v1, v6, v7}, Lcom/google/android/exoplayer2/util/TimestampAdjuster;->adjustTsTimestamp(J)J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->buildPackedAudioExtractor(J)Lcom/google/android/exoplayer2/extractor/Extractor;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    .line 251
    .end local v6    # "id3Timestamp":J
    :cond_4
    if-eqz v10, :cond_5

    .line 252
    iget v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->bytesLoaded:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->skipFully(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 255
    :cond_5
    const/4 v9, 0x0

    .line 256
    .local v9, "result":I
    :goto_1
    if-nez v9, :cond_6

    :try_start_2
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->loadCanceled:Z

    if-nez v1, :cond_6

    .line 257
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lcom/google/android/exoplayer2/extractor/Extractor;->read(Lcom/google/android/exoplayer2/extractor/ExtractorInput;Lcom/google/android/exoplayer2/extractor/PositionHolder;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result v9

    goto :goto_1

    .line 260
    :cond_6
    :try_start_3
    invoke-interface {v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-wide v4, v1, Lcom/google/android/exoplayer2/upstream/DataSpec;->absoluteStreamPosition:J

    sub-long/2addr v2, v4

    long-to-int v1, v2

    iput v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->bytesLoaded:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 263
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-static {v1}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Lcom/google/android/exoplayer2/upstream/DataSource;)V

    .line 265
    iput-boolean v11, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->loadCompleted:Z

    .line 266
    return-void

    .line 260
    :catchall_1
    move-exception v1

    :try_start_4
    invoke-interface {v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-wide v4, v4, Lcom/google/android/exoplayer2/upstream/DataSpec;->absoluteStreamPosition:J

    sub-long/2addr v2, v4

    long-to-int v2, v2

    iput v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->bytesLoaded:I

    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method private maybeLoadInitData()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 201
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->previousExtractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    if-eq v1, v2, :cond_0

    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initLoadCompleted:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initDataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    if-nez v1, :cond_1

    .line 221
    :cond_0
    :goto_0
    return-void

    .line 205
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initDataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initSegmentBytesLoaded:I

    invoke-static {v1, v2}, Lcom/google/android/exoplayer2/util/Util;->getRemainderDataSpec(Lcom/google/android/exoplayer2/upstream/DataSpec;I)Lcom/google/android/exoplayer2/upstream/DataSpec;

    move-result-object v6

    .line 207
    .local v6, "initSegmentDataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    :try_start_0
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultExtractorInput;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iget-wide v2, v6, Lcom/google/android/exoplayer2/upstream/DataSpec;->absoluteStreamPosition:J

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initDataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 208
    invoke-interface {v4, v6}, Lcom/google/android/exoplayer2/upstream/DataSource;->open(Lcom/google/android/exoplayer2/upstream/DataSpec;)J

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/extractor/DefaultExtractorInput;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 210
    .local v0, "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    const/4 v7, 0x0

    .line 211
    .local v7, "result":I
    :goto_1
    if-nez v7, :cond_2

    :try_start_1
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->loadCanceled:Z

    if-nez v1, :cond_2

    .line 212
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lcom/google/android/exoplayer2/extractor/Extractor;->read(Lcom/google/android/exoplayer2/extractor/ExtractorInput;Lcom/google/android/exoplayer2/extractor/PositionHolder;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v7

    goto :goto_1

    .line 215
    :cond_2
    :try_start_2
    invoke-interface {v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initDataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-wide v4, v1, Lcom/google/android/exoplayer2/upstream/DataSpec;->absoluteStreamPosition:J

    sub-long/2addr v2, v4

    long-to-int v1, v2

    iput v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initSegmentBytesLoaded:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 218
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-static {v1}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Lcom/google/android/exoplayer2/upstream/DataSource;)V

    .line 220
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initLoadCompleted:Z

    goto :goto_0

    .line 215
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-interface {v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initDataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-wide v4, v4, Lcom/google/android/exoplayer2/upstream/DataSpec;->absoluteStreamPosition:J

    sub-long/2addr v2, v4

    long-to-int v2, v2

    iput v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->initSegmentBytesLoaded:I

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 218
    .end local v0    # "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .end local v7    # "result":I
    :catchall_1
    move-exception v1

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-static {v2}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Lcom/google/android/exoplayer2/upstream/DataSource;)V

    throw v1
.end method

.method private peekId3PrivTimestamp(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)J
    .locals 14
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 279
    invoke-interface {p1}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->resetPeekPosition()V

    .line 280
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v9, v9, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/4 v10, 0x0

    const/16 v11, 0xa

    const/4 v12, 0x1

    invoke-interface {p1, v9, v10, v11, v12}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->peekFully([BIIZ)Z

    move-result v9

    if-nez v9, :cond_0

    .line 281
    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    .line 315
    :goto_0
    return-wide v10

    .line 283
    :cond_0
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->reset(I)V

    .line 284
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt24()I

    move-result v3

    .line 285
    .local v3, "id":I
    sget v9, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->ID3_TAG:I

    if-eq v3, v9, :cond_1

    .line 286
    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_0

    .line 288
    :cond_1
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/4 v10, 0x3

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 289
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readSynchSafeInt()I

    move-result v4

    .line 290
    .local v4, "id3Size":I
    add-int/lit8 v8, v4, 0xa

    .line 291
    .local v8, "requiredCapacity":I
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->capacity()I

    move-result v9

    if-le v8, v9, :cond_2

    .line 292
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v0, v9, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    .line 293
    .local v0, "data":[B
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v9, v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->reset(I)V

    .line 294
    const/4 v9, 0x0

    iget-object v10, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v10, v10, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/4 v11, 0x0

    const/16 v12, 0xa

    invoke-static {v0, v9, v10, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 296
    .end local v0    # "data":[B
    :cond_2
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v9, v9, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/16 v10, 0xa

    const/4 v11, 0x1

    invoke-interface {p1, v9, v10, v4, v11}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->peekFully([BIIZ)Z

    move-result v9

    if-nez v9, :cond_3

    .line 297
    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_0

    .line 299
    :cond_3
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Decoder:Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;

    iget-object v10, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v10, v10, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    invoke-virtual {v9, v10, v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decode([BI)Lcom/google/android/exoplayer2/metadata/Metadata;

    move-result-object v5

    .line 300
    .local v5, "metadata":Lcom/google/android/exoplayer2/metadata/Metadata;
    if-nez v5, :cond_4

    .line 301
    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_0

    .line 303
    :cond_4
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/metadata/Metadata;->length()I

    move-result v6

    .line 304
    .local v6, "metadataLength":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v6, :cond_6

    .line 305
    invoke-virtual {v5, v2}, Lcom/google/android/exoplayer2/metadata/Metadata;->get(I)Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    move-result-object v1

    .line 306
    .local v1, "frame":Lcom/google/android/exoplayer2/metadata/Metadata$Entry;
    instance-of v9, v1, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;

    if-eqz v9, :cond_5

    move-object v7, v1

    .line 307
    check-cast v7, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;

    .line 308
    .local v7, "privFrame":Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;
    const-string/jumbo v9, "com.apple.streaming.transportStreamTimestamp"

    iget-object v10, v7, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;->owner:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 309
    iget-object v9, v7, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;->privateData:[B

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v11, v11, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/4 v12, 0x0

    const/16 v13, 0x8

    invoke-static {v9, v10, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 310
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->reset(I)V

    .line 311
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->id3Data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readLong()J

    move-result-wide v10

    goto/16 :goto_0

    .line 304
    .end local v7    # "privFrame":Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 315
    .end local v1    # "frame":Lcom/google/android/exoplayer2/metadata/Metadata$Entry;
    :cond_6
    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    goto/16 :goto_0
.end method


# virtual methods
.method public bytesLoaded()J
    .locals 2

    .prologue
    .line 171
    iget v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->bytesLoaded:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public cancelLoad()V
    .locals 1

    .prologue
    .line 178
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->loadCanceled:Z

    .line 179
    return-void
.end method

.method public init(Lcom/google/android/exoplayer2/source/hls/HlsSampleStreamWrapper;)V
    .locals 2
    .param p1, "output"    # Lcom/google/android/exoplayer2/source/hls/HlsSampleStreamWrapper;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractorOutput:Lcom/google/android/exoplayer2/source/hls/HlsSampleStreamWrapper;

    .line 161
    iget v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->uid:I

    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->shouldSpliceIn:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer2/source/hls/HlsSampleStreamWrapper;->init(IZ)V

    .line 162
    return-void
.end method

.method public isLoadCanceled()Z
    .locals 1

    .prologue
    .line 183
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->loadCanceled:Z

    return v0
.end method

.method public isLoadCompleted()Z
    .locals 1

    .prologue
    .line 166
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->loadCompleted:Z

    return v0
.end method

.method public load()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->isPackedAudio:Z

    if-nez v0, :cond_0

    .line 190
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->createExtractor()Lcom/google/android/exoplayer2/extractor/Extractor;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    .line 192
    :cond_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->maybeLoadInitData()V

    .line 193
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->loadCanceled:Z

    if-nez v0, :cond_1

    .line 194
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->loadMedia()V

    .line 196
    :cond_1
    return-void
.end method
