.class final Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;
.super Ljava/lang/Object;
.source "ExtractorMediaPeriod.java"

# interfaces
.implements Lcom/google/android/exoplayer2/source/MediaPeriod;
.implements Lcom/google/android/exoplayer2/extractor/ExtractorOutput;
.implements Lcom/google/android/exoplayer2/upstream/Loader$Callback;
.implements Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput$UpstreamFormatChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;,
        Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;,
        Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$SampleStreamImpl;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer2/source/MediaPeriod;",
        "Lcom/google/android/exoplayer2/extractor/ExtractorOutput;",
        "Lcom/google/android/exoplayer2/upstream/Loader$Callback",
        "<",
        "Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;",
        ">;",
        "Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput$UpstreamFormatChangedListener;"
    }
.end annotation


# static fields
.field private static final DEFAULT_LAST_SAMPLE_DURATION_US:J = 0x2710L


# instance fields
.field private final allocator:Lcom/google/android/exoplayer2/upstream/Allocator;

.field private callback:Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;

.field private final customCacheKey:Ljava/lang/String;

.field private final dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private durationUs:J

.field private enabledTrackCount:I

.field private final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;

.field private extractedSamplesCountAtStartOfLoad:I

.field private final extractorHolder:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;

.field private final handler:Landroid/os/Handler;

.field private haveAudioVideoTracks:Z

.field private lastSeekPositionUs:J

.field private length:J

.field private final loadCondition:Lcom/google/android/exoplayer2/util/ConditionVariable;

.field private final loader:Lcom/google/android/exoplayer2/upstream/Loader;

.field private loadingFinished:Z

.field private final maybeFinishPrepareRunnable:Ljava/lang/Runnable;

.field private final minLoadableRetryCount:I

.field private notifyReset:Z

.field private final onContinueLoadingRequestedRunnable:Ljava/lang/Runnable;

.field private pendingResetPositionUs:J

.field private prepared:Z

.field private released:Z

.field private final sampleQueues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;",
            ">;"
        }
    .end annotation
.end field

.field private seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

.field private seenFirstTrackSelection:Z

.field private final sourceListener:Lcom/google/android/exoplayer2/source/MediaSource$Listener;

