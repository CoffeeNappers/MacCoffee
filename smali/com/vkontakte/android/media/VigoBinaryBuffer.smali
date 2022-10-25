.class public Lcom/vkontakte/android/media/VigoBinaryBuffer;
.super Ljava/lang/Object;
.source "VigoBinaryBuffer.java"


# static fields
.field public static final CLIENT_INFORMATION_TAG:S = 0x1s

.field public static final CONTENT_INFORMATION_TAG:S = 0x2s

.field public static final EVENT_INFORMATION_TAG:S = 0x6s

.field public static final LV_LEN_POSITION:S = 0x0s

.field public static final MAX_BUFFER_SIZE:S = 0x1000s

.field public static final NETWORK_INFORMATION_TAG:S = 0x5s

.field public static final NO_TAG:S = 0x0s

.field public static final PLAYBACK_EVENT_INFORMATION_TAG:S = 0x4s

.field public static final PLAYBACK_INFORMATION_TAG:S = 0x3s

.field private static final POOL_SIZE:S = 0x100s

.field public static final SESSION_INFORMATION_TAG:S = 0x7s

.field public static final TLV_LEN_POSITION:S = 0x2s

.field public static final TLV_LEN_SIZE:S = 0x2s

.field private static final pool:Lcom/vkontakte/android/media/VigoPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/media/VigoPool",
            "<",
            "Lcom/vkontakte/android/media/VigoBinaryBuffer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private buf:[B

.field private final inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private position:I

