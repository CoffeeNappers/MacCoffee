.class final Lcom/google/android/exoplayer2/extractor/ts/SeiReader;
.super Ljava/lang/Object;
.source "SeiReader.java"


# instance fields
.field private final output:Lcom/google/android/exoplayer2/extractor/TrackOutput;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/extractor/TrackOutput;)V
    .locals 7
    .param p1, "output"    # Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .prologue
    const/4 v0, 0x0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/google/android/exoplayer2/extractor/ts/SeiReader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .line 33
    const-string/jumbo v1, "application/cea-608"

    const/4 v3, -0x1

    const/4 v4, 0x0

    move-object v2, v0

    move-object v5, v0

    move-object v6, v0

    invoke-static/range {v0 .. v6}, Lcom/google/android/exoplayer2/Format;->createTextSampleFormat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/Format;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->format(Lcom/google/android/exoplayer2/Format;)V

    .line 35
    return-void
.end method


# virtual methods
.method public consume(JLcom/google/android/exoplayer2/util/ParsableByteArray;)V
    .locals 1
    .param p1, "pesTimeUs"    # J
    .param p3, "seiBuffer"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/SeiReader;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    invoke-static {p1, p2, p3, v0}, Lcom/google/android/exoplayer2/text/cea/CeaUtil;->consume(JLcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/TrackOutput;)V

    .line 39
    return-void
.end method
