.class abstract Lcom/wmspanel/libstream/VideoListener16Base;
.super Lcom/wmspanel/libstream/VideoListener;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoListener16Base"


# instance fields
.field protected mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field protected mCamera:Landroid/hardware/Camera;

.field protected mErrorCallback:Landroid/hardware/Camera$ErrorCallback;


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 1
    .param p1, "streamBuffer"    # Lcom/wmspanel/libstream/StreamBuffer;
    .param p2, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/wmspanel/libstream/VideoListener;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 158
    new-instance v0, Lcom/wmspanel/libstream/VideoListener16Base$1;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/VideoListener16Base$1;-><init>(Lcom/wmspanel/libstream/VideoListener16Base;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mErrorCallback:Landroid/hardware/Camera$ErrorCallback;

    .line 23
    return-void
.end method


# virtual methods
.method getCameraParameters()Landroid/hardware/Camera$Parameters;
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mCamera:Landroid/hardware/Camera;

    if-nez v0, :cond_0

    .line 135
    const-string/jumbo v0, "VideoListener16Base"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const/4 v0, 0x0

    .line 138
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    goto :goto_0
.end method

.method protected getSupportedMode(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "mode"    # Ljava/lang/String;
    .param p2, "defMode"    # Ljava/lang/String;
    .param p4, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 172
    .local p3, "supportedModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 174
    if-eqz p3, :cond_6

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_6

    .line 176
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 178
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, ";"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 183
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 184
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    move-object v1, p1

    .line 189
    :cond_2
    if-nez v1, :cond_5

    .line 190
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 191
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 198
    .end local p2    # "defMode":Ljava/lang/String;
    :goto_1
    if-eqz p2, :cond_4

    .line 202
    :cond_4
    return-object p2

    .restart local p2    # "defMode":Ljava/lang/String;
    :cond_5
    move-object p2, v1

    goto :goto_1

    :cond_6
    move-object p2, v1

    goto :goto_1
.end method

.method protected getVideoFrame()V
    .locals 8

    .prologue
    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    if-nez v0, :cond_1

    .line 29
    const-string/jumbo v0, "VideoListener16Base"

    const-string/jumbo v1, "video codec is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :cond_0
    :goto_0
    return-void

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    if-nez v0, :cond_2

    .line 34
    const-string/jumbo v0, "VideoListener16Base"

    const-string/jumbo v1, "bufferInfo is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 89
    :catch_0
    move-exception v0

    .line 90
    const-string/jumbo v1, "VideoListener16Base"

    const-string/jumbo v2, "failed to get video frame from encoder"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    const-string/jumbo v1, "VideoListener16Base"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 40
    :cond_2
    :goto_1
    :try_start_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v1

    .line 41
    const/4 v0, -0x2

    if-ne v0, v1, :cond_3

    .line 42
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16Base;->processOutputFormatChanged(Landroid/media/MediaFormat;)V

    .line 44
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16Base;->addVideoTrack(Landroid/media/MediaFormat;)V

    goto :goto_1

    .line 46
    :cond_3
    if-ltz v1, :cond_0

    .line 50
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    aget-object v2, v0, v1

    .line 52
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 53
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v0, v3

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 55
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 58
    sget-object v3, Lcom/wmspanel/libstream/VideoListener16Base;->NAL_SEPARATOR:[B

    invoke-static {v2, v3}, Lcom/wmspanel/libstream/o;->b(Ljava/nio/ByteBuffer;[B)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 59
    sget-object v3, Lcom/wmspanel/libstream/VideoListener16Base;->NAL_SEPARATOR:[B

    array-length v3, v3

    sub-int/2addr v0, v3

    .line 62
    :cond_4
    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v3, v3, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_6

    .line 64
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamBuffer;->ac()Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    move-result-object v0

    if-nez v0, :cond_5

    .line 65
    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/VideoListener16Base;->processCodecConfig(Ljava/nio/ByteBuffer;)V

    .line 87
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    goto :goto_1

    .line 70
    :cond_6
    iget-wide v4, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mFrameId:J

    const-wide/16 v6, 0x1

    add-long/2addr v6, v4

    iput-wide v6, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mFrameId:J

    invoke-static {v4, v5, v0}, Lcom/wmspanel/libstream/BufferItem;->b(JI)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v3

    .line 72
    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v4, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v3, v4, v5}, Lcom/wmspanel/libstream/BufferItem;->setTimestamp(J)V

    .line 73
    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-virtual {v3, v4}, Lcom/wmspanel/libstream/BufferItem;->setFlags(I)V

    .line 75
    invoke-virtual {v3}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 77
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    if-eqz v0, :cond_7

    .line 78
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v0, v0, [B

    .line 79
    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 80
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v5, v5, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v2, v0, v4, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 81
    invoke-virtual {v3, v0}, Lcom/wmspanel/libstream/BufferItem;->c([B)V

    .line 84
    :cond_7
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v0, v3}, Lcom/wmspanel/libstream/StreamBuffer;->i(Lcom/wmspanel/libstream/BufferItem;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method protected processCodecConfig(Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "outBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v2, 0x0

    .line 97
    new-instance v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    invoke-direct {v1}, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;-><init>()V

    .line 99
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v0, v0, [B

    iput-object v0, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    .line 100
    iput v2, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    .line 102
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v0, v0, [B

    iput-object v0, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_buf:[B

    .line 103
    iput v2, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    .line 107
    :goto_0
    sget-object v0, Lcom/wmspanel/libstream/VideoListener16Base;->NAL_SEPARATOR:[B

    invoke-static {p1, v0}, Lcom/wmspanel/libstream/o;->a(Ljava/nio/ByteBuffer;[B)I

    move-result v0

    .line 108
    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 109
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    .line 112
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    sub-int v2, v0, v2

    .line 114
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v3

    and-int/lit8 v3, v3, 0x1f

    const/4 v4, 0x7

    if-ne v3, v4, :cond_2

    .line 115
    iget-object v3, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    iget v4, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    invoke-virtual {p1, v3, v4, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 116
    iget v3, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    add-int/2addr v2, v3

    iput v2, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    .line 122
    :cond_1
    :goto_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int/2addr v2, v3

    const/4 v3, 0x4

    if-ge v2, v3, :cond_3

    .line 128
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/StreamBuffer;->a(Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;)V

    .line 129
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STARTED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16Base;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 130
    return-void

    .line 117
    :cond_2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v3

    and-int/lit8 v3, v3, 0x1f

    const/16 v4, 0x8

    if-ne v3, v4, :cond_1

    .line 118
    iget-object v3, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_buf:[B

    iget v4, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    invoke-virtual {p1, v3, v4, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 119
    iget v3, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    add-int/2addr v2, v3

    iput v2, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    goto :goto_1

    .line 126
    :cond_3
    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_0
.end method

.method protected releaseCamera()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 145
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 149
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 150
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 152
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 154
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListener16Base;->mCamera:Landroid/hardware/Camera;

    .line 156
    :cond_0
    return-void
.end method

.method protected setAntibandingMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V
    .locals 3
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p2, "mode"    # Ljava/lang/String;

    .prologue
    .line 233
    const-string/jumbo v0, "off"

    .line 236
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedAntibanding()Ljava/util/List;

    move-result-object v1

    const-string/jumbo v2, "antibanding_mode"

    .line 233
    invoke-virtual {p0, p2, v0, v1, v2}, Lcom/wmspanel/libstream/VideoListener16Base;->getSupportedMode(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 239
    if-eqz v0, :cond_0

    .line 240
    invoke-virtual {p1, v0}, Landroid/hardware/Camera$Parameters;->setAntibanding(Ljava/lang/String;)V

    .line 242
    :cond_0
    return-void
.end method

.method protected setAwbMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V
    .locals 3
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p2, "mode"    # Ljava/lang/String;

    .prologue
    .line 220
    const-string/jumbo v0, "auto"

    .line 223
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedWhiteBalance()Ljava/util/List;

    move-result-object v1

    const-string/jumbo v2, "awb_mode"

    .line 220
    invoke-virtual {p0, p2, v0, v1, v2}, Lcom/wmspanel/libstream/VideoListener16Base;->getSupportedMode(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 226
    if-eqz v0, :cond_0

    .line 227
    invoke-virtual {p1, v0}, Landroid/hardware/Camera$Parameters;->setWhiteBalance(Ljava/lang/String;)V

    .line 229
    :cond_0
    return-void
.end method

.method protected setExposureCompensation(Landroid/hardware/Camera$Parameters;I)V
    .locals 2
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p2, "value"    # I

    .prologue
    .line 245
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getMinExposureCompensation()I

    move-result v0

    .line 246
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getMaxExposureCompensation()I

    move-result v1

    .line 247
    if-ge p2, v0, :cond_0

    .end local p2    # "value":I
    .local v0, "value":I
    move p2, v0

    .line 250
    .end local v0    # "value":I
    .restart local p2    # "value":I
    :cond_0
    if-le p2, v1, :cond_1

    .end local p2    # "value":I
    .local v1, "value":I
    move p2, v1

    .line 253
    .end local v1    # "value":I
    .restart local p2    # "value":I
    :cond_1
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setExposureCompensation(I)V

    .line 254
    return-void
.end method

.method protected setFocusMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V
    .locals 3
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p2, "mode"    # Ljava/lang/String;

    .prologue
    .line 207
    const-string/jumbo v0, "continuous-video"

    .line 210
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v1

    const-string/jumbo v2, "focus_mode"

    .line 207
    invoke-virtual {p0, p2, v0, v1, v2}, Lcom/wmspanel/libstream/VideoListener16Base;->getSupportedMode(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 213
    if-eqz v0, :cond_0

    .line 214
    invoke-virtual {p1, v0}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 216
    :cond_0
    return-void
.end method
