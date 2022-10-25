.class Lcom/vkontakte/android/audio/player/PlayerService$MySavedTracksListener;
.super Ljava/lang/Object;
.source "PlayerService.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/PlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MySavedTracksListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/PlayerService;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;)V
    .locals 0

    .prologue
    .line 570
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService$MySavedTracksListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/PlayerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/PlayerService$1;

    .prologue
    .line 570
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/PlayerService$MySavedTracksListener;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;)V

    return-void
.end method


# virtual methods
.method public onDownloadFinished(Z)V
    .locals 1
    .param p1, "completed"    # Z

    .prologue
    .line 589
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/AudioStateListener;->onDownloadFinished(Z)V

    .line 590
    if-eqz p1, :cond_0

    .line 591
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$MySavedTracksListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1400(Lcom/vkontakte/android/audio/player/PlayerService;)V

    .line 592
    :cond_0
    return-void
.end method

.method public onDownloadStarted()V
    .locals 1

    .prologue
    .line 584
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/AudioStateListener;->onDownloadStarted()V

    .line 585
    return-void
.end method

.method public onSavedTracksChanged()V
    .locals 1

    .prologue
    .line 573
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/AudioStateListener;->onSavedTracksChanged()V

    .line 574
    return-void
.end method

.method public onSavedTracksSaved()V
    .locals 1

    .prologue
    .line 578
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/AudioStateListener;->onSavedTracksSaved()V

    .line 579
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$MySavedTracksListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1400(Lcom/vkontakte/android/audio/player/PlayerService;)V

    .line 580
    return-void
.end method
