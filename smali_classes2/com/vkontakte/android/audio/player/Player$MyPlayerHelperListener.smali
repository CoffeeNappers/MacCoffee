.class Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;
.super Ljava/lang/Object;
.source "Player.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/Player;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyPlayerHelperListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/Player;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0

    .prologue
    .line 743
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/Player;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/Player$1;

    .prologue
    .line 743
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;-><init>(Lcom/vkontakte/android/audio/player/Player;)V

    return-void
.end method


# virtual methods
.method public isLooping()Z
    .locals 2

    .prologue
    .line 831
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/audio/player/LoopMode;->TRACK:Lcom/vkontakte/android/audio/player/LoopMode;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .locals 2
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "percent"    # I

    .prologue
    .line 820
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v0

    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v1

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->setBufferingPercent(II)V

    .line 821
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1100(Lcom/vkontakte/android/audio/player/Player;)V

    .line 822
    return-void
.end method

.method public onCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V
    .locals 6
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 765
    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v2

    if-nez v2, :cond_0

    .line 766
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->isLooping()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 767
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/Player;->getTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v0

    .line 768
    .local v0, "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    if-nez v0, :cond_1

    const/4 v1, 0x0

    .line 769
    .local v1, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :goto_0
    if-eqz v1, :cond_2

    .line 770
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    iget-object v3, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-static {v2, v3, v4, v5}, Lcom/vkontakte/android/audio/player/Player;->access$1200(Lcom/vkontakte/android/audio/player/Player;Ljava/lang/String;ZZ)V

    .line 781
    .end local v0    # "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    .end local v1    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_0
    :goto_1
    return-void

    .line 768
    .restart local v0    # "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    :cond_1
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    goto :goto_0

    .line 774
    .end local v0    # "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/Player;->playNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 775
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/Player;->access$1300(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    .line 776
    .restart local v1    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v1, :cond_3

    .line 777
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    iget-object v3, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/audio/player/Player;->play(Ljava/lang/String;)V

    .line 778
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/Player;->stop()V

    goto :goto_1
.end method

.method public onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V
    .locals 4
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "errorType"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;

    .prologue
    const/4 v3, 0x0

    .line 785
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const-string/jumbo v1, "PlayerService"

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-string/jumbo v2, "onError"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "error type"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    aput-object p2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 786
    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v0

    if-nez v0, :cond_0

    .line 787
    sget-object v0, Lcom/vkontakte/android/audio/player/Player$2;->$SwitchMap$com$vkontakte$android$audio$player$MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType:[I

    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 795
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1500(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/PlayerService;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 796
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1400(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/Player$ErrorHandler;

    move-result-object v0

    const v1, 0x7f0803c1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->error(I[Ljava/lang/Object;)V

    .line 803
    :cond_0
    :goto_0
    return-void

    .line 789
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1400(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/Player$ErrorHandler;

    move-result-object v0

    const v1, 0x7f0803c3

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->error(I[Ljava/lang/Object;)V

    goto :goto_0

    .line 792
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1400(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/Player$ErrorHandler;

    move-result-object v0

    const v1, 0x7f0803c5

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->error(I[Ljava/lang/Object;)V

    goto :goto_0

    .line 798
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1400(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/Player$ErrorHandler;

    move-result-object v0

    const v1, 0x7f0803c2

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->error(I[Ljava/lang/Object;)V

    goto :goto_0

    .line 787
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onHelperIdChange(I)V
    .locals 1
    .param p1, "newId"    # I

    .prologue
    .line 826
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->setCurrentIndex(I)V

    .line 827
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$900(Lcom/vkontakte/android/audio/player/Player;)V

    .line 828
    return-void
.end method

.method public onPrepared(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .locals 5
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "duration"    # I

    .prologue
    .line 747
    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v0

    if-nez v0, :cond_1

    .line 748
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$800(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/AudioStatSender;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    int-to-long v2, p2

    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getRefer()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/audio/player/AudioStatSender;->onPrepared(Lcom/vkontakte/android/audio/MusicTrack;JLcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 750
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPosition()I

    move-result v0

    if-lez v0, :cond_0

    .line 751
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/Player;->seekTo(I)V

    .line 753
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->getTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/MusicApp;->sendBroadcast(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    .line 756
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v0

    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v1

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->setDuration(II)V

    .line 758
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$900(Lcom/vkontakte/android/audio/player/Player;)V

    .line 759
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1000(Lcom/vkontakte/android/audio/player/Player;)V

    .line 760
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1100(Lcom/vkontakte/android/audio/player/Player;)V

    .line 761
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .locals 7
    .param p1, "helper"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "progress"    # I

    .prologue
    .line 807
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v0

    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v1

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->setPosition(II)V

    .line 809
    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v0

    if-nez v0, :cond_0

    .line 810
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 811
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$800(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/AudioStatSender;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration()I

    move-result v2

    int-to-long v2, v2

    int-to-long v4, p2

    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getRefer()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/audio/player/AudioStatSender;->onProgress(Lcom/vkontakte/android/audio/MusicTrack;JJLcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 815
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$1000(Lcom/vkontakte/android/audio/player/Player;)V

    .line 816
    return-void
.end method
