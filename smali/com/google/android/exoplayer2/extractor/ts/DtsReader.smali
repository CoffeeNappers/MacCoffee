.class final Lcom/google/android/exoplayer2/extractor/ts/DtsReader;
.super Ljava/lang/Object;
.source "DtsReader.java"

# interfaces
.implements Lcom/google/android/exoplayer2/extractor/ts/ElementaryStreamReader;


# static fields
.field private static final HEADER_SIZE:I = 0xf

.field private static final STATE_FINDING_SYNC:I = 0x0

.field private static final STATE_READING_HEADER:I = 0x1

.field private static final STATE_READING_SAMPLE:I = 0x2

.field private static final SYNC_VALUE:I = 0x7ffe8001

.field private static final SYNC_VALUE_SIZE:I = 0x4


# instance fields
.field private bytesRead:I

.field private format:Lcom/google/android/exoplayer2/Format;

.field private final headerScratchBytes:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private final language:Ljava/lang/String;

.field private output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

.field private sampleDurationUs:J

.field private sampleSize:I

.field private state:I

.field private syncBytes:I

.field private timeUs:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 5
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/16 v1, 0xf

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->headerScratchBytes:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 65
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->headerScratchBytes:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v0, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/16 v1, 0x7f

    aput-byte v1, v0, v3

    .line 66
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->headerScratchBytes:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v0, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/4 v1, -0x2

    aput-byte v1, v0, v4

    .line 67
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->headerScratchBytes:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v0, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/4 v1, 0x2

    const/16 v2, -0x80

    aput-byte v2, v0, v1

    .line 68
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->headerScratchBytes:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v0, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/4 v1, 0x3

    aput-byte v4, v0, v1

    .line 69
    iput v3, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->state:I

    .line 70
    iput-object p1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->language:Ljava/lang/String;

    .line 71
    return-void
.end method

.method private continueRead(Lcom/google/android/exoplayer2/util/ParsableByteArray;[BI)Z
    .locals 3
    .param p1, "source"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p2, "target"    # [B
    .param p3, "targetLength"    # I

    .prologue
    .line 137
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    iget v2, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    sub-int v2, p3, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 138
    .local v0, "bytesToRead":I
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    invoke-virtual {p1, p2, v1, v0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 139
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    .line 140
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    if-ne v1, p3, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private parseHeader()V
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 166
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->headerScratchBytes:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v0, v1, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    .line 167
    .local v0, "frameData":[B
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->format:Lcom/google/android/exoplayer2/Format;

    if-nez v1, :cond_0

    .line 168
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->language:Ljava/lang/String;

    invoke-static {v0, v2, v1, v2}, Lcom/google/android/exoplayer2/audio/DtsUtil;->parseDtsFormat([BLjava/lang/String;Ljava/lang/String;Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/Format;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->format:Lcom/google/android/exoplayer2/Format;

    .line 169
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    iget-object v2, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->format:Lcom/google/android/exoplayer2/Format;

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->format(Lcom/google/android/exoplayer2/Format;)V

    .line 171
    :cond_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/audio/DtsUtil;->getDtsFrameSize([B)I

    move-result v1

    iput v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->sampleSize:I

    .line 174
    const-wide/32 v2, 0xf4240

    .line 175
    invoke-static {v0}, Lcom/google/android/exoplayer2/audio/DtsUtil;->parseDtsAudioSampleCount([B)I

    move-result v1

    int-to-long v4, v1

    mul-long/2addr v2, v4

    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->format:Lcom/google/android/exoplayer2/Format;

    iget v1, v1, Lcom/google/android/exoplayer2/Format;->sampleRate:I

    int-to-long v4, v1

    div-long/2addr v2, v4

    long-to-int v1, v2

    int-to-long v2, v1

    iput-wide v2, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->sampleDurationUs:J

    .line 176
    return-void
.end method

.method private skipToNextSync(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Z
    .locals 3
    .param p1, "pesBuffer"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    const/4 v0, 0x0

    .line 151
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    if-lez v1, :cond_1

    .line 152
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->syncBytes:I

    shl-int/lit8 v1, v1, 0x8

    iput v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->syncBytes:I

    .line 153
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->syncBytes:I

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v2

    or-int/2addr v1, v2

    iput v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->syncBytes:I

    .line 154
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->syncBytes:I

    const v2, 0x7ffe8001

    if-ne v1, v2, :cond_0

    .line 155
    iput v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->syncBytes:I

    .line 156
    const/4 v0, 0x1

    .line 159
    :cond_1
    return v0
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer2/util/ParsableByteArray;)V
    .locals 11
    .param p1, "data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    const/16 v10, 0xf

    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 92
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    if-lez v1, :cond_1

    .line 93
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->state:I

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 95
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->skipToNextSync(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 96
    const/4 v1, 0x4

    iput v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    .line 97
    iput v4, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->state:I

    goto :goto_0

    .line 101
    :pswitch_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->headerScratchBytes:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v1, v1, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    invoke-direct {p0, p1, v1, v10}, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->continueRead(Lcom/google/android/exoplayer2/util/ParsableByteArray;[BI)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 102
    invoke-direct {p0}, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->parseHeader()V

    .line 103
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->headerScratchBytes:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v1, v6}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 104
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    iget-object v2, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->headerScratchBytes:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-interface {v1, v2, v10}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 105
    const/4 v1, 0x2

    iput v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->state:I

    goto :goto_0

    .line 109
    :pswitch_2
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    iget v2, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->sampleSize:I

    iget v3, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 110
    .local v0, "bytesToRead":I
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    invoke-interface {v1, p1, v0}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 111
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    .line 112
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    iget v2, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->sampleSize:I

    if-ne v1, v2, :cond_0

    .line 113
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    iget-wide v2, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->timeUs:J

    iget v5, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->sampleSize:I

    const/4 v7, 0x0

    invoke-interface/range {v1 .. v7}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 114
    iget-wide v2, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->timeUs:J

    iget-wide v8, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->sampleDurationUs:J

    add-long/2addr v2, v8

    iput-wide v2, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->timeUs:J

    .line 115
    iput v6, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->state:I

    goto :goto_0

    .line 120
    .end local v0    # "bytesToRead":I
    :cond_1
    return-void

    .line 93
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public createTracks(Lcom/google/android/exoplayer2/extractor/ExtractorOutput;Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;)V
    .locals 1
    .param p1, "extractorOutput"    # Lcom/google/android/exoplayer2/extractor/ExtractorOutput;
    .param p2, "idGenerator"    # Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;

    .prologue
    .line 82
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;->getNextId()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .line 83
    return-void
.end method

.method public packetFinished()V
    .locals 0

    .prologue
    .line 125
    return-void
.end method

.method public packetStarted(JZ)V
    .locals 1
    .param p1, "pesTimeUs"    # J
    .param p3, "dataAlignmentIndicator"    # Z

    .prologue
    .line 87
    iput-wide p1, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->timeUs:J

    .line 88
    return-void
.end method

.method public seek()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 75
    iput v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->state:I

    .line 76
    iput v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->bytesRead:I

    .line 77
    iput v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;->syncBytes:I

    .line 78
    return-void
.end method
