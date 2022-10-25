.class Lcom/wmspanel/libstream/StreamRecorder$1;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/StreamRecorder;->startRecorderThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic dw:Lcom/wmspanel/libstream/StreamRecorder;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/StreamRecorder;)V
    .locals 0

    .prologue
    .line 146
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 150
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 152
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v0}, Lcom/wmspanel/libstream/StreamRecorder;->access$000(Lcom/wmspanel/libstream/StreamRecorder;)Landroid/media/MediaMuxer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaMuxer;->start()V

    .line 156
    const/4 v0, 0x0

    .line 157
    const-wide v8, 0x7fffffffffffffffL

    .line 159
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$100(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/Streamer$MODE;

    move-result-object v2

    sget-object v3, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v2, v3, :cond_0

    .line 160
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    sget-object v3, Lcom/wmspanel/libstream/Streamer$RECORD_STATE;->STARTED:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    invoke-static {v2, v3}, Lcom/wmspanel/libstream/StreamRecorder;->access$200(Lcom/wmspanel/libstream/StreamRecorder;Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V

    .line 164
    :cond_0
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamRecorder$1;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_6

    .line 166
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    iget-object v3, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v3}, Lcom/wmspanel/libstream/StreamRecorder;->access$500(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v3

    iget-object v4, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v4}, Lcom/wmspanel/libstream/StreamRecorder;->access$400(Lcom/wmspanel/libstream/StreamRecorder;)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/wmspanel/libstream/StreamBuffer;->d(J)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/wmspanel/libstream/StreamRecorder;->access$302(Lcom/wmspanel/libstream/StreamRecorder;Lcom/wmspanel/libstream/BufferItem;)Lcom/wmspanel/libstream/BufferItem;

    .line 167
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v2

    if-nez v2, :cond_1

    .line 169
    const-wide/16 v2, 0xc8

    invoke-static {v2, v3}, Lcom/wmspanel/libstream/StreamRecorder$1;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 207
    :catch_0
    move-exception v0

    .line 208
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 210
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v0}, Lcom/wmspanel/libstream/StreamRecorder;->access$800(Lcom/wmspanel/libstream/StreamRecorder;)V

    .line 212
    :goto_1
    return-void

    .line 173
    :cond_1
    :try_start_2
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    iget-object v3, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v3}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v3

    invoke-virtual {v3}, Lcom/wmspanel/libstream/BufferItem;->o()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    invoke-static {v2, v4, v5}, Lcom/wmspanel/libstream/StreamRecorder;->access$402(Lcom/wmspanel/libstream/StreamRecorder;J)J

    .line 175
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/wmspanel/libstream/BufferItem;->m()Lcom/wmspanel/libstream/BufferItem$a;

    move-result-object v2

    .line 177
    sget-object v3, Lcom/wmspanel/libstream/BufferItem$a;->C:Lcom/wmspanel/libstream/BufferItem$a;

    if-ne v2, v3, :cond_3

    .line 179
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$100(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/Streamer$MODE;

    move-result-object v2

    sget-object v3, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    .line 180
    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$100(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/Streamer$MODE;

    move-result-object v2

    sget-object v3, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v2, v3, :cond_5

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v2

    cmp-long v2, v2, v8

    if-lez v2, :cond_5

    .line 182
    :cond_2
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 183
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v2

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    iget-object v4, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v4}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v4

    invoke-virtual {v4}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v4

    iget-object v6, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v6}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v6

    invoke-virtual {v6}, Lcom/wmspanel/libstream/BufferItem;->getFlags()I

    move-result v6

    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 184
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$000(Lcom/wmspanel/libstream/StreamRecorder;)Landroid/media/MediaMuxer;

    move-result-object v2

    iget-object v3, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v3}, Lcom/wmspanel/libstream/StreamRecorder;->access$600(Lcom/wmspanel/libstream/StreamRecorder;)I

    move-result v3

    invoke-virtual {v2, v3, v7, v1}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    move-wide v2, v8

    :goto_2
    move-wide v8, v2

    .line 206
    goto/16 :goto_0

    .line 187
    :cond_3
    sget-object v3, Lcom/wmspanel/libstream/BufferItem$a;->B:Lcom/wmspanel/libstream/BufferItem$a;

    if-ne v2, v3, :cond_5

    .line 189
    if-nez v0, :cond_4

    .line 190
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v0}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->q()Z

    move-result v0

    .line 191
    if-eqz v0, :cond_4

    .line 192
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v8

    .line 193
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    sget-object v3, Lcom/wmspanel/libstream/Streamer$RECORD_STATE;->STARTED:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    invoke-static {v2, v3}, Lcom/wmspanel/libstream/StreamRecorder;->access$200(Lcom/wmspanel/libstream/StreamRecorder;Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V

    .line 197
    :cond_4
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$100(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/Streamer$MODE;

    move-result-object v2

    sget-object v3, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v2, v3, :cond_5

    if-eqz v0, :cond_5

    .line 198
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/wmspanel/libstream/BufferItem;->p()[B

    move-result-object v2

    if-eqz v2, :cond_0

    .line 201
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/wmspanel/libstream/BufferItem;->p()[B

    move-result-object v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 202
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v2

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    iget-object v4, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v4}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v4

    invoke-virtual {v4}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v4

    iget-object v6, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v6}, Lcom/wmspanel/libstream/StreamRecorder;->access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v6

    invoke-virtual {v6}, Lcom/wmspanel/libstream/BufferItem;->getFlags()I

    move-result v6

    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 203
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v2}, Lcom/wmspanel/libstream/StreamRecorder;->access$000(Lcom/wmspanel/libstream/StreamRecorder;)Landroid/media/MediaMuxer;

    move-result-object v2

    iget-object v3, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v3}, Lcom/wmspanel/libstream/StreamRecorder;->access$700(Lcom/wmspanel/libstream/StreamRecorder;)I

    move-result v3

    invoke-virtual {v2, v3, v7, v1}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_5
    move-wide v2, v8

    goto :goto_2

    .line 210
    :cond_6
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v0}, Lcom/wmspanel/libstream/StreamRecorder;->access$800(Lcom/wmspanel/libstream/StreamRecorder;)V

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamRecorder$1;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v1}, Lcom/wmspanel/libstream/StreamRecorder;->access$800(Lcom/wmspanel/libstream/StreamRecorder;)V

    throw v0
.end method
