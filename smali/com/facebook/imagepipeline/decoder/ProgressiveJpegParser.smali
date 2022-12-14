.class public Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;
.super Ljava/lang/Object;
.source "ProgressiveJpegParser.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x4000

.field private static final NOT_A_JPEG:I = 0x6

.field private static final READ_FIRST_JPEG_BYTE:I = 0x0

.field private static final READ_MARKER_FIRST_BYTE_OR_ENTROPY_DATA:I = 0x2

.field private static final READ_MARKER_SECOND_BYTE:I = 0x3

.field private static final READ_SECOND_JPEG_BYTE:I = 0x1

.field private static final READ_SIZE_FIRST_BYTE:I = 0x4

.field private static final READ_SIZE_SECOND_BYTE:I = 0x5


# instance fields
.field private mBestScanEndOffset:I

.field private mBestScanNumber:I

.field private final mByteArrayPool:Lcom/facebook/imagepipeline/memory/ByteArrayPool;

.field private mBytesParsed:I

.field private mLastByteRead:I

.field private mNextFullScanNumber:I

.field private mParserState:I


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/memory/ByteArrayPool;)V
    .locals 2
    .param p1, "byteArrayPool"    # Lcom/facebook/imagepipeline/memory/ByteArrayPool;

    .prologue
    const/4 v1, 0x0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/memory/ByteArrayPool;

    iput-object v0, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mByteArrayPool:Lcom/facebook/imagepipeline/memory/ByteArrayPool;

    .line 97
    iput v1, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBytesParsed:I

    .line 98
    iput v1, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mLastByteRead:I

    .line 99
    iput v1, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mNextFullScanNumber:I

    .line 100
    iput v1, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBestScanEndOffset:I

    .line 101
    iput v1, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBestScanNumber:I

    .line 102
    iput v1, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    .line 104
    return-void
.end method

.method private doParseMoreData(Ljava/io/InputStream;)Z
    .locals 12
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    const/16 v11, 0xff

    const/4 v10, 0x6

    .line 153
    iget v3, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBestScanNumber:I

    .line 156
    .local v3, "oldBestScanNumber":I
    :goto_0
    :try_start_0
    iget v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    if-eq v7, v10, :cond_1

    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v2

    .local v2, "nextByte":I
    const/4 v7, -0x1

    if-eq v2, v7, :cond_1

    .line 157
    iget v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBytesParsed:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBytesParsed:I

    .line 159
    iget v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    packed-switch v7, :pswitch_data_0

    .line 218
    const/4 v7, 0x0

    invoke-static {v7}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    .line 221
    :cond_0
    :goto_1
    iput v2, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mLastByteRead:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 223
    .end local v2    # "nextByte":I
    :catch_0
    move-exception v1

    .line 225
    .local v1, "ioe":Ljava/io/IOException;
    invoke-static {v1}, Lcom/facebook/common/internal/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    .line 227
    .end local v1    # "ioe":Ljava/io/IOException;
    :cond_1
    iget v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    if-eq v7, v10, :cond_9

    iget v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBestScanNumber:I

    if-eq v7, v3, :cond_9

    :goto_2
    return v5

    .line 161
    .restart local v2    # "nextByte":I
    :pswitch_0
    if-ne v2, v11, :cond_2

    .line 162
    const/4 v7, 0x1

    :try_start_1
    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    goto :goto_1

    .line 164
    :cond_2
    const/4 v7, 0x6

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    goto :goto_1

    .line 169
    :pswitch_1
    const/16 v7, 0xd8

    if-ne v2, v7, :cond_3

    .line 170
    const/4 v7, 0x2

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    goto :goto_1

    .line 172
    :cond_3
    const/4 v7, 0x6

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    goto :goto_1

    .line 177
    :pswitch_2
    if-ne v2, v11, :cond_0

    .line 178
    const/4 v7, 0x3

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    goto :goto_1

    .line 183
    :pswitch_3
    if-ne v2, v11, :cond_4

    .line 184
    const/4 v7, 0x3

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    goto :goto_1

    .line 185
    :cond_4
    if-nez v2, :cond_5

    .line 186
    const/4 v7, 0x2

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    goto :goto_1

    .line 188
    :cond_5
    const/16 v7, 0xda

    if-eq v2, v7, :cond_6

    const/16 v7, 0xd9

    if-ne v2, v7, :cond_7

    .line 189
    :cond_6
    iget v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBytesParsed:I

    add-int/lit8 v7, v7, -0x2

    invoke-direct {p0, v7}, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->newScanOrImageEndFound(I)V

    .line 192
    :cond_7
    invoke-static {v2}, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->doesMarkerStartSegment(I)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 193
    const/4 v7, 0x4

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    goto :goto_1

    .line 195
    :cond_8
    const/4 v7, 0x2

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    goto :goto_1

    .line 201
    :pswitch_4
    const/4 v7, 0x5

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    goto :goto_1

    .line 205
    :pswitch_5
    iget v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mLastByteRead:I

    shl-int/lit8 v7, v7, 0x8

    add-int v4, v7, v2

    .line 210
    .local v4, "size":I
    add-int/lit8 v0, v4, -0x2

    .line 211
    .local v0, "bytesToSkip":I
    int-to-long v8, v0

    invoke-static {p1, v8, v9}, Lcom/facebook/common/util/StreamUtil;->skip(Ljava/io/InputStream;J)J

    .line 212
    iget v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBytesParsed:I

    add-int/2addr v7, v0

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBytesParsed:I

    .line 213
    const/4 v7, 0x2

    iput v7, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .end local v0    # "bytesToSkip":I
    .end local v2    # "nextByte":I
    .end local v4    # "size":I
    :cond_9
    move v5, v6

    .line 227
    goto :goto_2

    .line 159
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private static doesMarkerStartSegment(I)Z
    .locals 3
    .param p0, "markerSecondByte"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 234
    if-ne p0, v0, :cond_1

    .line 242
    :cond_0
    :goto_0
    return v1

    .line 238
    :cond_1
    const/16 v2, 0xd0

    if-lt p0, v2, :cond_2

    const/16 v2, 0xd7

    if-le p0, v2, :cond_0

    .line 242
    :cond_2
    const/16 v2, 0xd9

    if-eq p0, v2, :cond_3

    const/16 v2, 0xd8

    if-eq p0, v2, :cond_3

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1
.end method

