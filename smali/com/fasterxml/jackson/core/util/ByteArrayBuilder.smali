.class public final Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
.super Ljava/io/OutputStream;
.source "ByteArrayBuilder.java"


# static fields
.field static final DEFAULT_BLOCK_ARRAY_SIZE:I = 0x28

.field private static final INITIAL_BLOCK_SIZE:I = 0x1f4

.field private static final MAX_BLOCK_SIZE:I = 0x40000

.field public static final NO_BYTES:[B


# instance fields
.field private final _bufferRecycler:Lcom/fasterxml/jackson/core/util/BufferRecycler;

.field private _currBlock:[B

.field private _currBlockPtr:I

.field private final _pastBlocks:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<[B>;"
        }
    .end annotation
.end field

.field private _pastLen:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->NO_BYTES:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "firstBlockSize"    # I

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;I)V

    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V
    .locals 1
    .param p1, "br"    # Lcom/fasterxml/jackson/core/util/BufferRecycler;

    .prologue
    .line 52
    const/16 v0, 0x1f4

    invoke-direct {p0, p1, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;I)V

    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;I)V
    .locals 1
    .param p1, "br"    # Lcom/fasterxml/jackson/core/util/BufferRecycler;
    .param p2, "firstBlockSize"    # I

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 44
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastBlocks:Ljava/util/LinkedList;

    .line 56
    iput-object p1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_bufferRecycler:Lcom/fasterxml/jackson/core/util/BufferRecycler;

    .line 57
    if-nez p1, :cond_0

    new-array v0, p2, [B

    :goto_0
    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    .line 58
    return-void

    .line 57
    :cond_0
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/fasterxml/jackson/core/util/BufferRecycler;->allocByteBuffer(I)[B

    move-result-object v0

    goto :goto_0
.end method

.method private _allocMore()V
    .locals 4

    .prologue
    .line 230
    iget v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastLen:I

    iget-object v3, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    array-length v3, v3

    add-int v0, v2, v3

    .line 235
    .local v0, "newPastLen":I
    if-gez v0, :cond_0

    .line 236
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "Maximum Java array size (2GB) exceeded by `ByteArrayBuilder`"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 239
    :cond_0
    iput v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastLen:I

    .line 247
    iget v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastLen:I

    shr-int/lit8 v2, v2, 0x1

    const/16 v3, 0x3e8

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 249
    .local v1, "newSize":I
    const/high16 v2, 0x40000

    if-le v1, v2, :cond_1

    .line 250
    const/high16 v1, 0x40000

    .line 252
    :cond_1
    iget-object v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastBlocks:Ljava/util/LinkedList;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 253
    new-array v2, v1, [B

    iput-object v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    .line 254
    const/4 v2, 0x0

    iput v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    .line 255
    return-void
.end method


# virtual methods
.method public append(I)V
    .locals 3
    .param p1, "i"    # I

    .prologue
    .line 83
    iget v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 84
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_allocMore()V

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 87
    return-void
.end method

.method public appendThreeBytes(I)V
    .locals 3
    .param p1, "b24"    # I

    .prologue
    .line 100
    iget v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 101
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    shr-int/lit8 v2, p1, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 102
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    shr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 103
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 109
    :goto_0
    return-void

    .line 105
    :cond_0
    shr-int/lit8 v0, p1, 0x10

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 106
    shr-int/lit8 v0, p1, 0x8

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 107
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    goto :goto_0
.end method

.method public appendTwoBytes(I)V
    .locals 3
    .param p1, "b16"    # I

    .prologue
    .line 90
    iget v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 91
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    shr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 92
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 97
    :goto_0
    return-void

    .line 94
    :cond_0
    shr-int/lit8 v0, p1, 0x8

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 95
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    goto :goto_0
.end method

.method public close()V
    .locals 0

    .prologue
    .line 219
    return-void
.end method

.method public completeAndCoalesce(I)[B
    .locals 1
    .param p1, "lastBlockLength"    # I

    .prologue
    .line 178
    iput p1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    .line 179
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public finishCurrentSegment()[B
    .locals 1

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_allocMore()V

    .line 165
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    return-object v0
.end method

.method public flush()V
    .locals 0

    .prologue
    .line 220
    return-void
.end method

.method public getCurrentSegment()[B
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    return-object v0
.end method

.method public getCurrentSegmentLength()I
    .locals 1

    .prologue
    .line 184
    iget v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    return v0
.end method

.method public release()V
    .locals 3

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->reset()V

    .line 76
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_bufferRecycler:Lcom/fasterxml/jackson/core/util/BufferRecycler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_bufferRecycler:Lcom/fasterxml/jackson/core/util/BufferRecycler;

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/core/util/BufferRecycler;->releaseByteBuffer(I[B)V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    .line 80
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 61
    iput v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastLen:I

    .line 62
    iput v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    .line 64
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastBlocks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastBlocks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 67
    :cond_0
    return-void
.end method

.method public resetAndGetFirstSegment()[B
    .locals 1

    .prologue
    .line 154
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->reset()V

    .line 155
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    return-object v0
.end method

.method public setCurrentSegmentLength(I)V
    .locals 0
    .param p1, "len"    # I

    .prologue
    .line 183
    iput p1, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    return-void
.end method

.method public toByteArray()[B
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 117
    iget v6, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastLen:I

    iget v7, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int v5, v6, v7

    .line 119
    .local v5, "totalLen":I
    if-nez v5, :cond_1

    .line 120
    sget-object v4, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->NO_BYTES:[B

    .line 140
    :cond_0
    :goto_0
    return-object v4

    .line 123
    :cond_1
    new-array v4, v5, [B

    .line 124
    .local v4, "result":[B
    const/4 v3, 0x0

    .line 126
    .local v3, "offset":I
    iget-object v6, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastBlocks:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 127
    .local v0, "block":[B
    array-length v2, v0

    .line 128
    .local v2, "len":I
    invoke-static {v0, v8, v4, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 129
    add-int/2addr v3, v2

    .line 130
    goto :goto_1

    .line 131
    .end local v0    # "block":[B
    .end local v2    # "len":I
    :cond_2
    iget-object v6, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    iget v7, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    invoke-static {v6, v8, v4, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 132
    iget v6, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int/2addr v3, v6

    .line 133
    if-eq v3, v5, :cond_3

    .line 134
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Internal error: total len assumed to be "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ", copied "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " bytes"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 137
    :cond_3
    iget-object v6, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_pastBlocks:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 138
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->reset()V

    goto :goto_0
.end method

.method public write(I)V
    .locals 0
    .param p1, "b"    # I

    .prologue
    .line 216
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 217
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "b"    # [B

    .prologue
    .line 194
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->write([BII)V

    .line 195
    return-void
.end method

.method public write([BII)V
    .locals 4
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 201
    :goto_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    array-length v2, v2

    iget v3, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    sub-int v0, v2, v3

    .line 202
    .local v0, "max":I
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 203
    .local v1, "toCopy":I
    if-lez v1, :cond_0

    .line 204
    iget-object v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlock:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    invoke-static {p1, p2, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 205
    add-int/2addr p2, v1

    .line 206
    iget v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_currBlockPtr:I

    .line 207
    sub-int/2addr p3, v1

    .line 209
    :cond_0
    if-gtz p3, :cond_1

    .line 212
    return-void

    .line 210
    :cond_1
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->_allocMore()V

    goto :goto_0
.end method
