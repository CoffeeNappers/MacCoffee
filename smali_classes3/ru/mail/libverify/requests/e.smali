.class public abstract Lru/mail/libverify/requests/e;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/requests/e$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lru/mail/libverify/requests/response/ClientApiResponseBase;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final b:[Ljava/lang/String;

.field private static final c:[Ljava/lang/String;

.field private static d:I

.field private static e:Ljava/text/SimpleDateFormat;


# instance fields
.field protected final a:Lru/mail/libverify/storage/k;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/Long;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string/jumbo v0, "https://clientapi.mail.ru/"

    const-string/jumbo v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    const-string/jumbo v0, "clientapi_mail_ru"

    const-string/jumbo v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/requests/e;->c:[Ljava/lang/String;

    const/4 v0, 0x0

    sput v0, Lru/mail/libverify/requests/e;->d:I

    return-void
.end method

.method protected constructor <init>(Lru/mail/libverify/storage/k;)V
    .locals 0
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/requests/e;Lru/mail/libverify/utils/e;)Lru/mail/libverify/requests/response/ClientApiResponseBase;
    .locals 1

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;->a(Lru/mail/libverify/utils/e;)Lru/mail/libverify/requests/response/ClientApiResponseBase;

    move-result-object v0

    return-object v0
.end method

.method private a(Lru/mail/libverify/utils/e;)Lru/mail/libverify/requests/response/ClientApiResponseBase;
    .locals 6
    .param p1    # Lru/mail/libverify/utils/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lru/mail/libverify/utils/e;",
            ")TT;"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->r()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "Last-Modified"

    invoke-interface {p1, v0}, Lru/mail/libverify/utils/e;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-nez v1, :cond_0

    :try_start_1
    invoke-static {}, Lru/mail/libverify/requests/e;->x()Ljava/text/SimpleDateFormat;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, p0, Lru/mail/libverify/requests/e;->g:Ljava/lang/Long;

    const-string/jumbo v1, "ClientApiRequest"

    const-string/jumbo v2, "header %s value %s (%d)"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "Last-Modified"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    const/4 v0, 0x2

    iget-object v4, p0, Lru/mail/libverify/requests/e;->g:Ljava/lang/Long;

    aput-object v4, v3, v0

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljavax/net/ssl/SSLException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_0
    :goto_0
    :try_start_2
    invoke-interface {p1}, Lru/mail/libverify/utils/e;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lru/mail/libverify/requests/e;->a(Ljava/lang/String;)Lru/mail/libverify/requests/response/ClientApiResponseBase;

    move-result-object v0

    if-nez v0, :cond_1

    new-instance v0, Lru/mail/libverify/utils/json/JsonParseException;

    const-string/jumbo v1, "Response can\'t be null"

    invoke-direct {v0, v1}, Lru/mail/libverify/utils/json/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catch Ljavax/net/ssl/SSLException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->t()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string/jumbo v1, "ClientApiRequest"

    const-string/jumbo v2, "failed to validate pinned certificate"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v1, Lru/mail/libverify/utils/ClientException;

    invoke-direct {v1, v0}, Lru/mail/libverify/utils/ClientException;-><init>(Ljava/io/IOException;)V

    throw v1

    :catch_1
    move-exception v0

    :try_start_3
    const-string/jumbo v1, "ClientApiRequest"

    const-string/jumbo v2, "failed to parse last modified timestamp from the response"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v0, p0}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->setOwner(Lru/mail/libverify/requests/e;)V
    :try_end_3
    .catch Ljavax/net/ssl/SSLException; {:try_start_3 .. :try_end_3} :catch_0

    return-object v0

    :cond_2
    throw v0
.end method

.method private static a(Ljava/lang/StringBuilder;Ljava/util/Map$Entry;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v2, "Url argument %s can\'t be empty"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "&"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string/jumbo v2, "UTF-8"

    invoke-static {v0, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public static i()V
    .locals 6

    const/4 v1, 0x1

    sget-object v0, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    array-length v0, v0

    if-ne v0, v1, :cond_0

    :goto_0
    return-void

    :cond_0
    const-class v1, Lru/mail/libverify/requests/e;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    sput v0, Lru/mail/libverify/requests/e;->d:I

    const-string/jumbo v0, "ClientApiRequest"

    const-string/jumbo v2, "reset api host to %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    sget v5, Lru/mail/libverify/requests/e;->d:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v0, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private v()Ljava/lang/String;
    .locals 7

    const/4 v6, 0x0

    const-string/jumbo v0, "ClientApiRequest"

    const-string/jumbo v1, "buildRequestUrlUnsigned start"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->a()Lru/mail/libverify/requests/e$a;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget v2, v0, Lru/mail/libverify/requests/e$a;->a:I

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0}, Lru/mail/libverify/requests/e$a;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-static {v1, v0}, Lru/mail/libverify/requests/e;->a(Ljava/lang/StringBuilder;Ljava/util/Map$Entry;)V

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v2, "%s%s?%s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->d()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    const/4 v4, 0x1

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->e()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object v1, v3, v4

    invoke-static {v0, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    const-string/jumbo v1, "ClientApiRequest"

    const-string/jumbo v2, "buildRequestUrlUnsigned end"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private static w()Ljava/lang/String;
    .locals 3

    sget-object v0, Lru/mail/libverify/requests/e;->c:[Ljava/lang/String;

    array-length v0, v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Wrong api certificate config"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    sget-object v0, Lru/mail/libverify/requests/e;->c:[Ljava/lang/String;

    array-length v0, v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    sget-object v0, Lru/mail/libverify/requests/e;->c:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    :goto_0
    return-object v0

    :cond_1
    const-class v1, Lru/mail/libverify/requests/e;

    monitor-enter v1

    :try_start_0
    sget v0, Lru/mail/libverify/requests/e;->d:I

    sget-object v2, Lru/mail/libverify/requests/e;->c:[Ljava/lang/String;

    array-length v2, v2

    if-lt v0, v2, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Wrong api certificate config"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    :try_start_1
    sget-object v0, Lru/mail/libverify/requests/e;->c:[Ljava/lang/String;

    sget v2, Lru/mail/libverify/requests/e;->d:I

    aget-object v0, v0, v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method private static x()Ljava/text/SimpleDateFormat;
    .locals 4

    sget-object v0, Lru/mail/libverify/requests/e;->e:Ljava/text/SimpleDateFormat;

    if-nez v0, :cond_1

    const-class v1, Lru/mail/libverify/requests/e;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lru/mail/libverify/requests/e;->e:Ljava/text/SimpleDateFormat;

    if-nez v0, :cond_0

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "EEE, dd MMM y HH:mm:ss \'GMT\'"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lru/mail/libverify/requests/e;->e:Ljava/text/SimpleDateFormat;

    const-string/jumbo v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sget-object v2, Lru/mail/libverify/requests/e;->e:Ljava/text/SimpleDateFormat;

    invoke-virtual {v2, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lru/mail/libverify/requests/e;->e:Ljava/text/SimpleDateFormat;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public final a(Ljava/util/concurrent/ExecutorService;Lru/mail/libverify/requests/i$b;)Ljava/util/concurrent/Future;
    .locals 3
    .param p1    # Ljava/util/concurrent/ExecutorService;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/requests/i$b;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ExecutorService;",
            "Lru/mail/libverify/requests/i$b",
            "<TT;>;)",
            "Ljava/util/concurrent/Future",
            "<TT;>;"
        }
    .end annotation

    new-instance v0, Lru/mail/libverify/requests/i;

    new-instance v1, Lru/mail/libverify/requests/e$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/requests/e$1;-><init>(Lru/mail/libverify/requests/e;)V

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2, p2}, Lru/mail/libverify/requests/i;-><init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;Lru/mail/libverify/requests/i$a;Lru/mail/libverify/requests/i$b;)V

    invoke-virtual {v0}, Lru/mail/libverify/requests/i;->a()Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method protected a()Lru/mail/libverify/requests/e$a;
    .locals 9

    new-instance v0, Lru/mail/libverify/requests/e$a;

    invoke-direct {v0}, Lru/mail/libverify/requests/e$a;-><init>()V

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->b()Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->p()Lru/mail/libverify/accounts/d;

    move-result-object v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->p()Lru/mail/libverify/accounts/d;

    move-result-object v1

    invoke-virtual {v1}, Lru/mail/libverify/accounts/d;->i()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lru/mail/libverify/accounts/d;->j()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lru/mail/libverify/accounts/d;->b()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lru/mail/libverify/accounts/d;->f()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lru/mail/libverify/accounts/d;->c()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1}, Lru/mail/libverify/accounts/d;->d()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1}, Lru/mail/libverify/accounts/d;->e()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string/jumbo v8, "imei"

    invoke-virtual {v0, v8, v5}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string/jumbo v5, "imsi"

    invoke-virtual {v0, v5, v4}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_1
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string/jumbo v4, "iso_country_code"

    invoke-virtual {v0, v4, v3}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string/jumbo v3, "sim_phone"

    invoke-virtual {v0, v3, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_3
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string/jumbo v2, "sim_state"

    invoke-virtual {v0, v2, v6}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_4
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string/jumbo v2, "sim_operator"

    invoke-virtual {v0, v2, v7}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    const-string/jumbo v2, "sim_operator_name"

    invoke-virtual {v0, v2, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_6
    const-string/jumbo v1, "version"

    iget-object v2, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "application"

    iget-object v2, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "platform"

    const-string/jumbo v2, "android"

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "application_id"

    iget-object v2, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->g()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string/jumbo v2, "device_id"

    invoke-virtual {v0, v2, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_7
    iget-object v1, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->h()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string/jumbo v2, "system_id"

    invoke-virtual {v0, v2, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_8
    return-object v0
.end method

.method protected abstract a(Ljava/lang/String;)Lru/mail/libverify/requests/response/ClientApiResponseBase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

.method protected final a(Lru/mail/libverify/requests/e$a;)V
    .locals 4
    .param p1    # Lru/mail/libverify/requests/e$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->n()Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "location_lat"

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "location_lon"

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "location_accuracy"

    invoke-virtual {v0}, Landroid/location/Location;->getAccuracy()F

    move-result v0

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_0
    return-void
.end method

.method protected abstract b()Z
.end method

.method public abstract c()Lru/mail/libverify/requests/m;
.end method

.method protected d()Ljava/lang/String;
    .locals 3

    sget-object v0, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    array-length v0, v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Wrong api host config"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    sget-object v0, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    array-length v0, v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    sget-object v0, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    :goto_0
    return-object v0

    :cond_1
    const-class v1, Lru/mail/libverify/requests/e;

    monitor-enter v1

    :try_start_0
    sget v0, Lru/mail/libverify/requests/e;->d:I

    sget-object v2, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    array-length v2, v2

    if-lt v0, v2, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Wrong api host config"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    :try_start_1
    sget-object v0, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    sget v2, Lru/mail/libverify/requests/e;->d:I

    aget-object v0, v0, v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method protected e()Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v1, "%s/%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "fcgi-bin"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->f()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract f()Ljava/lang/String;
.end method

.method protected abstract g()Lru/mail/libverify/requests/l;
.end method

.method public final h()Z
    .locals 8

    const/4 v1, 0x1

    const/4 v0, 0x0

    sget-object v2, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    array-length v2, v2

    if-nez v2, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Wrong api host config"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    sget-object v2, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    array-length v2, v2

    if-ne v2, v1, :cond_1

    :goto_0
    return v0

    :cond_1
    const-class v2, Lru/mail/libverify/requests/e;

    monitor-enter v2

    :try_start_0
    sget v3, Lru/mail/libverify/requests/e;->d:I

    sget-object v4, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    if-ne v3, v4, :cond_2

    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    :try_start_1
    iget-object v3, p0, Lru/mail/libverify/requests/e;->f:Ljava/lang/String;

    sget-object v4, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    sget v5, Lru/mail/libverify/requests/e;->d:I

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    monitor-exit v2

    goto :goto_0

    :cond_3
    sget v0, Lru/mail/libverify/requests/e;->d:I

    sget v3, Lru/mail/libverify/requests/e;->d:I

    add-int/lit8 v3, v3, 0x1

    sput v3, Lru/mail/libverify/requests/e;->d:I

    const-string/jumbo v3, "ClientApiRequest"

    const-string/jumbo v4, "switch api host from %s to %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    sget-object v7, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    aget-object v0, v7, v0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    sget-object v6, Lru/mail/libverify/requests/e;->b:[Ljava/lang/String;

    sget v7, Lru/mail/libverify/requests/e;->d:I

    aget-object v6, v6, v7

    aput-object v6, v5, v0

    invoke-static {v3, v4, v5}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v0, v1

    goto :goto_0
.end method

.method public final j()Ljava/lang/String;
    .locals 6
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->g()Lru/mail/libverify/requests/l;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lru/mail/libverify/requests/l;->a()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Request id can\'t be empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v2, "%s_%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->f()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-interface {v0}, Lru/mail/libverify/requests/l;->a()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final k()Lru/mail/libverify/requests/response/ClientApiResponseBase;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->u()Lru/mail/libverify/utils/e;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/mail/libverify/requests/e;->a(Lru/mail/libverify/utils/e;)Lru/mail/libverify/requests/response/ClientApiResponseBase;

    move-result-object v0

    return-object v0
.end method

.method public final l()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->f()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final m()Ljava/lang/Long;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->r()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/requests/e;->g:Ljava/lang/Long;

    goto :goto_0
.end method

.method protected n()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected o()Ljava/lang/Integer;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected p()Ljava/lang/Integer;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected q()Ljava/lang/Long;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected r()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected s()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected t()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final u()Lru/mail/libverify/utils/e;
    .locals 12

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    iget-object v0, p0, Lru/mail/libverify/requests/e;->f:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/requests/e;->f:Ljava/lang/String;

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->d()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_0
    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->n()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string/jumbo v0, "ClientApiRequest"

    const-string/jumbo v1, "buildRequestUrlSigned start"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->a()Lru/mail/libverify/requests/e$a;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    iget v1, v0, Lru/mail/libverify/requests/e$a;->a:I

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    new-instance v3, Ljava/lang/StringBuilder;

    iget v1, v0, Lru/mail/libverify/requests/e$a;->a:I

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    new-instance v4, Ljava/util/TreeSet;

    invoke-direct {v4}, Ljava/util/TreeSet;-><init>()V

    invoke-virtual {v0}, Lru/mail/libverify/requests/e$a;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-static {v2, v0}, Lru/mail/libverify/requests/e;->a(Ljava/lang/StringBuilder;Ljava/util/Map$Entry;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string/jumbo v6, "UTF-8"

    invoke-static {v0, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v5, "%s%s?%s&signature=%s"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->d()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->e()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    aput-object v0, v6, v11

    const/4 v0, 0x3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->f()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v7, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v7}, Lru/mail/libverify/storage/k;->b()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lru/mail/libverify/utils/m;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lru/mail/libverify/utils/m;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v7, "UTF-8"

    invoke-static {v1, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v6, v0

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->setLength(I)V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->setLength(I)V

    const-string/jumbo v1, "ClientApiRequest"

    const-string/jumbo v2, "buildRequestUrlSigned end"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/requests/e;->f:Ljava/lang/String;

    :cond_3
    :goto_2
    iget-object v1, p0, Lru/mail/libverify/requests/e;->f:Ljava/lang/String;

    const/4 v0, 0x0

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->s()Z

    move-result v2

    if-eqz v2, :cond_4

    const-string/jumbo v2, "\\?"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    if-ne v3, v11, :cond_4

    aget-object v1, v2, v9

    aget-object v0, v2, v10

    :cond_4
    iget-object v2, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v2, v1}, Lru/mail/libverify/storage/k;->a(Ljava/lang/String;)Lru/mail/libverify/utils/a;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/utils/a;->a()Lru/mail/libverify/utils/a;

    move-result-object v1

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->t()Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v2

    invoke-static {}, Lru/mail/libverify/requests/e;->w()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lru/mail/libverify/utils/m;->c(Landroid/content/Context;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    invoke-interface {v1, v2}, Lru/mail/libverify/utils/a;->a(Ljavax/net/ssl/SSLSocketFactory;)Lru/mail/libverify/utils/a;

    :cond_5
    iget-object v2, p0, Lru/mail/libverify/requests/e;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->k()Z

    move-result v2

    if-eqz v2, :cond_a

    const-string/jumbo v2, "ClientApiRequest"

    const-string/jumbo v3, "keep-alive disabled because of proxy config"

    invoke-static {v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v9}, Lru/mail/libverify/utils/a;->a(Z)Lru/mail/libverify/utils/a;

    :goto_3
    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->s()Z

    move-result v2

    if-eqz v2, :cond_b

    sget v2, Lru/mail/libverify/utils/e$a;->b:I

    invoke-interface {v1, v2}, Lru/mail/libverify/utils/a;->a(I)Lru/mail/libverify/utils/a;

    move-result-object v2

    invoke-interface {v2, v0}, Lru/mail/libverify/utils/a;->a(Ljava/lang/String;)Lru/mail/libverify/utils/a;

    :goto_4
    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->o()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->o()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v1, v0}, Lru/mail/libverify/utils/a;->c(I)Lru/mail/libverify/utils/a;

    :cond_6
    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->p()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->p()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v1, v0}, Lru/mail/libverify/utils/a;->b(I)Lru/mail/libverify/utils/a;

    :cond_7
    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->q()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_8

    const-string/jumbo v0, "If-Modified-Since"

    invoke-static {}, Lru/mail/libverify/requests/e;->x()Ljava/text/SimpleDateFormat;

    move-result-object v2

    new-instance v3, Ljava/util/Date;

    invoke-virtual {p0}, Lru/mail/libverify/requests/e;->q()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lru/mail/libverify/utils/a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/utils/a;

    :cond_8
    invoke-interface {v1}, Lru/mail/libverify/utils/a;->b()Lru/mail/libverify/utils/e;

    move-result-object v0

    return-object v0

    :cond_9
    invoke-direct {p0}, Lru/mail/libverify/requests/e;->v()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/requests/e;->f:Ljava/lang/String;

    goto/16 :goto_2

    :cond_a
    invoke-interface {v1, v10}, Lru/mail/libverify/utils/a;->a(Z)Lru/mail/libverify/utils/a;

    goto :goto_3

    :cond_b
    sget v0, Lru/mail/libverify/utils/e$a;->a:I

    invoke-interface {v1, v0}, Lru/mail/libverify/utils/a;->a(I)Lru/mail/libverify/utils/a;

    goto :goto_4
.end method
