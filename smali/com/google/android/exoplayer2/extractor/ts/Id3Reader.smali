.class final Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;
.super Ljava/lang/Object;
.source "Id3Reader.java"

# interfaces
.implements Lcom/google/android/exoplayer2/extractor/ts/ElementaryStreamReader;


# static fields
.field private static final ID3_HEADER_SIZE:I = 0xa

.field private static final TAG:Ljava/lang/String; = "Id3Reader"


# instance fields
.field private final id3Header:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

.field private sampleBytesRead:I

.field private sampleSize:I

.field private sampleTimeUs:J

.field private writingSample:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->id3Header:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 50
    return-void
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer2/util/ParsableByteArray;)V
    .locals 9
    .param p1, "data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    const/16 v8, 0xa

    const/4 v7, 0x0

    .line 77
    iget-boolean v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->writingSample:Z

    if-nez v3, :cond_0

    .line 103
    :goto_0
    return-void

    .line 80
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v0

    .line 81
    .local v0, "bytesAvailable":I
    iget v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleBytesRead:I

    if-ge v3, v8, :cond_3

    .line 83
    iget v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleBytesRead:I

    rsub-int/lit8 v3, v3, 0xa

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 84
    .local v2, "headerBytesAvailable":I
    iget-object v3, p1, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v4

    iget-object v5, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->id3Header:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v5, v5, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    iget v6, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleBytesRead:I

    invoke-static {v3, v4, v5, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 86
    iget v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleBytesRead:I

    add-int/2addr v3, v2

    if-ne v3, v8, :cond_3

    .line 88
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->id3Header:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v3, v7}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 89
    const/16 v3, 0x49

    iget-object v4, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->id3Header:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    if-ne v3, v4, :cond_1

    const/16 v3, 0x44

    iget-object v4, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->id3Header:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    if-ne v3, v4, :cond_1

    const/16 v3, 0x33

    iget-object v4, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->id3Header:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 90
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    if-eq v3, v4, :cond_2

    .line 91
    :cond_1
    const-string/jumbo v3, "Id3Reader"

    const-string/jumbo v4, "Discarding invalid ID3 tag"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    iput-boolean v7, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->writingSample:Z

    goto :goto_0

    .line 95
    :cond_2
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->id3Header:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 96
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->id3Header:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readSynchSafeInt()I

    move-result v3

    add-int/lit8 v3, v3, 0xa

    iput v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleSize:I

    .line 100
    .end local v2    # "headerBytesAvailable":I
    :cond_3
    iget v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleSize:I

    iget v4, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleBytesRead:I

    sub-int/2addr v3, v4

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 101
    .local v1, "bytesToWrite":I
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    invoke-interface {v3, p1, v1}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 102
    iget v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleBytesRead:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleBytesRead:I

    goto :goto_0
.end method

.method public createTracks(Lcom/google/android/exoplayer2/extractor/ExtractorOutput;Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;)V
    .locals 4
    .param p1, "extractorOutput"    # Lcom/google/android/exoplayer2/extractor/ExtractorOutput;
    .param p2, "idGenerator"    # Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;

    .prologue
    const/4 v3, 0x0

    .line 59
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;->getNextId()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .line 60
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    const-string/jumbo v1, "application/id3"

    const/4 v2, -0x1

    invoke-static {v3, v1, v3, v2, v3}, Lcom/google/android/exoplayer2/Format;->createSampleFormat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/Format;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->format(Lcom/google/android/exoplayer2/Format;)V

    .line 62
    return-void
.end method

.method public packetFinished()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    .line 107
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->writingSample:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleSize:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleBytesRead:I

    iget v1, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleSize:I

    if-eq v0, v1, :cond_1

    .line 112
    :cond_0
    :goto_0
    return-void

    .line 110
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    iget-wide v2, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleTimeUs:J

    const/4 v4, 0x1

    iget v5, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleSize:I

    const/4 v7, 0x0

    invoke-interface/range {v1 .. v7}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 111
    iput-boolean v6, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->writingSample:Z

    goto :goto_0
.end method

.method public packetStarted(JZ)V
    .locals 3
    .param p1, "pesTimeUs"    # J
    .param p3, "dataAlignmentIndicator"    # Z

    .prologue
    const/4 v1, 0x0

    .line 66
    if-nez p3, :cond_0

    .line 73
    :goto_0
    return-void

    .line 69
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->writingSample:Z

    .line 70
    iput-wide p1, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleTimeUs:J

    .line 71
    iput v1, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleSize:I

    .line 72
    iput v1, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->sampleBytesRead:I

    goto :goto_0
.end method

.method public seek()V
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;->writingSample:Z

    .line 55
    return-void
.end method
