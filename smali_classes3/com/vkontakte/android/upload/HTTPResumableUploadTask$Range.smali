.class Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
.super Ljava/lang/Object;
.source "HTTPResumableUploadTask.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/upload/HTTPResumableUploadTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Range"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;",
        ">;"
    }
.end annotation


# instance fields
.field private currentTotal:J

.field private end:J

.field private fileLengthFinal:Z

.field private lastUpdate:J

.field private length:J

.field private start:J


# direct methods
.method public constructor <init>(JJJZ)V
    .locals 5
    .param p1, "start"    # J
    .param p3, "end"    # J
    .param p5, "currentTotal"    # J
    .param p7, "fileLengthFinal"    # Z

    .prologue
    .line 539
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 540
    iput-wide p1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->start:J

    .line 541
    iput-wide p3, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->end:J

    .line 542
    sub-long v0, p3, p1

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->length:J

    .line 543
    iput-wide p5, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->currentTotal:J

    .line 544
    iput-boolean p7, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->fileLengthFinal:Z

    .line 545
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    .prologue
    .line 531
    iget-wide v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->end:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    .prologue
    .line 531
    iget-wide v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->start:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    .prologue
    .line 531
    iget-wide v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->length:J

    return-wide v0
.end method

.method public static merge(Ljava/util/List;Z)Ljava/util/List;
    .locals 14
    .param p1, "fileLengthFinal"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;",
            ">;Z)",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;",
            ">;"
        }
    .end annotation

    .prologue
    .line 603
    .local p0, "intervals":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v8, 0x2

    if-ge v1, v8, :cond_0

    .line 626
    .end local p0    # "intervals":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    :goto_0
    return-object p0

    .line 606
    .restart local p0    # "intervals":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    :cond_0
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 608
    const/4 v1, 0x0

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    .line 609
    .local v9, "first":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    iget-wide v6, v9, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->currentTotal:J

    .line 610
    .local v6, "total":J
    iget-wide v2, v9, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->start:J

    .line 611
    .local v2, "start":J
    iget-wide v4, v9, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->end:J

    .line 613
    .local v4, "end":J
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 614
    .local v11, "result":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;>;"
    const/4 v10, 0x1

    .local v10, "i":I
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v10, v1, :cond_2

    .line 615
    invoke-interface {p0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    .line 616
    .local v0, "current":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    iget-wide v12, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->start:J

    cmp-long v1, v12, v4

    if-gtz v1, :cond_1

    .line 617
    iget-wide v12, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->end:J

    invoke-static {v12, v13, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 614
    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 619
    :cond_1
    new-instance v1, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    move v8, p1

    invoke-direct/range {v1 .. v8}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;-><init>(JJJZ)V

    invoke-interface {v11, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 620
    iget-wide v2, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->start:J

    .line 621
    iget-wide v4, v0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->end:J

    goto :goto_2

    .line 625
    .end local v0    # "current":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
    :cond_2
    new-instance v1, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    move v8, p1

    invoke-direct/range {v1 .. v8}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;-><init>(JJJZ)V

    invoke-interface {v11, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object p0, v11

    .line 626
    goto :goto_0
.end method

.method private updateProgress(Lcom/vkontakte/android/upload/UploadTask;JJ)V
    .locals 6
    .param p1, "task"    # Lcom/vkontakte/android/upload/UploadTask;
    .param p2, "sent"    # J
    .param p4, "totalUploaded"    # J

    .prologue
    .line 579
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->lastUpdate:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x96

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    .line 580
    add-long v2, p4, p2

    long-to-float v1, v2

    iget-wide v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->currentTotal:J

    long-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x42c80000    # 100.0f

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 581
    .local v0, "percentage":I
    const/16 v1, 0x64

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/vkontakte/android/upload/UploadTask;->onProgress(IIZ)V

    .line 582
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->lastUpdate:J

    .line 584
    .end local v0    # "percentage":I
    :cond_0
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)I
    .locals 4
    .param p1, "another"    # Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 588
    iget-wide v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->start:J

    iget-wide v2, p1, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->start:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 531
    check-cast p1, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->compareTo(Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;)I

    move-result v0

    return v0
.end method

.method public copy(Ljava/io/InputStream;Ljava/io/OutputStream;JLcom/vkontakte/android/upload/UploadTask;)V
    .locals 11
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "output"    # Ljava/io/OutputStream;
    .param p3, "totalUploaded"    # J
    .param p5, "task"    # Lcom/vkontakte/android/upload/UploadTask;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 548
    const/16 v0, 0x4000

    new-array v6, v0, [B

    .line 549
    .local v6, "buffer":[B
    const-wide/16 v2, 0x0

    .line 552
    .local v2, "sent":J
    iget-wide v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->currentTotal:J

    iget-wide v4, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->length:J

    cmp-long v0, v0, v4

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->fileLengthFinal:Z

    if-eqz v0, :cond_0

    .line 553
    :goto_0
    invoke-virtual {p1, v6}, Ljava/io/InputStream;->read([B)I

    move-result v7

    .local v7, "read":I
    if-lez v7, :cond_2

    .line 554
    const/4 v0, 0x0

    invoke-virtual {p2, v6, v0, v7}, Ljava/io/OutputStream;->write([BII)V

    .line 555
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    .line 556
    int-to-long v0, v7

    add-long/2addr v2, v0

    move-object v0, p0

    move-object/from16 v1, p5

    move-wide v4, p3

    .line 557
    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->updateProgress(Lcom/vkontakte/android/upload/UploadTask;JJ)V

    goto :goto_0

    .line 560
    .end local v7    # "read":I
    :cond_0
    iget-wide v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->start:J

    invoke-virtual {p1, v0, v1}, Ljava/io/InputStream;->skip(J)J

    .line 561
    iget-wide v8, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->length:J

    .line 563
    .local v8, "toRead":J
    :goto_1
    invoke-virtual {p1, v6}, Ljava/io/InputStream;->read([B)I

    move-result v7

    .restart local v7    # "read":I
    if-lez v7, :cond_2

    .line 564
    int-to-long v0, v7

    sub-long/2addr v8, v0

    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-lez v0, :cond_1

    .line 565
    const/4 v0, 0x0

    invoke-virtual {p2, v6, v0, v7}, Ljava/io/OutputStream;->write([BII)V

    .line 566
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    .line 572
    int-to-long v0, v7

    add-long/2addr v2, v0

    move-object v0, p0

    move-object/from16 v1, p5

    move-wide v4, p3

    .line 573
    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->updateProgress(Lcom/vkontakte/android/upload/UploadTask;JJ)V

    goto :goto_1

    .line 568
    :cond_1
    const/4 v0, 0x0

    long-to-int v1, v8

    add-int/2addr v1, v7

    invoke-virtual {p2, v6, v0, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 569
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    .line 576
    .end local v8    # "toRead":J
    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 593
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Range{start="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->start:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", end="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->end:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", length="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->length:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", currentTotal="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->currentTotal:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lastUpdate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$Range;->lastUpdate:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
