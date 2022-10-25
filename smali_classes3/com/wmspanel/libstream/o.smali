.class Lcom/wmspanel/libstream/o;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "Utils"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/nio/ByteBuffer;[B)I
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 38
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 40
    const/4 v3, 0x1

    move v1, v2

    .line 41
    :goto_1
    array-length v4, p1

    if-ge v1, v4, :cond_3

    add-int v4, v0, v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    if-ge v4, v5, :cond_3

    .line 42
    add-int v4, v0, v1

    invoke-virtual {p0, v4}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v4

    aget-byte v5, p1, v1

    if-eq v4, v5, :cond_0

    move v1, v2

    .line 48
    :goto_2
    if-eqz v1, :cond_1

    .line 52
    :goto_3
    return v0

    .line 41
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 38
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 52
    :cond_2
    const/4 v0, -0x1

    goto :goto_3

    :cond_3
    move v1, v3

    goto :goto_2
.end method

.method public static b(Ljava/nio/ByteBuffer;[B)Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 56
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int/2addr v0, v3

    array-length v3, p1

    if-ge v0, v3, :cond_1

    .line 72
    :cond_0
    :goto_0
    return v1

    :cond_1
    move v0, v1

    .line 61
    :goto_1
    array-length v3, p1

    if-ge v0, v3, :cond_3

    .line 62
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    add-int/2addr v3, v0

    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v3

    aget-byte v4, p1, v0

    if-eq v3, v4, :cond_2

    move v0, v1

    .line 68
    :goto_2
    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    array-length v1, p1

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move v1, v2

    .line 70
    goto :goto_0

    .line 61
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v2

    goto :goto_2
.end method

.method public static g(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 30
    const-string/jumbo v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 31
    const-string/jumbo v1, "US-ASCII"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 32
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 34
    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {v0, v1, v2}, Lcom/wmspanel/libstream/o;->g([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static g([BII)Ljava/lang/String;
    .locals 6

    .prologue
    .line 13
    array-length v0, p0

    if-lt p1, v0, :cond_0

    .line 14
    const-string/jumbo v0, ""

    .line 25
    :goto_0
    return-object v0

    .line 17
    :cond_0
    array-length v0, p0

    sub-int/2addr v0, p1

    if-le p2, v0, :cond_1

    .line 18
    array-length v0, p0

    sub-int p2, v0, p1

    .line 21
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v0, p2, 0x2

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    move v0, p1

    .line 22
    :goto_1
    add-int v2, p1, p2

    if-ge v0, v2, :cond_2

    .line 23
    const-string/jumbo v2, "%02x"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aget-byte v5, p0, v0

    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 25
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
