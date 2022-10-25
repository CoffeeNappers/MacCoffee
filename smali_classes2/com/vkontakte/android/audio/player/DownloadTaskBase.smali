.class abstract Lcom/vkontakte/android/audio/player/DownloadTaskBase;
.super Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;
.source "DownloadTaskBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;,
        Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToRemove;,
        Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToSave;,
        Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;,
        Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;,
        Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/audio/utils/AsyncTaskCompat",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;",
        ">;"
    }
.end annotation


# instance fields
.field protected final mContext:Landroid/content/Context;

.field private volatile mLastResumeTime:J

.field private mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

.field private volatile mPaused:Z

.field private final mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

.field final mShowNotifications:Z

.field private final mUuid:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;Z)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;
    .param p3, "showNotifications"    # Z

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;-><init>()V

    .line 48
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    .line 49
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    .line 50
    iput-boolean p3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mShowNotifications:Z

    .line 51
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mUuid:Ljava/lang/String;

    .line 52
    new-instance v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;-><init>(Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    .line 54
    const-string/jumbo v0, "Download task created"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 55
    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/audio/player/DownloadTaskBase;Lcom/vkontakte/android/audio/MusicTrack;III)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->showNotificationProgress(Lcom/vkontakte/android/audio/MusicTrack;III)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/audio/player/DownloadTaskBase;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->checkPause()V

    return-void
.end method

