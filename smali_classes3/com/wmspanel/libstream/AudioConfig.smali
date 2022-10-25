.class public Lcom/wmspanel/libstream/AudioConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final AAC_PROFILE:I = 0x2


# instance fields
.field public audioSource:I

.field public bitRate:I

.field public channelCount:I

.field public sampleRate:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x5

    iput v0, p0, Lcom/wmspanel/libstream/AudioConfig;->audioSource:I

    .line 16
    const/4 v0, 0x1

    iput v0, p0, Lcom/wmspanel/libstream/AudioConfig;->channelCount:I

    .line 17
    const v0, 0xac44

    iput v0, p0, Lcom/wmspanel/libstream/AudioConfig;->sampleRate:I

    .line 18
    iget v0, p0, Lcom/wmspanel/libstream/AudioConfig;->sampleRate:I

    iget v1, p0, Lcom/wmspanel/libstream/AudioConfig;->channelCount:I

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Lcom/wmspanel/libstream/AudioConfig;->calcBitRate(III)I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/AudioConfig;->bitRate:I

    .line 19
    return-void
.end method

.method public static calcBitRate(III)I
    .locals 2
    .param p0, "sampleRate"    # I
    .param p1, "channelCount"    # I
    .param p2, "aacProfile"    # I

    .prologue
    .line 22
    invoke-static {p2}, Lcom/wmspanel/libstream/AudioConfig;->getCompression(I)I

    move-result v0

    .line 23
    mul-int/lit8 v1, p0, 0x10

    mul-int/2addr v1, p1

    div-int v0, v1, v0

    .line 24
    invoke-static {v0}, Lcom/wmspanel/libstream/AudioConfig;->getNearestBitrate(I)I

    move-result v0

    return v0
.end method

.method public static getCompression(I)I
    .locals 1
    .param p0, "aacProfile"    # I

    .prologue
    .line 28
    .line 33
    packed-switch p0, :pswitch_data_0

    .line 44
    :pswitch_0
    const/16 v0, 0x10

    .line 47
    :goto_0
    return v0

    .line 35
    :pswitch_1
    const/16 v0, 0xf

    .line 36
    goto :goto_0

    .line 39
    :pswitch_2
    const/16 v0, 0x11

    .line 40
    goto :goto_0

    .line 33
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public static getNearestBitrate(I)I
    .locals 5
    .param p0, "bitrate"    # I

    .prologue
    .line 51
    const/16 v0, 0x12

    new-array v2, v0, [I

    fill-array-data v2, :array_0

    .line 57
    const/4 v1, 0x0

    .line 58
    const/4 v0, 0x1

    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 59
    aget v3, v2, v0

    sub-int/2addr v3, p0

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    aget v4, v2, v1

    sub-int/2addr v4, p0

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-le v3, v4, :cond_0

    .line 58
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    move v1, v0

    .line 62
    goto :goto_1

    .line 64
    :cond_1
    aget v0, v2, v1

    return v0

    .line 51
    :array_0
    .array-data 4
        0x1f40
        0x3e80
        0x4650
        0x4e20
        0x5dc0
        0x7d00
        0x9c40
        0xbb80
        0xdac0
        0xfa00
        0x13880
        0x17700
        0x1b580
        0x1f400
        0x27100
        0x2ee00
        0x3e800
        0x4e200
    .end array-data
.end method
