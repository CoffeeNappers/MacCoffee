.class public Lcom/wmspanel/libstream/RtmpChunkStream;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RtmpChunkStream"

.field static final ad:I = 0x1

.field static final ae:I = 0x2

.field static final af:I = 0x4

.field static final ag:I = 0x8

.field static final ah:I = 0x10

.field static final ai:I = 0x20

.field static an:I


# instance fields
.field private aj:Z

.field ak:Lcom/wmspanel/libstream/i;

.field al:Z

.field am:Z

.field ao:Ljava/nio/ByteBuffer;

.field ap:I

.field aq:I

.field ar:I

.field as:B

.field at:I

.field au:I

.field av:I

.field aw:I

.field ax:Z

.field ay:I

.field az:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const/high16 v0, 0x100000

    sput v0, Lcom/wmspanel/libstream/RtmpChunkStream;->an:I

    return-void
.end method

.method constructor <init>(Lcom/wmspanel/libstream/i;I)V
    .locals 3
    .param p1, "receiver"    # Lcom/wmspanel/libstream/i;
    .param p2, "cs_id"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-boolean v1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aj:Z

    .line 47
    iput-boolean v1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->al:Z

    .line 48
    iput-boolean v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->am:Z

    .line 53
    sget v0, Lcom/wmspanel/libstream/RtmpChunkStream;->an:I

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    .line 65
    iput-boolean v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ax:Z

    .line 66
    iput v1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ay:I

    .line 68
    iput-boolean v1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->az:Z

    .line 29
    iput-object p1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    .line 30
    iput p2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aw:I

    .line 31
    return-void
.end method


# virtual methods
.method E()Z
    .locals 5

    .prologue
    const v2, 0xffffff

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 329
    iget v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ar:I

    const/4 v4, 0x4

    if-eq v3, v4, :cond_0

    move v1, v0

    .line 344
    :goto_0
    return v1

    .line 333
    :cond_0
    iget-object v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-static {v3, v0}, Lcom/wmspanel/libstream/j;->d(Ljava/nio/ByteBuffer;I)I

    move-result v0

    .line 335
    if-le v0, v2, :cond_1

    move v0, v2

    .line 339
    :cond_1
    if-ge v0, v1, :cond_2

    move v0, v1

    .line 343
    :cond_2
    iget-object v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    invoke-virtual {v2, v0}, Lcom/wmspanel/libstream/i;->h(I)V

    goto :goto_0
.end method

.method F()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 348
    iget v1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ar:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_0

    .line 355
    :goto_0
    return v0

    .line 352
    :cond_0
    iget-object v1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-static {v1, v0}, Lcom/wmspanel/libstream/j;->d(Ljava/nio/ByteBuffer;I)I

    move-result v0

    .line 354
    iget-object v1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    invoke-virtual {v1, v0}, Lcom/wmspanel/libstream/i;->i(I)V

    .line 355
    const/4 v0, 0x1

    goto :goto_0
.end method

.method G()I
    .locals 1

    .prologue
    .line 714
    iget v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ay:I

    return v0
.end method

.method a(III)I
    .locals 1

    .prologue
    .line 71
    add-int v0, p2, p3

    sub-int/2addr v0, p1

    return v0
.end method

.method a(Ljava/lang/Boolean;)Z
    .locals 5

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 273
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 275
    iget v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aw:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 277
    iget v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->at:I

    if-nez v3, :cond_0

    .line 281
    iget-byte v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->as:B

    packed-switch v3, :pswitch_data_0

    move v0, v1

    .line 323
    :goto_0
    :pswitch_0
    iget-object v1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-static {v1}, Lcom/wmspanel/libstream/j;->i(Ljava/nio/ByteBuffer;)V

    .line 325
    return v0

    .line 283
    :pswitch_1
    invoke-virtual {p0}, Lcom/wmspanel/libstream/RtmpChunkStream;->E()Z

    move-result v0

    goto :goto_0

    :pswitch_2
    move v0, v1

    .line 290
    goto :goto_0

    .line 292
    :pswitch_3
    invoke-virtual {p0}, Lcom/wmspanel/libstream/RtmpChunkStream;->F()Z

    move-result v0

    goto :goto_0

    :pswitch_4
    move v0, v1

    .line 296
    goto :goto_0

    .line 298
    :pswitch_5
    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/RtmpChunkStream;->b(Ljava/lang/Boolean;)Z

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    .line 308
    goto :goto_0

    .line 313
    :cond_1
    iget-byte v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->as:B

    packed-switch v0, :pswitch_data_1

    move v0, v1

    .line 318
    goto :goto_0

    .line 315
    :pswitch_6
    iget-object v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/RtmpChunkStream;->d(Ljava/nio/ByteBuffer;)Z

    move-result v0

    goto :goto_0

    .line 281
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_5
        :pswitch_3
        :pswitch_4
    .end packed-switch

    .line 313
    :pswitch_data_1
    .packed-switch 0x14
        :pswitch_6
    .end packed-switch
