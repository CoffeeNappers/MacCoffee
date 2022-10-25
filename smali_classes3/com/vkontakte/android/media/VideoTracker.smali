.class public Lcom/vkontakte/android/media/VideoTracker;
.super Ljava/lang/Object;
.source "VideoTracker.java"


# static fields
.field static final DEBUG:Z = false

.field static final TAG:Ljava/lang/String; = "VideoStats"

.field static final position3s:I = 0x3

.field static final positionStart:I


# instance fields
.field lastPosition:I

.field final mAutoplay:Z

.field final mContext:Ljava/lang/String;

.field final mFile:Lcom/vkontakte/android/api/VideoFile;

.field final mPostId:I

.field final mPostOwnerId:I

.field final mSource:Ljava/lang/String;

.field final mStatistic:Lcom/vkontakte/android/statistics/Statistic;

.field final position25:I

.field final position50:I

.field final position75:I

.field final position95:I

.field final positionEnd:I


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/api/VideoFile;Lcom/vkontakte/android/statistics/Statistic;IILjava/lang/String;ZLjava/lang/String;)V
    .locals 2
    .param p1, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .param p2, "statistic"    # Lcom/vkontakte/android/statistics/Statistic;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "postId"    # I
    .param p4, "postOwnerId"    # I
    .param p5, "referer"    # Ljava/lang/String;
    .param p6, "autoplay"    # Z
    .param p7, "context"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/media/VideoTracker;->mFile:Lcom/vkontakte/android/api/VideoFile;

    .line 43
    iput p3, p0, Lcom/vkontakte/android/media/VideoTracker;->mPostId:I

    .line 44
    iput p4, p0, Lcom/vkontakte/android/media/VideoTracker;->mPostOwnerId:I

    .line 45
    iput-object p2, p0, Lcom/vkontakte/android/media/VideoTracker;->mStatistic:Lcom/vkontakte/android/statistics/Statistic;

    .line 46
    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    int-to-float v0, v0

    const/high16 v1, 0x3e800000    # 0.25f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/vkontakte/android/media/VideoTracker;->position25:I

    .line 47
    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    int-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/vkontakte/android/media/VideoTracker;->position50:I

    .line 48
    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    int-to-float v0, v0

    const/high16 v1, 0x3f400000    # 0.75f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/vkontakte/android/media/VideoTracker;->position75:I

    .line 49
    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    int-to-float v0, v0

    const v1, 0x3f733333    # 0.95f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/vkontakte/android/media/VideoTracker;->position95:I

    .line 50
    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/media/VideoTracker;->positionEnd:I

    .line 51
    iput-object p5, p0, Lcom/vkontakte/android/media/VideoTracker;->mSource:Ljava/lang/String;

    .line 52
    iput-boolean p6, p0, Lcom/vkontakte/android/media/VideoTracker;->mAutoplay:Z

    .line 53
    iput-object p7, p0, Lcom/vkontakte/android/media/VideoTracker;->mContext:Ljava/lang/String;

    .line 54
    return-void
.end method

