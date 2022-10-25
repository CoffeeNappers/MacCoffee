.class final Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;
.super Ljava/lang/Object;
.source "ExtractorMediaPeriod.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/Loader$Loadable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ExtractingLoadable"
.end annotation


# static fields
.field private static final CONTINUE_LOADING_CHECK_INTERVAL_BYTES:I = 0x100000


# instance fields
.field private final dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private final extractorHolder:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;

.field private length:J

.field private volatile loadCanceled:Z

.field private final loadCondition:Lcom/google/android/exoplayer2/util/ConditionVariable;

.field private pendingExtractorSeek:Z

.field private final positionHolder:Lcom/google/android/exoplayer2/extractor/PositionHolder;

.field private seekTimeUs:J

.field final synthetic this$0:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

.field private final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;Lcom/google/android/exoplayer2/util/ConditionVariable;)V
    .locals 2
    .param p1, "this$0"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p4, "extractorHolder"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;
    .param p5, "loadCondition"    # Lcom/google/android/exoplayer2/util/ConditionVariable;

    .prologue
    .line 590
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->this$0:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 591
    invoke-static {p2}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->uri:Landroid/net/Uri;

    .line 592
    invoke-static {p3}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/upstream/DataSource;

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 593
    invoke-static {p4}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->extractorHolder:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;

    .line 594
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->loadCondition:Lcom/google/android/exoplayer2/util/ConditionVariable;

    .line 595
    new-instance v0, Lcom/google/android/exoplayer2/extractor/PositionHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/PositionHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer2/extractor/PositionHolder;

    .line 596
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->pendingExtractorSeek:Z

    .line 597
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->length:J

    .line 598
    return-void
.end method

