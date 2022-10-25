.class public Lcom/vkontakte/android/media/Vigo;
.super Landroid/telephony/PhoneStateListener;
.source "Vigo.java"


# static fields
.field public static final ANDROID_MEDIA_PLAYER:Ljava/lang/String; = "AndroidMP"

.field public static final API_CATEGORY_MESSAGE_IN_TEXT:B = 0x5t

.field public static final API_CATEGORY_MESSAGE_IN_TEXT_HISTORY:B = 0x6t

.field public static final API_CATEGORY_MESSAGE_OUT_TEXT:B = 0x7t

.field public static final API_CATEGORY_NEWS_FEED_TEXT_IN:B = 0x1t

.field public static final API_CATEGORY_PHOTO_IN:B = 0x3t

.field public static final API_CATEGORY_PHOTO_OUT:B = 0x4t

.field public static final API_CATEGORY_PREVIEW_PHOTO_IN:B = 0x2t

.field private static final CELL_INFO_GSM:B = 0x1t

.field private static final CELL_INFO_LTE:B = 0x3t

.field private static final CELL_INFO_MAX_TICK:I = 0x3

.field private static final CELL_INFO_UPDATE_TIMER:I = 0x3e8

.field private static final CELL_INFO_WCDMA:B = 0x2t

.field private static final MAC_ADDR_LEN:I = 0xc

.field private static final MAX_WIFI_LEVEL:I = 0x5

.field private static final MAX_WIFI_POINTS:I = 0x5

.field public static final MEDIA_TYPE_AUDIO:B = 0x2t

.field public static final MEDIA_TYPE_VIDEO:B = 0x1t

.field private static final MIN_WIFI_LEVEL:I = 0x3

.field public static final PLAYBACK_EVENTYPE_BITRATECHANGE:B = 0x8t

.field public static final PLAYBACK_EVENTYPE_BUF_START:B = 0x2t

.field public static final PLAYBACK_EVENTYPE_BUF_STOP:B = 0x3t

.field public static final PLAYBACK_EVENTYPE_ERROR:B = 0xat

.field public static final PLAYBACK_EVENTYPE_HEARTBEAT:B = 0x7t

.field public static final PLAYBACK_EVENTYPE_PAUSE:B = 0x4t

.field public static final PLAYBACK_EVENTYPE_PLAY:B = 0x1t

.field public static final PLAYBACK_EVENTYPE_RESUME:B = 0x5t

.field public static final PLAYBACK_EVENTYPE_SEEK:B = 0x6t

.field public static final PLAYBACK_EVENTYPE_STOP:B = 0x9t

.field private static final WIFI_SIGNAL_INFO:B = 0x1t

.field private static final WIFI_SIGNAL_INFO_ACTIVE:B = 0x2t


# instance fields
.field private apiEvents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/media/VigoApiEvent;",
            ">;"
        }
    .end annotation
.end field

.field private apiSessionInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

.field private apiSessionStartTime:J

.field private final cellInfoTicker:Ljava/util/concurrent/atomic/AtomicInteger;

.field private clientInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

.field private cm:Landroid/net/ConnectivityManager;

.field private contextLocation:Ljava/lang/String;

.field private ctx:Landroid/content/Context;

.field private msignal:Lcom/vkontakte/android/media/VigoBinaryBuffer;

.field private networkTimer:Ljava/util/Timer;

.field private pbEvents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/media/VigoBinaryBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private playbackStartTime:J

