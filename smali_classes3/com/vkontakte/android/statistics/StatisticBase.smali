.class public abstract Lcom/vkontakte/android/statistics/StatisticBase;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "StatisticBase.java"


# instance fields
.field protected key:Ljava/lang/String;

.field protected volatile sent:Z

.field protected type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/statistics/StatisticBase;->sent:Z

    .line 17
    iput-object p1, p0, Lcom/vkontakte/android/statistics/StatisticBase;->type:Ljava/lang/String;

    .line 18
    iput-object p2, p0, Lcom/vkontakte/android/statistics/StatisticBase;->key:Ljava/lang/String;

    .line 19
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/statistics/StatisticBase;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/statistics/StatisticBase;

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/vkontakte/android/statistics/StatisticBase;->canBeSent()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/statistics/StatisticBase;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/statistics/StatisticBase;

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/vkontakte/android/statistics/StatisticBase;->sent()V

    return-void
.end method

.method private canBeSent()Z
    .locals 1

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/vkontakte/android/statistics/StatisticBase;->sent:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/statistics/StatisticBase;->key:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/statistics/SentTable;->isSent(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/statistics/StatisticBase;->sent:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isLoadedPreviousInfo()Z
    .locals 1

    .prologue
    .line 72
    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->keysSet:Ljava/util/Set;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isUniqueType()Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 80
    iget-object v2, p0, Lcom/vkontakte/android/statistics/StatisticBase;->type:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v2, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_0

    move v0, v1

    .line 106
    :pswitch_0
    return v0

    .line 80
    :sswitch_0
    const-string/jumbo v4, "impression"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v2, v1

    goto :goto_0

    :sswitch_1
    const-string/jumbo v4, "load"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v2, v0

    goto :goto_0

    :sswitch_2
    const-string/jumbo v4, "video_start"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v4, "video_play_3s"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v4, "video_play_25"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :sswitch_5
    const-string/jumbo v4, "video_play_50"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x5

    goto :goto_0

    :sswitch_6
    const-string/jumbo v4, "video_play_75"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x6

    goto :goto_0

    :sswitch_7
    const-string/jumbo v4, "video_play_95"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x7

    goto :goto_0

    :sswitch_8
    const-string/jumbo v4, "ads/impression_pretty_card"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0x8

    goto :goto_0

    :sswitch_9
    const-string/jumbo v4, "click"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0x9

    goto :goto_0

    :sswitch_a
    const-string/jumbo v4, "like_post"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0xa

    goto :goto_0

    :sswitch_b
    const-string/jumbo v4, "click_post_link"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_c
    const-string/jumbo v4, "share_post"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_d
    const-string/jumbo v4, "click_deeplink"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_e
    const-string/jumbo v4, "click_post_owner"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_f
    const-string/jumbo v4, "video_pause"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_10
    const-string/jumbo v4, "video_resume"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_11
    const-string/jumbo v4, "video_play_100"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_12
    const-string/jumbo v4, "video_volume_on"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_13
    const-string/jumbo v4, "video_volume_off"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_14
    const-string/jumbo v4, "video_fullscreen_on"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_15
    const-string/jumbo v4, "video_fullscreen_off"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        -0x6a93eb00 -> :sswitch_c
        -0x270688d1 -> :sswitch_15
        -0xe8cbe95 -> :sswitch_e
        -0x9c237b8 -> :sswitch_a
        -0x60d8443 -> :sswitch_d
        -0x51111a0 -> :sswitch_12
        -0x2403f8f -> :sswitch_10
        0x32c4e6 -> :sswitch_1
        0x5a5c588 -> :sswitch_9
        0x7309209 -> :sswitch_0
        0x10d4b5aa -> :sswitch_11
        0x28080c1f -> :sswitch_14
        0x2a733442 -> :sswitch_8
        0x3112aa42 -> :sswitch_b
        0x52641532 -> :sswitch_f
        0x5296b39e -> :sswitch_2
        0x5b61b36a -> :sswitch_4
        0x5b61b3c2 -> :sswitch_5
        0x5b61b3c7 -> :sswitch_3
        0x5b61b405 -> :sswitch_6
        0x5b61b443 -> :sswitch_7
        0x62eedd0e -> :sswitch_13
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private sent()V
    .locals 1

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/vkontakte/android/statistics/StatisticBase;->isUniqueType()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/statistics/StatisticBase;->sent:Z

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/statistics/StatisticBase;->key:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/statistics/SentTable;->addSent(Ljava/lang/String;)V

    .line 69
    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$null$0(Lcom/vkontakte/android/statistics/StatisticSender;)V
    .locals 1
    .param p1, "sender"    # Lcom/vkontakte/android/statistics/StatisticSender;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vkontakte/android/statistics/StatisticBase;->canBeSent()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1, p0}, Lcom/vkontakte/android/statistics/StatisticSender;->send(Lcom/vkontakte/android/statistics/StatisticBase;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 34
    invoke-direct {p0}, Lcom/vkontakte/android/statistics/StatisticBase;->sent()V

    .line 36
    :cond_0
    return-void
.end method

.method synthetic lambda$sendSync$1(Lcom/vkontakte/android/statistics/StatisticSender;)V
    .locals 1
    .param p1, "sender"    # Lcom/vkontakte/android/statistics/StatisticSender;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 31
    invoke-static {}, Lcom/vkontakte/android/statistics/SentTable;->init()V

    .line 32
    invoke-static {p0, p1}, Lcom/vkontakte/android/statistics/StatisticBase$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/statistics/StatisticBase;Lcom/vkontakte/android/statistics/StatisticSender;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 37
    return-void
.end method

.method public sendAsync(Lcom/vkontakte/android/statistics/StatisticSender;IJ)V
    .locals 7
    .param p1, "sender"    # Lcom/vkontakte/android/statistics/StatisticSender;
    .param p2, "retryCount"    # I
    .param p3, "retryTime"    # J

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/vkontakte/android/statistics/StatisticBase;->isLoadedPreviousInfo()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/vkontakte/android/statistics/StatisticBase;->canBeSent()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 43
    :cond_0
    new-instance v0, Lcom/vkontakte/android/statistics/StatisticBase$1;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/statistics/StatisticBase$1;-><init>(Lcom/vkontakte/android/statistics/StatisticBase;Lcom/vkontakte/android/statistics/StatisticSender;IJ)V

    invoke-static {v0}, Lcom/vkontakte/android/api/APIController;->runInBg(Ljava/lang/Runnable;)V

    .line 62
    :cond_1
    return-void
.end method

.method public sendSync(Lcom/vkontakte/android/statistics/StatisticSender;)V
    .locals 1
    .param p1, "sender"    # Lcom/vkontakte/android/statistics/StatisticSender;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/statistics/StatisticBase;->isLoadedPreviousInfo()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 25
    invoke-direct {p0}, Lcom/vkontakte/android/statistics/StatisticBase;->canBeSent()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1, p0}, Lcom/vkontakte/android/statistics/StatisticSender;->send(Lcom/vkontakte/android/statistics/StatisticBase;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 27
    invoke-direct {p0}, Lcom/vkontakte/android/statistics/StatisticBase;->sent()V

    .line 39
    :cond_0
    :goto_0
    return-void

    .line 30
    :cond_1
    invoke-static {p0, p1}, Lcom/vkontakte/android/statistics/StatisticBase$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/statistics/StatisticBase;Lcom/vkontakte/android/statistics/StatisticSender;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/api/APIController;->runInBg(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
