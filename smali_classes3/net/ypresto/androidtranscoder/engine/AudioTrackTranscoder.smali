.class public Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;
.super Ljava/lang/Object;
.source "AudioTrackTranscoder.java"

# interfaces
.implements Lnet/ypresto/androidtranscoder/engine/TrackTranscoder;


# static fields
.field private static final DRAIN_STATE_CONSUMED:I = 0x2

.field private static final DRAIN_STATE_NONE:I = 0x0

.field private static final DRAIN_STATE_SHOULD_RETRY_IMMEDIATELY:I = 0x1

.field private static final SAMPLE_TYPE:Lnet/ypresto/androidtranscoder/engine/QueuedMuxer$SampleType;


# instance fields
.field private mActualOutputFormat:Landroid/media/MediaFormat;

.field private mAudioChannel:Lnet/ypresto/androidtranscoder/engine/AudioChannel;

.field private final mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mDecoder:Landroid/media/MediaCodec;

.field private mDecoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

.field private mDecoderStarted:Z

.field private mEncoder:Landroid/media/MediaCodec;

.field private mEncoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

.field private mEncoderStarted:Z

.field private final mExtractor:Landroid/media/MediaExtractor;

.field private final mInputFormat:Landroid/media/MediaFormat;

.field private mIsDecoderEOS:Z

.field private mIsEncoderEOS:Z

.field private mIsExtractorEOS:Z

.field private final mMuxer:Lnet/ypresto/androidtranscoder/engine/QueuedMuxer;

.field private final mOutputFormat:Landroid/media/MediaFormat;

.field private final mTrackIndex:I

.field private mWrittenPresentationTimeUs:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lnet/ypresto/androidtranscoder/engine/QueuedMuxer$SampleType;->AUDIO:Lnet/ypresto/androidtranscoder/engine/QueuedMuxer$SampleType;

    sput-object v0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->SAMPLE_TYPE:Lnet/ypresto/androidtranscoder/engine/QueuedMuxer$SampleType;

    return-void
.end method

.method public constructor <init>(Landroid/media/MediaExtractor;ILandroid/media/MediaFormat;Lnet/ypresto/androidtranscoder/engine/QueuedMuxer;)V
    .locals 2
    .param p1, "extractor"    # Landroid/media/MediaExtractor;
    .param p2, "trackIndex"    # I
    .param p3, "outputFormat"    # Landroid/media/MediaFormat;
    .param p4, "muxer"    # Lnet/ypresto/androidtranscoder/engine/QueuedMuxer;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 45
    iput-object p1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 46
    iput p2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mTrackIndex:I

    .line 47
    iput-object p3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mOutputFormat:Landroid/media/MediaFormat;

    .line 48
    iput-object p4, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mMuxer:Lnet/ypresto/androidtranscoder/engine/QueuedMuxer;

    .line 50
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mExtractor:Landroid/media/MediaExtractor;

    iget v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mTrackIndex:I

    invoke-virtual {v0, v1}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v0

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mInputFormat:Landroid/media/MediaFormat;

    .line 51
    return-void
.end method

