.class public Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;
.super Ljava/lang/Object;
.source "OggExtractor.java"

# interfaces
.implements Lcom/google/android/exoplayer2/extractor/Extractor;


# static fields
.field public static final FACTORY:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

.field private static final MAX_VERIFICATION_BYTES:I = 0x8


# instance fields
.field private streamReader:Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor$1;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor$1;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->FACTORY:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static resetPosition(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .locals 1
    .param p0, "scratch"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    .line 106
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 107
    return-object p0
.end method


# virtual methods
.method getStreamReader()Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->streamReader:Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;

    return-object v0
.end method

.method public init(Lcom/google/android/exoplayer2/extractor/ExtractorOutput;)V
    .locals 2
    .param p1, "output"    # Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    .prologue
    .line 78
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-result-object v0

    .line 79
    .local v0, "trackOutput":Lcom/google/android/exoplayer2/extractor/TrackOutput;
    invoke-interface {p1}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->endTracks()V

    .line 81
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->streamReader:Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;

    invoke-virtual {v1, p1, v0}, Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;->init(Lcom/google/android/exoplayer2/extractor/ExtractorOutput;Lcom/google/android/exoplayer2/extractor/TrackOutput;)V

    .line 82
    return-void
.end method

.method public read(Lcom/google/android/exoplayer2/extractor/ExtractorInput;Lcom/google/android/exoplayer2/extractor/PositionHolder;)I
    .locals 1
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .param p2, "seekPosition"    # Lcom/google/android/exoplayer2/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->streamReader:Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;->read(Lcom/google/android/exoplayer2/extractor/ExtractorInput;Lcom/google/android/exoplayer2/extractor/PositionHolder;)I

    move-result v0

    return v0
.end method

.method public release()V
    .locals 0

    .prologue
    .line 92
    return-void
.end method

.method public seek(JJ)V
    .locals 1
    .param p1, "position"    # J
    .param p3, "timeUs"    # J

    .prologue
    .line 86
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->streamReader:Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;->seek(JJ)V

    .line 87
    return-void
.end method

.method public sniff(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)Z
    .locals 8
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 52
    :try_start_0
    new-instance v1, Lcom/google/android/exoplayer2/extractor/ogg/OggPageHeader;

    invoke-direct {v1}, Lcom/google/android/exoplayer2/extractor/ogg/OggPageHeader;-><init>()V

    .line 53
    .local v1, "header":Lcom/google/android/exoplayer2/extractor/ogg/OggPageHeader;
    const/4 v6, 0x1

    invoke-virtual {v1, p1, v6}, Lcom/google/android/exoplayer2/extractor/ogg/OggPageHeader;->populate(Lcom/google/android/exoplayer2/extractor/ExtractorInput;Z)Z

    move-result v6

    if-eqz v6, :cond_0

    iget v6, v1, Lcom/google/android/exoplayer2/extractor/ogg/OggPageHeader;->type:I

    and-int/lit8 v6, v6, 0x2

    const/4 v7, 0x2

    if-eq v6, v7, :cond_1

    .line 72
    .end local v1    # "header":Lcom/google/android/exoplayer2/extractor/ogg/OggPageHeader;
    :cond_0
    :goto_0
    return v4

    .line 57
    .restart local v1    # "header":Lcom/google/android/exoplayer2/extractor/ogg/OggPageHeader;
    :cond_1
    iget v6, v1, Lcom/google/android/exoplayer2/extractor/ogg/OggPageHeader;->bodySize:I

    const/16 v7, 0x8

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 58
    .local v2, "length":I
    new-instance v3, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-direct {v3, v2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>(I)V

    .line 59
    .local v3, "scratch":Lcom/google/android/exoplayer2/util/ParsableByteArray;
    iget-object v6, v3, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/4 v7, 0x0

    invoke-interface {p1, v6, v7, v2}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->peekFully([BII)V

    .line 61
    invoke-static {v3}, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->resetPosition(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/exoplayer2/extractor/ogg/FlacReader;->verifyBitstreamType(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 62
    new-instance v6, Lcom/google/android/exoplayer2/extractor/ogg/FlacReader;

    invoke-direct {v6}, Lcom/google/android/exoplayer2/extractor/ogg/FlacReader;-><init>()V

    iput-object v6, p0, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->streamReader:Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;

    :goto_1
    move v4, v5

    .line 70
    goto :goto_0

    .line 63
    :cond_2
    invoke-static {v3}, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->resetPosition(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/exoplayer2/extractor/ogg/VorbisReader;->verifyBitstreamType(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 64
    new-instance v6, Lcom/google/android/exoplayer2/extractor/ogg/VorbisReader;

    invoke-direct {v6}, Lcom/google/android/exoplayer2/extractor/ogg/VorbisReader;-><init>()V

    iput-object v6, p0, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->streamReader:Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;

    goto :goto_1

    .line 71
    .end local v1    # "header":Lcom/google/android/exoplayer2/extractor/ogg/OggPageHeader;
    .end local v2    # "length":I
    .end local v3    # "scratch":Lcom/google/android/exoplayer2/util/ParsableByteArray;
    :catch_0
    move-exception v0

    .line 72
    .local v0, "e":Lcom/google/android/exoplayer2/ParserException;
    goto :goto_0

    .line 65
    .end local v0    # "e":Lcom/google/android/exoplayer2/ParserException;
    .restart local v1    # "header":Lcom/google/android/exoplayer2/extractor/ogg/OggPageHeader;
    .restart local v2    # "length":I
    .restart local v3    # "scratch":Lcom/google/android/exoplayer2/util/ParsableByteArray;
    :cond_3
    invoke-static {v3}, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->resetPosition(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/exoplayer2/extractor/ogg/OpusReader;->verifyBitstreamType(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 66
    new-instance v6, Lcom/google/android/exoplayer2/extractor/ogg/OpusReader;

    invoke-direct {v6}, Lcom/google/android/exoplayer2/extractor/ogg/OpusReader;-><init>()V

    iput-object v6, p0, Lcom/google/android/exoplayer2/extractor/ogg/OggExtractor;->streamReader:Lcom/google/android/exoplayer2/extractor/ogg/StreamReader;
    :try_end_0
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method