.method static synthetic access$400(Ljava/lang/StringBuilder;[Lcom/vkontakte/android/audio/player/SavedTrack;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/StringBuilder;
    .param p1, "x1"    # [Lcom/vkontakte/android/audio/player/SavedTrack;

    .prologue
    .line 37
    invoke-static {p0, p1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->appendTracks(Ljava/lang/StringBuilder;[Lcom/vkontakte/android/audio/player/SavedTrack;)V

    return-void
.end method

.method private static varargs appendTracks(Ljava/lang/StringBuilder;[Lcom/vkontakte/android/audio/player/SavedTrack;)V
    .locals 2
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "tracks"    # [Lcom/vkontakte/android/audio/player/SavedTrack;

    .prologue
    .line 58
    const/16 v1, 0x5b

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 59
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 60
    aget-object v1, p1, v0

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/SavedTrack;->getMid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 62
    const-string/jumbo v1, ", "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 64
    :cond_1
    const/16 v1, 0x5d

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    return-void
.end method

.method private checkPause()V
    .locals 3

    .prologue
    .line 173
    iget-boolean v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mPaused:Z

    if-eqz v2, :cond_2

    .line 174
    monitor-enter p0

    .line 175
    :try_start_0
    iget-boolean v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mPaused:Z

    if-eqz v2, :cond_1

    .line 176
    const/4 v1, 0x0

    .line 177
    .local v1, "interrupted":Z
    :goto_0
    iget-boolean v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 179
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 180
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x1

    .line 182
    goto :goto_0

    .line 184
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    if-eqz v1, :cond_1

    .line 185
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 187
    .end local v1    # "interrupted":Z
    :cond_1
    monitor-exit p0

    .line 189
    :cond_2
    return-void

    .line 187
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method private declared-synchronized isJustResumed()Z
    .locals 4

    .prologue
    .line 193
    monitor-enter p0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mLastResumeTime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x12c

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    .line 195
    :goto_0
    const-wide/16 v2, 0x0

    :try_start_1
    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mLastResumeTime:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit p0

    return v0

    .line 193
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 195
    :catchall_0
    move-exception v0

    const-wide/16 v2, 0x0

    :try_start_2
    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mLastResumeTime:J

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 193
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic lambda$downloadTracks$0(Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 7
    .param p0, "listener"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;
    .param p1, "aLong"    # Ljava/lang/Long;
    .param p2, "aLong2"    # Ljava/lang/Long;

    .prologue
    const-wide/16 v2, 0x0

    .line 286
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 287
    const/4 v6, 0x0

    move-object v1, p0

    move-wide v4, v2

    invoke-interface/range {v1 .. v6}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;->onProgress(JJI)V

    .line 291
    :goto_0
    return-void

    .line 289
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    div-long/2addr v0, v4

    long-to-int v6, v0

    move-object v1, p0

    move-wide v4, v2

    invoke-interface/range {v1 .. v6}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;->onProgress(JJI)V

    goto :goto_0
.end method

.method private varargs publishTracksToSave([Lcom/vkontakte/android/audio/player/SavedTrack;)V
    .locals 3
    .param p1, "tracks"    # [Lcom/vkontakte/android/audio/player/SavedTrack;

    .prologue
    .line 386
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    new-instance v2, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToSave;

    invoke-direct {v2, p1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToSave;-><init>([Lcom/vkontakte/android/audio/player/SavedTrack;)V

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->publishProgress([Ljava/lang/Object;)V

    .line 387
    return-void
.end method

.method private removeNotification()V
    .locals 3

    .prologue
    .line 470
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mShowNotifications:Z

    if-eqz v0, :cond_0

    .line 471
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mUuid:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    .line 472
    :cond_0
    return-void
.end method

.method private removeNotificationFinished()V
    .locals 2

    .prologue
    .line 475
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mShowNotifications:Z

    if-eqz v0, :cond_0

    .line 476
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 477
    :cond_0
    return-void
.end method

.method private showNotificationFinished(Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;)V
    .locals 9
    .param p1, "error"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    .prologue
    const/4 v8, 0x0

    .line 440
    iget-boolean v5, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mShowNotifications:Z

    if-nez v5, :cond_0

    .line 467
    :goto_0
    return-void

    .line 443
    :cond_0
    new-instance v0, Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v5, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-direct {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 444
    .local v0, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    const v5, 0x1080082

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 445
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const v6, 0x7f0804fc

    invoke-virtual {v5, v6}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 447
    if-nez p1, :cond_2

    .line 448
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const v6, 0x7f0804f8

    invoke-virtual {v5, v6}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 457
    :goto_1
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 459
    new-instance v5, Landroid/content/ComponentName;

    iget-object v6, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getAudioPlayerActivityClass()Ljava/lang/Class;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {v5}, Landroid/content/Intent;->makeMainActivity(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v1

    .line 460
    .local v1, "contentIntent":Landroid/content/Intent;
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-static {v5, v8, v1, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 461
    if-eqz p1, :cond_1

    iget-object v5, p1, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;->retryIntent:Landroid/content/Intent;

    if-eqz v5, :cond_1

    .line 462
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    new-instance v6, Ljava/util/Random;

    invoke-direct {v6}, Ljava/util/Random;-><init>()V

    invoke-virtual {v6}, Ljava/util/Random;->nextInt()I

    move-result v6

    iget-object v7, p1, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;->retryIntent:Landroid/content/Intent;

    const/high16 v8, 0x40000000    # 2.0f

    invoke-static {v5, v6, v7, v8}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 463
    .local v2, "pendingIntent":Landroid/app/PendingIntent;
    const v5, 0x7f0202a6

    iget-object v6, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const v7, 0x7f0804fa

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 466
    .end local v2    # "pendingIntent":Landroid/app/PendingIntent;
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/vkontakte/android/audio/utils/Utils;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0

    .line 450
    .end local v1    # "contentIntent":Landroid/content/Intent;
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    iget v6, p1, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;->errorResId:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    .line 451
    .local v4, "text":Ljava/lang/CharSequence;
    invoke-virtual {v0, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 452
    new-instance v3, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v3, v0}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>(Landroid/support/v4/app/NotificationCompat$Builder;)V

    .line 453
    .local v3, "style":Landroid/support/v4/app/NotificationCompat$BigTextStyle;
    invoke-virtual {v3, v4}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    .line 454
    invoke-virtual {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_1
.end method

.method private declared-synchronized showNotificationProgress(IIII)V
    .locals 1
    .param p1, "textId"    # I
    .param p2, "progress"    # I
    .param p3, "count"    # I
    .param p4, "max"    # I

    .prologue
    .line 395
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->showNotificationProgress(Ljava/lang/CharSequence;III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 396
    monitor-exit p0

    return-void

    .line 395
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized showNotificationProgress(Lcom/vkontakte/android/audio/MusicTrack;III)V
    .locals 2
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "progress"    # I
    .param p3, "count"    # I
    .param p4, "max"    # I

    .prologue
    .line 399
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->showNotificationProgress(Ljava/lang/CharSequence;III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 400
    monitor-exit p0

    return-void

    .line 399
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized showNotificationProgress(Ljava/lang/CharSequence;III)V
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "progress"    # I
    .param p3, "count"    # I
    .param p4, "max"    # I

    .prologue
    .line 390
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->set(Ljava/lang/CharSequence;III)V

    .line 391
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->updateNotificationProgress()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 392
    monitor-exit p0

    return-void

    .line 390
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized updateNotificationProgress()V
    .locals 8

    .prologue
    .line 403
    monitor-enter p0

    :try_start_0
    iget-boolean v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mShowNotifications:Z

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    iget-object v3, v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->text:Ljava/lang/CharSequence;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_1

    .line 437
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 406
    :cond_1
    :try_start_1
    new-instance v0, Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 407
    .local v0, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 408
    const v3, 0x1080081

    invoke-virtual {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 409
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    iget v3, v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->max:I

    if-lez v3, :cond_2

    .line 410
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const v4, 0x7f0804fd

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    iget v7, v7, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->count:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    iget v7, v7, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->max:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 413
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    iget-object v3, v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->text:Ljava/lang/CharSequence;

    invoke-virtual {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 414
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setShowWhen(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 415
    const-wide/16 v4, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setWhen(J)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 416
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    iget v3, v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->progress:I

    if-ltz v3, :cond_3

    .line 417
    const/16 v3, 0x64

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    iget v4, v4, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->progress:I

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 420
    :goto_2
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 422
    iget-boolean v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mPaused:Z

    if-eqz v3, :cond_4

    .line 423
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getResumeDownloadIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    .line 424
    .local v1, "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v4, v1, v5}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 425
    .local v2, "pendingIntent":Landroid/app/PendingIntent;
    const v3, 0x7f0202a5

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const v5, 0x7f0804fb

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 432
    :goto_3
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mUuid:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getCancelDownloadIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 433
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v4, v1, v5}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 434
    const v3, 0x7f020297

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const/high16 v5, 0x1040000

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 436
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/vkontakte/android/audio/utils/Utils;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mUuid:Ljava/lang/String;

    const/4 v5, 0x2

    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 403
    .end local v0    # "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "pendingIntent":Landroid/app/PendingIntent;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 412
    .restart local v0    # "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    :cond_2
    :try_start_2
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const v4, 0x7f0804fc

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_1

    .line 419
    :cond_3
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v0, v3, v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_2

    .line 427
    :cond_4
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getPauseDownloadIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    .line 428
    .restart local v1    # "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v4, v1, v5}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 429
    .restart local v2    # "pendingIntent":Landroid/app/PendingIntent;
    const v3, 0x7f02029e

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const v5, 0x7f0804f9

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3
.end method


# virtual methods
.method cancelAndRemoveNotification()V
    .locals 2

    .prologue
    .line 153
    const-string/jumbo v0, "cancelAndRemoveNotification"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 154
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->cancel(Z)Z

    .line 155
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->removeNotification()V

    .line 156
    return-void
.end method

.method downloadTracks(Ljava/util/Collection;)Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)",
            "Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;"
        }
    .end annotation

    .prologue
    .line 213
    .local p1, "musicTracks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-eqz p1, :cond_0

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 214
    :cond_0
    const/4 v3, 0x0

    .line 382
    :goto_0
    return-object v3

    .line 216
    :cond_1
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v18

    .line 218
    .local v18, "trackCount":I
    const-string/jumbo v3, "downloadTracks"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    const/16 v20, 0x0

    const-string/jumbo v21, "Paid count"

    aput-object v21, v6, v20

    const/16 v20, 0x1

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v6, v20

    const/16 v20, 0x2

    const-string/jumbo v21, "Track count"

    aput-object v21, v6, v20

    const/16 v20, 0x3

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v6, v20

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v6}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 220
    if-nez v18, :cond_2

    .line 221
    const/4 v3, 0x0

    goto :goto_0

    .line 223
    :cond_2
    const/4 v3, 0x1

    move/from16 v0, v18

    if-le v0, v3, :cond_5

    const/4 v13, 0x1

    .line 225
    .local v13, "isMultipleMode":Z
    :goto_1
    new-instance v7, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v7, v0, v13, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;-><init>(Lcom/vkontakte/android/audio/player/DownloadTaskBase;ZLjava/util/Collection;)V

    .line 249
    .local v7, "listener":Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;
    new-instance v8, Lcom/vkontakte/android/audio/player/DownloadTaskBase$2;

    move-object/from16 v0, p0

    invoke-direct {v8, v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$2;-><init>(Lcom/vkontakte/android/audio/player/DownloadTaskBase;)V

    .line 258
    .local v8, "converter":Lcom/vkontakte/android/audio/player/DownloadTrackFileConverter;
    const/4 v9, 0x0

    .line 259
    .local v9, "downloadedTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    const/16 v19, -0x1

    .line 260
    .local v19, "trackIndex":I
    const/16 v17, 0x0

    .line 262
    .local v17, "track":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_3
    :goto_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_15

    .line 263
    if-nez v17, :cond_4

    .line 264
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    .end local v17    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    check-cast v17, Lcom/vkontakte/android/audio/MusicTrack;

    .line 265
    .restart local v17    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    add-int/lit8 v19, v19, 0x1

    .line 268
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->checkPause()V

    .line 270
    const/4 v3, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/audio/MusicTrack;->getActualLink(Z)Ljava/lang/String;

    move-result-object v4

    .line 271
    .local v4, "url":Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/audio/AudioFacade;->getTrackDownloadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 273
    .local v5, "file":Ljava/io/File;
    const-string/jumbo v3, "Downloading track"

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/16 v20, 0x0

    const-string/jumbo v21, "mid"

    aput-object v21, v6, v20

    const/16 v20, 0x1

    invoke-virtual/range {v17 .. v17}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v6, v20

    const/16 v20, 0x2

    const-string/jumbo v21, "url"

    aput-object v21, v6, v20

    const/16 v20, 0x3

    aput-object v4, v6, v20

    const/16 v20, 0x4

    const-string/jumbo v21, "file"

    aput-object v21, v6, v20

    const/16 v20, 0x5

    aput-object v5, v6, v20

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v6}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 275
    if-nez v5, :cond_6

    .line 276
    new-instance v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    invoke-direct {v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;-><init>()V

    goto/16 :goto_0

    .line 223
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "file":Ljava/io/File;
    .end local v7    # "listener":Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;
    .end local v8    # "converter":Lcom/vkontakte/android/audio/player/DownloadTrackFileConverter;
    .end local v9    # "downloadedTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    .end local v13    # "isMultipleMode":Z
    .end local v14    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .end local v17    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    .end local v19    # "trackIndex":I
    :cond_5
    const/4 v13, 0x0

    goto :goto_1

    .line 278
    .restart local v4    # "url":Ljava/lang/String;
    .restart local v5    # "file":Ljava/io/File;
    .restart local v7    # "listener":Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;
    .restart local v8    # "converter":Lcom/vkontakte/android/audio/player/DownloadTrackFileConverter;
    .restart local v9    # "downloadedTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    .restart local v13    # "isMultipleMode":Z
    .restart local v14    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .restart local v17    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    .restart local v19    # "trackIndex":I
    :cond_6
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_8

    .line 279
    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/cache/AudioCache;->getFileForMusic(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/io/File;

    move-result-object v15

    .line 280
    .local v15, "oldCacheFile":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 282
    if-eqz v13, :cond_7

    .line 283
    mul-int/lit8 v3, v19, 0x64

    :try_start_0
    div-int v3, v3, v18

    add-int/lit8 v6, v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-direct {v0, v1, v3, v6, v2}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->showNotificationProgress(Lcom/vkontakte/android/audio/MusicTrack;III)V

    .line 285
    :cond_7
    const/4 v3, 0x1

    invoke-static {v7}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;)Lcom/vkontakte/android/functions/VoidF2;

    move-result-object v6

    invoke-static {v15, v5, v3, v6}, Lcom/vkontakte/android/audio/utils/Utils;->replaceFile(Ljava/io/File;Ljava/io/File;ZLcom/vkontakte/android/functions/VoidF2;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 296
    :goto_3
    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    .line 300
    .end local v15    # "oldCacheFile":Ljava/io/File;
    :cond_8
    invoke-virtual/range {v17 .. v17}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v5}, Lcom/vkontakte/android/audio/player/CacheUtils;->tryUseCacheForSaveMusic(Ljava/lang/String;Ljava/io/File;)V

    .line 302
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 303
    if-nez v9, :cond_9

    .line 304
    new-instance v9, Ljava/util/ArrayList;

    .end local v9    # "downloadedTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 305
    .restart local v9    # "downloadedTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    :cond_9
    new-instance v3, Lcom/vkontakte/android/audio/player/SavedTrack;

    move-object/from16 v0, v17

    invoke-direct {v3, v0, v5}, Lcom/vkontakte/android/audio/player/SavedTrack;-><init>(Lcom/vkontakte/android/audio/MusicTrack;Ljava/io/File;)V

    invoke-interface {v9, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 373
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_14

    .line 374
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 292
    .restart local v15    # "oldCacheFile":Ljava/io/File;
    :catch_0
    move-exception v10

    .line 293
    .local v10, "e":Ljava/io/IOException;
    invoke-static {v10}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    goto :goto_3

    .line 307
    .end local v10    # "e":Ljava/io/IOException;
    .end local v15    # "oldCacheFile":Ljava/io/File;
    :cond_a
    if-eqz v9, :cond_b

    .line 308
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lcom/vkontakte/android/audio/player/SavedTrack;

    invoke-interface {v9, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/vkontakte/android/audio/player/SavedTrack;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->publishTracksToSave([Lcom/vkontakte/android/audio/player/SavedTrack;)V

    .line 309
    const/4 v9, 0x0

    .line 312
    :cond_b
    if-eqz v13, :cond_c

    .line 313
    mul-int/lit8 v3, v19, 0x64

    div-int v3, v3, v18

    add-int/lit8 v6, v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-direct {v0, v1, v3, v6, v2}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->showNotificationProgress(Lcom/vkontakte/android/audio/MusicTrack;III)V

    .line 316
    :cond_c
    :try_start_1
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 317
    const/4 v3, 0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/audio/MusicTrack;->getActualLink(Z)Ljava/lang/String;

    move-result-object v4

    .line 319
    :cond_d
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 320
    new-instance v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    invoke-direct {v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;-><init>()V
    :try_end_1
    .catch Lcom/vkontakte/android/audio/http/ResponseException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    goto/16 :goto_0

    .line 329
    :catch_1
    move-exception v10

    .line 330
    .local v10, "e":Lcom/vkontakte/android/audio/http/ResponseException;
    invoke-virtual {v10}, Lcom/vkontakte/android/audio/http/ResponseException;->getStatusCode()I

    move-result v16

    .line 331
    .local v16, "statusCode":I
    const/16 v3, 0x194

    move/from16 v0, v16

    if-eq v0, v3, :cond_e

    div-int/lit8 v3, v16, 0x64

    const/4 v6, 0x3

    if-eq v3, v6, :cond_e

    if-nez v16, :cond_12

    .line 333
    :cond_e
    const/4 v3, 0x1

    :try_start_2
    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/audio/MusicTrack;->getActualLink(Z)Ljava/lang/String;

    move-result-object v4

    .line 334
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFile;->downloadFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ZLcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;)Z

    move-result v3

    if-nez v3, :cond_13

    .line 335
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_11

    .line 336
    new-instance v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    invoke-direct {v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;-><init>()V
    :try_end_2
    .catch Lcom/vkontakte/android/audio/http/ResponseException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    goto/16 :goto_0

    .line 342
    :catch_2
    move-exception v11

    .line 343
    .local v11, "e1":Lcom/vkontakte/android/audio/http/ResponseException;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v11, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 344
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    new-instance v20, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    aput-object v20, v3, v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->publishProgress([Ljava/lang/Object;)V

    .line 345
    const/16 v17, 0x0

    .line 346
    goto/16 :goto_2

    .line 321
    .end local v10    # "e":Lcom/vkontakte/android/audio/http/ResponseException;
    .end local v11    # "e1":Lcom/vkontakte/android/audio/http/ResponseException;
    .end local v16    # "statusCode":I
    :cond_f
    :try_start_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFile;->downloadFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ZLcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;)Z

    move-result v3

    if-nez v3, :cond_13

    .line 322
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_10

    .line 323
    new-instance v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    invoke-direct {v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;-><init>()V
    :try_end_3
    .catch Lcom/vkontakte/android/audio/http/ResponseException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_0

    .line 361
    :catch_3
    move-exception v10

    .line 362
    .local v10, "e":Ljava/lang/Exception;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/16 v20, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    aput-object v20, v3, v6

    invoke-static {v10, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 364
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->isJustResumed()Z

    move-result v3

    if-nez v3, :cond_3

    .line 367
    new-instance v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    invoke-direct {v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;-><init>()V

    goto/16 :goto_0

    .line 324
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_10
    :try_start_4
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->isJustResumed()Z

    move-result v3

    if-nez v3, :cond_3

    .line 327
    new-instance v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    invoke-direct {v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;-><init>()V
    :try_end_4
    .catch Lcom/vkontakte/android/audio/http/ResponseException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_0

    .line 337
    .local v10, "e":Lcom/vkontakte/android/audio/http/ResponseException;
    .restart local v16    # "statusCode":I
    :cond_11
    :try_start_5
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->isJustResumed()Z

    move-result v3

    if-nez v3, :cond_3

    .line 340
    new-instance v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    invoke-direct {v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;-><init>()V
    :try_end_5
    .catch Lcom/vkontakte/android/audio/http/ResponseException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto/16 :goto_0

    .line 347
    :catch_4
    move-exception v12

    .line 348
    .local v12, "e2":Ljava/lang/Exception;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/16 v20, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    aput-object v20, v3, v6

    invoke-static {v12, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 350
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->isJustResumed()Z

    move-result v3

    if-nez v3, :cond_3

    .line 353
    new-instance v3, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    invoke-direct {v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;-><init>()V

    goto/16 :goto_0

    .line 356
    .end local v12    # "e2":Ljava/lang/Exception;
    :cond_12
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v10, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 357
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    new-instance v20, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    aput-object v20, v3, v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->publishProgress([Ljava/lang/Object;)V

    .line 358
    const/16 v17, 0x0

    .line 359
    goto/16 :goto_2

    .line 370
    .end local v10    # "e":Lcom/vkontakte/android/audio/http/ResponseException;
    .end local v16    # "statusCode":I
    :cond_13
    const/4 v3, 0x1

    new-array v3, v3, [Lcom/vkontakte/android/audio/player/SavedTrack;

    const/4 v6, 0x0

    new-instance v20, Lcom/vkontakte/android/audio/player/SavedTrack;

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v5}, Lcom/vkontakte/android/audio/player/SavedTrack;-><init>(Lcom/vkontakte/android/audio/MusicTrack;Ljava/io/File;)V

    aput-object v20, v3, v6

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->publishTracksToSave([Lcom/vkontakte/android/audio/player/SavedTrack;)V

    goto/16 :goto_4

    .line 376
    :cond_14
    const/16 v17, 0x0

    .line 377
    goto/16 :goto_2

    .line 379
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "file":Ljava/io/File;
    :cond_15
    if-eqz v9, :cond_16

    .line 380
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lcom/vkontakte/android/audio/player/SavedTrack;

    invoke-interface {v9, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/vkontakte/android/audio/player/SavedTrack;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->publishTracksToSave([Lcom/vkontakte/android/audio/player/SavedTrack;)V

    .line 382
    :cond_16
    const/4 v3, 0x0

    goto/16 :goto_0
.end method

.method public getProgress()I
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mProgress:Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;

    iget v0, v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->progress:I

    return v0
.end method

.method public getUuid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mUuid:Ljava/lang/String;

    return-object v0
.end method

.method public abstract hasTrack(Ljava/lang/String;)Z
.end method

.method public isPaused()Z
    .locals 1

    .prologue
    .line 145
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mPaused:Z

    return v0
.end method

.method protected varargs log(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 159
    array-length v1, p2

    if-nez v1, :cond_0

    .line 160
    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v2, "PlayerService"

    aput-object v2, v1, v3

    const-string/jumbo v2, "SavedTracks"

    aput-object v2, v1, v4

    aput-object p1, v1, v5

    const-string/jumbo v2, "class"

    aput-object v2, v1, v6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v7

    const/4 v2, 0x5

    const-string/jumbo v3, "uuid"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mUuid:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 170
    :goto_0
    return-void

    .line 162
    :cond_0
    array-length v1, p2

    add-int/lit8 v1, v1, 0x4

    new-array v0, v1, [Ljava/lang/Object;

    .line 163
    .local v0, "newParams":[Ljava/lang/Object;
    const-string/jumbo v1, "class"

    aput-object v1, v0, v3

    .line 164
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    .line 165
    const-string/jumbo v1, "uuid"

    aput-object v1, v0, v5

    .line 166
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mUuid:Ljava/lang/String;

    aput-object v1, v0, v6

    .line 167
    array-length v1, p2

    invoke-static {p2, v3, v0, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 168
    new-array v1, v7, [Ljava/lang/Object;

    const-string/jumbo v2, "PlayerService"

    aput-object v2, v1, v3

    const-string/jumbo v2, "SavedTracks"

    aput-object v2, v1, v4

    aput-object p1, v1, v5

    aput-object v0, v1, v6

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected onCancelled(Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    .prologue
    const/4 v2, 0x0

    .line 92
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->onCancelled(Ljava/lang/Object;)V

    .line 94
    const-string/jumbo v0, "onCancelled"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 95
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->removeNotification()V

    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    invoke-interface {v0, p0, v2}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;->onFinished(Lcom/vkontakte/android/audio/player/DownloadTaskBase;Z)V

    .line 98
    :cond_0
    return-void
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 37
    check-cast p1, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->onCancelled(Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;)V

    return-void
.end method

.method protected onPostExecute(Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;)V
    .locals 5
    .param p1, "result"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 80
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->onPostExecute(Ljava/lang/Object;)V

    .line 82
    const-string/jumbo v3, "onPostExecute"

    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/Object;

    const-string/jumbo v0, "isError"

    aput-object v0, v4, v2

    if-eqz p1, :cond_3

    move v0, v1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v4, v1

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 83
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->removeNotification()V

    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    if-nez p1, :cond_4

    :goto_1
    invoke-interface {v0, p0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;->onFinished(Lcom/vkontakte/android/audio/player/DownloadTaskBase;Z)V

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;->isAllTasksFinished()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 87
    :cond_1
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->showNotificationFinished(Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;)V

    .line 88
    :cond_2
    return-void

    :cond_3
    move v0, v2

    .line 82
    goto :goto_0

    :cond_4
    move v1, v2

    .line 85
    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 37
    check-cast p1, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->onPostExecute(Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 71
    invoke-super {p0}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->onPreExecute()V

    .line 73
    const-string/jumbo v0, "onPreExecute"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->removeNotificationFinished()V

    .line 75
    const v0, 0x7f0803be

    const/4 v1, -0x1

    invoke-direct {p0, v0, v1, v2, v2}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->showNotificationProgress(IIII)V

    .line 76
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .locals 7
    .param p1, "values"    # [Ljava/lang/Object;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StringFormatInvalid"
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 103
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->onProgressUpdate([Ljava/lang/Object;)V

    .line 105
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    if-eqz v2, :cond_0

    array-length v2, p1

    if-lez v2, :cond_0

    .line 106
    aget-object v0, p1, v6

    .line 107
    .local v0, "object":Ljava/lang/Object;
    const-string/jumbo v2, "onProgressUpdate"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string/jumbo v4, "object"

    aput-object v4, v3, v6

    aput-object v0, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 108
    instance-of v2, v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToSave;

    if-eqz v2, :cond_1

    .line 109
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    check-cast v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToSave;

    .end local v0    # "object":Ljava/lang/Object;
    iget-object v3, v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToSave;->tracks:[Lcom/vkontakte/android/audio/player/SavedTrack;

    invoke-interface {v2, v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;->onSaveTracks([Lcom/vkontakte/android/audio/player/SavedTrack;)V

    .line 118
    :cond_0
    :goto_0
    return-void

    .line 110
    .restart local v0    # "object":Ljava/lang/Object;
    :cond_1
    instance-of v2, v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToRemove;

    if-eqz v2, :cond_2

    .line 111
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    check-cast v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToRemove;

    .end local v0    # "object":Ljava/lang/Object;
    iget-object v3, v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToRemove;->tracks:[Lcom/vkontakte/android/audio/player/SavedTrack;

    invoke-interface {v2, v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;->onRemoveTracks([Lcom/vkontakte/android/audio/player/SavedTrack;)V

    goto :goto_0

    .line 112
    .restart local v0    # "object":Ljava/lang/Object;
    :cond_2
    instance-of v2, v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;

    if-eqz v2, :cond_0

    .line 113
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0803c0

    new-array v4, v5, [Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;

    .line 114
    .end local v0    # "object":Ljava/lang/Object;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;->access$100(Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;)Lcom/vkontakte/android/audio/MusicTrack;

    move-result-object v5

    iget-object v5, v5, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    aput-object v5, v4, v6

    .line 113
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 115
    .local v1, "s":Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method public declared-synchronized pause()V
    .locals 1

    .prologue
    .line 129
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mPaused:Z

    if-nez v0, :cond_0

    .line 130
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mPaused:Z

    .line 131
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->updateNotificationProgress()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    :cond_0
    monitor-exit p0

    return-void

    .line 129
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method removeListener()V
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mListener:Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;

    .line 126
    return-void
.end method

.method public declared-synchronized resume()V
    .locals 2

    .prologue
    .line 136
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mPaused:Z

    if-eqz v0, :cond_0

    .line 137
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mPaused:Z

    .line 138
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mLastResumeTime:J

    .line 139
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->updateNotificationProgress()V

    .line 140
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    :cond_0
    monitor-exit p0

    return-void

    .line 136
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected waitForOnline()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 200
    const v1, 0x7f0803bf

    const/4 v2, -0x1

    invoke-direct {p0, v1, v2, v0, v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->showNotificationProgress(IIII)V

    .line 201
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 203
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->waitForOnline(Landroid/content/Context;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    const/4 v0, 0x1

    .line 209
    :cond_0
    return v0

    .line 205
    :catch_0
    move-exception v1

    goto :goto_0
.end method
