.class Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;
.super Ljava/lang/Object;
.source "PlayerService.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/PlayerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/PlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyPlayerListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/PlayerService;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;)V
    .locals 0

    .prologue
    .line 517
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/PlayerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/PlayerService$1;

    .prologue
    .line 517
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$onStateChanged$0(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "mid"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 538
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-virtual {v0, p2, p1}, Lcom/vkontakte/android/audio/player/PlayerService;->showNotification(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onStateChanged$1(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "mid"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 539
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/audio/player/PlayerService;->showNotification(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    return-void
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 1
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 559
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/AudioStateListener;->onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 560
    return-void
.end method

.method public onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 1
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 564
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/AudioStateListener;->onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V

    .line 566
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1300(Lcom/vkontakte/android/audio/player/PlayerService;)V

    .line 567
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 1
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 554
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/AudioStateListener;->onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 555
    return-void
.end method

.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 9
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v3, 0x0

    .line 520
    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    const-string/jumbo v5, "PlayerService"

    aput-object v5, v4, v7

    const-string/jumbo v5, "PlayerService"

    aput-object v5, v4, v8

    const/4 v5, 0x2

    const-string/jumbo v6, "onStateChanged"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string/jumbo v6, "state"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    aput-object p1, v4, v5

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 521
    sget-object v4, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne p1, v4, :cond_0

    .line 522
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-virtual {v3, v8}, Lcom/vkontakte/android/audio/player/PlayerService;->stopForeground(Z)V

    .line 523
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/PlayerService;->cancelNotification()V

    .line 524
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v3, v7}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1100(Lcom/vkontakte/android/audio/player/PlayerService;Z)V

    .line 542
    :goto_0
    sget-object v3, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v3, p1, p2}, Lcom/vkontakte/android/audio/AudioStateListener;->onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 544
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1300(Lcom/vkontakte/android/audio/player/PlayerService;)V

    .line 545
    return-void

    .line 526
    :cond_0
    if-nez p2, :cond_1

    move-object v1, v3

    .line 527
    .local v1, "track":Lcom/vkontakte/android/audio/MusicTrack;
    :goto_1
    if-nez v1, :cond_2

    move-object v0, v3

    .line 528
    .local v0, "mid":Ljava/lang/String;
    :goto_2
    if-nez v1, :cond_3

    move-object v2, v3

    .line 530
    .local v2, "url":Ljava/lang/String;
    :goto_3
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v4, v0}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1202(Lcom/vkontakte/android/audio/player/PlayerService;Ljava/lang/String;)Ljava/lang/String;

    .line 532
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 533
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-virtual {v4, v3, v0}, Lcom/vkontakte/android/audio/player/PlayerService;->showNotification(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    goto :goto_0

    .line 526
    .end local v0    # "mid":Ljava/lang/String;
    .end local v1    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    .end local v2    # "url":Ljava/lang/String;
    :cond_1
    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    goto :goto_1

    .line 527
    .restart local v1    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_2
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 528
    .restart local v0    # "mid":Ljava/lang/String;
    :cond_3
    invoke-static {}, Lcom/vkontakte/android/audio/utils/Utils;->getMaxCoverSize()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/audio/MusicTrack;->getThumbUrl(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    .line 535
    .restart local v2    # "url":Ljava/lang/String;
    :cond_4
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v3

    .line 536
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v4

    invoke-virtual {v3, v4}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v3

    .line 537
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v4

    invoke-virtual {v3, v4}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v3

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;Ljava/lang/String;)Lio/reactivex/functions/Consumer;

    move-result-object v4

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;Ljava/lang/String;)Lio/reactivex/functions/Consumer;

    move-result-object v5

    .line 538
    invoke-virtual {v3, v4, v5}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    goto :goto_0
.end method

.method public onTrackListChanged(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 549
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/AudioStateListener;->onTrackListChanged(Ljava/util/List;)V

    .line 550
    return-void
.end method
