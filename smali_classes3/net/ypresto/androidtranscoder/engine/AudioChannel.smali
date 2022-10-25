.class Lnet/ypresto/androidtranscoder/engine/AudioChannel;
.super Ljava/lang/Object;
.source "AudioChannel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;
    }
.end annotation


# static fields
.field public static final BUFFER_INDEX_END_OF_STREAM:I = -0x1

.field private static final BYTES_PER_SHORT:I = 0x2

.field private static final MICROSECS_PER_SEC:J = 0xf4240L


# instance fields
.field private mActualDecodedFormat:Landroid/media/MediaFormat;

.field private final mDecoder:Landroid/media/MediaCodec;

.field private final mDecoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

.field private final mEmptyBuffers:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private final mEncodeFormat:Landroid/media/MediaFormat;

.field private final mEncoder:Landroid/media/MediaCodec;

.field private final mEncoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

.field private final mFilledBuffers:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private mInputChannelCount:I

.field private mInputSampleRate:I

.field private mOutputChannelCount:I

.field private final mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

.field private mRemixer:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;


# direct methods
.method public constructor <init>(Landroid/media/MediaCodec;Landroid/media/MediaCodec;Landroid/media/MediaFormat;)V
    .locals 2
    .param p1, "decoder"    # Landroid/media/MediaCodec;
    .param p2, "encoder"    # Landroid/media/MediaCodec;
    .param p3, "encodeFormat"    # Landroid/media/MediaFormat;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEmptyBuffers:Ljava/util/Queue;

    .line 35
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mFilledBuffers:Ljava/util/Queue;

    .line 50
    new-instance v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;-><init>(Lnet/ypresto/androidtranscoder/engine/AudioChannel$1;)V

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    .line 57
    iput-object p1, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mDecoder:Landroid/media/MediaCodec;

    .line 58
    iput-object p2, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncoder:Landroid/media/MediaCodec;

    .line 59
    iput-object p3, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncodeFormat:Landroid/media/MediaFormat;

    .line 61
    new-instance v0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mDecoder:Landroid/media/MediaCodec;

    invoke-direct {v0, v1}, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;-><init>(Landroid/media/MediaCodec;)V

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mDecoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    .line 62
    new-instance v0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncoder:Landroid/media/MediaCodec;

    invoke-direct {v0, v1}, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;-><init>(Landroid/media/MediaCodec;)V

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    .line 63
    return-void
.end method

.method private drainOverflow(Ljava/nio/ShortBuffer;)J
    .locals 10
    .param p1, "outBuff"    # Ljava/nio/ShortBuffer;

    .prologue
    .line 172
    iget-object v5, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    iget-object v2, v5, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->data:Ljava/nio/ShortBuffer;

    .line 173
    .local v2, "overflowBuff":Ljava/nio/ShortBuffer;
    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->limit()I

    move-result v3

    .line 174
    .local v3, "overflowLimit":I
    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->remaining()I

    move-result v4

    .line 176
    .local v4, "overflowSize":I
    iget-object v5, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    iget-wide v6, v5, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->presentationTimeUs:J

    .line 177
    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->position()I

    move-result v5

    iget v8, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputSampleRate:I

    iget v9, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOutputChannelCount:I

    invoke-static {v5, v8, v9}, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->sampleCountToDurationUs(III)J

    move-result-wide v8

    add-long v0, v6, v8

    .line 179
    .local v0, "beginPresentationTimeUs":J
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 181
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v5

    invoke-virtual {v2, v5}, Ljava/nio/ShortBuffer;->limit(I)Ljava/nio/Buffer;

    .line 183
    invoke-virtual {p1, v2}, Ljava/nio/ShortBuffer;->put(Ljava/nio/ShortBuffer;)Ljava/nio/ShortBuffer;

    .line 185
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v5

    if-lt v4, v5, :cond_0

    .line 187
    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    .line 193
    :goto_0
    return-wide v0

    .line 190
    :cond_0
    invoke-virtual {v2, v3}, Ljava/nio/ShortBuffer;->limit(I)Ljava/nio/Buffer;

    goto :goto_0
.end method

