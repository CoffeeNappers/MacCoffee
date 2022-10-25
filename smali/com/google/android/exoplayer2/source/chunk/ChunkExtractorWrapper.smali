.class public final Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;
.super Ljava/lang/Object;
.source "ChunkExtractorWrapper.java"

# interfaces
.implements Lcom/google/android/exoplayer2/extractor/ExtractorOutput;
.implements Lcom/google/android/exoplayer2/extractor/TrackOutput;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper$SeekMapOutput;
    }
.end annotation


# instance fields
.field public final extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

.field private extractorInitialized:Z

.field private final manifestFormat:Lcom/google/android/exoplayer2/Format;

.field private final preferManifestDrmInitData:Z

.field private final resendFormatOnInit:Z

.field private seekMapOutput:Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper$SeekMapOutput;

.field private seenTrack:Z

.field private seenTrackId:I

.field private sentFormat:Lcom/google/android/exoplayer2/Format;

.field private trackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/extractor/Extractor;Lcom/google/android/exoplayer2/Format;ZZ)V
    .locals 0
    .param p1, "extractor"    # Lcom/google/android/exoplayer2/extractor/Extractor;
    .param p2, "manifestFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p3, "preferManifestDrmInitData"    # Z
    .param p4, "resendFormatOnInit"    # Z

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    .line 77
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->manifestFormat:Lcom/google/android/exoplayer2/Format;

    .line 78
    iput-boolean p3, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->preferManifestDrmInitData:Z

    .line 79
    iput-boolean p4, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->resendFormatOnInit:Z

    .line 80
    return-void
.end method


# virtual methods
.method public endTracks()V
    .locals 1

    .prologue
    .line 115
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->seenTrack:Z

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 116
    return-void
.end method

.method public format(Lcom/google/android/exoplayer2/Format;)V
    .locals 2
    .param p1, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->manifestFormat:Lcom/google/android/exoplayer2/Format;

    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->preferManifestDrmInitData:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer2/Format;->copyWithManifestFormatInfo(Lcom/google/android/exoplayer2/Format;Z)Lcom/google/android/exoplayer2/Format;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->sentFormat:Lcom/google/android/exoplayer2/Format;

    .line 128
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->trackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->sentFormat:Lcom/google/android/exoplayer2/Format;

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->format(Lcom/google/android/exoplayer2/Format;)V

    .line 129
    return-void
.end method

.method public init(Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper$SeekMapOutput;Lcom/google/android/exoplayer2/extractor/TrackOutput;)V
    .locals 4
    .param p1, "seekMapOutput"    # Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper$SeekMapOutput;
    .param p2, "trackOutput"    # Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .prologue
    const-wide/16 v2, 0x0

    .line 90
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->seekMapOutput:Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper$SeekMapOutput;

    .line 91
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->trackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .line 92
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->extractorInitialized:Z

    if-nez v0, :cond_1

    .line 93
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    invoke-interface {v0, p0}, Lcom/google/android/exoplayer2/extractor/Extractor;->init(Lcom/google/android/exoplayer2/extractor/ExtractorOutput;)V

    .line 94
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->extractorInitialized:Z

    .line 101
    :cond_0
    :goto_0
    return-void

    .line 96
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->extractor:Lcom/google/android/exoplayer2/extractor/Extractor;

    invoke-interface {v0, v2, v3, v2, v3}, Lcom/google/android/exoplayer2/extractor/Extractor;->seek(JJ)V

    .line 97
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->resendFormatOnInit:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->sentFormat:Lcom/google/android/exoplayer2/Format;

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->sentFormat:Lcom/google/android/exoplayer2/Format;

    invoke-interface {p2, v0}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->format(Lcom/google/android/exoplayer2/Format;)V

    goto :goto_0
.end method

.method public sampleData(Lcom/google/android/exoplayer2/extractor/ExtractorInput;IZ)I
    .locals 1
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
    .line 134
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->trackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/extractor/ExtractorInput;IZ)I

    move-result v0

    return v0
.end method

.method public sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V
    .locals 1
    .param p1, "data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p2, "length"    # I

    .prologue
    .line 139
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->trackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 140
    return-void
.end method

.method public sampleMetadata(JIII[B)V
    .locals 9
    .param p1, "timeUs"    # J
    .param p3, "flags"    # I
    .param p4, "size"    # I
    .param p5, "offset"    # I
    .param p6, "encryptionKey"    # [B

    .prologue
    .line 145
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->trackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-wide v2, p1

    move v4, p3

    move v5, p4

    move v6, p5

    move-object v7, p6

    invoke-interface/range {v1 .. v7}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 146
    return-void
.end method

.method public seekMap(Lcom/google/android/exoplayer2/extractor/SeekMap;)V
    .locals 1
    .param p1, "seekMap"    # Lcom/google/android/exoplayer2/extractor/SeekMap;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->seekMapOutput:Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper$SeekMapOutput;

    invoke-interface {v0, p1}, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper$SeekMapOutput;->seekMap(Lcom/google/android/exoplayer2/extractor/SeekMap;)V

    .line 121
    return-void
.end method

.method public track(I)Lcom/google/android/exoplayer2/extractor/TrackOutput;
    .locals 2
    .param p1, "id"    # I

    .prologue
    const/4 v1, 0x1

    .line 107
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->seenTrack:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->seenTrackId:I

    if-ne v0, p1, :cond_1

    :cond_0
    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 108
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->seenTrack:Z

    .line 109
    iput p1, p0, Lcom/google/android/exoplayer2/source/chunk/ChunkExtractorWrapper;->seenTrackId:I

    .line 110
    return-object p0

    .line 107
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
