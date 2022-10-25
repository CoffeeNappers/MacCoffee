.class public Lio/sentry/connection/HttpConnection;
.super Lio/sentry/connection/AbstractConnection;
.source "HttpConnection.java"


# static fields
.field private static final DEFAULT_TIMEOUT:I

.field private static final NAIVE_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

.field private static final SENTRY_AUTH:Ljava/lang/String; = "X-Sentry-Auth"

.field private static final USER_AGENT:Ljava/lang/String; = "User-Agent"

.field private static final UTF_8:Ljava/nio/charset/Charset;

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private bypassSecurity:Z

.field private eventSampler:Lio/sentry/connection/EventSampler;

.field private marshaller:Lio/sentry/marshaller/Marshaller;

.field private final proxy:Ljava/net/Proxy;

.field private final sentryUrl:Ljava/net/URL;

.field private timeout:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 27
    const-string/jumbo v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lio/sentry/connection/HttpConnection;->UTF_8:Ljava/nio/charset/Charset;

    .line 28
    const-class v0, Lio/sentry/connection/HttpConnection;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/connection/HttpConnection;->logger:Lorg/slf4j/Logger;

    .line 40
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    long-to-int v0, v0

    sput v0, Lio/sentry/connection/HttpConnection;->DEFAULT_TIMEOUT:I

    .line 44
    new-instance v0, Lio/sentry/connection/HttpConnection$1;

    invoke-direct {v0}, Lio/sentry/connection/HttpConnection$1;-><init>()V

    sput-object v0, Lio/sentry/connection/HttpConnection;->NAIVE_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/net/Proxy;Lio/sentry/connection/EventSampler;)V
    .locals 1
    .param p1, "sentryUrl"    # Ljava/net/URL;
    .param p2, "publicKey"    # Ljava/lang/String;
    .param p3, "secretKey"    # Ljava/lang/String;
    .param p4, "proxy"    # Ljava/net/Proxy;
    .param p5, "eventSampler"    # Lio/sentry/connection/EventSampler;

    .prologue
    .line 86
    invoke-direct {p0, p2, p3}, Lio/sentry/connection/AbstractConnection;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    sget v0, Lio/sentry/connection/HttpConnection;->DEFAULT_TIMEOUT:I

    iput v0, p0, Lio/sentry/connection/HttpConnection;->timeout:I

    .line 74
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/sentry/connection/HttpConnection;->bypassSecurity:Z

    .line 87
    iput-object p1, p0, Lio/sentry/connection/HttpConnection;->sentryUrl:Ljava/net/URL;

    .line 88
    iput-object p4, p0, Lio/sentry/connection/HttpConnection;->proxy:Ljava/net/Proxy;

    .line 89
    iput-object p5, p0, Lio/sentry/connection/HttpConnection;->eventSampler:Lio/sentry/connection/EventSampler;

    .line 90
    return-void
.end method

