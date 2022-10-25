.class final Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;
.super Ljava/lang/Object;
.source "SingleSampleMediaPeriod.java"

# interfaces
.implements Lcom/google/android/exoplayer2/source/SampleStream;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SampleStreamImpl"
.end annotation


# static fields
.field private static final STREAM_STATE_END_OF_STREAM:I = 0x2

.field private static final STREAM_STATE_SEND_FORMAT:I = 0x0

.field private static final STREAM_STATE_SEND_SAMPLE:I = 0x1


# instance fields
.field private streamState:I

.field final synthetic this$0:Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;


# direct methods
.method private constructor <init>(Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;)V
    .locals 0

    .prologue
    .line 183
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->this$0:Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;
    .param p2, "x1"    # Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$1;

    .prologue
    .line 183
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;-><init>(Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;)V

    return-void
.end method


# virtual methods
.method public isReady()Z
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->this$0:Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;

    iget-boolean v0, v0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;->loadingFinished:Z

    return v0
.end method

.method public maybeThrowError()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->this$0:Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;

    iget-object v0, v0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;->loader:Lcom/google/android/exoplayer2/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->maybeThrowError()V

    .line 205
    return-void
.end method

.method public readData(Lcom/google/android/exoplayer2/FormatHolder;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;)I
    .locals 7
    .param p1, "formatHolder"    # Lcom/google/android/exoplayer2/FormatHolder;
    .param p2, "buffer"    # Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;

    .prologue
    const/4 v6, 0x2

    const/4 v2, 0x0

    const/4 v3, -0x4

    const/4 v1, 0x1

    .line 209
    if-eqz p2, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->streamState:I

    if-nez v0, :cond_1

    .line 210
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->this$0:Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;

    iget-object v0, v0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;->format:Lcom/google/android/exoplayer2/Format;

    iput-object v0, p1, Lcom/google/android/exoplayer2/FormatHolder;->format:Lcom/google/android/exoplayer2/Format;

    .line 211
    iput v1, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->streamState:I

    .line 212
    const/4 v0, -0x5

    .line 227
    :goto_0
    return v0

    .line 213
    :cond_1
    iget v0, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->streamState:I

    if-ne v0, v6, :cond_2

    .line 214
    const/4 v0, 0x4

    invoke-virtual {p2, v0}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->addFlag(I)V

    move v0, v3

    .line 215
    goto :goto_0

    .line 218
    :cond_2
    iget v0, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->streamState:I

    if-ne v0, v1, :cond_3

    move v0, v1

    :goto_1
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 219
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->this$0:Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;

    iget-boolean v0, v0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;->loadingFinished:Z

    if-nez v0, :cond_4

    .line 220
    const/4 v0, -0x3

    goto :goto_0

    :cond_3
    move v0, v2

    .line 218
    goto :goto_1

    .line 222
    :cond_4
    const-wide/16 v4, 0x0

    iput-wide v4, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->timeUs:J

    .line 223
    invoke-virtual {p2, v1}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->addFlag(I)V

    .line 224
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->this$0:Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;

    iget v0, v0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;->sampleSize:I

    invoke-virtual {p2, v0}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->ensureSpaceForWrite(I)V

    .line 225
    iget-object v0, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->data:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->this$0:Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;

    iget-object v1, v1, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;->sampleData:[B

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->this$0:Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;

    iget v4, v4, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod;->sampleSize:I

    invoke-virtual {v0, v1, v2, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 226
    iput v6, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->streamState:I

    move v0, v3

    .line 227
    goto :goto_0
.end method

.method public seekToUs(J)V
    .locals 2
    .param p1, "positionUs"    # J

    .prologue
    .line 192
    iget v0, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->streamState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 193
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer2/source/SingleSampleMediaPeriod$SampleStreamImpl;->streamState:I

    .line 195
    :cond_0
    return-void
.end method

.method public skipToKeyframeBefore(J)V
    .locals 0
    .param p1, "timeUs"    # J

    .prologue
    .line 234
    return-void
.end method