.method private newScanOrImageEndFound(I)V
    .locals 2
    .param p1, "offset"    # I

    .prologue
    .line 246
    iget v0, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mNextFullScanNumber:I

    if-lez v0, :cond_0

    .line 247
    iput p1, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBestScanEndOffset:I

    .line 249
    :cond_0
    iget v0, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mNextFullScanNumber:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mNextFullScanNumber:I

    iput v0, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBestScanNumber:I

    .line 250
    return-void
.end method


# virtual methods
.method public getBestScanEndOffset()I
    .locals 1

    .prologue
    .line 260
    iget v0, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBestScanEndOffset:I

    return v0
.end method

.method public getBestScanNumber()I
    .locals 1

    .prologue
    .line 267
    iget v0, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBestScanNumber:I

    return v0
.end method

.method public isJpeg()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 253
    iget v1, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBytesParsed:I

    if-le v1, v0, :cond_0

    iget v1, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    const/4 v2, 0x6

    if-eq v1, v2, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public parseMoreData(Lcom/facebook/imagepipeline/image/EncodedImage;)Z
    .locals 8
    .param p1, "encodedImage"    # Lcom/facebook/imagepipeline/image/EncodedImage;

    .prologue
    const/4 v4, 0x0

    .line 118
    iget v3, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mParserState:I

    const/4 v5, 0x6

    if-ne v3, v5, :cond_0

    move v3, v4

    .line 141
    :goto_0
    return v3

    .line 122
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getSize()I

    move-result v1

    .line 127
    .local v1, "dataBufferSize":I
    iget v3, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBytesParsed:I

    if-gt v1, v3, :cond_1

    move v3, v4

    .line 128
    goto :goto_0

    .line 131
    :cond_1
    new-instance v0, Lcom/facebook/imagepipeline/memory/PooledByteArrayBufferedInputStream;

    .line 132
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    iget-object v3, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mByteArrayPool:Lcom/facebook/imagepipeline/memory/ByteArrayPool;

    const/16 v6, 0x4000

    .line 133
    invoke-interface {v3, v6}, Lcom/facebook/imagepipeline/memory/ByteArrayPool;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    iget-object v6, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mByteArrayPool:Lcom/facebook/imagepipeline/memory/ByteArrayPool;

    invoke-direct {v0, v5, v3, v6}, Lcom/facebook/imagepipeline/memory/PooledByteArrayBufferedInputStream;-><init>(Ljava/io/InputStream;[BLcom/facebook/common/references/ResourceReleaser;)V

    .line 136
    .local v0, "bufferedDataStream":Ljava/io/InputStream;
    :try_start_0
    iget v3, p0, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->mBytesParsed:I

    int-to-long v6, v3

    invoke-static {v0, v6, v7}, Lcom/facebook/common/util/StreamUtil;->skip(Ljava/io/InputStream;J)J

    .line 137
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/decoder/ProgressiveJpegParser;->doParseMoreData(Ljava/io/InputStream;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    .line 143
    invoke-static {v0}, Lcom/facebook/common/internal/Closeables;->closeQuietly(Ljava/io/InputStream;)V

    goto :goto_0

    .line 138
    :catch_0
    move-exception v2

    .line 140
    .local v2, "ioe":Ljava/io/IOException;
    :try_start_1
    invoke-static {v2}, Lcom/facebook/common/internal/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 143
    invoke-static {v0}, Lcom/facebook/common/internal/Closeables;->closeQuietly(Ljava/io/InputStream;)V

    move v3, v4

    .line 141
    goto :goto_0

    .line 143
    .end local v2    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lcom/facebook/common/internal/Closeables;->closeQuietly(Ljava/io/InputStream;)V

    throw v3
.end method