.method static contains(III)Z
    .locals 1
    .param p0, "left"    # I
    .param p1, "right"    # I
    .param p2, "val"    # I

    .prologue
    .line 170
    if-le p2, p0, :cond_0

    if-gt p2, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private send(Ljava/lang/String;I)V
    .locals 4
    .param p1, "position"    # Ljava/lang/String;
    .param p2, "quality"    # I

    .prologue
    .line 132
    const-string/jumbo v1, "video_play"

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 133
    .local v0, "event":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    const-string/jumbo v1, "video_id"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vkontakte/android/media/VideoTracker;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/media/VideoTracker;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 134
    const-string/jumbo v1, "source"

    iget-object v2, p0, Lcom/vkontakte/android/media/VideoTracker;->mSource:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 135
    const-string/jumbo v2, "autoplay"

    iget-boolean v1, p0, Lcom/vkontakte/android/media/VideoTracker;->mAutoplay:Z

    if-eqz v1, :cond_2

    const-string/jumbo v1, "1"

    :goto_0
    invoke-virtual {v0, v2, v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 136
    const-string/jumbo v1, "position"

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 137
    if-ltz p2, :cond_0

    .line 138
    const-string/jumbo v1, "quality"

    add-int/lit8 v2, p2, -0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 140
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoTracker;->mContext:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 141
    const-string/jumbo v1, "context"

    iget-object v2, p0, Lcom/vkontakte/android/media/VideoTracker;->mContext:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 143
    :cond_1
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 147
    return-void

    .line 135
    :cond_2
    const-string/jumbo v1, "0"

    goto :goto_0
.end method

.method private sendAdsStat(Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoTracker;->mStatistic:Lcom/vkontakte/android/statistics/Statistic;

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoTracker;->mStatistic:Lcom/vkontakte/android/statistics/Statistic;

    invoke-static {v0, p1}, Lcom/vkontakte/android/data/Analytics;->sendPromoActionByType(Lcom/vkontakte/android/statistics/Statistic;Ljava/lang/String;)V

    .line 167
    :cond_0
    return-void
.end method

.method private sendVideoEvent(Ljava/lang/String;)V
    .locals 4
    .param p1, "eventStr"    # Ljava/lang/String;

    .prologue
    .line 150
    const-string/jumbo v1, "video_event"

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 151
    .local v0, "event":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    const-string/jumbo v1, "video_id"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vkontakte/android/media/VideoTracker;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/media/VideoTracker;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 152
    const-string/jumbo v1, "source"

    iget-object v2, p0, Lcom/vkontakte/android/media/VideoTracker;->mSource:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 153
    const-string/jumbo v1, "event"

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 154
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoTracker;->mContext:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 155
    const-string/jumbo v1, "context"

    iget-object v2, p0, Lcom/vkontakte/android/media/VideoTracker;->mContext:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 157
    :cond_0
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 161
    return-void
.end method


# virtual methods
.method public reset()V
    .locals 1

    .prologue
    .line 57
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    .line 58
    return-void
.end method

.method public reset(I)V
    .locals 0
    .param p1, "position"    # I

    .prologue
    .line 61
    iput p1, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    .line 62
    return-void
.end method

.method public track(II)V
    .locals 2
    .param p1, "sec"    # I
    .param p2, "quality"    # I

    .prologue
    .line 65
    iget v0, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    if-ne p1, v0, :cond_0

    .line 99
    :goto_0
    return-void

    .line 68
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/media/VideoTracker;->contains(III)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 69
    const-string/jumbo v0, "start"

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/media/VideoTracker;->send(Ljava/lang/String;I)V

    .line 70
    const-string/jumbo v0, "video_start"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 72
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoTracker;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->duration:I

    if-lez v0, :cond_7

    .line 73
    iget v0, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    const/4 v1, 0x3

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/media/VideoTracker;->contains(III)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 74
    const-string/jumbo v0, "3s"

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/media/VideoTracker;->send(Ljava/lang/String;I)V

    .line 75
    const-string/jumbo v0, "video_play_3s"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 77
    :cond_2
    iget v0, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    iget v1, p0, Lcom/vkontakte/android/media/VideoTracker;->position25:I

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/media/VideoTracker;->contains(III)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 78
    const-string/jumbo v0, "25"

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/media/VideoTracker;->send(Ljava/lang/String;I)V

    .line 79
    const-string/jumbo v0, "video_play_25"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 81
    :cond_3
    iget v0, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    iget v1, p0, Lcom/vkontakte/android/media/VideoTracker;->position50:I

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/media/VideoTracker;->contains(III)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 82
    const-string/jumbo v0, "50"

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/media/VideoTracker;->send(Ljava/lang/String;I)V

    .line 83
    const-string/jumbo v0, "video_play_50"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 85
    :cond_4
    iget v0, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    iget v1, p0, Lcom/vkontakte/android/media/VideoTracker;->position75:I

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/media/VideoTracker;->contains(III)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 86
    const-string/jumbo v0, "75"

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/media/VideoTracker;->send(Ljava/lang/String;I)V

    .line 87
    const-string/jumbo v0, "video_play_75"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 89
    :cond_5
    iget v0, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    iget v1, p0, Lcom/vkontakte/android/media/VideoTracker;->position95:I

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/media/VideoTracker;->contains(III)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 90
    const-string/jumbo v0, "95"

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/media/VideoTracker;->send(Ljava/lang/String;I)V

    .line 91
    const-string/jumbo v0, "video_play_95"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 93
    :cond_6
    iget v0, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    iget v1, p0, Lcom/vkontakte/android/media/VideoTracker;->positionEnd:I

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/media/VideoTracker;->contains(III)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 94
    const-string/jumbo v0, "100"

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/media/VideoTracker;->send(Ljava/lang/String;I)V

    .line 95
    const-string/jumbo v0, "video_play_100"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 98
    :cond_7
    iput p1, p0, Lcom/vkontakte/android/media/VideoTracker;->lastPosition:I

    goto/16 :goto_0
.end method

.method public trackFullscreenOff()V
    .locals 1

    .prologue
    .line 117
    const-string/jumbo v0, "video_fullscreen_off"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 118
    const-string/jumbo v0, "fullscreen_off"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendVideoEvent(Ljava/lang/String;)V

    .line 119
    return-void
.end method

.method public trackFullscreenOn()V
    .locals 1

    .prologue
    .line 112
    const-string/jumbo v0, "video_fullscreen_on"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 113
    const-string/jumbo v0, "fullscreen_on"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendVideoEvent(Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public trackPause()V
    .locals 1

    .prologue
    .line 107
    const-string/jumbo v0, "video_pause"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 108
    const-string/jumbo v0, "pause"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendVideoEvent(Ljava/lang/String;)V

    .line 109
    return-void
.end method

.method public trackResume()V
    .locals 1

    .prologue
    .line 102
    const-string/jumbo v0, "video_resume"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 103
    const-string/jumbo v0, "resume"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendVideoEvent(Ljava/lang/String;)V

    .line 104
    return-void
.end method

.method public trackVolumeOff()V
    .locals 1

    .prologue
    .line 127
    const-string/jumbo v0, "video_volume_off"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 128
    const-string/jumbo v0, "volume_off"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendVideoEvent(Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method public trackVolumeOn()V
    .locals 1

    .prologue
    .line 122
    const-string/jumbo v0, "video_volume_on"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendAdsStat(Ljava/lang/String;)V

    .line 123
    const-string/jumbo v0, "volume_on"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoTracker;->sendVideoEvent(Ljava/lang/String;)V

    .line 124
    return-void
.end method
