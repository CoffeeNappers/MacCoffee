.class public final Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;
.super Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;
.source "SubtitleInputBuffer.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;",
        ">;"
    }
.end annotation


# instance fields
.field public subsampleOffsetUs:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;-><init>(I)V

    .line 35
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;)I
    .locals 8
    .param p1, "other"    # Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;

    .prologue
    const-wide/16 v6, 0x0

    .line 39
    iget-wide v2, p0, Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;->timeUs:J

    iget-wide v4, p1, Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;->timeUs:J

    sub-long v0, v2, v4

    .line 40
    .local v0, "delta":J
    cmp-long v2, v0, v6

    if-nez v2, :cond_0

    .line 41
    const/4 v2, 0x0

    .line 43
    :goto_0
    return v2

    :cond_0
    cmp-long v2, v0, v6

    if-lez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, -0x1

    goto :goto_0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 24
    check-cast p1, Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;

    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;->compareTo(Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;)I

    move-result v0

    return v0
.end method