.field private tag:S


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 16
    new-instance v0, Lcom/vkontakte/android/media/VigoPool;

    new-instance v1, Lcom/vkontakte/android/media/VigoBinaryBuffer$1;

    invoke-direct {v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer$1;-><init>()V

    const/16 v2, 0x100

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/media/VigoPool;-><init>(Lcom/vkontakte/android/media/VigoPool$ObjectFactory;I)V

    sput-object v0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->pool:Lcom/vkontakte/android/media/VigoPool;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 58
    invoke-direct {p0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->init()V

    .line 59
    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 61
    return-void
.end method

.method private checkSize(I)Z
    .locals 2
    .param p1, "size"    # I

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    array-length v0, v0

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    sub-int/2addr v0, v1

    if-lt v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private clear()V
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    .line 65
    return-void
.end method

.method public static getObject()Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 3

    .prologue
    .line 25
    sget-object v1, Lcom/vkontakte/android/media/VigoBinaryBuffer;->pool:Lcom/vkontakte/android/media/VigoPool;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoPool;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 26
    .local v0, "obj":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    iget-object v1, v0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 27
    return-object v0
.end method

.method private init()V
    .locals 1

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->clear()V

    .line 69
    const/4 v0, -0x1

    iput-short v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->tag:S

    .line 70
    return-void
.end method


# virtual methods
.method public addBooleanToBuffer(Z)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 4
    .param p1, "src"    # Z

    .prologue
    const/4 v0, 0x1

    .line 184
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->checkSize(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 185
    iget-object v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    if-eqz p1, :cond_1

    :goto_0
    int-to-byte v0, v0

    aput-byte v0, v1, v2

    .line 187
    :cond_0
    return-object p0

    .line 185
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public addBuffer(Lcom/vkontakte/android/media/VigoBinaryBuffer;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 2
    .param p1, "src"    # Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .prologue
    .line 200
    if-eqz p1, :cond_0

    .line 201
    iget v0, p1, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->checkSize(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p1, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p1, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBytesToBuffer([BI)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 205
    :cond_0
    return-object p0
.end method

.method public addByteToBuffer(B)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 3
    .param p1, "src"    # B

    .prologue
    .line 176
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->checkSize(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 177
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    aput-byte p1, v0, v1

    .line 179
    :cond_0
    return-object p0
.end method

.method public addBytesToBuffer([BI)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 3
    .param p1, "src"    # [B
    .param p2, "limit"    # I

    .prologue
    .line 191
    if-eqz p1, :cond_0

    .line 193
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    invoke-static {p1, v0, v1, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 194
    iget v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    .line 196
    :cond_0
    return-object p0
.end method

.method public addIntToBuffer(I)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 3
    .param p1, "src"    # I

    .prologue
    .line 156
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->checkSize(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    ushr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    ushr-int/lit8 v2, p1, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    ushr-int/lit8 v2, p1, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 162
    :cond_0
    return-object p0
.end method

.method public addLongToBuffer(J)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 7
    .param p1, "src"    # J

    .prologue
    const/16 v6, 0x8

    const-wide/16 v4, 0xff

    .line 141
    invoke-direct {p0, v6}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->checkSize(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    and-long v2, p1, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    ushr-long v2, p1, v6

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    const/16 v2, 0x10

    ushr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    const/16 v2, 0x18

    ushr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    const/16 v2, 0x20

    ushr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    const/16 v2, 0x28

    ushr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    const/16 v2, 0x30

    ushr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    const/16 v2, 0x38

    ushr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 151
    :cond_0
    return-object p0
.end method

.method public addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 3
    .param p1, "src"    # S

    .prologue
    .line 167
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->checkSize(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    ushr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 171
    :cond_0
    return-object p0
.end method

.method public addStringToBuffer(Ljava/lang/String;)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    .locals 5
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 125
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x7fff

    if-gt v2, v3, :cond_0

    .line 127
    :try_start_0
    const-string/jumbo v2, "UTF-8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 128
    .local v1, "tmp":[B
    array-length v2, v1

    int-to-short v2, v2

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 129
    array-length v2, v1

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addBytesToBuffer([BI)Lcom/vkontakte/android/media/VigoBinaryBuffer;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .end local v1    # "tmp":[B
    :goto_0
    return-object p0

    .line 130
    :catch_0
    move-exception v0

    .line 131
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    goto :goto_0

    .line 134
    .end local v0    # "ex":Ljava/io/UnsupportedEncodingException;
    :cond_0
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 96
    if-ne p0, p1, :cond_1

    .line 109
    :cond_0
    :goto_0
    return v2

    .line 98
    :cond_1
    instance-of v4, p1, Lcom/vkontakte/android/media/VigoBinaryBuffer;

    if-nez v4, :cond_2

    move v2, v3

    .line 99
    goto :goto_0

    :cond_2
    move-object v1, p1

    .line 100
    check-cast v1, Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 101
    .local v1, "other":Lcom/vkontakte/android/media/VigoBinaryBuffer;
    iget-short v4, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->tag:S

    iget-short v5, v1, Lcom/vkontakte/android/media/VigoBinaryBuffer;->tag:S

    if-eq v4, v5, :cond_3

    move v2, v3

    .line 102
    goto :goto_0

    .line 103
    :cond_3
    iget v4, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    iget v5, v1, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    if-eq v4, v5, :cond_4

    move v2, v3

    .line 104
    goto :goto_0

    .line 105
    :cond_4
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v4, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    if-ge v0, v4, :cond_0

    .line 106
    iget-object v4, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    aget-byte v4, v4, v0

    iget-object v5, v1, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    aget-byte v5, v5, v0

    if-eq v4, v5, :cond_5

    move v2, v3

    .line 107
    goto :goto_0

    .line 105
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public getBuffer()[B
    .locals 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    iget v1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    return-object v0
.end method

.method public final reset()V
    .locals 2

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->clear()V

    .line 74
    iget-short v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->tag:S

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 75
    iget-short v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->tag:S

    if-eqz v0, :cond_0

    .line 76
    iget-short v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->tag:S

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 77
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->addShortToBuffer(S)Lcom/vkontakte/android/media/VigoBinaryBuffer;

    .line 79
    :cond_1
    return-void
.end method

.method public returnObject()V
    .locals 3

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->inPool:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    invoke-direct {p0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->init()V

    .line 33
    sget-object v0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->pool:Lcom/vkontakte/android/media/VigoPool;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/VigoPool;->setFree(Ljava/lang/Object;)V

    .line 35
    :cond_0
    return-void
.end method

.method public setTag(S)V
    .locals 0
    .param p1, "tag"    # S

    .prologue
    .line 82
    iput-short p1, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->tag:S

    .line 83
    invoke-virtual {p0}, Lcom/vkontakte/android/media/VigoBinaryBuffer;->reset()V

    .line 84
    return-void
.end method

.method public updateLength()V
    .locals 3

    .prologue
    .line 113
    iget-short v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->tag:S

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 114
    iget-short v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->tag:S

    if-nez v0, :cond_1

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    const/4 v1, 0x0

    iget v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v2, -0x2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    const/4 v1, 0x1

    iget v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v2, -0x2

    ushr-int/lit8 v2, v2, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 118
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    const/4 v1, 0x2

    iget v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v2, -0x4

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->buf:[B

    const/4 v1, 0x3

    iget v2, p0, Lcom/vkontakte/android/media/VigoBinaryBuffer;->position:I

    add-int/lit8 v2, v2, -0x4

    ushr-int/lit8 v2, v2, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    goto :goto_0
.end method
