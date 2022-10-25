.class Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;
.super Ljava/lang/Object;
.source "TsExtractor.java"

# interfaces
.implements Lcom/google/android/exoplayer2/extractor/ts/SectionPayloadReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PmtReader"
.end annotation


# static fields
.field private static final TS_PMT_DESC_AC3:I = 0x6a

.field private static final TS_PMT_DESC_DTS:I = 0x7b

.field private static final TS_PMT_DESC_EAC3:I = 0x7a

.field private static final TS_PMT_DESC_ISO639_LANG:I = 0xa

.field private static final TS_PMT_DESC_REGISTRATION:I = 0x5


# instance fields
.field private final pid:I

.field private final pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

.field final synthetic this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;I)V
    .locals 2
    .param p2, "pid"    # I

    .prologue
    .line 330
    iput-object p1, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 331
    new-instance v0, Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v1, 0x5

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    .line 332
    iput p2, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pid:I

    .line 333
    return-void
.end method

.method private readEsInfo(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;
    .locals 13
    .param p1, "data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p2, "length"    # I

    .prologue
    .line 425
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v3

    .line 426
    .local v3, "descriptorsStartPosition":I
    add-int v2, v3, p2

    .line 427
    .local v2, "descriptorsEndPosition":I
    const/4 v8, -0x1

    .line 428
    .local v8, "streamType":I
    const/4 v6, 0x0

    .line 429
    .local v6, "language":Ljava/lang/String;
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v9

    if-ge v9, v2, :cond_7

    .line 430
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    .line 431
    .local v1, "descriptorTag":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 432
    .local v0, "descriptorLength":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v9

    add-int v7, v9, v0

    .line 433
    .local v7, "positionOfNextDescriptor":I
    const/4 v9, 0x5

    if-ne v1, v9, :cond_3

    .line 434
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v4

    .line 435
    .local v4, "formatIdentifier":J
    invoke-static {}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$800()J

    move-result-wide v10

    cmp-long v9, v4, v10

    if-nez v9, :cond_1

    .line 436
    const/16 v8, 0x81

    .line 453
    .end local v4    # "formatIdentifier":J
    :cond_0
    :goto_1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v9

    sub-int v9, v7, v9

    invoke-virtual {p1, v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_0

    .line 437
    .restart local v4    # "formatIdentifier":J
    :cond_1
    invoke-static {}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$900()J

    move-result-wide v10

    cmp-long v9, v4, v10

    if-nez v9, :cond_2

    .line 438
    const/16 v8, 0x87

    goto :goto_1

    .line 439
    :cond_2
    invoke-static {}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$1000()J

    move-result-wide v10

    cmp-long v9, v4, v10

    if-nez v9, :cond_0

    .line 440
    const/16 v8, 0x24

    goto :goto_1

    .line 442
    .end local v4    # "formatIdentifier":J
    :cond_3
    const/16 v9, 0x6a

    if-ne v1, v9, :cond_4

    .line 443
    const/16 v8, 0x81

    goto :goto_1

    .line 444
    :cond_4
    const/16 v9, 0x7a

    if-ne v1, v9, :cond_5

    .line 445
    const/16 v8, 0x87

    goto :goto_1

    .line 446
    :cond_5
    const/16 v9, 0x7b

    if-ne v1, v9, :cond_6

    .line 447
    const/16 v8, 0x8a

    goto :goto_1

    .line 448
    :cond_6
    const/16 v9, 0xa

    if-ne v1, v9, :cond_0

    .line 449
    new-instance v9, Ljava/lang/String;

    iget-object v10, p1, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v11

    const/4 v12, 0x3

    invoke-direct {v9, v10, v11, v12}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 455
    .end local v0    # "descriptorLength":I
    .end local v1    # "descriptorTag":I
    .end local v7    # "positionOfNextDescriptor":I
    :cond_7
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 456
    new-instance v9, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;

    iget-object v10, p1, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    .line 457
    invoke-static {v10, v3, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v10

    invoke-direct {v9, v8, v6, v10}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;-><init>(ILjava/lang/String;[B)V

    return-object v9
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer2/util/ParsableByteArray;)V
    .locals 18
    .param p1, "sectionData"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    .line 343
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v10

    .line 344
    .local v10, "tableId":I
    const/4 v12, 0x2

    if-eq v10, v12, :cond_0

    .line 414
    :goto_0
    return-void

    .line 351
    :cond_0
    const/16 v12, 0x9

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 354
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v13, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v12, v13}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer2/util/ParsableBitArray;I)V

    .line 355
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v13, 0x4

    invoke-virtual {v12, v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 356
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v13, 0xc

    invoke-virtual {v12, v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v6

    .line 359
    .local v6, "programInfoLength":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 361
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$100(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Z

    move-result v12

    if-eqz v12, :cond_1

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$200(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    move-result-object v12

    if-nez v12, :cond_1

    .line 364
    new-instance v2, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;

    const/16 v12, 0x15

    const/4 v13, 0x0

    const/4 v14, 0x0

    new-array v14, v14, [B

    invoke-direct {v2, v12, v13, v14}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;-><init>(ILjava/lang/String;[B)V

    .line 365
    .local v2, "dummyEsInfo":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v13}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$300(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;

    move-result-object v13

    const/16 v14, 0x15

    invoke-interface {v13, v14, v2}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;->createPayloadReader(ILcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$202(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    .line 366
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$200(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v13}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$400(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v14}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$500(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    move-result-object v14

    new-instance v15, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;

    const/16 v16, 0x15

    const/16 v17, 0x2000

    invoke-direct/range {v15 .. v17}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;-><init>(II)V

    invoke-interface {v12, v13, v14, v15}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;->init(Lcom/google/android/exoplayer2/util/TimestampAdjuster;Lcom/google/android/exoplayer2/extractor/ExtractorOutput;Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;)V

    .line 370
    .end local v2    # "dummyEsInfo":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v8

    .line 371
    .local v8, "remainingEntriesLength":I
    :cond_2
    :goto_1
    if-lez v8, :cond_7

    .line 372
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v13, 0x5

    move-object/from16 v0, p1

    invoke-virtual {v0, v12, v13}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer2/util/ParsableBitArray;I)V

    .line 373
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v9

    .line 374
    .local v9, "streamType":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v13, 0x3

    invoke-virtual {v12, v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 375
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v13, 0xd

    invoke-virtual {v12, v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v3

    .line 376
    .local v3, "elementaryPid":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v13, 0x4

    invoke-virtual {v12, v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 377
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v13, 0xc

    invoke-virtual {v12, v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v5

    .line 378
    .local v5, "esInfoLength":I
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v5}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->readEsInfo(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;

    move-result-object v4

    .line 379
    .local v4, "esInfo":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;
    const/4 v12, 0x6

    if-ne v9, v12, :cond_3

    .line 380
    iget v9, v4, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;->streamType:I

    .line 382
    :cond_3
    add-int/lit8 v12, v5, 0x5

    sub-int/2addr v8, v12

    .line 384
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$100(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Z

    move-result v12

    if-eqz v12, :cond_5

    move v11, v9

    .line 385
    .local v11, "trackId":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$600(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Landroid/util/SparseBooleanArray;

    move-result-object v12

    invoke-virtual {v12, v11}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v12

    if-nez v12, :cond_2

    .line 388
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$600(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Landroid/util/SparseBooleanArray;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {v12, v11, v13}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 391
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$100(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Z

    move-result v12

    if-eqz v12, :cond_6

    const/16 v12, 0x15

    if-ne v9, v12, :cond_6

    .line 392
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$200(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    move-result-object v7

    .line 400
    .local v7, "reader":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;
    :cond_4
    :goto_3
    if-eqz v7, :cond_2

    .line 401
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$000(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Landroid/util/SparseArray;

    move-result-object v12

    invoke-virtual {v12, v3, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_1

    .end local v7    # "reader":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;
    .end local v11    # "trackId":I
    :cond_5
    move v11, v3

    .line 384
    goto :goto_2

    .line 394
    .restart local v11    # "trackId":I
    :cond_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$300(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;

    move-result-object v12

    invoke-interface {v12, v9, v4}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;->createPayloadReader(ILcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    move-result-object v7

    .line 395
    .restart local v7    # "reader":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;
    if-eqz v7, :cond_4

    .line 396
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$400(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v13}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$500(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    move-result-object v13

    new-instance v14, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;

    const/16 v15, 0x2000

    invoke-direct {v14, v11, v15}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;-><init>(II)V

    invoke-interface {v7, v12, v13, v14}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;->init(Lcom/google/android/exoplayer2/util/TimestampAdjuster;Lcom/google/android/exoplayer2/extractor/ExtractorOutput;Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;)V

    goto :goto_3

    .line 404
    .end local v3    # "elementaryPid":I
    .end local v4    # "esInfo":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;
    .end local v5    # "esInfoLength":I
    .end local v7    # "reader":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;
    .end local v9    # "streamType":I
    .end local v11    # "trackId":I
    :cond_7
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$100(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 405
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$700(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Z

    move-result v12

    if-nez v12, :cond_8

    .line 406
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$500(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    move-result-object v12

    invoke-interface {v12}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->endTracks()V

    .line 413
    :cond_8
    :goto_4
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    const/4 v13, 0x1

    invoke-static {v12, v13}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$702(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;Z)Z

    goto/16 :goto_0

    .line 409
    :cond_9
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$000(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Landroid/util/SparseArray;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/util/SparseArray;->remove(I)V

    .line 410
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$000(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Landroid/util/SparseArray;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->pid:I

    invoke-virtual {v12, v13}, Landroid/util/SparseArray;->remove(I)V

    .line 411
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    invoke-static {v12}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->access$500(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    move-result-object v12

    invoke-interface {v12}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->endTracks()V

    goto :goto_4
.end method

.method public init(Lcom/google/android/exoplayer2/util/TimestampAdjuster;Lcom/google/android/exoplayer2/extractor/ExtractorOutput;Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;)V
    .locals 0
    .param p1, "timestampAdjuster"    # Lcom/google/android/exoplayer2/util/TimestampAdjuster;
    .param p2, "extractorOutput"    # Lcom/google/android/exoplayer2/extractor/ExtractorOutput;
    .param p3, "idGenerator"    # Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$TrackIdGenerator;

    .prologue
    .line 339
    return-void
.end method
