.class Lcom/vkontakte/android/audio/player/AudioStatSender;
.super Ljava/lang/Object;
.source "AudioStatSender.java"


# instance fields
.field private duration:J

.field private duration_max:J

.field private lastProgress:J

.field private refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

.field private volatile sent:Z

.field private startTime:J

.field private track:Lcom/vkontakte/android/audio/MusicTrack;


# direct methods
.method constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const-wide/16 v0, 0x0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object v2, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->track:Lcom/vkontakte/android/audio/MusicTrack;

    .line 21
    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->duration_max:J

    .line 22
    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->duration:J

    .line 23
    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->lastProgress:J

    .line 24
    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->startTime:J

    .line 25
    iput-object v2, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .line 27
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->sent:Z

    return-void
.end method

.method private checkNewTrack(Lcom/vkontakte/android/audio/MusicTrack;J)V
    .locals 4
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "duration_max"    # J

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->track:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-static {v0, p1}, Lcom/vkontakte/android/utils/Utils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 31
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/AudioStatSender;->trySendStat()V

    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->startTime:J

    .line 34
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->track:Lcom/vkontakte/android/audio/MusicTrack;

    .line 35
    iput-wide p2, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->duration_max:J

    .line 36
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->duration:J

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->sent:Z

    .line 39
    :cond_0
    return-void
.end method

.method private getTimeListened()J
    .locals 4

    .prologue
    .line 67
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->duration:J

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->duration_max:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    return-wide v0
.end method

.method private isDurationValid()Z
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x1

    return v0
.end method

.method private declared-synchronized trySendStat()V
    .locals 12

    .prologue
    .line 88
    monitor-enter p0

    :try_start_0
    iget-boolean v5, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->sent:Z

    if-nez v5, :cond_2

    iget-object v5, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->track:Lcom/vkontakte/android/audio/MusicTrack;

    if-eqz v5, :cond_2

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/AudioStatSender;->isDurationValid()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 90
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/AudioStatSender;->getTimeListened()J

    move-result-wide v2

    .line 91
    .local v2, "durationSecToSend":J
    iget-wide v6, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->startTime:J

    .line 93
    .local v6, "time":J
    const-string/jumbo v5, "audio_play"

    invoke-static {v5}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v5

    const-string/jumbo v10, "audio_id"

    iget-object v11, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->track:Lcom/vkontakte/android/audio/MusicTrack;

    .line 94
    invoke-virtual {v11}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v5

    const-string/jumbo v10, "uuid"

    .line 95
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/UUID;->hashCode()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v5

    const-string/jumbo v10, "start_time"

    .line 96
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v5

    const-string/jumbo v10, "duration"

    .line 97
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 98
    .local v0, "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->track:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v5, v5, Lcom/vkontakte/android/audio/MusicTrack;->playlistId:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 99
    const-string/jumbo v5, "playlist_id"

    iget-object v10, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->track:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v10, v10, Lcom/vkontakte/android/audio/MusicTrack;->playlistId:Ljava/lang/String;

    invoke-virtual {v0, v5, v10}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 101
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    if-eqz v5, :cond_1

    .line 102
    const-string/jumbo v5, "source"

    iget-object v10, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-interface {v10}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;->getStr()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v5, v10}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 104
    :cond_1
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 106
    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "Send audio_play stat"

    aput-object v11, v5, v10

    const/4 v10, 0x1

    const-string/jumbo v11, "duration:"

    aput-object v11, v5, v10

    const/4 v10, 0x2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v5, v10

    const/4 v10, 0x3

    const-string/jumbo v11, "time:"

    aput-object v11, v5, v10

    const/4 v10, 0x4

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v5, v10

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 108
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->sent:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    :try_start_1
    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v4

    .line 112
    .local v4, "prefs":Lcom/vkontakte/android/audio/player/Prefs;
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/AudioStatSender;->getTodayListeningTimeSec()J

    move-result-wide v8

    .line 113
    .local v8, "timeAll":J
    iget-object v5, v4, Lcom/vkontakte/android/audio/player/Prefs;->playedLastDate:Lcom/vk/core/util/Preference$PreferenceLong;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v5, v10}, Lcom/vk/core/util/Preference$PreferenceLong;->set(Ljava/lang/Long;)V

    .line 114
    iget-object v5, v4, Lcom/vkontakte/android/audio/player/Prefs;->playedTime:Lcom/vk/core/util/Preference$PreferenceLong;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v5, v10}, Lcom/vk/core/util/Preference$PreferenceLong;->set(Ljava/lang/Long;)V

    .line 116
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v5, v10

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    .end local v0    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .end local v2    # "durationSecToSend":J
    .end local v4    # "prefs":Lcom/vkontakte/android/audio/player/Prefs;
    .end local v6    # "time":J
    .end local v8    # "timeAll":J
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    .line 117
    .restart local v0    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .restart local v2    # "durationSecToSend":J
    .restart local v6    # "time":J
    :catch_0
    move-exception v1

    .line 118
    .local v1, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    :try_start_2
    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1, v5}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 88
    .end local v0    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "durationSecToSend":J
    .end local v6    # "time":J
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method


