.class Lcom/wmspanel/libstream/VideoListener16$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/VideoListener16;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListener16;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListener16;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListener16;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener16$1;->this$0:Lcom/wmspanel/libstream/VideoListener16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 8
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 208
    if-nez p1, :cond_1

    .line 209
    :try_start_0
    const-string/jumbo v0, "VideoListener16"

    const-string/jumbo v1, "data is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    :cond_0
    :goto_0
    return-void

    .line 213
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16$1;->this$0:Lcom/wmspanel/libstream/VideoListener16;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    if-nez v0, :cond_2

    .line 214
    const-string/jumbo v0, "VideoListener16"

    const-string/jumbo v1, "mMediaCodec is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 241
    :catch_0
    move-exception v0

    .line 242
    const-string/jumbo v1, "VideoListener16"

    const-string/jumbo v2, "failed to add video data into encoder buffer"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    const-string/jumbo v1, "VideoListener16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 218
    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16$1;->this$0:Lcom/wmspanel/libstream/VideoListener16;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v1

    .line 219
    if-ltz v1, :cond_0

    .line 224
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16$1;->this$0:Lcom/wmspanel/libstream/VideoListener16;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    aget-object v0, v0, v1

    .line 226
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 229
    array-length v3, p1

    .line 230
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-le v3, v2, :cond_3

    .line 231
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 234
    :cond_3
    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener16$1;->this$0:Lcom/wmspanel/libstream/VideoListener16;

    invoke-static {v2}, Lcom/wmspanel/libstream/VideoListener16;->access$000(Lcom/wmspanel/libstream/VideoListener16;)Lcom/wmspanel/libstream/c;

    move-result-object v2

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListener16$1;->this$0:Lcom/wmspanel/libstream/VideoListener16;

    iget-object v4, v4, Lcom/wmspanel/libstream/VideoListener16;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v4, v4, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    iget-object v5, p0, Lcom/wmspanel/libstream/VideoListener16$1;->this$0:Lcom/wmspanel/libstream/VideoListener16;

    iget-object v5, v5, Lcom/wmspanel/libstream/VideoListener16;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v5, v5, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    invoke-interface {v2, p1, v4, v5}, Lcom/wmspanel/libstream/c;->a([BII)[B

    move-result-object v2

    .line 235
    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4, v3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 237
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16$1;->this$0:Lcom/wmspanel/libstream/VideoListener16;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 239
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16$1;->this$0:Lcom/wmspanel/libstream/VideoListener16;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener16;->getVideoFrame()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method
