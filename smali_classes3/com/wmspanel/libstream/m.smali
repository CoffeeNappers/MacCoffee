.class Lcom/wmspanel/libstream/m;
.super Lcom/wmspanel/libstream/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/m$a;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RtspConnection"


# instance fields
.field bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

.field bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

.field private bs:I

.field private bw:J

.field private cA:J

.field private cB:J

.field private cC:I

.field private cD:J

.field private cE:J

.field private cF:I

.field private final cG:I

.field private cH:I

.field private cI:Ljava/lang/String;

.field private cJ:Ljava/lang/String;

.field private cK:Ljava/lang/String;

.field cL:I

.field private cp:Lcom/wmspanel/libstream/m$a;

.field private cq:Lcom/wmspanel/libstream/Streamer$STATUS;

.field private cr:Lcom/wmspanel/libstream/n;

.field private cs:Ljava/lang/String;

.field private ct:Ljava/lang/String;

.field private cu:Ljava/lang/String;

.field private cv:[B

.field final cw:J

.field final cx:I

.field private cy:Lcom/wmspanel/libstream/BufferItem;

.field private cz:I


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$MODE;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/wmspanel/libstream/a;-><init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$MODE;Ljava/lang/String;I)V

    .line 37
    const/16 v0, 0x20

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cv:[B

    .line 113
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/wmspanel/libstream/m;->bw:J

    .line 114
    const-wide v0, 0x100000000L

    iput-wide v0, p0, Lcom/wmspanel/libstream/m;->cw:J

    .line 115
    const v0, 0x15f90

    iput v0, p0, Lcom/wmspanel/libstream/m;->cx:I

    .line 155
    const/4 v0, -0x1

    iput v0, p0, Lcom/wmspanel/libstream/m;->bs:I

    .line 438
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/m;->cz:I

    .line 439
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/wmspanel/libstream/m;->cA:J

    .line 440
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/wmspanel/libstream/m;->cB:J

    .line 442
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/m;->cC:I

    .line 443
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/wmspanel/libstream/m;->cD:J

    .line 444
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/wmspanel/libstream/m;->cE:J

    .line 468
    const/4 v0, 0x0

    iput v0, p0, Lcom/wmspanel/libstream/m;->cF:I

    .line 469
    const/16 v0, 0x4e20

    iput v0, p0, Lcom/wmspanel/libstream/m;->cG:I

    .line 470
    const/4 v0, 0x0

    iput v0, p0, Lcom/wmspanel/libstream/m;->cH:I

    .line 646
    const/4 v0, 0x1

    iput v0, p0, Lcom/wmspanel/libstream/m;->cL:I

    .line 42
    iput-object p4, p0, Lcom/wmspanel/libstream/m;->cs:Ljava/lang/String;

    .line 43
    iput-object p7, p0, Lcom/wmspanel/libstream/m;->ct:Ljava/lang/String;

    .line 44
    iput-object p8, p0, Lcom/wmspanel/libstream/m;->cu:Ljava/lang/String;

    .line 46
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cN:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    .line 47
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->CONN_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cq:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 49
    new-instance v0, Lcom/wmspanel/libstream/n;

    invoke-direct {v0}, Lcom/wmspanel/libstream/n;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    .line 51
    return-void
.end method

.method private S()J
    .locals 8

    .prologue
    const-wide/16 v6, 0x3e8

    .line 432
    .line 433
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 434
    div-long v2, v0, v6

    const-wide v4, 0x83aa7e80L

    add-long/2addr v2, v4

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    rem-long/2addr v0, v6

    const-wide v4, 0x100000000L

    mul-long/2addr v0, v4

    div-long/2addr v0, v6

    add-long/2addr v0, v2

    .line 435
    return-wide v0
.end method

.method private T()V
    .locals 5

    .prologue
    const/16 v4, 0xc8

    const/16 v3, 0x191

    .line 519
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    const-string/jumbo v1, "WWW-Authenticate-Digest-realm"

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/n;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 520
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    const-string/jumbo v2, "WWW-Authenticate-Digest-nonce"

    invoke-virtual {v1, v2}, Lcom/wmspanel/libstream/n;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 521
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 522
    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cJ:Ljava/lang/String;

    .line 523
    iput-object v1, p0, Lcom/wmspanel/libstream/m;->cI:Ljava/lang/String;

    .line 526
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    const-string/jumbo v1, "WWW-Authenticate-Basic-realm"

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/n;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 527
    if-eqz v0, :cond_1

    .line 528
    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cK:Ljava/lang/String;

    .line 531
    :cond_1
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 640
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    .line 643
    :cond_2
    :goto_0
    return-void

    .line 533
    :pswitch_0
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-ne v3, v0, :cond_3

    .line 535
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->V()V

    .line 536
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cP:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto :goto_0

    .line 541
    :cond_3
    :pswitch_1
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-eq v4, v0, :cond_5

    .line 542
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-ne v3, v0, :cond_4

    .line 543
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cq:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 545
    :cond_4
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto :goto_0

    .line 549
    :cond_5
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->SETUP:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->SUCCESS:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/m;->a(Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V

    .line 551
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->Q()V

    goto :goto_0

    .line 555
    :pswitch_2
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-ne v3, v0, :cond_6

    .line 557
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->W()V

    .line 558
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cS:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto :goto_0

    .line 563
    :cond_6
    :pswitch_3
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-eq v4, v0, :cond_8

    .line 564
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-ne v3, v0, :cond_7

    .line 565
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cq:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 567
    :cond_7
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto :goto_0

    .line 571
    :cond_8
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_9

    .line 572
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->Y()V

    .line 573
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cU:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto :goto_0

    .line 577
    :cond_9
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->X()V

    .line 578
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cT:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto :goto_0

    .line 582
    :pswitch_4
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-eq v4, v0, :cond_b

    .line 583
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-ne v3, v0, :cond_a

    .line 584
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cq:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 586
    :cond_a
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto/16 :goto_0

    .line 590
    :cond_b
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_c

    .line 591
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->Z()V

    .line 592
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cV:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto/16 :goto_0

    .line 596
    :cond_c
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->Y()V

    .line 597
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cU:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto/16 :goto_0

    .line 601
    :pswitch_5
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-eq v4, v0, :cond_e

    .line 602
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-ne v3, v0, :cond_d

    .line 603
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cq:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 605
    :cond_d
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto/16 :goto_0

    .line 609
    :cond_e
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->Z()V

    .line 610
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cV:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto/16 :goto_0

    .line 614
    :pswitch_6
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-eq v4, v0, :cond_10

    .line 615
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-ne v3, v0, :cond_f

    .line 616
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cq:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 618
    :cond_f
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto/16 :goto_0

    .line 622
    :cond_10
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->RECORD:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->SUCCESS:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/m;->a(Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V

    .line 623
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cW:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto/16 :goto_0

    .line 630
    :pswitch_7
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-eq v4, v0, :cond_2

    .line 631
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/n;->ab()I

    move-result v0

    if-ne v3, v0, :cond_11

    .line 632
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cq:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 634
    :cond_11
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto/16 :goto_0

    .line 531
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_7
        :pswitch_7
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private U()Ljava/lang/String;
    .locals 3

    .prologue
    .line 649
    const-string/jumbo v0, ""

    .line 651
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    const-string/jumbo v2, "Session"

    invoke-virtual {v1, v2}, Lcom/wmspanel/libstream/n;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 652
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 653
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "Session: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 655
    :cond_0
    return-object v0
.end method

.method private V()V
    .locals 3

    .prologue
    .line 687
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "OPTIONS "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " RTSP/1.0\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 688
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "CSeq: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/wmspanel/libstream/m;->cL:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/wmspanel/libstream/m;->cL:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 689
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "User-Agent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->z()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 690
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "OPTIONS"

    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/m;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 691
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 694
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/m;->a(Ljava/lang/String;)V

    .line 695
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cO:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 700
    :goto_0
    return-void

    .line 696
    :catch_0
    move-exception v0

    .line 697
    const-string/jumbo v1, "RtspConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 698
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto :goto_0
.end method

.method private W()V
    .locals 10

    .prologue
    const/16 v9, 0x10

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v5, 0x0

    const/4 v6, -0x1

    .line 703
    const-string/jumbo v0, "v=0\r\n"

    .line 705
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v1, v2, :cond_2

    .line 707
    :cond_0
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    if-nez v1, :cond_1

    .line 708
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    .line 782
    :goto_0
    return-void

    .line 712
    :cond_1
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    iget-object v1, v1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    const/4 v2, 0x3

    invoke-static {v1, v7, v2}, Lcom/wmspanel/libstream/o;->g([BII)Ljava/lang/String;

    move-result-object v1

    .line 713
    iget-object v2, p0, Lcom/wmspanel/libstream/m;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    iget-object v2, v2, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    iget-object v3, p0, Lcom/wmspanel/libstream/m;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    iget v3, v3, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    invoke-static {v2, v5, v3, v8}, Landroid/util/Base64;->encodeToString([BIII)Ljava/lang/String;

    move-result-object v2

    .line 714
    iget-object v3, p0, Lcom/wmspanel/libstream/m;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    iget-object v3, v3, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_buf:[B

    iget-object v4, p0, Lcom/wmspanel/libstream/m;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    iget v4, v4, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    invoke-static {v3, v5, v4, v8}, Landroid/util/Base64;->encodeToString([BIII)Ljava/lang/String;

    move-result-object v3

    .line 716
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, "m=video 0 RTP/AVP/TCP 96\r\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 717
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, "a=rtpmap:96 H264/90000\r\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 718
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, "a=fmtp:96 packetization-mode=1; sprop-parameter-sets="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "; profile-level-id="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 719
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "a=control:streamid=0\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 722
    :cond_2
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v1, v2, :cond_3

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v1, v2, :cond_8

    .line 724
    :cond_3
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    if-nez v1, :cond_4

    .line 725
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto/16 :goto_0

    .line 729
    :cond_4
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget-object v1, v1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configBuf:[B

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v2, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configLen:I

    invoke-static {v1, v5, v2}, Lcom/wmspanel/libstream/o;->g([BII)Ljava/lang/String;

    move-result-object v1

    .line 731
    iget-object v2, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v2, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    if-ne v2, v6, :cond_6

    .line 732
    new-array v2, v9, [I

    fill-array-data v2, :array_0

    .line 734
    iget-object v3, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v3, v3, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configLen:I

    if-ge v3, v7, :cond_5

    .line 735
    const-string/jumbo v0, "RtspConnection"

    const-string/jumbo v1, "failed to parse audio format params"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 736
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto/16 :goto_0

    .line 740
    :cond_5
    iget-object v3, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget-object v4, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget-object v4, v4, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configBuf:[B

    aget-byte v4, v4, v5

    and-int/lit8 v4, v4, 0x7

    shl-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget-object v5, v5, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configBuf:[B

    aget-byte v5, v5, v7

    shr-int/lit8 v5, v5, 0x7

    and-int/lit8 v5, v5, 0x1

    or-int/2addr v4, v5

    aget v2, v2, v4

    iput v2, v3, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    .line 741
    iget-object v2, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v2, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    if-ne v2, v6, :cond_6

    .line 742
    const-string/jumbo v0, "RtspConnection"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "failed to get sample rate, config="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 743
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto/16 :goto_0

    .line 748
    :cond_6
    iget-object v2, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v2, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->channelCount:I

    if-ne v2, v6, :cond_7

    .line 749
    new-array v2, v9, [I

    fill-array-data v2, :array_1

    .line 751
    iget-object v3, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget-object v4, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget-object v4, v4, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configBuf:[B

    aget-byte v4, v4, v7

    shr-int/lit8 v4, v4, 0x3

    and-int/lit8 v4, v4, 0xf

    aget v2, v2, v4

    iput v2, v3, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->channelCount:I

    .line 752
    iget-object v2, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v2, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->channelCount:I

    if-ne v2, v6, :cond_7

    .line 753
    const-string/jumbo v0, "RtspConnection"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "failed to get channel count, config="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto/16 :goto_0

    .line 759
    :cond_7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "m=audio 0 RTP/AVP/TCP 97\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 760
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "a=rtpmap:97 mpeg4-generic/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v2, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v2, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->channelCount:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 761
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "a=fmtp:97 profile-level-id=1;mode=AAC-hbr;sizelength=13;indexlength=3;indexdeltalength=3;config="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 762
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "a=control:streamid=1\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 765
    :cond_8
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ANNOUNCE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cs:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " RTSP/1.0\r\nContent-Type: application/sdp\r\nCSeq: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/wmspanel/libstream/m;->cL:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/wmspanel/libstream/m;->cL:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\r\nUser-Agent: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->c:Lcom/wmspanel/libstream/d;

    .line 768
    invoke-virtual {v2}, Lcom/wmspanel/libstream/d;->z()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 770
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "Content-Length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 771
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->U()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 772
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "ANNOUNCE"

    invoke-direct {p0, v2}, Lcom/wmspanel/libstream/m;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 773
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 774
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 777
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/m;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 778
    :catch_0
    move-exception v0

    .line 779
    const-string/jumbo v1, "RtspConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 780
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto/16 :goto_0

    .line 732
    nop

    :array_0
    .array-data 4
        0x17700
        0x15888
        0xfa00
        0xbb80
        0xac44
        0x7d00
        0x5dc0
        0x5622
        0x3e80
        0x2ee0
        0x2b11
        0x1f40
        0x1cb6
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 749
    :array_1
    .array-data 4
        -0x1
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x8
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data
.end method

.method private X()V
    .locals 3

    .prologue
    .line 786
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SETUP "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/streamid=0 RTSP/1.0\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 787
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "Transport: RTP/AVP/TCP;unicast;interleaved=0-1;mode=record\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 788
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "CSeq: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/wmspanel/libstream/m;->cL:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/wmspanel/libstream/m;->cL:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 789
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "User-Agent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->z()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 791
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->U()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 792
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "SETUP"

    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/m;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 793
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 796
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/m;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 801
    :goto_0
    return-void

    .line 797
    :catch_0
    move-exception v0

    .line 798
    const-string/jumbo v1, "RtspConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 799
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto :goto_0
.end method

.method private Y()V
    .locals 3

    .prologue
    .line 804
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SETUP "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/streamid=1 RTSP/1.0\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 805
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "Transport: RTP/AVP/TCP;unicast;interleaved=2-3;mode=record\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 806
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "CSeq: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/wmspanel/libstream/m;->cL:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/wmspanel/libstream/m;->cL:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 807
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "User-Agent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->z()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 808
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->U()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 809
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "SETUP"

    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/m;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 810
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 813
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/m;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 818
    :goto_0
    return-void

    .line 814
    :catch_0
    move-exception v0

    .line 815
    const-string/jumbo v1, "RtspConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 816
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto :goto_0
.end method

.method private Z()V
    .locals 3

    .prologue
    .line 821
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "RECORD "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " RTSP/1.0\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 822
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "Range: npt=0.000-\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 823
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "CSeq: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/wmspanel/libstream/m;->cL:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/wmspanel/libstream/m;->cL:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 824
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "User-Agent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/d;->z()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 826
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->U()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 827
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "RECORD"

    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/m;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 828
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 831
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/m;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 836
    :goto_0
    return-void

    .line 832
    :catch_0
    move-exception v0

    .line 833
    const-string/jumbo v1, "RtspConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 834
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    goto :goto_0
.end method

.method private a(Lcom/wmspanel/libstream/BufferItem;I)I
    .locals 8

    .prologue
    const/16 v0, 0x4e20

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 388
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v1

    array-length v2, v1

    .line 390
    sub-int v1, v2, p2

    .line 391
    if-le v1, v0, :cond_2

    .line 395
    :goto_0
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cv:[B

    invoke-static {v1}, Lcom/wmspanel/libstream/l;->e([B)Lcom/wmspanel/libstream/l;

    move-result-object v1

    .line 396
    add-int/lit8 v3, v0, 0xe

    invoke-virtual {v1, v6, v3}, Lcom/wmspanel/libstream/l;->a(II)Lcom/wmspanel/libstream/l;

    .line 397
    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Lcom/wmspanel/libstream/l;->a(B)Lcom/wmspanel/libstream/l;

    .line 398
    const/16 v3, 0x60

    invoke-virtual {v1, v3}, Lcom/wmspanel/libstream/l;->f(B)Lcom/wmspanel/libstream/l;

    .line 399
    iget v3, p0, Lcom/wmspanel/libstream/m;->cF:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/wmspanel/libstream/m;->cF:I

    invoke-virtual {v1, v3}, Lcom/wmspanel/libstream/l;->m(I)Lcom/wmspanel/libstream/l;

    .line 400
    invoke-virtual {v1, v7}, Lcom/wmspanel/libstream/l;->e(B)Lcom/wmspanel/libstream/l;

    .line 402
    const v3, 0x15f90

    invoke-virtual {p0, p1, v3}, Lcom/wmspanel/libstream/m;->c(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v4

    .line 403
    long-to-int v3, v4

    invoke-virtual {v1, v3}, Lcom/wmspanel/libstream/l;->n(I)Lcom/wmspanel/libstream/l;

    .line 404
    iget v3, p0, Lcom/wmspanel/libstream/m;->cz:I

    invoke-virtual {v1, v3}, Lcom/wmspanel/libstream/l;->o(I)Lcom/wmspanel/libstream/l;

    .line 406
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v3

    .line 407
    aget-byte v4, v3, v6

    shr-int/lit8 v4, v4, 0x5

    and-int/lit8 v4, v4, 0x3

    int-to-byte v4, v4

    .line 408
    aget-byte v5, v3, v6

    and-int/lit8 v5, v5, 0x1f

    int-to-byte v5, v5

    .line 410
    invoke-virtual {v1, v4}, Lcom/wmspanel/libstream/l;->g(B)V

    .line 412
    if-ne p2, v7, :cond_0

    .line 413
    invoke-virtual {v1, v5, v7, v6}, Lcom/wmspanel/libstream/l;->a(BZZ)V

    .line 421
    :goto_1
    :try_start_0
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cv:[B

    const/4 v2, 0x0

    const/16 v4, 0x12

    invoke-virtual {p0, v1, v2, v4}, Lcom/wmspanel/libstream/m;->append([BII)V

    .line 422
    invoke-virtual {p0, v3, p2, v0}, Lcom/wmspanel/libstream/m;->send([BII)V

    .line 423
    iget-wide v2, p0, Lcom/wmspanel/libstream/m;->o:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/wmspanel/libstream/m;->o:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 428
    :goto_2
    return v0

    .line 414
    :cond_0
    add-int v4, p2, v0

    if-lt v4, v2, :cond_1

    .line 415
    invoke-virtual {v1, v5, v6, v7}, Lcom/wmspanel/libstream/l;->a(BZZ)V

    goto :goto_1

    .line 417
    :cond_1
    invoke-virtual {v1, v5, v6, v6}, Lcom/wmspanel/libstream/l;->a(BZZ)V

    goto :goto_1

    .line 424
    :catch_0
    move-exception v0

    .line 425
    const-string/jumbo v1, "RtspConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    const/4 v0, -0x1

    goto :goto_2

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method private a(IIJJ)Z
    .locals 5

    .prologue
    const/16 v3, 0x1c

    const/4 v0, 0x0

    .line 449
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cv:[B

    invoke-static {v1}, Lcom/wmspanel/libstream/l;->e([B)Lcom/wmspanel/libstream/l;

    move-result-object v1

    .line 450
    invoke-virtual {v1, p1, v3}, Lcom/wmspanel/libstream/l;->a(II)Lcom/wmspanel/libstream/l;

    .line 451
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/wmspanel/libstream/l;->a(B)Lcom/wmspanel/libstream/l;

    .line 452
    const/16 v2, -0x38

    invoke-virtual {v1, v2}, Lcom/wmspanel/libstream/l;->i(B)V

    .line 453
    invoke-virtual {v1, v3}, Lcom/wmspanel/libstream/l;->p(I)V

    .line 454
    invoke-virtual {v1, p2}, Lcom/wmspanel/libstream/l;->q(I)V

    .line 455
    invoke-virtual {v1, p3, p4}, Lcom/wmspanel/libstream/l;->b(J)V

    .line 456
    invoke-virtual {v1, p5, p6}, Lcom/wmspanel/libstream/l;->c(J)V

    .line 459
    :try_start_0
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cv:[B

    const/4 v2, 0x0

    const/16 v3, 0x20

    invoke-virtual {p0, v1, v2, v3}, Lcom/wmspanel/libstream/m;->append([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 464
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 460
    :catch_0
    move-exception v1

    .line 461
    const-string/jumbo v2, "RtspConnection"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private c(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 660
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cJ:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cI:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 662
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->ct:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cJ:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cu:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/wmspanel/libstream/o;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cI:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cs:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/wmspanel/libstream/o;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/wmspanel/libstream/o;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 663
    const-string/jumbo v1, "Authorization: Digest "

    .line 664
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "username=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->ct:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 665
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ",realm=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cJ:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 666
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ",nonce=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 667
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ",uri=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cs:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 668
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ",response=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 669
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 683
    :goto_0
    return-object v0

    .line 671
    :catch_0
    move-exception v0

    .line 672
    const-string/jumbo v1, "RtspConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 683
    :cond_0
    :goto_1
    const-string/jumbo v0, ""

    goto :goto_0

    .line 674
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cK:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 676
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->ct:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cu:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 677
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Authorization: Basic "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "US-ASCII"

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v2, 0x2

    invoke-static {v0, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto :goto_0

    .line 679
    :catch_1
    move-exception v0

    .line 680
    const-string/jumbo v1, "RtspConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private e(Lcom/wmspanel/libstream/BufferItem;)Z
    .locals 14

    .prologue
    const-wide/32 v12, 0x15f90

    const-wide/16 v6, -0x1

    const v3, 0x15f90

    const/4 v2, 0x1

    const/4 v0, 0x0

    .line 264
    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cA:J

    cmp-long v1, v4, v6

    if-nez v1, :cond_2

    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cD:J

    cmp-long v1, v4, v6

    if-nez v1, :cond_2

    .line 266
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->S()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/wmspanel/libstream/m;->cA:J

    .line 267
    invoke-virtual {p0, p1, v3}, Lcom/wmspanel/libstream/m;->c(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/wmspanel/libstream/m;->cB:J

    .line 268
    iget v3, p0, Lcom/wmspanel/libstream/m;->cz:I

    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cA:J

    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cB:J

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/wmspanel/libstream/m;->a(IIJJ)Z

    move-result v1

    if-nez v1, :cond_1

    .line 269
    const-string/jumbo v1, "RtspConnection"

    const-string/jumbo v2, "failed to send report"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v0

    .line 307
    :cond_0
    :goto_0
    return v2

    .line 273
    :cond_1
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v3, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v1, v3, :cond_0

    .line 275
    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cB:J

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v1, v1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    int-to-long v6, v1

    mul-long/2addr v4, v6

    div-long/2addr v4, v12

    iput-wide v4, p0, Lcom/wmspanel/libstream/m;->cE:J

    .line 276
    const/4 v4, 0x3

    iget v5, p0, Lcom/wmspanel/libstream/m;->cC:I

    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cA:J

    iget-wide v8, p0, Lcom/wmspanel/libstream/m;->cE:J

    move-object v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/wmspanel/libstream/m;->a(IIJJ)Z

    move-result v1

    if-nez v1, :cond_0

    .line 277
    const-string/jumbo v1, "RtspConnection"

    const-string/jumbo v2, "failed to send report"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v0

    .line 278
    goto :goto_0

    .line 282
    :cond_2
    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cA:J

    cmp-long v1, v4, v6

    if-nez v1, :cond_3

    .line 284
    invoke-virtual {p0, p1, v3}, Lcom/wmspanel/libstream/m;->c(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v4

    .line 285
    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cB:J

    sub-long v6, v4, v6

    .line 286
    iget-wide v8, p0, Lcom/wmspanel/libstream/m;->cD:J

    const-wide v10, 0x100000000L

    mul-long/2addr v6, v10

    div-long/2addr v6, v12

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/wmspanel/libstream/m;->cA:J

    .line 287
    iput-wide v4, p0, Lcom/wmspanel/libstream/m;->cB:J

    .line 288
    iget v3, p0, Lcom/wmspanel/libstream/m;->cz:I

    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cA:J

    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cB:J

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/wmspanel/libstream/m;->a(IIJJ)Z

    move-result v1

    if-nez v1, :cond_0

    .line 289
    const-string/jumbo v1, "RtspConnection"

    const-string/jumbo v2, "failed to send report"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v0

    .line 290
    goto :goto_0

    .line 293
    :cond_3
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->q()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 295
    invoke-virtual {p0, p1, v3}, Lcom/wmspanel/libstream/m;->c(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v4

    .line 296
    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cB:J

    sub-long v6, v4, v6

    .line 298
    const-wide/32 v8, 0x6ddd0

    cmp-long v1, v6, v8

    if-lez v1, :cond_0

    .line 299
    iget-wide v8, p0, Lcom/wmspanel/libstream/m;->cA:J

    const-wide v10, 0x100000000L

    mul-long/2addr v6, v10

    div-long/2addr v6, v12

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/wmspanel/libstream/m;->cA:J

    .line 300
    iput-wide v4, p0, Lcom/wmspanel/libstream/m;->cB:J

    .line 301
    iget v3, p0, Lcom/wmspanel/libstream/m;->cz:I

    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cA:J

    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cB:J

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/wmspanel/libstream/m;->a(IIJJ)Z

    move-result v1

    if-nez v1, :cond_0

    .line 302
    const-string/jumbo v1, "RtspConnection"

    const-string/jumbo v2, "failed to send report"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v0

    .line 303
    goto/16 :goto_0
.end method

.method private f(Lcom/wmspanel/libstream/BufferItem;)Z
    .locals 14

    .prologue
    const/4 v8, 0x1

    const-wide/16 v6, -0x1

    const/4 v2, 0x3

    const/4 v0, 0x0

    .line 311
    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cD:J

    cmp-long v1, v4, v6

    if-nez v1, :cond_1

    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cA:J

    cmp-long v1, v4, v6

    if-nez v1, :cond_1

    .line 313
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->S()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/wmspanel/libstream/m;->cD:J

    .line 314
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v1, v1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    invoke-virtual {p0, p1, v1}, Lcom/wmspanel/libstream/m;->c(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/wmspanel/libstream/m;->cE:J

    .line 315
    iget v3, p0, Lcom/wmspanel/libstream/m;->cC:I

    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cD:J

    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cE:J

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/wmspanel/libstream/m;->a(IIJJ)Z

    move-result v1

    if-nez v1, :cond_0

    .line 316
    const-string/jumbo v1, "RtspConnection"

    const-string/jumbo v2, "failed to send report"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    :goto_0
    return v0

    .line 320
    :cond_0
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v1, v2, :cond_3

    .line 322
    iget-wide v2, p0, Lcom/wmspanel/libstream/m;->cE:J

    const-wide/32 v4, 0x15f90

    mul-long/2addr v2, v4

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v1, v1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    int-to-long v4, v1

    div-long/2addr v2, v4

    iput-wide v2, p0, Lcom/wmspanel/libstream/m;->cB:J

    .line 324
    iget v3, p0, Lcom/wmspanel/libstream/m;->cz:I

    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cD:J

    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cB:J

    move-object v1, p0

    move v2, v8

    invoke-direct/range {v1 .. v7}, Lcom/wmspanel/libstream/m;->a(IIJJ)Z

    move-result v1

    if-nez v1, :cond_3

    .line 325
    const-string/jumbo v1, "RtspConnection"

    const-string/jumbo v2, "failed to send report"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 329
    :cond_1
    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cD:J

    cmp-long v1, v4, v6

    if-nez v1, :cond_2

    .line 332
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v1, v1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    invoke-virtual {p0, p1, v1}, Lcom/wmspanel/libstream/m;->c(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v4

    .line 333
    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cE:J

    sub-long v6, v4, v6

    .line 334
    iget-wide v10, p0, Lcom/wmspanel/libstream/m;->cA:J

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v1, v1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    int-to-long v12, v1

    mul-long/2addr v6, v12

    add-long/2addr v6, v10

    iput-wide v6, p0, Lcom/wmspanel/libstream/m;->cD:J

    .line 335
    iput-wide v4, p0, Lcom/wmspanel/libstream/m;->cE:J

    .line 337
    iget v3, p0, Lcom/wmspanel/libstream/m;->cC:I

    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cD:J

    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cE:J

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/wmspanel/libstream/m;->a(IIJJ)Z

    move-result v1

    if-nez v1, :cond_3

    .line 338
    const-string/jumbo v1, "RtspConnection"

    const-string/jumbo v2, "failed to send report"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 343
    :cond_2
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v1, v1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    invoke-virtual {p0, p1, v1}, Lcom/wmspanel/libstream/m;->c(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v4

    .line 344
    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cE:J

    sub-long/2addr v4, v6

    .line 346
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v1, v1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    mul-int/lit8 v1, v1, 0x5

    int-to-long v6, v1

    cmp-long v1, v4, v6

    if-lez v1, :cond_3

    .line 347
    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cD:J

    const-wide v10, 0x100000000L

    mul-long/2addr v10, v4

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v1, v1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    int-to-long v12, v1

    div-long/2addr v10, v12

    add-long/2addr v6, v10

    iput-wide v6, p0, Lcom/wmspanel/libstream/m;->cD:J

    .line 348
    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cE:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/wmspanel/libstream/m;->cE:J

    .line 350
    iget v3, p0, Lcom/wmspanel/libstream/m;->cC:I

    iget-wide v4, p0, Lcom/wmspanel/libstream/m;->cD:J

    iget-wide v6, p0, Lcom/wmspanel/libstream/m;->cE:J

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/wmspanel/libstream/m;->a(IIJJ)Z

    move-result v1

    if-nez v1, :cond_3

    .line 351
    const-string/jumbo v1, "RtspConnection"

    const-string/jumbo v2, "failed to send report"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_3
    move v0, v8

    .line 356
    goto/16 :goto_0
.end method

.method private g(Lcom/wmspanel/libstream/BufferItem;)Z
    .locals 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 363
    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cv:[B

    invoke-static {v2}, Lcom/wmspanel/libstream/l;->e([B)Lcom/wmspanel/libstream/l;

    move-result-object v2

    .line 364
    iget-object v3, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v3}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v3

    array-length v3, v3

    add-int/lit8 v3, v3, 0xc

    invoke-virtual {v2, v1, v3}, Lcom/wmspanel/libstream/l;->a(II)Lcom/wmspanel/libstream/l;

    .line 365
    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/wmspanel/libstream/l;->a(B)Lcom/wmspanel/libstream/l;

    .line 366
    const/16 v3, 0x60

    invoke-virtual {v2, v3}, Lcom/wmspanel/libstream/l;->f(B)Lcom/wmspanel/libstream/l;

    .line 367
    iget v3, p0, Lcom/wmspanel/libstream/m;->cF:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/wmspanel/libstream/m;->cF:I

    invoke-virtual {v2, v3}, Lcom/wmspanel/libstream/l;->m(I)Lcom/wmspanel/libstream/l;

    .line 368
    invoke-virtual {v2, v0}, Lcom/wmspanel/libstream/l;->e(B)Lcom/wmspanel/libstream/l;

    .line 370
    const v3, 0x15f90

    invoke-virtual {p0, p1, v3}, Lcom/wmspanel/libstream/m;->c(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v4

    .line 371
    long-to-int v3, v4

    invoke-virtual {v2, v3}, Lcom/wmspanel/libstream/l;->n(I)Lcom/wmspanel/libstream/l;

    .line 372
    iget v3, p0, Lcom/wmspanel/libstream/m;->cz:I

    invoke-virtual {v2, v3}, Lcom/wmspanel/libstream/l;->o(I)Lcom/wmspanel/libstream/l;

    .line 375
    :try_start_0
    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cv:[B

    const/4 v3, 0x0

    const/16 v4, 0x10

    invoke-virtual {p0, v2, v3, v4}, Lcom/wmspanel/libstream/m;->append([BII)V

    .line 376
    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v2}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/m;->a([B)V

    .line 377
    iget-wide v2, p0, Lcom/wmspanel/libstream/m;->o:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/wmspanel/libstream/m;->o:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 382
    :goto_0
    return v0

    .line 378
    :catch_0
    move-exception v0

    .line 379
    const-string/jumbo v2, "RtspConnection"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 380
    goto :goto_0
.end method


# virtual methods
.method Q()V
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_1

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamBuffer;->ac()Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    .line 95
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    if-nez v0, :cond_1

    .line 96
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cQ:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    .line 111
    :goto_0
    return-void

    .line 101
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_3

    .line 102
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamBuffer;->ad()Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    .line 103
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    if-nez v0, :cond_3

    .line 104
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cQ:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto :goto_0

    .line 109
    :cond_3
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->W()V

    .line 110
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cR:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto :goto_0
.end method

.method R()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    .line 162
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->b()I

    move-result v0

    if-lez v0, :cond_2

    .line 249
    :cond_1
    :goto_1
    return-void

    .line 167
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->c:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/d;->x()Lcom/wmspanel/libstream/StreamBuffer;

    move-result-object v0

    iget-wide v2, p0, Lcom/wmspanel/libstream/m;->bw:J

    invoke-virtual {v0, v2, v3}, Lcom/wmspanel/libstream/StreamBuffer;->d(J)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    .line 168
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    if-eqz v0, :cond_1

    .line 173
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->o()J

    move-result-wide v0

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/wmspanel/libstream/m;->bw:J

    .line 175
    sget-object v0, Lcom/wmspanel/libstream/m$1;->bA:[I

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem;->m()Lcom/wmspanel/libstream/BufferItem$a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem$a;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 257
    const-string/jumbo v0, "RtspConnection"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unsupported frame type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v2}, Lcom/wmspanel/libstream/BufferItem;->m()Lcom/wmspanel/libstream/BufferItem$a;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 178
    :pswitch_0
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_0

    .line 180
    :cond_3
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->q()Z

    move-result v0

    if-nez v0, :cond_4

    .line 182
    iget-wide v0, p0, Lcom/wmspanel/libstream/m;->o:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->n()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/wmspanel/libstream/m;->r:J

    sub-long/2addr v0, v2

    cmp-long v0, v0, v4

    if-gtz v0, :cond_0

    .line 193
    :cond_4
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/m;->b(Lcom/wmspanel/libstream/BufferItem;)V

    .line 195
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v0

    .line 197
    const/4 v1, 0x0

    aget-byte v1, v0, v1

    shr-int/lit8 v1, v1, 0x7

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_5

    .line 198
    const-string/jumbo v0, "RtspConnection"

    const-string/jumbo v1, "skip frame if fzb is set"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 202
    :cond_5
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/m;->e(Lcom/wmspanel/libstream/BufferItem;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 203
    const-string/jumbo v0, "RtspConnection"

    const-string/jumbo v1, "failed to send video report"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 207
    :cond_6
    array-length v0, v0

    add-int/lit8 v0, v0, 0x10

    const/16 v1, 0x4e20

    if-ge v0, v1, :cond_8

    .line 209
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/m;->g(Lcom/wmspanel/libstream/BufferItem;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 210
    const-string/jumbo v0, "RtspConnection"

    const-string/jumbo v1, "failed to send video frame"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 214
    :cond_7
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cW:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto/16 :goto_0

    .line 218
    :cond_8
    const/4 v0, 0x1

    iput v0, p0, Lcom/wmspanel/libstream/m;->bs:I

    .line 220
    :cond_9
    iget v0, p0, Lcom/wmspanel/libstream/m;->bs:I

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_b

    .line 221
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    iget v1, p0, Lcom/wmspanel/libstream/m;->bs:I

    invoke-direct {p0, v0, v1}, Lcom/wmspanel/libstream/m;->a(Lcom/wmspanel/libstream/BufferItem;I)I

    move-result v0

    .line 222
    if-gtz v0, :cond_a

    .line 223
    const-string/jumbo v0, "RtspConnection"

    const-string/jumbo v1, "failed to send video part"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 226
    :cond_a
    iget v1, p0, Lcom/wmspanel/libstream/m;->bs:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/m;->bs:I

    .line 228
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->b()I

    move-result v0

    if-lez v0, :cond_9

    .line 229
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cX:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto/16 :goto_1

    .line 234
    :cond_b
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cW:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto/16 :goto_0

    .line 240
    :pswitch_1
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v0, v1, :cond_c

    iget-object v0, p0, Lcom/wmspanel/libstream/m;->b:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_0

    .line 242
    :cond_c
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/m;->f(Lcom/wmspanel/libstream/BufferItem;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 243
    const-string/jumbo v0, "RtspConnection"

    const-string/jumbo v1, "failed to send audio report"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 247
    :cond_d
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/m;->h(Lcom/wmspanel/libstream/BufferItem;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 248
    const-string/jumbo v0, "RtspConnection"

    const-string/jumbo v1, "failed to send audio frame"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 252
    :cond_e
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cW:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto/16 :goto_0

    .line 175
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method a(Ljava/nio/ByteBuffer;)I
    .locals 3

    .prologue
    .line 74
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/wmspanel/libstream/n;->b([BI)I

    move-result v0

    .line 75
    if-gez v0, :cond_1

    .line 76
    const-string/jumbo v0, "RtspConnection"

    const-string/jumbo v1, "failed to parse rtsp"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->close()V

    .line 78
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 85
    :cond_0
    :goto_0
    return v0

    .line 81
    :cond_1
    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cr:Lcom/wmspanel/libstream/n;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/n;->aa()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->T()V

    goto :goto_0
.end method

.method c(Lcom/wmspanel/libstream/BufferItem;I)J
    .locals 4

    .prologue
    .line 473
    int-to-long v0, p2

    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v2

    mul-long/2addr v0, v2

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    return-wide v0
.end method

.method c()V
    .locals 2

    .prologue
    .line 56
    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->UNKNOWN_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cq:Lcom/wmspanel/libstream/Streamer$STATUS;

    .line 57
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->CONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$STATUS;->SUCCESS:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/m;->a(Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V

    .line 58
    invoke-direct {p0}, Lcom/wmspanel/libstream/m;->V()V

    .line 59
    return-void
.end method

.method protected declared-synchronized close()V
    .locals 2

    .prologue
    .line 64
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cY:Lcom/wmspanel/libstream/m$a;

    if-eq v0, v1, :cond_0

    .line 65
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cY:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    .line 66
    invoke-super {p0}, Lcom/wmspanel/libstream/a;->close()V

    .line 67
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->DISCONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cq:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/m;->a(Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    :cond_0
    monitor-exit p0

    return-void

    .line 64
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method d()V
    .locals 2

    .prologue
    .line 120
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 151
    :goto_0
    return-void

    .line 122
    :pswitch_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->Q()V

    goto :goto_0

    .line 126
    :pswitch_1
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->R()V

    goto :goto_0

    .line 130
    :cond_0
    :pswitch_2
    iget v0, p0, Lcom/wmspanel/libstream/m;->bs:I

    iget-object v1, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 131
    iget-object v0, p0, Lcom/wmspanel/libstream/m;->cy:Lcom/wmspanel/libstream/BufferItem;

    iget v1, p0, Lcom/wmspanel/libstream/m;->bs:I

    invoke-direct {p0, v0, v1}, Lcom/wmspanel/libstream/m;->a(Lcom/wmspanel/libstream/BufferItem;I)I

    move-result v0

    .line 132
    if-gtz v0, :cond_1

    .line 133
    const-string/jumbo v0, "RtspConnection"

    const-string/jumbo v1, "failed to send video part"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 136
    :cond_1
    iget v1, p0, Lcom/wmspanel/libstream/m;->bs:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/m;->bs:I

    .line 138
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->b()I

    move-result v0

    if-lez v0, :cond_0

    .line 139
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cX:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    goto :goto_0

    .line 144
    :cond_2
    sget-object v0, Lcom/wmspanel/libstream/m$a;->cW:Lcom/wmspanel/libstream/m$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/m;->cp:Lcom/wmspanel/libstream/m$a;

    .line 145
    invoke-virtual {p0}, Lcom/wmspanel/libstream/m;->R()V

    goto :goto_0

    .line 120
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method h(Lcom/wmspanel/libstream/BufferItem;)Z
    .locals 6

    .prologue
    const/4 v1, 0x1

    const/4 v5, 0x2

    const/4 v0, 0x0

    .line 480
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/m;->a(Lcom/wmspanel/libstream/BufferItem;)V

    .line 482
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v2

    array-length v2, v2

    .line 484
    if-gt v2, v5, :cond_0

    .line 510
    :goto_0
    return v0

    .line 488
    :cond_0
    iget-object v3, p0, Lcom/wmspanel/libstream/m;->cv:[B

    invoke-static {v3}, Lcom/wmspanel/libstream/l;->e([B)Lcom/wmspanel/libstream/l;

    move-result-object v3

    .line 489
    add-int/lit8 v4, v2, 0x10

    invoke-virtual {v3, v5, v4}, Lcom/wmspanel/libstream/l;->a(II)Lcom/wmspanel/libstream/l;

    .line 490
    invoke-virtual {v3, v5}, Lcom/wmspanel/libstream/l;->a(B)Lcom/wmspanel/libstream/l;

    .line 491
    const/16 v4, 0x61

    invoke-virtual {v3, v4}, Lcom/wmspanel/libstream/l;->f(B)Lcom/wmspanel/libstream/l;

    .line 492
    iget v4, p0, Lcom/wmspanel/libstream/m;->cH:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/wmspanel/libstream/m;->cH:I

    invoke-virtual {v3, v4}, Lcom/wmspanel/libstream/l;->m(I)Lcom/wmspanel/libstream/l;

    .line 493
    invoke-virtual {v3, v1}, Lcom/wmspanel/libstream/l;->e(B)Lcom/wmspanel/libstream/l;

    .line 495
    iget-object v4, p0, Lcom/wmspanel/libstream/m;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    iget v4, v4, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    invoke-virtual {p0, p1, v4}, Lcom/wmspanel/libstream/m;->c(Lcom/wmspanel/libstream/BufferItem;I)J

    move-result-wide v4

    .line 497
    long-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/wmspanel/libstream/l;->n(I)Lcom/wmspanel/libstream/l;

    .line 498
    iget v4, p0, Lcom/wmspanel/libstream/m;->cC:I

    invoke-virtual {v3, v4}, Lcom/wmspanel/libstream/l;->o(I)Lcom/wmspanel/libstream/l;

    .line 500
    int-to-short v2, v2

    invoke-virtual {v3, v2}, Lcom/wmspanel/libstream/l;->a(S)V

    .line 503
    :try_start_0
    iget-object v2, p0, Lcom/wmspanel/libstream/m;->cv:[B

    const/4 v3, 0x0

    const/16 v4, 0x14

    invoke-virtual {p0, v2, v3, v4}, Lcom/wmspanel/libstream/m;->append([BII)V

    .line 504
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/m;->a([B)V

    .line 505
    iget-wide v2, p0, Lcom/wmspanel/libstream/m;->m:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/wmspanel/libstream/m;->m:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 510
    goto :goto_0

    .line 506
    :catch_0
    move-exception v1

    .line 507
    const-string/jumbo v2, "RtspConnection"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
