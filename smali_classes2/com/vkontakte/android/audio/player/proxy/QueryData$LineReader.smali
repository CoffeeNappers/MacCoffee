.class Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;
.super Ljava/lang/Object;
.source "QueryData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/proxy/QueryData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LineReader"
.end annotation


# instance fields
.field private final mBuffer:Ljava/nio/ByteBuffer;

.field private final mSocket:Ljava/nio/channels/SocketChannel;

.field private final mStream:Ljava/io/ByteArrayOutputStream;


# direct methods
.method public constructor <init>(Ljava/nio/channels/SocketChannel;)V
    .locals 1
    .param p1, "socket"    # Ljava/nio/channels/SocketChannel;

    .prologue
    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mSocket:Ljava/nio/channels/SocketChannel;

    .line 166
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mBuffer:Ljava/nio/ByteBuffer;

    .line 167
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mStream:Ljava/io/ByteArrayOutputStream;

    .line 168
    return-void
.end method


# virtual methods
.method public readLine()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mStream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 173
    const/4 v1, 0x0

    .line 175
    .local v1, "firstByteRead":Z
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 176
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mBuffer:Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 178
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mSocket:Ljava/nio/channels/SocketChannel;

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v4}, Ljava/nio/channels/SocketChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v2

    .line 179
    .local v2, "len":I
    if-gez v2, :cond_2

    .line 195
    :cond_1
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mStream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    return-object v3

    .line 182
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    const/4 v4, 0x0

    aget-byte v0, v3, v4

    .line 183
    .local v0, "b":I
    const/16 v3, 0xd

    if-eq v0, v3, :cond_1

    .line 186
    if-nez v1, :cond_3

    .line 187
    const/4 v1, 0x1

    .line 188
    const/16 v3, 0xa

    if-eq v0, v3, :cond_0

    .line 192
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->mStream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v3, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0
.end method
