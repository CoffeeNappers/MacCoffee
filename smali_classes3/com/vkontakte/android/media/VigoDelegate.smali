.class public Lcom/vkontakte/android/media/VigoDelegate;
.super Ljava/lang/Object;
.source "VigoDelegate.java"


# static fields
.field public static final AUTO_QUALITY:I = 0x64

.field private static final HEARTBEAT_TIMEOUT:I = 0x1e


# instance fields
.field private bufNum:I

.field private bufStartTime:J

.field private bufferPct:Ljava/lang/Integer;

.field private final heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

.field private host:Ljava/lang/String;

.field private instantBitrate:I

.field private volatile isError:Z

.field private isPaused:Z

.field private isPrepared:Z

.field private isQualityAdviserSupported:Z

.field odd:Z

.field private playbackStartTime:J

.field private playbackStartTs:J

.field private quality:I

.field private final seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

.field private svcid:Ljava/lang/String;

.field private timeZone:I

.field private url:Ljava/lang/String;

.field private watchId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 32
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->odd:Z

    return-void
.end method

.method public static getSVCid(Z)Ljava/lang/String;
    .locals 1
    .param p0, "autoplay"    # Z

    .prologue
    .line 57
    if-eqz p0, :cond_0

    const-string/jumbo v0, "5d19"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "5d18"

    goto :goto_0
.end method

