.class Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;
.super Ljava/lang/Object;
.source "AudioAdStatSender.java"


# instance fields
.field private volatile progress25Sent:Z

.field private volatile progress50Sent:Z

.field private volatile progress75Sent:Z

.field private volatile startedSent:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->startedSent:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress25Sent:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress50Sent:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress75Sent:Z

    return-void
.end method

.method private sendProgress25(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress25Sent:Z

    if-nez v0, :cond_0

    .line 63
    const-string/jumbo v0, "progress_25"

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress25Sent:Z

    .line 66
    :cond_0
    return-void
.end method

.method private sendProgress50(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 69
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress50Sent:Z

    if-nez v0, :cond_0

    .line 70
    const-string/jumbo v0, "progress_50"

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 71
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress50Sent:Z

    .line 73
    :cond_0
    return-void
.end method

.method private sendProgress75(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress75Sent:Z

    if-nez v0, :cond_0

    .line 77
    const-string/jumbo v0, "progress_75"

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress75Sent:Z

    .line 80
    :cond_0
    return-void
.end method

.method private sendStarted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->startedSent:Z

    if-nez v0, :cond_0

    .line 56
    const-string/jumbo v0, "started"

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->startedSent:Z

    .line 59
    :cond_0
    return-void
.end method

.method private sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 3
    .param p1, "eventType"    # Ljava/lang/String;
    .param p2, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 85
    const-string/jumbo v0, "audio_ad"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "event"

    .line 86
    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "section"

    if-nez p2, :cond_0

    sget-object p2, Lcom/vkontakte/android/audio/player/PlayerRefer;->none:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 87
    .end local p2    # "refer":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
    :cond_0
    invoke-interface {p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;->getExtStr()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 88
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 89
    return-void
.end method


# virtual methods
.method sendCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 26
    const-string/jumbo v0, "completed"

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 27
    return-void
.end method

.method sendNotReceived(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 18
    const-string/jumbo v0, "not_received"

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 19
    return-void
.end method

.method sendProgress(FFLcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 4
    .param p1, "position"    # F
    .param p2, "duration"    # F
    .param p3, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    const/4 v3, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    .line 37
    cmpl-float v1, p1, v3

    if-eqz v1, :cond_0

    cmpl-float v1, p1, p2

    if-eqz v1, :cond_0

    .line 38
    const/high16 v1, 0x42c80000    # 100.0f

    div-float v0, p2, v1

    .line 39
    .local v0, "percent":F
    mul-float v1, v0, v3

    sub-float v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    .line 40
    invoke-direct {p0, p3}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStarted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 49
    .end local v0    # "percent":F
    :cond_0
    :goto_0
    return-void

    .line 41
    .restart local v0    # "percent":F
    :cond_1
    const/high16 v1, 0x41c80000    # 25.0f

    mul-float/2addr v1, v0

    sub-float v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v1, v2

    if-gez v1, :cond_2

    .line 42
    invoke-direct {p0, p3}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendProgress25(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    goto :goto_0

    .line 43
    :cond_2
    const/high16 v1, 0x42480000    # 50.0f

    mul-float/2addr v1, v0

    sub-float v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v1, v2

    if-gez v1, :cond_3

    .line 44
    invoke-direct {p0, p3}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendProgress50(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    goto :goto_0

    .line 45
    :cond_3
    const/high16 v1, 0x42960000    # 75.0f

    mul-float/2addr v1, v0

    sub-float v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    .line 46
    invoke-direct {p0, p3}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendProgress75(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    goto :goto_0
.end method

.method sendReady(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 30
    const-string/jumbo v0, "ready"

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress75Sent:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress50Sent:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->progress25Sent:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->startedSent:Z

    .line 32
    return-void
.end method

.method sendReceived(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 14
    const-string/jumbo v0, "received"

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 15
    return-void
.end method

.method sendRejected(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 22
    const-string/jumbo v0, "rejected"

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 23
    return-void
.end method

.method sendRequested(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 10
    const-string/jumbo v0, "requested"

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendStat(Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 11
    return-void
.end method