.method private getErrorMessageFromStream(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 7
    .param p1, "errorStream"    # Ljava/io/InputStream;

    .prologue
    .line 189
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    sget-object v6, Lio/sentry/connection/HttpConnection;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v5, p1, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v3, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 190
    .local v3, "reader":Ljava/io/BufferedReader;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 194
    .local v4, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 195
    .local v1, "first":Z
    :goto_0
    :try_start_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "line":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 196
    if-nez v1, :cond_0

    .line 197
    const-string/jumbo v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    :cond_0
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    const/4 v1, 0x0

    goto :goto_0

    .line 202
    .end local v2    # "line":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e2":Ljava/lang/Exception;
    sget-object v5, Lio/sentry/connection/HttpConnection;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v6, "Exception while reading the error message from the connection."

    invoke-interface {v5, v6, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 205
    .end local v0    # "e2":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static getSentryApiUrl(Ljava/net/URI;Ljava/lang/String;)Ljava/net/URL;
    .locals 4
    .param p0, "sentryUri"    # Ljava/net/URI;
    .param p1, "projectId"    # Ljava/lang/String;

    .prologue
    .line 101
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "api/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/store/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 102
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 103
    .end local v1    # "url":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 104
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Couldn\'t build a valid URL from the Sentry API."

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    return-void
.end method

.method protected doSend(Lio/sentry/event/Event;)V
    .locals 12
    .param p1, "event"    # Lio/sentry/event/Event;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/sentry/connection/ConnectionException;
        }
    .end annotation

    .prologue
    .line 147
    iget-object v7, p0, Lio/sentry/connection/HttpConnection;->eventSampler:Lio/sentry/connection/EventSampler;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lio/sentry/connection/HttpConnection;->eventSampler:Lio/sentry/connection/EventSampler;

    invoke-interface {v7, p1}, Lio/sentry/connection/EventSampler;->shouldSendEvent(Lio/sentry/event/Event;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 186
    :goto_0
    return-void

    .line 151
    :cond_0
    invoke-virtual {p0}, Lio/sentry/connection/HttpConnection;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 153
    .local v0, "connection":Ljava/net/HttpURLConnection;
    :try_start_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 154
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 155
    .local v4, "outputStream":Ljava/io/OutputStream;
    iget-object v7, p0, Lio/sentry/connection/HttpConnection;->marshaller:Lio/sentry/marshaller/Marshaller;

    invoke-interface {v7, p1, v4}, Lio/sentry/marshaller/Marshaller;->marshall(Lio/sentry/event/Event;Ljava/io/OutputStream;)V

    .line 156
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 157
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    .line 158
    .end local v4    # "outputStream":Ljava/io/OutputStream;
    :catch_0
    move-exception v1

    .line 159
    .local v1, "e":Ljava/io/IOException;
    const/4 v2, 0x0

    .line 160
    .local v2, "errorMessage":Ljava/lang/String;
    :try_start_1
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v3

    .line 161
    .local v3, "errorStream":Ljava/io/InputStream;
    if-eqz v3, :cond_1

    .line 162
    invoke-direct {p0, v3}, Lio/sentry/connection/HttpConnection;->getErrorMessageFromStream(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    .line 164
    :cond_1
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 165
    :cond_2
    const-string/jumbo v2, "An exception occurred while submitting the event to the Sentry server."

    .line 168
    :cond_3
    const/4 v6, 0x0

    .line 169
    .local v6, "retryAfterMs":Ljava/lang/Long;
    const-string/jumbo v7, "Retry-After"

    invoke-virtual {v0, v7}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v5

    .line 170
    .local v5, "retryAfterHeader":Ljava/lang/String;
    if-eqz v5, :cond_4

    .line 174
    :try_start_2
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    mul-long/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v6

    .line 182
    :cond_4
    :goto_1
    :try_start_3
    new-instance v7, Lio/sentry/connection/ConnectionException;

    invoke-direct {v7, v2, v1, v6}, Lio/sentry/connection/ConnectionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Long;)V

    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 184
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "errorMessage":Ljava/lang/String;
    .end local v3    # "errorStream":Ljava/io/InputStream;
    .end local v5    # "retryAfterHeader":Ljava/lang/String;
    .end local v6    # "retryAfterMs":Ljava/lang/Long;
    :catchall_0
    move-exception v7

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v7

    .line 176
    .restart local v1    # "e":Ljava/io/IOException;
    .restart local v2    # "errorMessage":Ljava/lang/String;
    .restart local v3    # "errorStream":Ljava/io/InputStream;
    .restart local v5    # "retryAfterHeader":Ljava/lang/String;
    .restart local v6    # "retryAfterMs":Ljava/lang/Long;
    :catch_1
    move-exception v7

    goto :goto_1
.end method

.method protected getConnection()Ljava/net/HttpURLConnection;
    .locals 5

    .prologue
    .line 116
    :try_start_0
    iget-object v3, p0, Lio/sentry/connection/HttpConnection;->proxy:Ljava/net/Proxy;

    if-eqz v3, :cond_3

    .line 117
    iget-object v3, p0, Lio/sentry/connection/HttpConnection;->sentryUrl:Ljava/net/URL;

    iget-object v4, p0, Lio/sentry/connection/HttpConnection;->proxy:Ljava/net/Proxy;

    invoke-virtual {v3, v4}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 122
    .local v1, "connection":Ljava/net/HttpURLConnection;
    :goto_0
    iget-boolean v3, p0, Lio/sentry/connection/HttpConnection;->bypassSecurity:Z

    if-eqz v3, :cond_0

    instance-of v3, v1, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v3, :cond_0

    .line 123
    move-object v0, v1

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    move-object v3, v0

    sget-object v4, Lio/sentry/connection/HttpConnection;->NAIVE_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    invoke-virtual {v3, v4}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 125
    :cond_0
    const-string/jumbo v3, "POST"

    invoke-virtual {v1, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 126
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 127
    iget v3, p0, Lio/sentry/connection/HttpConnection;->timeout:I

    invoke-virtual {v1, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 128
    const-string/jumbo v3, "User-Agent"

    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->getSentryName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    const-string/jumbo v3, "X-Sentry-Auth"

    invoke-virtual {p0}, Lio/sentry/connection/HttpConnection;->getAuthHeader()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    iget-object v3, p0, Lio/sentry/connection/HttpConnection;->marshaller:Lio/sentry/marshaller/Marshaller;

    invoke-interface {v3}, Lio/sentry/marshaller/Marshaller;->getContentType()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 132
    const-string/jumbo v3, "Content-Type"

    iget-object v4, p0, Lio/sentry/connection/HttpConnection;->marshaller:Lio/sentry/marshaller/Marshaller;

    invoke-interface {v4}, Lio/sentry/marshaller/Marshaller;->getContentType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    :cond_1
    iget-object v3, p0, Lio/sentry/connection/HttpConnection;->marshaller:Lio/sentry/marshaller/Marshaller;

    invoke-interface {v3}, Lio/sentry/marshaller/Marshaller;->getContentEncoding()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 136
    const-string/jumbo v3, "Content-Encoding"

    iget-object v4, p0, Lio/sentry/connection/HttpConnection;->marshaller:Lio/sentry/marshaller/Marshaller;

    invoke-interface {v4}, Lio/sentry/marshaller/Marshaller;->getContentEncoding()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    :cond_2
    return-object v1

    .line 119
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    :cond_3
    iget-object v3, p0, Lio/sentry/connection/HttpConnection;->sentryUrl:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v1    # "connection":Ljava/net/HttpURLConnection;
    goto :goto_0

    .line 140
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    :catch_0
    move-exception v2

    .line 141
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Couldn\'t set up a connection to the Sentry server."

    invoke-direct {v3, v4, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public setBypassSecurity(Z)V
    .locals 0
    .param p1, "bypassSecurity"    # Z

    .prologue
    .line 217
    iput-boolean p1, p0, Lio/sentry/connection/HttpConnection;->bypassSecurity:Z

    .line 218
    return-void
.end method

.method public setMarshaller(Lio/sentry/marshaller/Marshaller;)V
    .locals 0
    .param p1, "marshaller"    # Lio/sentry/marshaller/Marshaller;

    .prologue
    .line 213
    iput-object p1, p0, Lio/sentry/connection/HttpConnection;->marshaller:Lio/sentry/marshaller/Marshaller;

    .line 214
    return-void
.end method

.method public setTimeout(I)V
    .locals 0
    .param p1, "timeout"    # I

    .prologue
    .line 209
    iput p1, p0, Lio/sentry/connection/HttpConnection;->timeout:I

    .line 210
    return-void
.end method