# virtual methods
.method getTodayListeningTimeSec()J
    .locals 8

    .prologue
    .line 76
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v1

    .line 77
    .local v1, "prefs":Lcom/vkontakte/android/audio/player/Prefs;
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    .line 78
    .local v3, "today":Ljava/util/Date;
    new-instance v0, Ljava/util/Date;

    iget-object v4, v1, Lcom/vkontakte/android/audio/player/Prefs;->playedLastDate:Lcom/vk/core/util/Preference$PreferenceLong;

    invoke-virtual {v4}, Lcom/vk/core/util/Preference$PreferenceLong;->get()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 79
    .local v0, "lastSend":Ljava/util/Date;
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string/jumbo v4, "yyyyMMdd"

    invoke-direct {v2, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 80
    .local v2, "sdf":Ljava/text/SimpleDateFormat;
    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 81
    iget-object v4, v1, Lcom/vkontakte/android/audio/player/Prefs;->playedTime:Lcom/vk/core/util/Preference$PreferenceLong;

    invoke-virtual {v4}, Lcom/vk/core/util/Preference$PreferenceLong;->get()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/AudioStatSender;->getTimeListened()J

    move-result-wide v6

    add-long/2addr v4, v6

    .line 83
    :goto_0
    return-wide v4

    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/AudioStatSender;->getTimeListened()J

    move-result-wide v4

    goto :goto_0
.end method

.method onPrepared(Lcom/vkontakte/android/audio/MusicTrack;JLcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 2
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "duration_max"    # J
    .param p4, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 42
    iput-object p4, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .line 44
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/audio/player/AudioStatSender;->checkNewTrack(Lcom/vkontakte/android/audio/MusicTrack;J)V

    .line 45
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->lastProgress:J

    .line 46
    return-void
.end method

.method onProgress(Lcom/vkontakte/android/audio/MusicTrack;JJLcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 4
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "duration_max"    # J
    .param p4, "progress"    # J
    .param p6, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    .line 49
    iput-object p6, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .line 51
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/audio/player/AudioStatSender;->checkNewTrack(Lcom/vkontakte/android/audio/MusicTrack;J)V

    .line 52
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->lastProgress:J

    cmp-long v0, p4, v0

    if-lez v0, :cond_0

    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->lastProgress:J

    sub-long v0, p4, v0

    const-wide/16 v2, 0x7d0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 53
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->duration:J

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->lastProgress:J

    sub-long v2, p4, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->duration:J

    .line 55
    :cond_0
    iput-wide p4, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->lastProgress:J

    .line 57
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/AudioStatSender;->duration:J

    cmp-long v0, v0, p2

    if-ltz v0, :cond_1

    .line 58
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/AudioStatSender;->trySendStat()V

    .line 60
    :cond_1
    return-void
.end method

.method release()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/AudioStatSender;->trySendStat()V

    .line 64
    return-void
.end method
