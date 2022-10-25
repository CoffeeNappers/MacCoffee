.class final Lru/mail/libverify/api/r;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/api/r$a;,
        Lru/mail/libverify/api/r$b;
    }
.end annotation


# static fields
.field private static d:Ljava/util/regex/Pattern;


# instance fields
.field final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lru/mail/libverify/api/r$b;",
            ">;"
        }
    .end annotation
.end field

.field final b:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;",
            ">;"
        }
    .end annotation
.end field

.field final c:Lru/mail/libverify/api/q;

.field private final e:Lru/mail/libverify/storage/k;


# direct methods
.method constructor <init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/api/q;)V
    .locals 2
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/q;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/api/r;->a:Ljava/util/HashMap;

    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    iput-object v0, p0, Lru/mail/libverify/api/r;->b:Landroid/util/LruCache;

    iput-object p1, p0, Lru/mail/libverify/api/r;->e:Lru/mail/libverify/storage/k;

    iput-object p2, p0, Lru/mail/libverify/api/r;->c:Lru/mail/libverify/api/q;

    return-void
.end method

.method static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    sget-object v0, Lru/mail/libverify/api/r;->d:Ljava/util/regex/Pattern;

    if-nez v0, :cond_0

    const-string/jumbo v0, "[^\\+0-9]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/api/r;->d:Ljava/util/regex/Pattern;

    :cond_0
    sget-object v0, Lru/mail/libverify/api/r;->d:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v1, "%s_%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static a(Lru/mail/libverify/api/r$a;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V
    .locals 3
    .param p0    # Lru/mail/libverify/api/r$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/r$a;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/r$a;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

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

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru/mail/libverify/api/VerificationApi$PhoneCheckListener;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1, v0, p1}, Lru/mail/libverify/api/VerificationApi$PhoneCheckListener;->onCompleted(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method final a(Lru/mail/libverify/requests/j;Ljava/util/concurrent/Future;Lru/mail/libverify/api/r$a;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
    .locals 8
    .param p1    # Lru/mail/libverify/requests/j;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lru/mail/libverify/api/r$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lru/mail/libverify/requests/j;",
            "Ljava/util/concurrent/Future",
            "<",
            "Lru/mail/libverify/requests/response/PhoneInfoResponse;",
            ">;",
            "Lru/mail/libverify/api/r$a;",
            ")",
            "Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;"
        }
    .end annotation

    const/4 v7, 0x1

    const/4 v6, 0x0

    :try_start_0
    invoke-interface {p2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/PhoneInfoResponse;

    sget-object v1, Lru/mail/libverify/api/r$2;->a:[I

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/PhoneInfoResponse;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v2

    invoke-virtual {v2}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    iget-object v1, p0, Lru/mail/libverify/api/r;->c:Lru/mail/libverify/api/q;

    invoke-interface {v1, v0}, Lru/mail/libverify/api/q;->a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V

    invoke-static {}, Lru/mail/libverify/api/p;->a()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    :cond_0
    :goto_0
    const-string/jumbo v1, "PhoneNumberChecker"

    const-string/jumbo v2, "Check %s completed"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p3, Lru/mail/libverify/api/r$a;->e:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_1
    return-object v0

    :pswitch_0
    invoke-static {v0}, Lru/mail/libverify/api/p;->a(Lru/mail/libverify/requests/response/PhoneInfoResponse;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/r;->b:Landroid/util/LruCache;

    iget-object v2, p3, Lru/mail/libverify/api/r$a;->h:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;->getExtendedInfo()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;->getModifiedPhoneNumber()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {v1}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;->getModifiedPhoneNumber()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p3, Lru/mail/libverify/api/r$a;->c:Ljava/lang/String;

    invoke-static {v2}, Lru/mail/libverify/api/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lru/mail/libverify/api/r;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p3, Lru/mail/libverify/api/r$a;->h:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lru/mail/libverify/api/r;->b:Landroid/util/LruCache;

    invoke-virtual {v3, v2, v0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v2, "PhoneNumberChecker"

    const-string/jumbo v3, "Modified phone %s from check %s added to cache"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-interface {v1}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;->getModifiedPhoneNumber()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v5

    const/4 v1, 0x1

    iget-object v5, p3, Lru/mail/libverify/api/r$a;->e:Ljava/lang/String;

    aput-object v5, v4, v1

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v1, v0

    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-nez v2, :cond_1

    invoke-static {}, Lru/mail/libverify/api/p;->a()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    :goto_2
    const-string/jumbo v2, "PhoneNumberChecker"

    const-string/jumbo v3, "Check %s failed"

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p3, Lru/mail/libverify/api/r$a;->e:Ljava/lang/String;

    aput-object v5, v4, v6

    invoke-static {v2, v1, v3, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_1
    :try_start_1
    invoke-static {}, Lru/mail/libverify/api/p;->a()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
    :try_end_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto/16 :goto_0

    :cond_1
    instance-of v0, v2, Lru/mail/libverify/utils/ServerException;

    instance-of v3, v2, Ljava/io/IOException;

    if-eqz v0, :cond_2

    invoke-static {}, Lru/mail/libverify/api/p;->c()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    :goto_3
    iget-object v3, p0, Lru/mail/libverify/api/r;->c:Lru/mail/libverify/api/q;

    invoke-interface {v3, p1, v2}, Lru/mail/libverify/api/q;->a(Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_2
    if-eqz v3, :cond_3

    invoke-static {}, Lru/mail/libverify/api/p;->b()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    goto :goto_3

    :cond_3
    invoke-static {}, Lru/mail/libverify/api/p;->a()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    goto :goto_3

    :catch_1
    move-exception v0

    move-object v1, v0

    invoke-static {}, Lru/mail/libverify/api/p;->a()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    const-string/jumbo v2, "PhoneNumberChecker"

    const-string/jumbo v3, "Check %s failed"

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p3, Lru/mail/libverify/api/r$a;->e:Ljava/lang/String;

    aput-object v5, v4, v6

    invoke-static {v2, v1, v3, v4}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method final a(Lru/mail/libverify/api/r$a;Z)V
    .locals 9
    .param p1    # Lru/mail/libverify/api/r$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v8, 0x0

    const/4 v7, 0x1

    iget-object v0, p0, Lru/mail/libverify/api/r;->e:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->j()Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p2, :cond_0

    invoke-static {}, Lru/mail/libverify/api/p;->b()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    invoke-static {p1, v0}, Lru/mail/libverify/api/r;->a(Lru/mail/libverify/api/r$a;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p1, Lru/mail/libverify/api/r$a;->c:Ljava/lang/String;

    iget-object v1, p1, Lru/mail/libverify/api/r$a;->b:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v3, "%s_%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v8

    aput-object v0, v4, v7

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iget-object v0, p0, Lru/mail/libverify/api/r;->a:Ljava/util/HashMap;

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/r$b;

    if-eqz v0, :cond_3

    iget-object v1, v0, Lru/mail/libverify/api/r$b;->a:Ljava/util/concurrent/Future;

    invoke-interface {v1}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, v0, Lru/mail/libverify/api/r$b;->b:Lru/mail/libverify/api/r$a;

    invoke-virtual {v1, p1}, Lru/mail/libverify/api/r$a;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string/jumbo v1, "PhoneNumberChecker"

    const-string/jumbo v2, "Check %s requests joined"

    new-array v3, v7, [Ljava/lang/Object;

    iget-object v4, p1, Lru/mail/libverify/api/r$a;->e:Ljava/lang/String;

    aput-object v4, v3, v8

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, v0, Lru/mail/libverify/api/r$b;->b:Lru/mail/libverify/api/r$a;

    iget-object v0, v0, Lru/mail/libverify/api/r$a;->d:Ljava/util/HashMap;

    iget-object v1, p1, Lru/mail/libverify/api/r$a;->d:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    goto :goto_0

    :cond_2
    const-string/jumbo v1, "PhoneNumberChecker"

    const-string/jumbo v2, "Check %s cancel previous request"

    new-array v3, v7, [Ljava/lang/Object;

    iget-object v4, p1, Lru/mail/libverify/api/r$a;->e:Ljava/lang/String;

    aput-object v4, v3, v8

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, v0, Lru/mail/libverify/api/r$b;->a:Ljava/util/concurrent/Future;

    invoke-interface {v1, v7}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iget-object v0, v0, Lru/mail/libverify/api/r$b;->b:Lru/mail/libverify/api/r$a;

    iget-object v0, v0, Lru/mail/libverify/api/r$a;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lru/mail/libverify/api/r;->a:Ljava/util/HashMap;

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    new-instance v0, Lru/mail/libverify/requests/j;

    iget-object v1, p0, Lru/mail/libverify/api/r;->e:Lru/mail/libverify/storage/k;

    iget-object v2, p1, Lru/mail/libverify/api/r$a;->f:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/api/r$a;->c:Ljava/lang/String;

    iget-object v4, p1, Lru/mail/libverify/api/r$a;->b:Ljava/lang/String;

    iget-boolean v5, p1, Lru/mail/libverify/api/r$a;->g:Z

    invoke-direct/range {v0 .. v5}, Lru/mail/libverify/requests/j;-><init>(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    const-string/jumbo v1, "PhoneNumberChecker"

    const-string/jumbo v2, "Check %s start request"

    new-array v3, v7, [Ljava/lang/Object;

    iget-object v4, p1, Lru/mail/libverify/api/r$a;->e:Ljava/lang/String;

    aput-object v4, v3, v8

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v1, Lru/mail/libverify/api/r$b;

    iget-object v2, p0, Lru/mail/libverify/api/r;->c:Lru/mail/libverify/api/q;

    invoke-interface {v2}, Lru/mail/libverify/api/q;->b()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    new-instance v3, Lru/mail/libverify/api/r$1;

    invoke-direct {v3, p0, v0, p1, v6}, Lru/mail/libverify/api/r$1;-><init>(Lru/mail/libverify/api/r;Lru/mail/libverify/requests/j;Lru/mail/libverify/api/r$a;Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Lru/mail/libverify/requests/j;->a(Ljava/util/concurrent/ExecutorService;Lru/mail/libverify/requests/i$b;)Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lru/mail/libverify/api/r$b;-><init>(Lru/mail/libverify/api/r$a;Ljava/util/concurrent/Future;)V

    iget-object v0, p0, Lru/mail/libverify/api/r;->a:Ljava/util/HashMap;

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0
.end method
