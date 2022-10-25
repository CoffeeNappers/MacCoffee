.class public Lcom/vkontakte/android/audio/http/downloadfile/DefaultDownloadFileConverter;
.super Ljava/lang/Object;
.source "DefaultDownloadFileConverter.java"

# interfaces
.implements Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public convert(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;)V
    .locals 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "listener"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 11
    const/high16 v2, 0x10000

    new-array v0, v2, [B

    .line 13
    .local v0, "buff":[B
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "count":I
    if-ltz v1, :cond_0

    .line 14
    const/4 v2, 0x0

    invoke-virtual {p2, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 16
    invoke-interface {p3}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 21
    :cond_0
    return-void

    .line 19
    :cond_1
    int-to-long v2, v1

    invoke-interface {p3, v2, v3}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;->onRead(J)V

    goto :goto_0
.end method
