.class public abstract Lcom/my/tracker/async/commands/c;
.super Lcom/my/tracker/async/commands/b;
.source "AbstractHttpCommand.java"


# instance fields
.field protected b:Ljava/lang/String;

.field protected c:Lcom/my/tracker/b;

.field protected d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/my/tracker/b;Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0, p3}, Lcom/my/tracker/async/commands/b;-><init>(Landroid/content/Context;)V

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/async/commands/c;->d:Ljava/util/Map;

    .line 46
    iput-object p1, p0, Lcom/my/tracker/async/commands/c;->b:Ljava/lang/String;

    .line 47
    iput-object p2, p0, Lcom/my/tracker/async/commands/c;->c:Lcom/my/tracker/b;

    .line 48
    return-void
.end method


# virtual methods
.method protected final a(Ljava/lang/String;)Z
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 91
    const/4 v1, 0x0

    .line 1131
    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/async/commands/c;->b:Ljava/lang/String;

    .line 95
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "send POST request: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 97
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    const/16 v1, 0x2710

    :try_start_1
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 99
    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 100
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 101
    const-string/jumbo v1, "POST"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 102
    const-string/jumbo v1, "connection"

    const-string/jumbo v4, "close"

    invoke-virtual {v0, v1, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    const-string/jumbo v1, "Content-Type"

    const-string/jumbo v4, "application/json"

    invoke-virtual {v0, v1, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    const-string/jumbo v1, "Content-Encoding"

    const-string/jumbo v4, "gzip"

    invoke-virtual {v0, v1, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 107
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 109
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 110
    new-instance v4, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v4, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 111
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/util/zip/GZIPOutputStream;->write([B)V

    .line 112
    invoke-virtual {v4}, Ljava/util/zip/GZIPOutputStream;->flush()V

    .line 113
    invoke-virtual {v4}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 115
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    .line 116
    const/16 v1, 0xc8

    if-eq v4, v1, :cond_0

    const/16 v1, 0xcc

    if-ne v4, v1, :cond_2

    :cond_0
    move v1, v3

    .line 118
    :goto_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 119
    if-nez v1, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "send request failed. response code: "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    :cond_1
    move v0, v1

    .line 125
    :goto_1
    return v0

    :cond_2
    move v1, v2

    .line 116
    goto :goto_0

    .line 121
    :catch_0
    move-exception v0

    .line 123
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "Error: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 124
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_3
    move v0, v2

    .line 125
    goto :goto_1

    .line 121
    :catch_1
    move-exception v1

    move-object v6, v1

    move-object v1, v0

    move-object v0, v6

    goto :goto_2
.end method

.method protected final d()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 57
    :try_start_0
    iget-object v2, p0, Lcom/my/tracker/async/commands/c;->c:Lcom/my/tracker/b;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/my/tracker/async/commands/c;->c:Lcom/my/tracker/b;

    .line 58
    invoke-virtual {v2}, Lcom/my/tracker/b;->w()Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v0

    .line 60
    :goto_0
    invoke-static {}, Lcom/my/tracker/providers/e;->a()Lcom/my/tracker/providers/e;

    move-result-object v3

    invoke-virtual {v3}, Lcom/my/tracker/providers/e;->c()Lcom/my/tracker/providers/g;

    move-result-object v3

    .line 61
    invoke-virtual {v3, v2}, Lcom/my/tracker/providers/g;->a(Z)V

    .line 63
    iget-object v2, p0, Lcom/my/tracker/async/commands/c;->c:Lcom/my/tracker/b;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/my/tracker/async/commands/c;->c:Lcom/my/tracker/b;

    .line 64
    invoke-virtual {v2}, Lcom/my/tracker/b;->u()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 66
    :goto_1
    invoke-static {}, Lcom/my/tracker/providers/e;->a()Lcom/my/tracker/providers/e;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/tracker/providers/e;->e()Lcom/my/tracker/providers/d;

    move-result-object v1

    .line 67
    invoke-virtual {v1, v0}, Lcom/my/tracker/providers/d;->a(Z)V

    .line 69
    invoke-static {}, Lcom/my/tracker/providers/e;->a()Lcom/my/tracker/providers/e;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/async/commands/c;->a:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/my/tracker/providers/e;->b(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :goto_2
    return-void

    :cond_0
    move v2, v1

    .line 58
    goto :goto_0

    :cond_1
    move v0, v1

    .line 64
    goto :goto_1

    .line 70
    :catch_0
    move-exception v0

    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Error collecting data: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_2
.end method

.method protected final e()Z
    .locals 2

    .prologue
    .line 80
    :try_start_0
    invoke-static {}, Lcom/my/tracker/providers/e;->a()Lcom/my/tracker/providers/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/tracker/providers/e;->b()Lcom/my/tracker/providers/h;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/async/commands/c;->a:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/my/tracker/providers/h;->b(Landroid/content/Context;)V

    .line 81
    invoke-static {}, Lcom/my/tracker/providers/e;->a()Lcom/my/tracker/providers/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/tracker/providers/e;->b()Lcom/my/tracker/providers/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/tracker/providers/h;->a()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 84
    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x1

    goto :goto_0
.end method
