.class public final Lru/mail/libverify/utils/f$a;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/utils/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final a:Ljava/net/HttpURLConnection;

.field private final b:Ljava/lang/String;

.field private c:[B

.field private d:Z


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 2

    const/16 v1, 0x7530

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/utils/f$a;->b:Ljava/lang/String;

    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    iput-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p0, v1}, Lru/mail/libverify/utils/f$a;->b(I)Lru/mail/libverify/utils/a;

    invoke-virtual {p0, v1}, Lru/mail/libverify/utils/f$a;->c(I)Lru/mail/libverify/utils/a;

    invoke-virtual {p0}, Lru/mail/libverify/utils/f$a;->a()Lru/mail/libverify/utils/a;

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Lru/mail/libverify/utils/ClientException;

    invoke-direct {v1, v0}, Lru/mail/libverify/utils/ClientException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public synthetic constructor <init>(Ljava/lang/String;B)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/utils/f$a;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final a()Lru/mail/libverify/utils/a;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    return-object p0
.end method

.method public final a(I)Lru/mail/libverify/utils/a;
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    sget-object v0, Lru/mail/libverify/utils/f$1;->a:[I

    add-int/lit8 v1, p1, -0x1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-object p0

    :pswitch_0
    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    const-string/jumbo v1, "GET"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    const-string/jumbo v1, "POST"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    const-string/jumbo v1, "HEAD"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public final a(Ljava/lang/String;)Lru/mail/libverify/utils/a;
    .locals 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget v0, Lru/mail/libverify/utils/e$a;->b:I

    invoke-virtual {p0, v0}, Lru/mail/libverify/utils/f$a;->a(I)Lru/mail/libverify/utils/a;

    const-string/jumbo v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/utils/f$a;->c:[B

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    const-string/jumbo v1, "Content-Type"

    const-string/jumbo v2, "application/x-www-form-urlencoded"

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    const-string/jumbo v1, "Charset"

    const-string/jumbo v2, "utf-8"

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    const-string/jumbo v1, "Content-Length"

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object p0
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/utils/a;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public final a(Ljavax/net/ssl/SSLSocketFactory;)Lru/mail/libverify/utils/a;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    instance-of v0, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    :cond_0
    return-object p0
.end method

.method public final a(Z)Lru/mail/libverify/utils/a;
    .locals 3

    if-eqz p1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    const-string/jumbo v1, "Connection"

    const-string/jumbo v2, "Keep-Alive"

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-object p0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    const-string/jumbo v1, "Connection"

    const-string/jumbo v2, "Close"

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final b(I)Lru/mail/libverify/utils/a;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    return-object p0
.end method

.method public final b()Lru/mail/libverify/utils/e;
    .locals 6

    new-instance v0, Lru/mail/libverify/utils/f;

    iget-object v1, p0, Lru/mail/libverify/utils/f$a;->b:Ljava/lang/String;

    iget-object v2, p0, Lru/mail/libverify/utils/f$a;->c:[B

    iget-object v3, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    iget-boolean v4, p0, Lru/mail/libverify/utils/f$a;->d:Z

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lru/mail/libverify/utils/f;-><init>(Ljava/lang/String;[BLjava/net/HttpURLConnection;ZB)V

    return-object v0
.end method

.method public final c(I)Lru/mail/libverify/utils/a;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/utils/f$a;->a:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    return-object p0
.end method
