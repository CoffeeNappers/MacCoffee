.class Lcom/wmspanel/libstream/i;
.super Lcom/wmspanel/libstream/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/i$a;,
        Lcom/wmspanel/libstream/i$b;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RtmpConnection"

.field static final aV:I = 0x10000

.field static final aX:I = 0xc00

.field static final bj:B = 0x1t

.field static final bk:B = 0x0t

.field static final bl:B = -0x51t

.field static final bm:B = 0x0t

.field static final bq:B = 0x7t

.field static final br:B = 0x1t


# instance fields
.field aB:Lcom/wmspanel/libstream/Streamer$a;

.field aC:[B

.field aD:D

.field aE:D

.field aF:Z

.field aG:Lcom/wmspanel/libstream/i$b;

.field aH:Lcom/wmspanel/libstream/Streamer$STATUS;

.field aI:Ljava/lang/String;

.field aJ:Ljava/lang/String;

.field final aK:I

.field final aL:B

.field final aM:B

.field final aN:B

.field final aO:B

.field final aP:B

.field final aQ:B

.field final aR:[B

.field final aS:I

.field final aT:B

.field final aU:B

.field final aW:B

.field aY:I

.field aZ:I

.field am:Z

.field ba:Lcom/wmspanel/libstream/RtmpChunkStream;

.field bb:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/wmspanel/libstream/RtmpChunkStream;",
            ">;"
        }
    .end annotation
.end field

.field bc:Z

.field bd:Z

.field be:I

.field bf:J

.field bg:J

.field bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

.field bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

.field bn:Lcom/wmspanel/libstream/k;

.field bo:Lcom/wmspanel/libstream/k;

.field bp:Lcom/wmspanel/libstream/k;

.field bs:I

.field final bt:B

.field final bu:B

.field bv:Lcom/wmspanel/libstream/BufferItem;

.field bw:J

.field bx:Z

.field by:J

.field v:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$MODE;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 266
    const/high16 v6, 0x10000

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v6}, Lcom/wmspanel/libstream/a;-><init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$MODE;Ljava/lang/String;II)V

    .line 155
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aC:[B

    .line 215
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->aD:D

    .line 216
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->aE:D

    .line 217
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wmspanel/libstream/i;->aF:Z

    .line 260
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bG:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    .line 261
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->CONN_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aH:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 274
    const/16 v0, 0x600

    iput v0, p0, Lcom/wmspanel/libstream/i;->aK:I

    .line 276
    const/16 v0, 0xa

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->aL:B

    .line 277
    const/4 v0, 0x0

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->aM:B

    .line 278
    const/4 v0, 0x0

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->aN:B

    .line 279
    const/4 v0, 0x1

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->aO:B

    .line 281
    const/4 v0, 0x3

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->aP:B

    .line 283
    const/4 v0, 0x3

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->aQ:B

    .line 285
    const/16 v0, 0x9

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aR:[B

    .line 351
    const/16 v0, 0xc00

    iput v0, p0, Lcom/wmspanel/libstream/i;->aS:I

    .line 352
    const/4 v0, 0x2

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->aT:B

    .line 354
    const/4 v0, 0x1

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->aU:B

    .line 358
    const/16 v0, 0x14

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->aW:B

    .line 701
    const/16 v0, 0x80

    iput v0, p0, Lcom/wmspanel/libstream/i;->aY:I

    .line 717
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wmspanel/libstream/i;->am:Z

    .line 720
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->bb:Ljava/util/HashMap;

    .line 725
    const/4 v0, 0x0

    iput v0, p0, Lcom/wmspanel/libstream/i;->be:I

    .line 727
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->bf:J

    .line 728
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->bg:J

    .line 1020
    new-instance v0, Lcom/wmspanel/libstream/k;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lcom/wmspanel/libstream/k;-><init>(B)V

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->bn:Lcom/wmspanel/libstream/k;

    .line 1021
    new-instance v0, Lcom/wmspanel/libstream/k;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/wmspanel/libstream/k;-><init>(B)V

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->bo:Lcom/wmspanel/libstream/k;

    .line 1022
    new-instance v0, Lcom/wmspanel/libstream/k;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lcom/wmspanel/libstream/k;-><init>(B)V

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->bp:Lcom/wmspanel/libstream/k;

    .line 1036
    const/4 v0, 0x0

    iput v0, p0, Lcom/wmspanel/libstream/i;->bs:I

    .line 1106
    const/16 v0, 0xa

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->bt:B

    .line 1107
    const/4 v0, 0x1

    iput-byte v0, p0, Lcom/wmspanel/libstream/i;->bu:B

    .line 1135
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->bw:J

    .line 1136
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wmspanel/libstream/i;->bx:Z

    .line 1138
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->by:J

    .line 267
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    iput p2, p0, Lcom/wmspanel/libstream/i;->d:I

    .line 270
    iput-object p7, p0, Lcom/wmspanel/libstream/i;->aI:Ljava/lang/String;

    .line 271
    iput-object p8, p0, Lcom/wmspanel/libstream/i;->aJ:Ljava/lang/String;

    .line 272
    return-void

    .line 285
    nop

    :array_0
    .array-data 1
        0x3t
        0x0t
        0x0t
        0x0t
        0x0t
        0xat
        0x0t
        0x0t
        0x1t
    .end array-data
.end method

.method private a(Lcom/wmspanel/libstream/BufferItem;I)I
    .locals 4

    .prologue
    .line 1080
    if-nez p2, :cond_0

    const v0, 0xfff7

    .line 1081
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v1

    array-length v1, v1

    sub-int/2addr v1, p2

    .line 1083
    if-le v1, v0, :cond_1

    .line 1085
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v1

    invoke-virtual {p0, v1, p2, v0}, Lcom/wmspanel/libstream/i;->append([BII)V

    .line 1086
    const/4 v1, 0x1

    new-array v1, v1, [B

    .line 1087
    const/4 v2, 0x0

    const/16 v3, -0x3b

    aput-byte v3, v1, v2

    .line 1088
    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/i;->a([B)V

    .line 1098
    :goto_1
    return v0

    .line 1080
    :cond_0
    const/high16 v0, 0x10000

    goto :goto_0

    .line 1090
    :cond_1
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v0

    invoke-virtual {p0, v0, p2, v1}, Lcom/wmspanel/libstream/i;->send([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    goto :goto_1

    .line 1095
    :catch_0
    move-exception v0

    .line 1096
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1097
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    .line 1098
    const/4 v0, -0x1

    goto :goto_1
.end method

.method static k(I)[B
    .locals 4

    .prologue
    const/4 v3, 0x4

    .line 1028
    new-array v1, v3, [B

    .line 1029
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_0

    .line 1030
    shr-int/lit8 v2, p0, 0x18

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 1031
    shl-int/lit8 p0, p0, 0x8

    .line 1029
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1033
    :cond_0
    return-object v1
.end method


# virtual methods
.method H()V
    .locals 8

    .prologue
    const/4 v0, 0x0

    .line 295
    const-string/jumbo v1, "RtmpConnection"

    const-string/jumbo v2, "sendHandshakeC0C1"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    const/16 v1, 0x601

    :try_start_0
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 301
    iget-object v2, p0, Lcom/wmspanel/libstream/i;->aR:[B

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 303
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    .line 305
    const/4 v4, 0x4

    new-array v4, v4, [B

    .line 307
    const/4 v5, 0x0

    long-to-int v6, v2

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 308
    const/4 v5, 0x1

    const/16 v6, 0x8

    shr-long v6, v2, v6

    long-to-int v6, v6

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 309
    const/4 v5, 0x2

    const/16 v6, 0x10

    shr-long v6, v2, v6

    long-to-int v6, v6

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 310
    const/4 v5, 0x3

    const/16 v6, 0x18

    shr-long/2addr v2, v6

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v4, v5

    .line 313
    :goto_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 315
    rem-int/lit8 v2, v0, 0x4

    packed-switch v2, :pswitch_data_0

    .line 330
    :goto_1
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 331
    add-int/lit8 v0, v0, 0x1

    rem-int/lit8 v0, v0, 0x4

    goto :goto_0

    .line 317
    :pswitch_0
    const/4 v2, 0x0

    const/4 v3, 0x1

    aget-byte v3, v4, v3

    const/4 v5, 0x2

    aget-byte v5, v4, v5

    add-int/2addr v3, v5

    int-to-byte v3, v3

    aput-byte v3, v4, v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 336
    :catch_0
    move-exception v0

    .line 337
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    .line 340
    :goto_2
    return-void

    .line 320
    :pswitch_1
    const/4 v2, 0x1

    const/4 v3, 0x2

    :try_start_1
    aget-byte v3, v4, v3

    const/4 v5, 0x3

    aget-byte v5, v4, v5

    add-int/2addr v3, v5

    int-to-byte v3, v3

    aput-byte v3, v4, v2

    goto :goto_1

    .line 323
    :pswitch_2
    const/4 v2, 0x2

    const/4 v3, 0x0

    aget-byte v3, v4, v3

    const/4 v5, 0x1

    aget-byte v5, v4, v5

    add-int/2addr v3, v5

    int-to-byte v3, v3

    aput-byte v3, v4, v2

    goto :goto_1

    .line 326
    :pswitch_3
    const/4 v2, 0x3

    const/4 v3, 0x0

    aget-byte v3, v4, v3

    const/4 v5, 0x2

    aget-byte v5, v4, v5

    add-int/2addr v3, v5

    int-to-byte v3, v3

    aput-byte v3, v4, v2

    goto :goto_1

    .line 334
    :cond_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->a([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 315
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method I()V
    .locals 5

    .prologue
    .line 398
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "sendConnect"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    const/16 v0, 0xc00

    :try_start_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 404
    const-string/jumbo v1, "connect"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 406
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v0, v2, v3}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;D)V

    .line 407
    invoke-static {v0}, Lcom/wmspanel/libstream/j;->g(Ljava/nio/ByteBuffer;)V

    .line 409
    const-string/jumbo v1, "app"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 410
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->aB:Lcom/wmspanel/libstream/Streamer$a;

    iget-object v1, v1, Lcom/wmspanel/libstream/Streamer$a;->dB:Lcom/wmspanel/libstream/Streamer$AUTH;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$AUTH;->LLNW:Lcom/wmspanel/libstream/Streamer$AUTH;

    if-ne v1, v2, :cond_2

    .line 411
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->aB:Lcom/wmspanel/libstream/Streamer$a;

    iget-object v1, v1, Lcom/wmspanel/libstream/Streamer$a;->v:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->aB:Lcom/wmspanel/libstream/Streamer$a;

    iget-object v1, v1, Lcom/wmspanel/libstream/Streamer$a;->v:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 412
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->aI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "?authmod=llnw&user="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->aB:Lcom/wmspanel/libstream/Streamer$a;

    iget-object v2, v2, Lcom/wmspanel/libstream/Streamer$a;->username:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 447
    :goto_0
    const-string/jumbo v1, "tcUrl"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 448
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "rtmp://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/wmspanel/libstream/i;->f:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->aI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 449
    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 451
    const-string/jumbo v1, "flashVer"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 452
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "FMLE/3.0 (compatible; "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v2}, Lcom/wmspanel/libstream/d;->z()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 454
    const-string/jumbo v1, "fpad"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 455
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;B)V

    .line 457
    const-string/jumbo v1, "capabilities"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 458
    const-wide/high16 v2, 0x402e000000000000L    # 15.0

    invoke-static {v0, v2, v3}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;D)V

    .line 460
    const-string/jumbo v1, "audioCodecs"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 461
    const-wide v2, 0x4090100000000000L    # 1028.0

    invoke-static {v0, v2, v3}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;D)V

    .line 463
    const-string/jumbo v1, "videoCodecs"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 464
    const-wide/high16 v2, 0x4060000000000000L    # 128.0

    invoke-static {v0, v2, v3}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;D)V

    .line 466
    const-string/jumbo v1, "videoFunction"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 467
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v0, v2, v3}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;D)V

    .line 469
    invoke-static {v0}, Lcom/wmspanel/libstream/j;->h(Ljava/nio/ByteBuffer;)V

    .line 471
    const/16 v1, 0xc

    new-array v1, v1, [B

    .line 472
    const/4 v2, 0x0

    const/4 v3, 0x3

    aput-byte v3, v1, v2

    .line 473
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    const v3, 0xffff

    and-int/2addr v2, v3

    .line 474
    const/4 v3, 0x5

    shr-int/lit8 v4, v2, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v1, v3

    .line 475
    const/4 v3, 0x6

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v1, v3

    .line 476
    const/4 v2, 0x7

    const/16 v3, 0x14

    aput-byte v3, v1, v2

    .line 478
    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/i;->a([B)V

    .line 479
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-virtual {p0, v1, v2, v0}, Lcom/wmspanel/libstream/i;->send([BII)V

    .line 485
    :goto_1
    return-void

    .line 416
    :cond_1
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/i;->g(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 418
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/wmspanel/libstream/i;->aB:Lcom/wmspanel/libstream/Streamer$a;

    iget-object v3, v3, Lcom/wmspanel/libstream/Streamer$a;->username:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ":live:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/wmspanel/libstream/i;->aB:Lcom/wmspanel/libstream/Streamer$a;

    iget-object v3, v3, Lcom/wmspanel/libstream/Streamer$a;->password:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 419
    invoke-static {v2}, Lcom/wmspanel/libstream/o;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 421
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "publish:/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/wmspanel/libstream/i;->aI:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/_definst_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 422
    invoke-static {v3}, Lcom/wmspanel/libstream/o;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 424
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ":"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/wmspanel/libstream/i;->aB:Lcom/wmspanel/libstream/Streamer$a;

    iget-object v4, v4, Lcom/wmspanel/libstream/Streamer$a;->v:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ":00000001:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ":auth"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v4, 0x3a

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 430
    invoke-static {v2}, Lcom/wmspanel/libstream/o;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 432
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "&nonce="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/wmspanel/libstream/i;->aB:Lcom/wmspanel/libstream/Streamer$a;

    iget-object v4, v4, Lcom/wmspanel/libstream/Streamer$a;->v:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "&cnonce="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, "&nc=00000001&response="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 437
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/wmspanel/libstream/i;->aI:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "?authmod=llnw&user="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/wmspanel/libstream/i;->aB:Lcom/wmspanel/libstream/Streamer$a;

    iget-object v3, v3, Lcom/wmspanel/libstream/Streamer$a;->username:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 439
    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 481
    :catch_0
    move-exception v0

    .line 482
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 483
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto/16 :goto_1

    .line 444
    :cond_2
    :try_start_1
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->aI:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method J()V
    .locals 5

    .prologue
    .line 488
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "sendCreateStream"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    const/16 v0, 0x80

    :try_start_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 493
    const-string/jumbo v1, "createStream"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 494
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v0, v2, v3}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;D)V

    .line 495
    invoke-static {v0}, Lcom/wmspanel/libstream/j;->f(Ljava/nio/ByteBuffer;)V

    .line 497
    const/16 v1, 0xc

    new-array v1, v1, [B

    .line 498
    const/4 v2, 0x0

    const/4 v3, 0x3

    aput-byte v3, v1, v2

    .line 500
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 501
    const/4 v3, 0x4

    const/4 v4, 0x0

    aput-byte v4, v1, v3

    .line 502
    const/4 v3, 0x5

    const/4 v4, 0x0

    aput-byte v4, v1, v3

    .line 503
    const/4 v3, 0x6

    int-to-byte v2, v2

    aput-byte v2, v1, v3

    .line 504
    const/4 v2, 0x7

    const/16 v3, 0x14

    aput-byte v3, v1, v2

    .line 506
    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/i;->b([B)V

    .line 507
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-virtual {p0, v1, v2, v0}, Lcom/wmspanel/libstream/i;->send([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 513
    :goto_0
    return-void

    .line 509
    :catch_0
    move-exception v0

    .line 510
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0
.end method

.method K()V
    .locals 4

    .prologue
    .line 519
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "sendPublish"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    const/16 v0, 0xc00

    :try_start_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 525
    const/16 v1, 0xc

    new-array v1, v1, [B

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 527
    const-string/jumbo v1, "publish"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 528
    const-wide/16 v2, 0x0

    invoke-static {v0, v2, v3}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;D)V

    .line 529
    invoke-static {v0}, Lcom/wmspanel/libstream/j;->f(Ljava/nio/ByteBuffer;)V

    .line 530
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->aJ:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 531
    const-string/jumbo v1, "live"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 533
    const/4 v1, 0x0

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 535
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/lit8 v1, v1, -0xc

    .line 537
    const/4 v2, 0x4

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 538
    const/4 v2, 0x5

    shr-int/lit8 v3, v1, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 539
    const/4 v2, 0x6

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    invoke-virtual {v0, v2, v1}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 540
    const/4 v1, 0x7

    const/16 v2, 0x14

    invoke-virtual {v0, v1, v2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 542
    iget-wide v2, p0, Lcom/wmspanel/libstream/i;->aE:D

    double-to-int v1, v2

    .line 543
    iget-object v2, p0, Lcom/wmspanel/libstream/i;->bn:Lcom/wmspanel/libstream/k;

    invoke-virtual {v2, v1}, Lcom/wmspanel/libstream/k;->l(I)V

    .line 544
    iget-object v2, p0, Lcom/wmspanel/libstream/i;->bp:Lcom/wmspanel/libstream/k;

    invoke-virtual {v2, v1}, Lcom/wmspanel/libstream/k;->l(I)V

    .line 545
    iget-object v2, p0, Lcom/wmspanel/libstream/i;->bo:Lcom/wmspanel/libstream/k;

    invoke-virtual {v2, v1}, Lcom/wmspanel/libstream/k;->l(I)V

    .line 547
    const/16 v2, 0x8

    int-to-byte v3, v1

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 548
    const/16 v2, 0x9

    shr-int/lit8 v3, v1, 0x8

    int-to-byte v3, v3

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 549
    const/16 v2, 0xa

    shr-int/lit8 v3, v1, 0x10

    int-to-byte v3, v3

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 550
    const/16 v2, 0xb

    shr-int/lit8 v1, v1, 0x18

    int-to-byte v1, v1

    invoke-virtual {v0, v2, v1}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 552
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-virtual {p0, v1, v2, v0}, Lcom/wmspanel/libstream/i;->send([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 558
    :goto_0
    return-void

    .line 554
    :catch_0
    move-exception v0

    .line 555
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 556
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0
.end method

.method L()I
    .locals 1

    .prologue
    .line 708
    iget v0, p0, Lcom/wmspanel/libstream/i;->aY:I

    return v0
.end method

.method M()V
    .locals 5

    .prologue
    .line 904
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "sendMetaData"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 908
    const/16 v0, 0x5dc

    :try_start_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 910
    const-string/jumbo v1, "onMetaData"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 911
    invoke-static {v0}, Lcom/wmspanel/libstream/j;->g(Ljava/nio/ByteBuffer;)V

    .line 913
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v1, v2, :cond_3

    .line 916
    :cond_0
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/wmspanel/libstream/StreamBuffer;->ac()Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    move-result-object v1

    iput-object v1, p0, Lcom/wmspanel/libstream/i;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    .line 917
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    if-nez v1, :cond_1

    .line 918
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "failed to get avc params, check if video capture is started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 919
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    .line 960
    :goto_0
    return-void

    .line 923
    :cond_1
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    iget-object v1, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    iget v2, v2, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    invoke-static {v1, v2}, Lcom/wmspanel/libstream/f;->a([BI)Lcom/wmspanel/libstream/f;

    move-result-object v1

    .line 924
    if-nez v1, :cond_2

    .line 925
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "failed to get sps info"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 956
    :catch_0
    move-exception v0

    .line 957
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 958
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0

    .line 930
    :cond_2
    :try_start_1
    const-string/jumbo v2, "RtmpConnection"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "from sps: width="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Lcom/wmspanel/libstream/f;->width:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ";height="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Lcom/wmspanel/libstream/f;->height:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 932
    const-string/jumbo v2, "width"

    invoke-static {v0, v2}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 933
    iget v2, v1, Lcom/wmspanel/libstream/f;->width:I

    int-to-double v2, v2

    invoke-static {v0, v2, v3}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;D)V

    .line 935
    const-string/jumbo v2, "height"

    invoke-static {v0, v2}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 936
    iget v1, v1, Lcom/wmspanel/libstream/f;->height:I

    int-to-double v2, v1

    invoke-static {v0, v2, v3}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;D)V

    .line 938
    const-string/jumbo v1, "videocodecid"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 939
    const-string/jumbo v1, "avc1"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 942
    :cond_3
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v1, v2, :cond_4

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v1, v2, :cond_5

    .line 945
    :cond_4
    const-string/jumbo v1, "audiocodecid"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 946
    const-string/jumbo v1, "mp4a"

    invoke-static {v0, v1}, Lcom/wmspanel/libstream/j;->b(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 949
    :cond_5
    invoke-static {v0}, Lcom/wmspanel/libstream/j;->h(Ljava/nio/ByteBuffer;)V

    .line 951
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bn:Lcom/wmspanel/libstream/k;

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->aC:[B

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lcom/wmspanel/libstream/k;->f([BII)I

    move-result v1

    .line 953
    iget-object v2, p0, Lcom/wmspanel/libstream/i;->aC:[B

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v1}, Lcom/wmspanel/libstream/i;->append([BII)V

    .line 954
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-virtual {p0, v1, v2, v0}, Lcom/wmspanel/libstream/i;->send([BII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method N()V
    .locals 6

    .prologue
    .line 966
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "sendAvcHeader"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 970
    const/4 v0, 0x5

    :try_start_0
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    .line 975
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/wmspanel/libstream/StreamBuffer;->ac()Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    move-result-object v1

    .line 976
    iget-object v2, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    iget-object v1, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_buf:[B

    invoke-virtual {p0, v2, v1}, Lcom/wmspanel/libstream/i;->a([B[B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 978
    iget-object v2, p0, Lcom/wmspanel/libstream/i;->bp:Lcom/wmspanel/libstream/k;

    iget-object v3, p0, Lcom/wmspanel/libstream/i;->aC:[B

    array-length v4, v0

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    add-int/2addr v4, v5

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/wmspanel/libstream/k;->f([BII)I

    move-result v2

    .line 980
    iget-object v3, p0, Lcom/wmspanel/libstream/i;->aC:[B

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4, v2}, Lcom/wmspanel/libstream/i;->append([BII)V

    .line 981
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->b([B)V

    .line 982
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {p0, v0, v2, v1}, Lcom/wmspanel/libstream/i;->send([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 988
    :goto_0
    return-void

    .line 984
    :catch_0
    move-exception v0

    .line 985
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 986
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0

    .line 970
    nop

    :array_0
    .array-data 1
        0x17t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method O()V
    .locals 5

    .prologue
    .line 995
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "sendAacHeader"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 999
    const/4 v0, 0x2

    :try_start_0
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    .line 1001
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/wmspanel/libstream/StreamBuffer;->ad()Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    move-result-object v1

    iput-object v1, p0, Lcom/wmspanel/libstream/i;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    .line 1002
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    if-nez v1, :cond_0

    .line 1003
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "failed to get aac params, check if audio capture is started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1004
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    .line 1018
    :goto_0
    return-void

    .line 1008
    :cond_0
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bo:Lcom/wmspanel/libstream/k;

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->aC:[B

    array-length v3, v0

    iget-object v4, p0, Lcom/wmspanel/libstream/i;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v4, v4, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configLen:I

    add-int/2addr v3, v4

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lcom/wmspanel/libstream/k;->f([BII)I

    move-result v1

    .line 1010
    iget-object v2, p0, Lcom/wmspanel/libstream/i;->aC:[B

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v1}, Lcom/wmspanel/libstream/i;->append([BII)V

    .line 1011
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->b([B)V

    .line 1012
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget-object v0, v0, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configBuf:[B

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v2, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configLen:I

    invoke-virtual {p0, v0, v1, v2}, Lcom/wmspanel/libstream/i;->send([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1014
    :catch_0
    move-exception v0

    .line 1015
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1016
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0

    .line 999
    :array_0
    .array-data 1
        -0x51t
        0x0t
    .end array-data
.end method

.method P()V
    .locals 10

    .prologue
    const-wide/16 v8, 0x1

    const-wide/16 v6, 0x0

    const/4 v4, 0x0

    .line 1144
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->b()I

    move-result v0

    if-lez v0, :cond_2

    .line 1225
    :cond_1
    :goto_1
    return-void

    .line 1149
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v0

    iget-wide v2, p0, Lcom/wmspanel/libstream/i;->bw:J

    invoke-virtual {v0, v2, v3}, Lcom/wmspanel/libstream/StreamBuffer;->d(J)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    .line 1150
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    if-eqz v0, :cond_1

    .line 1155
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->o()J

    move-result-wide v0

    add-long/2addr v0, v8

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->bw:J

    .line 1157
    sget-object v0, Lcom/wmspanel/libstream/i$1;->bA:[I

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem;->m()Lcom/wmspanel/libstream/BufferItem$a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem$a;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 1274
    const-string/jumbo v0, "RtmpConnection"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unsupported frame type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v2}, Lcom/wmspanel/libstream/BufferItem;->m()Lcom/wmspanel/libstream/BufferItem$a;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1159
    :pswitch_0
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/wmspanel/libstream/i;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_0

    .line 1161
    :cond_3
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->q()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1163
    iget-wide v0, p0, Lcom/wmspanel/libstream/i;->o:J

    cmp-long v0, v0, v6

    if-eqz v0, :cond_0

    .line 1168
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->n()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/wmspanel/libstream/i;->r:J

    sub-long/2addr v0, v2

    cmp-long v0, v0, v8

    if-gtz v0, :cond_0

    .line 1174
    :cond_4
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->b(Lcom/wmspanel/libstream/BufferItem;)V

    .line 1176
    iget-boolean v0, p0, Lcom/wmspanel/libstream/i;->bx:Z

    if-eqz v0, :cond_5

    .line 1177
    iput-boolean v4, p0, Lcom/wmspanel/libstream/i;->bx:Z

    .line 1179
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->by:J

    .line 1181
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->N()V

    .line 1183
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_5

    .line 1184
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->O()V

    .line 1188
    :cond_5
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/wmspanel/libstream/i;->by:J

    sub-long/2addr v0, v2

    cmp-long v0, v0, v6

    if-ltz v0, :cond_0

    .line 1193
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/wmspanel/libstream/StreamBuffer;->ac()Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    move-result-object v1

    if-eq v0, v1, :cond_6

    .line 1194
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamBuffer;->ac()Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    move-result-object v0

    .line 1195
    if-eqz v0, :cond_0

    .line 1196
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    invoke-virtual {v1, v0}, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 1197
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem;->q()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1201
    iput-object v0, p0, Lcom/wmspanel/libstream/i;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    .line 1202
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->N()V

    .line 1203
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "Video encoder re-configuration detected"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1212
    :cond_6
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->c(Lcom/wmspanel/libstream/BufferItem;)V

    .line 1213
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bN:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    .line 1215
    iput v4, p0, Lcom/wmspanel/libstream/i;->bs:I

    .line 1216
    :cond_7
    iget v0, p0, Lcom/wmspanel/libstream/i;->bs:I

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_9

    .line 1217
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    iget v1, p0, Lcom/wmspanel/libstream/i;->bs:I

    invoke-direct {p0, v0, v1}, Lcom/wmspanel/libstream/i;->a(Lcom/wmspanel/libstream/BufferItem;I)I

    move-result v0

    .line 1218
    if-gtz v0, :cond_8

    .line 1219
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "failed to send video part"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 1222
    :cond_8
    iget v1, p0, Lcom/wmspanel/libstream/i;->bs:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/i;->bs:I

    .line 1224
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->b()I

    move-result v0

    if-lez v0, :cond_7

    goto/16 :goto_1

    .line 1228
    :cond_9
    iget-wide v0, p0, Lcom/wmspanel/libstream/i;->o:J

    add-long/2addr v0, v8

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->o:J

    .line 1229
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bM:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    goto/16 :goto_0

    .line 1234
    :pswitch_1
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v0, v1, :cond_a

    iget-object v0, p0, Lcom/wmspanel/libstream/i;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_0

    .line 1236
    :cond_a
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->a(Lcom/wmspanel/libstream/BufferItem;)V

    .line 1238
    iget-boolean v0, p0, Lcom/wmspanel/libstream/i;->bx:Z

    if-eqz v0, :cond_b

    .line 1239
    iput-boolean v4, p0, Lcom/wmspanel/libstream/i;->bx:Z

    .line 1241
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->by:J

    .line 1243
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->O()V

    .line 1245
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_b

    .line 1246
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->N()V

    .line 1250
    :cond_b
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/wmspanel/libstream/i;->by:J

    sub-long/2addr v0, v2

    cmp-long v0, v0, v6

    if-ltz v0, :cond_0

    .line 1255
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/wmspanel/libstream/StreamBuffer;->ad()Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    move-result-object v1

    if-eq v0, v1, :cond_c

    .line 1256
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamBuffer;->ad()Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    move-result-object v0

    .line 1257
    if-eqz v0, :cond_0

    .line 1258
    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    invoke-virtual {v1, v0}, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 1259
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->O()V

    .line 1260
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "Audio encoder re-configuration detected"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1269
    :cond_c
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->d(Lcom/wmspanel/libstream/BufferItem;)V

    goto/16 :goto_0

    .line 1157
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method a(Ljava/nio/ByteBuffer;)I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 587
    sget-object v0, Lcom/wmspanel/libstream/i$1;->bz:[I

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/i$b;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 656
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    .line 659
    :cond_0
    :goto_0
    return v3

    .line 589
    :pswitch_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    const/16 v1, 0xc01

    if-lt v0, v1, :cond_0

    .line 595
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    aget-byte v0, v0, v3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    .line 596
    const-string/jumbo v0, "RtmpConnection"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Invalid protocol version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    aget-byte v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0

    .line 601
    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->d([B)V

    .line 603
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;I)V

    .line 604
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bI:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    .line 606
    const/high16 v0, 0x10000

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->f(I)V

    .line 607
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->I()V

    .line 608
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bJ:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    goto :goto_0

    .line 612
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/i;->e(Ljava/nio/ByteBuffer;)V

    .line 614
    iget-boolean v0, p0, Lcom/wmspanel/libstream/i;->aF:Z

    if-eqz v0, :cond_0

    .line 618
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->J()V

    .line 619
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bK:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    goto :goto_0

    .line 623
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/i;->e(Ljava/nio/ByteBuffer;)V

    .line 625
    iget-boolean v0, p0, Lcom/wmspanel/libstream/i;->aF:Z

    if-eqz v0, :cond_0

    .line 629
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->SETUP:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->SUCCESS:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/i;->a(Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V

    .line 631
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->K()V

    .line 632
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bL:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    goto :goto_0

    .line 636
    :pswitch_3
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/i;->e(Ljava/nio/ByteBuffer;)V

    .line 638
    iget-boolean v0, p0, Lcom/wmspanel/libstream/i;->aF:Z

    if-eqz v0, :cond_0

    .line 642
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->M()V

    .line 643
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bM:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    .line 645
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->RECORD:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->SUCCESS:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/i;->a(Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V

    .line 647
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->P()V

    goto/16 :goto_0

    .line 652
    :pswitch_4
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/i;->e(Ljava/nio/ByteBuffer;)V

    goto/16 :goto_0

    .line 587
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method a(D)Lcom/wmspanel/libstream/i$a;
    .locals 3

    .prologue
    .line 177
    double-to-int v0, p1

    int-to-double v0, v0

    cmpl-double v0, v0, p1

    if-eqz v0, :cond_0

    .line 178
    sget-object v0, Lcom/wmspanel/libstream/i$a;->bB:Lcom/wmspanel/libstream/i$a;

    .line 210
    :goto_0
    return-object v0

    .line 181
    :cond_0
    double-to-int v0, p1

    packed-switch v0, :pswitch_data_0

    .line 210
    :pswitch_0
    sget-object v0, Lcom/wmspanel/libstream/i$a;->bB:Lcom/wmspanel/libstream/i$a;

    goto :goto_0

    .line 184
    :pswitch_1
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bJ:Lcom/wmspanel/libstream/i$b;

    if-ne v0, v1, :cond_1

    .line 185
    sget-object v0, Lcom/wmspanel/libstream/i$a;->bC:Lcom/wmspanel/libstream/i$a;

    goto :goto_0

    .line 187
    :cond_1
    sget-object v0, Lcom/wmspanel/libstream/i$a;->bB:Lcom/wmspanel/libstream/i$a;

    goto :goto_0

    .line 193
    :pswitch_2
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bK:Lcom/wmspanel/libstream/i$b;

    if-ne v0, v1, :cond_2

    .line 194
    sget-object v0, Lcom/wmspanel/libstream/i$a;->bD:Lcom/wmspanel/libstream/i$a;

    goto :goto_0

    .line 196
    :cond_2
    sget-object v0, Lcom/wmspanel/libstream/i$a;->bB:Lcom/wmspanel/libstream/i$a;

    goto :goto_0

    .line 202
    :pswitch_3
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bL:Lcom/wmspanel/libstream/i$b;

    if-ne v0, v1, :cond_3

    .line 203
    sget-object v0, Lcom/wmspanel/libstream/i$a;->bE:Lcom/wmspanel/libstream/i$a;

    goto :goto_0

    .line 205
    :cond_3
    sget-object v0, Lcom/wmspanel/libstream/i$a;->bB:Lcom/wmspanel/libstream/i$a;

    goto :goto_0

    .line 181
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method a([B[B)Ljava/nio/ByteBuffer;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 862
    array-length v0, p1

    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    .line 863
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "sps must be at least 4 bytes long"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 864
    const/4 v0, 0x0

    .line 897
    :goto_0
    return-object v0

    .line 867
    :cond_0
    array-length v0, p1

    add-int/lit8 v0, v0, 0xb

    array-length v1, p2

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 870
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 872
    const/4 v1, 0x3

    invoke-virtual {v0, p1, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 875
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 878
    const/16 v1, -0x1f

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 881
    array-length v1, p1

    shr-int/lit8 v1, v1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 882
    array-length v1, p1

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 885
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 888
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 891
    array-length v1, p2

    shr-int/lit8 v1, v1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 892
    array-length v1, p2

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 895
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_0
.end method

.method a(DD)V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 220
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "success_command_response"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    double-to-int v0, p1

    packed-switch v0, :pswitch_data_0

    .line 258
    :goto_0
    :pswitch_0
    return-void

    .line 225
    :pswitch_1
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bJ:Lcom/wmspanel/libstream/i$b;

    if-ne v0, v1, :cond_0

    .line 226
    iput-wide p3, p0, Lcom/wmspanel/libstream/i;->aD:D

    .line 227
    iput-boolean v2, p0, Lcom/wmspanel/libstream/i;->aF:Z

    goto :goto_0

    .line 229
    :cond_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0

    .line 236
    :pswitch_2
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bK:Lcom/wmspanel/libstream/i$b;

    if-ne v0, v1, :cond_1

    .line 237
    iput-wide p3, p0, Lcom/wmspanel/libstream/i;->aE:D

    .line 238
    iput-boolean v2, p0, Lcom/wmspanel/libstream/i;->aF:Z

    goto :goto_0

    .line 240
    :cond_1
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0

    .line 247
    :pswitch_3
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bL:Lcom/wmspanel/libstream/i$b;

    if-ne v0, v1, :cond_2

    iget-wide v0, p0, Lcom/wmspanel/libstream/i;->aE:D

    cmpl-double v0, p3, v0

    if-nez v0, :cond_2

    .line 248
    iput-boolean v2, p0, Lcom/wmspanel/libstream/i;->aF:Z

    goto :goto_0

    .line 250
    :cond_2
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0

    .line 222
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method a(Lcom/wmspanel/libstream/Streamer$a;)V
    .locals 0

    .prologue
    .line 152
    iput-object p1, p0, Lcom/wmspanel/libstream/i;->aB:Lcom/wmspanel/libstream/Streamer$a;

    .line 153
    return-void
.end method

.method b(Lcom/wmspanel/libstream/BufferItem;I)J
    .locals 6

    .prologue
    .line 1103
    int-to-long v0, p2

    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/wmspanel/libstream/i;->by:J

    sub-long/2addr v2, v4

    mul-long/2addr v0, v2

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    return-wide v0
.end method

.method b(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 148
    iput-object p1, p0, Lcom/wmspanel/libstream/i;->v:Ljava/lang/String;

    .line 149
    return-void
.end method

.method c()V
    .locals 2

    .prologue
    .line 562
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "onConnect"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->UNKNOWN_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aH:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 564
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->CONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->SUCCESS:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/i;->a(Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V

    .line 565
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->H()V

    .line 566
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bH:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    .line 567
    return-void
.end method

.method c(Lcom/wmspanel/libstream/BufferItem;)V
    .locals 8

    .prologue
    const/4 v1, 0x2

    const/4 v0, 0x1

    const/4 v6, 0x0

    .line 1043
    const/16 v2, 0x3e8

    :try_start_0
    invoke-virtual {p0, p1, v2}, Lcom/wmspanel/libstream/i;->b(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v2

    .line 1047
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v4

    .line 1050
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->q()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1054
    :goto_0
    const/4 v1, 0x5

    new-array v1, v1, [B

    const/4 v5, 0x0

    shl-int/lit8 v0, v0, 0x4

    or-int/lit8 v0, v0, 0x7

    int-to-byte v0, v0

    aput-byte v0, v1, v5

    const/4 v0, 0x1

    const/4 v5, 0x1

    aput-byte v5, v1, v0

    const/4 v0, 0x2

    int-to-byte v5, v6

    aput-byte v5, v1, v0

    const/4 v0, 0x3

    int-to-byte v5, v6

    aput-byte v5, v1, v0

    const/4 v0, 0x4

    int-to-byte v5, v6

    aput-byte v5, v1, v0

    .line 1061
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bp:Lcom/wmspanel/libstream/k;

    iget-object v5, p0, Lcom/wmspanel/libstream/i;->aC:[B

    array-length v6, v1

    add-int/lit8 v6, v6, 0x4

    array-length v7, v4

    add-int/2addr v6, v7

    long-to-int v2, v2

    invoke-virtual {v0, v5, v6, v2}, Lcom/wmspanel/libstream/k;->f([BII)I

    move-result v0

    .line 1063
    iget-object v2, p0, Lcom/wmspanel/libstream/i;->aC:[B

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v0}, Lcom/wmspanel/libstream/i;->append([BII)V

    .line 1064
    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/i;->b([B)V

    .line 1066
    array-length v0, v4

    invoke-static {v0}, Lcom/wmspanel/libstream/i;->k(I)[B

    move-result-object v0

    .line 1067
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->b([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1073
    :goto_1
    return-void

    .line 1069
    :catch_0
    move-exception v0

    .line 1070
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1071
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_1

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method protected declared-synchronized close()V
    .locals 3

    .prologue
    .line 570
    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "close"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    sget-object v1, Lcom/wmspanel/libstream/i$b;->bO:Lcom/wmspanel/libstream/i$b;

    if-eq v0, v1, :cond_1

    .line 573
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->aH:Lcom/wmspanel/libstream/Streamer$STATUS;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    if-ne v0, v1, :cond_0

    .line 574
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->c:Lcom/wmspanel/libstream/d;

    iget v1, p0, Lcom/wmspanel/libstream/i;->d:I

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->v:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/wmspanel/libstream/d;->a(ILjava/lang/String;)V

    .line 577
    :cond_0
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bO:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    .line 578
    invoke-super {p0}, Lcom/wmspanel/libstream/a;->close()V

    .line 579
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->DISCONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->aH:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/i;->a(Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 581
    :cond_1
    monitor-exit p0

    return-void

    .line 570
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method d()V
    .locals 2

    .prologue
    .line 666
    sget-object v0, Lcom/wmspanel/libstream/i$1;->bz:[I

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/i$b;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 699
    :goto_0
    return-void

    .line 668
    :pswitch_0
    const/high16 v0, 0x10000

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->f(I)V

    .line 669
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->I()V

    .line 670
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bJ:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    goto :goto_0

    .line 674
    :pswitch_1
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->P()V

    goto :goto_0

    .line 678
    :cond_0
    :pswitch_2
    iget v0, p0, Lcom/wmspanel/libstream/i;->bs:I

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 679
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bv:Lcom/wmspanel/libstream/BufferItem;

    iget v1, p0, Lcom/wmspanel/libstream/i;->bs:I

    invoke-direct {p0, v0, v1}, Lcom/wmspanel/libstream/i;->a(Lcom/wmspanel/libstream/BufferItem;I)I

    move-result v0

    .line 680
    if-gtz v0, :cond_1

    .line 681
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "failed to send video part"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 684
    :cond_1
    iget v1, p0, Lcom/wmspanel/libstream/i;->bs:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/i;->bs:I

    .line 686
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->b()I

    move-result v0

    if-lez v0, :cond_0

    .line 687
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bN:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    goto :goto_0

    .line 691
    :cond_2
    sget-object v0, Lcom/wmspanel/libstream/i$b;->bM:Lcom/wmspanel/libstream/i$b;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aG:Lcom/wmspanel/libstream/i$b;

    .line 693
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->P()V

    goto :goto_0

    .line 666
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method d(Lcom/wmspanel/libstream/BufferItem;)V
    .locals 8

    .prologue
    .line 1114
    const/4 v0, 0x2

    :try_start_0
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    .line 1116
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v1

    .line 1118
    const/16 v2, 0x3e8

    invoke-virtual {p0, p1, v2}, Lcom/wmspanel/libstream/i;->b(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v2

    .line 1120
    iget-object v4, p0, Lcom/wmspanel/libstream/i;->bo:Lcom/wmspanel/libstream/k;

    iget-object v5, p0, Lcom/wmspanel/libstream/i;->aC:[B

    array-length v6, v0

    array-length v7, v1

    add-int/2addr v6, v7

    long-to-int v2, v2

    invoke-virtual {v4, v5, v6, v2}, Lcom/wmspanel/libstream/k;->f([BII)I

    move-result v2

    .line 1122
    iget-object v3, p0, Lcom/wmspanel/libstream/i;->aC:[B

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4, v2}, Lcom/wmspanel/libstream/i;->append([BII)V

    .line 1123
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->b([B)V

    .line 1124
    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/i;->a([B)V

    .line 1126
    iget-wide v0, p0, Lcom/wmspanel/libstream/i;->m:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->m:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1132
    :goto_0
    return-void

    .line 1128
    :catch_0
    move-exception v0

    .line 1129
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1130
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0

    .line 1114
    nop

    :array_0
    .array-data 1
        -0x51t
        0x1t
    .end array-data
.end method

.method d([B)V
    .locals 2

    .prologue
    .line 344
    const/4 v0, 0x1

    const/16 v1, 0x600

    :try_start_0
    invoke-virtual {p0, p1, v0, v1}, Lcom/wmspanel/libstream/i;->send([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 349
    :goto_0
    return-void

    .line 345
    :catch_0
    move-exception v0

    .line 346
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0
.end method

.method e(Ljava/nio/ByteBuffer;)V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 734
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    if-lez v0, :cond_a

    .line 735
    iget-boolean v0, p0, Lcom/wmspanel/libstream/i;->am:Z

    if-eqz v0, :cond_4

    .line 737
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    and-int/lit8 v0, v0, 0x3f

    .line 739
    if-nez v0, :cond_2

    .line 740
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    if-ge v0, v4, :cond_1

    .line 833
    :cond_0
    :goto_1
    return-void

    .line 743
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v0, v0, 0x40

    move v1, v0

    .line 751
    :goto_2
    if-ge v1, v4, :cond_3

    .line 752
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 829
    :catch_0
    move-exception v0

    .line 830
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 831
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_1

    .line 744
    :cond_2
    if-ne v0, v3, :cond_e

    .line 745
    :try_start_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    .line 748
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x40

    move v1, v0

    goto :goto_2

    .line 756
    :cond_3
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bb:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/RtmpChunkStream;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->ba:Lcom/wmspanel/libstream/RtmpChunkStream;

    .line 758
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->ba:Lcom/wmspanel/libstream/RtmpChunkStream;

    if-nez v0, :cond_4

    .line 759
    new-instance v0, Lcom/wmspanel/libstream/RtmpChunkStream;

    invoke-direct {v0, p0, v1}, Lcom/wmspanel/libstream/RtmpChunkStream;-><init>(Lcom/wmspanel/libstream/i;I)V

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->ba:Lcom/wmspanel/libstream/RtmpChunkStream;

    .line 760
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->bb:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/i;->ba:Lcom/wmspanel/libstream/RtmpChunkStream;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 764
    :cond_4
    iget-object v0, p0, Lcom/wmspanel/libstream/i;->ba:Lcom/wmspanel/libstream/RtmpChunkStream;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/RtmpChunkStream;->c(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 766
    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_6

    .line 767
    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_5

    .line 768
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/i;->aH:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 770
    :cond_5
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_1

    .line 774
    :cond_6
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_7

    .line 775
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/wmspanel/libstream/i;->bc:Z

    .line 778
    :cond_7
    and-int/lit8 v1, v0, 0x10

    if-eqz v1, :cond_8

    .line 779
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/wmspanel/libstream/i;->bd:Z

    .line 780
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/wmspanel/libstream/i;->bc:Z

    .line 783
    :cond_8
    and-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_9

    .line 784
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/wmspanel/libstream/i;->am:Z

    .line 789
    :goto_3
    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_0

    .line 799
    iget v0, p0, Lcom/wmspanel/libstream/i;->be:I

    iget-object v1, p0, Lcom/wmspanel/libstream/i;->ba:Lcom/wmspanel/libstream/RtmpChunkStream;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/RtmpChunkStream;->G()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/i;->be:I

    goto/16 :goto_0

    .line 786
    :cond_9
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/wmspanel/libstream/i;->am:Z

    goto :goto_3

    .line 802
    :cond_a
    invoke-static {p1}, Lcom/wmspanel/libstream/j;->i(Ljava/nio/ByteBuffer;)V

    .line 804
    iget v0, p0, Lcom/wmspanel/libstream/i;->be:I

    if-gtz v0, :cond_0

    .line 806
    iget v0, p0, Lcom/wmspanel/libstream/i;->be:I

    if-gez v0, :cond_b

    .line 807
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto/16 :goto_1

    .line 811
    :cond_b
    iget v0, p0, Lcom/wmspanel/libstream/i;->aZ:I

    if-lez v0, :cond_0

    .line 812
    iget-wide v0, p0, Lcom/wmspanel/libstream/i;->bf:J

    const-wide/32 v2, -0x10000000

    cmp-long v0, v0, v2

    if-ltz v0, :cond_c

    .line 813
    iget-wide v0, p0, Lcom/wmspanel/libstream/i;->bf:J

    iget-wide v2, p0, Lcom/wmspanel/libstream/i;->bg:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->bf:J

    .line 814
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->bg:J

    .line 817
    :cond_c
    iget-wide v0, p0, Lcom/wmspanel/libstream/i;->bf:J

    iget-wide v2, p0, Lcom/wmspanel/libstream/i;->bg:J

    sub-long/2addr v0, v2

    .line 819
    iget v2, p0, Lcom/wmspanel/libstream/i;->aZ:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 820
    iget-wide v0, p0, Lcom/wmspanel/libstream/i;->bf:J

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->j(I)Z

    move-result v0

    if-nez v0, :cond_d

    .line 821
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto/16 :goto_1

    .line 824
    :cond_d
    iget-wide v0, p0, Lcom/wmspanel/libstream/i;->bf:J

    iput-wide v0, p0, Lcom/wmspanel/libstream/i;->bg:J

    .line 825
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wmspanel/libstream/i;->bc:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    :cond_e
    move v1, v0

    goto/16 :goto_2
.end method

.method f(I)V
    .locals 4

    .prologue
    .line 361
    const-string/jumbo v0, "RtmpConnection"

    const-string/jumbo v1, "sendSetChunkSize"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    const/16 v0, 0xc

    :try_start_0
    new-array v0, v0, [B

    .line 366
    const/4 v1, 0x0

    const/4 v2, 0x2

    aput-byte v2, v0, v1

    .line 367
    const/4 v1, 0x6

    const/4 v2, 0x4

    aput-byte v2, v0, v1

    .line 368
    const/4 v1, 0x7

    const/4 v2, 0x1

    aput-byte v2, v0, v1

    .line 370
    const/4 v1, 0x4

    new-array v1, v1, [B

    .line 371
    const/4 v2, 0x0

    shr-int/lit8 v3, p1, 0x18

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 372
    const/4 v2, 0x1

    shr-int/lit8 v3, p1, 0x10

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 373
    const/4 v2, 0x2

    shr-int/lit8 v3, p1, 0x8

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 374
    const/4 v2, 0x3

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 376
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/i;->b([B)V

    .line 377
    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/i;->a([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 383
    :goto_0
    return-void

    .line 379
    :catch_0
    move-exception v0

    .line 380
    const-string/jumbo v1, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    invoke-virtual {p0}, Lcom/wmspanel/libstream/i;->close()V

    goto :goto_0
.end method

.method protected g(I)Ljava/lang/String;
    .locals 4

    .prologue
    .line 386
    const-string/jumbo v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

    .line 387
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 388
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 389
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-ge v2, p1, :cond_0

    .line 390
    invoke-virtual {v1}, Ljava/util/Random;->nextFloat()F

    move-result v2

    const-string/jumbo v3, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    .line 391
    const-string/jumbo v3, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 393
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 394
    return-object v0
.end method

.method h(I)V
    .locals 0

    .prologue
    .line 704
    iput p1, p0, Lcom/wmspanel/libstream/i;->aY:I

    .line 705
    return-void
.end method

.method i(I)V
    .locals 0

    .prologue
    .line 714
    iput p1, p0, Lcom/wmspanel/libstream/i;->aZ:I

    .line 715
    return-void
.end method

.method j(I)Z
    .locals 7

    .prologue
    const/4 v4, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 837
    const-string/jumbo v2, "RtmpConnection"

    const-string/jumbo v3, "sendAcknowledgement"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    const/16 v2, 0xc

    new-array v2, v2, [B

    .line 840
    aput-byte v5, v2, v1

    .line 841
    const/4 v3, 0x6

    aput-byte v4, v2, v3

    .line 842
    const/4 v3, 0x7

    aput-byte v6, v2, v3

    .line 844
    new-array v3, v4, [B

    .line 845
    shr-int/lit8 v4, p1, 0x18

    int-to-byte v4, v4

    aput-byte v4, v3, v1

    .line 846
    shr-int/lit8 v4, p1, 0x10

    int-to-byte v4, v4

    aput-byte v4, v3, v0

    .line 847
    shr-int/lit8 v4, p1, 0x8

    int-to-byte v4, v4

    aput-byte v4, v3, v5

    .line 848
    int-to-byte v4, p1

    aput-byte v4, v3, v6

    .line 851
    :try_start_0
    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/i;->b([B)V

    .line 852
    invoke-virtual {p0, v3}, Lcom/wmspanel/libstream/i;->a([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 857
    :goto_0
    return v0

    .line 853
    :catch_0
    move-exception v0

    .line 854
    const-string/jumbo v2, "RtmpConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 855
    goto :goto_0
.end method
