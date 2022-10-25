.class final Lru/mail/libverify/api/c;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/api/c$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/util/regex/Pattern;


# instance fields
.field private final b:Lru/mail/libverify/storage/k;

.field private final c:Lru/mail/libverify/api/b;

.field private final d:Ljava/lang/Runnable;

.field private volatile e:Lru/mail/libverify/requests/response/SmsInfo;

.field private volatile f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/sms/SmsItem;",
            ">;"
        }
    .end annotation
.end field

.field private g:Lru/mail/libverify/api/VerificationApi$AccountCheckListener;

.field private h:Ljava/lang/String;

.field private i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lru/mail/libverify/sms/SmsItem;",
            ">;"
        }
    .end annotation
.end field

.field private j:Ljava/util/concurrent/Future;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "^.*(\\d{4,}).*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/api/c;->a:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/api/b;)V
    .locals 1
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lru/mail/libverify/api/c$1;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/c$1;-><init>(Lru/mail/libverify/api/c;)V

    iput-object v0, p0, Lru/mail/libverify/api/c;->d:Ljava/lang/Runnable;

    iput-object p1, p0, Lru/mail/libverify/api/c;->b:Lru/mail/libverify/storage/k;

    iput-object p2, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/api/c;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/c;->f:Ljava/util/List;

    return-object p1
.end method

.method static synthetic a(Lru/mail/libverify/api/c;)Lru/mail/libverify/requests/response/SmsInfo;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/c;->e:Lru/mail/libverify/requests/response/SmsInfo;

    return-object v0
.end method

.method static synthetic a(Lru/mail/libverify/requests/response/SmsInfo;Lru/mail/libverify/api/h$a;Lru/mail/libverify/api/c$a;)Lru/mail/libverify/sms/c$a;
    .locals 1

    invoke-static {p0, p1, p2}, Lru/mail/libverify/api/c;->b(Lru/mail/libverify/requests/response/SmsInfo;Lru/mail/libverify/api/h$a;Lru/mail/libverify/api/c$a;)Lru/mail/libverify/sms/c$a;

    move-result-object v0

    return-object v0
.end method

