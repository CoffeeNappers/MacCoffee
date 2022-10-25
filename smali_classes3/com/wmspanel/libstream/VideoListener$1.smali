.class Lcom/wmspanel/libstream/VideoListener$1;
.super Landroid/media/MediaCodec$Callback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListener;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListener;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListener;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListener;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    invoke-direct {p0}, Landroid/media/MediaCodec$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaCodec;Landroid/media/MediaCodec$CodecException;)V
    .locals 2
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "e"    # Landroid/media/MediaCodec$CodecException;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 135
    const-string/jumbo v0, "VideoListener"

    const-string/jumbo v1, "onError"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    invoke-virtual {p2}, Landroid/media/MediaCodec$CodecException;->isTransient()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    const-string/jumbo v0, "VideoListener"

    const-string/jumbo v1, "MediaCodec resources are temporarily unavailable"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    :goto_0
    return-void

    .line 139
    :cond_0
    const-string/jumbo v0, "VideoListener"

    invoke-static {p2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ENCODER_FAIL:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 141
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->release()V

    goto :goto_0
.end method

.method public onInputBufferAvailable(Landroid/media/MediaCodec;I)V
    .locals 0
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "index"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 70
    return-void
.end method

.method public onOutputBufferAvailable(Landroid/media/MediaCodec;ILandroid/media/MediaCodec$BufferInfo;)V
    .locals 8
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "index"    # I
    .param p3, "info"    # Landroid/media/MediaCodec$BufferInfo;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 79
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 81
    iget v0, p3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 82
    iget v0, p3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget v2, p3, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v0, v2

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 84
    iget v0, p3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_2

    .line 86
    iget v0, p3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 89
    sget-object v2, Lcom/wmspanel/libstream/VideoListener;->NAL_SEPARATOR:[B

    invoke-static {v1, v2}, Lcom/wmspanel/libstream/o;->b(Ljava/nio/ByteBuffer;[B)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 90
    sget-object v2, Lcom/wmspanel/libstream/VideoListener;->NAL_SEPARATOR:[B

    array-length v2, v2

    sub-int/2addr v0, v2

    .line 93
    :cond_0
    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iget-wide v4, v2, Lcom/wmspanel/libstream/VideoListener;->mFrameId:J

    const-wide/16 v6, 0x1

    add-long/2addr v6, v4

    iput-wide v6, v2, Lcom/wmspanel/libstream/VideoListener;->mFrameId:J

    invoke-static {v4, v5, v0}, Lcom/wmspanel/libstream/BufferItem;->b(JI)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v2

    .line 95
    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iget-wide v6, p3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v4, v6, v7}, Lcom/wmspanel/libstream/VideoListener;->translatePts(J)V

    .line 97
    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iget-wide v4, v4, Lcom/wmspanel/libstream/VideoListener;->mAbsolutePtsUs:J

    iget-object v6, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iget-wide v6, v6, Lcom/wmspanel/libstream/VideoListener;->mGapPtsUs:J

    add-long/2addr v4, v6

    invoke-virtual {v2, v4, v5}, Lcom/wmspanel/libstream/BufferItem;->setTimestamp(J)V

    .line 99
    iget v4, p3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-virtual {v2, v4}, Lcom/wmspanel/libstream/BufferItem;->setFlags(I)V

    .line 101
    invoke-virtual {v2}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 103
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    if-eqz v0, :cond_1

    .line 104
    iget v0, p3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 105
    iget v0, p3, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v0, v0, [B

    .line 106
    const/4 v4, 0x0

    iget v5, p3, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v1, v0, v4, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 107
    invoke-virtual {v2, v0}, Lcom/wmspanel/libstream/BufferItem;->c([B)V

    .line 109
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v0, v2}, Lcom/wmspanel/libstream/StreamBuffer;->i(Lcom/wmspanel/libstream/BufferItem;)V

    .line 112
    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    :cond_3
    :goto_0
    return-void

    .line 114
    :catch_0
    move-exception v1

    .line 115
    const/4 v4, 0x1

    .line 116
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 117
    instance-of v2, v1, Landroid/media/MediaCodec$CodecException;

    if-eqz v2, :cond_5

    .line 118
    sget-object v2, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ENCODER_FAIL:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    move-object v0, v1

    .line 119
    check-cast v0, Landroid/media/MediaCodec$CodecException;

    invoke-virtual {v0}, Landroid/media/MediaCodec$CodecException;->isTransient()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 121
    const-string/jumbo v0, "VideoListener"

    const-string/jumbo v4, "MediaCodec resources are temporarily unavailable"

    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v2

    move v2, v3

    .line 124
    :goto_1
    if-eqz v2, :cond_3

    .line 125
    const-string/jumbo v2, "VideoListener"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v1, v0}, Lcom/wmspanel/libstream/VideoListener;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 127
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->release()V

    goto :goto_0

    :cond_4
    move-object v0, v2

    move v2, v4

    goto :goto_1

    :cond_5
    move v2, v4

    goto :goto_1
.end method

.method public onOutputFormatChanged(Landroid/media/MediaCodec;Landroid/media/MediaFormat;)V
    .locals 2
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "format"    # Landroid/media/MediaFormat;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 148
    const-string/jumbo v0, "VideoListener"

    const-string/jumbo v1, "onOutputFormatChanged"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0, p2}, Lcom/wmspanel/libstream/VideoListener;->processOutputFormatChanged(Landroid/media/MediaFormat;)V

    .line 151
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iput-object p2, v0, Lcom/wmspanel/libstream/VideoListener;->mVideoFormat:Landroid/media/MediaFormat;

    .line 152
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener$1;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoListener;->mVideoFormat:Landroid/media/MediaFormat;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->addVideoTrack(Landroid/media/MediaFormat;)V

    .line 153
    return-void
.end method
