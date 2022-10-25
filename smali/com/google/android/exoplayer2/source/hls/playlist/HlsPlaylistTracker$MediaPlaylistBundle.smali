.class final Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;
.super Ljava/lang/Object;
.source "HlsPlaylistTracker.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/Loader$Callback;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MediaPlaylistBundle"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer2/upstream/Loader$Callback",
        "<",
        "Lcom/google/android/exoplayer2/upstream/ParsingLoadable",
        "<",
        "Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylist;",
        ">;>;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private blacklistUntilMs:J

.field private lastSnapshotAccessTimeMs:J

.field private lastSnapshotLoadMs:J

.field private final mediaPlaylistLoadable:Lcom/google/android/exoplayer2/upstream/ParsingLoadable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/upstream/ParsingLoadable",
            "<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylist;",
            ">;"
        }
    .end annotation
.end field

.field private final mediaPlaylistLoader:Lcom/google/android/exoplayer2/upstream/Loader;

.field private playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

.field private final playlistUrl:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

.field final synthetic this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;J)V
    .locals 5
    .param p2, "playlistUrl"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;
    .param p3, "initialLastSnapshotAccessTimeMs"    # J

    .prologue
    .line 435
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 436
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    .line 437
    iput-wide p3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->lastSnapshotAccessTimeMs:J

    .line 438
    new-instance v0, Lcom/google/android/exoplayer2/upstream/Loader;

    const-string/jumbo v1, "HlsPlaylistTracker:MediaPlaylist"

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 439
    new-instance v0, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;

    invoke-static {p1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$500(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;)Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/exoplayer2/upstream/DataSource$Factory;->createDataSource()Lcom/google/android/exoplayer2/upstream/DataSource;

    move-result-object v1

    .line 440
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$600(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;)Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist;->baseUri:Ljava/lang/String;

    iget-object v3, p2, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->url:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/exoplayer2/util/UriUtil;->resolveToUri(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x4

    .line 441
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$700(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;)Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistParser;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Landroid/net/Uri;ILcom/google/android/exoplayer2/upstream/ParsingLoadable$Parser;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoadable:Lcom/google/android/exoplayer2/upstream/ParsingLoadable;

    .line 442
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;)Lcom/google/android/exoplayer2/upstream/Loader;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;

    .prologue
    .line 423
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Lcom/google/android/exoplayer2/upstream/Loader;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;
    .param p1, "x1"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    .prologue
    .line 423
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->processLoadedPlaylist(Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;

    .prologue
    .line 423
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->blacklistUntilMs:J

    return-wide v0
.end method

.method static synthetic access$300(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;)Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;

    .prologue
    .line 423
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;

    .prologue
    .line 423
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->lastSnapshotAccessTimeMs:J

    return-wide v0
.end method

.method private processLoadedPlaylist(Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;)V
    .locals 8
    .param p1, "loadedPlaylist"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    .prologue
    .line 519
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    .line 520
    .local v0, "oldPlaylist":Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->lastSnapshotLoadMs:J

    .line 521
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    invoke-static {v1, v0, p1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$1300(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;)Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    .line 522
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 523
    .local v2, "refreshDelayUs":J
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    if-eq v1, v0, :cond_2

    .line 524
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    iget-object v5, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    invoke-static {v1, v4, v5}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$1400(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 525
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    iget-wide v2, v1, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->targetDurationUs:J

    .line 530
    :cond_0
    :goto_0
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v1, v2, v4

    if-eqz v1, :cond_1

    .line 532
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    invoke-static {v1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$1500(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;)Landroid/os/Handler;

    move-result-object v1

    invoke-static {v2, v3}, Lcom/google/android/exoplayer2/C;->usToMs(J)J

    move-result-wide v4

    invoke-virtual {v1, p0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 534
    :cond_1
    return-void

    .line 527
    :cond_2
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    iget-boolean v1, v1, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->hasEndTag:Z

    if-nez v1, :cond_0

    .line 528
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    iget-wide v4, v1, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->targetDurationUs:J

    const-wide/16 v6, 0x2

    div-long v2, v4, v6

    goto :goto_0
.end method


# virtual methods
.method public getPlaylistSnapshot()Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;
    .locals 2

    .prologue
    .line 445
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->lastSnapshotAccessTimeMs:J

    .line 446
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    return-object v0
.end method

.method public isSnapshotValid()Z
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 450
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    if-nez v6, :cond_1

    .line 455
    :cond_0
    :goto_0
    return v4

    .line 453
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 454
    .local v0, "currentTimeMs":J
    const-wide/16 v6, 0x7530

    iget-object v8, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    iget-wide v8, v8, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->durationUs:J

    invoke-static {v8, v9}, Lcom/google/android/exoplayer2/C;->usToMs(J)J

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 455
    .local v2, "snapshotValidityDurationMs":J
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    iget-boolean v6, v6, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->hasEndTag:Z

    if-nez v6, :cond_2

    iget-object v6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    iget v6, v6, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->playlistType:I

    const/4 v7, 0x2

    if-eq v6, v7, :cond_2

    iget-object v6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    iget v6, v6, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->playlistType:I

    if-eq v6, v5, :cond_2

    iget-wide v6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->lastSnapshotLoadMs:J

    add-long/2addr v6, v2

    cmp-long v6, v6, v0

    if-lez v6, :cond_0

    :cond_2
    move v4, v5

    goto :goto_0
.end method

.method public loadPlaylist()V
    .locals 3

    .prologue
    .line 466
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->blacklistUntilMs:J

    .line 467
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Lcom/google/android/exoplayer2/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->isLoading()Z

    move-result v0

    if-nez v0, :cond_0

    .line 468
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Lcom/google/android/exoplayer2/upstream/Loader;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoadable:Lcom/google/android/exoplayer2/upstream/ParsingLoadable;

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    invoke-static {v2}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$800(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;)I

    move-result v2

    invoke-virtual {v0, v1, p0, v2}, Lcom/google/android/exoplayer2/upstream/Loader;->startLoading(Lcom/google/android/exoplayer2/upstream/Loader$Loadable;Lcom/google/android/exoplayer2/upstream/Loader$Callback;I)J

    .line 470
    :cond_0
    return-void
.end method

.method public bridge synthetic onLoadCanceled(Lcom/google/android/exoplayer2/upstream/Loader$Loadable;JJZ)V
    .locals 8

    .prologue
    .line 423
    move-object v1, p1

    check-cast v1, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;

    move-object v0, p0

    move-wide v2, p2

    move-wide v4, p4

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->onLoadCanceled(Lcom/google/android/exoplayer2/upstream/ParsingLoadable;JJZ)V

    return-void
.end method

.method public onLoadCanceled(Lcom/google/android/exoplayer2/upstream/ParsingLoadable;JJZ)V
    .locals 10
    .param p2, "elapsedRealtimeMs"    # J
    .param p4, "loadDurationMs"    # J
    .param p6, "released"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/ParsingLoadable",
            "<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylist;",
            ">;JJZ)V"
        }
    .end annotation

    .prologue
    .line 485
    .local p1, "loadable":Lcom/google/android/exoplayer2/upstream/ParsingLoadable;, "Lcom/google/android/exoplayer2/upstream/ParsingLoadable<Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylist;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    invoke-static {v0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$900(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;)Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;

    move-result-object v1

    iget-object v2, p1, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    const/4 v3, 0x4

    .line 486
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;->bytesLoaded()J

    move-result-wide v8

    move-wide v4, p2

    move-wide v6, p4

    .line 485
    invoke-virtual/range {v1 .. v9}, Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;->loadCanceled(Lcom/google/android/exoplayer2/upstream/DataSpec;IJJJ)V

    .line 487
    return-void
.end method

.method public bridge synthetic onLoadCompleted(Lcom/google/android/exoplayer2/upstream/Loader$Loadable;JJ)V
    .locals 6

    .prologue
    .line 423
    move-object v1, p1

    check-cast v1, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;

    move-object v0, p0

    move-wide v2, p2

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->onLoadCompleted(Lcom/google/android/exoplayer2/upstream/ParsingLoadable;JJ)V

    return-void
.end method

.method public onLoadCompleted(Lcom/google/android/exoplayer2/upstream/ParsingLoadable;JJ)V
    .locals 10
    .param p2, "elapsedRealtimeMs"    # J
    .param p4, "loadDurationMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/ParsingLoadable",
            "<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylist;",
            ">;JJ)V"
        }
    .end annotation

    .prologue
    .line 477
    .local p1, "loadable":Lcom/google/android/exoplayer2/upstream/ParsingLoadable;, "Lcom/google/android/exoplayer2/upstream/ParsingLoadable<Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylist;>;"
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->processLoadedPlaylist(Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;)V

    .line 478
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    invoke-static {v0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$900(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;)Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;

    move-result-object v1

    iget-object v2, p1, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    const/4 v3, 0x4

    .line 479
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;->bytesLoaded()J

    move-result-wide v8

    move-wide v4, p2

    move-wide v6, p4

    .line 478
    invoke-virtual/range {v1 .. v9}, Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;->loadCompleted(Lcom/google/android/exoplayer2/upstream/DataSpec;IJJJ)V

    .line 480
    return-void
.end method

.method public bridge synthetic onLoadError(Lcom/google/android/exoplayer2/upstream/Loader$Loadable;JJLjava/io/IOException;)I
    .locals 8

    .prologue
    .line 423
    move-object v1, p1

    check-cast v1, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;

    move-object v0, p0

    move-wide v2, p2

    move-wide v4, p4

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->onLoadError(Lcom/google/android/exoplayer2/upstream/ParsingLoadable;JJLjava/io/IOException;)I

    move-result v0

    return v0
.end method

.method public onLoadError(Lcom/google/android/exoplayer2/upstream/ParsingLoadable;JJLjava/io/IOException;)I
    .locals 14
    .param p2, "elapsedRealtimeMs"    # J
    .param p4, "loadDurationMs"    # J
    .param p6, "error"    # Ljava/io/IOException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/ParsingLoadable",
            "<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylist;",
            ">;JJ",
            "Ljava/io/IOException;",
            ")I"
        }
    .end annotation

    .prologue
    .line 492
    .local p1, "loadable":Lcom/google/android/exoplayer2/upstream/ParsingLoadable;, "Lcom/google/android/exoplayer2/upstream/ParsingLoadable<Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylist;>;"
    move-object/from16 v0, p6

    instance-of v13, v0, Lcom/google/android/exoplayer2/ParserException;

    .line 493
    .local v13, "isFatal":Z
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    invoke-static {v3}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$900(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;)Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;

    move-result-object v3

    iget-object v4, p1, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    const/4 v5, 0x4

    .line 494
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/ParsingLoadable;->bytesLoaded()J

    move-result-wide v10

    move-wide/from16 v6, p2

    move-wide/from16 v8, p4

    move-object/from16 v12, p6

    .line 493
    invoke-virtual/range {v3 .. v13}, Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;->loadError(Lcom/google/android/exoplayer2/upstream/DataSpec;IJJJLjava/io/IOException;Z)V

    .line 495
    if-eqz v13, :cond_0

    .line 496
    const/4 v3, 0x3

    .line 506
    :goto_0
    return v3

    .line 498
    :cond_0
    const/4 v2, 0x1

    .line 499
    .local v2, "shouldRetry":Z
    invoke-static/range {p6 .. p6}, Lcom/google/android/exoplayer2/source/chunk/ChunkedTrackBlacklistUtil;->shouldBlacklist(Ljava/lang/Exception;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 501
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    const-wide/32 v6, 0xea60

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->blacklistUntilMs:J

    .line 502
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    const-wide/32 v6, 0xea60

    invoke-static {v3, v4, v6, v7}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$1000(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;J)V

    .line 504
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    invoke-static {v3}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$1100(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;)Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->this$0:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    invoke-static {v3}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->access$1200(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v2, 0x1

    .line 506
    :cond_1
    :goto_1
    if-eqz v2, :cond_3

    const/4 v3, 0x0

    goto :goto_0

    .line 504
    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .line 506
    :cond_3
    const/4 v3, 0x2

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 462
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Lcom/google/android/exoplayer2/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->release()V

    .line 463
    return-void
.end method

.method public run()V
    .locals 0

    .prologue
    .line 513
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$MediaPlaylistBundle;->loadPlaylist()V

    .line 514
    return-void
.end method