.method private a(Ljava/util/List;)V
    .locals 5
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/sms/SmsItem;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "account data %s check completed, sms found %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    iget-object v1, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    invoke-static {p1}, Lru/mail/libverify/api/c;->b(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->OK:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    invoke-interface {v0, v1, v2, v3}, Lru/mail/libverify/api/b;->a(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V

    iget-object v0, p0, Lru/mail/libverify/api/c;->g:Lru/mail/libverify/api/VerificationApi$AccountCheckListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/c;->g:Lru/mail/libverify/api/VerificationApi$AccountCheckListener;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->OK:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/VerificationApi$AccountCheckListener;->onComplete(Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V

    :cond_0
    invoke-direct {p0}, Lru/mail/libverify/api/c;->g()V

    invoke-direct {p0}, Lru/mail/libverify/api/c;->h()V

    return-void
.end method

.method private a(Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V
    .locals 5

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "failed to check account data %s, error %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    iget-object v1, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    invoke-static {p1}, Lru/mail/libverify/api/c;->b(Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2, p1}, Lru/mail/libverify/api/b;->a(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V

    iget-object v0, p0, Lru/mail/libverify/api/c;->g:Lru/mail/libverify/api/VerificationApi$AccountCheckListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/c;->g:Lru/mail/libverify/api/VerificationApi$AccountCheckListener;

    invoke-interface {v0, p1}, Lru/mail/libverify/api/VerificationApi$AccountCheckListener;->onComplete(Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V

    :cond_0
    sget-object v0, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->GENERAL_ERROR:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    if-eq p1, v0, :cond_1

    invoke-direct {p0}, Lru/mail/libverify/api/c;->g()V

    invoke-direct {p0}, Lru/mail/libverify/api/c;->h()V

    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lru/mail/libverify/api/c;->b()V

    goto :goto_0
.end method

.method static synthetic a(Lru/mail/libverify/api/c;Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V

    return-void
.end method

.method private static b(Ljava/util/List;)Ljava/lang/String;
    .locals 4
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/sms/SmsItem;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return-object v0

    :cond_0
    :try_start_0
    new-instance v1, Lru/mail/libverify/api/AccountCheckFormatter;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/AccountCheckFormatter;-><init>(Ljava/util/List;)V

    invoke-static {v1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string/jumbo v2, "AccountChecker"

    const-string/jumbo v3, "failed to format json"

    invoke-static {v2, v3, v1}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static b(Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)Ljava/lang/String;
    .locals 3

    :try_start_0
    new-instance v0, Lru/mail/libverify/api/AccountCheckFormatter;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/AccountCheckFormatter;-><init>(Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V

    invoke-static {v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "AccountChecker"

    const-string/jumbo v2, "failed to format json"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic b(Lru/mail/libverify/api/c;)Ljava/util/concurrent/Future;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/api/c;->j:Ljava/util/concurrent/Future;

    return-object v0
.end method

.method private static b(Lru/mail/libverify/requests/response/SmsInfo;Lru/mail/libverify/api/h$a;Lru/mail/libverify/api/c$a;)Lru/mail/libverify/sms/c$a;
    .locals 1
    .param p0    # Lru/mail/libverify/requests/response/SmsInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lru/mail/libverify/api/h$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/api/c$3;

    invoke-direct {v0, p1, p2, p0}, Lru/mail/libverify/api/c$3;-><init>(Lru/mail/libverify/api/h$a;Lru/mail/libverify/api/c$a;Lru/mail/libverify/requests/response/SmsInfo;)V

    return-object v0
.end method

.method static synthetic b(Lru/mail/libverify/api/c;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/api/c;->a(Ljava/util/List;)V

    return-void
.end method

.method static synthetic b(Lru/mail/libverify/requests/response/SmsInfo;)Z
    .locals 1

    invoke-static {p0}, Lru/mail/libverify/api/c;->c(Lru/mail/libverify/requests/response/SmsInfo;)Z

    move-result v0

    return v0
.end method

.method static synthetic c()Ljava/util/regex/Pattern;
    .locals 1

    sget-object v0, Lru/mail/libverify/api/c;->a:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method static synthetic c(Lru/mail/libverify/api/c;)Lru/mail/libverify/api/b;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    return-object v0
.end method

.method private static c(Lru/mail/libverify/requests/response/SmsInfo;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Lru/mail/libverify/requests/response/SmsInfo;->getSmsTemplates()[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/SmsInfo;->getSmsTemplates()[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/SmsInfo;->getSourceNumbers()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/SmsInfo;->getSourceNumbers()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method static synthetic d(Lru/mail/libverify/api/c;)Lru/mail/libverify/storage/k;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/c;->b:Lru/mail/libverify/storage/k;

    return-object v0
.end method

.method private d()V
    .locals 6

    iget-object v0, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "no intercepted sms"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/api/c;->e:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-static {v0}, Lru/mail/libverify/api/c;->c(Lru/mail/libverify/requests/response/SmsInfo;)Z

    move-result v0

    if-eqz v0, :cond_1

    :try_start_0
    new-instance v0, Lru/mail/libverify/api/c$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lru/mail/libverify/api/c$a;-><init>(B)V

    new-instance v1, Lru/mail/libverify/api/h$a;

    invoke-direct {v1}, Lru/mail/libverify/api/h$a;-><init>()V

    iget-object v2, p0, Lru/mail/libverify/api/c;->e:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-virtual {v2}, Lru/mail/libverify/requests/response/SmsInfo;->getSmsTemplates()[Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    iget-object v2, p0, Lru/mail/libverify/api/c;->e:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-static {v2, v1, v0}, Lru/mail/libverify/api/c;->b(Lru/mail/libverify/requests/response/SmsInfo;Lru/mail/libverify/api/h$a;Lru/mail/libverify/api/c$a;)Lru/mail/libverify/sms/c$a;

    move-result-object v1

    iget-object v2, p0, Lru/mail/libverify/api/c;->b:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->r()Lru/mail/libverify/sms/c;

    move-result-object v2

    iget-object v3, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Lru/mail/libverify/sms/c;->a(Lru/mail/libverify/sms/c$a;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lru/mail/libverify/api/c;->b(Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "AccountChecker"

    const-string/jumbo v3, "intercepted sms parse result %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lru/mail/libverify/api/c;->h()V

    goto :goto_0

    :cond_3
    :try_start_1
    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/b;->a(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-direct {p0}, Lru/mail/libverify/api/c;->h()V

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "failed to process intercepted sms"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-direct {p0}, Lru/mail/libverify/api/c;->h()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-direct {p0}, Lru/mail/libverify/api/c;->h()V

    throw v0
.end method

.method static synthetic e(Lru/mail/libverify/api/c;)Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/c;->f:Ljava/util/List;

    return-object v0
.end method

.method private e()V
    .locals 5

    const/4 v2, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "no application json"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/c;->f:Ljava/util/List;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "application check has been already completed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/c;->f:Ljava/util/List;

    invoke-direct {p0, v0}, Lru/mail/libverify/api/c;->a(Ljava/util/List;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/c;->j:Ljava/util/concurrent/Future;

    if-nez v0, :cond_2

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "start sms finding process for the account data %s"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->e()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/api/c$2;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/c$2;-><init>(Lru/mail/libverify/api/c;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/c;->j:Ljava/util/concurrent/Future;

    goto :goto_0

    :cond_2
    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "sms finding process for the account data %s has been already started"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private f()V
    .locals 4

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->a()V

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->f()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/c;->d:Ljava/lang/Runnable;

    const-wide/32 v2, 0x1b7740

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private g()V
    .locals 4

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    return-void
.end method

.method private h()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->f()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/c;->d:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_app_json"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_intercepted_sms"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    iput-object v2, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    iput-object v2, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    return-void
.end method

.method private i()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_app_json"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    if-nez v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_intercepted_sms"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-class v1, Lru/mail/libverify/sms/SmsItem;

    invoke-static {v0, v1}, Lru/mail/libverify/utils/json/a;->c(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "failed to restore intercepted sms"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_intercepted_sms"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    goto :goto_0
.end method

.method private j()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_app_json"

    iget-object v2, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    :goto_0
    iget-object v0, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_intercepted_sms"

    iget-object v2, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    invoke-static {v2}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_time"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "failed to save intercepted sms"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_intercepted_sms"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    goto :goto_1
.end method


# virtual methods
.method public final a()V
    .locals 2

    invoke-direct {p0}, Lru/mail/libverify/api/c;->i()V

    iget-object v0, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    iget-object v1, p0, Lru/mail/libverify/api/c;->g:Lru/mail/libverify/api/VerificationApi$AccountCheckListener;

    invoke-virtual {p0, v0, v1}, Lru/mail/libverify/api/c;->a(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckListener;)V

    :cond_0
    return-void
.end method

.method public final a(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckListener;)V
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/VerificationApi$AccountCheckListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->EMPTY_ACCOUNT_DATA:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    invoke-direct {p0, v0}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v3, "account_check_time"

    invoke-interface {v0, v3}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-ltz v0, :cond_1

    const-wide/32 v6, 0x2932e00

    cmp-long v0, v4, v6

    if-gez v0, :cond_1

    move v0, v1

    :goto_1
    if-nez v0, :cond_2

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v3, "account data %s check dismissed by timeout"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    invoke-static {v0, v3, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_1

    :cond_2
    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v3, "account data %s check started"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    invoke-static {v0, v3, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iput-object p2, p0, Lru/mail/libverify/api/c;->g:Lru/mail/libverify/api/VerificationApi$AccountCheckListener;

    iput-object p1, p0, Lru/mail/libverify/api/c;->h:Ljava/lang/String;

    invoke-direct {p0}, Lru/mail/libverify/api/c;->j()V

    iget-object v0, p0, Lru/mail/libverify/api/c;->b:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "android.permission.READ_SMS"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    sget-object v0, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->NO_SMS_PERMISSION:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    invoke-direct {p0, v0}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lru/mail/libverify/api/c;->e:Lru/mail/libverify/requests/response/SmsInfo;

    if-nez v0, :cond_4

    invoke-direct {p0}, Lru/mail/libverify/api/c;->f()V

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lru/mail/libverify/api/c;->e()V

    goto :goto_0
.end method

.method public final a(Lru/mail/libverify/requests/response/SmsInfo;)V
    .locals 0
    .param p1    # Lru/mail/libverify/requests/response/SmsInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lru/mail/libverify/api/c;->e:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-direct {p0}, Lru/mail/libverify/api/c;->e()V

    invoke-direct {p0}, Lru/mail/libverify/api/c;->d()V

    return-void
.end method

.method public final a(Lru/mail/libverify/sms/SmsItem;)V
    .locals 5
    .param p1    # Lru/mail/libverify/sms/SmsItem;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "process alien sms from %s with text %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p1, Lru/mail/libverify/sms/SmsItem;->from:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p1, Lru/mail/libverify/sms/SmsItem;->extracted:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lru/mail/libverify/api/c;->i()V

    iget-object v0, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/c;->i:Ljava/util/Map;

    iget-object v1, p1, Lru/mail/libverify/sms/SmsItem;->from:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lru/mail/libverify/api/c;->j()V

    iget-object v0, p0, Lru/mail/libverify/api/c;->e:Lru/mail/libverify/requests/response/SmsInfo;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lru/mail/libverify/api/c;->f()V

    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lru/mail/libverify/api/c;->d()V

    goto :goto_0
.end method

.method public final b()V
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "reset started"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lru/mail/libverify/api/c;->h()V

    iget-object v0, p0, Lru/mail/libverify/api/c;->c:Lru/mail/libverify/api/b;

    invoke-interface {v0}, Lru/mail/libverify/api/b;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "account_check_time"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    iput-object v2, p0, Lru/mail/libverify/api/c;->e:Lru/mail/libverify/requests/response/SmsInfo;

    iput-object v2, p0, Lru/mail/libverify/api/c;->f:Ljava/util/List;

    iget-object v0, p0, Lru/mail/libverify/api/c;->j:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/c;->j:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iput-object v2, p0, Lru/mail/libverify/api/c;->j:Ljava/util/concurrent/Future;

    :cond_0
    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "reset completed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
