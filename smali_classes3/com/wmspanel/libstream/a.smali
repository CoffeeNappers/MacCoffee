.class abstract Lcom/wmspanel/libstream/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "BaseConnection"

.field static final i:I = 0x5000


# instance fields
.field private a:Ljava/nio/channels/SocketChannel;

.field protected b:Lcom/wmspanel/libstream/Streamer$MODE;

.field protected c:Lcom/wmspanel/libstream/d;

.field protected d:I

.field protected e:Ljava/lang/String;

.field protected f:I

.field protected g:J

.field protected h:J

.field private j:Ljava/nio/ByteBuffer;

.field private k:Ljava/nio/ByteBuffer;

.field protected l:I

.field protected m:J

.field protected n:J

.field protected o:J

.field protected p:J

.field protected q:J

.field protected r:J


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$MODE;Ljava/lang/String;I)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 28
    const/16 v6, 0x5000

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/wmspanel/libstream/a;-><init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$MODE;Ljava/lang/String;II)V

    .line 29
    return-void
.end method

.method constructor <init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$MODE;Ljava/lang/String;II)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const-wide/16 v0, 0x0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    iput v2, p0, Lcom/wmspanel/libstream/a;->l:I

    .line 268
    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->m:J

    .line 269
    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->n:J

    .line 270
    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->o:J

    .line 271
    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->p:J

    .line 272
    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->q:J

    .line 273
    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->r:J

    .line 32
    iput-object p1, p0, Lcom/wmspanel/libstream/a;->c:Lcom/wmspanel/libstream/d;

    .line 33
    iput p2, p0, Lcom/wmspanel/libstream/a;->d:I

    .line 34
    iput-object p3, p0, Lcom/wmspanel/libstream/a;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    .line 35
    iput-object p4, p0, Lcom/wmspanel/libstream/a;->e:Ljava/lang/String;

    .line 36
    iput p5, p0, Lcom/wmspanel/libstream/a;->f:I

    .line 38
    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->g:J

    .line 39
    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->h:J

    .line 41
    const/16 v0, 0x1000

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/a;->k:Ljava/nio/ByteBuffer;

    .line 42
    add-int/lit16 v0, p6, 0x400

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    .line 44
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 47
    invoke-static {}, Ljava/nio/channels/SocketChannel;->open()Ljava/nio/channels/SocketChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    .line 48
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v2}, Ljava/nio/channels/SocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 49
    return-void
.end method

