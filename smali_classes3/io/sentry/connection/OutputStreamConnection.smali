.class public Lio/sentry/connection/OutputStreamConnection;
.super Lio/sentry/connection/AbstractConnection;
.source "OutputStreamConnection.java"


# static fields
.field private static final UTF_8:Ljava/nio/charset/Charset;


# instance fields
.field private marshaller:Lio/sentry/marshaller/Marshaller;

.field private final outputStream:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-string/jumbo v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lio/sentry/connection/OutputStreamConnection;->UTF_8:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "outputStream"    # Ljava/io/OutputStream;

    .prologue
    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, v0, v0}, Lio/sentry/connection/AbstractConnection;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    iput-object p1, p0, Lio/sentry/connection/OutputStreamConnection;->outputStream:Ljava/io/OutputStream;

    .line 26
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lio/sentry/connection/OutputStreamConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 43
    return-void
.end method

.method protected declared-synchronized doSend(Lio/sentry/event/Event;)V
    .locals 4
    .param p1, "event"    # Lio/sentry/event/Event;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/sentry/connection/ConnectionException;
        }
    .end annotation

    .prologue
    .line 31
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lio/sentry/connection/OutputStreamConnection;->outputStream:Ljava/io/OutputStream;

    const-string/jumbo v2, "Sentry event:\n"

    sget-object v3, Lio/sentry/connection/OutputStreamConnection;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 32
    iget-object v1, p0, Lio/sentry/connection/OutputStreamConnection;->marshaller:Lio/sentry/marshaller/Marshaller;

    iget-object v2, p0, Lio/sentry/connection/OutputStreamConnection;->outputStream:Ljava/io/OutputStream;

    invoke-interface {v1, p1, v2}, Lio/sentry/marshaller/Marshaller;->marshall(Lio/sentry/event/Event;Ljava/io/OutputStream;)V

    .line 33
    iget-object v1, p0, Lio/sentry/connection/OutputStreamConnection;->outputStream:Ljava/io/OutputStream;

    const-string/jumbo v2, "\n"

    sget-object v3, Lio/sentry/connection/OutputStreamConnection;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 34
    iget-object v1, p0, Lio/sentry/connection/OutputStreamConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    monitor-exit p0

    return-void

    .line 35
    :catch_0
    move-exception v0

    .line 36
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v1, Lio/sentry/connection/ConnectionException;

    const-string/jumbo v2, "Couldn\'t sent the event properly"

    invoke-direct {v1, v2, v0}, Lio/sentry/connection/ConnectionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setMarshaller(Lio/sentry/marshaller/Marshaller;)V
    .locals 0
    .param p1, "marshaller"    # Lio/sentry/marshaller/Marshaller;

    .prologue
    .line 46
    iput-object p1, p0, Lio/sentry/connection/OutputStreamConnection;->marshaller:Lio/sentry/marshaller/Marshaller;

    .line 47
    return-void
.end method