.method private sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    .locals 5
    .param p1, "pb"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .prologue
    .line 1714
    :try_start_0
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/vkontakte/android/VKApplication;->getVigo(Landroid/content/Context;)Lcom/vkontakte/android/media/Vigo;

    move-result-object v1

    .line 1715
    .local v1, "vigo":Lcom/vkontakte/android/media/Vigo;
    const-string/jumbo v3, "http://api.vigo.ru/uxzoom/2/notify"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/media/VigoDelegate;->svcid:Ljava/lang/String;

    invoke-virtual {v1, v3, v4, p1}, Lcom/vkontakte/android/media/Vigo;->fillPlaybackUrlParams(Landroid/net/Uri$Builder;Ljava/lang/String;Lcom/vkontakte/android/media/VigoBinaryBuffer;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 1724
    .local v0, "reqUri":Landroid/net/Uri;
    new-instance v3, Lcom/vkontakte/android/statistics/StatisticUrl;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/statistics/StatisticUrl;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    .line 1726
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1731
    .end local v0    # "reqUri":Landroid/net/Uri;
    .end local v1    # "vigo":Lcom/vkontakte/android/media/Vigo;
    :cond_0
    :goto_0
    return-void

    .line 1728
    :catch_0
    move-exception v2

    .line 1729
    .local v2, "x":Ljava/lang/Exception;
    const-string/jumbo v3, "vk"

    const-string/jumbo v4, "Error sending vigo event"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public afterSetDataSource()V
    .locals 18

    .prologue
    .line 1549
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v12, :cond_0

    .line 1551
    sget-object v12, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v12}, Lcom/vkontakte/android/VKApplication;->getVigo(Landroid/content/Context;)Lcom/vkontakte/android/media/Vigo;

    move-result-object v9

    .line 1552
    .local v9, "vigo":Lcom/vkontakte/android/media/Vigo;
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    invoke-virtual {v9, v12, v13}, Lcom/vkontakte/android/media/Vigo;->collectPlaybackChangesON(J)V

    .line 1554
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v13, 0x1e

    invoke-virtual {v12, v13}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 1556
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    .line 1557
    .local v10, "playbackTime":J
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v2

    .line 1561
    .local v2, "bytes":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 1562
    .local v4, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v8

    .line 1563
    .local v8, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v7

    .line 1566
    .local v7, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v12, 0x2

    :try_start_1
    invoke-virtual {v4, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1569
    const/4 v12, 0x1

    :try_start_2
    invoke-virtual {v4, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v13, v13

    .line 1570
    invoke-virtual {v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    const/4 v13, 0x0

    .line 1571
    invoke-virtual {v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    const/4 v13, 0x0

    .line 1572
    invoke-virtual {v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v12, :cond_1

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 1573
    :goto_0
    invoke-virtual {v13, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    .line 1574
    invoke-virtual {v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1579
    :goto_1
    const/4 v12, 0x3

    :try_start_3
    invoke-virtual {v8, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1582
    :try_start_4
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v8, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 1583
    invoke-virtual {v12, v14, v15}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v13, v13

    .line 1584
    invoke-virtual {v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    const-string/jumbo v13, "AndroidMP"

    .line 1585
    invoke-virtual {v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    .line 1586
    invoke-virtual {v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1591
    :goto_2
    const/4 v12, 0x4

    :try_start_5
    invoke-virtual {v7, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1594
    const/4 v12, 0x1

    :try_start_6
    invoke-virtual {v7, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1595
    invoke-virtual {v13}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v14, v10, v14

    long-to-int v13, v14

    .line 1596
    invoke-virtual {v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    const/4 v13, -0x1

    .line 1597
    invoke-virtual {v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v12, :cond_2

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 1598
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    const v14, 0xf4240

    mul-int/2addr v12, v14

    :goto_3
    invoke-virtual {v13, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    .line 1599
    invoke-virtual {v12, v2, v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 1600
    invoke-virtual {v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v13

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v16, 0x0

    cmp-long v12, v14, v16

    if-eqz v12, :cond_3

    const/4 v12, 0x1

    .line 1601
    :goto_4
    invoke-virtual {v13, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    .line 1602
    invoke-virtual {v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V

    .line 1604
    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1620
    :goto_5
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 1621
    .local v6, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v6, v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    .line 1622
    invoke-virtual {v12, v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    .line 1623
    invoke-virtual {v12, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    .line 1621
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1627
    :try_start_8
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1628
    invoke-virtual {v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1629
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 1635
    .end local v6    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_6
    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    .line 1707
    .end local v2    # "bytes":J
    .end local v4    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v7    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v9    # "vigo":Lcom/vkontakte/android/media/Vigo;
    .end local v10    # "playbackTime":J
    :cond_0
    :goto_7
    return-void

    .line 1572
    .restart local v2    # "bytes":J
    .restart local v4    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v7    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v9    # "vigo":Lcom/vkontakte/android/media/Vigo;
    .restart local v10    # "playbackTime":J
    :cond_1
    :try_start_9
    const-string/jumbo v12, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_0

    .line 1575
    :catch_0
    move-exception v5

    .line 1576
    .local v5, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_1

    .line 1625
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v12

    .line 1627
    :try_start_b
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1628
    invoke-virtual {v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1629
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto :goto_6

    .line 1632
    .end local v4    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v7    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v12

    .line 1635
    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    goto :goto_7

    .line 1587
    .restart local v4    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v7    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v5

    .line 1588
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_2

    .line 1627
    .end local v5    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v12

    :try_start_d
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1628
    invoke-virtual {v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1629
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v12
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 1635
    .end local v4    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v7    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catchall_1
    move-exception v12

    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    throw v12

    .line 1598
    .restart local v4    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v7    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :cond_2
    const/4 v12, -0x1

    goto :goto_3

    .line 1600
    :cond_3
    const/4 v12, 0x0

    goto :goto_4

    .line 1616
    :catch_4
    move-exception v5

    .line 1617
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_5
.end method

.method public beforeSetDataSource()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 590
    iget v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    .line 592
    iput-boolean v1, p0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    .line 594
    iput-boolean v1, p0, Lcom/vkontakte/android/media/VigoDelegate;->isPaused:Z

    .line 595
    iput-boolean v1, p0, Lcom/vkontakte/android/media/VigoDelegate;->isError:Z

    .line 596
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 599
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    .line 601
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    .line 603
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 604
    iput v1, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufNum:I

    .line 605
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    .line 606
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 607
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 608
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    invoke-virtual {v0, v2, v3}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    const v2, 0xea60

    div-int/2addr v0, v2

    iput v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    .line 609
    iput v1, p0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 615
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->url:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 619
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 590
    goto :goto_0

    .line 616
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method public bitrateChange(IJJ)V
    .locals 16
    .param p1, "newBitrate"    # I
    .param p2, "duration"    # J
    .param p4, "position"    # J

    .prologue
    .line 316
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v7, :cond_0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    move/from16 v0, p1

    if-eq v7, v0, :cond_0

    .line 317
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v10, 0x1e

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 319
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 320
    .local v8, "playbackTime":J
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 324
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 325
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 326
    .local v6, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 329
    .local v5, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v7, 0x2

    :try_start_1
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 332
    const/4 v7, 0x1

    :try_start_2
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v10, v10

    .line 333
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 334
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_1

    move-wide/from16 v0, p2

    long-to-int v7, v0

    .line 335
    :goto_0
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v7, :cond_2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 336
    :goto_1
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 337
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 342
    :goto_2
    const/4 v7, 0x3

    :try_start_3
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 345
    :try_start_4
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 346
    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v10, v10

    .line 347
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const-string/jumbo v10, "AndroidMP"

    .line 348
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 349
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 354
    :goto_3
    const/4 v7, 0x4

    :try_start_5
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 357
    const/4 v7, 0x7

    :try_start_6
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 358
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v10

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 359
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_3

    move-wide/from16 v0, p4

    long-to-int v7, v0

    .line 360
    :goto_4
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v7, :cond_4

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 361
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v11, 0xf4240

    mul-int/2addr v7, v11

    :goto_5
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 362
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 363
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v14, 0x0

    cmp-long v7, v12, v14

    if-eqz v7, :cond_5

    const/4 v7, 0x1

    .line 364
    :goto_6
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 365
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 370
    :goto_7
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 371
    .local v4, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 372
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 373
    invoke-virtual {v7, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 371
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 377
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 378
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 379
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 424
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v4    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackTime":J
    :cond_0
    :goto_8
    return-void

    .line 334
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_1
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 335
    :cond_2
    :try_start_9
    const-string/jumbo v7, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_1

    .line 338
    :catch_0
    move-exception v3

    .line 339
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_2

    .line 375
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 377
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 378
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 379
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_8

    .line 382
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v7

    goto :goto_8

    .line 350
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 351
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_3

    .line 377
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 378
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 379
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v7
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    .line 359
    :cond_3
    const/4 v7, -0x1

    goto/16 :goto_4

    .line 361
    :cond_4
    const/4 v7, -0x1

    goto :goto_5

    .line 363
    :cond_5
    const/4 v7, 0x0

    goto :goto_6

    .line 366
    :catch_4
    move-exception v3

    .line 367
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_7
.end method

.method public onBufferingEnd(JJ)V
    .locals 15
    .param p1, "duration"    # J
    .param p3, "position"    # J

    .prologue
    .line 853
    iget-boolean v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v7, :cond_0

    iget-boolean v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->isPaused:Z

    if-nez v7, :cond_0

    .line 856
    iget-wide v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v12, 0x0

    cmp-long v7, v10, v12

    if-eqz v7, :cond_0

    .line 858
    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v10, 0x1e

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 860
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 864
    .local v8, "playbackTime":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 865
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 866
    .local v6, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 869
    .local v5, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v7, 0x2

    :try_start_1
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 872
    const/4 v7, 0x1

    :try_start_2
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v10, v10

    .line 873
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 874
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    iget-boolean v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_1

    move-wide/from16 v0, p1

    long-to-int v7, v0

    .line 875
    :goto_0
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 876
    :goto_1
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 877
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 882
    :goto_2
    const/4 v7, 0x3

    :try_start_3
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 885
    :try_start_4
    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-wide v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 886
    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v10, v10

    .line 887
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const-string/jumbo v10, "AndroidMP"

    .line 888
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 889
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 894
    :goto_3
    const/4 v7, 0x4

    :try_start_5
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 897
    const/4 v7, 0x3

    :try_start_6
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-object v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 898
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v10

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-wide v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 899
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    iget-boolean v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_3

    move-wide/from16 v0, p3

    long-to-int v7, v0

    .line 900
    :goto_4
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v7, :cond_4

    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 901
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v11, 0xf4240

    mul-int/2addr v7, v11

    :goto_5
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 902
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 903
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 904
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufNum:I

    .line 905
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-wide v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 906
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 907
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 912
    :goto_6
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 913
    .local v4, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 914
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 915
    invoke-virtual {v7, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 913
    invoke-direct {p0, v7}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 919
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 920
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 921
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 962
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v4    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_7
    const-wide/16 v10, 0x0

    iput-wide v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    .line 968
    .end local v8    # "playbackTime":J
    :cond_0
    return-void

    .line 874
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_1
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 875
    :cond_2
    :try_start_9
    const-string/jumbo v7, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_1

    .line 878
    :catch_0
    move-exception v3

    .line 879
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_2

    .line 917
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 919
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 920
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 921
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_7

    .line 924
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v7

    goto :goto_7

    .line 890
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 891
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_3

    .line 919
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 920
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 921
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v7
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    .line 899
    :cond_3
    const/4 v7, -0x1

    goto/16 :goto_4

    .line 901
    :cond_4
    const/4 v7, -0x1

    goto :goto_5

    .line 908
    :catch_4
    move-exception v3

    .line 909
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_6
.end method

.method public onBufferingStart(JJ)V
    .locals 17
    .param p1, "duration"    # J
    .param p3, "position"    # J

    .prologue
    .line 972
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v7, :cond_0

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPaused:Z

    if-nez v7, :cond_0

    .line 973
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v10, 0x1e

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 975
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 976
    .local v8, "playbackTime":J
    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    .line 980
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 981
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 982
    .local v6, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 985
    .local v5, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v7, 0x2

    :try_start_1
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 988
    const/4 v7, 0x1

    :try_start_2
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v10, v10

    .line 989
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 990
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_1

    move-wide/from16 v0, p1

    long-to-int v7, v0

    .line 991
    :goto_0
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v7, :cond_2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 992
    :goto_1
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 993
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 998
    :goto_2
    const/4 v7, 0x3

    :try_start_3
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1001
    :try_start_4
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 1002
    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v10, v10

    .line 1003
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const-string/jumbo v10, "AndroidMP"

    .line 1004
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1005
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1010
    :goto_3
    const/4 v7, 0x4

    :try_start_5
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1013
    const/4 v7, 0x2

    :try_start_6
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1014
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v10

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 1015
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_3

    move-wide/from16 v0, p3

    long-to-int v7, v0

    .line 1016
    :goto_4
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v7, :cond_4

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 1017
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v11, 0xf4240

    mul-int/2addr v7, v11

    :goto_5
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1018
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 1019
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v14, 0x0

    cmp-long v7, v12, v14

    if-eqz v7, :cond_5

    const/4 v7, 0x1

    .line 1020
    :goto_6
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufNum:I

    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p0

    iput v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufNum:I

    .line 1021
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1022
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1027
    :goto_7
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 1028
    .local v4, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1029
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1030
    invoke-virtual {v7, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1028
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1034
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1035
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1036
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 1079
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v4    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackTime":J
    :cond_0
    :goto_8
    return-void

    .line 990
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_1
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 991
    :cond_2
    :try_start_9
    const-string/jumbo v7, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_1

    .line 994
    :catch_0
    move-exception v3

    .line 995
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_2

    .line 1032
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 1034
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1035
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1036
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_8

    .line 1039
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v7

    goto :goto_8

    .line 1006
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 1007
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_3

    .line 1034
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1035
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1036
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v7
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    .line 1015
    :cond_3
    const/4 v7, -0x1

    goto/16 :goto_4

    .line 1017
    :cond_4
    const/4 v7, -0x1

    goto/16 :goto_5

    .line 1019
    :cond_5
    const/4 v7, 0x0

    goto :goto_6

    .line 1023
    :catch_4
    move-exception v3

    .line 1024
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_7
.end method

.method public onBufferingUpdate(IJJ)V
    .locals 16
    .param p1, "percent"    # I
    .param p2, "duration"    # J
    .param p4, "position"    # J

    .prologue
    .line 744
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v7, :cond_3

    .line 745
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-nez v7, :cond_0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v7

    if-gtz v7, :cond_1

    :cond_0
    const/16 v7, 0x64

    move/from16 v0, p1

    if-lt v0, v7, :cond_2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v7, :cond_1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/16 v10, 0x64

    if-ge v7, v10, :cond_2

    .line 747
    :cond_1
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v10, 0x1e

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 749
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 752
    .local v8, "playbackTime":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 753
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 754
    .local v6, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 757
    .local v5, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v7, 0x2

    :try_start_1
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 760
    const/4 v7, 0x1

    :try_start_2
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v10, v10

    .line 761
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 762
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_4

    move-wide/from16 v0, p2

    long-to-int v7, v0

    .line 763
    :goto_0
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v7, :cond_5

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 764
    :goto_1
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 765
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 770
    :goto_2
    const/4 v7, 0x3

    :try_start_3
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 773
    :try_start_4
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 774
    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v10, v10

    .line 775
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const-string/jumbo v10, "AndroidMP"

    .line 776
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 777
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 782
    :goto_3
    const/4 v7, 0x4

    :try_start_5
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 785
    const/4 v7, 0x7

    :try_start_6
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 786
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v10

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 787
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_6

    move-wide/from16 v0, p4

    long-to-int v7, v0

    .line 788
    :goto_4
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v7, :cond_7

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 789
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v11, 0xf4240

    mul-int/2addr v7, v11

    :goto_5
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 790
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 791
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v14, 0x0

    cmp-long v7, v12, v14

    if-eqz v7, :cond_8

    const/4 v7, 0x1

    .line 792
    :goto_6
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 793
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 798
    :goto_7
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 799
    .local v4, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 800
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 801
    invoke-virtual {v7, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 799
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 805
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 806
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 807
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 846
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v4    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackTime":J
    :cond_2
    :goto_8
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 849
    :cond_3
    return-void

    .line 762
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_4
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 763
    :cond_5
    :try_start_9
    const-string/jumbo v7, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_1

    .line 766
    :catch_0
    move-exception v3

    .line 767
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_2

    .line 803
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 805
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 806
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 807
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_8

    .line 810
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v7

    goto :goto_8

    .line 778
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 779
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_3

    .line 805
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 806
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 807
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v7
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    .line 787
    :cond_6
    const/4 v7, -0x1

    goto/16 :goto_4

    .line 789
    :cond_7
    const/4 v7, -0x1

    goto :goto_5

    .line 791
    :cond_8
    const/4 v7, 0x0

    goto :goto_6

    .line 794
    :catch_4
    move-exception v3

    .line 795
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_7
.end method

.method public onError(II)V
    .locals 16
    .param p1, "what"    # I
    .param p2, "extra"    # I

    .prologue
    .line 1082
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isError:Z

    if-nez v7, :cond_0

    .line 1083
    const/4 v7, 0x1

    move-object/from16 v0, p0

    iput-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isError:Z

    .line 1085
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v7, :cond_0

    .line 1086
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v10, 0x0

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 1088
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 1091
    .local v8, "playbackTime":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 1092
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 1093
    .local v6, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 1096
    .local v5, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v7, 0x2

    :try_start_1
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1099
    const/4 v7, 0x1

    :try_start_2
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v10, v10

    .line 1100
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 1101
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 1102
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v7, :cond_1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 1103
    :goto_0
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1104
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1109
    :goto_1
    const/4 v7, 0x3

    :try_start_3
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1112
    :try_start_4
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 1113
    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v10, v10

    .line 1114
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const-string/jumbo v10, "AndroidMP"

    .line 1115
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1116
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1121
    :goto_2
    const/4 v7, 0x4

    :try_start_5
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1124
    const/16 v7, 0xa

    :try_start_6
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1125
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v10

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 1126
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, -0x1

    .line 1127
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v7, :cond_2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 1128
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v11, 0xf4240

    mul-int/2addr v7, v11

    :goto_3
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1129
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 1130
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v14, 0x0

    cmp-long v7, v12, v14

    if-eqz v7, :cond_3

    const/4 v7, 0x1

    .line 1131
    :goto_4
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, p1

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ":"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p2

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1132
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1133
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1138
    :goto_5
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 1139
    .local v4, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1140
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1141
    invoke-virtual {v7, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1139
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1145
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1146
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1147
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 1192
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v4    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackTime":J
    :cond_0
    :goto_6
    return-void

    .line 1102
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_1
    :try_start_9
    const-string/jumbo v7, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_0

    .line 1105
    :catch_0
    move-exception v3

    .line 1106
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_1

    .line 1143
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 1145
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1146
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1147
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_6

    .line 1150
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v7

    goto :goto_6

    .line 1117
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 1118
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_2

    .line 1145
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1146
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1147
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v7
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    .line 1128
    :cond_2
    const/4 v7, -0x1

    goto/16 :goto_3

    .line 1130
    :cond_3
    const/4 v7, 0x0

    goto :goto_4

    .line 1134
    :catch_4
    move-exception v3

    .line 1135
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_5
.end method

.method public onPlaybackComplete(JJ)V
    .locals 17
    .param p1, "duration"    # J
    .param p3, "position"    # J

    .prologue
    .line 1196
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v7, :cond_0

    .line 1197
    const/4 v7, 0x1

    move-object/from16 v0, p0

    iput-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPaused:Z

    .line 1198
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v10, 0x1e

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 1200
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 1204
    .local v8, "playbackTime":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 1205
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 1206
    .local v6, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 1209
    .local v5, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v7, 0x2

    :try_start_1
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1212
    const/4 v7, 0x1

    :try_start_2
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v10, v10

    .line 1213
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 1214
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_1

    move-wide/from16 v0, p1

    long-to-int v7, v0

    .line 1215
    :goto_0
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v7, :cond_2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 1216
    :goto_1
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1217
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1222
    :goto_2
    const/4 v7, 0x3

    :try_start_3
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1225
    :try_start_4
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 1226
    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v10, v10

    .line 1227
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const-string/jumbo v10, "AndroidMP"

    .line 1228
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1229
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1234
    :goto_3
    const/4 v7, 0x4

    :try_start_5
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1237
    const/4 v7, 0x4

    :try_start_6
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1238
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v10

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 1239
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_3

    move-wide/from16 v0, p3

    long-to-int v7, v0

    .line 1240
    :goto_4
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v7, :cond_4

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 1241
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v11, 0xf4240

    mul-int/2addr v7, v11

    :goto_5
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1242
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 1243
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v14, 0x0

    cmp-long v7, v12, v14

    if-eqz v7, :cond_5

    const/4 v7, 0x1

    .line 1244
    :goto_6
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1245
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1250
    :goto_7
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 1251
    .local v4, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1252
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1253
    invoke-virtual {v7, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1251
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1257
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1258
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1259
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 1304
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v4    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackTime":J
    :cond_0
    :goto_8
    return-void

    .line 1214
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_1
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 1215
    :cond_2
    :try_start_9
    const-string/jumbo v7, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_1

    .line 1218
    :catch_0
    move-exception v3

    .line 1219
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_2

    .line 1255
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 1257
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1258
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1259
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_8

    .line 1262
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v7

    goto :goto_8

    .line 1230
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 1231
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_3

    .line 1257
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1258
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1259
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v7
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    .line 1239
    :cond_3
    const/4 v7, -0x1

    goto/16 :goto_4

    .line 1241
    :cond_4
    const/4 v7, -0x1

    goto :goto_5

    .line 1243
    :cond_5
    const/4 v7, 0x0

    goto :goto_6

    .line 1246
    :catch_4
    move-exception v3

    .line 1247
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_7
.end method

.method public onUpdatePlaybackPosition(JJ)V
    .locals 19
    .param p1, "duration"    # J
    .param p3, "position"    # J

    .prologue
    .line 1424
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v11, :cond_1

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->odd:Z

    if-eqz v11, :cond_1

    .line 1429
    :cond_0
    const/4 v4, 0x0

    .line 1430
    .local v4, "expired":Z
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v10

    .line 1431
    .local v10, "v":I
    if-gtz v10, :cond_2

    .line 1437
    :goto_0
    if-eqz v4, :cond_1

    .line 1438
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 1442
    .local v8, "playbackTime":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 1443
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1444
    .local v7, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v6

    .line 1447
    .local v6, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v11, 0x2

    :try_start_1
    invoke-virtual {v2, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1450
    const/4 v11, 0x1

    :try_start_2
    invoke-virtual {v2, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v12, v12

    .line 1451
    invoke-virtual {v11, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    const/4 v12, 0x0

    .line 1452
    invoke-virtual {v11, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v11, :cond_4

    move-wide/from16 v0, p1

    long-to-int v11, v0

    .line 1453
    :goto_1
    invoke-virtual {v12, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v11, :cond_5

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 1454
    :goto_2
    invoke-virtual {v12, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    .line 1455
    invoke-virtual {v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1460
    :goto_3
    const/4 v11, 0x3

    :try_start_3
    invoke-virtual {v7, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1463
    :try_start_4
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v7, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 1464
    invoke-virtual {v11, v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v12, v12

    .line 1465
    invoke-virtual {v11, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    const-string/jumbo v12, "AndroidMP"

    .line 1466
    invoke-virtual {v11, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    .line 1467
    invoke-virtual {v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1472
    :goto_4
    const/4 v11, 0x4

    :try_start_5
    invoke-virtual {v6, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1475
    const/4 v11, 0x7

    :try_start_6
    invoke-virtual {v6, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1476
    invoke-virtual {v12}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v12, v8, v12

    long-to-int v12, v12

    .line 1477
    invoke-virtual {v11, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v11, :cond_6

    move-wide/from16 v0, p3

    long-to-int v11, v0

    .line 1478
    :goto_5
    invoke-virtual {v12, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v11, :cond_7

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 1479
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const v13, 0xf4240

    mul-int/2addr v11, v13

    :goto_6
    invoke-virtual {v12, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    .line 1480
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v12

    invoke-virtual {v11, v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 1481
    invoke-virtual {v11, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v16, 0x0

    cmp-long v11, v14, v16

    if-eqz v11, :cond_8

    const/4 v11, 0x1

    .line 1482
    :goto_7
    invoke-virtual {v12, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    .line 1483
    invoke-virtual {v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1488
    :goto_8
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v5

    .line 1489
    .local v5, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v5, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    .line 1490
    invoke-virtual {v11, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    .line 1491
    invoke-virtual {v11, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    .line 1489
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1495
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1496
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1497
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 1539
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v7    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_9
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v12, 0x1e

    invoke-virtual {v11, v12}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 1544
    .end local v4    # "expired":Z
    .end local v8    # "playbackTime":J
    .end local v10    # "v":I
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->odd:Z

    if-nez v11, :cond_9

    const/4 v11, 0x1

    :goto_a
    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->odd:Z

    .line 1545
    return-void

    .line 1433
    .restart local v4    # "expired":Z
    .restart local v10    # "v":I
    :cond_2
    const/4 v11, 0x1

    if-ne v10, v11, :cond_3

    .line 1434
    const/4 v4, 0x1

    .line 1435
    :cond_3
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    add-int/lit8 v12, v10, -0x1

    invoke-virtual {v11, v10, v12}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v11

    if-eqz v11, :cond_0

    goto/16 :goto_0

    .line 1452
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v7    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_4
    const/4 v11, 0x0

    goto/16 :goto_1

    .line 1453
    :cond_5
    :try_start_9
    const-string/jumbo v11, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_2

    .line 1456
    :catch_0
    move-exception v3

    .line 1457
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_3

    .line 1493
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v11

    .line 1495
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1496
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1497
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_9

    .line 1500
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v7    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v11

    goto :goto_9

    .line 1468
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v7    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 1469
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_4

    .line 1495
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v11

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1496
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1497
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v11
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    .line 1477
    :cond_6
    const/4 v11, -0x1

    goto/16 :goto_5

    .line 1479
    :cond_7
    const/4 v11, -0x1

    goto/16 :goto_6

    .line 1481
    :cond_8
    const/4 v11, 0x0

    goto :goto_7

    .line 1484
    :catch_4
    move-exception v3

    .line 1485
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_8

    .line 1544
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "expired":Z
    .end local v6    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v7    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackTime":J
    .end local v10    # "v":I
    :cond_9
    const/4 v11, 0x0

    goto :goto_a
.end method

.method public pause(ZJJ)V
    .locals 16
    .param p1, "isPlaying"    # Z
    .param p2, "duration"    # J
    .param p4, "position"    # J

    .prologue
    .line 79
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v7, :cond_0

    .line 81
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_0

    if-eqz p1, :cond_0

    .line 83
    const/4 v7, 0x1

    move-object/from16 v0, p0

    iput-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPaused:Z

    .line 84
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v10, 0x1e

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 86
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 90
    .local v8, "playbackTime":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 91
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 92
    .local v6, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 95
    .local v5, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v7, 0x2

    :try_start_1
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 98
    const/4 v7, 0x1

    :try_start_2
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v10, v10

    .line 99
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 100
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_1

    move-wide/from16 v0, p2

    long-to-int v7, v0

    .line 101
    :goto_0
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v7, :cond_2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 102
    :goto_1
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 103
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 108
    :goto_2
    const/4 v7, 0x3

    :try_start_3
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 111
    :try_start_4
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 112
    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v10, v10

    .line 113
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const-string/jumbo v10, "AndroidMP"

    .line 114
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 115
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 120
    :goto_3
    const/4 v7, 0x4

    :try_start_5
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 123
    const/4 v7, 0x4

    :try_start_6
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 124
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v10

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 125
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_3

    move-wide/from16 v0, p4

    long-to-int v7, v0

    .line 126
    :goto_4
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v7, :cond_4

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 127
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v11, 0xf4240

    mul-int/2addr v7, v11

    :goto_5
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 128
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 129
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v14, 0x0

    cmp-long v7, v12, v14

    if-eqz v7, :cond_5

    const/4 v7, 0x1

    .line 130
    :goto_6
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 131
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 136
    :goto_7
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 137
    .local v4, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 138
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 139
    invoke-virtual {v7, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 137
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 143
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 144
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 145
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 194
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v4    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackTime":J
    :cond_0
    :goto_8
    return-void

    .line 100
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_1
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 101
    :cond_2
    :try_start_9
    const-string/jumbo v7, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_1

    .line 104
    :catch_0
    move-exception v3

    .line 105
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_2

    .line 141
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 143
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 144
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 145
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_8

    .line 148
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v7

    goto :goto_8

    .line 116
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 117
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_3

    .line 143
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 144
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 145
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v7
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    .line 125
    :cond_3
    const/4 v7, -0x1

    goto/16 :goto_4

    .line 127
    :cond_4
    const/4 v7, -0x1

    goto :goto_5

    .line 129
    :cond_5
    const/4 v7, 0x0

    goto :goto_6

    .line 132
    :catch_4
    move-exception v3

    .line 133
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_7
.end method

.method public play(JJ)V
    .locals 17
    .param p1, "duration"    # J
    .param p3, "position"    # J

    .prologue
    .line 200
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v7, :cond_0

    .line 201
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPaused:Z

    if-eqz v7, :cond_0

    .line 205
    const/4 v7, 0x0

    move-object/from16 v0, p0

    iput-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPaused:Z

    .line 206
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v10, 0x1e

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 208
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 212
    .local v8, "playbackTime":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 213
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 214
    .local v6, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 217
    .local v5, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v7, 0x2

    :try_start_1
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 220
    const/4 v7, 0x1

    :try_start_2
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v10, v10

    .line 221
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 222
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_1

    move-wide/from16 v0, p1

    long-to-int v7, v0

    .line 223
    :goto_0
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v7, :cond_2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 224
    :goto_1
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 225
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 230
    :goto_2
    const/4 v7, 0x3

    :try_start_3
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 233
    :try_start_4
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 234
    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v10, v10

    .line 235
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const-string/jumbo v10, "AndroidMP"

    .line 236
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 237
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 242
    :goto_3
    const/4 v7, 0x4

    :try_start_5
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 245
    const/4 v7, 0x5

    :try_start_6
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 246
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v10

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 247
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v7, :cond_3

    move-wide/from16 v0, p3

    long-to-int v7, v0

    .line 248
    :goto_4
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v7, :cond_4

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 249
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v11, 0xf4240

    mul-int/2addr v7, v11

    :goto_5
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 250
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 251
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v14, 0x0

    cmp-long v7, v12, v14

    if-eqz v7, :cond_5

    const/4 v7, 0x1

    .line 252
    :goto_6
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 253
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 258
    :goto_7
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 259
    .local v4, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 260
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 261
    invoke-virtual {v7, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 259
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 265
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 266
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 267
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 311
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v4    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackTime":J
    :cond_0
    :goto_8
    return-void

    .line 222
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_1
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 223
    :cond_2
    :try_start_9
    const-string/jumbo v7, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_1

    .line 226
    :catch_0
    move-exception v3

    .line 227
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_2

    .line 263
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 265
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 266
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 267
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_8

    .line 270
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v7

    goto :goto_8

    .line 238
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 239
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_3

    .line 265
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 266
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 267
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v7
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    .line 247
    :cond_3
    const/4 v7, -0x1

    goto/16 :goto_4

    .line 249
    :cond_4
    const/4 v7, -0x1

    goto :goto_5

    .line 251
    :cond_5
    const/4 v7, 0x0

    goto :goto_6

    .line 254
    :catch_4
    move-exception v3

    .line 255
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_7
.end method

.method public release(JJ)V
    .locals 17
    .param p1, "duration"    # J
    .param p3, "position"    # J

    .prologue
    .line 625
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v10, :cond_0

    .line 626
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 628
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 632
    .local v8, "playbackTime":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 633
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 634
    .local v6, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v5

    .line 637
    .local v5, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v10, 0x2

    :try_start_1
    invoke-virtual {v2, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 640
    const/4 v10, 0x1

    :try_start_2
    invoke-virtual {v2, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v11, v11

    .line 641
    invoke-virtual {v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    const/4 v11, 0x0

    .line 642
    invoke-virtual {v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v10, :cond_1

    move-wide/from16 v0, p1

    long-to-int v10, v0

    .line 643
    :goto_0
    invoke-virtual {v11, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v10, :cond_2

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 644
    :goto_1
    invoke-virtual {v11, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    .line 645
    invoke-virtual {v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 650
    :goto_2
    const/4 v10, 0x3

    :try_start_3
    invoke-virtual {v6, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 653
    :try_start_4
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v6, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 654
    invoke-virtual {v10, v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v11, v11

    .line 655
    invoke-virtual {v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    const-string/jumbo v11, "AndroidMP"

    .line 656
    invoke-virtual {v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    .line 657
    invoke-virtual {v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 662
    :goto_3
    const/4 v10, 0x4

    :try_start_5
    invoke-virtual {v5, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 665
    const/16 v10, 0x9

    :try_start_6
    invoke-virtual {v5, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 666
    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v11

    invoke-virtual {v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v12, v8, v12

    long-to-int v11, v12

    .line 667
    invoke-virtual {v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v10, :cond_3

    move-wide/from16 v0, p3

    long-to-int v10, v0

    .line 668
    :goto_4
    invoke-virtual {v11, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v10, :cond_4

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 669
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const v12, 0xf4240

    mul-int/2addr v10, v12

    :goto_5
    invoke-virtual {v11, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    .line 670
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v12

    invoke-virtual {v10, v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 671
    invoke-virtual {v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v14, 0x0

    cmp-long v10, v12, v14

    if-eqz v10, :cond_5

    const/4 v10, 0x1

    .line 672
    :goto_6
    invoke-virtual {v11, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    .line 673
    invoke-virtual {v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 678
    :goto_7
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 679
    .local v4, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    .line 680
    invoke-virtual {v10, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    .line 681
    invoke-virtual {v10, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    .line 679
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 685
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 686
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 687
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 693
    .end local v4    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_8
    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v10}, Lcom/vkontakte/android/VKApplication;->getVigo(Landroid/content/Context;)Lcom/vkontakte/android/media/Vigo;

    move-result-object v7

    .line 694
    .local v7, "vigo":Lcom/vkontakte/android/media/Vigo;
    invoke-virtual {v7}, Lcom/vkontakte/android/media/Vigo;->collectPlaybackChangesOFF()V

    .line 740
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v7    # "vigo":Lcom/vkontakte/android/media/Vigo;
    .end local v8    # "playbackTime":J
    :cond_0
    :goto_9
    return-void

    .line 642
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_1
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 643
    :cond_2
    :try_start_9
    const-string/jumbo v10, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_1

    .line 646
    :catch_0
    move-exception v3

    .line 647
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_2

    .line 683
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v10

    .line 685
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 686
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 687
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto :goto_8

    .line 690
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v10

    .line 693
    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v10}, Lcom/vkontakte/android/VKApplication;->getVigo(Landroid/content/Context;)Lcom/vkontakte/android/media/Vigo;

    move-result-object v7

    .line 694
    .restart local v7    # "vigo":Lcom/vkontakte/android/media/Vigo;
    invoke-virtual {v7}, Lcom/vkontakte/android/media/Vigo;->collectPlaybackChangesOFF()V

    goto :goto_9

    .line 658
    .end local v7    # "vigo":Lcom/vkontakte/android/media/Vigo;
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 659
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_3

    .line 685
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v10

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 686
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 687
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v10
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 693
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catchall_1
    move-exception v10

    sget-object v11, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v11}, Lcom/vkontakte/android/VKApplication;->getVigo(Landroid/content/Context;)Lcom/vkontakte/android/media/Vigo;

    move-result-object v7

    .line 694
    .restart local v7    # "vigo":Lcom/vkontakte/android/media/Vigo;
    invoke-virtual {v7}, Lcom/vkontakte/android/media/Vigo;->collectPlaybackChangesOFF()V

    .line 695
    throw v10

    .line 667
    .end local v7    # "vigo":Lcom/vkontakte/android/media/Vigo;
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :cond_3
    const/4 v10, -0x1

    goto/16 :goto_4

    .line 669
    :cond_4
    const/4 v10, -0x1

    goto/16 :goto_5

    .line 671
    :cond_5
    const/4 v10, 0x0

    goto :goto_6

    .line 674
    :catch_4
    move-exception v3

    .line 675
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_7
.end method

.method public seek(FZJJ)V
    .locals 19
    .param p1, "offset"    # F
    .param p2, "isPlaying"    # Z
    .param p3, "duration"    # J
    .param p5, "position"    # J

    .prologue
    .line 429
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v9, :cond_0

    .line 430
    if-eqz p2, :cond_0

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v9, :cond_0

    .line 431
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPaused:Z

    if-eqz v9, :cond_1

    .line 432
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 585
    :cond_0
    :goto_0
    return-void

    .line 434
    :cond_1
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v12, 0x1e

    invoke-virtual {v9, v12}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 436
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    .line 437
    .local v10, "playbackTime":J
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v2

    .line 440
    .local v2, "bytes":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 441
    .local v4, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v8

    .line 442
    .local v8, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v7

    .line 446
    .local v7, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v9, 0x2

    :try_start_1
    invoke-virtual {v4, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 449
    const/4 v9, 0x1

    :try_start_2
    invoke-virtual {v4, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v12, v12

    .line 450
    invoke-virtual {v9, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    const/4 v12, 0x0

    .line 451
    invoke-virtual {v9, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v9, :cond_2

    move-wide/from16 v0, p3

    long-to-int v9, v0

    .line 452
    :goto_1
    invoke-virtual {v12, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v9, :cond_3

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 453
    :goto_2
    invoke-virtual {v12, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    .line 454
    invoke-virtual {v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 459
    :goto_3
    const/4 v9, 0x3

    :try_start_3
    invoke-virtual {v8, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 462
    :try_start_4
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 463
    invoke-virtual {v9, v12, v13}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v12, v12

    .line 464
    invoke-virtual {v9, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    const-string/jumbo v12, "AndroidMP"

    .line 465
    invoke-virtual {v9, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    .line 466
    invoke-virtual {v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 471
    :goto_4
    const/4 v9, 0x4

    :try_start_5
    invoke-virtual {v7, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 474
    const/4 v9, 0x7

    :try_start_6
    invoke-virtual {v7, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 475
    invoke-virtual {v12}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v12

    invoke-virtual {v9, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v12, v10, v12

    long-to-int v12, v12

    .line 476
    invoke-virtual {v9, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v9, :cond_4

    move-wide/from16 v0, p5

    long-to-int v9, v0

    .line 477
    :goto_5
    invoke-virtual {v12, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v9, :cond_5

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 478
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const v13, 0xf4240

    mul-int/2addr v9, v13

    :goto_6
    invoke-virtual {v12, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    .line 479
    invoke-virtual {v9, v2, v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 480
    invoke-virtual {v9, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v16, 0x0

    cmp-long v9, v14, v16

    if-eqz v9, :cond_6

    const/4 v9, 0x1

    .line 481
    :goto_7
    invoke-virtual {v12, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 483
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 485
    const/4 v9, 0x6

    invoke-virtual {v7, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 486
    invoke-virtual {v12}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v12

    invoke-virtual {v9, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v12, v10, v12

    long-to-int v12, v12

    .line 487
    invoke-virtual {v9, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    if-eqz v9, :cond_7

    move/from16 v0, p1

    float-to-int v9, v0

    .line 488
    :goto_8
    invoke-virtual {v12, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v9, :cond_8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 489
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const v13, 0xf4240

    mul-int/2addr v9, v13

    :goto_9
    invoke-virtual {v12, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    .line 490
    invoke-virtual {v9, v2, v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 491
    invoke-virtual {v9, v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v12

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v16, 0x0

    cmp-long v9, v14, v16

    if-eqz v9, :cond_9

    const/4 v9, 0x1

    .line 492
    :goto_a
    invoke-virtual {v12, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    .line 493
    invoke-virtual {v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 499
    :goto_b
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 500
    .local v6, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v6, v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    .line 501
    invoke-virtual {v9, v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    .line 502
    invoke-virtual {v9, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    .line 500
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 506
    :try_start_8
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 507
    invoke-virtual {v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 508
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 514
    .end local v6    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_c
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    goto/16 :goto_0

    .line 451
    :cond_2
    const/4 v9, 0x0

    goto/16 :goto_1

    .line 452
    :cond_3
    :try_start_9
    const-string/jumbo v9, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_2

    .line 455
    :catch_0
    move-exception v5

    .line 456
    .local v5, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_3

    .line 504
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v9

    .line 506
    :try_start_b
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 507
    invoke-virtual {v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 508
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto :goto_c

    .line 511
    .end local v4    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v7    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v9

    .line 514
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    goto/16 :goto_0

    .line 467
    .restart local v4    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v7    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v5

    .line 468
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_4

    .line 506
    .end local v5    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v9

    :try_start_d
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 507
    invoke-virtual {v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 508
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v9
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 514
    .end local v4    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v7    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v8    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catchall_1
    move-exception v9

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    throw v9

    .line 476
    .restart local v4    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v7    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :cond_4
    const/4 v9, -0x1

    goto/16 :goto_5

    .line 478
    :cond_5
    const/4 v9, -0x1

    goto/16 :goto_6

    .line 480
    :cond_6
    const/4 v9, 0x0

    goto/16 :goto_7

    .line 487
    :cond_7
    const/4 v9, -0x1

    goto/16 :goto_8

    .line 489
    :cond_8
    const/4 v9, -0x1

    goto/16 :goto_9

    .line 491
    :cond_9
    const/4 v9, 0x0

    goto :goto_a

    .line 495
    :catch_4
    move-exception v5

    .line 496
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_b
.end method

.method public setDataSourceAndPrepare(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "quality"    # I
    .param p3, "svcid"    # Ljava/lang/String;

    .prologue
    .line 62
    const/16 v0, 0x64

    if-eq p2, v0, :cond_0

    .line 63
    iput-object p1, p0, Lcom/vkontakte/android/media/VigoDelegate;->url:Ljava/lang/String;

    .line 66
    :cond_0
    iput p2, p0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    .line 67
    iput-object p3, p0, Lcom/vkontakte/android/media/VigoDelegate;->svcid:Ljava/lang/String;

    .line 68
    return-void
.end method

.method public setHost(Landroid/net/Uri;)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 72
    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    :goto_0
    return-void

    .line 73
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public vigoOnPrepared(JJ)V
    .locals 15
    .param p1, "duration"    # J
    .param p3, "position"    # J

    .prologue
    .line 1308
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->isPrepared:Z

    .line 1309
    iget-boolean v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->isQualityAdviserSupported:Z

    if-eqz v7, :cond_0

    iget-boolean v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->isPaused:Z

    if-nez v7, :cond_0

    .line 1310
    iget-wide v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    const-wide/16 v12, 0x0

    cmp-long v7, v10, v12

    if-eqz v7, :cond_0

    .line 1311
    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->heartbeatTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v10, 0x1e

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 1313
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 1317
    .local v8, "playbackTime":J
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 1318
    .local v2, "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 1319
    .local v6, "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 1322
    .local v5, "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v7, 0x2

    :try_start_1
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1325
    const/4 v7, 0x1

    :try_start_2
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->quality:I

    int-to-byte v10, v10

    .line 1326
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 1327
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-wide/from16 v0, p1

    long-to-int v10, v0

    .line 1328
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->host:Ljava/lang/String;

    .line 1329
    :goto_0
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1330
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1335
    :goto_1
    const/4 v7, 0x3

    :try_start_3
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1338
    :try_start_4
    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->watchId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-wide v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTs:J

    .line 1339
    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->timeZone:I

    int-to-short v10, v10

    .line 1340
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const-string/jumbo v10, "AndroidMP"

    .line 1341
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1342
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1347
    :goto_2
    const/4 v7, 0x4

    :try_start_5
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1350
    const/4 v7, 0x3

    :try_start_6
    invoke-virtual {v5, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-object v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->seqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1351
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v10

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-wide v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->playbackStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 1352
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    move-wide/from16 v0, p3

    long-to-int v10, v0

    .line 1353
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufferPct:Ljava/lang/Integer;

    .line 1354
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const v11, 0xf4240

    mul-int/2addr v7, v11

    :goto_3
    invoke-virtual {v10, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1355
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->instantBitrate:I

    .line 1356
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v10, 0x0

    .line 1357
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufNum:I

    .line 1358
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-wide v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    sub-long v10, v8, v10

    long-to-int v10, v10

    .line 1359
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1360
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1365
    :goto_4
    :try_start_7
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 1366
    .local v4, "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1367
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1368
    invoke-virtual {v7, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    .line 1366
    invoke-direct {p0, v7}, Lcom/vkontakte/android/media/VigoDelegate;->sendVigoEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1372
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1373
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1374
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 1416
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v4    # "pb":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_5
    const-wide/16 v10, 0x0

    iput-wide v10, p0, Lcom/vkontakte/android/media/VigoDelegate;->bufStartTime:J

    .line 1420
    .end local v8    # "playbackTime":J
    :cond_0
    return-void

    .line 1328
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v8    # "playbackTime":J
    :cond_1
    :try_start_9
    const-string/jumbo v7, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_0

    .line 1331
    :catch_0
    move-exception v3

    .line 1332
    .local v3, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_1

    .line 1370
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 1372
    :try_start_b
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1373
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1374
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_5

    .line 1377
    .end local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v7

    goto :goto_5

    .line 1343
    .restart local v2    # "contentInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v5    # "playbackEvents":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v6    # "playbackInfoParts":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v3

    .line 1344
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_c
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_2

    .line 1372
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1373
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1374
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v7
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    .line 1354
    :cond_2
    const/4 v7, -0x1

    goto :goto_3

    .line 1361
    :catch_4
    move-exception v3

    .line 1362
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_4
.end method