.method private a(I)V
    .locals 2

    .prologue
    .line 202
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    if-nez v0, :cond_0

    .line 212
    :goto_0
    return-void

    .line 206
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    iget-object v1, p0, Lcom/wmspanel/libstream/a;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->w()Ljava/nio/channels/Selector;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/channels/SocketChannel;->keyFor(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;

    move-result-object v0

    .line 207
    if-nez v0, :cond_1

    .line 208
    invoke-virtual {p0}, Lcom/wmspanel/libstream/a;->close()V

    goto :goto_0

    .line 211
    :cond_1
    invoke-virtual {v0, p1}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    goto :goto_0
.end method

.method private a(Ljava/nio/ByteBuffer;I)V
    .locals 4

    .prologue
    .line 147
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    if-gt v0, p2, :cond_0

    .line 148
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 159
    :goto_0
    return-void

    .line 152
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    sub-int v2, v0, p2

    .line 154
    const/4 v0, 0x0

    .line 155
    :goto_1
    if-ge p2, v2, :cond_1

    .line 156
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v3

    invoke-virtual {p1, v0, v3}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 155
    add-int/lit8 p2, p2, 0x1

    move v0, v1

    goto :goto_1

    .line 158
    :cond_1
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_0
.end method

.method private f()V
    .locals 4

    .prologue
    .line 219
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    iget-object v1, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/channels/SocketChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 220
    if-lez v0, :cond_0

    .line 221
    const/4 v1, 0x0

    iput v1, p0, Lcom/wmspanel/libstream/a;->l:I

    .line 222
    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->g:J

    int-to-long v0, v0

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->g:J

    .line 225
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_1

    .line 226
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/a;->a(I)V

    .line 228
    invoke-virtual {p0}, Lcom/wmspanel/libstream/a;->d()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    :cond_1
    :goto_0
    return-void

    .line 231
    :catch_0
    move-exception v0

    .line 232
    const-string/jumbo v1, "BaseConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    invoke-virtual {p0}, Lcom/wmspanel/libstream/a;->close()V

    goto :goto_0
.end method


# virtual methods
.method abstract a(Ljava/nio/ByteBuffer;)I
.end method

.method a()Lcom/wmspanel/libstream/Streamer$MODE;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    return-object v0
.end method

.method a(Lcom/wmspanel/libstream/BufferItem;)V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 276
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->n()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->q:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 278
    iput-wide v4, p0, Lcom/wmspanel/libstream/a;->q:J

    .line 280
    :cond_0
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->n()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->q:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    .line 281
    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->m:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    cmp-long v2, v0, v4

    if-eqz v2, :cond_1

    .line 282
    const-string/jumbo v2, "BaseConnection"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "audio frames lost "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->n:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->n:J

    .line 285
    :cond_1
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->n()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->q:J

    .line 286
    return-void
.end method

.method a(Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V
    .locals 2

    .prologue
    .line 318
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->c:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 322
    :goto_0
    return-void

    .line 321
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->c:Lcom/wmspanel/libstream/d;

    iget v1, p0, Lcom/wmspanel/libstream/a;->d:I

    invoke-virtual {v0, v1, p1, p2}, Lcom/wmspanel/libstream/d;->a(ILcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V

    goto :goto_0
.end method

.method public a(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    const-string/jumbo v0, "US-ASCII"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 77
    const/4 v1, 0x0

    array-length v2, v0

    invoke-virtual {p0, v0, v1, v2}, Lcom/wmspanel/libstream/a;->send([BII)V

    .line 78
    return-void
.end method

.method public a(Ljava/nio/channels/SelectionKey;)V
    .locals 4

    .prologue
    .line 162
    if-nez p1, :cond_1

    .line 199
    :cond_0
    :goto_0
    return-void

    .line 168
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->isConnectable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 169
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->finishConnect()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 170
    const/4 v0, 0x0

    iput v0, p0, Lcom/wmspanel/libstream/a;->l:I

    .line 171
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/a;->a(I)V

    .line 172
    invoke-virtual {p0}, Lcom/wmspanel/libstream/a;->c()V

    .line 176
    :cond_2
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->isReadable()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 177
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    iget-object v1, p0, Lcom/wmspanel/libstream/a;->k:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/channels/SocketChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 178
    if-gtz v0, :cond_3

    .line 179
    invoke-virtual {p0}, Lcom/wmspanel/libstream/a;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 195
    :catch_0
    move-exception v0

    .line 196
    const-string/jumbo v1, "BaseConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    invoke-virtual {p0}, Lcom/wmspanel/libstream/a;->close()V

    goto :goto_0

    .line 183
    :cond_3
    const/4 v1, 0x0

    :try_start_1
    iput v1, p0, Lcom/wmspanel/libstream/a;->l:I

    .line 184
    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->h:J

    int-to-long v0, v0

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->h:J

    .line 186
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->k:Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/a;->a(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 187
    iget-object v1, p0, Lcom/wmspanel/libstream/a;->k:Ljava/nio/ByteBuffer;

    invoke-direct {p0, v1, v0}, Lcom/wmspanel/libstream/a;->a(Ljava/nio/ByteBuffer;I)V

    .line 190
    :cond_4
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->isWritable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    invoke-direct {p0}, Lcom/wmspanel/libstream/a;->f()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public a([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/wmspanel/libstream/a;->send([BII)V

    .line 82
    return-void
.end method

.method public append([BII)V
    .locals 1
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    .line 121
    invoke-virtual {p0}, Lcom/wmspanel/libstream/a;->close()V

    .line 128
    :goto_0
    return-void

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    .line 126
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 127
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    goto :goto_0
.end method

.method public b()I
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    .line 109
    const/4 v0, 0x0

    .line 111
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    goto :goto_0
.end method

.method b(Lcom/wmspanel/libstream/BufferItem;)V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 289
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->n()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->r:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 291
    iput-wide v4, p0, Lcom/wmspanel/libstream/a;->r:J

    .line 293
    :cond_0
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->n()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->r:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    .line 294
    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->o:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    cmp-long v2, v0, v4

    if-eqz v2, :cond_1

    .line 295
    const-string/jumbo v2, "BaseConnection"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "video frames lost "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->p:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->p:J

    .line 298
    :cond_1
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->n()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->r:J

    .line 299
    return-void
.end method

.method public b([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/wmspanel/libstream/a;->append([BII)V

    .line 116
    return-void
.end method

.method abstract c()V
.end method

.method protected declared-synchronized close()V
    .locals 2

    .prologue
    .line 238
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 254
    :goto_0
    monitor-exit p0

    return-void

    .line 243
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->close()V

    .line 245
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    iget-object v1, p0, Lcom/wmspanel/libstream/a;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->w()Ljava/nio/channels/Selector;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/channels/SocketChannel;->keyFor(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;

    move-result-object v0

    .line 246
    if-eqz v0, :cond_1

    .line 247
    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 250
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 251
    :catch_0
    move-exception v0

    .line 252
    :try_start_2
    const-string/jumbo v1, "BaseConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 238
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method connect()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    const-string/jumbo v0, "BaseConnection"

    const-string/jumbo v1, "Connect"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    :try_start_0
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->INITIALIZED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->SUCCESS:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/a;->a(Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V

    .line 62
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    iget-object v1, p0, Lcom/wmspanel/libstream/a;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->w()Ljava/nio/channels/Selector;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2, p0}, Ljava/nio/channels/SocketChannel;->register(Ljava/nio/channels/Selector;ILjava/lang/Object;)Ljava/nio/channels/SelectionKey;

    .line 64
    new-instance v0, Ljava/net/InetSocketAddress;

    iget-object v1, p0, Lcom/wmspanel/libstream/a;->e:Ljava/lang/String;

    iget v2, p0, Lcom/wmspanel/libstream/a;->f:I

    invoke-direct {v0, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 65
    iget-object v1, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1, v0}, Ljava/nio/channels/SocketChannel;->connect(Ljava/net/SocketAddress;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :goto_0
    return-void

    .line 66
    :catch_0
    move-exception v0

    .line 67
    const-string/jumbo v1, "BaseConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    invoke-virtual {p0}, Lcom/wmspanel/libstream/a;->close()V

    goto :goto_0
.end method

.method abstract d()V
.end method

.method public e()V
    .locals 2

    .prologue
    .line 138
    iget v0, p0, Lcom/wmspanel/libstream/a;->l:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/wmspanel/libstream/a;->l:I

    .line 139
    iget v0, p0, Lcom/wmspanel/libstream/a;->l:I

    const/4 v1, 0x5

    if-le v0, v1, :cond_0

    .line 140
    const-string/jumbo v0, "BaseConnection"

    const-string/jumbo v1, "inactivity timeout expired"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    :cond_0
    return-void
.end method

.method public g()J
    .locals 2

    .prologue
    .line 261
    iget-wide v0, p0, Lcom/wmspanel/libstream/a;->g:J

    return-wide v0
.end method

.method public h()J
    .locals 2

    .prologue
    .line 265
    iget-wide v0, p0, Lcom/wmspanel/libstream/a;->h:J

    return-wide v0
.end method

.method i()J
    .locals 2

    .prologue
    .line 302
    iget-wide v0, p0, Lcom/wmspanel/libstream/a;->m:J

    return-wide v0
.end method

.method j()J
    .locals 2

    .prologue
    .line 306
    iget-wide v0, p0, Lcom/wmspanel/libstream/a;->n:J

    return-wide v0
.end method

.method k()J
    .locals 2

    .prologue
    .line 310
    iget-wide v0, p0, Lcom/wmspanel/libstream/a;->o:J

    return-wide v0
.end method

.method l()J
    .locals 2

    .prologue
    .line 314
    iget-wide v0, p0, Lcom/wmspanel/libstream/a;->p:J

    return-wide v0
.end method

.method public release()V
    .locals 0

    .prologue
    .line 257
    invoke-virtual {p0}, Lcom/wmspanel/libstream/a;->close()V

    .line 258
    return-void
.end method

.method public send([BII)V
    .locals 4
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_1

    .line 88
    invoke-virtual {p0}, Lcom/wmspanel/libstream/a;->close()V

    .line 105
    :cond_0
    :goto_0
    return-void

    .line 92
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    .line 93
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 94
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 96
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->a:Ljava/nio/channels/SocketChannel;

    iget-object v1, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/channels/SocketChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 97
    if-lez v0, :cond_2

    .line 98
    const/4 v1, 0x0

    iput v1, p0, Lcom/wmspanel/libstream/a;->l:I

    .line 99
    iget-wide v2, p0, Lcom/wmspanel/libstream/a;->g:J

    int-to-long v0, v0

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/a;->g:J

    .line 102
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/a;->j:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/a;->a(I)V

    goto :goto_0
.end method