.method private remixAndMaybeFillOverflow(Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;Ljava/nio/ShortBuffer;)J
    .locals 8
    .param p1, "input"    # Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;
    .param p2, "outBuff"    # Ljava/nio/ShortBuffer;

    .prologue
    .line 198
    iget-object v2, p1, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->data:Ljava/nio/ShortBuffer;

    .line 199
    .local v2, "inBuff":Ljava/nio/ShortBuffer;
    iget-object v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    iget-object v3, v4, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->data:Ljava/nio/ShortBuffer;

    .line 201
    .local v3, "overflowBuff":Ljava/nio/ShortBuffer;
    invoke-virtual {p2}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 204
    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 206
    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->remaining()I

    move-result v4

    invoke-virtual {p2}, Ljava/nio/ShortBuffer;->remaining()I

    move-result v5

    if-le v4, v5, :cond_0

    .line 209
    invoke-virtual {p2}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/nio/ShortBuffer;->limit(I)Ljava/nio/Buffer;

    .line 210
    iget-object v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mRemixer:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    invoke-interface {v4, v2, p2}, Lnet/ypresto/androidtranscoder/engine/AudioRemixer;->remix(Ljava/nio/ShortBuffer;Ljava/nio/ShortBuffer;)V

    .line 213
    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/nio/ShortBuffer;->limit(I)Ljava/nio/Buffer;

    .line 218
    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->position()I

    move-result v4

    iget v5, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputSampleRate:I

    iget v6, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputChannelCount:I

    invoke-static {v4, v5, v6}, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->sampleCountToDurationUs(III)J

    move-result-wide v0

    .line 219
    .local v0, "consumedDurationUs":J
    iget-object v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mRemixer:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    invoke-interface {v4, v2, v3}, Lnet/ypresto/androidtranscoder/engine/AudioRemixer;->remix(Ljava/nio/ShortBuffer;Ljava/nio/ShortBuffer;)V

    .line 222
    invoke-virtual {v3}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 223
    iget-object v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    iget-wide v6, p1, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->presentationTimeUs:J

    add-long/2addr v6, v0

    iput-wide v6, v4, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->presentationTimeUs:J

    .line 229
    .end local v0    # "consumedDurationUs":J
    :goto_0
    iget-wide v4, p1, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->presentationTimeUs:J

    return-wide v4

    .line 226
    :cond_0
    iget-object v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mRemixer:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    invoke-interface {v4, v2, p2}, Lnet/ypresto/androidtranscoder/engine/AudioRemixer;->remix(Ljava/nio/ShortBuffer;Ljava/nio/ShortBuffer;)V

    goto :goto_0
.end method

