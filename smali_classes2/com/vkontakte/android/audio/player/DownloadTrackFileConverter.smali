.class public Lcom/vkontakte/android/audio/player/DownloadTrackFileConverter;
.super Ljava/lang/Object;
.source "DownloadTrackFileConverter.java"

# interfaces
.implements Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkPause()V
    .locals 0

    .prologue
    .line 32
    return-void
.end method

.method public convert(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;)V
    .locals 8
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "listener"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14
    const/high16 v5, 0x10000

    new-array v0, v5, [B

    .line 16
    .local v0, "buff":[B
    const/4 v3, 0x0

    .line 17
    .local v3, "pos":I
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "count":I
    if-ltz v1, :cond_1

    .line 18
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/DownloadTrackFileConverter;->checkPause()V

    .line 20
    const/4 v2, 0x0

    .local v2, "i":I
    move v4, v3

    .end local v3    # "pos":I
    .local v4, "pos":I
    :goto_1
    if-ge v2, v1, :cond_0

    .line 21
    aget-byte v5, v0, v2

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    mul-int/lit8 v6, v4, 0x11

    add-int/lit8 v6, v6, 0xd

    and-int/lit16 v6, v6, 0xff

    xor-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v0, v2

    .line 20
    add-int/lit8 v2, v2, 0x1

    move v4, v3

    .end local v3    # "pos":I
    .restart local v4    # "pos":I
    goto :goto_1

    .line 22
    :cond_0
    const/4 v5, 0x0

    invoke-virtual {p2, v0, v5, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 24
    invoke-interface {p3}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_2

    move v3, v4

    .line 29
    .end local v2    # "i":I
    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    :cond_1
    return-void

    .line 27
    .end local v3    # "pos":I
    .restart local v2    # "i":I
    .restart local v4    # "pos":I
    :cond_2
    int-to-long v6, v1

    invoke-interface {p3, v6, v7}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;->onRead(J)V

    move v3, v4

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    goto :goto_0
.end method
