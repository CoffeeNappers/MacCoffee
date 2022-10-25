.class public final Lcom/google/android/exoplayer2/text/cea/CeaUtil;
.super Ljava/lang/Object;
.source "CeaUtil.java"


# static fields
.field private static final COUNTRY_CODE:I = 0xb5

.field private static final PAYLOAD_TYPE_CC:I = 0x4

.field private static final PROVIDER_CODE:I = 0x31

.field private static final USER_DATA_TYPE_CODE:I = 0x3

.field private static final USER_ID:I = 0x47413934


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static consume(JLcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/TrackOutput;)V
    .locals 12
    .param p0, "presentationTimeUs"    # J
    .param p2, "seiBuffer"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p3, "output"    # Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .prologue
    const/16 v11, 0xff

    const/4 v4, 0x1

    .line 44
    :goto_0
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    if-le v1, v4, :cond_3

    .line 46
    const/4 v10, 0x0

    .line 48
    .local v10, "payloadType":I
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 49
    .local v0, "b":I
    add-int/2addr v10, v0

    .line 50
    if-eq v0, v11, :cond_0

    .line 52
    const/4 v9, 0x0

    .line 54
    .local v9, "payloadSize":I
    :cond_1
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 55
    add-int/2addr v9, v0

    .line 56
    if-eq v0, v11, :cond_1

    .line 58
    invoke-static {v10, v9, p2}, Lcom/google/android/exoplayer2/text/cea/CeaUtil;->isSeiMessageCea608(IILcom/google/android/exoplayer2/util/ParsableByteArray;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 61
    const/16 v1, 0x8

    invoke-virtual {p2, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 63
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    and-int/lit8 v8, v1, 0x1f

    .line 65
    .local v8, "ccCount":I
    invoke-virtual {p2, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 68
    mul-int/lit8 v5, v8, 0x3

    .line 69
    .local v5, "sampleLength":I
    invoke-interface {p3, p2, v5}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 70
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p3

    move-wide v2, p0

    invoke-interface/range {v1 .. v7}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 72
    mul-int/lit8 v1, v8, 0x3

    add-int/lit8 v1, v1, 0xa

    sub-int v1, v9, v1

    invoke-virtual {p2, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_0

    .line 74
    .end local v5    # "sampleLength":I
    .end local v8    # "ccCount":I
    :cond_2
    invoke-virtual {p2, v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_0

    .line 77
    .end local v0    # "b":I
    .end local v9    # "payloadSize":I
    .end local v10    # "payloadType":I
    :cond_3
    return-void
.end method

.method private static isSeiMessageCea608(IILcom/google/android/exoplayer2/util/ParsableByteArray;)Z
    .locals 7
    .param p0, "payloadType"    # I
    .param p1, "payloadLength"    # I
    .param p2, "payload"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    const/4 v5, 0x0

    .line 91
    const/4 v6, 0x4

    if-ne p0, v6, :cond_0

    const/16 v6, 0x8

    if-ge p1, v6, :cond_1

    .line 100
    :cond_0
    :goto_0
    return v5

    .line 94
    :cond_1
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v2

    .line 95
    .local v2, "startPosition":I
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 96
    .local v0, "countryCode":I
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedShort()I

    move-result v1

    .line 97
    .local v1, "providerCode":I
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v4

    .line 98
    .local v4, "userIdentifier":I
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 99
    .local v3, "userDataTypeCode":I
    invoke-virtual {p2, v2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 100
    const/16 v6, 0xb5

    if-ne v0, v6, :cond_0

    const/16 v6, 0x31

    if-ne v1, v6, :cond_0

    const v6, 0x47413934

    if-ne v4, v6, :cond_0

    const/4 v6, 0x3

    if-ne v3, v6, :cond_0

    const/4 v5, 0x1

    goto :goto_0
.end method