.method private drainDecoder(J)I
    .locals 7
    .param p1, "timeoutUs"    # J

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 126
    iget-boolean v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mIsDecoderEOS:Z

    if-eqz v3, :cond_0

    .line 145
    :goto_0
    :pswitch_0
    return v1

    .line 128
    :cond_0
    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    iget-object v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {v3, v4, p1, p2}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    .line 129
    .local v0, "result":I
    packed-switch v0, :pswitch_data_0

    .line 138
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_2

    .line 139
    iput-boolean v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mIsDecoderEOS:Z

    .line 140
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mAudioChannel:Lnet/ypresto/androidtranscoder/engine/AudioChannel;

    const/4 v2, -0x1

    const-wide/16 v4, 0x0

    invoke-virtual {v1, v2, v4, v5}, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->drainDecoderBufferAndQueue(IJ)V

    .line 145
    :cond_1
    :goto_1
    const/4 v1, 0x2

    goto :goto_0

    .line 133
    :pswitch_1
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mAudioChannel:Lnet/ypresto/androidtranscoder/engine/AudioChannel;

    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v3

    invoke-virtual {v1, v3}, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->setActualDecodedFormat(Landroid/media/MediaFormat;)V

    :pswitch_2
    move v1, v2

    .line 135
    goto :goto_0

    .line 141
    :cond_2
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-lez v1, :cond_1

    .line 142
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mAudioChannel:Lnet/ypresto/androidtranscoder/engine/AudioChannel;

    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v2, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v1, v0, v2, v3}, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->drainDecoderBufferAndQueue(IJ)V

    goto :goto_1

    .line 129
    nop

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private drainEncoder(J)I
    .locals 9
    .param p1, "timeoutUs"    # J

    .prologue
    const/4 v7, 0x1

    const/4 v2, 0x0

    .line 149
    iget-boolean v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mIsEncoderEOS:Z

    if-eqz v1, :cond_0

    .line 183
    :goto_0
    :pswitch_0
    return v2

    .line 151
    :cond_0
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {v1, v3, p1, p2}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    .line 152
    .local v0, "result":I
    packed-switch v0, :pswitch_data_0

    .line 167
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mActualOutputFormat:Landroid/media/MediaFormat;

    if-nez v1, :cond_2

    .line 168
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "Could not determine actual output format."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 156
    :pswitch_1
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mActualOutputFormat:Landroid/media/MediaFormat;

    if-eqz v1, :cond_1

    .line 157
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "Audio output format changed twice."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 159
    :cond_1
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v1

    iput-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mActualOutputFormat:Landroid/media/MediaFormat;

    .line 160
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mMuxer:Lnet/ypresto/androidtranscoder/engine/QueuedMuxer;

    sget-object v2, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->SAMPLE_TYPE:Lnet/ypresto/androidtranscoder/engine/QueuedMuxer$SampleType;

    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mActualOutputFormat:Landroid/media/MediaFormat;

    invoke-virtual {v1, v2, v3}, Lnet/ypresto/androidtranscoder/engine/QueuedMuxer;->setOutputFormat(Lnet/ypresto/androidtranscoder/engine/QueuedMuxer$SampleType;Landroid/media/MediaFormat;)V

    move v2, v7

    .line 161
    goto :goto_0

    .line 163
    :pswitch_2
    new-instance v1, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-direct {v1, v2}, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;-><init>(Landroid/media/MediaCodec;)V

    iput-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    move v2, v7

    .line 164
    goto :goto_0

    .line 171
    :cond_2
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_3

    .line 172
    iput-boolean v7, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mIsEncoderEOS:Z

    .line 173
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const-wide/16 v4, 0x0

    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v6, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    move v3, v2

    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 175
    :cond_3
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_4

    .line 177
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    move v2, v7

    .line 178
    goto :goto_0

    .line 180
    :cond_4
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mMuxer:Lnet/ypresto/androidtranscoder/engine/QueuedMuxer;

    sget-object v3, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->SAMPLE_TYPE:Lnet/ypresto/androidtranscoder/engine/QueuedMuxer$SampleType;

    iget-object v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    invoke-virtual {v4, v0}, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    iget-object v5, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {v1, v3, v4, v5}, Lnet/ypresto/androidtranscoder/engine/QueuedMuxer;->writeSampleData(Lnet/ypresto/androidtranscoder/engine/QueuedMuxer$SampleType;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 181
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v4, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mWrittenPresentationTimeUs:J

    .line 182
    iget-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 183
    const/4 v2, 0x2

    goto/16 :goto_0

    .line 152
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private drainExtractor(J)I
    .locals 9
    .param p1, "timeoutUs"    # J

    .prologue
    const/4 v6, 0x1

    const/4 v2, 0x0

    .line 104
    iget-boolean v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mIsExtractorEOS:Z

    if-eqz v0, :cond_1

    .line 122
    :cond_0
    :goto_0
    return v2

    .line 105
    :cond_1
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->getSampleTrackIndex()I

    move-result v8

    .line 106
    .local v8, "trackIndex":I
    if-ltz v8, :cond_2

    iget v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mTrackIndex:I

    if-ne v8, v0, :cond_0

    .line 110
    :cond_2
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v1

    .line 111
    .local v1, "result":I
    if-ltz v1, :cond_0

    .line 112
    if-gez v8, :cond_3

    .line 113
    iput-boolean v6, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mIsExtractorEOS:Z

    .line 114
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    const-wide/16 v4, 0x0

    const/4 v6, 0x4

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    goto :goto_0

    .line 118
    :cond_3
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mExtractor:Landroid/media/MediaExtractor;

    iget-object v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    invoke-virtual {v4, v1}, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v0, v4, v2}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v3

    .line 119
    .local v3, "sampleSize":I
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->getSampleFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_4

    move v7, v6

    .line 120
    .local v7, "isKeyFrame":Z
    :goto_1
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    iget-object v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v4

    if-eqz v7, :cond_5

    :goto_2
    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 121
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->advance()Z

    .line 122
    const/4 v2, 0x2

    goto :goto_0

    .end local v7    # "isKeyFrame":Z
    :cond_4
    move v7, v2

    .line 119
    goto :goto_1

    .restart local v7    # "isKeyFrame":Z
    :cond_5
    move v6, v2

    .line 120
    goto :goto_2