.field private trackEnabledStates:[Z

.field private trackIsAudioVideoFlags:[Z

.field private tracks:Lcom/google/android/exoplayer2/source/TrackGroupArray;

.field private tracksBuilt:Z

.field private final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/DataSource;[Lcom/google/android/exoplayer2/extractor/Extractor;ILandroid/os/Handler;Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;Lcom/google/android/exoplayer2/source/MediaSource$Listener;Lcom/google/android/exoplayer2/upstream/Allocator;Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p3, "extractors"    # [Lcom/google/android/exoplayer2/extractor/Extractor;
    .param p4, "minLoadableRetryCount"    # I
    .param p5, "eventHandler"    # Landroid/os/Handler;
    .param p6, "eventListener"    # Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;
    .param p7, "sourceListener"    # Lcom/google/android/exoplayer2/source/MediaSource$Listener;
    .param p8, "allocator"    # Lcom/google/android/exoplayer2/upstream/Allocator;
    .param p9, "customCacheKey"    # Ljava/lang/String;

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->uri:Landroid/net/Uri;

    .line 114
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 115
    iput p4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->minLoadableRetryCount:I

    .line 116
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->eventHandler:Landroid/os/Handler;

    .line 117
    iput-object p6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->eventListener:Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;

    .line 118
    iput-object p7, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sourceListener:Lcom/google/android/exoplayer2/source/MediaSource$Listener;

    .line 119
    iput-object p8, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->allocator:Lcom/google/android/exoplayer2/upstream/Allocator;

    .line 120
    iput-object p9, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->customCacheKey:Ljava/lang/String;

    .line 121
    new-instance v0, Lcom/google/android/exoplayer2/upstream/Loader;

    const-string/jumbo v1, "Loader:ExtractorMediaPeriod"

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loader:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 122
    new-instance v0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;

    invoke-direct {v0, p3, p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;-><init>([Lcom/google/android/exoplayer2/extractor/Extractor;Lcom/google/android/exoplayer2/extractor/ExtractorOutput;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->extractorHolder:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;

    .line 123
    new-instance v0, Lcom/google/android/exoplayer2/util/ConditionVariable;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/util/ConditionVariable;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadCondition:Lcom/google/android/exoplayer2/util/ConditionVariable;

    .line 124
    new-instance v0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$1;

    invoke-direct {v0, p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$1;-><init>(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->maybeFinishPrepareRunnable:Ljava/lang/Runnable;

    .line 130
    new-instance v0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$2;

    invoke-direct {v0, p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$2;-><init>(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->onContinueLoadingRequestedRunnable:Ljava/lang/Runnable;

    .line 138
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->handler:Landroid/os/Handler;

    .line 140
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->pendingResetPositionUs:J

    .line 141
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    .line 142
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->length:J

    .line 143
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->maybeFinishPrepare()V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->released:Z

    return v0
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->callback:Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$600(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->eventListener:Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->customCacheKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->onContinueLoadingRequestedRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$900(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method private configureRetry(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;)V
    .locals 8
    .param p1, "loadable"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;

    .prologue
    const-wide/16 v6, 0x0

    .line 478
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->length:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    .line 479
    invoke-interface {v2}, Lcom/google/android/exoplayer2/extractor/SeekMap;->getDurationUs()J

    move-result-wide v2

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    .line 496
    :cond_0
    :goto_0
    return-void

    .line 488
    :cond_1
    iput-wide v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->lastSeekPositionUs:J

    .line 489
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->prepared:Z

    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->notifyReset:Z

    .line 490
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v1

    .line 491
    .local v1, "trackCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_4

    .line 492
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    iget-boolean v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->prepared:Z

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackEnabledStates:[Z

    aget-boolean v3, v3, v0

    if-eqz v3, :cond_3

    :cond_2
    const/4 v3, 0x1

    :goto_2
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->reset(Z)V

    .line 491
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 492
    :cond_3
    const/4 v3, 0x0

    goto :goto_2

    .line 494
    :cond_4
    invoke-virtual {p1, v6, v7, v6, v7}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->setLoadPosition(JJ)V

    goto :goto_0
.end method

.method private copyLengthFromLoader(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;)V
    .locals 4
    .param p1, "loadable"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;

    .prologue
    .line 446
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->length:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 447
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->access$500(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->length:J

    .line 449
    :cond_0
    return-void
.end method

.method private getExtractedSamplesCount()I
    .locals 4

    .prologue
    .line 499
    const/4 v0, 0x0

    .line 500
    .local v0, "extractedSamplesCount":I
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v2

    .line 501
    .local v2, "trackCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 502
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->getWriteIndex()I

    move-result v3

    add-int/2addr v0, v3

    .line 501
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 504
    :cond_0
    return v0
.end method

.method private getLargestQueuedTimestampUs()J
    .locals 6

    .prologue
    .line 508
    const-wide/high16 v2, -0x8000000000000000L

    .line 509
    .local v2, "largestQueuedTimestampUs":J
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v1

    .line 510
    .local v1, "trackCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 511
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    .line 512
    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    invoke-virtual {v4}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->getLargestQueuedTimestampUs()J

    move-result-wide v4

    .line 511
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 510
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 514
    :cond_0
    return-wide v2
.end method

.method private isLoadableExceptionFatal(Ljava/io/IOException;)Z
    .locals 1
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 522
    instance-of v0, p1, Lcom/google/android/exoplayer2/source/UnrecognizedInputFormatException;

    return v0
.end method

.method private isPendingReset()Z
    .locals 4

    .prologue
    .line 518
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->pendingResetPositionUs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private maybeFinishPrepare()V
    .locals 12

    .prologue
    const/4 v7, 0x0

    const/4 v8, 0x1

    .line 416
    iget-boolean v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->released:Z

    if-nez v6, :cond_0

    iget-boolean v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->prepared:Z

    if-nez v6, :cond_0

    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    if-eqz v6, :cond_0

    iget-boolean v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->tracksBuilt:Z

    if-nez v6, :cond_1

    .line 443
    :cond_0
    :goto_0
    return-void

    .line 419
    :cond_1
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->size()I

    move-result v4

    .line 420
    .local v4, "trackCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v4, :cond_2

    .line 421
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v6, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->getUpstreamFormat()Lcom/google/android/exoplayer2/Format;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 420
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 425
    :cond_2
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadCondition:Lcom/google/android/exoplayer2/util/ConditionVariable;

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/util/ConditionVariable;->close()Z

    .line 426
    new-array v3, v4, [Lcom/google/android/exoplayer2/source/TrackGroup;

    .line 427
    .local v3, "trackArray":[Lcom/google/android/exoplayer2/source/TrackGroup;
    new-array v6, v4, [Z

    iput-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackIsAudioVideoFlags:[Z

    .line 428
    new-array v6, v4, [Z

    iput-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackEnabledStates:[Z

    .line 429
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    invoke-interface {v6}, Lcom/google/android/exoplayer2/extractor/SeekMap;->getDurationUs()J

    move-result-wide v10

    iput-wide v10, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->durationUs:J

    .line 430
    const/4 v0, 0x0

    :goto_2
    if-ge v0, v4, :cond_5

    .line 431
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v6, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->getUpstreamFormat()Lcom/google/android/exoplayer2/Format;

    move-result-object v5

    .line 432
    .local v5, "trackFormat":Lcom/google/android/exoplayer2/Format;
    new-instance v6, Lcom/google/android/exoplayer2/source/TrackGroup;

    new-array v9, v8, [Lcom/google/android/exoplayer2/Format;

    aput-object v5, v9, v7

    invoke-direct {v6, v9}, Lcom/google/android/exoplayer2/source/TrackGroup;-><init>([Lcom/google/android/exoplayer2/Format;)V

    aput-object v6, v3, v0

    .line 433
    iget-object v2, v5, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    .line 434
    .local v2, "mimeType":Ljava/lang/String;
    invoke-static {v2}, Lcom/google/android/exoplayer2/util/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3

    invoke-static {v2}, Lcom/google/android/exoplayer2/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    :cond_3
    move v1, v8

    .line 435
    .local v1, "isAudioVideo":Z
    :goto_3
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackIsAudioVideoFlags:[Z

    aput-boolean v1, v6, v0

    .line 436
    iget-boolean v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->haveAudioVideoTracks:Z

    or-int/2addr v6, v1

    iput-boolean v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->haveAudioVideoTracks:Z

    .line 430
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .end local v1    # "isAudioVideo":Z
    :cond_4
    move v1, v7

    .line 434
    goto :goto_3

    .line 438
    .end local v2    # "mimeType":Ljava/lang/String;
    .end local v5    # "trackFormat":Lcom/google/android/exoplayer2/Format;
    :cond_5
    new-instance v6, Lcom/google/android/exoplayer2/source/TrackGroupArray;

    invoke-direct {v6, v3}, Lcom/google/android/exoplayer2/source/TrackGroupArray;-><init>([Lcom/google/android/exoplayer2/source/TrackGroup;)V

    iput-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->tracks:Lcom/google/android/exoplayer2/source/TrackGroupArray;

    .line 439
    iput-boolean v8, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->prepared:Z

    .line 440
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sourceListener:Lcom/google/android/exoplayer2/source/MediaSource$Listener;

    new-instance v7, Lcom/google/android/exoplayer2/source/SinglePeriodTimeline;

    iget-wide v8, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->durationUs:J

    iget-object v10, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    .line 441
    invoke-interface {v10}, Lcom/google/android/exoplayer2/extractor/SeekMap;->isSeekable()Z

    move-result v10

    invoke-direct {v7, v8, v9, v10}, Lcom/google/android/exoplayer2/source/SinglePeriodTimeline;-><init>(JZ)V

    const/4 v8, 0x0

    .line 440
    invoke-interface {v6, v7, v8}, Lcom/google/android/exoplayer2/source/MediaSource$Listener;->onSourceInfoRefreshed(Lcom/google/android/exoplayer2/Timeline;Ljava/lang/Object;)V

    .line 442
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->callback:Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;

    invoke-interface {v6, p0}, Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;->onPrepared(Lcom/google/android/exoplayer2/source/MediaPeriod;)V

    goto/16 :goto_0
.end method

.method private notifyLoadError(Ljava/io/IOException;)V
    .locals 2
    .param p1, "error"    # Ljava/io/IOException;

    .prologue
    .line 526
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->eventListener:Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;

    if-eqz v0, :cond_0

    .line 527
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$4;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$4;-><init>(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;Ljava/io/IOException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 534
    :cond_0
    return-void
.end method

.method private startLoading()V
    .locals 10

    .prologue
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 452
    new-instance v0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->uri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->extractorHolder:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;

    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadCondition:Lcom/google/android/exoplayer2/util/ConditionVariable;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;-><init>(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;Lcom/google/android/exoplayer2/util/ConditionVariable;)V

    .line 454
    .local v0, "loadable":Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->prepared:Z

    if-eqz v1, :cond_1

    .line 455
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->isPendingReset()Z

    move-result v1

    invoke-static {v1}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 456
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->durationUs:J

    cmp-long v1, v2, v8

    if-eqz v1, :cond_0

    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->pendingResetPositionUs:J

    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->durationUs:J

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    .line 457
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadingFinished:Z

    .line 458
    iput-wide v8, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->pendingResetPositionUs:J

    .line 475
    :goto_0
    return-void

    .line 461
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->pendingResetPositionUs:J

    invoke-interface {v1, v2, v3}, Lcom/google/android/exoplayer2/extractor/SeekMap;->getPosition(J)J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->pendingResetPositionUs:J

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->setLoadPosition(JJ)V

    .line 462
    iput-wide v8, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->pendingResetPositionUs:J

    .line 464
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->getExtractedSamplesCount()I

    move-result v1

    iput v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->extractedSamplesCountAtStartOfLoad:I

    .line 466
    iget v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->minLoadableRetryCount:I

    .line 467
    .local v6, "minRetryCount":I
    const/4 v1, -0x1

    if-ne v6, v1, :cond_3

    .line 469
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->prepared:Z

    if-eqz v1, :cond_2

    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->length:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    .line 470
    invoke-interface {v1}, Lcom/google/android/exoplayer2/extractor/SeekMap;->getDurationUs()J

    move-result-wide v2

    cmp-long v1, v2, v8

    if-eqz v1, :cond_4

    :cond_2
    const/4 v6, 0x3

    .line 474
    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loader:Lcom/google/android/exoplayer2/upstream/Loader;

    invoke-virtual {v1, v0, p0, v6}, Lcom/google/android/exoplayer2/upstream/Loader;->startLoading(Lcom/google/android/exoplayer2/upstream/Loader$Loadable;Lcom/google/android/exoplayer2/upstream/Loader$Callback;I)J

    goto :goto_0

    .line 470
    :cond_4
    const/4 v6, 0x6

    goto :goto_1
.end method


# virtual methods
.method public continueLoading(J)Z
    .locals 2
    .param p1, "playbackPositionUs"    # J

    .prologue
    .line 239
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadingFinished:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->prepared:Z

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->enabledTrackCount:I

    if-nez v1, :cond_2

    .line 240
    :cond_0
    const/4 v0, 0x0

    .line 247
    :cond_1
    :goto_0
    return v0

    .line 242
    :cond_2
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadCondition:Lcom/google/android/exoplayer2/util/ConditionVariable;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/util/ConditionVariable;->open()Z

    move-result v0

    .line 243
    .local v0, "continuedLoading":Z
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loader:Lcom/google/android/exoplayer2/upstream/Loader;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/upstream/Loader;->isLoading()Z

    move-result v1

    if-nez v1, :cond_1

    .line 244
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->startLoading()V

    .line 245
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public endTracks()V
    .locals 2

    .prologue
    .line 396
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->tracksBuilt:Z

    .line 397
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->maybeFinishPrepareRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 398
    return-void
.end method

.method public getBufferedPositionUs()J
    .locals 8

    .prologue
    const-wide/high16 v6, -0x8000000000000000L

    .line 266
    iget-boolean v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadingFinished:Z

    if-eqz v4, :cond_1

    move-wide v2, v6

    .line 285
    :cond_0
    :goto_0
    return-wide v2

    .line 268
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->isPendingReset()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 269
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->pendingResetPositionUs:J

    goto :goto_0

    .line 272
    :cond_2
    iget-boolean v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->haveAudioVideoTracks:Z

    if-eqz v4, :cond_4

    .line 274
    const-wide v2, 0x7fffffffffffffffL

    .line 275
    .local v2, "largestQueuedTimestampUs":J
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v1

    .line 276
    .local v1, "trackCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_5

    .line 277
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackIsAudioVideoFlags:[Z

    aget-boolean v4, v4, v0

    if-eqz v4, :cond_3

    .line 278
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    .line 279
    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    invoke-virtual {v4}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->getLargestQueuedTimestampUs()J

    move-result-wide v4

    .line 278
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    .line 276
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 283
    .end local v0    # "i":I
    .end local v1    # "trackCount":I
    .end local v2    # "largestQueuedTimestampUs":J
    :cond_4
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->getLargestQueuedTimestampUs()J

    move-result-wide v2

    .line 285
    .restart local v2    # "largestQueuedTimestampUs":J
    :cond_5
    cmp-long v4, v2, v6

    if-nez v4, :cond_0

    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->lastSeekPositionUs:J

    goto :goto_0
.end method

.method public getNextLoadPositionUs()J
    .locals 2

    .prologue
    .line 252
    iget v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->enabledTrackCount:I

    if-nez v0, :cond_0

    const-wide/high16 v0, -0x8000000000000000L

    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->getBufferedPositionUs()J

    move-result-wide v0

    goto :goto_0
.end method

.method public getTrackGroups()Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->tracks:Lcom/google/android/exoplayer2/source/TrackGroupArray;

    return-object v0
.end method

.method isReady(I)Z
    .locals 1
    .param p1, "track"    # I

    .prologue
    .line 321
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadingFinished:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->isPendingReset()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method maybeThrowError()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 325
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loader:Lcom/google/android/exoplayer2/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->maybeThrowError()V

    .line 326
    return-void
.end method

.method public maybeThrowPrepareError()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->maybeThrowError()V

    .line 171
    return-void
.end method

.method public onLoadCanceled(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;JJZ)V
    .locals 4
    .param p1, "loadable"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;
    .param p2, "elapsedRealtimeMs"    # J
    .param p4, "loadDurationMs"    # J
    .param p6, "released"    # Z

    .prologue
    .line 356
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->copyLengthFromLoader(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;)V

    .line 357
    if-nez p6, :cond_1

    iget v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->enabledTrackCount:I

    if-lez v2, :cond_1

    .line 358
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v1

    .line 359
    .local v1, "trackCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 360
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackEnabledStates:[Z

    aget-boolean v3, v3, v0

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->reset(Z)V

    .line 359
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 362
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->callback:Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;

    invoke-interface {v2, p0}, Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;->onContinueLoadingRequested(Lcom/google/android/exoplayer2/source/SequenceableLoader;)V

    .line 364
    .end local v0    # "i":I
    .end local v1    # "trackCount":I
    :cond_1
    return-void
.end method

.method public bridge synthetic onLoadCanceled(Lcom/google/android/exoplayer2/upstream/Loader$Loadable;JJZ)V
    .locals 8

    .prologue
    .line 50
    move-object v1, p1

    check-cast v1, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;

    move-object v0, p0

    move-wide v2, p2

    move-wide v4, p4

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->onLoadCanceled(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;JJZ)V

    return-void
.end method

.method public onLoadCompleted(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;JJ)V
    .locals 7
    .param p1, "loadable"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;
    .param p2, "elapsedRealtimeMs"    # J
    .param p4, "loadDurationMs"    # J

    .prologue
    .line 342
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->copyLengthFromLoader(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;)V

    .line 343
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadingFinished:Z

    .line 344
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->durationUs:J

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 345
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->getLargestQueuedTimestampUs()J

    move-result-wide v0

    .line 346
    .local v0, "largestQueuedTimestampUs":J
    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    const-wide/16 v2, 0x0

    :goto_0
    iput-wide v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->durationUs:J

    .line 348
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sourceListener:Lcom/google/android/exoplayer2/source/MediaSource$Listener;

    new-instance v3, Lcom/google/android/exoplayer2/source/SinglePeriodTimeline;

    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->durationUs:J

    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    .line 349
    invoke-interface {v6}, Lcom/google/android/exoplayer2/extractor/SeekMap;->isSeekable()Z

    move-result v6

    invoke-direct {v3, v4, v5, v6}, Lcom/google/android/exoplayer2/source/SinglePeriodTimeline;-><init>(JZ)V

    const/4 v4, 0x0

    .line 348
    invoke-interface {v2, v3, v4}, Lcom/google/android/exoplayer2/source/MediaSource$Listener;->onSourceInfoRefreshed(Lcom/google/android/exoplayer2/Timeline;Ljava/lang/Object;)V

    .line 351
    .end local v0    # "largestQueuedTimestampUs":J
    :cond_0
    return-void

    .line 346
    .restart local v0    # "largestQueuedTimestampUs":J
    :cond_1
    const-wide/16 v2, 0x2710

    add-long/2addr v2, v0

    goto :goto_0
.end method

.method public bridge synthetic onLoadCompleted(Lcom/google/android/exoplayer2/upstream/Loader$Loadable;JJ)V
    .locals 6

    .prologue
    .line 50
    move-object v1, p1

    check-cast v1, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;

    move-object v0, p0

    move-wide v2, p2

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->onLoadCompleted(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;JJ)V

    return-void
.end method

.method public onLoadError(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;JJLjava/io/IOException;)I
    .locals 5
    .param p1, "loadable"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;
    .param p2, "elapsedRealtimeMs"    # J
    .param p4, "loadDurationMs"    # J
    .param p6, "error"    # Ljava/io/IOException;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 369
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->copyLengthFromLoader(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;)V

    .line 370
    invoke-direct {p0, p6}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->notifyLoadError(Ljava/io/IOException;)V

    .line 371
    invoke-direct {p0, p6}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->isLoadableExceptionFatal(Ljava/io/IOException;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 372
    const/4 v2, 0x3

    .line 378
    :cond_0
    :goto_0
    return v2

    .line 374
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->getExtractedSamplesCount()I

    move-result v0

    .line 375
    .local v0, "extractedSamplesCount":I
    iget v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->extractedSamplesCountAtStartOfLoad:I

    if-le v0, v4, :cond_2

    move v1, v2

    .line 376
    .local v1, "madeProgress":Z
    :goto_1
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->configureRetry(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;)V

    .line 377
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->getExtractedSamplesCount()I

    move-result v4

    iput v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->extractedSamplesCountAtStartOfLoad:I

    .line 378
    if-nez v1, :cond_0

    move v2, v3

    goto :goto_0

    .end local v1    # "madeProgress":Z
    :cond_2
    move v1, v3

    .line 375
    goto :goto_1
.end method

.method public bridge synthetic onLoadError(Lcom/google/android/exoplayer2/upstream/Loader$Loadable;JJLjava/io/IOException;)I
    .locals 8

    .prologue
    .line 50
    move-object v1, p1

    check-cast v1, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;

    move-object v0, p0

    move-wide v2, p2

    move-wide v4, p4

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->onLoadError(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;JJLjava/io/IOException;)I

    move-result v0

    return v0
.end method

.method public onUpstreamFormatChanged(Lcom/google/android/exoplayer2/Format;)V
    .locals 2
    .param p1, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 410
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->maybeFinishPrepareRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 411
    return-void
.end method

.method public prepare(Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;

    .prologue
    .line 163
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->callback:Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;

    .line 164
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadCondition:Lcom/google/android/exoplayer2/util/ConditionVariable;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/util/ConditionVariable;->open()Z

    .line 165
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->startLoading()V

    .line 166
    return-void
.end method

.method readData(ILcom/google/android/exoplayer2/FormatHolder;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;)I
    .locals 6
    .param p1, "track"    # I
    .param p2, "formatHolder"    # Lcom/google/android/exoplayer2/FormatHolder;
    .param p3, "buffer"    # Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;

    .prologue
    .line 329
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->notifyReset:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 330
    :cond_0
    const/4 v0, -0x3

    .line 333
    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    iget-boolean v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadingFinished:Z

    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->lastSeekPositionUs:J

    move-object v1, p2

    move-object v2, p3

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->readData(Lcom/google/android/exoplayer2/FormatHolder;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;ZJ)I

    move-result v0

    goto :goto_0
.end method

.method public readDiscontinuity()J
    .locals 2

    .prologue
    .line 257
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->notifyReset:Z

    if-eqz v0, :cond_0

    .line 258
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->notifyReset:Z

    .line 259
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->lastSeekPositionUs:J

    .line 261
    :goto_0
    return-wide v0

    :cond_0
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_0
.end method

.method public release()V
    .locals 3

    .prologue
    .line 146
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->extractorHolder:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;

    .line 147
    .local v0, "extractorHolder":Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loader:Lcom/google/android/exoplayer2/upstream/Loader;

    new-instance v2, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$3;

    invoke-direct {v2, p0, v0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$3;-><init>(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;)V

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/upstream/Loader;->release(Ljava/lang/Runnable;)V

    .line 157
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->handler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 158
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->released:Z

    .line 159
    return-void
.end method

.method public seekMap(Lcom/google/android/exoplayer2/extractor/SeekMap;)V
    .locals 2
    .param p1, "seekMap"    # Lcom/google/android/exoplayer2/extractor/SeekMap;

    .prologue
    .line 402
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    .line 403
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->maybeFinishPrepareRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 404
    return-void
.end method

.method public seekToUs(J)J
    .locals 7
    .param p1, "positionUs"    # J

    .prologue
    const/4 v4, 0x0

    .line 292
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekMap:Lcom/google/android/exoplayer2/extractor/SeekMap;

    invoke-interface {v3}, Lcom/google/android/exoplayer2/extractor/SeekMap;->isSeekable()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 293
    :goto_0
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->lastSeekPositionUs:J

    .line 294
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v2

    .line 296
    .local v2, "trackCount":I
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->isPendingReset()Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v1, 0x1

    .line 297
    .local v1, "seekInsideBuffer":Z
    :goto_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-eqz v1, :cond_3

    if-ge v0, v2, :cond_3

    .line 298
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackEnabledStates:[Z

    aget-boolean v3, v3, v0

    if-eqz v3, :cond_0

    .line 299
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    invoke-virtual {v3, p1, p2}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->skipToKeyframeBefore(J)Z

    move-result v1

    .line 297
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 292
    .end local v0    # "i":I
    .end local v1    # "seekInsideBuffer":Z
    .end local v2    # "trackCount":I
    :cond_1
    const-wide/16 p1, 0x0

    goto :goto_0

    .restart local v2    # "trackCount":I
    :cond_2
    move v1, v4

    .line 296
    goto :goto_1

    .line 303
    .restart local v0    # "i":I
    .restart local v1    # "seekInsideBuffer":Z
    :cond_3
    if-nez v1, :cond_4

    .line 304
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->pendingResetPositionUs:J

    .line 305
    iput-boolean v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loadingFinished:Z

    .line 306
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loader:Lcom/google/android/exoplayer2/upstream/Loader;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/upstream/Loader;->isLoading()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 307
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loader:Lcom/google/android/exoplayer2/upstream/Loader;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/upstream/Loader;->cancelLoading()V

    .line 314
    :cond_4
    iput-boolean v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->notifyReset:Z

    .line 315
    return-wide p1

    .line 309
    :cond_5
    const/4 v0, 0x0

    :goto_3
    if-ge v0, v2, :cond_4

    .line 310
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackEnabledStates:[Z

    aget-boolean v5, v5, v0

    invoke-virtual {v3, v5}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->reset(Z)V

    .line 309
    add-int/lit8 v0, v0, 0x1

    goto :goto_3
.end method

.method public selectTracks([Lcom/google/android/exoplayer2/trackselection/TrackSelection;[Z[Lcom/google/android/exoplayer2/source/SampleStream;[ZJ)J
    .locals 9
    .param p1, "selections"    # [Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .param p2, "mayRetainStreamFlags"    # [Z
    .param p3, "streams"    # [Lcom/google/android/exoplayer2/source/SampleStream;
    .param p4, "streamResetFlags"    # [Z
    .param p5, "positionUs"    # J

    .prologue
    .line 181
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->prepared:Z

    invoke-static {v5}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 183
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, p1

    if-ge v0, v5, :cond_2

    .line 184
    aget-object v5, p3, v0

    if-eqz v5, :cond_1

    aget-object v5, p1, v0

    if-eqz v5, :cond_0

    aget-boolean v5, p2, v0

    if-nez v5, :cond_1

    .line 185
    :cond_0
    aget-object v5, p3, v0

    check-cast v5, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$SampleStreamImpl;

    invoke-static {v5}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$SampleStreamImpl;->access$400(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$SampleStreamImpl;)I

    move-result v3

    .line 186
    .local v3, "track":I
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackEnabledStates:[Z

    aget-boolean v5, v5, v3

    invoke-static {v5}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 187
    iget v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->enabledTrackCount:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->enabledTrackCount:I

    .line 188
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackEnabledStates:[Z

    const/4 v6, 0x0

    aput-boolean v6, v5, v3

    .line 189
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    invoke-virtual {v5}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->disable()V

    .line 190
    const/4 v5, 0x0

    aput-object v5, p3, v0

    .line 183
    .end local v3    # "track":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 194
    :cond_2
    const/4 v1, 0x0

    .line 195
    .local v1, "selectedNewTracks":Z
    const/4 v0, 0x0

    :goto_1
    array-length v5, p1

    if-ge v0, v5, :cond_7

    .line 196
    aget-object v5, p3, v0

    if-nez v5, :cond_3

    aget-object v5, p1, v0

    if-eqz v5, :cond_3

    .line 197
    aget-object v2, p1, v0

    .line 198
    .local v2, "selection":Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    invoke-interface {v2}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->length()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_4

    const/4 v5, 0x1

    :goto_2
    invoke-static {v5}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 199
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getIndexInTrackGroup(I)I

    move-result v5

    if-nez v5, :cond_5

    const/4 v5, 0x1

    :goto_3
    invoke-static {v5}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 200
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->tracks:Lcom/google/android/exoplayer2/source/TrackGroupArray;

    invoke-interface {v2}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getTrackGroup()Lcom/google/android/exoplayer2/source/TrackGroup;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer2/source/TrackGroupArray;->indexOf(Lcom/google/android/exoplayer2/source/TrackGroup;)I

    move-result v3

    .line 201
    .restart local v3    # "track":I
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackEnabledStates:[Z

    aget-boolean v5, v5, v3

    if-nez v5, :cond_6

    const/4 v5, 0x1

    :goto_4
    invoke-static {v5}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 202
    iget v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->enabledTrackCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->enabledTrackCount:I

    .line 203
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackEnabledStates:[Z

    const/4 v6, 0x1

    aput-boolean v6, v5, v3

    .line 204
    new-instance v5, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$SampleStreamImpl;

    invoke-direct {v5, p0, v3}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$SampleStreamImpl;-><init>(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;I)V

    aput-object v5, p3, v0

    .line 205
    const/4 v5, 0x1

    aput-boolean v5, p4, v0

    .line 206
    const/4 v1, 0x1

    .line 195
    .end local v2    # "selection":Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .end local v3    # "track":I
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 198
    .restart local v2    # "selection":Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    :cond_4
    const/4 v5, 0x0

    goto :goto_2

    .line 199
    :cond_5
    const/4 v5, 0x0

    goto :goto_3

    .line 201
    .restart local v3    # "track":I
    :cond_6
    const/4 v5, 0x0

    goto :goto_4

    .line 209
    .end local v2    # "selection":Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .end local v3    # "track":I
    :cond_7
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seenFirstTrackSelection:Z

    if-nez v5, :cond_9

    .line 212
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v4

    .line 213
    .local v4, "trackCount":I
    const/4 v0, 0x0

    :goto_5
    if-ge v0, v4, :cond_9

    .line 214
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->trackEnabledStates:[Z

    aget-boolean v5, v5, v0

    if-nez v5, :cond_8

    .line 215
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v5, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    invoke-virtual {v5}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->disable()V

    .line 213
    :cond_8
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 219
    .end local v4    # "trackCount":I
    :cond_9
    iget v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->enabledTrackCount:I

    if-nez v5, :cond_b

    .line 220
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->notifyReset:Z

    .line 221
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loader:Lcom/google/android/exoplayer2/upstream/Loader;

    invoke-virtual {v5}, Lcom/google/android/exoplayer2/upstream/Loader;->isLoading()Z

    move-result v5

    if-eqz v5, :cond_a

    .line 222
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->loader:Lcom/google/android/exoplayer2/upstream/Loader;

    invoke-virtual {v5}, Lcom/google/android/exoplayer2/upstream/Loader;->cancelLoading()V

    .line 233
    :cond_a
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seenFirstTrackSelection:Z

    .line 234
    return-wide p5

    .line 224
    :cond_b
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seenFirstTrackSelection:Z

    if-eqz v5, :cond_d

    if-eqz v1, :cond_a

    .line 225
    :goto_6
    invoke-virtual {p0, p5, p6}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->seekToUs(J)J

    move-result-wide p5

    .line 227
    const/4 v0, 0x0

    :goto_7
    array-length v5, p3

    if-ge v0, v5, :cond_a

    .line 228
    aget-object v5, p3, v0

    if-eqz v5, :cond_c

    .line 229
    const/4 v5, 0x1

    aput-boolean v5, p4, v0

    .line 227
    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 224
    :cond_d
    const-wide/16 v6, 0x0

    cmp-long v5, p5, v6

    if-eqz v5, :cond_a

    goto :goto_6
.end method

.method public track(I)Lcom/google/android/exoplayer2/extractor/TrackOutput;
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 385
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    .line 386
    .local v0, "trackOutput":Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;
    if-nez v0, :cond_0

    .line 387
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;

    .end local v0    # "trackOutput":Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->allocator:Lcom/google/android/exoplayer2/upstream/Allocator;

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;-><init>(Lcom/google/android/exoplayer2/upstream/Allocator;)V

    .line 388
    .restart local v0    # "trackOutput":Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput;->setUpstreamFormatChangeListener(Lcom/google/android/exoplayer2/extractor/DefaultTrackOutput$UpstreamFormatChangedListener;)V

    .line 389
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 391
    :cond_0
    return-object v0
.end method
