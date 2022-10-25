.class public Lcom/danikula/videocache/ByteArraySource;
.super Ljava/lang/Object;
.source "ByteArraySource.java"

# interfaces
.implements Lcom/danikula/videocache/Source;


# instance fields
.field private arrayInputStream:Ljava/io/ByteArrayInputStream;

.field private final data:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0
    .param p1, "data"    # [B

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/danikula/videocache/ByteArraySource;->data:[B

    .line 17
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 37
    return-void
.end method

.method public length()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 26
    iget-object v0, p0, Lcom/danikula/videocache/ByteArraySource;->data:[B

    array-length v0, v0

    return v0
.end method

.method public open(I)V
    .locals 4
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 31
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/danikula/videocache/ByteArraySource;->data:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iput-object v0, p0, Lcom/danikula/videocache/ByteArraySource;->arrayInputStream:Ljava/io/ByteArrayInputStream;

    .line 32
    iget-object v0, p0, Lcom/danikula/videocache/ByteArraySource;->arrayInputStream:Ljava/io/ByteArrayInputStream;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Ljava/io/ByteArrayInputStream;->skip(J)J

    .line 33
    return-void
.end method

.method public read([B)I
    .locals 3
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 21
    iget-object v0, p0, Lcom/danikula/videocache/ByteArraySource;->arrayInputStream:Ljava/io/ByteArrayInputStream;

    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {v0, p1, v1, v2}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result v0

    return v0
.end method
