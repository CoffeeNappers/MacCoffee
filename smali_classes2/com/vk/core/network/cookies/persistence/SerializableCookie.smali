.class public Lcom/vk/core/network/cookies/persistence/SerializableCookie;
.super Ljava/lang/Object;
.source "SerializableCookie.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static NON_VALID_EXPIRES_AT:J = 0x0L

.field private static final TAG:Ljava/lang/String;

.field private static final serialVersionUID:J = -0x77442f0b309f5e9eL


# instance fields
.field private transient cookie:Lokhttp3/Cookie;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 31
    const-class v0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    .line 126
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->NON_VALID_EXPIRES_AT:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static byteArrayToHexString([B)Ljava/lang/String;
    .locals 6
    .param p0, "bytes"    # [B

    .prologue
    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    array-length v3, p0

    mul-int/lit8 v3, v3, 0x2

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 73
    .local v1, "sb":Ljava/lang/StringBuilder;
    array-length v4, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_1

    aget-byte v0, p0, v3

    .line 74
    .local v0, "element":B
    and-int/lit16 v2, v0, 0xff

    .line 75
    .local v2, "v":I
    const/16 v5, 0x10

    if-ge v2, v5, :cond_0

    .line 76
    const/16 v5, 0x30

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 78
    :cond_0
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 80
    .end local v0    # "element":B
    .end local v2    # "v":I
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static hexStringToByteArray(Ljava/lang/String;)[B
    .locals 7
    .param p0, "hexString"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x10

    .line 117
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 118
    .local v2, "len":I
    div-int/lit8 v3, v2, 0x2

    new-array v0, v3, [B

    .line 119
    .local v0, "data":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 120
    div-int/lit8 v3, v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v5, v1, 0x1

    .line 121
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    add-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 119
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 123
    :cond_0
    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 6
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 140
    new-instance v0, Lokhttp3/Cookie$Builder;

    invoke-direct {v0}, Lokhttp3/Cookie$Builder;-><init>()V

    .line 142
    .local v0, "builder":Lokhttp3/Cookie$Builder;
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Lokhttp3/Cookie$Builder;->name(Ljava/lang/String;)Lokhttp3/Cookie$Builder;

    .line 144
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Lokhttp3/Cookie$Builder;->value(Ljava/lang/String;)Lokhttp3/Cookie$Builder;

    .line 146
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v2

    .line 147
    .local v2, "expiresAt":J
    sget-wide v4, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->NON_VALID_EXPIRES_AT:J

    cmp-long v4, v2, v4

    if-eqz v4, :cond_0

    .line 148
    invoke-virtual {v0, v2, v3}, Lokhttp3/Cookie$Builder;->expiresAt(J)Lokhttp3/Cookie$Builder;

    .line 151
    :cond_0
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 152
    .local v1, "domain":Ljava/lang/String;
    invoke-virtual {v0, v1}, Lokhttp3/Cookie$Builder;->domain(Ljava/lang/String;)Lokhttp3/Cookie$Builder;

    .line 154
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Lokhttp3/Cookie$Builder;->path(Ljava/lang/String;)Lokhttp3/Cookie$Builder;

    .line 156
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 157
    invoke-virtual {v0}, Lokhttp3/Cookie$Builder;->secure()Lokhttp3/Cookie$Builder;

    .line 159
    :cond_1
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 160
    invoke-virtual {v0}, Lokhttp3/Cookie$Builder;->httpOnly()Lokhttp3/Cookie$Builder;

    .line 162
    :cond_2
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 163
    invoke-virtual {v0, v1}, Lokhttp3/Cookie$Builder;->hostOnlyDomain(Ljava/lang/String;)Lokhttp3/Cookie$Builder;

    .line 165
    :cond_3
    invoke-virtual {v0}, Lokhttp3/Cookie$Builder;->build()Lokhttp3/Cookie;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    .line 166
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 2
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    invoke-virtual {v0}, Lokhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 130
    iget-object v0, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    invoke-virtual {v0}, Lokhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 131
    iget-object v0, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    invoke-virtual {v0}, Lokhttp3/Cookie;->persistent()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    invoke-virtual {v0}, Lokhttp3/Cookie;->expiresAt()J

    move-result-wide v0

    :goto_0
    invoke-virtual {p1, v0, v1}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    .line 132
    iget-object v0, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    invoke-virtual {v0}, Lokhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 133
    iget-object v0, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    invoke-virtual {v0}, Lokhttp3/Cookie;->path()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 134
    iget-object v0, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    invoke-virtual {v0}, Lokhttp3/Cookie;->secure()Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 135
    iget-object v0, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    invoke-virtual {v0}, Lokhttp3/Cookie;->httpOnly()Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 136
    iget-object v0, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    invoke-virtual {v0}, Lokhttp3/Cookie;->hostOnly()Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 137
    return-void

    .line 131
    :cond_0
    sget-wide v0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->NON_VALID_EXPIRES_AT:J

    goto :goto_0
.end method


# virtual methods
.method public decode(Ljava/lang/String;)Lokhttp3/Cookie;
    .locals 9
    .param p1, "encodedCookie"    # Ljava/lang/String;

    .prologue
    .line 85
    invoke-static {p1}, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v1

    .line 86
    .local v1, "bytes":[B
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 89
    .local v0, "byteArrayInputStream":Ljava/io/ByteArrayInputStream;
    const/4 v2, 0x0

    .line 90
    .local v2, "cookie":Lokhttp3/Cookie;
    const/4 v4, 0x0

    .line 92
    .local v4, "objectInputStream":Ljava/io/ObjectInputStream;
    :try_start_0
    new-instance v5, Ljava/io/ObjectInputStream;

    invoke-direct {v5, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    .end local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    .local v5, "objectInputStream":Ljava/io/ObjectInputStream;
    :try_start_1
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vk/core/network/cookies/persistence/SerializableCookie;

    iget-object v2, v6, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 99
    if-eqz v5, :cond_2

    .line 101
    :try_start_2
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-object v4, v5

    .line 107
    .end local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    :cond_0
    :goto_0
    return-object v2

    .line 102
    .end local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    :catch_0
    move-exception v3

    .line 103
    .local v3, "e":Ljava/io/IOException;
    sget-object v6, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    const-string/jumbo v7, "Stream not closed in decodeCookie"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v4, v5

    .line 104
    .end local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    goto :goto_0

    .line 94
    .end local v3    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v3

    .line 95
    .restart local v3    # "e":Ljava/io/IOException;
    :goto_1
    :try_start_3
    sget-object v6, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    const-string/jumbo v7, "IOException in decodeCookie"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 99
    if-eqz v4, :cond_0

    .line 101
    :try_start_4
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 102
    :catch_2
    move-exception v3

    .line 103
    sget-object v6, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    const-string/jumbo v7, "Stream not closed in decodeCookie"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 96
    .end local v3    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v3

    .line 97
    .local v3, "e":Ljava/lang/ClassNotFoundException;
    :goto_2
    :try_start_5
    sget-object v6, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    const-string/jumbo v7, "ClassNotFoundException in decodeCookie"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 99
    if-eqz v4, :cond_0

    .line 101
    :try_start_6
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_0

    .line 102
    :catch_4
    move-exception v3

    .line 103
    .local v3, "e":Ljava/io/IOException;
    sget-object v6, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    const-string/jumbo v7, "Stream not closed in decodeCookie"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 99
    .end local v3    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    :goto_3
    if-eqz v4, :cond_1

    .line 101
    :try_start_7
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 104
    :cond_1
    :goto_4
    throw v6

    .line 102
    :catch_5
    move-exception v3

    .line 103
    .restart local v3    # "e":Ljava/io/IOException;
    sget-object v7, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    const-string/jumbo v8, "Stream not closed in decodeCookie"

    invoke-static {v7, v8, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    .line 99
    .end local v3    # "e":Ljava/io/IOException;
    .end local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    goto :goto_3

    .line 96
    .end local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    :catch_6
    move-exception v3

    move-object v4, v5

    .end local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    goto :goto_2

    .line 94
    .end local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    :catch_7
    move-exception v3

    move-object v4, v5

    .end local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    goto :goto_1

    .end local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    :cond_2
    move-object v4, v5

    .end local v5    # "objectInputStream":Ljava/io/ObjectInputStream;
    .restart local v4    # "objectInputStream":Ljava/io/ObjectInputStream;
    goto :goto_0
.end method

.method public encode(Lokhttp3/Cookie;)Ljava/lang/String;
    .locals 7
    .param p1, "cookie"    # Lokhttp3/Cookie;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->cookie:Lokhttp3/Cookie;

    .line 40
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 41
    .local v0, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .line 44
    .local v2, "objectOutputStream":Ljava/io/ObjectOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/ObjectOutputStream;

    invoke-direct {v3, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .end local v2    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    .local v3, "objectOutputStream":Ljava/io/ObjectOutputStream;
    :try_start_1
    invoke-virtual {v3, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 50
    if-eqz v3, :cond_0

    .line 53
    :try_start_2
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 60
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v4

    move-object v2, v3

    .end local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    .restart local v2    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :cond_1
    :goto_1
    return-object v4

    .line 54
    .end local v2    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    .restart local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :catch_0
    move-exception v1

    .line 55
    .local v1, "e":Ljava/io/IOException;
    sget-object v4, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "Stream not closed in encodeCookie"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 46
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    .restart local v2    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :catch_1
    move-exception v1

    .line 47
    .restart local v1    # "e":Ljava/io/IOException;
    :goto_2
    :try_start_3
    sget-object v4, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "IOException in encodeCookie"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 48
    const/4 v4, 0x0

    .line 50
    if-eqz v2, :cond_1

    .line 53
    :try_start_4
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 54
    :catch_2
    move-exception v1

    .line 55
    sget-object v5, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    const-string/jumbo v6, "Stream not closed in encodeCookie"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 50
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_3
    if-eqz v2, :cond_2

    .line 53
    :try_start_5
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 56
    :cond_2
    :goto_4
    throw v4

    .line 54
    :catch_3
    move-exception v1

    .line 55
    .restart local v1    # "e":Ljava/io/IOException;
    sget-object v5, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->TAG:Ljava/lang/String;

    const-string/jumbo v6, "Stream not closed in encodeCookie"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    .line 50
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    .restart local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    .restart local v2    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    goto :goto_3

    .line 46
    .end local v2    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    .restart local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :catch_4
    move-exception v1

    move-object v2, v3

    .end local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    .restart local v2    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    goto :goto_2
.end method