.field private tm:Landroid/telephony/TelephonyManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 141
    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    .line 102
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/Vigo;->cellInfoTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 120
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/media/Vigo;->contextLocation:Ljava/lang/String;

    .line 142
    if-eqz p1, :cond_1

    .line 143
    iput-object p1, p0, Lcom/vkontakte/android/media/Vigo;->ctx:Landroid/content/Context;

    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->ctx:Landroid/content/Context;

    const-string/jumbo v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->ctx:Landroid/content/Context;

    const-string/jumbo v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/vkontakte/android/media/Vigo;->cm:Landroid/net/ConnectivityManager;

    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    const/16 v1, 0x150

    invoke-virtual {v0, p0, v1}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 154
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/Vigo;->clientInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 155
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->clientInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 156
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->clientInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/Vigo;->getClientInfo(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/Vigo;->clientInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 161
    :goto_0
    :try_start_1
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/Vigo;->msignal:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->msignal:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 166
    :cond_1
    :goto_1
    return-void

    .line 164
    :catch_0
    move-exception v0

    goto :goto_1

    .line 158
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/vkontakte/android/media/Vigo;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/media/Vigo;

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/media/Vigo;->cellInfoUpdate()V

    return-void
.end method

.method private cellInfoUpdate()V
    .locals 3

    .prologue
    .line 1119
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    if-nez v2, :cond_0

    .line 1149
    :goto_0
    return-void

    .line 1122
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->cellInfoTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v2

    if-gtz v2, :cond_1

    .line 1123
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->networkTimer:Ljava/util/Timer;

    if-eqz v2, :cond_1

    .line 1124
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->networkTimer:Ljava/util/Timer;

    invoke-virtual {v2}, Ljava/util/Timer;->cancel()V

    .line 1125
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/media/Vigo;->networkTimer:Ljava/util/Timer;

    .line 1129
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/media/Vigo;->contextLocation:Ljava/lang/String;

    .line 1131
    .local v1, "tmp":Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 1133
    .local v0, "networkInformation":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v2, 0x5

    :try_start_1
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 1136
    const/4 v2, 0x0

    invoke-direct {p0, v0, v2}, Lcom/vkontakte/android/media/Vigo;->updateNetworkInformation(Lcom/vkontakte/android/media/VigoBinaryBuffer;Landroid/telephony/CellLocation;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v0

    .line 1138
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->contextLocation:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1139
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/Vigo;->createApiEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V

    .line 1140
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/Vigo;->createPlaybackEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1145
    :cond_2
    :try_start_2
    invoke-virtual {v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    goto :goto_0

    .line 1148
    .end local v0    # "networkInformation":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v1    # "tmp":Ljava/lang/String;
    :catch_0
    move-exception v2

    goto :goto_0

    .line 1143
    .restart local v0    # "networkInformation":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v1    # "tmp":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 1145
    invoke-virtual {v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    goto :goto_0

    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
.end method

.method private createApiEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    .locals 10
    .param p1, "networkInfo"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .prologue
    .line 832
    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    if-nez v4, :cond_0

    .line 862
    :goto_0
    return-void

    .line 835
    :cond_0
    :try_start_0
    iget-object v5, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    monitor-enter v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 837
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionStartTime:J

    sub-long/2addr v6, v8

    long-to-int v3, v6

    .line 839
    .local v3, "timeOffset":I
    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 841
    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VigoApiEvent;

    .line 842
    .local v0, "apiEvent":Lcom/vkontakte/android/media/VigoApiEvent;
    iget-object v4, v0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 843
    iget-object v4, v0, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v4, v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 844
    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-interface {v4, v6, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 853
    .end local v0    # "apiEvent":Lcom/vkontakte/android/media/VigoApiEvent;
    :cond_1
    :goto_1
    invoke-static {}, Lcom/vkontakte/android/media/VigoApiEvent;->getObject()Lcom/vkontakte/android/media/VigoApiEvent;

    move-result-object v2

    .line 854
    .local v2, "newApiEvent":Lcom/vkontakte/android/media/VigoApiEvent;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    iput-object v4, v2, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 856
    iget-object v4, v2, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v4, p1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 857
    iget-object v4, v2, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v4, v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 859
    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 860
    monitor-exit v5

    goto :goto_0

    .end local v2    # "newApiEvent":Lcom/vkontakte/android/media/VigoApiEvent;
    .end local v3    # "timeOffset":I
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 861
    :catch_0
    move-exception v4

    goto :goto_0

    .line 846
    .restart local v0    # "apiEvent":Lcom/vkontakte/android/media/VigoApiEvent;
    .restart local v3    # "timeOffset":I
    :cond_2
    :try_start_3
    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-interface {v4, v6}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/media/VigoApiEvent;

    .line 847
    .local v1, "event":Lcom/vkontakte/android/media/VigoApiEvent;
    iget-object v4, v1, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 848
    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoApiEvent;->returnObject()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method private createPlaybackEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    .locals 8
    .param p1, "networkInfo"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .prologue
    .line 865
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    if-nez v2, :cond_0

    .line 881
    :goto_0
    return-void

    .line 868
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 869
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/vkontakte/android/media/Vigo;->playbackStartTime:J

    sub-long/2addr v4, v6

    long-to-int v1, v4

    .line 872
    .local v1, "timeOffset":I
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v0

    .line 873
    .local v0, "newPlaybackEvent":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 875
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 876
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 878
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 879
    monitor-exit v3

    goto :goto_0

    .end local v0    # "newPlaybackEvent":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v1    # "timeOffset":I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 880
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private getCell(Landroid/telephony/CellLocation;Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 30
    .param p1, "location"    # Landroid/telephony/CellLocation;
    .param p2, "networkInfoParts"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .prologue
    .line 495
    :try_start_0
    move-object/from16 v0, p1

    instance-of v0, v0, Landroid/telephony/gsm/GsmCellLocation;

    move/from16 v21, v0

    if-eqz v21, :cond_6

    .line 496
    move-object/from16 v0, p1

    check-cast v0, Landroid/telephony/gsm/GsmCellLocation;

    move-object v6, v0

    .line 497
    .local v6, "ci":Landroid/telephony/gsm/GsmCellLocation;
    invoke-virtual {v6}, Landroid/telephony/gsm/GsmCellLocation;->getLac()I

    move-result v21

    const/high16 v22, -0x10000

    and-int v21, v21, v22

    if-eqz v21, :cond_4

    const/16 v21, -0x1

    :goto_0
    move-object/from16 v0, p2

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v21

    .line 498
    invoke-virtual {v6}, Landroid/telephony/gsm/GsmCellLocation;->getCid()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v22

    .line 499
    invoke-virtual {v6}, Landroid/telephony/gsm/GsmCellLocation;->getPsc()I

    move-result v21

    const/16 v23, 0x7fff

    move/from16 v0, v21

    move/from16 v1, v23

    if-gt v0, v1, :cond_0

    invoke-virtual {v6}, Landroid/telephony/gsm/GsmCellLocation;->getPsc()I

    move-result v21

    const/16 v23, -0x8000

    move/from16 v0, v21

    move/from16 v1, v23

    if-ge v0, v1, :cond_5

    :cond_0
    const/16 v21, -0x1

    :goto_1
    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 506
    .end local v6    # "ci":Landroid/telephony/gsm/GsmCellLocation;
    :goto_2
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    .line 508
    .local v4, "cellInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/16 v21, 0x0

    :try_start_1
    move/from16 v0, v21

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 510
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 513
    .local v7, "context":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_2
    sget v21, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v22, 0x11

    move/from16 v0, v21

    move/from16 v1, v22

    if-lt v0, v1, :cond_29

    .line 514
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    move-object/from16 v21, v0

    if-eqz v21, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/telephony/TelephonyManager;->getAllCellInfo()Ljava/util/List;

    move-result-object v5

    .line 515
    .local v5, "cells":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/CellInfo;>;"
    :goto_3
    if-eqz v5, :cond_28

    .line 516
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :cond_1
    :goto_4
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_28

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/CellInfo;

    .line 517
    .local v3, "cell":Landroid/telephony/CellInfo;
    invoke-virtual {v3}, Landroid/telephony/CellInfo;->isRegistered()Z

    move-result v21

    if-eqz v21, :cond_1

    .line 518
    instance-of v0, v3, Landroid/telephony/CellInfoGsm;

    move/from16 v21, v0

    if-eqz v21, :cond_d

    .line 519
    move-object v0, v3

    check-cast v0, Landroid/telephony/CellInfoGsm;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/telephony/CellInfoGsm;->getCellIdentity()Landroid/telephony/CellIdentityGsm;

    move-result-object v6

    .line 520
    .local v6, "ci":Landroid/telephony/CellIdentityGsm;
    check-cast v3, Landroid/telephony/CellInfoGsm;

    .end local v3    # "cell":Landroid/telephony/CellInfo;
    invoke-virtual {v3}, Landroid/telephony/CellInfoGsm;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthGsm;

    move-result-object v9

    .line 521
    .local v9, "cs":Landroid/telephony/CellSignalStrengthGsm;
    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getMcc()I

    move-result v21

    const v23, 0x7fffffff

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_1

    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getMnc()I

    move-result v21

    const v23, 0x7fffffff

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_1

    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getLac()I

    move-result v21

    const v23, 0x7fffffff

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_1

    .line 523
    const-string/jumbo v21, "%X%X%X%X%X"

    const/16 v23, 0x5

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-wide/16 v26, 0x1

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getMcc()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x2

    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getMnc()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x3

    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getLac()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x4

    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getCid()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    .line 524
    .local v18, "sf":Ljava/lang/String;
    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 526
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 527
    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getMcc()I

    move-result v21

    const/high16 v24, -0x10000

    and-int v21, v21, v24

    if-eqz v21, :cond_8

    const/16 v21, -0x1

    :goto_5
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 528
    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getMnc()I

    move-result v21

    const/high16 v24, -0x10000

    and-int v21, v21, v24

    if-eqz v21, :cond_9

    const/16 v21, -0x1

    :goto_6
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 529
    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getLac()I

    move-result v21

    const/high16 v24, -0x10000

    and-int v21, v21, v24

    if-eqz v21, :cond_a

    const/16 v21, -0x1

    :goto_7
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v21

    .line 530
    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getCid()I

    move-result v23

    move-object/from16 v0, v21

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 532
    const/16 v16, -0x1

    .line 533
    .local v16, "rss":I
    const/4 v2, -0x1

    .line 536
    .local v2, "ber":I
    :try_start_3
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-string/jumbo v23, "mSignalStrength"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 537
    .local v11, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v13

    .line 538
    .local v13, "isAccessible":Z
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 539
    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v16

    .line 540
    invoke-virtual {v11, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 541
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-string/jumbo v23, "mBitErrorRate"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 542
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v13

    .line 543
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 544
    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    .line 545
    invoke-virtual {v11, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 549
    .end local v11    # "field":Ljava/lang/reflect/Field;
    .end local v13    # "isAccessible":Z
    :goto_8
    const/16 v21, 0x7fff

    move/from16 v0, v16

    move/from16 v1, v21

    if-gt v0, v1, :cond_2

    const/16 v21, -0x8000

    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_b

    :cond_2
    const/16 v21, -0x1

    :goto_9
    :try_start_4
    move/from16 v0, v21

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    const/16 v21, 0x7fff

    move/from16 v0, v21

    if-gt v2, v0, :cond_3

    const/16 v21, -0x8000

    move/from16 v0, v21

    if-ge v2, v0, :cond_c

    :cond_3
    const/16 v21, -0x1

    .line 550
    :goto_a
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_4

    .line 669
    .end local v2    # "ber":I
    .end local v5    # "cells":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/CellInfo;>;"
    .end local v6    # "ci":Landroid/telephony/CellIdentityGsm;
    .end local v9    # "cs":Landroid/telephony/CellSignalStrengthGsm;
    .end local v16    # "rss":I
    .end local v18    # "sf":Ljava/lang/String;
    :catch_0
    move-exception v10

    .line 670
    .local v10, "e":Ljava/lang/Exception;
    :try_start_5
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V

    .line 673
    .end local v10    # "e":Ljava/lang/Exception;
    :goto_b
    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 677
    :try_start_6
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 684
    .end local v4    # "cellInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v7    # "context":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_c
    return-object p2

    .line 497
    .local v6, "ci":Landroid/telephony/gsm/GsmCellLocation;
    :cond_4
    invoke-virtual {v6}, Landroid/telephony/gsm/GsmCellLocation;->getLac()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_0

    .line 499
    :cond_5
    invoke-virtual {v6}, Landroid/telephony/gsm/GsmCellLocation;->getPsc()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_1

    .line 501
    .end local v6    # "ci":Landroid/telephony/gsm/GsmCellLocation;
    :cond_6
    const/16 v21, -0x1

    move-object/from16 v0, p2

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v21

    const/16 v22, -0x1

    .line 502
    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v21

    const/16 v22, -0x1

    .line 503
    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto/16 :goto_2

    .line 680
    :catch_1
    move-exception v20

    .line 681
    .local v20, "x":Ljava/lang/Exception;
    invoke-virtual/range {p2 .. p2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V

    goto :goto_c

    .line 514
    .end local v20    # "x":Ljava/lang/Exception;
    .restart local v4    # "cellInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v7    # "context":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_7
    const/4 v5, 0x0

    goto/16 :goto_3

    .line 527
    .restart local v5    # "cells":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/CellInfo;>;"
    .local v6, "ci":Landroid/telephony/CellIdentityGsm;
    .restart local v9    # "cs":Landroid/telephony/CellSignalStrengthGsm;
    .restart local v18    # "sf":Ljava/lang/String;
    :cond_8
    :try_start_7
    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getMcc()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_5

    .line 528
    :cond_9
    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getMnc()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_6

    .line 529
    :cond_a
    invoke-virtual {v6}, Landroid/telephony/CellIdentityGsm;->getLac()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_7

    .line 549
    .restart local v2    # "ber":I
    .restart local v16    # "rss":I
    :cond_b
    move/from16 v0, v16

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_9

    :cond_c
    int-to-short v0, v2

    move/from16 v21, v0

    goto :goto_a

    .line 552
    .end local v2    # "ber":I
    .end local v6    # "ci":Landroid/telephony/CellIdentityGsm;
    .end local v9    # "cs":Landroid/telephony/CellSignalStrengthGsm;
    .end local v16    # "rss":I
    .end local v18    # "sf":Ljava/lang/String;
    .restart local v3    # "cell":Landroid/telephony/CellInfo;
    :cond_d
    sget v21, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v23, 0x11

    move/from16 v0, v21

    move/from16 v1, v23

    if-le v0, v1, :cond_17

    instance-of v0, v3, Landroid/telephony/CellInfoWcdma;

    move/from16 v21, v0

    if-eqz v21, :cond_17

    .line 553
    move-object v0, v3

    check-cast v0, Landroid/telephony/CellInfoWcdma;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/telephony/CellInfoWcdma;->getCellIdentity()Landroid/telephony/CellIdentityWcdma;

    move-result-object v6

    .line 554
    .local v6, "ci":Landroid/telephony/CellIdentityWcdma;
    check-cast v3, Landroid/telephony/CellInfoWcdma;

    .end local v3    # "cell":Landroid/telephony/CellInfo;
    invoke-virtual {v3}, Landroid/telephony/CellInfoWcdma;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthWcdma;

    move-result-object v9

    .line 555
    .local v9, "cs":Landroid/telephony/CellSignalStrengthWcdma;
    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getMcc()I

    move-result v21

    const v23, 0x7fffffff

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_1

    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getMnc()I

    move-result v21

    const v23, 0x7fffffff

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_1

    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getLac()I

    move-result v21

    const v23, 0x7fffffff

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_1

    .line 557
    const-string/jumbo v21, "%X%X%X%X%X"

    const/16 v23, 0x5

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-wide/16 v26, 0x2

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getMcc()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x2

    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getMnc()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x3

    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getLac()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x4

    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getCid()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    .line 558
    .restart local v18    # "sf":Ljava/lang/String;
    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 560
    const/16 v21, 0x2

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 561
    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getMcc()I

    move-result v21

    const/high16 v24, -0x10000

    and-int v21, v21, v24

    if-eqz v21, :cond_11

    const/16 v21, -0x1

    :goto_d
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 562
    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getMnc()I

    move-result v21

    const/high16 v24, -0x10000

    and-int v21, v21, v24

    if-eqz v21, :cond_12

    const/16 v21, -0x1

    :goto_e
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 563
    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getLac()I

    move-result v21

    const/high16 v24, -0x10000

    and-int v21, v21, v24

    if-eqz v21, :cond_13

    const/16 v21, -0x1

    :goto_f
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v21

    .line 564
    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getCid()I

    move-result v23

    move-object/from16 v0, v21

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 565
    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getPsc()I

    move-result v21

    const/16 v24, 0x7fff

    move/from16 v0, v21

    move/from16 v1, v24

    if-gt v0, v1, :cond_e

    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getPsc()I

    move-result v21

    const/16 v24, -0x8000

    move/from16 v0, v21

    move/from16 v1, v24

    if-ge v0, v1, :cond_14

    :cond_e
    const/16 v21, -0x1

    :goto_10
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 567
    const/16 v16, -0x1

    .line 568
    .restart local v16    # "rss":I
    const/4 v2, -0x1

    .line 571
    .restart local v2    # "ber":I
    :try_start_8
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-string/jumbo v23, "mSignalStrength"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 572
    .restart local v11    # "field":Ljava/lang/reflect/Field;
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v13

    .line 573
    .restart local v13    # "isAccessible":Z
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 574
    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v16

    .line 575
    invoke-virtual {v11, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 576
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-string/jumbo v23, "mBitErrorRate"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 577
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v13

    .line 578
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 579
    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    .line 580
    invoke-virtual {v11, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 584
    .end local v11    # "field":Ljava/lang/reflect/Field;
    .end local v13    # "isAccessible":Z
    :goto_11
    const/16 v21, 0x7fff

    move/from16 v0, v16

    move/from16 v1, v21

    if-gt v0, v1, :cond_f

    const/16 v21, -0x8000

    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_15

    :cond_f
    const/16 v21, -0x1

    :goto_12
    :try_start_9
    move/from16 v0, v21

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    const/16 v21, 0x7fff

    move/from16 v0, v21

    if-gt v2, v0, :cond_10

    const/16 v21, -0x8000

    move/from16 v0, v21

    if-ge v2, v0, :cond_16

    :cond_10
    const/16 v21, -0x1

    .line 585
    :goto_13
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_4

    .line 677
    .end local v2    # "ber":I
    .end local v5    # "cells":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/CellInfo;>;"
    .end local v6    # "ci":Landroid/telephony/CellIdentityWcdma;
    .end local v7    # "context":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v9    # "cs":Landroid/telephony/CellSignalStrengthWcdma;
    .end local v16    # "rss":I
    .end local v18    # "sf":Ljava/lang/String;
    :catchall_0
    move-exception v21

    :try_start_a
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v21
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1

    .line 561
    .restart local v5    # "cells":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/CellInfo;>;"
    .restart local v6    # "ci":Landroid/telephony/CellIdentityWcdma;
    .restart local v7    # "context":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v9    # "cs":Landroid/telephony/CellSignalStrengthWcdma;
    .restart local v18    # "sf":Ljava/lang/String;
    :cond_11
    :try_start_b
    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getMcc()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_d

    .line 562
    :cond_12
    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getMnc()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_e

    .line 563
    :cond_13
    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getLac()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_f

    .line 565
    :cond_14
    invoke-virtual {v6}, Landroid/telephony/CellIdentityWcdma;->getPsc()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_10

    .line 584
    .restart local v2    # "ber":I
    .restart local v16    # "rss":I
    :cond_15
    move/from16 v0, v16

    int-to-short v0, v0

    move/from16 v21, v0

    goto :goto_12

    :cond_16
    int-to-short v0, v2

    move/from16 v21, v0

    goto :goto_13

    .line 587
    .end local v2    # "ber":I
    .end local v6    # "ci":Landroid/telephony/CellIdentityWcdma;
    .end local v9    # "cs":Landroid/telephony/CellSignalStrengthWcdma;
    .end local v16    # "rss":I
    .end local v18    # "sf":Ljava/lang/String;
    .restart local v3    # "cell":Landroid/telephony/CellInfo;
    :cond_17
    instance-of v0, v3, Landroid/telephony/CellInfoLte;

    move/from16 v21, v0

    if-eqz v21, :cond_1

    .line 588
    move-object v0, v3

    check-cast v0, Landroid/telephony/CellInfoLte;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/telephony/CellInfoLte;->getCellIdentity()Landroid/telephony/CellIdentityLte;

    move-result-object v6

    .line 589
    .local v6, "ci":Landroid/telephony/CellIdentityLte;
    check-cast v3, Landroid/telephony/CellInfoLte;

    .end local v3    # "cell":Landroid/telephony/CellInfo;
    invoke-virtual {v3}, Landroid/telephony/CellInfoLte;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthLte;

    move-result-object v9

    .line 590
    .local v9, "cs":Landroid/telephony/CellSignalStrengthLte;
    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getMcc()I

    move-result v21

    const v23, 0x7fffffff

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_1

    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getMnc()I

    move-result v21

    const v23, 0x7fffffff

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_1

    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getTac()I

    move-result v21

    const v23, 0x7fffffff

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_1

    .line 592
    const-string/jumbo v21, "%X%X%X%X%X"

    const/16 v23, 0x5

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-wide/16 v26, 0x3

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getMcc()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x2

    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getMnc()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x3

    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getTac()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x4

    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getCi()I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    .line 593
    .restart local v18    # "sf":Ljava/lang/String;
    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 595
    const/16 v21, 0x3

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 596
    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getMcc()I

    move-result v21

    const/high16 v24, -0x10000

    and-int v21, v21, v24

    if-eqz v21, :cond_1e

    const/16 v21, -0x1

    :goto_14
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 597
    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getMnc()I

    move-result v21

    const/high16 v24, -0x10000

    and-int v21, v21, v24

    if-eqz v21, :cond_1f

    const/16 v21, -0x1

    :goto_15
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 598
    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getTac()I

    move-result v21

    const/high16 v24, -0x10000

    and-int v21, v21, v24

    if-eqz v21, :cond_20

    const/16 v21, -0x1

    :goto_16
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v21

    .line 599
    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getCi()I

    move-result v23

    move-object/from16 v0, v21

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    .line 600
    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getPci()I

    move-result v21

    const/16 v24, 0x7fff

    move/from16 v0, v21

    move/from16 v1, v24

    if-gt v0, v1, :cond_18

    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getPci()I

    move-result v21

    const/16 v24, -0x8000

    move/from16 v0, v21

    move/from16 v1, v24

    if-ge v0, v1, :cond_21

    :cond_18
    const/16 v21, -0x1

    :goto_17
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 602
    const/16 v16, -0x1

    .line 603
    .restart local v16    # "rss":I
    const/16 v14, 0x7fff

    .line 604
    .local v14, "rsrp":I
    const/16 v15, 0x7fff

    .line 605
    .local v15, "rsrq":I
    const/16 v17, 0x7fff

    .line 606
    .local v17, "rssnr":I
    const/4 v8, -0x1

    .line 607
    .local v8, "cqi":I
    const/16 v19, -0x1

    .line 610
    .local v19, "timingAdvance":I
    :try_start_c
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-string/jumbo v23, "mSignalStrength"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 611
    .restart local v11    # "field":Ljava/lang/reflect/Field;
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v13

    .line 612
    .restart local v13    # "isAccessible":Z
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 613
    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v16

    .line 614
    invoke-virtual {v11, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 615
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-string/jumbo v23, "mRsrp"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 616
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v13

    .line 617
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 618
    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v14

    .line 619
    invoke-virtual {v11, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 620
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-string/jumbo v23, "mRsrq"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 621
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v13

    .line 622
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 623
    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v15

    .line 624
    invoke-virtual {v11, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 625
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-string/jumbo v23, "mRssnr"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 626
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v13

    .line 627
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 628
    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v17

    .line 629
    invoke-virtual {v11, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 630
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-string/jumbo v23, "mCqi"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 631
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v13

    .line 632
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 633
    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v8

    .line 634
    invoke-virtual {v11, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 635
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-string/jumbo v23, "mTimingAdvance"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 636
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v13

    .line 637
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 638
    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v19

    .line 639
    invoke-virtual {v11, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_4
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 643
    .end local v11    # "field":Ljava/lang/reflect/Field;
    .end local v13    # "isAccessible":Z
    :goto_18
    const/16 v21, 0x7fff

    move/from16 v0, v16

    move/from16 v1, v21

    if-gt v0, v1, :cond_19

    const/16 v21, -0x8000

    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_22

    :cond_19
    const/16 v21, -0x1

    :goto_19
    :try_start_d
    move/from16 v0, v21

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    const/16 v21, 0x7fff

    move/from16 v0, v21

    if-gt v14, v0, :cond_1a

    const/16 v21, -0x8000

    move/from16 v0, v21

    if-ge v14, v0, :cond_23

    :cond_1a
    const/16 v21, 0x7fff

    .line 644
    :goto_1a
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    const/16 v21, 0x7fff

    move/from16 v0, v21

    if-gt v15, v0, :cond_1b

    const/16 v21, -0x8000

    move/from16 v0, v21

    if-ge v15, v0, :cond_24

    :cond_1b
    const/16 v21, 0x7fff

    .line 645
    :goto_1b
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    const/16 v21, 0x7fff

    move/from16 v0, v17

    move/from16 v1, v21

    if-gt v0, v1, :cond_1c

    const/16 v21, -0x8000

    move/from16 v0, v17

    move/from16 v1, v21

    if-ge v0, v1, :cond_25

    :cond_1c
    const/16 v21, 0x7fff

    .line 646
    :goto_1c
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v23

    const/16 v21, 0x7f

    move/from16 v0, v21

    if-gt v8, v0, :cond_1d

    const/16 v21, -0x80

    move/from16 v0, v21

    if-ge v8, v0, :cond_26

    :cond_1d
    const/16 v21, -0x1

    .line 647
    :goto_1d
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v21

    const v23, 0x7fffffff

    move/from16 v0, v19

    move/from16 v1, v23

    if-eq v0, v1, :cond_27

    .line 648
    .end local v19    # "timingAdvance":I
    :goto_1e
    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    goto/16 :goto_4

    .line 596
    .end local v8    # "cqi":I
    .end local v14    # "rsrp":I
    .end local v15    # "rsrq":I
    .end local v16    # "rss":I
    .end local v17    # "rssnr":I
    :cond_1e
    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getMcc()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_14

    .line 597
    :cond_1f
    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getMnc()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_15

    .line 598
    :cond_20
    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getTac()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_16

    .line 600
    :cond_21
    invoke-virtual {v6}, Landroid/telephony/CellIdentityLte;->getPci()I
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_17

    .line 643
    .restart local v8    # "cqi":I
    .restart local v14    # "rsrp":I
    .restart local v15    # "rsrq":I
    .restart local v16    # "rss":I
    .restart local v17    # "rssnr":I
    .restart local v19    # "timingAdvance":I
    :cond_22
    move/from16 v0, v16

    int-to-short v0, v0

    move/from16 v21, v0

    goto/16 :goto_19

    :cond_23
    int-to-short v0, v14

    move/from16 v21, v0

    goto/16 :goto_1a

    .line 644
    :cond_24
    int-to-short v0, v15

    move/from16 v21, v0

    goto/16 :goto_1b

    .line 645
    :cond_25
    move/from16 v0, v17

    int-to-short v0, v0

    move/from16 v21, v0

    goto :goto_1c

    .line 646
    :cond_26
    int-to-byte v0, v8

    move/from16 v21, v0

    goto :goto_1d

    .line 647
    :cond_27
    const/16 v19, -0x1

    goto :goto_1e

    .line 657
    .end local v6    # "ci":Landroid/telephony/CellIdentityLte;
    .end local v8    # "cqi":I
    .end local v9    # "cs":Landroid/telephony/CellSignalStrengthLte;
    .end local v14    # "rsrp":I
    .end local v15    # "rsrq":I
    .end local v16    # "rss":I
    .end local v17    # "rssnr":I
    .end local v18    # "sf":Ljava/lang/String;
    .end local v19    # "timingAdvance":I
    :cond_28
    :try_start_e
    const-string/jumbo v21, ""

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/media/Vigo;->contextLocation:Ljava/lang/String;

    .line 658
    invoke-static {v7}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 660
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_1f
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_29

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 661
    .local v12, "i":Ljava/lang/String;
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/Vigo;->contextLocation:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/media/Vigo;->contextLocation:Ljava/lang/String;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_2
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_1f

    .line 663
    .end local v12    # "i":Ljava/lang/String;
    :catch_2
    move-exception v10

    .line 664
    .restart local v10    # "e":Ljava/lang/Exception;
    :try_start_f
    const-string/jumbo v21, ""

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/media/Vigo;->contextLocation:Ljava/lang/String;

    .line 668
    .end local v5    # "cells":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/CellInfo;>;"
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_29
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    goto/16 :goto_b

    .line 675
    .end local v7    # "context":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_3
    move-exception v21

    .line 677
    :try_start_10
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_1

    goto/16 :goto_c

    .line 640
    .restart local v5    # "cells":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/CellInfo;>;"
    .restart local v6    # "ci":Landroid/telephony/CellIdentityLte;
    .restart local v7    # "context":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v8    # "cqi":I
    .restart local v9    # "cs":Landroid/telephony/CellSignalStrengthLte;
    .restart local v14    # "rsrp":I
    .restart local v15    # "rsrq":I
    .restart local v16    # "rss":I
    .restart local v17    # "rssnr":I
    .restart local v18    # "sf":Ljava/lang/String;
    .restart local v19    # "timingAdvance":I
    :catch_4
    move-exception v21

    goto/16 :goto_18

    .line 581
    .end local v8    # "cqi":I
    .end local v14    # "rsrp":I
    .end local v15    # "rsrq":I
    .end local v17    # "rssnr":I
    .end local v19    # "timingAdvance":I
    .restart local v2    # "ber":I
    .local v6, "ci":Landroid/telephony/CellIdentityWcdma;
    .local v9, "cs":Landroid/telephony/CellSignalStrengthWcdma;
    :catch_5
    move-exception v21

    goto/16 :goto_11

    .line 546
    .local v6, "ci":Landroid/telephony/CellIdentityGsm;
    .local v9, "cs":Landroid/telephony/CellSignalStrengthGsm;
    :catch_6
    move-exception v21

    goto/16 :goto_8
.end method

.method private getClientInfo(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 7
    .param p1, "clientInfoParts"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .prologue
    .line 1088
    const/4 v1, 0x0

    .line 1090
    .local v1, "pInfo":Landroid/content/pm/PackageInfo;
    const/4 v2, -0x1

    .line 1093
    .local v2, "versionCode":I
    :try_start_0
    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->ctx:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/media/Vigo;->ctx:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 1094
    iget-object v3, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 1095
    .local v3, "versionName":Ljava/lang/String;
    iget v2, v1, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1101
    :goto_0
    :try_start_1
    const-string/jumbo v4, "Android"

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 1102
    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    const/4 v5, 0x0

    .line 1103
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1104
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    .line 1105
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v5

    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->ctx:Landroid/content/Context;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->ctx:Landroid/content/Context;

    .line 1106
    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string/jumbo v6, "android_id"

    invoke-static {v4, v6}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/api/VKAPIRequest;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-virtual {v5, v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v5

    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->ctx:Landroid/content/Context;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->ctx:Landroid/content/Context;

    .line 1107
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v4, v4, 0xf

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    :goto_2
    invoke-virtual {v5, v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1108
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 1109
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1115
    :goto_3
    return-object p1

    .line 1096
    .end local v3    # "versionName":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 1097
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v3, ""

    .restart local v3    # "versionName":Ljava/lang/String;
    goto/16 :goto_0

    .line 1106
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :try_start_2
    const-string/jumbo v4, ""

    goto :goto_1

    .line 1107
    :cond_1
    const-string/jumbo v4, ""
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 1111
    :catch_1
    move-exception v0

    .line 1112
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V

    goto :goto_3
.end method

.method private getFieldValue(Landroid/telephony/SignalStrength;Ljava/lang/String;)I
    .locals 2
    .param p1, "s"    # Landroid/telephony/SignalStrength;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 169
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 170
    .local v0, "field":Ljava/lang/reflect/Field;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 171
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    return v1
.end method

.method public static md5(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 125
    :try_start_0
    const-string/jumbo v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 126
    .local v0, "digest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 127
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    .line 130
    .local v3, "messageDigest":[B
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 131
    .local v1, "hexString":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v3

    if-ge v2, v4, :cond_0

    .line 132
    aget-byte v4, v3, v2

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 131
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 135
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 138
    .end local v0    # "digest":Ljava/security/MessageDigest;
    .end local v1    # "hexString":Ljava/lang/StringBuffer;
    .end local v2    # "i":I
    .end local v3    # "messageDigest":[B
    :goto_1
    return-object v4

    .line 136
    :catch_0
    move-exception v4

    .line 138
    const-string/jumbo v4, ""

    goto :goto_1
.end method

.method private resetApiEvents(Lcom/vkontakte/android/media/VigoBinaryBuffer;Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 16
    .param p1, "events"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .param p2, "networkInfo"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .prologue
    .line 885
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    if-nez v10, :cond_0

    .line 962
    :goto_0
    return-object p1

    .line 887
    :cond_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    monitor-enter v11

    .line 889
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/vkontakte/android/media/Vigo;->apiSessionStartTime:J

    sub-long/2addr v12, v14

    long-to-int v9, v12

    .line 891
    .local v9, "timeOffset":I
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_1

    .line 893
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-interface {v10, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/media/VigoApiEvent;

    .line 894
    .local v2, "apiEvent":Lcom/vkontakte/android/media/VigoApiEvent;
    iget-object v10, v2, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-interface {v10}, Ljava/util/Map;->size()I

    move-result v10

    if-lez v10, :cond_3

    .line 895
    iget-object v10, v2, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v10, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 896
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-interface {v10, v12, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 904
    .end local v2    # "apiEvent":Lcom/vkontakte/android/media/VigoApiEvent;
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/media/VigoApiEvent;

    .line 905
    .local v5, "event":Lcom/vkontakte/android/media/VigoApiEvent;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 908
    .local v7, "measures":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v10, 0x0

    :try_start_1
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 910
    iget-object v10, v5, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 912
    iget-object v10, v5, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-interface {v10}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 913
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Byte;Lcom/vkontakte/android/media/VigoApiMeasurement;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/media/VigoApiMeasurement;

    .line 915
    .local v6, "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Byte;

    invoke-virtual {v10}, Ljava/lang/Byte;->byteValue()B

    move-result v10

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 916
    iget v10, v6, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessMeasurementCount:I

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 917
    iget v10, v6, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorMeasurementCount:I

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 918
    iget v10, v6, Lcom/vkontakte/android/media/VigoApiMeasurement;->failedApiMeasurementCounter:I

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 919
    iget v10, v6, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiRequestRtt:I

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 920
    iget v10, v6, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiRequestPt:I

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 922
    iget-wide v14, v6, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiContentLength:J

    invoke-virtual {v7, v14, v15}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 924
    iget v10, v6, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorApiRequestRtt:I

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 925
    iget v10, v6, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorApiRequestPt:I

    invoke-virtual {v7, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_3

    .line 931
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Byte;Lcom/vkontakte/android/media/VigoApiMeasurement;>;"
    .end local v6    # "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    :catch_0
    move-exception v10

    .line 933
    :try_start_2
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 934
    iget-object v10, v5, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 935
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoApiEvent;->returnObject()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 953
    .end local v5    # "event":Lcom/vkontakte/android/media/VigoApiEvent;
    .end local v7    # "measures":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v9    # "timeOffset":I
    :catch_1
    move-exception v3

    .line 955
    .local v3, "e":Ljava/lang/Exception;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_2

    .line 956
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->clear()V

    .line 958
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V

    .line 960
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_4
    monitor-exit v11

    goto/16 :goto_0

    :catchall_0
    move-exception v10

    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v10

    .line 898
    .restart local v2    # "apiEvent":Lcom/vkontakte/android/media/VigoApiEvent;
    .restart local v9    # "timeOffset":I
    :cond_3
    :try_start_4
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-interface {v10, v12}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/media/VigoApiEvent;

    .line 899
    .restart local v5    # "event":Lcom/vkontakte/android/media/VigoApiEvent;
    iget-object v10, v5, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 900
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoApiEvent;->returnObject()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_1

    .line 927
    .end local v2    # "apiEvent":Lcom/vkontakte/android/media/VigoApiEvent;
    .restart local v7    # "measures":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :cond_4
    :try_start_5
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V

    .line 929
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 933
    :try_start_6
    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 934
    iget-object v10, v5, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 935
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoApiEvent;->returnObject()V

    goto/16 :goto_2

    .line 933
    :catchall_1
    move-exception v10

    invoke-virtual {v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 934
    iget-object v12, v5, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v12}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 935
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoApiEvent;->returnObject()V

    throw v10

    .line 939
    .end local v5    # "event":Lcom/vkontakte/android/media/VigoApiEvent;
    .end local v7    # "measures":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :cond_5
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->clear()V

    .line 942
    invoke-static {}, Lcom/vkontakte/android/media/VigoApiEvent;->getObject()Lcom/vkontakte/android/media/VigoApiEvent;

    move-result-object v8

    .line 943
    .local v8, "newApiEvent":Lcom/vkontakte/android/media/VigoApiEvent;
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    iput-object v10, v8, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 946
    iget-object v10, v8, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-object/from16 v0, p2

    invoke-virtual {v10, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 947
    iget-object v10, v8, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v10, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 949
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v10, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 951
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_4
.end method

.method private resetPlaybackEvents(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 5
    .param p1, "events"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .prologue
    .line 967
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    if-nez v2, :cond_0

    .line 995
    :goto_0
    return-object p1

    .line 969
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    monitor-enter v3

    .line 972
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 974
    .local v1, "event":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_start_1
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 978
    :try_start_2
    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 986
    .end local v1    # "event":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_0
    move-exception v0

    .line 988
    .local v0, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 989
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 991
    :cond_1
    invoke-virtual {p1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V

    .line 993
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 976
    .restart local v1    # "event":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_1
    move-exception v4

    .line 978
    :try_start_4
    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v2

    .line 982
    .end local v1    # "event":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 984
    invoke-virtual {p1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2
.end method

.method private updateNetworkInformation(Lcom/vkontakte/android/media/VigoBinaryBuffer;Landroid/telephony/CellLocation;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 11
    .param p1, "networkInformation"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .param p2, "cellL"    # Landroid/telephony/CellLocation;

    .prologue
    const/16 v10, 0x7fff

    const/16 v9, -0x8000

    const/4 v6, -0x1

    .line 1001
    :try_start_0
    iget-object v7, p0, Lcom/vkontakte/android/media/Vigo;->cm:Landroid/net/ConnectivityManager;

    if-eqz v7, :cond_9

    .line 1002
    iget-object v7, p0, Lcom/vkontakte/android/media/Vigo;->cm:Landroid/net/ConnectivityManager;

    invoke-virtual {v7}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 1003
    .local v2, "ni":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_8

    .line 1004
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    if-gt v7, v10, :cond_0

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    if-ge v7, v9, :cond_6

    :cond_0
    move v7, v6

    :goto_0
    invoke-virtual {p1, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v8

    .line 1005
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v7

    if-gt v7, v10, :cond_1

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v7

    if-ge v7, v9, :cond_7

    :cond_1
    move v7, v6

    :goto_1
    invoke-virtual {v8, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 1017
    .end local v2    # "ni":Landroid/net/NetworkInfo;
    :goto_2
    iget-object v7, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    if-eqz v7, :cond_c

    .line 1018
    iget-object v7, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v7}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v7

    if-gt v7, v10, :cond_2

    iget-object v7, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v7}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v7

    if-ge v7, v9, :cond_a

    :cond_2
    move v7, v6

    :goto_3
    invoke-virtual {p1, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    .line 1019
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    .line 1020
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->isNetworkRoaming()Z

    move-result v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBooleanToBuffer(Z)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    .line 1021
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getDataState()I

    move-result v8

    const/16 v9, 0x7f

    if-gt v8, v9, :cond_3

    iget-object v8, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v8

    const/16 v9, -0x80

    if-ge v8, v9, :cond_b

    :cond_3
    :goto_4
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    .line 1022
    invoke-virtual {v7}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 1032
    :goto_5
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    .line 1034
    .local v4, "simInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v6, 0x0

    :try_start_1
    invoke-virtual {v4, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 1036
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v7, 0x15

    if-le v6, v7, :cond_4

    .line 1038
    :try_start_2
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->ctx:Landroid/content/Context;

    invoke-static {v6}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    move-result-object v3

    .line 1039
    .local v3, "sbm":Landroid/telephony/SubscriptionManager;
    invoke-virtual {v3}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoList()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/SubscriptionInfo;

    .line 1040
    .local v1, "info":Landroid/telephony/SubscriptionInfo;
    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getMcc()I

    move-result v7

    int-to-short v7, v7

    invoke-virtual {v4, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 1041
    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getMnc()I

    move-result v7

    int-to-short v7, v7

    invoke-virtual {v4, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_6

    .line 1044
    .end local v1    # "info":Landroid/telephony/SubscriptionInfo;
    .end local v3    # "sbm":Landroid/telephony/SubscriptionManager;
    :catch_0
    move-exception v0

    .line 1045
    .local v0, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V

    .line 1049
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_4
    :goto_7
    invoke-virtual {p1, v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1053
    :try_start_4
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1056
    :goto_8
    if-nez p2, :cond_5

    .line 1057
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    if-eqz v6, :cond_e

    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getCellLocation()Landroid/telephony/CellLocation;

    move-result-object p2

    .line 1060
    :cond_5
    :goto_9
    invoke-direct {p0, p2, p1}, Lcom/vkontakte/android/media/Vigo;->getCell(Landroid/telephony/CellLocation;Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object p1

    .line 1062
    iget-object v7, p0, Lcom/vkontakte/android/media/Vigo;->msignal:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    monitor-enter v7
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 1063
    :try_start_5
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->msignal:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {p1, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 1064
    monitor-exit v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1066
    :try_start_6
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    move-result-object v5

    .line 1068
    .local v5, "wsignal":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v6, 0x0

    :try_start_7
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 1071
    invoke-virtual {p1, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 1072
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 1076
    :try_start_8
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 1083
    .end local v4    # "simInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v5    # "wsignal":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_a
    return-object p1

    .line 1004
    .restart local v2    # "ni":Landroid/net/NetworkInfo;
    :cond_6
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    int-to-short v7, v7

    goto/16 :goto_0

    .line 1005
    :cond_7
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v7

    int-to-short v7, v7

    goto/16 :goto_1

    .line 1008
    :cond_8
    const/4 v7, -0x1

    invoke-virtual {p1, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v8, -0x1

    .line 1009
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    goto/16 :goto_2

    .line 1079
    .end local v2    # "ni":Landroid/net/NetworkInfo;
    :catch_1
    move-exception v0

    .line 1080
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V

    goto :goto_a

    .line 1013
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_9
    const/4 v7, -0x1

    :try_start_9
    invoke-virtual {p1, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v7

    const/4 v8, -0x1

    .line 1014
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    goto/16 :goto_2

    .line 1018
    :cond_a
    iget-object v7, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v7}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v7

    int-to-short v7, v7

    goto/16 :goto_3

    .line 1021
    :cond_b
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getDataState()I

    move-result v6

    int-to-byte v6, v6

    goto/16 :goto_4

    .line 1025
    :cond_c
    const/4 v6, -0x1

    invoke-virtual {p1, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    const-string/jumbo v7, ""

    .line 1026
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    const/4 v7, -0x1

    .line 1027
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    const/4 v7, -0x1

    .line 1028
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    const-string/jumbo v7, ""

    .line 1029
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    goto/16 :goto_5

    .line 1043
    .restart local v3    # "sbm":Landroid/telephony/SubscriptionManager;
    .restart local v4    # "simInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :cond_d
    :try_start_a
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_7

    .line 1053
    .end local v3    # "sbm":Landroid/telephony/SubscriptionManager;
    :catchall_0
    move-exception v6

    :try_start_b
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v6

    .line 1051
    :catch_2
    move-exception v6

    .line 1053
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_1

    goto/16 :goto_8

    .line 1057
    :cond_e
    const/4 p2, 0x0

    goto/16 :goto_9

    .line 1064
    :catchall_1
    move-exception v6

    :try_start_c
    monitor-exit v7
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    :try_start_d
    throw v6

    .line 1074
    .restart local v5    # "wsignal":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_3
    move-exception v6

    .line 1076
    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    goto :goto_a

    :catchall_2
    move-exception v6

    invoke-virtual {v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v6
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_1
.end method


# virtual methods
.method public addErrorApiMeasurement(BII)V
    .locals 5
    .param p1, "category"    # B
    .param p2, "requestRtt"    # I
    .param p3, "requestPt"    # I

    .prologue
    .line 777
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    if-nez v2, :cond_0

    .line 803
    :goto_0
    return-void

    .line 780
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 782
    :try_start_1
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 784
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VigoApiEvent;

    .line 787
    .local v0, "event":Lcom/vkontakte/android/media/VigoApiEvent;
    iget-object v2, v0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 788
    iget-object v2, v0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/media/VigoApiMeasurement;

    .line 794
    .local v1, "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    :goto_1
    iget v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorMeasurementCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorMeasurementCount:I

    .line 796
    iget v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorApiRequestRtt:I

    iget v4, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorMeasurementCount:I

    add-int/lit8 v4, v4, -0x1

    mul-int/2addr v2, v4

    add-int/2addr v2, p2

    iget v4, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorMeasurementCount:I

    div-int/2addr v2, v4

    iput v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorApiRequestRtt:I

    .line 797
    iget v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorApiRequestPt:I

    iget v4, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorMeasurementCount:I

    add-int/lit8 v4, v4, -0x1

    mul-int/2addr v2, v4

    add-int/2addr v2, p3

    iget v4, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorMeasurementCount:I

    div-int/2addr v2, v4

    iput v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgErrorApiRequestPt:I

    .line 801
    .end local v0    # "event":Lcom/vkontakte/android/media/VigoApiEvent;
    .end local v1    # "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    :cond_1
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 802
    :catch_0
    move-exception v2

    goto :goto_0

    .line 790
    .restart local v0    # "event":Lcom/vkontakte/android/media/VigoApiEvent;
    :cond_2
    :try_start_3
    invoke-static {}, Lcom/vkontakte/android/media/VigoApiMeasurement;->getObject()Lcom/vkontakte/android/media/VigoApiMeasurement;

    move-result-object v1

    .line 791
    .restart local v1    # "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    iget-object v2, v0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-interface {v2, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method public addSuccessApiMeasurement(BIIJ)V
    .locals 8
    .param p1, "category"    # B
    .param p2, "requestRtt"    # I
    .param p3, "requestPt"    # I
    .param p4, "contentLenght"    # J

    .prologue
    .line 747
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    if-nez v2, :cond_0

    .line 774
    :goto_0
    return-void

    .line 750
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 752
    :try_start_1
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 754
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VigoApiEvent;

    .line 757
    .local v0, "event":Lcom/vkontakte/android/media/VigoApiEvent;
    iget-object v2, v0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 758
    iget-object v2, v0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/media/VigoApiMeasurement;

    .line 763
    .local v1, "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    :goto_1
    iget v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessMeasurementCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessMeasurementCount:I

    .line 765
    iget v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiRequestRtt:I

    iget v4, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessMeasurementCount:I

    add-int/lit8 v4, v4, -0x1

    mul-int/2addr v2, v4

    add-int/2addr v2, p2

    iget v4, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessMeasurementCount:I

    div-int/2addr v2, v4

    iput v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiRequestRtt:I

    .line 766
    iget v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiRequestPt:I

    iget v4, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessMeasurementCount:I

    add-int/lit8 v4, v4, -0x1

    mul-int/2addr v2, v4

    add-int/2addr v2, p3

    iget v4, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessMeasurementCount:I

    div-int/2addr v2, v4

    iput v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiRequestPt:I

    .line 768
    iget-wide v4, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiContentLength:J

    iget v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessMeasurementCount:I

    add-int/lit8 v2, v2, -0x1

    int-to-long v6, v2

    mul-long/2addr v4, v6

    add-long/2addr v4, p4

    iget v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessMeasurementCount:I

    int-to-long v6, v2

    div-long/2addr v4, v6

    iput-wide v4, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->avgSuccessApiContentLength:J

    .line 772
    .end local v0    # "event":Lcom/vkontakte/android/media/VigoApiEvent;
    .end local v1    # "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    :cond_1
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 773
    :catch_0
    move-exception v2

    goto :goto_0

    .line 760
    .restart local v0    # "event":Lcom/vkontakte/android/media/VigoApiEvent;
    :cond_2
    :try_start_3
    invoke-static {}, Lcom/vkontakte/android/media/VigoApiMeasurement;->getObject()Lcom/vkontakte/android/media/VigoApiMeasurement;

    move-result-object v1

    .line 761
    .restart local v1    # "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    iget-object v2, v0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-interface {v2, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method public collectApiChangesOFF()V
    .locals 4

    .prologue
    .line 455
    const-wide/16 v2, 0x0

    :try_start_0
    iput-wide v2, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionStartTime:J

    .line 457
    iget-object v1, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 458
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 460
    iget-object v1, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VigoApiEvent;

    .line 461
    .local v0, "event":Lcom/vkontakte/android/media/VigoApiEvent;
    iget-object v2, v0, Lcom/vkontakte/android/media/VigoApiEvent;->info:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 462
    invoke-virtual {v0}, Lcom/vkontakte/android/media/VigoApiEvent;->returnObject()V

    goto :goto_0

    .line 468
    .end local v0    # "event":Lcom/vkontakte/android/media/VigoApiEvent;
    :catch_0
    move-exception v1

    .line 469
    :goto_1
    return-void

    .line 465
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 466
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method

.method public collectApiChangesON()V
    .locals 6

    .prologue
    .line 421
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionStartTime:J

    .line 422
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 425
    :try_start_1
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    const/4 v3, 0x7

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 426
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 427
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 428
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v3

    const v4, 0xea60

    div-int/2addr v3, v4

    int-to-short v3, v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 429
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 435
    :goto_0
    :try_start_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v2}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    .line 437
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v1

    .line 439
    .local v1, "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v2, 0x5

    :try_start_3
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 441
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/vkontakte/android/media/Vigo;->updateNetworkInformation(Lcom/vkontakte/android/media/VigoBinaryBuffer;Landroid/telephony/CellLocation;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v1

    .line 443
    invoke-direct {p0, v1}, Lcom/vkontakte/android/media/Vigo;->createApiEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 447
    :try_start_4
    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 450
    .end local v1    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_1
    return-void

    .line 431
    :catch_0
    move-exception v0

    .line 432
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V

    goto :goto_0

    .line 449
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    goto :goto_1

    .line 445
    .restart local v1    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v2

    .line 447
    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    goto :goto_1

    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
.end method

.method public collectPlaybackChangesOFF()V
    .locals 4

    .prologue
    .line 482
    const-wide/16 v2, 0x0

    :try_start_0
    iput-wide v2, p0, Lcom/vkontakte/android/media/Vigo;->playbackStartTime:J

    .line 484
    iget-object v1, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 485
    .local v0, "event":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    invoke-virtual {v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    goto :goto_0

    .line 490
    .end local v0    # "event":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_0
    move-exception v1

    .line 491
    :goto_1
    return-void

    .line 488
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 489
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method

.method public collectPlaybackChangesON(J)V
    .locals 1
    .param p1, "startTime"    # J

    .prologue
    .line 474
    :try_start_0
    iput-wide p1, p0, Lcom/vkontakte/android/media/Vigo;->playbackStartTime:J

    .line 475
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 477
    :goto_0
    return-void

    .line 476
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public countFailedApiMeasurement(B)V
    .locals 5
    .param p1, "category"    # B

    .prologue
    .line 806
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    if-nez v2, :cond_0

    .line 829
    :goto_0
    return-void

    .line 809
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 811
    :try_start_1
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 813
    iget-object v2, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VigoApiEvent;

    .line 816
    .local v0, "event":Lcom/vkontakte/android/media/VigoApiEvent;
    iget-object v2, v0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 817
    iget-object v2, v0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/media/VigoApiMeasurement;

    .line 823
    .local v1, "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    :goto_1
    iget v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->failedApiMeasurementCounter:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/vkontakte/android/media/VigoApiMeasurement;->failedApiMeasurementCounter:I

    .line 827
    .end local v0    # "event":Lcom/vkontakte/android/media/VigoApiEvent;
    .end local v1    # "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    :cond_1
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 828
    :catch_0
    move-exception v2

    goto :goto_0

    .line 819
    .restart local v0    # "event":Lcom/vkontakte/android/media/VigoApiEvent;
    :cond_2
    :try_start_3
    invoke-static {}, Lcom/vkontakte/android/media/VigoApiMeasurement;->getObject()Lcom/vkontakte/android/media/VigoApiMeasurement;

    move-result-object v1

    .line 820
    .restart local v1    # "measurement":Lcom/vkontakte/android/media/VigoApiMeasurement;
    iget-object v2, v0, Lcom/vkontakte/android/media/VigoApiEvent;->apiMeasurements:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-interface {v2, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method public fillApiUrlParams(Landroid/net/Uri$Builder;)Landroid/net/Uri$Builder;
    .locals 10
    .param p1, "bldr"    # Landroid/net/Uri$Builder;

    .prologue
    const/4 v5, 0x0

    .line 292
    :try_start_0
    const-string/jumbo v6, "AES/CBC/PKCS5Padding"

    invoke-static {v6}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 293
    .local v0, "aes":Ljavax/crypto/Cipher;
    const/4 v6, 0x1

    new-instance v7, Ljavax/crypto/spec/SecretKeySpec;

    const/16 v8, 0x10

    new-array v8, v8, [B

    fill-array-data v8, :array_0

    const-string/jumbo v9, "AES"

    invoke-direct {v7, v8, v9}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v8, Ljavax/crypto/spec/IvParameterSpec;

    const/16 v9, 0x10

    new-array v9, v9, [B

    invoke-direct {v8, v9}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v0, v6, v7, v8}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 295
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v1

    .line 297
    .local v1, "api":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_start_1
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    move-result-object v4

    .line 299
    .local v4, "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v6, 0x5

    :try_start_2
    invoke-virtual {v4, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 301
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result-object v3

    .line 304
    .local v3, "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v6, 0x6

    :try_start_3
    invoke-virtual {v3, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 305
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->clientInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v1, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 307
    const/4 v6, 0x0

    invoke-direct {p0, v4, v6}, Lcom/vkontakte/android/media/Vigo;->updateNetworkInformation(Lcom/vkontakte/android/media/VigoBinaryBuffer;Landroid/telephony/CellLocation;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v4

    .line 308
    invoke-virtual {v1, v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 310
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    if-eqz v6, :cond_0

    .line 311
    iget-object v7, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    monitor-enter v7
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 312
    :try_start_4
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->apiSessionInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v1, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 313
    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 314
    :try_start_5
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 315
    invoke-direct {p0, v3, v4}, Lcom/vkontakte/android/media/Vigo;->resetApiEvents(Lcom/vkontakte/android/media/VigoBinaryBuffer;Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v3

    .line 316
    invoke-virtual {v1, v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 323
    :cond_0
    :try_start_6
    invoke-virtual {v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 327
    :goto_0
    :try_start_7
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 330
    .end local v3    # "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_1
    const-string/jumbo v6, "svcid"

    const-string/jumbo v7, "5d18"

    invoke-virtual {p1, v6, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string/jumbo v7, "cid"

    .line 331
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/vkontakte/android/api/VKAPIRequest;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string/jumbo v7, "api"

    .line 332
    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getBuffer()[B

    move-result-object v8

    invoke-virtual {v0, v8}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v8

    const/16 v9, 0xb

    invoke-static {v8, v9}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    move-result-object p1

    .line 344
    :try_start_8
    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .end local v4    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_2
    move-object v5, p1

    .line 351
    .end local v0    # "aes":Ljavax/crypto/Cipher;
    .end local v1    # "api":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_3
    return-object v5

    .line 313
    .restart local v0    # "aes":Ljavax/crypto/Cipher;
    .restart local v1    # "api":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v3    # "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v4    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catchall_0
    move-exception v6

    :try_start_9
    monitor-exit v7
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    :try_start_a
    throw v6
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 319
    :catch_0
    move-exception v2

    .line 320
    .local v2, "e":Ljava/lang/Exception;
    :try_start_b
    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 323
    :try_start_c
    invoke-virtual {v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    goto :goto_0

    .line 325
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_1
    move-exception v6

    .line 327
    :try_start_d
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    goto :goto_1

    .line 335
    .end local v4    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v2

    .line 336
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_e
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    if-eqz v6, :cond_2

    .line 337
    iget-object v7, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    monitor-enter v7
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    .line 338
    :try_start_f
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 339
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 340
    :cond_1
    monitor-exit v7
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .line 344
    :cond_2
    :try_start_10
    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_3

    goto :goto_2

    .line 349
    .end local v0    # "aes":Ljavax/crypto/Cipher;
    .end local v1    # "api":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v6

    goto :goto_3

    .line 323
    .restart local v0    # "aes":Ljavax/crypto/Cipher;
    .restart local v1    # "api":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v3    # "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v4    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catchall_1
    move-exception v6

    :try_start_11
    invoke-virtual {v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v6
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_1
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    .line 327
    .end local v3    # "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catchall_2
    move-exception v6

    :try_start_12
    invoke-virtual {v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v6
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_2
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    .line 344
    .end local v4    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catchall_3
    move-exception v6

    :try_start_13
    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v6
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_3

    .line 340
    .restart local v2    # "e":Ljava/lang/Exception;
    :catchall_4
    move-exception v6

    :try_start_14
    monitor-exit v7
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    :try_start_15
    throw v6
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    .line 293
    :array_0
    .array-data 1
        0x27t
        0x3bt
        0x6dt
        0x6ct
        0x7et
        0x73t
        0x44t
        0x34t
        0x49t
        0x76t
        0x3et
        0x55t
        0x31t
        0x31t
        0x46t
        0x7et
    .end array-data
.end method

.method public fillPlaybackUrlParams(Landroid/net/Uri$Builder;Ljava/lang/String;Lcom/vkontakte/android/media/VigoBinaryBuffer;)Landroid/net/Uri$Builder;
    .locals 9
    .param p1, "bldr"    # Landroid/net/Uri$Builder;
    .param p2, "svcid"    # Ljava/lang/String;
    .param p3, "pb"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .prologue
    const/4 v4, 0x0

    .line 357
    :try_start_0
    const-string/jumbo v5, "AES/CBC/PKCS5Padding"

    invoke-static {v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 358
    .local v0, "aes":Ljavax/crypto/Cipher;
    const/4 v5, 0x1

    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    const/16 v7, 0x10

    new-array v7, v7, [B

    fill-array-data v7, :array_0

    const-string/jumbo v8, "AES"

    invoke-direct {v6, v7, v8}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v7, Ljavax/crypto/spec/IvParameterSpec;

    const/16 v8, 0x10

    new-array v8, v8, [B

    invoke-direct {v7, v8}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v0, v5, v6, v7}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 360
    if-nez p3, :cond_0

    .line 361
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object p3

    .line 365
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result-object v3

    .line 368
    .local v3, "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v5, 0x5

    :try_start_2
    invoke-virtual {v3, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 370
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v2

    .line 373
    .local v2, "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v5, 0x6

    :try_start_3
    invoke-virtual {v2, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 374
    iget-object v5, p0, Lcom/vkontakte/android/media/Vigo;->clientInfo:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {p3, v5}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 376
    const/4 v5, 0x0

    invoke-direct {p0, v3, v5}, Lcom/vkontakte/android/media/Vigo;->updateNetworkInformation(Lcom/vkontakte/android/media/VigoBinaryBuffer;Landroid/telephony/CellLocation;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v3

    .line 377
    invoke-virtual {p3, v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 379
    iget-object v5, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 380
    invoke-direct {p0, v2}, Lcom/vkontakte/android/media/Vigo;->resetPlaybackEvents(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v2

    .line 381
    invoke-virtual {p3, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 386
    :cond_1
    :try_start_4
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 391
    :goto_0
    :try_start_5
    invoke-virtual {v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    .line 394
    .end local v2    # "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_1
    const-string/jumbo v5, "svcid"

    invoke-virtual {p1, v5, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    const-string/jumbo v6, "cid"

    .line 395
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/vkontakte/android/api/VKAPIRequest;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    const-string/jumbo v6, "pb"

    .line 396
    invoke-virtual {p3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getBuffer()[B

    move-result-object v7

    invoke-virtual {v0, v7}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v7

    const/16 v8, 0xb

    invoke-static {v7, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-result-object p1

    .line 408
    :try_start_6
    invoke-virtual {p3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    .end local v3    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :goto_2
    move-object v4, p1

    .line 415
    .end local v0    # "aes":Ljavax/crypto/Cipher;
    :goto_3
    return-object v4

    .line 383
    .restart local v0    # "aes":Ljavax/crypto/Cipher;
    .restart local v2    # "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v3    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_0
    move-exception v1

    .line 384
    .local v1, "e":Ljava/lang/Exception;
    :try_start_7
    invoke-virtual {p3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 386
    :try_start_8
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_0

    .line 389
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_1
    move-exception v5

    .line 391
    :try_start_9
    invoke-virtual {v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    goto :goto_1

    .line 399
    .end local v3    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_2
    move-exception v1

    .line 400
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_a
    iget-object v5, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    if-eqz v5, :cond_3

    .line 401
    iget-object v6, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    monitor-enter v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 402
    :try_start_b
    iget-object v5, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 403
    iget-object v5, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 404
    :cond_2
    monitor-exit v6
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 408
    :cond_3
    :try_start_c
    invoke-virtual {p3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_3

    goto :goto_2

    .line 413
    .end local v0    # "aes":Ljavax/crypto/Cipher;
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v5

    goto :goto_3

    .line 386
    .restart local v0    # "aes":Ljavax/crypto/Cipher;
    .restart local v2    # "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .restart local v3    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catchall_0
    move-exception v5

    :try_start_d
    invoke-virtual {v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v5
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_1
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 391
    .end local v2    # "events":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catchall_1
    move-exception v5

    :try_start_e
    invoke-virtual {v3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v5
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_2
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 408
    .end local v3    # "networkInfo":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catchall_2
    move-exception v5

    :try_start_f
    invoke-virtual {p3}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v5
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_3

    .line 404
    .restart local v1    # "e":Ljava/lang/Exception;
    :catchall_3
    move-exception v5

    :try_start_10
    monitor-exit v6
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    :try_start_11
    throw v5
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    .line 358
    nop

    :array_0
    .array-data 1
        0x27t
        0x3bt
        0x6dt
        0x6ct
        0x7et
        0x73t
        0x44t
        0x34t
        0x49t
        0x76t
        0x3et
        0x55t
        0x31t
        0x31t
        0x46t
        0x7et
    .end array-data
.end method

.method public onCellLocationChanged(Landroid/telephony/CellLocation;)V
    .locals 7
    .param p1, "location"    # Landroid/telephony/CellLocation;

    .prologue
    .line 689
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    if-nez v0, :cond_0

    .line 720
    :goto_0
    return-void

    .line 692
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 694
    .local v6, "networkInformation":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v0, 0x5

    :try_start_1
    invoke-virtual {v6, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 696
    invoke-direct {p0, v6, p1}, Lcom/vkontakte/android/media/Vigo;->updateNetworkInformation(Lcom/vkontakte/android/media/VigoBinaryBuffer;Landroid/telephony/CellLocation;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v6

    .line 698
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->networkTimer:Ljava/util/Timer;

    if-eqz v0, :cond_1

    .line 699
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->networkTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 700
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/media/Vigo;->networkTimer:Ljava/util/Timer;

    .line 702
    :cond_1
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/Vigo;->networkTimer:Ljava/util/Timer;

    .line 703
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->cellInfoTicker:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 705
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo;->networkTimer:Ljava/util/Timer;

    new-instance v1, Lcom/vkontakte/android/media/Vigo$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/media/Vigo$1;-><init>(Lcom/vkontakte/android/media/Vigo;)V

    const-wide/16 v2, 0x3e8

    const-wide/16 v4, 0x3e8

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 712
    invoke-direct {p0, v6}, Lcom/vkontakte/android/media/Vigo;->createApiEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V

    .line 713
    invoke-direct {p0, v6}, Lcom/vkontakte/android/media/Vigo;->createPlaybackEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 717
    :try_start_2
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    goto :goto_0

    .line 719
    .end local v6    # "networkInformation":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_0
    move-exception v0

    goto :goto_0

    .line 715
    .restart local v6    # "networkInformation":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_1
    move-exception v0

    .line 717
    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
.end method

.method public onDataConnectionStateChanged(II)V
    .locals 2
    .param p1, "state"    # I
    .param p2, "networkType"    # I

    .prologue
    .line 724
    iget-object v1, p0, Lcom/vkontakte/android/media/Vigo;->pbEvents:Ljava/util/List;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/media/Vigo;->apiEvents:Ljava/util/List;

    if-nez v1, :cond_1

    .line 744
    :cond_0
    :goto_0
    return-void

    .line 727
    :cond_1
    if-eqz p1, :cond_2

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 728
    :cond_2
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 730
    .local v0, "networkInformation":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    const/4 v1, 0x5

    :try_start_1
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->setTag(S)V

    .line 732
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/media/Vigo;->updateNetworkInformation(Lcom/vkontakte/android/media/VigoBinaryBuffer;Landroid/telephony/CellLocation;)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v0

    .line 734
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/Vigo;->createApiEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V

    .line 735
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/Vigo;->createPlaybackEvent(Lcom/vkontakte/android/media/VigoBinaryBuffer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 739
    :try_start_2
    invoke-virtual {v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    goto :goto_0

    .line 743
    .end local v0    # "networkInformation":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_0
    move-exception v1

    goto :goto_0

    .line 737
    .restart local v0    # "networkInformation":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :catch_1
    move-exception v1

    .line 739
    invoke-virtual {v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->returnObject()V

    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
.end method

.method public onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V
    .locals 13
    .param p1, "s"    # Landroid/telephony/SignalStrength;

    .prologue
    const/4 v8, -0x1

    const/16 v12, -0x8000

    const/16 v9, 0x7fff

    .line 178
    :try_start_0
    iget-object v10, p0, Lcom/vkontakte/android/media/Vigo;->msignal:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V

    .line 180
    invoke-virtual {p1}, Landroid/telephony/SignalStrength;->isGsm()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v10

    if-eqz v10, :cond_7

    .line 182
    const/4 v2, -0x1

    .line 183
    .local v2, "gsmS":I
    const/4 v0, -0x1

    .line 184
    .local v0, "bitE":I
    const/4 v7, -0x1

    .line 185
    .local v7, "lteS":I
    const/16 v4, 0x7fff

    .line 186
    .local v4, "lteR":I
    const/16 v5, 0x7fff

    .line 187
    .local v5, "lteRq":I
    const/16 v6, 0x7fff

    .line 188
    .local v6, "lteRssnr":I
    const/4 v3, -0x1

    .line 191
    .local v3, "lteCqi":I
    :try_start_1
    const-string/jumbo v10, "mGsmSignalStrength"

    invoke-direct {p0, p1, v10}, Lcom/vkontakte/android/media/Vigo;->getFieldValue(Landroid/telephony/SignalStrength;Ljava/lang/String;)I

    move-result v2

    .line 192
    const-string/jumbo v10, "mGsmBitErrorRate"

    invoke-direct {p0, p1, v10}, Lcom/vkontakte/android/media/Vigo;->getFieldValue(Landroid/telephony/SignalStrength;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move-result v0

    .line 196
    :goto_0
    :try_start_2
    const-string/jumbo v10, "mLteSignalStrength"

    invoke-direct {p0, p1, v10}, Lcom/vkontakte/android/media/Vigo;->getFieldValue(Landroid/telephony/SignalStrength;Ljava/lang/String;)I

    move-result v7

    .line 197
    const-string/jumbo v10, "mLteRsrp"

    invoke-direct {p0, p1, v10}, Lcom/vkontakte/android/media/Vigo;->getFieldValue(Landroid/telephony/SignalStrength;Ljava/lang/String;)I

    move-result v4

    .line 198
    const-string/jumbo v10, "mLteRsrq"

    invoke-direct {p0, p1, v10}, Lcom/vkontakte/android/media/Vigo;->getFieldValue(Landroid/telephony/SignalStrength;Ljava/lang/String;)I

    move-result v5

    .line 199
    const-string/jumbo v10, "mLteRssnr"

    invoke-direct {p0, p1, v10}, Lcom/vkontakte/android/media/Vigo;->getFieldValue(Landroid/telephony/SignalStrength;Ljava/lang/String;)I

    move-result v6

    .line 200
    const-string/jumbo v10, "mLteCqi"

    invoke-direct {p0, p1, v10}, Lcom/vkontakte/android/media/Vigo;->getFieldValue(Landroid/telephony/SignalStrength;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result v3

    .line 204
    :goto_1
    :try_start_3
    iget-object v11, p0, Lcom/vkontakte/android/media/Vigo;->msignal:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    if-gt v2, v9, :cond_0

    if-ge v2, v12, :cond_8

    :cond_0
    move v10, v8

    :goto_2
    invoke-virtual {v11, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    if-gt v0, v9, :cond_1

    if-ge v0, v12, :cond_9

    :cond_1
    move v10, v8

    .line 205
    :goto_3
    invoke-virtual {v11, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    if-gt v7, v9, :cond_2

    if-ge v7, v12, :cond_a

    :cond_2
    move v10, v8

    .line 206
    :goto_4
    invoke-virtual {v11, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    if-gt v4, v9, :cond_3

    if-ge v4, v12, :cond_b

    :cond_3
    move v10, v9

    .line 207
    :goto_5
    invoke-virtual {v11, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v11

    if-gt v5, v9, :cond_4

    if-ge v5, v12, :cond_c

    :cond_4
    move v10, v9

    .line 208
    :goto_6
    invoke-virtual {v11, v10}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v10

    if-gt v6, v9, :cond_5

    if-ge v6, v12, :cond_d

    .line 209
    :cond_5
    :goto_7
    invoke-virtual {v10, v9}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v9

    const/16 v10, 0x7f

    if-gt v3, v10, :cond_6

    const/16 v10, -0x80

    if-ge v3, v10, :cond_e

    .line 210
    :cond_6
    :goto_8
    invoke-virtual {v9, v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    move-result-object v8

    .line 211
    invoke-virtual {v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->updateLength()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 218
    .end local v0    # "bitE":I
    .end local v2    # "gsmS":I
    .end local v3    # "lteCqi":I
    .end local v4    # "lteR":I
    .end local v5    # "lteRq":I
    .end local v6    # "lteRssnr":I
    .end local v7    # "lteS":I
    :cond_7
    :goto_9
    return-void

    .line 204
    .restart local v0    # "bitE":I
    .restart local v2    # "gsmS":I
    .restart local v3    # "lteCqi":I
    .restart local v4    # "lteR":I
    .restart local v5    # "lteRq":I
    .restart local v6    # "lteRssnr":I
    .restart local v7    # "lteS":I
    :cond_8
    int-to-short v10, v2

    goto :goto_2

    :cond_9
    int-to-short v10, v0

    goto :goto_3

    .line 205
    :cond_a
    int-to-short v10, v7

    goto :goto_4

    .line 206
    :cond_b
    int-to-short v10, v4

    goto :goto_5

    .line 207
    :cond_c
    int-to-short v10, v5

    goto :goto_6

    .line 208
    :cond_d
    int-to-short v9, v6

    goto :goto_7

    .line 209
    :cond_e
    int-to-byte v8, v3

    goto :goto_8

    .line 213
    :catch_0
    move-exception v1

    .line 214
    .local v1, "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v8, p0, Lcom/vkontakte/android/media/Vigo;->msignal:Lcom/vkontakte/android/media/VigoBinaryBuffer;

    invoke-virtual {v8}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_9

    .line 217
    .end local v0    # "bitE":I
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "gsmS":I
    .end local v3    # "lteCqi":I
    .end local v4    # "lteR":I
    .end local v5    # "lteRq":I
    .end local v6    # "lteRssnr":I
    .end local v7    # "lteS":I
    :catch_1
    move-exception v8

    goto :goto_9

    .line 201
    .restart local v0    # "bitE":I
    .restart local v2    # "gsmS":I
    .restart local v3    # "lteCqi":I
    .restart local v4    # "lteR":I
    .restart local v5    # "lteRq":I
    .restart local v6    # "lteRssnr":I
    .restart local v7    # "lteS":I
    :catch_2
    move-exception v10

    goto :goto_1

    .line 193
    :catch_3
    move-exception v10

    goto/16 :goto_0
.end method
