.class public final Lru/mail/libverify/requests/h;
.super Lru/mail/libverify/requests/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lru/mail/libverify/requests/e",
        "<",
        "Lru/mail/libverify/requests/response/FetchDataResponse;",
        ">;"
    }
.end annotation


# static fields
.field private static final b:Ljava/lang/Integer;

.field private static final c:Ljava/lang/Integer;

.field private static final d:Ljava/lang/Long;


# instance fields
.field private final e:Lru/mail/libverify/requests/f;

.field private final f:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const v0, 0x1b7740

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/requests/h;->b:Ljava/lang/Integer;

    const v0, 0x9c40

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/requests/h;->c:Ljava/lang/Integer;

    const-wide/32 v0, 0x1b7740

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/requests/h;->d:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Lru/mail/libverify/storage/k;Ljava/lang/String;J)V
    .locals 1
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;-><init>(Lru/mail/libverify/storage/k;)V

    new-instance v0, Lru/mail/libverify/requests/f;

    invoke-direct {v0, p2}, Lru/mail/libverify/requests/f;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/requests/h;->e:Lru/mail/libverify/requests/f;

    iput-wide p3, p0, Lru/mail/libverify/requests/h;->f:J

    return-void
.end method


# virtual methods
.method protected final a()Lru/mail/libverify/requests/e$a;
    .locals 3

    invoke-super {p0}, Lru/mail/libverify/requests/e;->a()Lru/mail/libverify/requests/e$a;

    move-result-object v0

    const-string/jumbo v1, "application_id"

    iget-object v2, p0, Lru/mail/libverify/requests/h;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->f()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    return-object v0
.end method

.method protected final synthetic a(Ljava/lang/String;)Lru/mail/libverify/requests/response/ClientApiResponseBase;
    .locals 6

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lru/mail/libverify/utils/json/JsonParseException;

    const-string/jumbo v1, "jsonAnswer can\'t be null"

    invoke-direct {v0, v1}, Lru/mail/libverify/utils/json/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const-string/jumbo v0, "}"

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-eq v0, v1, :cond_1

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v1, "["

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "]"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_2
    const-class v0, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;

    invoke-static {p1, v0}, Lru/mail/libverify/utils/json/a;->b(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Lru/mail/libverify/requests/response/FetcherInfo;->setTimestamp(J)V

    goto :goto_0

    :cond_4
    new-instance v0, Lru/mail/libverify/requests/response/FetchDataResponse;

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/response/FetchDataResponse;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected final b()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final c()Lru/mail/libverify/requests/m;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected final d()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/h;->e:Lru/mail/libverify/requests/f;

    invoke-virtual {v0}, Lru/mail/libverify/requests/f;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final e()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/h;->e:Lru/mail/libverify/requests/f;

    iget-object v0, v0, Lru/mail/libverify/requests/f;->a:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final f()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/h;->e:Lru/mail/libverify/requests/f;

    invoke-virtual {v0}, Lru/mail/libverify/requests/f;->b()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final g()Lru/mail/libverify/requests/l;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected final o()Ljava/lang/Integer;
    .locals 1

    sget-object v0, Lru/mail/libverify/requests/h;->b:Ljava/lang/Integer;

    return-object v0
.end method

.method protected final p()Ljava/lang/Integer;
    .locals 1

    sget-object v0, Lru/mail/libverify/requests/h;->c:Ljava/lang/Integer;

    return-object v0
.end method

.method protected final q()Ljava/lang/Long;
    .locals 4

    iget-wide v0, p0, Lru/mail/libverify/requests/h;->f:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v2, Lru/mail/libverify/requests/h;->d:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-wide v0, p0, Lru/mail/libverify/requests/h;->f:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0
.end method

.method protected final r()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