.method private static sampleCountToDurationUs(III)J
    .locals 6
    .param p0, "sampleCount"    # I
    .param p1, "sampleRate"    # I
    .param p2, "channelCount"    # I

    .prologue
    .line 168
    int-to-long v0, p0

    int-to-long v2, p1

    const-wide/32 v4, 0xf4240

    mul-long/2addr v2, v4

    div-long/2addr v0, v2

    int-to-long v2, p2

    div-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public drainDecoderBufferAndQueue(IJ)V
    .locals 6
    .param p1, "bufferIndex"    # I
    .param p2, "presentationTimeUs"    # J

    .prologue
    const/4 v2, 0x0

    .line 96
    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mActualDecodedFormat:Landroid/media/MediaFormat;

    if-nez v3, :cond_0

    .line 97
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "Buffer received before format!"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 100
    :cond_0
    const/4 v3, -0x1

    if-ne p1, v3, :cond_3

    move-object v1, v2

    .line 104
    .local v1, "data":Ljava/nio/ByteBuffer;
    :goto_0
    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEmptyBuffers:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    .line 105
    .local v0, "buffer":Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;
    if-nez v0, :cond_1

    .line 106
    new-instance v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    .end local v0    # "buffer":Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;
    invoke-direct {v0, v2}, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;-><init>(Lnet/ypresto/androidtranscoder/engine/AudioChannel$1;)V

    .line 109
    .restart local v0    # "buffer":Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;
    :cond_1
    iput p1, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->bufferIndex:I

    .line 110
    iput-wide p2, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->presentationTimeUs:J

    .line 111
    if-nez v1, :cond_4

    :goto_1
    iput-object v2, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->data:Ljava/nio/ShortBuffer;

    .line 113
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    iget-object v2, v2, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->data:Ljava/nio/ShortBuffer;

    if-nez v2, :cond_2

    .line 114
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    .line 115
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v3

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 116
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 117
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v3

    iput-object v3, v2, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->data:Ljava/nio/ShortBuffer;

    .line 118
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    iget-object v2, v2, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->data:Ljava/nio/ShortBuffer;

    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/Buffer;->flip()Ljava/nio/Buffer;

    .line 121
    :cond_2
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mFilledBuffers:Ljava/util/Queue;

    invoke-interface {v2, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 122
    return-void

    .line 100
    .end local v0    # "buffer":Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;
    .end local v1    # "data":Ljava/nio/ByteBuffer;
    :cond_3
    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mDecoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    .line 102
    invoke-virtual {v3, p1}, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    goto :goto_0

    .line 111
    .restart local v0    # "buffer":Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;
    .restart local v1    # "data":Ljava/nio/ByteBuffer;
    :cond_4
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v2

    goto :goto_1
.end method

.method public feedEncoder(J)Z
    .locals 21
    .param p1, "timeoutUs"    # J

    .prologue
    .line 125
    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    iget-object v4, v4, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->data:Ljava/nio/ShortBuffer;

    if-eqz v4, :cond_0

    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    iget-object v4, v4, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->data:Ljava/nio/ShortBuffer;

    invoke-virtual {v4}, Ljava/nio/ShortBuffer;->hasRemaining()Z

    move-result v4

    if-eqz v4, :cond_0

    const/16 v17, 0x1

    .line 126
    .local v17, "hasOverflow":Z
    :goto_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mFilledBuffers:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    if-nez v17, :cond_1

    .line 128
    const/4 v4, 0x0

    .line 162
    :goto_1
    return v4

    .line 125
    .end local v17    # "hasOverflow":Z
    :cond_0
    const/16 v17, 0x0

    goto :goto_0

    .line 131
    .restart local v17    # "hasOverflow":Z
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncoder:Landroid/media/MediaCodec;

    move-wide/from16 v0, p1

    invoke-virtual {v4, v0, v1}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v5

    .line 132
    .local v5, "encoderInBuffIndex":I
    if-gez v5, :cond_2

    .line 134
    const/4 v4, 0x0

    goto :goto_1

    .line 138
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    invoke-virtual {v4, v5}, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v19

    .line 139
    .local v19, "outBuffer":Ljava/nio/ShortBuffer;
    if-eqz v17, :cond_3

    .line 140
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->drainOverflow(Ljava/nio/ShortBuffer;)J

    move-result-wide v8

    .line 141
    .local v8, "presentationTimeUs":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncoder:Landroid/media/MediaCodec;

    const/4 v6, 0x0

    .line 142
    invoke-virtual/range {v19 .. v19}, Ljava/nio/ShortBuffer;->position()I

    move-result v7

    mul-int/lit8 v7, v7, 0x2

    const/4 v10, 0x0

    .line 141
    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 144
    const/4 v4, 0x1

    goto :goto_1

    .line 147
    .end local v8    # "presentationTimeUs":J
    :cond_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mFilledBuffers:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    .line 148
    .local v18, "inBuffer":Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;
    move-object/from16 v0, v18

    iget v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->bufferIndex:I

    const/4 v6, -0x1

    if-ne v4, v6, :cond_4

    .line 149
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncoder:Landroid/media/MediaCodec;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x4

    move v11, v5

    invoke-virtual/range {v10 .. v16}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 150
    const/4 v4, 0x0

    goto :goto_1

    .line 153
    :cond_4
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->remixAndMaybeFillOverflow(Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;Ljava/nio/ShortBuffer;)J

    move-result-wide v8

    .line 154
    .restart local v8    # "presentationTimeUs":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncoder:Landroid/media/MediaCodec;

    const/4 v6, 0x0

    .line 155
    invoke-virtual/range {v19 .. v19}, Ljava/nio/ShortBuffer;->position()I

    move-result v7

    mul-int/lit8 v7, v7, 0x2

    const/4 v10, 0x0

    .line 154
    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 157
    if-eqz v18, :cond_5

    .line 158
    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mDecoder:Landroid/media/MediaCodec;

    move-object/from16 v0, v18

    iget v6, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->bufferIndex:I

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 159
    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEmptyBuffers:Ljava/util/Queue;

    move-object/from16 v0, v18

    invoke-interface {v4, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 162
    :cond_5
    const/4 v4, 0x1

    goto/16 :goto_1
.end method

.method public setActualDecodedFormat(Landroid/media/MediaFormat;)V
    .locals 5
    .param p1, "decodedFormat"    # Landroid/media/MediaFormat;

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 66
    iput-object p1, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mActualDecodedFormat:Landroid/media/MediaFormat;

    .line 68
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mActualDecodedFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "sample-rate"

    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputSampleRate:I

    .line 69
    iget v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputSampleRate:I

    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncodeFormat:Landroid/media/MediaFormat;

    const-string/jumbo v2, "sample-rate"

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 70
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Audio sample rate conversion not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_0
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mActualDecodedFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "channel-count"

    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputChannelCount:I

    .line 74
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mEncodeFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "channel-count"

    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOutputChannelCount:I

    .line 76
    iget v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputChannelCount:I

    if-eq v0, v3, :cond_1

    iget v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputChannelCount:I

    if-eq v0, v4, :cond_1

    .line 77
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Input channel count ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputChannelCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") not supported."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_1
    iget v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOutputChannelCount:I

    if-eq v0, v3, :cond_2

    iget v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOutputChannelCount:I

    if-eq v0, v4, :cond_2

    .line 81
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Output channel count ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOutputChannelCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") not supported."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_2
    iget v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputChannelCount:I

    iget v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOutputChannelCount:I

    if-le v0, v1, :cond_3

    .line 85
    sget-object v0, Lnet/ypresto/androidtranscoder/engine/AudioRemixer;->DOWNMIX:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mRemixer:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    .line 92
    :goto_0
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOverflowBuffer:Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;

    const-wide/16 v2, 0x0

    iput-wide v2, v0, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;->presentationTimeUs:J

    .line 93
    return-void

    .line 86
    :cond_3
    iget v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mInputChannelCount:I

    iget v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mOutputChannelCount:I

    if-ge v0, v1, :cond_4

    .line 87
    sget-object v0, Lnet/ypresto/androidtranscoder/engine/AudioRemixer;->UPMIX:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mRemixer:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    goto :goto_0

    .line 89
    :cond_4
    sget-object v0, Lnet/ypresto/androidtranscoder/engine/AudioRemixer;->PASSTHROUGH:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->mRemixer:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    goto :goto_0
.end method