.end method

.method a(Ljava/nio/ByteBuffer;ID)Z
    .locals 5

    .prologue
    .line 660
    :try_start_0
    invoke-static {p1, p2}, Lcom/wmspanel/libstream/j;->f(Ljava/nio/ByteBuffer;I)V

    .line 661
    add-int/lit8 v0, p2, 0x1

    .line 663
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->h(Ljava/nio/ByteBuffer;I)D

    move-result-wide v2

    .line 664
    add-int/lit8 v0, v0, 0x9

    .line 666
    iget-object v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    invoke-virtual {v0, p3, p4, v2, v3}, Lcom/wmspanel/libstream/i;->a(DD)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 672
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 668
    :catch_0
    move-exception v0

    .line 669
    const-string/jumbo v1, "RtmpChunkStream"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 670
    const/4 v0, 0x0

    goto :goto_0
.end method

.method b(Ljava/lang/Boolean;)Z
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x2

    const/4 v4, 0x6

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 359
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 360
    iget v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ar:I

    if-eq v2, v4, :cond_1

    .line 386
    :cond_0
    :goto_0
    return v0

    .line 364
    :cond_1
    iget-object v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    iget-object v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    add-int/2addr v2, v3

    .line 366
    if-ne v2, v4, :cond_0

    .line 368
    const/16 v2, 0xc

    new-array v2, v2, [B

    .line 369
    aput-byte v5, v2, v1

    .line 370
    aput-byte v4, v2, v4

    .line 371
    const/4 v3, 0x7

    aput-byte v6, v2, v3

    .line 373
    new-array v3, v5, [B

    fill-array-data v3, :array_0

    .line 376
    :try_start_0
    iget-object v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    invoke-virtual {v4, v2}, Lcom/wmspanel/libstream/i;->a([B)V

    .line 377
    iget-object v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    invoke-virtual {v2, v3}, Lcom/wmspanel/libstream/i;->a([B)V

    .line 378
    iget-object v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    iget-object v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    const/4 v4, 0x2

    const/4 v5, 0x4

    invoke-virtual {v2, v3, v4, v5}, Lcom/wmspanel/libstream/i;->send([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    goto :goto_0

    .line 380
    :catch_0
    move-exception v0

    .line 381
    const-string/jumbo v2, "RtmpChunkStream"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 382
    goto :goto_0

    .line 373
    :array_0
    .array-data 1
        0x0t
        0x7t
    .end array-data
.end method

.method c(Ljava/nio/ByteBuffer;)I
    .locals 9

    .prologue
    const v8, 0xffffff

    const/4 v7, 0x4

    const/4 v1, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 76
    iput v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ay:I

    .line 83
    iget-boolean v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->am:Z

    if-eqz v0, :cond_12

    .line 87
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    .line 88
    and-int/lit16 v4, v0, 0xff

    shr-int/lit8 v4, v4, 0x6

    .line 91
    and-int/lit16 v0, v0, 0xff

    and-int/lit8 v5, v0, 0x3f

    .line 93
    if-nez v5, :cond_1

    move v0, v1

    .line 101
    :goto_0
    iget-boolean v6, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->al:Z

    if-nez v6, :cond_2

    if-eqz v4, :cond_2

    .line 102
    const-string/jumbo v0, "RtmpChunkStream"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "first message for chunk stream must be fmt type 0, fmt="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 103
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", init="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->al:Z

    .line 104
    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", cs_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 105
    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 102
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v1

    .line 269
    :cond_0
    :goto_1
    return v2

    .line 95
    :cond_1
    if-ne v5, v2, :cond_11

    .line 96
    const/4 v0, 0x3

    goto :goto_0

    .line 109
    :cond_2
    invoke-virtual {p0, v4}, Lcom/wmspanel/libstream/RtmpChunkStream;->e(I)I

    move-result v5

    .line 111
    add-int/2addr v5, v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v6

    if-gt v5, v6, :cond_0

    .line 115
    add-int/2addr v0, v3

    .line 119
    packed-switch v4, :pswitch_data_0

    .line 190
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    if-lt v4, v8, :cond_3

    .line 191
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {p0, v0, v3, v4}, Lcom/wmspanel/libstream/RtmpChunkStream;->a(III)I

    move-result v4

    if-lt v4, v7, :cond_0

    .line 192
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->d(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    .line 193
    add-int/lit8 v0, v0, 0x4

    .line 199
    :cond_3
    iget-object v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-nez v4, :cond_4

    .line 200
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    iget v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    .line 207
    :cond_4
    :goto_2
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ar:I

    iget-object v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    sub-int/2addr v4, v5

    iget-object v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    invoke-virtual {v5}, Lcom/wmspanel/libstream/i;->L()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->au:I

    .line 209
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->au:I

    if-nez v4, :cond_9

    .line 210
    iput-boolean v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->am:Z

    .line 211
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;I)V

    .line 212
    const/16 v2, 0x8

    goto :goto_1

    .line 124
    :pswitch_0
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->c(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    .line 125
    add-int/lit8 v4, v0, 0x3

    invoke-static {p1, v4}, Lcom/wmspanel/libstream/j;->c(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ar:I

    .line 126
    add-int/lit8 v4, v0, 0x6

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v4

    iput-byte v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->as:B

    .line 127
    add-int/lit8 v4, v0, 0x7

    invoke-static {p1, v4}, Lcom/wmspanel/libstream/j;->e(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->at:I

    .line 129
    iget-boolean v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->al:Z

    if-nez v4, :cond_5

    .line 130
    iput-boolean v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->al:Z

    .line 133
    :cond_5
    add-int/lit8 v0, v0, 0xb

    .line 135
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    if-ne v4, v8, :cond_6

    .line 136
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {p0, v0, v3, v4}, Lcom/wmspanel/libstream/RtmpChunkStream;->a(III)I

    move-result v4

    if-lt v4, v7, :cond_0

    .line 137
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->d(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    .line 138
    add-int/lit8 v0, v0, 0x4

    .line 144
    :cond_6
    iget-object v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lcom/wmspanel/libstream/j;->i(Ljava/nio/ByteBuffer;)V

    goto :goto_2

    .line 149
    :pswitch_1
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->c(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    .line 150
    add-int/lit8 v4, v0, 0x3

    invoke-static {p1, v4}, Lcom/wmspanel/libstream/j;->c(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ar:I

    .line 151
    add-int/lit8 v4, v0, 0x6

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v4

    iput-byte v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->as:B

    .line 153
    add-int/lit8 v0, v0, 0x7

    .line 155
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    if-ne v4, v8, :cond_7

    .line 156
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {p0, v0, v3, v4}, Lcom/wmspanel/libstream/RtmpChunkStream;->a(III)I

    move-result v4

    if-lt v4, v7, :cond_0

    .line 157
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->d(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    .line 158
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    iget v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    .line 159
    add-int/lit8 v0, v0, 0x4

    .line 167
    :goto_3
    iget-object v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lcom/wmspanel/libstream/j;->i(Ljava/nio/ByteBuffer;)V

    goto/16 :goto_2

    .line 164
    :cond_7
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    iget v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    goto :goto_3

    .line 172
    :pswitch_2
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->c(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    .line 173
    add-int/lit8 v0, v0, 0x3

    .line 175
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    if-ne v4, v8, :cond_8

    .line 176
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {p0, v0, v3, v4}, Lcom/wmspanel/libstream/RtmpChunkStream;->a(III)I

    move-result v4

    if-lt v4, v7, :cond_0

    .line 177
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->d(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    .line 178
    add-int/lit8 v0, v0, 0x4

    .line 179
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    iget v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    goto/16 :goto_2

    .line 184
    :cond_8
    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    iget v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aq:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ap:I

    goto/16 :goto_2

    .line 215
    :cond_9
    iput v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->av:I

    .line 216
    iput-boolean v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->am:Z

    .line 219
    :goto_4
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    invoke-virtual {p0, v0, v3, v4}, Lcom/wmspanel/libstream/RtmpChunkStream;->a(III)I

    move-result v4

    iget v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->au:I

    iget v6, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->av:I

    sub-int/2addr v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 221
    if-nez v4, :cond_a

    .line 222
    sub-int/2addr v0, v3

    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;I)V

    goto/16 :goto_1

    .line 227
    :cond_a
    :try_start_0
    iget-object v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    invoke-virtual {v5, v6, v0, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    add-int/2addr v0, v4

    .line 234
    iget v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->av:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->av:I

    .line 236
    sub-int/2addr v0, v3

    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->a(Ljava/nio/ByteBuffer;I)V

    .line 238
    iget v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->au:I

    iget v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->av:I

    if-ne v0, v4, :cond_0

    .line 239
    iput-boolean v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->am:Z

    .line 240
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 242
    iget-object v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ao:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    iget v5, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ar:I

    if-ne v4, v5, :cond_f

    .line 243
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/RtmpChunkStream;->a(Ljava/lang/Boolean;)Z

    move-result v4

    if-nez v4, :cond_c

    .line 245
    iget-boolean v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aj:Z

    if-eqz v0, :cond_b

    .line 246
    const/16 v1, 0x22

    :cond_b
    move v2, v1

    .line 247
    goto/16 :goto_1

    .line 228
    :catch_0
    move-exception v0

    .line 229
    const-string/jumbo v2, "RtmpChunkStream"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v1

    .line 230
    goto/16 :goto_1

    .line 250
    :cond_c
    iget-boolean v1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ax:Z

    if-nez v1, :cond_d

    .line 251
    const/4 v1, -0x1

    iput v1, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ay:I

    .line 252
    iput-boolean v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ax:Z

    .line 255
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 256
    iget-boolean v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->az:Z

    if-eqz v0, :cond_e

    const/16 v3, 0x10

    :cond_e
    or-int/lit8 v2, v3, 0xc

    goto/16 :goto_1

    .line 260
    :cond_f
    iget-boolean v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ax:Z

    if-eqz v0, :cond_10

    .line 261
    iput v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ay:I

    .line 262
    iput-boolean v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ax:Z

    .line 266
    :cond_10
    const/16 v2, 0x8

    goto/16 :goto_1

    :cond_11
    move v0, v2

    goto/16 :goto_0

    :cond_12
    move v0, v3

    goto/16 :goto_4

    .line 119
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method d(Ljava/nio/ByteBuffer;)Z
    .locals 10

    .prologue
    const-wide/high16 v8, -0x4010000000000000L    # -1.0

    const/4 v7, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 394
    iput-boolean v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aj:Z

    .line 399
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->g(Ljava/nio/ByteBuffer;I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 405
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x3

    add-int/2addr v3, v2

    .line 407
    const-string/jumbo v4, "_result"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 411
    :try_start_1
    invoke-static {p1, v3}, Lcom/wmspanel/libstream/j;->h(Ljava/nio/ByteBuffer;I)D
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v4

    .line 418
    add-int/lit8 v0, v3, 0x9

    .line 420
    iget-object v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    invoke-virtual {v3, v4, v5}, Lcom/wmspanel/libstream/i;->a(D)Lcom/wmspanel/libstream/i$a;

    move-result-object v3

    .line 423
    sget-object v6, Lcom/wmspanel/libstream/RtmpChunkStream$1;->aA:[I

    invoke-virtual {v3}, Lcom/wmspanel/libstream/i$a;->ordinal()I

    move-result v3

    aget v3, v6, v3

    packed-switch v3, :pswitch_data_0

    .line 588
    :cond_0
    :goto_0
    return v1

    .line 400
    :catch_0
    move-exception v0

    .line 401
    const-string/jumbo v1, "RtmpChunkStream"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v2

    .line 402
    goto :goto_0

    .line 412
    :catch_1
    move-exception v0

    .line 413
    const-string/jumbo v1, "RtmpChunkStream"

    const-string/jumbo v3, "failed to process transaction id for _result command"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    const-string/jumbo v1, "RtmpChunkStream"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v2

    .line 415
    goto :goto_0

    .line 425
    :pswitch_0
    const-string/jumbo v0, "RtmpChunkStream"

    const-string/jumbo v1, "unknown command _result response"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v2

    .line 426
    goto :goto_0

    .line 430
    :pswitch_1
    iget-object v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    iget v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->at:I

    int-to-double v2, v2

    invoke-virtual {v0, v4, v5, v2, v3}, Lcom/wmspanel/libstream/i;->a(DD)V

    goto :goto_0

    .line 434
    :pswitch_2
    invoke-virtual {p0, p1, v0, v4, v5}, Lcom/wmspanel/libstream/RtmpChunkStream;->a(Ljava/nio/ByteBuffer;ID)Z

    goto :goto_0

    .line 440
    :cond_1
    const-string/jumbo v4, "onStatus"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 443
    :try_start_2
    invoke-static {p1, v3}, Lcom/wmspanel/libstream/j;->h(Ljava/nio/ByteBuffer;I)D
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 450
    add-int/lit8 v0, v3, 0x9

    .line 454
    :try_start_3
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->f(Ljava/nio/ByteBuffer;I)V

    .line 455
    add-int/lit8 v0, v0, 0x1

    .line 457
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->i(Ljava/nio/ByteBuffer;I)V

    .line 458
    add-int/lit8 v0, v0, 0x1

    move v3, v0

    move v0, v2

    .line 463
    :cond_2
    :goto_1
    invoke-static {p1, v3}, Lcom/wmspanel/libstream/j;->k(Ljava/nio/ByteBuffer;I)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    move-result-object v4

    .line 465
    if-nez v4, :cond_4

    .line 492
    :cond_3
    if-eqz v0, :cond_5

    move v1, v2

    .line 493
    goto :goto_0

    .line 444
    :catch_2
    move-exception v0

    .line 446
    const-string/jumbo v1, "RtmpChunkStream"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v2

    .line 447
    goto :goto_0

    .line 470
    :cond_4
    :try_start_4
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x2

    add-int/2addr v3, v5

    .line 472
    invoke-static {p1, v3}, Lcom/wmspanel/libstream/j;->j(Ljava/nio/ByteBuffer;I)I

    move-result v5

    .line 474
    if-ne v5, v7, :cond_3

    .line 475
    invoke-static {p1, v3}, Lcom/wmspanel/libstream/j;->g(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v5

    .line 476
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x3

    add-int/2addr v3, v6

    .line 479
    const-string/jumbo v6, "level"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const-string/jumbo v4, "error"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    move-result v4

    if-eqz v4, :cond_2

    move v0, v1

    .line 480
    goto :goto_1

    .line 487
    :catch_3
    move-exception v0

    .line 488
    const-string/jumbo v1, "RtmpChunkStream"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v2

    .line 489
    goto/16 :goto_0

    .line 496
    :cond_5
    iget-object v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    invoke-virtual {v0, v8, v9}, Lcom/wmspanel/libstream/i;->a(D)Lcom/wmspanel/libstream/i$a;

    move-result-object v0

    .line 498
    sget-object v2, Lcom/wmspanel/libstream/i$a;->bE:Lcom/wmspanel/libstream/i$a;

    if-ne v0, v2, :cond_0

    .line 499
    iget-object v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    iget v2, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->at:I

    int-to-double v2, v2

    invoke-virtual {v0, v8, v9, v2, v3}, Lcom/wmspanel/libstream/i;->a(DD)V

    goto/16 :goto_0

    .line 502
    :cond_6
    const-string/jumbo v4, "_error"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 503
    const-string/jumbo v0, "RtmpChunkStream"

    const-string/jumbo v1, "_error response received"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    :try_start_5
    invoke-static {p1, v3}, Lcom/wmspanel/libstream/j;->h(Ljava/nio/ByteBuffer;I)D

    move-result-wide v0

    .line 509
    add-int/lit8 v3, v3, 0x9

    .line 511
    iget-object v4, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    invoke-virtual {v4, v0, v1}, Lcom/wmspanel/libstream/i;->a(D)Lcom/wmspanel/libstream/i$a;

    move-result-object v0

    .line 512
    sget-object v1, Lcom/wmspanel/libstream/i$a;->bC:Lcom/wmspanel/libstream/i$a;

    if-ne v0, v1, :cond_7

    .line 515
    invoke-static {p1, v3}, Lcom/wmspanel/libstream/j;->f(Ljava/nio/ByteBuffer;I)V

    .line 516
    add-int/lit8 v0, v3, 0x1

    .line 518
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->i(Ljava/nio/ByteBuffer;I)V

    .line 519
    add-int/lit8 v0, v0, 0x1

    .line 524
    :goto_2
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->k(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v3

    .line 526
    if-nez v3, :cond_8

    :cond_7
    move v1, v2

    .line 585
    goto/16 :goto_0

    .line 531
    :cond_8
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    .line 533
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->j(Ljava/nio/ByteBuffer;I)I

    move-result v1

    .line 535
    if-ne v1, v7, :cond_7

    .line 536
    invoke-static {p1, v0}, Lcom/wmspanel/libstream/j;->g(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v4

    .line 537
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x3

    add-int/2addr v1, v0

    .line 539
    const-string/jumbo v0, "description"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const-string/jumbo v0, "AccessManager.Reject"

    .line 540
    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 541
    const-string/jumbo v0, "RtmpChunkStream"

    const-string/jumbo v3, "AccessManager.Reject"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->aj:Z

    .line 544
    const-string/jumbo v0, "authmod=llnw"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    move v0, v1

    .line 545
    goto :goto_2

    .line 547
    :cond_9
    const-string/jumbo v0, "?"

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 548
    const/4 v3, -0x1

    if-eq v0, v3, :cond_11

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v0, v3, :cond_a

    move v0, v1

    .line 549
    goto :goto_2

    .line 551
    :cond_a
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v4, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 552
    new-instance v3, Ljava/util/ArrayList;

    const-string/jumbo v4, "&"

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 553
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 554
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_b
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 555
    new-instance v5, Ljava/util/ArrayList;

    const-string/jumbo v6, "="

    invoke-virtual {v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 556
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v0, v7, :cond_b

    .line 559
    const/4 v0, 0x0

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_3

    .line 581
    :catch_4
    move-exception v0

    .line 582
    const-string/jumbo v1, "RtmpChunkStream"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v2

    .line 583
    goto/16 :goto_0

    .line 561
    :cond_c
    :try_start_6
    const-string/jumbo v0, "reason"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 562
    if-nez v0, :cond_d

    move v0, v1

    .line 563
    goto/16 :goto_2

    .line 565
    :cond_d
    const-string/jumbo v3, "needauth"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    move v0, v1

    .line 566
    goto/16 :goto_2

    .line 568
    :cond_e
    const-string/jumbo v0, "nonce"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 569
    if-nez v0, :cond_f

    move v0, v1

    .line 570
    goto/16 :goto_2

    .line 572
    :cond_f
    iget-object v3, p0, Lcom/wmspanel/libstream/RtmpChunkStream;->ak:Lcom/wmspanel/libstream/i;

    invoke-virtual {v3, v0}, Lcom/wmspanel/libstream/i;->b(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    :cond_10
    move v0, v1

    .line 579
    goto/16 :goto_2

    :cond_11
    move v0, v1

    goto/16 :goto_2

    .line 423
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method e(I)I
    .locals 1

    .prologue
    .line 34
    packed-switch p1, :pswitch_data_0

    .line 43
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 36
    :pswitch_0
    const/16 v0, 0xb

    goto :goto_0

    .line 38
    :pswitch_1
    const/4 v0, 0x7

    goto :goto_0

    .line 40
    :pswitch_2
    const/4 v0, 0x3

    goto :goto_0

    .line 34
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
