.class public final Lru/mail/libverify/utils/f;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/utils/f$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:[B

.field private final c:Ljava/net/HttpURLConnection;

.field private final d:Z

.field private e:Z

.field private f:Z


# direct methods
.method private constructor <init>(Ljava/lang/String;[BLjava/net/HttpURLConnection;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/utils/f;->a:Ljava/lang/String;

    iput-object p2, p0, Lru/mail/libverify/utils/f;->b:[B

    iput-object p3, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    iput-boolean p4, p0, Lru/mail/libverify/utils/f;->d:Z

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;[BLjava/net/HttpURLConnection;ZB)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lru/mail/libverify/utils/f;-><init>(Ljava/lang/String;[BLjava/net/HttpURLConnection;Z)V

    return-void
.end method

.method private static a(Ljava/io/InputStream;)V
    .locals 3

    if-nez p0, :cond_0

    :goto_0
    return-void

    :cond_0
    const/16 v0, 0x400

    :try_start_0
    new-array v0, v0, [B

    :cond_1
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-gez v1, :cond_1

    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "HttpConnection.emptyAndClose"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    :goto_1
    throw v0

    :catch_1
    move-exception v1

    const-string/jumbo v2, "HttpConnection.emptyAndClose"

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private b(Ljava/lang/String;)V
    .locals 5

    iget-boolean v0, p0, Lru/mail/libverify/utils/f;->e:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lru/mail/libverify/utils/f;->e:Z

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/utils/f;->a:Ljava/lang/String;

    invoke-static {p1, v0}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method private c()I
    .locals 2

    const-string/jumbo v0, "HttpConnection.getResponseCode"

    invoke-direct {p0, v0}, Lru/mail/libverify/utils/f;->b(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lru/mail/libverify/utils/ClientException;

    const-string/jumbo v1, "The thread has been cancelled before the request start"

    invoke-direct {v0, v1}, Lru/mail/libverify/utils/ClientException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const-string/jumbo v1, "HttpConnection.getResponseCode\'1"

    invoke-direct {p0, v1}, Lru/mail/libverify/utils/f;->c(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const-string/jumbo v1, "HttpConnection.getResponseCode\'2"

    invoke-direct {p0, v1}, Lru/mail/libverify/utils/f;->c(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private c(Ljava/lang/String;)V
    .locals 5

    iget-boolean v0, p0, Lru/mail/libverify/utils/f;->f:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lru/mail/libverify/utils/f;->f:Z

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v0, "contentLength : "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method private d()V
    .locals 2

    const-string/jumbo v0, "HttpConnection.emptyAndClose"

    invoke-direct {p0, v0}, Lru/mail/libverify/utils/f;->b(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/utils/f;->a(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    :try_start_1
    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/utils/f;->a(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    const-string/jumbo v0, "HttpConnection.emptyAndClose"

    invoke-direct {p0, v0}, Lru/mail/libverify/utils/f;->c(Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "HttpConnection.emptyAndClose"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string/jumbo v1, "HttpConnection.emptyAndClose"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private e()Ljava/io/InputStream;
    .locals 3

    const-string/jumbo v0, "HttpConnection.getInputStream"

    invoke-direct {p0, v0}, Lru/mail/libverify/utils/f;->b(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    :try_start_1
    iget-object v1, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Lru/mail/libverify/utils/f;->a(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    :cond_0
    :goto_0
    const-string/jumbo v1, "HttpConnection.getInputStream"

    invoke-direct {p0, v1}, Lru/mail/libverify/utils/f;->c(Ljava/lang/String;)V

    return-object v0

    :catch_0
    move-exception v1

    :try_start_2
    const-string/jumbo v2, "getInputStream\'\'1"

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v1, v0

    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    const-string/jumbo v2, "getInputStream\'\'2"

    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "errorStream is null"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 7

    const-string/jumbo v0, "HttpConnection.getResponseAsString"

    invoke-direct {p0, v0}, Lru/mail/libverify/utils/f;->b(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "POST"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/utils/f;->b:[B

    if-eqz v0, :cond_1

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lru/mail/libverify/utils/f;->d()V

    new-instance v0, Lru/mail/libverify/utils/ClientException;

    const-string/jumbo v1, "The thread has been cancelled before post data"

    invoke-direct {v0, v1}, Lru/mail/libverify/utils/ClientException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0

    :cond_0
    :try_start_1
    const-string/jumbo v0, "HttpConnection.getResponseAsString"

    const-string/jumbo v1, "post data started"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v2, 0x0

    :try_start_2
    new-instance v1, Ljava/io/DataOutputStream;

    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    iget-object v0, p0, Lru/mail/libverify/utils/f;->b:[B

    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->write([B)V

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    const-string/jumbo v0, "HttpConnection.getResponseAsString"

    const-string/jumbo v2, "post data completed"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    :try_start_4
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    :cond_1
    invoke-direct {p0}, Lru/mail/libverify/utils/f;->c()I

    move-result v0

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-direct {p0}, Lru/mail/libverify/utils/f;->d()V

    new-instance v0, Lru/mail/libverify/utils/ClientException;

    const-string/jumbo v1, "The thread has been cancelled after connection start"

    invoke-direct {v0, v1}, Lru/mail/libverify/utils/ClientException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_1
    move-exception v0

    move-object v1, v2

    :goto_0
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    :cond_2
    throw v0

    :cond_3
    const/16 v1, 0xc8

    if-eq v0, v1, :cond_4

    invoke-direct {p0}, Lru/mail/libverify/utils/f;->d()V

    new-instance v1, Lru/mail/libverify/utils/ServerException;

    invoke-direct {v1, v0}, Lru/mail/libverify/utils/ServerException;-><init>(I)V

    throw v1

    :cond_4
    invoke-direct {p0}, Lru/mail/libverify/utils/f;->e()Ljava/io/InputStream;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v2

    :try_start_5
    const-string/jumbo v0, "UTF-8"

    iget-boolean v1, p0, Lru/mail/libverify/utils/f;->d:Z

    if-eqz v1, :cond_5

    const-string/jumbo v1, "Content-Type"

    invoke-virtual {p0, v1}, Lru/mail/libverify/utils/f;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    const-string/jumbo v3, " "

    const-string/jumbo v4, ""

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v3, ";"

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v4, :cond_5

    aget-object v5, v3, v1

    const-string/jumbo v6, "charset="

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    const-string/jumbo v0, "="

    const/4 v1, 0x2

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v3, 0x400

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    :try_start_6
    new-instance v4, Ljava/io/BufferedReader;

    invoke-direct {v4, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    :goto_2
    :try_start_7
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception v0

    :try_start_8
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    :catchall_3
    move-exception v0

    :try_start_9
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V

    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    :catchall_4
    move-exception v0

    :try_start_a
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_7
    :try_start_b
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    :try_start_c
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "HttpConnection.getResponseAsString"

    invoke-direct {p0, v1}, Lru/mail/libverify/utils/f;->c(Ljava/lang/String;)V

    const-string/jumbo v1, "HttpConnection.getResponseAsString"

    invoke-static {v1, v0}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    :try_start_d
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    iget-object v1, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    :catchall_5
    move-exception v0

    goto/16 :goto_0
.end method

.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string/jumbo v0, "HttpConnection.getHeaderField"

    invoke-direct {p0, v0}, Lru/mail/libverify/utils/f;->b(Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "HttpConnection.getHeaderField"

    invoke-direct {p0, v1}, Lru/mail/libverify/utils/f;->c(Ljava/lang/String;)V

    return-object v0
.end method

.method public final b()V
    .locals 1

    const-string/jumbo v0, "HttpConnection.disconnect"

    invoke-direct {p0, v0}, Lru/mail/libverify/utils/f;->b(Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/utils/f;->c:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void
.end method
