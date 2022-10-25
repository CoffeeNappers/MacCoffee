.class Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;
.super Ljava/lang/Object;
.source "PlayerService.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;
.implements Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/PlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadedListener"
.end annotation


# instance fields
.field private mPlayerLoaded:Z

.field private mSavedTracksLoaded:Z

.field final synthetic this$0:Lcom/vkontakte/android/audio/player/PlayerService;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;)V
    .locals 0

    .prologue
    .line 616
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/PlayerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/PlayerService$1;

    .prologue
    .line 616
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;)V

    return-void
.end method

.method private checkAllLoaded()V
    .locals 4

    .prologue
    .line 634
    iget-boolean v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->mSavedTracksLoaded:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->mPlayerLoaded:Z

    if-eqz v1, :cond_2

    .line 635
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "PlayerService"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "PlayerService"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "Service loaded"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 637
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1600(Lcom/vkontakte/android/audio/player/PlayerService;)Ljava/util/LinkedList;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 638
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1600(Lcom/vkontakte/android/audio/player/PlayerService;)Ljava/util/LinkedList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 639
    .local v0, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v2, v0}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1700(Lcom/vkontakte/android/audio/player/PlayerService;Landroid/content/Intent;)V

    goto :goto_0

    .line 640
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1602(Lcom/vkontakte/android/audio/player/PlayerService;Ljava/util/LinkedList;)Ljava/util/LinkedList;

    .line 643
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->loadFinished()V

    .line 645
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1400(Lcom/vkontakte/android/audio/player/PlayerService;)V

    .line 647
    :cond_2
    return-void
.end method


# virtual methods
.method public onPlayerLoaded()V
    .locals 1

    .prologue
    .line 629
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->mPlayerLoaded:Z

    .line 630
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->checkAllLoaded()V

    .line 631
    return-void
.end method

.method public onSavedTracksLoaded()V
    .locals 2

    .prologue
    .line 622
    sget-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1500(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/AudioStateListener;->onLoadSavedTracks(Lcom/vkontakte/android/audio/player/SavedTracks;)V

    .line 623
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->mSavedTracksLoaded:Z

    .line 624
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;->checkAllLoaded()V

    .line 625
    return-void
.end method