.method static synthetic access$500(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;

    .prologue
    .line 569
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->length:J

    return-wide v0
.end method


# virtual methods
.method public cancelLoad()V
    .locals 1

    .prologue
    .line 608
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->loadCanceled:Z

    .line 609
    return-void
.end method

.method public isLoadCanceled()Z
    .locals 1

    .prologue
    .line 613
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->loadCanceled:Z

    return v0
.end method

.method public load()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 618
    const/4 v9, 0x0

    .line 619
    .local v9, "result":I
    :goto_0
    if-nez v9, :cond_7

    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->loadCanceled:Z

    if-nez v1, :cond_7

    .line 620
    const/4 v8, 0x0

    .line 622
    .local v8, "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    :try_start_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer2/extractor/PositionHolder;

    iget-wide v2, v1, Lcom/google/android/exoplayer2/extractor/PositionHolder;->position:J

    .line 623
    .local v2, "position":J
    iget-object v10, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    new-instance v0, Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->uri:Landroid/net/Uri;

    const-wide/16 v4, -0x1

    iget-object v6, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->this$0:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    invoke-static {v6}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->access$700(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)Ljava/lang/String;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer2/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    invoke-interface {v10, v0}, Lcom/google/android/exoplayer2/upstream/DataSource;->open(Lcom/google/android/exoplayer2/upstream/DataSpec;)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->length:J

    .line 624
    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->length:J

    const-wide/16 v10, -0x1

    cmp-long v1, v4, v10

    if-eqz v1, :cond_0

    .line 625
    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->length:J

    add-long/2addr v4, v2

    iput-wide v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->length:J

    .line 627
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultExtractorInput;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->length:J

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/extractor/DefaultExtractorInput;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 628
    .end local v8    # "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .local v0, "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    :try_start_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->extractorHolder:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-interface {v4}, Lcom/google/android/exoplayer2/upstream/DataSource;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v1, v0, v4}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractorHolder;->selectExtractor(Lcom/google/android/exoplayer2/extractor/ExtractorInput;Landroid/net/Uri;)Lcom/google/android/exoplayer2/extractor/Extractor;

    move-result-object v7

    .line 629
    .local v7, "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->pendingExtractorSeek:Z

    if-eqz v1, :cond_1

    .line 630
    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->seekTimeUs:J

    invoke-interface {v7, v2, v3, v4, v5}, Lcom/google/android/exoplayer2/extractor/Extractor;->seek(JJ)V

    .line 631
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->pendingExtractorSeek:Z

    .line 633
    :cond_1
    :goto_1
    if-nez v9, :cond_3

    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->loadCanceled:Z

    if-nez v1, :cond_3

    .line 634
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->loadCondition:Lcom/google/android/exoplayer2/util/ConditionVariable;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/util/ConditionVariable;->block()V

    .line 635
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer2/extractor/PositionHolder;

    invoke-interface {v7, v0, v1}, Lcom/google/android/exoplayer2/extractor/Extractor;->read(Lcom/google/android/exoplayer2/extractor/ExtractorInput;Lcom/google/android/exoplayer2/extractor/PositionHolder;)I

    move-result v9

    .line 636
    invoke-interface {v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v4

    const-wide/32 v10, 0x100000

    add-long/2addr v10, v2

    cmp-long v1, v4, v10

    if-lez v1, :cond_1

    .line 637
    invoke-interface {v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    .line 638
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->loadCondition:Lcom/google/android/exoplayer2/util/ConditionVariable;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/util/ConditionVariable;->close()Z

    .line 639
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->this$0:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    invoke-static {v1}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->access$900(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)Landroid/os/Handler;

    move-result-object v1

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->this$0:Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;

    invoke-static {v4}, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;->access$800(Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 643
    .end local v7    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :catchall_0
    move-exception v1

    .end local v2    # "position":J
    :goto_2
    const/4 v4, 0x1

    if-ne v9, v4, :cond_6

    .line 644
    const/4 v9, 0x0

    .line 648
    :cond_2
    :goto_3
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-static {v4}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Lcom/google/android/exoplayer2/upstream/DataSource;)V

    throw v1

    .line 643
    .restart local v2    # "position":J
    .restart local v7    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :cond_3
    const/4 v1, 0x1

    if-ne v9, v1, :cond_5

    .line 644
    const/4 v9, 0x0

    .line 648
    :cond_4
    :goto_4
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    invoke-static {v1}, Lcom/google/android/exoplayer2/util/Util;->closeQuietly(Lcom/google/android/exoplayer2/upstream/DataSource;)V

    goto/16 :goto_0

    .line 645
    :cond_5
    if-eqz v0, :cond_4

    .line 646
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer2/extractor/PositionHolder;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v4

    iput-wide v4, v1, Lcom/google/android/exoplayer2/extractor/PositionHolder;->position:J

    goto :goto_4

    .line 645
    .end local v2    # "position":J
    .end local v7    # "extractor":Lcom/google/android/exoplayer2/extractor/Extractor;
    :cond_6
    if-eqz v0, :cond_2

    .line 646
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer2/extractor/PositionHolder;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v10

    iput-wide v10, v4, Lcom/google/android/exoplayer2/extractor/PositionHolder;->position:J

    goto :goto_3

    .line 651
    .end local v0    # "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    :cond_7
    return-void

    .line 643
    .restart local v8    # "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    :catchall_1
    move-exception v1

    move-object v0, v8

    .end local v8    # "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .restart local v0    # "input":Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    goto :goto_2
.end method

.method public setLoadPosition(JJ)V
    .locals 1
    .param p1, "position"    # J
    .param p3, "timeUs"    # J

    .prologue
    .line 601
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer2/extractor/PositionHolder;

    iput-wide p1, v0, Lcom/google/android/exoplayer2/extractor/PositionHolder;->position:J

    .line 602
    iput-wide p3, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->seekTimeUs:J

    .line 603
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/ExtractorMediaPeriod$ExtractingLoadable;->pendingExtractorSeek:Z

    .line 604
    return-void
.end method
