.class public final Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;
.super Ljava/lang/Object;
.source "Id3Decoder.java"

# interfaces
.implements Lcom/google/android/exoplayer2/metadata/MetadataDecoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;
    }
.end annotation


# static fields
.field public static final ID3_HEADER_LENGTH:I = 0xa

.field public static final ID3_TAG:I

.field private static final ID3_TEXT_ENCODING_ISO_8859_1:I = 0x0

.field private static final ID3_TEXT_ENCODING_UTF_16:I = 0x1

.field private static final ID3_TEXT_ENCODING_UTF_16BE:I = 0x2

.field private static final ID3_TEXT_ENCODING_UTF_8:I = 0x3

.field private static final TAG:Ljava/lang/String; = "Id3Decoder"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const-string/jumbo v0, "ID3"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->ID3_TAG:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 663
    return-void
.end method

.method private static decodeApicFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;II)Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;
    .locals 17
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .param p2, "majorVersion"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 448
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v6

    .line 449
    .local v6, "encoding":I
    invoke-static {v6}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->getCharsetName(I)Ljava/lang/String;

    move-result-object v1

    .line 451
    .local v1, "charset":Ljava/lang/String;
    add-int/lit8 v12, p1, -0x1

    new-array v2, v12, [B

    .line 452
    .local v2, "data":[B
    const/4 v12, 0x0

    add-int/lit8 v13, p1, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v12, v13}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 456
    const/4 v12, 0x2

    move/from16 v0, p2

    if-ne v0, v12, :cond_1

    .line 457
    const/4 v8, 0x2

    .line 458
    .local v8, "mimeTypeEndIndex":I
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "image/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    new-instance v13, Ljava/lang/String;

    const/4 v14, 0x0

    const/4 v15, 0x3

    const-string/jumbo v16, "ISO-8859-1"

    move-object/from16 v0, v16

    invoke-direct {v13, v2, v14, v15, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-static {v13}, Lcom/google/android/exoplayer2/util/Util;->toLowerInvariant(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 459
    .local v7, "mimeType":Ljava/lang/String;
    const-string/jumbo v12, "image/jpg"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 460
    const-string/jumbo v7, "image/jpeg"

    .line 470
    :cond_0
    :goto_0
    add-int/lit8 v12, v8, 0x1

    aget-byte v12, v2, v12

    and-int/lit16 v11, v12, 0xff

    .line 472
    .local v11, "pictureType":I
    add-int/lit8 v5, v8, 0x2

    .line 473
    .local v5, "descriptionStartIndex":I
    invoke-static {v2, v5, v6}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfEos([BII)I

    move-result v4

    .line 474
    .local v4, "descriptionEndIndex":I
    new-instance v3, Ljava/lang/String;

    sub-int v12, v4, v5

    invoke-direct {v3, v2, v5, v12, v1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 477
    .local v3, "description":Ljava/lang/String;
    invoke-static {v6}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->delimiterLength(I)I

    move-result v12

    add-int v10, v4, v12

    .line 478
    .local v10, "pictureDataStartIndex":I
    array-length v12, v2

    invoke-static {v2, v10, v12}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v9

    .line 480
    .local v9, "pictureData":[B
    new-instance v12, Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;

    invoke-direct {v12, v7, v3, v11, v9}, Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;-><init>(Ljava/lang/String;Ljava/lang/String;I[B)V

    return-object v12

    .line 463
    .end local v3    # "description":Ljava/lang/String;
    .end local v4    # "descriptionEndIndex":I
    .end local v5    # "descriptionStartIndex":I
    .end local v7    # "mimeType":Ljava/lang/String;
    .end local v8    # "mimeTypeEndIndex":I
    .end local v9    # "pictureData":[B
    .end local v10    # "pictureDataStartIndex":I
    .end local v11    # "pictureType":I
    :cond_1
    const/4 v12, 0x0

    invoke-static {v2, v12}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfZeroByte([BI)I

    move-result v8

    .line 464
    .restart local v8    # "mimeTypeEndIndex":I
    new-instance v12, Ljava/lang/String;

    const/4 v13, 0x0

    const-string/jumbo v14, "ISO-8859-1"

    invoke-direct {v12, v2, v13, v8, v14}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-static {v12}, Lcom/google/android/exoplayer2/util/Util;->toLowerInvariant(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 465
    .restart local v7    # "mimeType":Ljava/lang/String;
    const/16 v12, 0x2f

    invoke-virtual {v7, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_0

    .line 466
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "image/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_0
.end method

.method private static decodeBinaryFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/BinaryFrame;
    .locals 2
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .param p2, "id"    # Ljava/lang/String;

    .prologue
    .line 584
    new-array v0, p1, [B

    .line 585
    .local v0, "frame":[B
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 587
    new-instance v1, Lcom/google/android/exoplayer2/metadata/id3/BinaryFrame;

    invoke-direct {v1, p2, v0}, Lcom/google/android/exoplayer2/metadata/id3/BinaryFrame;-><init>(Ljava/lang/String;[B)V

    return-object v1
.end method

.method private static decodeChapterFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;IIZI)Lcom/google/android/exoplayer2/metadata/id3/ChapterFrame;
    .locals 20
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .param p2, "majorVersion"    # I
    .param p3, "unsignedIntFrameSizeHack"    # Z
    .param p4, "frameHeaderSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 513
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v15

    .line 514
    .local v15, "framePosition":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    invoke-static {v4, v15}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfZeroByte([BI)I

    move-result v13

    .line 515
    .local v13, "chapterIdEndIndex":I
    new-instance v5, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    sub-int v18, v13, v15

    const-string/jumbo v19, "ISO-8859-1"

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v5, v4, v15, v0, v1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 517
    .local v5, "chapterId":Ljava/lang/String;
    add-int/lit8 v4, v13, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 519
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v6

    .line 520
    .local v6, "startTime":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v7

    .line 521
    .local v7, "endTime":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v8

    .line 522
    .local v8, "startOffset":J
    const-wide v18, 0xffffffffL

    cmp-long v4, v8, v18

    if-nez v4, :cond_0

    .line 523
    const-wide/16 v8, -0x1

    .line 525
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v10

    .line 526
    .local v10, "endOffset":J
    const-wide v18, 0xffffffffL

    cmp-long v4, v10, v18

    if-nez v4, :cond_1

    .line 527
    const-wide/16 v10, -0x1

    .line 530
    :cond_1
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 531
    .local v17, "subFrames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;>;"
    add-int v16, v15, p1

    .line 532
    .local v16, "limit":I
    :cond_2
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v4

    move/from16 v0, v16

    if-ge v4, v0, :cond_3

    .line 533
    move/from16 v0, p2

    move-object/from16 v1, p0

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeFrame(ILcom/google/android/exoplayer2/util/ParsableByteArray;ZI)Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    move-result-object v14

    .line 535
    .local v14, "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    if-eqz v14, :cond_2

    .line 536
    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 540
    .end local v14    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :cond_3
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v12, v4, [Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    .line 541
    .local v12, "subFrameArray":[Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 542
    new-instance v4, Lcom/google/android/exoplayer2/metadata/id3/ChapterFrame;

    invoke-direct/range {v4 .. v12}, Lcom/google/android/exoplayer2/metadata/id3/ChapterFrame;-><init>(Ljava/lang/String;IIJJ[Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;)V

    return-object v4
.end method

.method private static decodeChapterTOCFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;IIZI)Lcom/google/android/exoplayer2/metadata/id3/ChapterTocFrame;
    .locals 23
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .param p2, "majorVersion"    # I
    .param p3, "unsignedIntFrameSizeHack"    # Z
    .param p4, "frameHeaderSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 548
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v15

    .line 549
    .local v15, "framePosition":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    invoke-static {v4, v15}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfZeroByte([BI)I

    move-result v12

    .line 550
    .local v12, "elementIdEndIndex":I
    new-instance v5, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    sub-int v20, v12, v15

    const-string/jumbo v21, "ISO-8859-1"

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v5, v4, v15, v0, v1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 552
    .local v5, "elementId":Ljava/lang/String;
    add-int/lit8 v4, v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 554
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v11

    .line 555
    .local v11, "ctocFlags":I
    and-int/lit8 v4, v11, 0x2

    if-eqz v4, :cond_0

    const/4 v6, 0x1

    .line 556
    .local v6, "isRoot":Z
    :goto_0
    and-int/lit8 v4, v11, 0x1

    if-eqz v4, :cond_1

    const/4 v7, 0x1

    .line 558
    .local v7, "isOrdered":Z
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v10

    .line 559
    .local v10, "childCount":I
    new-array v8, v10, [Ljava/lang/String;

    .line 560
    .local v8, "children":[Ljava/lang/String;
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_2
    move/from16 v0, v16

    if-ge v0, v10, :cond_2

    .line 561
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v18

    .line 562
    .local v18, "startIndex":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    move/from16 v0, v18

    invoke-static {v4, v0}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfZeroByte([BI)I

    move-result v13

    .line 563
    .local v13, "endIndex":I
    new-instance v4, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    move-object/from16 v20, v0

    sub-int v21, v13, v18

    const-string/jumbo v22, "ISO-8859-1"

    move-object/from16 v0, v20

    move/from16 v1, v18

    move/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v4, v0, v1, v2, v3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    aput-object v4, v8, v16

    .line 564
    add-int/lit8 v4, v13, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 560
    add-int/lit8 v16, v16, 0x1

    goto :goto_2

    .line 555
    .end local v6    # "isRoot":Z
    .end local v7    # "isOrdered":Z
    .end local v8    # "children":[Ljava/lang/String;
    .end local v10    # "childCount":I
    .end local v13    # "endIndex":I
    .end local v16    # "i":I
    .end local v18    # "startIndex":I
    :cond_0
    const/4 v6, 0x0

    goto :goto_0

    .line 556
    .restart local v6    # "isRoot":Z
    :cond_1
    const/4 v7, 0x0

    goto :goto_1

    .line 567
    .restart local v7    # "isOrdered":Z
    .restart local v8    # "children":[Ljava/lang/String;
    .restart local v10    # "childCount":I
    .restart local v16    # "i":I
    :cond_2
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 568
    .local v19, "subFrames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;>;"
    add-int v17, v15, p1

    .line 569
    .local v17, "limit":I
    :cond_3
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v4

    move/from16 v0, v17

    if-ge v4, v0, :cond_4

    .line 570
    move/from16 v0, p2

    move-object/from16 v1, p0

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeFrame(ILcom/google/android/exoplayer2/util/ParsableByteArray;ZI)Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    move-result-object v14

    .line 572
    .local v14, "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    if-eqz v14, :cond_3

    .line 573
    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 577
    .end local v14    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :cond_4
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v9, v4, [Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    .line 578
    .local v9, "subFrameArray":[Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 579
    new-instance v4, Lcom/google/android/exoplayer2/metadata/id3/ChapterTocFrame;

    invoke-direct/range {v4 .. v9}, Lcom/google/android/exoplayer2/metadata/id3/ChapterTocFrame;-><init>(Ljava/lang/String;ZZ[Ljava/lang/String;[Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;)V

    return-object v4
.end method

.method private static decodeCommentFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/metadata/id3/CommentFrame;
    .locals 11
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v10, 0x0

    .line 485
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    .line 486
    .local v4, "encoding":I
    invoke-static {v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->getCharsetName(I)Ljava/lang/String;

    move-result-object v0

    .line 488
    .local v0, "charset":Ljava/lang/String;
    new-array v1, v9, [B

    .line 489
    .local v1, "data":[B
    invoke-virtual {p0, v1, v10, v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 490
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v1, v10, v9}, Ljava/lang/String;-><init>([BII)V

    .line 492
    .local v5, "language":Ljava/lang/String;
    add-int/lit8 v9, p1, -0x4

    new-array v1, v9, [B

    .line 493
    add-int/lit8 v9, p1, -0x4

    invoke-virtual {p0, v1, v10, v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 495
    invoke-static {v1, v10, v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfEos([BII)I

    move-result v3

    .line 496
    .local v3, "descriptionEndIndex":I
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1, v10, v3, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 499
    .local v2, "description":Ljava/lang/String;
    invoke-static {v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->delimiterLength(I)I

    move-result v9

    add-int v8, v3, v9

    .line 500
    .local v8, "textStartIndex":I
    array-length v9, v1

    if-ge v8, v9, :cond_0

    .line 501
    invoke-static {v1, v8, v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfEos([BII)I

    move-result v7

    .line 502
    .local v7, "textEndIndex":I
    new-instance v6, Ljava/lang/String;

    sub-int v9, v7, v8

    invoke-direct {v6, v1, v8, v9, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 507
    .end local v7    # "textEndIndex":I
    .local v6, "text":Ljava/lang/String;
    :goto_0
    new-instance v9, Lcom/google/android/exoplayer2/metadata/id3/CommentFrame;

    invoke-direct {v9, v5, v2, v6}, Lcom/google/android/exoplayer2/metadata/id3/CommentFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v9

    .line 504
    .end local v6    # "text":Ljava/lang/String;
    :cond_0
    const-string/jumbo v6, ""

    .restart local v6    # "text":Ljava/lang/String;
    goto :goto_0
.end method

.method private static decodeFrame(ILcom/google/android/exoplayer2/util/ParsableByteArray;ZI)Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    .locals 24
    .param p0, "majorVersion"    # I
    .param p1, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p2, "unsignedIntFrameSizeHack"    # Z
    .param p3, "frameHeaderSize"    # I

    .prologue
    .line 204
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    .line 205
    .local v7, "frameId0":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v8

    .line 206
    .local v8, "frameId1":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v9

    .line 207
    .local v9, "frameId2":I
    const/16 v19, 0x3

    move/from16 v0, p0

    move/from16 v1, v19

    if-lt v0, v1, :cond_1

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v10

    .line 210
    .local v10, "frameId3":I
    :goto_0
    const/16 v19, 0x4

    move/from16 v0, p0

    move/from16 v1, v19

    if-ne v0, v1, :cond_2

    .line 211
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v11

    .line 212
    .local v11, "frameSize":I
    if-nez p2, :cond_0

    .line 213
    and-int/lit16 v0, v11, 0xff

    move/from16 v19, v0

    shr-int/lit8 v20, v11, 0x8

    move/from16 v0, v20

    and-int/lit16 v0, v0, 0xff

    move/from16 v20, v0

    shl-int/lit8 v20, v20, 0x7

    or-int v19, v19, v20

    shr-int/lit8 v20, v11, 0x10

    move/from16 v0, v20

    and-int/lit16 v0, v0, 0xff

    move/from16 v20, v0

    shl-int/lit8 v20, v20, 0xe

    or-int v19, v19, v20

    shr-int/lit8 v20, v11, 0x18

    move/from16 v0, v20

    and-int/lit16 v0, v0, 0xff

    move/from16 v20, v0

    shl-int/lit8 v20, v20, 0x15

    or-int v11, v19, v20

    .line 222
    :cond_0
    :goto_1
    const/16 v19, 0x3

    move/from16 v0, p0

    move/from16 v1, v19

    if-lt v0, v1, :cond_4

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedShort()I

    move-result v5

    .line 223
    .local v5, "flags":I
    :goto_2
    if-nez v7, :cond_5

    if-nez v8, :cond_5

    if-nez v9, :cond_5

    if-nez v10, :cond_5

    if-nez v11, :cond_5

    if-nez v5, :cond_5

    .line 226
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->limit()I

    move-result v19

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 227
    const/4 v6, 0x0

    .line 320
    :goto_3
    return-object v6

    .line 207
    .end local v5    # "flags":I
    .end local v10    # "frameId3":I
    .end local v11    # "frameSize":I
    :cond_1
    const/4 v10, 0x0

    goto :goto_0

    .line 216
    .restart local v10    # "frameId3":I
    :cond_2
    const/16 v19, 0x3

    move/from16 v0, p0

    move/from16 v1, v19

    if-ne v0, v1, :cond_3

    .line 217
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v11

    .restart local v11    # "frameSize":I
    goto :goto_1

    .line 219
    .end local v11    # "frameSize":I
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt24()I

    move-result v11

    .restart local v11    # "frameSize":I
    goto :goto_1

    .line 222
    :cond_4
    const/4 v5, 0x0

    goto :goto_2

    .line 230
    .restart local v5    # "flags":I
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v19

    add-int v18, v19, v11

    .line 231
    .local v18, "nextFramePosition":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->limit()I

    move-result v19

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_6

    .line 232
    const-string/jumbo v19, "Id3Decoder"

    const-string/jumbo v20, "Frame size exceeds remaining tag data"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->limit()I

    move-result v19

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 234
    const/4 v6, 0x0

    goto :goto_3

    .line 238
    :cond_6
    const/4 v15, 0x0

    .line 239
    .local v15, "isCompressed":Z
    const/16 v16, 0x0

    .line 240
    .local v16, "isEncrypted":Z
    const/16 v17, 0x0

    .line 241
    .local v17, "isUnsynchronized":Z
    const/4 v12, 0x0

    .line 242
    .local v12, "hasDataLength":Z
    const/4 v13, 0x0

    .line 243
    .local v13, "hasGroupIdentifier":Z
    const/16 v19, 0x3

    move/from16 v0, p0

    move/from16 v1, v19

    if-ne v0, v1, :cond_c

    .line 244
    and-int/lit16 v0, v5, 0x80

    move/from16 v19, v0

    if-eqz v19, :cond_9

    const/4 v15, 0x1

    .line 245
    :goto_4
    and-int/lit8 v19, v5, 0x40

    if-eqz v19, :cond_a

    const/16 v16, 0x1

    .line 246
    :goto_5
    and-int/lit8 v19, v5, 0x20

    if-eqz v19, :cond_b

    const/4 v13, 0x1

    .line 247
    :goto_6
    move v12, v15

    .line 256
    :cond_7
    :goto_7
    if-nez v15, :cond_8

    if-eqz v16, :cond_12

    .line 257
    :cond_8
    const-string/jumbo v19, "Id3Decoder"

    const-string/jumbo v20, "Skipping unsupported compressed or encrypted frame"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 259
    const/4 v6, 0x0

    goto :goto_3

    .line 244
    :cond_9
    const/4 v15, 0x0

    goto :goto_4

    .line 245
    :cond_a
    const/16 v16, 0x0

    goto :goto_5

    .line 246
    :cond_b
    const/4 v13, 0x0

    goto :goto_6

    .line 248
    :cond_c
    const/16 v19, 0x4

    move/from16 v0, p0

    move/from16 v1, v19

    if-ne v0, v1, :cond_7

    .line 249
    and-int/lit8 v19, v5, 0x40

    if-eqz v19, :cond_d

    const/4 v13, 0x1

    .line 250
    :goto_8
    and-int/lit8 v19, v5, 0x8

    if-eqz v19, :cond_e

    const/4 v15, 0x1

    .line 251
    :goto_9
    and-int/lit8 v19, v5, 0x4

    if-eqz v19, :cond_f

    const/16 v16, 0x1

    .line 252
    :goto_a
    and-int/lit8 v19, v5, 0x2

    if-eqz v19, :cond_10

    const/16 v17, 0x1

    .line 253
    :goto_b
    and-int/lit8 v19, v5, 0x1

    if-eqz v19, :cond_11

    const/4 v12, 0x1

    :goto_c
    goto :goto_7

    .line 249
    :cond_d
    const/4 v13, 0x0

    goto :goto_8

    .line 250
    :cond_e
    const/4 v15, 0x0

    goto :goto_9

    .line 251
    :cond_f
    const/16 v16, 0x0

    goto :goto_a

    .line 252
    :cond_10
    const/16 v17, 0x0

    goto :goto_b

    .line 253
    :cond_11
    const/4 v12, 0x0

    goto :goto_c

    .line 262
    :cond_12
    if-eqz v13, :cond_13

    .line 263
    add-int/lit8 v11, v11, -0x1

    .line 264
    const/16 v19, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 266
    :cond_13
    if-eqz v12, :cond_14

    .line 267
    add-int/lit8 v11, v11, -0x4

    .line 268
    const/16 v19, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 270
    :cond_14
    if-eqz v17, :cond_15

    .line 271
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->removeUnsynchronization(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)I

    move-result v11

    .line 276
    :cond_15
    const/16 v19, 0x54

    move/from16 v0, v19

    if-ne v7, v0, :cond_17

    const/16 v19, 0x58

    move/from16 v0, v19

    if-ne v8, v0, :cond_17

    const/16 v19, 0x58

    move/from16 v0, v19

    if-ne v9, v0, :cond_17

    const/16 v19, 0x2

    move/from16 v0, p0

    move/from16 v1, v19

    if-eq v0, v1, :cond_16

    const/16 v19, 0x58

    move/from16 v0, v19

    if-ne v10, v0, :cond_17

    .line 278
    :cond_16
    :try_start_0
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeTxxxFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v6

    .line 320
    .local v6, "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :goto_d
    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    goto/16 :goto_3

    .line 279
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :cond_17
    const/16 v19, 0x54

    move/from16 v0, v19

    if-ne v7, v0, :cond_19

    .line 280
    const/16 v19, 0x2

    move/from16 v0, p0

    move/from16 v1, v19

    if-ne v0, v1, :cond_18

    :try_start_1
    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v20, "%c%c%c"

    const/16 v21, 0x3

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    .line 281
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v19 .. v21}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 283
    .local v14, "id":Ljava/lang/String;
    :goto_e
    move-object/from16 v0, p1

    invoke-static {v0, v11, v14}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeTextInformationFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;

    move-result-object v6

    .line 284
    .restart local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    goto :goto_d

    .line 281
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    .end local v14    # "id":Ljava/lang/String;
    :cond_18
    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v20, "%c%c%c%c"

    const/16 v21, 0x4

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    .line 282
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x3

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v19 .. v21}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    goto :goto_e

    .line 284
    :cond_19
    const/16 v19, 0x57

    move/from16 v0, v19

    if-ne v7, v0, :cond_1b

    const/16 v19, 0x58

    move/from16 v0, v19

    if-ne v8, v0, :cond_1b

    const/16 v19, 0x58

    move/from16 v0, v19

    if-ne v9, v0, :cond_1b

    const/16 v19, 0x2

    move/from16 v0, p0

    move/from16 v1, v19

    if-eq v0, v1, :cond_1a

    const/16 v19, 0x58

    move/from16 v0, v19

    if-ne v10, v0, :cond_1b

    .line 286
    :cond_1a
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeWxxxFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;

    move-result-object v6

    .restart local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    goto/16 :goto_d

    .line 287
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :cond_1b
    const/16 v19, 0x57

    move/from16 v0, v19

    if-ne v7, v0, :cond_1d

    .line 288
    const/16 v19, 0x2

    move/from16 v0, p0

    move/from16 v1, v19

    if-ne v0, v1, :cond_1c

    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v20, "%c%c%c"

    const/16 v21, 0x3

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    .line 289
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v19 .. v21}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 291
    .restart local v14    # "id":Ljava/lang/String;
    :goto_f
    move-object/from16 v0, p1

    invoke-static {v0, v11, v14}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeUrlLinkFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;

    move-result-object v6

    .line 292
    .restart local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    goto/16 :goto_d

    .line 289
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    .end local v14    # "id":Ljava/lang/String;
    :cond_1c
    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v20, "%c%c%c%c"

    const/16 v21, 0x4

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    .line 290
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x3

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v19 .. v21}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    goto :goto_f

    .line 292
    :cond_1d
    const/16 v19, 0x50

    move/from16 v0, v19

    if-ne v7, v0, :cond_1e

    const/16 v19, 0x52

    move/from16 v0, v19

    if-ne v8, v0, :cond_1e

    const/16 v19, 0x49

    move/from16 v0, v19

    if-ne v9, v0, :cond_1e

    const/16 v19, 0x56

    move/from16 v0, v19

    if-ne v10, v0, :cond_1e

    .line 293
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodePrivFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;

    move-result-object v6

    .restart local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    goto/16 :goto_d

    .line 294
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :cond_1e
    const/16 v19, 0x47

    move/from16 v0, v19

    if-ne v7, v0, :cond_20

    const/16 v19, 0x45

    move/from16 v0, v19

    if-ne v8, v0, :cond_20

    const/16 v19, 0x4f

    move/from16 v0, v19

    if-ne v9, v0, :cond_20

    const/16 v19, 0x42

    move/from16 v0, v19

    if-eq v10, v0, :cond_1f

    const/16 v19, 0x2

    move/from16 v0, p0

    move/from16 v1, v19

    if-ne v0, v1, :cond_20

    .line 296
    :cond_1f
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeGeobFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/metadata/id3/GeobFrame;

    move-result-object v6

    .restart local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    goto/16 :goto_d

    .line 297
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :cond_20
    const/16 v19, 0x2

    move/from16 v0, p0

    move/from16 v1, v19

    if-ne v0, v1, :cond_22

    const/16 v19, 0x50

    move/from16 v0, v19

    if-ne v7, v0, :cond_23

    const/16 v19, 0x49

    move/from16 v0, v19

    if-ne v8, v0, :cond_23

    const/16 v19, 0x43

    move/from16 v0, v19

    if-ne v9, v0, :cond_23

    .line 299
    :cond_21
    move-object/from16 v0, p1

    move/from16 v1, p0

    invoke-static {v0, v11, v1}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeApicFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;II)Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;

    move-result-object v6

    .restart local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    goto/16 :goto_d

    .line 297
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :cond_22
    const/16 v19, 0x41

    move/from16 v0, v19

    if-ne v7, v0, :cond_23

    const/16 v19, 0x50

    move/from16 v0, v19

    if-ne v8, v0, :cond_23

    const/16 v19, 0x49

    move/from16 v0, v19

    if-ne v9, v0, :cond_23

    const/16 v19, 0x43

    move/from16 v0, v19

    if-eq v10, v0, :cond_21

    .line 300
    :cond_23
    const/16 v19, 0x43

    move/from16 v0, v19

    if-ne v7, v0, :cond_25

    const/16 v19, 0x4f

    move/from16 v0, v19

    if-ne v8, v0, :cond_25

    const/16 v19, 0x4d

    move/from16 v0, v19

    if-ne v9, v0, :cond_25

    const/16 v19, 0x4d

    move/from16 v0, v19

    if-eq v10, v0, :cond_24

    const/16 v19, 0x2

    move/from16 v0, p0

    move/from16 v1, v19

    if-ne v0, v1, :cond_25

    .line 302
    :cond_24
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeCommentFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/metadata/id3/CommentFrame;

    move-result-object v6

    .restart local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    goto/16 :goto_d

    .line 303
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :cond_25
    const/16 v19, 0x43

    move/from16 v0, v19

    if-ne v7, v0, :cond_26

    const/16 v19, 0x48

    move/from16 v0, v19

    if-ne v8, v0, :cond_26

    const/16 v19, 0x41

    move/from16 v0, v19

    if-ne v9, v0, :cond_26

    const/16 v19, 0x50

    move/from16 v0, v19

    if-ne v10, v0, :cond_26

    .line 304
    move-object/from16 v0, p1

    move/from16 v1, p0

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-static {v0, v11, v1, v2, v3}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeChapterFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;IIZI)Lcom/google/android/exoplayer2/metadata/id3/ChapterFrame;

    move-result-object v6

    .restart local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    goto/16 :goto_d

    .line 306
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :cond_26
    const/16 v19, 0x43

    move/from16 v0, v19

    if-ne v7, v0, :cond_27

    const/16 v19, 0x54

    move/from16 v0, v19

    if-ne v8, v0, :cond_27

    const/16 v19, 0x4f

    move/from16 v0, v19

    if-ne v9, v0, :cond_27

    const/16 v19, 0x43

    move/from16 v0, v19

    if-ne v10, v0, :cond_27

    .line 307
    move-object/from16 v0, p1

    move/from16 v1, p0

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-static {v0, v11, v1, v2, v3}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeChapterTOCFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;IIZI)Lcom/google/android/exoplayer2/metadata/id3/ChapterTocFrame;

    move-result-object v6

    .restart local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    goto/16 :goto_d

    .line 310
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    :cond_27
    const/16 v19, 0x2

    move/from16 v0, p0

    move/from16 v1, v19

    if-ne v0, v1, :cond_28

    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v20, "%c%c%c"

    const/16 v21, 0x3

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    .line 311
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v19 .. v21}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 313
    .restart local v14    # "id":Ljava/lang/String;
    :goto_10
    move-object/from16 v0, p1

    invoke-static {v0, v11, v14}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeBinaryFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/BinaryFrame;

    move-result-object v6

    .restart local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    goto/16 :goto_d

    .line 311
    .end local v6    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    .end local v14    # "id":Ljava/lang/String;
    :cond_28
    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v20, "%c%c%c%c"

    const/16 v21, 0x4

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    .line 312
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x3

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v19 .. v21}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v14

    goto :goto_10

    .line 316
    :catch_0
    move-exception v4

    .line 317
    .local v4, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_2
    const-string/jumbo v19, "Id3Decoder"

    const-string/jumbo v20, "Unsupported character encoding"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 318
    const/4 v6, 0x0

    .line 320
    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    goto/16 :goto_3

    .end local v4    # "e":Ljava/io/UnsupportedEncodingException;
    :catchall_0
    move-exception v19

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    throw v19
.end method

.method private static decodeGeobFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/metadata/id3/GeobFrame;
    .locals 15
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 421
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    .line 422
    .local v5, "encoding":I
    invoke-static {v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->getCharsetName(I)Ljava/lang/String;

    move-result-object v0

    .line 424
    .local v0, "charset":Ljava/lang/String;
    add-int/lit8 v13, p1, -0x1

    new-array v1, v13, [B

    .line 425
    .local v1, "data":[B
    const/4 v13, 0x0

    add-int/lit8 v14, p1, -0x1

    invoke-virtual {p0, v1, v13, v14}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 427
    const/4 v13, 0x0

    invoke-static {v1, v13}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfZeroByte([BI)I

    move-result v10

    .line 428
    .local v10, "mimeTypeEndIndex":I
    new-instance v9, Ljava/lang/String;

    const/4 v13, 0x0

    const-string/jumbo v14, "ISO-8859-1"

    invoke-direct {v9, v1, v13, v10, v14}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 430
    .local v9, "mimeType":Ljava/lang/String;
    add-int/lit8 v8, v10, 0x1

    .line 431
    .local v8, "filenameStartIndex":I
    invoke-static {v1, v8, v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfEos([BII)I

    move-result v7

    .line 432
    .local v7, "filenameEndIndex":I
    new-instance v6, Ljava/lang/String;

    sub-int v13, v7, v8

    invoke-direct {v6, v1, v8, v13, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 435
    .local v6, "filename":Ljava/lang/String;
    invoke-static {v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->delimiterLength(I)I

    move-result v13

    add-int v4, v7, v13

    .line 436
    .local v4, "descriptionStartIndex":I
    invoke-static {v1, v4, v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfEos([BII)I

    move-result v3

    .line 437
    .local v3, "descriptionEndIndex":I
    new-instance v2, Ljava/lang/String;

    sub-int v13, v3, v4

    invoke-direct {v2, v1, v4, v13, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 440
    .local v2, "description":Ljava/lang/String;
    invoke-static {v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->delimiterLength(I)I

    move-result v13

    add-int v12, v3, v13

    .line 441
    .local v12, "objectDataStartIndex":I
    array-length v13, v1

    invoke-static {v1, v12, v13}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v11

    .line 443
    .local v11, "objectData":[B
    new-instance v13, Lcom/google/android/exoplayer2/metadata/id3/GeobFrame;

    invoke-direct {v13, v9, v6, v2, v11}, Lcom/google/android/exoplayer2/metadata/id3/GeobFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V

    return-object v13
.end method

.method private static decodeHeader(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;
    .locals 14
    .param p0, "data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    const/4 v13, 0x4

    const/4 v10, 0x0

    const/4 v9, 0x0

    const/4 v7, 0x1

    .line 111
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v11

    const/16 v12, 0xa

    if-ge v11, v12, :cond_0

    .line 112
    const-string/jumbo v9, "Id3Decoder"

    const-string/jumbo v11, "Data too short to be an ID3 tag"

    invoke-static {v9, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v9, v10

    .line 158
    :goto_0
    return-object v9

    .line 116
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt24()I

    move-result v5

    .line 117
    .local v5, "id":I
    sget v11, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->ID3_TAG:I

    if-eq v5, v11, :cond_1

    .line 118
    const-string/jumbo v9, "Id3Decoder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Unexpected first three bytes of ID3 tag header: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v9, v10

    .line 119
    goto :goto_0

    .line 122
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v8

    .line 123
    .local v8, "majorVersion":I
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 124
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    .line 125
    .local v1, "flags":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readSynchSafeInt()I

    move-result v2

    .line 127
    .local v2, "framesSize":I
    const/4 v11, 0x2

    if-ne v8, v11, :cond_3

    .line 128
    and-int/lit8 v11, v1, 0x40

    if-eqz v11, :cond_2

    move v6, v7

    .line 129
    .local v6, "isCompressed":Z
    :goto_1
    if-eqz v6, :cond_4

    .line 130
    const-string/jumbo v9, "Id3Decoder"

    const-string/jumbo v11, "Skipped ID3 tag with majorVersion=2 and undefined compression scheme"

    invoke-static {v9, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v9, v10

    .line 131
    goto :goto_0

    .end local v6    # "isCompressed":Z
    :cond_2
    move v6, v9

    .line 128
    goto :goto_1

    .line 133
    :cond_3
    const/4 v11, 0x3

    if-ne v8, v11, :cond_6

    .line 134
    and-int/lit8 v10, v1, 0x40

    if-eqz v10, :cond_5

    move v3, v7

    .line 135
    .local v3, "hasExtendedHeader":Z
    :goto_2
    if-eqz v3, :cond_4

    .line 136
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 137
    .local v0, "extendedHeaderSize":I
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 138
    add-int/lit8 v10, v0, 0x4

    sub-int/2addr v2, v10

    .line 157
    .end local v0    # "extendedHeaderSize":I
    .end local v3    # "hasExtendedHeader":Z
    :cond_4
    :goto_3
    if-ge v8, v13, :cond_b

    and-int/lit16 v10, v1, 0x80

    if-eqz v10, :cond_b

    .line 158
    .local v7, "isUnsynchronized":Z
    :goto_4
    new-instance v9, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;

    invoke-direct {v9, v8, v7, v2}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;-><init>(IZI)V

    goto :goto_0

    .end local v7    # "isUnsynchronized":Z
    :cond_5
    move v3, v9

    .line 134
    goto :goto_2

    .line 140
    :cond_6
    if-ne v8, v13, :cond_a

    .line 141
    and-int/lit8 v10, v1, 0x40

    if-eqz v10, :cond_8

    move v3, v7

    .line 142
    .restart local v3    # "hasExtendedHeader":Z
    :goto_5
    if-eqz v3, :cond_7

    .line 143
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readSynchSafeInt()I

    move-result v0

    .line 144
    .restart local v0    # "extendedHeaderSize":I
    add-int/lit8 v10, v0, -0x4

    invoke-virtual {p0, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 145
    sub-int/2addr v2, v0

    .line 147
    .end local v0    # "extendedHeaderSize":I
    :cond_7
    and-int/lit8 v10, v1, 0x10

    if-eqz v10, :cond_9

    move v4, v7

    .line 148
    .local v4, "hasFooter":Z
    :goto_6
    if-eqz v4, :cond_4

    .line 149
    add-int/lit8 v2, v2, -0xa

    goto :goto_3

    .end local v3    # "hasExtendedHeader":Z
    .end local v4    # "hasFooter":Z
    :cond_8
    move v3, v9

    .line 141
    goto :goto_5

    .restart local v3    # "hasExtendedHeader":Z
    :cond_9
    move v4, v9

    .line 147
    goto :goto_6

    .line 152
    .end local v3    # "hasExtendedHeader":Z
    :cond_a
    const-string/jumbo v9, "Id3Decoder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Skipped ID3 tag with unsupported majorVersion="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v9, v10

    .line 153
    goto/16 :goto_0

    :cond_b
    move v7, v9

    .line 157
    goto :goto_4
.end method

.method private static decodePrivFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;
    .locals 7
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 407
    new-array v0, p1, [B

    .line 408
    .local v0, "data":[B
    invoke-virtual {p0, v0, v6, p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 410
    invoke-static {v0, v6}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfZeroByte([BI)I

    move-result v2

    .line 411
    .local v2, "ownerEndIndex":I
    new-instance v1, Ljava/lang/String;

    const-string/jumbo v5, "ISO-8859-1"

    invoke-direct {v1, v0, v6, v2, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 413
    .local v1, "owner":Ljava/lang/String;
    add-int/lit8 v4, v2, 0x1

    .line 414
    .local v4, "privateDataStartIndex":I
    array-length v5, v0

    invoke-static {v0, v4, v5}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v3

    .line 416
    .local v3, "privateData":[B
    new-instance v5, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;

    invoke-direct {v5, v1, v3}, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;-><init>(Ljava/lang/String;[B)V

    return-object v5
.end method

.method private static decodeTextInformationFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;
    .locals 8
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .param p2, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 349
    const/4 v5, 0x1

    if-gt p1, v5, :cond_0

    .line 351
    new-instance v5, Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;

    const-string/jumbo v6, ""

    invoke-direct {v5, p2, v7, v6}, Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    :goto_0
    return-object v5

    .line 354
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v2

    .line 355
    .local v2, "encoding":I
    invoke-static {v2}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->getCharsetName(I)Ljava/lang/String;

    move-result-object v0

    .line 357
    .local v0, "charset":Ljava/lang/String;
    add-int/lit8 v5, p1, -0x1

    new-array v1, v5, [B

    .line 358
    .local v1, "data":[B
    add-int/lit8 v5, p1, -0x1

    invoke-virtual {p0, v1, v6, v5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 360
    invoke-static {v1, v6, v2}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfEos([BII)I

    move-result v4

    .line 361
    .local v4, "valueEndIndex":I
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1, v6, v4, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 363
    .local v3, "value":Ljava/lang/String;
    new-instance v5, Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;

    invoke-direct {v5, p2, v7, v3}, Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static decodeTxxxFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;
    .locals 10
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 326
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    .line 327
    .local v4, "encoding":I
    invoke-static {v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->getCharsetName(I)Ljava/lang/String;

    move-result-object v0

    .line 329
    .local v0, "charset":Ljava/lang/String;
    add-int/lit8 v8, p1, -0x1

    new-array v1, v8, [B

    .line 330
    .local v1, "data":[B
    add-int/lit8 v8, p1, -0x1

    invoke-virtual {p0, v1, v9, v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 332
    invoke-static {v1, v9, v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfEos([BII)I

    move-result v3

    .line 333
    .local v3, "descriptionEndIndex":I
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1, v9, v3, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 336
    .local v2, "description":Ljava/lang/String;
    invoke-static {v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->delimiterLength(I)I

    move-result v8

    add-int v7, v3, v8

    .line 337
    .local v7, "valueStartIndex":I
    array-length v8, v1

    if-ge v7, v8, :cond_0

    .line 338
    invoke-static {v1, v7, v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfEos([BII)I

    move-result v6

    .line 339
    .local v6, "valueEndIndex":I
    new-instance v5, Ljava/lang/String;

    sub-int v8, v6, v7

    invoke-direct {v5, v1, v7, v8, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 344
    .end local v6    # "valueEndIndex":I
    .local v5, "value":Ljava/lang/String;
    :goto_0
    new-instance v8, Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;

    const-string/jumbo v9, "TXXX"

    invoke-direct {v8, v9, v2, v5}, Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v8

    .line 341
    .end local v5    # "value":Ljava/lang/String;
    :cond_0
    const-string/jumbo v5, ""

    .restart local v5    # "value":Ljava/lang/String;
    goto :goto_0
.end method

.method private static decodeUrlLinkFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;
    .locals 6
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .param p2, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 391
    if-nez p1, :cond_0

    .line 393
    new-instance v3, Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;

    const-string/jumbo v4, ""

    invoke-direct {v3, p2, v5, v4}, Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    :goto_0
    return-object v3

    .line 396
    :cond_0
    new-array v0, p1, [B

    .line 397
    .local v0, "data":[B
    invoke-virtual {p0, v0, v4, p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 399
    invoke-static {v0, v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfZeroByte([BI)I

    move-result v2

    .line 400
    .local v2, "urlEndIndex":I
    new-instance v1, Ljava/lang/String;

    const-string/jumbo v3, "ISO-8859-1"

    invoke-direct {v1, v0, v4, v2, v3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 402
    .local v1, "url":Ljava/lang/String;
    new-instance v3, Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;

    invoke-direct {v3, p2, v5, v1}, Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static decodeWxxxFrame(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;
    .locals 10
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "frameSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 368
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    .line 369
    .local v4, "encoding":I
    invoke-static {v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->getCharsetName(I)Ljava/lang/String;

    move-result-object v0

    .line 371
    .local v0, "charset":Ljava/lang/String;
    add-int/lit8 v8, p1, -0x1

    new-array v1, v8, [B

    .line 372
    .local v1, "data":[B
    add-int/lit8 v8, p1, -0x1

    invoke-virtual {p0, v1, v9, v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 374
    invoke-static {v1, v9, v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfEos([BII)I

    move-result v3

    .line 375
    .local v3, "descriptionEndIndex":I
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1, v9, v3, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 378
    .local v2, "description":Ljava/lang/String;
    invoke-static {v4}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->delimiterLength(I)I

    move-result v8

    add-int v7, v3, v8

    .line 379
    .local v7, "urlStartIndex":I
    array-length v8, v1

    if-ge v7, v8, :cond_0

    .line 380
    invoke-static {v1, v7}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfZeroByte([BI)I

    move-result v6

    .line 381
    .local v6, "urlEndIndex":I
    new-instance v5, Ljava/lang/String;

    sub-int v8, v6, v7

    const-string/jumbo v9, "ISO-8859-1"

    invoke-direct {v5, v1, v7, v8, v9}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 386
    .end local v6    # "urlEndIndex":I
    .local v5, "url":Ljava/lang/String;
    :goto_0
    new-instance v8, Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;

    const-string/jumbo v9, "WXXX"

    invoke-direct {v8, v9, v2, v5}, Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v8

    .line 383
    .end local v5    # "url":Ljava/lang/String;
    :cond_0
    const-string/jumbo v5, ""

    .restart local v5    # "url":Ljava/lang/String;
    goto :goto_0
.end method

.method private static delimiterLength(I)I
    .locals 1
    .param p0, "encodingByte"    # I

    .prologue
    .line 659
    if-eqz p0, :cond_0

    const/4 v0, 0x3

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x2

    goto :goto_0
.end method

.method private static getCharsetName(I)Ljava/lang/String;
    .locals 1
    .param p0, "encodingByte"    # I

    .prologue
    .line 616
    packed-switch p0, :pswitch_data_0

    .line 626
    const-string/jumbo v0, "ISO-8859-1"

    :goto_0
    return-object v0

    .line 618
    :pswitch_0
    const-string/jumbo v0, "ISO-8859-1"

    goto :goto_0

    .line 620
    :pswitch_1
    const-string/jumbo v0, "UTF-16"

    goto :goto_0

    .line 622
    :pswitch_2
    const-string/jumbo v0, "UTF-16BE"

    goto :goto_0

    .line 624
    :pswitch_3
    const-string/jumbo v0, "UTF-8"

    goto :goto_0

    .line 616
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static indexOfEos([BII)I
    .locals 2
    .param p0, "data"    # [B
    .param p1, "fromIndex"    # I
    .param p2, "encoding"    # I

    .prologue
    .line 631
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfZeroByte([BI)I

    move-result v0

    .line 634
    .local v0, "terminationPos":I
    if-eqz p2, :cond_0

    const/4 v1, 0x3

    if-ne p2, v1, :cond_2

    :cond_0
    move v1, v0

    .line 646
    :goto_0
    return v1

    .line 643
    :cond_1
    add-int/lit8 v1, v0, 0x1

    invoke-static {p0, v1}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->indexOfZeroByte([BI)I

    move-result v0

    .line 639
    :cond_2
    array-length v1, p0

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_3

    .line 640
    rem-int/lit8 v1, v0, 0x2

    if-nez v1, :cond_1

    add-int/lit8 v1, v0, 0x1

    aget-byte v1, p0, v1

    if-nez v1, :cond_1

    move v1, v0

    .line 641
    goto :goto_0

    .line 646
    :cond_3
    array-length v1, p0

    goto :goto_0
.end method

.method private static indexOfZeroByte([BI)I
    .locals 2
    .param p0, "data"    # [B
    .param p1, "fromIndex"    # I

    .prologue
    .line 650
    move v0, p1

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 651
    aget-byte v1, p0, v0

    if-nez v1, :cond_0

    .line 655
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 650
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 655
    :cond_1
    array-length v0, p0

    goto :goto_1
.end method

.method private static removeUnsynchronization(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)I
    .locals 5
    .param p0, "data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "length"    # I

    .prologue
    .line 599
    iget-object v0, p0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    .line 600
    .local v0, "bytes":[B
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v1

    .local v1, "i":I
    :goto_0
    add-int/lit8 v2, v1, 0x1

    if-ge v2, p1, :cond_1

    .line 601
    aget-byte v2, v0, v1

    and-int/lit16 v2, v2, 0xff

    const/16 v3, 0xff

    if-ne v2, v3, :cond_0

    add-int/lit8 v2, v1, 0x1

    aget-byte v2, v0, v2

    if-nez v2, :cond_0

    .line 602
    add-int/lit8 v2, v1, 0x2

    add-int/lit8 v3, v1, 0x1

    sub-int v4, p1, v1

    add-int/lit8 v4, v4, -0x2

    invoke-static {v0, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 603
    add-int/lit8 p1, p1, -0x1

    .line 600
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 606
    :cond_1
    return p1
.end method

.method private static validateV4Frames(Lcom/google/android/exoplayer2/util/ParsableByteArray;Z)Z
    .locals 12
    .param p0, "id3Data"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "unsignedIntFrameSizeHack"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 163
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v4

    .line 165
    .local v4, "startPosition":I
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v7

    const/16 v8, 0xa

    if-lt v7, v8, :cond_7

    .line 166
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 167
    .local v2, "id":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    .line 168
    .local v1, "frameSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedShort()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 169
    .local v0, "flags":I
    if-nez v2, :cond_0

    if-nez v1, :cond_0

    if-nez v0, :cond_0

    .line 198
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .end local v0    # "flags":I
    .end local v1    # "frameSize":I
    .end local v2    # "id":I
    :goto_1
    return v5

    .line 172
    .restart local v0    # "flags":I
    .restart local v1    # "frameSize":I
    .restart local v2    # "id":I
    :cond_0
    if-nez p1, :cond_2

    .line 174
    int-to-long v8, v1

    const-wide/32 v10, 0x808080

    and-long/2addr v8, v10

    const-wide/16 v10, 0x0

    cmp-long v7, v8, v10

    if-eqz v7, :cond_1

    .line 198
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    move v5, v6

    goto :goto_1

    .line 177
    :cond_1
    and-int/lit16 v7, v1, 0xff

    shr-int/lit8 v8, v1, 0x8

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x7

    or-int/2addr v7, v8

    shr-int/lit8 v8, v1, 0x10

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0xe

    or-int/2addr v7, v8

    shr-int/lit8 v8, v1, 0x18

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x15

    or-int v1, v7, v8

    .line 180
    :cond_2
    const/4 v3, 0x0

    .line 181
    .local v3, "minimumFrameSize":I
    and-int/lit8 v7, v0, 0x40

    if-eqz v7, :cond_3

    .line 182
    add-int/lit8 v3, v3, 0x1

    .line 184
    :cond_3
    and-int/lit8 v7, v0, 0x1

    if-eqz v7, :cond_4

    .line 185
    add-int/lit8 v3, v3, 0x4

    .line 187
    :cond_4
    if-ge v1, v3, :cond_5

    .line 198
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    move v5, v6

    goto :goto_1

    .line 190
    :cond_5
    :try_start_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v7

    if-ge v7, v1, :cond_6

    .line 198
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    move v5, v6

    goto :goto_1

    .line 193
    :cond_6
    :try_start_2
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 198
    .end local v0    # "flags":I
    .end local v1    # "frameSize":I
    .end local v2    # "id":I
    .end local v3    # "minimumFrameSize":I
    :catchall_0
    move-exception v5

    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    throw v5

    :cond_7
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    goto :goto_1
.end method


# virtual methods
.method public decode(Lcom/google/android/exoplayer2/metadata/MetadataInputBuffer;)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 3
    .param p1, "inputBuffer"    # Lcom/google/android/exoplayer2/metadata/MetadataInputBuffer;

    .prologue
    .line 55
    iget-object v0, p1, Lcom/google/android/exoplayer2/metadata/MetadataInputBuffer;->data:Ljava/nio/ByteBuffer;

    .line 56
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decode([BI)Lcom/google/android/exoplayer2/metadata/Metadata;

    move-result-object v1

    return-object v1
.end method

.method public decode([BI)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 11
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    const/4 v8, 0x0

    .line 67
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .local v4, "id3Frames":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;>;"
    new-instance v3, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-direct {v3, p1, p2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>([BI)V

    .line 70
    .local v3, "id3Data":Lcom/google/android/exoplayer2/util/ParsableByteArray;
    invoke-static {v3}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeHeader(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;

    move-result-object v5

    .line 71
    .local v5, "id3Header":Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;
    if-nez v5, :cond_0

    .line 103
    :goto_0
    return-object v8

    .line 75
    :cond_0
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v6

    .line 76
    .local v6, "startPosition":I
    invoke-static {v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;->access$000(Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;)I

    move-result v2

    .line 77
    .local v2, "framesSize":I
    invoke-static {v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;->access$100(Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 78
    invoke-static {v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;->access$000(Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;)I

    move-result v9

    invoke-static {v3, v9}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->removeUnsynchronization(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)I

    move-result v2

    .line 80
    :cond_1
    add-int v9, v6, v2

    invoke-virtual {v3, v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setLimit(I)V

    .line 82
    const/4 v7, 0x0

    .line 83
    .local v7, "unsignedIntFrameSizeHack":Z
    invoke-static {v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;->access$200(Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;)I

    move-result v9

    const/4 v10, 0x4

    if-ne v9, v10, :cond_2

    .line 84
    const/4 v9, 0x0

    invoke-static {v3, v9}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->validateV4Frames(Lcom/google/android/exoplayer2/util/ParsableByteArray;Z)Z

    move-result v9

    if-nez v9, :cond_2

    .line 85
    const/4 v9, 0x1

    invoke-static {v3, v9}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->validateV4Frames(Lcom/google/android/exoplayer2/util/ParsableByteArray;Z)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 86
    const/4 v7, 0x1

    .line 94
    :cond_2
    invoke-static {v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;->access$200(Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;)I

    move-result v8

    const/4 v9, 0x2

    if-ne v8, v9, :cond_5

    const/4 v1, 0x6

    .line 95
    .local v1, "frameHeaderSize":I
    :cond_3
    :goto_1
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v8

    if-lt v8, v1, :cond_6

    .line 96
    invoke-static {v5}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;->access$200(Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder$Id3Header;)I

    move-result v8

    invoke-static {v8, v3, v7, v1}, Lcom/google/android/exoplayer2/metadata/id3/Id3Decoder;->decodeFrame(ILcom/google/android/exoplayer2/util/ParsableByteArray;ZI)Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    move-result-object v0

    .line 98
    .local v0, "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    if-eqz v0, :cond_3

    .line 99
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 88
    .end local v0    # "frame":Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    .end local v1    # "frameHeaderSize":I
    :cond_4
    const-string/jumbo v9, "Id3Decoder"

    const-string/jumbo v10, "Failed to validate V4 ID3 tag"

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 94
    :cond_5
    const/16 v1, 0xa

    goto :goto_1

    .line 103
    .restart local v1    # "frameHeaderSize":I
    :cond_6
    new-instance v8, Lcom/google/android/exoplayer2/metadata/Metadata;

    invoke-direct {v8, v4}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>(Ljava/util/List;)V

    goto :goto_0
.end method