.end method


# virtual methods
.method public getDeterminedFormat()Landroid/media/MediaFormat;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mInputFormat:Landroid/media/MediaFormat;

    return-object v0
.end method

.method public getWrittenPresentationTimeUs()J
    .locals 2

    .prologue
    .line 188
    iget-wide v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mWrittenPresentationTimeUs:J

    return-wide v0
.end method

.method public isFinished()Z
    .locals 1

    .prologue
    .line 193
    iget-boolean v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mIsEncoderEOS:Z

    return v0
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 198
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_1

    .line 199
    iget-boolean v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoderStarted:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 200
    :cond_0
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 201
    iput-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    .line 203
    :cond_1
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_3

    .line 204
    iget-boolean v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoderStarted:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 205
    :cond_2
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 206
    iput-object v1, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    .line 208
    :cond_3
    return-void
.end method

.method public setup()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 55
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mExtractor:Landroid/media/MediaExtractor;

    iget v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mTrackIndex:I

    invoke-virtual {v2, v3}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 57
    :try_start_0
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mOutputFormat:Landroid/media/MediaFormat;

    const-string/jumbo v3, "mime"

    invoke-virtual {v2, v3}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v2

    iput-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mOutputFormat:Landroid/media/MediaFormat;

    invoke-virtual {v2, v3, v4, v4, v5}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 62
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->start()V

    .line 63
    iput-boolean v5, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoderStarted:Z

    .line 64
    new-instance v2, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-direct {v2, v3}, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;-><init>(Landroid/media/MediaCodec;)V

    iput-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    .line 66
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mExtractor:Landroid/media/MediaExtractor;

    iget v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mTrackIndex:I

    invoke-virtual {v2, v3}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v1

    .line 68
    .local v1, "inputFormat":Landroid/media/MediaFormat;
    :try_start_1
    const-string/jumbo v2, "mime"

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v2

    iput-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 72
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v4, v4, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 73
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->start()V

    .line 74
    iput-boolean v5, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoderStarted:Z

    .line 75
    new-instance v2, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    invoke-direct {v2, v3}, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;-><init>(Landroid/media/MediaCodec;)V

    iput-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoderBuffers:Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;

    .line 77
    new-instance v2, Lnet/ypresto/androidtranscoder/engine/AudioChannel;

    iget-object v3, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mDecoder:Landroid/media/MediaCodec;

    iget-object v4, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mEncoder:Landroid/media/MediaCodec;

    iget-object v5, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mOutputFormat:Landroid/media/MediaFormat;

    invoke-direct {v2, v3, v4, v5}, Lnet/ypresto/androidtranscoder/engine/AudioChannel;-><init>(Landroid/media/MediaCodec;Landroid/media/MediaCodec;Landroid/media/MediaFormat;)V

    iput-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mAudioChannel:Lnet/ypresto/androidtranscoder/engine/AudioChannel;

    .line 78
    return-void

    .line 58
    .end local v1    # "inputFormat":Landroid/media/MediaFormat;
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 69
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "inputFormat":Landroid/media/MediaFormat;
    :catch_1
    move-exception v0

    .line 70
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public stepPipeline()Z
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 87
    const/4 v0, 0x0

    .line 90
    .local v0, "busy":Z
    :goto_0
    invoke-direct {p0, v4, v5}, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->drainEncoder(J)I

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 92
    :cond_0
    invoke-direct {p0, v4, v5}, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->drainDecoder(J)I

    move-result v1

    .line 93
    .local v1, "status":I
    if-eqz v1, :cond_1

    const/4 v0, 0x1

    .line 95
    :cond_1
    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 97
    :goto_1
    iget-object v2, p0, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->mAudioChannel:Lnet/ypresto/androidtranscoder/engine/AudioChannel;

    invoke-virtual {v2, v4, v5}, Lnet/ypresto/androidtranscoder/engine/AudioChannel;->feedEncoder(J)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    .line 98
    :cond_2
    :goto_2
    invoke-direct {p0, v4, v5}, Lnet/ypresto/androidtranscoder/engine/AudioTrackTranscoder;->drainExtractor(J)I

    move-result v2

    if-eqz v2, :cond_3

    const/4 v0, 0x1

    goto :goto_2

    .line 100
    :cond_3
    return v0
.end method
