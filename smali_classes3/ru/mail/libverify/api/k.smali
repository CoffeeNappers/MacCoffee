.class public final Lru/mail/libverify/api/k;
.super Ljava/lang/Object;


# static fields
.field private static volatile a:Lru/mail/libverify/api/ad;

.field private static b:Lru/mail/libverify/storage/m;

.field private static volatile c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    sput-object v0, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    const/4 v0, 0x0

    sput-boolean v0, Lru/mail/libverify/api/k;->c:Z

    return-void
.end method

.method static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)Lru/mail/libverify/api/VerificationApi;
    .locals 5
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lru/mail/libverify/utils/LogReceiver;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lru/mail/libverify/api/UncaughtExceptionListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    if-nez v0, :cond_1

    const-class v1, Lru/mail/libverify/api/ad;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    if-nez v0, :cond_0

    sget-object v0, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    if-nez v0, :cond_3

    invoke-static {p0, p1, p2}, Lru/mail/libverify/api/k;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/m;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    :goto_0
    const/4 v0, 0x1

    sput-boolean v0, Lru/mail/libverify/api/k;->c:Z

    new-instance v0, Lru/mail/libverify/api/ad;

    sget-object v2, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    new-instance v3, Lru/mail/libverify/statistics/d;

    sget-object v4, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    invoke-direct {v3, v4}, Lru/mail/libverify/statistics/d;-><init>(Lru/mail/libverify/storage/k;)V

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v2, v3, p3, p4}, Lru/mail/libverify/api/ad;-><init>(Lru/mail/libverify/storage/l;Ljava/util/List;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)V

    sput-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-boolean v0, Lru/mail/libverify/api/k;->c:Z

    if-nez v0, :cond_2

    const-class v1, Lru/mail/libverify/api/ad;

    monitor-enter v1

    :try_start_1
    sget-object v0, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2, p1, p2}, Lru/mail/libverify/storage/m;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_2
    sget-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    return-object v0

    :cond_3
    :try_start_2
    sget-object v0, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2, p1, p2}, Lru/mail/libverify/storage/m;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method static a(Landroid/content/Context;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)Lru/mail/libverify/api/VerificationApi;
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lru/mail/libverify/utils/LogReceiver;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/UncaughtExceptionListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget v0, Lru/mail/libverify/R$string;->libverify_application_name:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget v1, Lru/mail/libverify/R$string;->libverify_application_key:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Both application name and application key must be added to an application resources. See VerificationFactory class documentation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    invoke-static {p0, v0, v1, p1, p2}, Lru/mail/libverify/api/k;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    return-object v0
.end method

.method public static a(Landroid/content/Context;)Lru/mail/libverify/api/j;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    return-object v0
.end method

.method private static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/m;
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Lru/mail/libverify/storage/m;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lru/mail/libverify/storage/m;-><init>(Landroid/content/Context;)V

    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Lru/mail/libverify/storage/m;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lru/mail/libverify/storage/m;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static a()V
    .locals 7

    sget-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    if-eqz v0, :cond_3

    const-class v1, Lru/mail/libverify/api/ad;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    if-eqz v0, :cond_2

    sget-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    const-string/jumbo v2, "VerificationApi"

    const-string/jumbo v3, "shutdown started"

    invoke-static {v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v0, Lru/mail/libverify/api/ad;->d:Lru/mail/libverify/api/ad$d;

    iget-object v3, v2, Lru/mail/libverify/api/ad$d;->a:Ljava/util/concurrent/ExecutorService;

    if-eqz v3, :cond_0

    invoke-interface {v3}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v4, 0x1388

    :try_start_1
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v4, v5, v6}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "VerificationApi"

    const-string/jumbo v4, "worker wait for shutdown failure"

    invoke-static {v3, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :goto_0
    :try_start_2
    iget-object v2, v2, Lru/mail/libverify/api/ad$d;->b:Ljava/util/concurrent/ExecutorService;

    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-wide/16 v4, 0x1388

    :try_start_3
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v4, v5, v3}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v2, "VerificationApi"

    const-string/jumbo v3, "connection wait for shutdown failure"

    invoke-static {v2, v3}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_1
    :goto_1
    const-wide/16 v2, 0x3e8

    :try_start_4
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :goto_2
    :try_start_5
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x12

    if-ge v2, v3, :cond_4

    iget-object v2, v0, Lru/mail/libverify/api/ad;->c:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->quit()Z

    :goto_3
    invoke-virtual {v0}, Lru/mail/libverify/api/ad;->g()V

    iget-object v2, v0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v2}, Lru/mail/libverify/storage/l;->z()Lru/mail/libverify/storage/o;

    move-result-object v2

    invoke-interface {v2}, Lru/mail/libverify/storage/o;->a()V

    iget-object v2, v0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v2}, Lru/mail/libverify/storage/l;->H()V

    iget-object v0, v0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lru/mail/libverify/storage/l;->a(Lru/mail/libverify/storage/u;)V

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v2, "shutdown completed"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    sput-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    const/4 v0, 0x0

    sput-object v0, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    const/4 v0, 0x0

    sput-boolean v0, Lru/mail/libverify/api/k;->c:Z

    :cond_2
    monitor-exit v1

    :cond_3
    return-void

    :catch_0
    move-exception v3

    const-string/jumbo v3, "VerificationApi"

    const-string/jumbo v4, "worker shutdown failure"

    invoke-static {v3, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v0

    :catch_1
    move-exception v2

    :try_start_6
    const-string/jumbo v2, "VerificationApi"

    const-string/jumbo v3, "connection shutdown failure"

    invoke-static {v2, v3}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :catch_2
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2

    :cond_4
    iget-object v2, v0, Lru/mail/libverify/api/ad;->c:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->quitSafely()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3
.end method

.method static synthetic b()Lru/mail/libverify/api/ad;
    .locals 1

    sget-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    return-object v0
.end method

.method public static b(Landroid/content/Context;)Lru/mail/libverify/api/l;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    return-object v0
.end method

.method public static c(Landroid/content/Context;)Lru/mail/libverify/api/i;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    return-object v0
.end method

.method public static d(Landroid/content/Context;)Lru/mail/libverify/api/aa;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    return-object v0
.end method

.method public static e(Landroid/content/Context;)Lru/mail/libverify/api/ac;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    return-object v0
.end method

.method public static f(Landroid/content/Context;)Lru/mail/libverify/api/o;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    return-object v0
.end method

.method public static g(Landroid/content/Context;)Lru/mail/libverify/api/ab;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    new-instance v0, Lru/mail/libverify/api/k$1;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/k$1;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public static h(Landroid/content/Context;)Lru/mail/libverify/api/n;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    return-object v0
.end method

.method static i(Landroid/content/Context;)Lru/mail/libverify/api/ad;
    .locals 6
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    if-nez v0, :cond_1

    const-class v1, Lru/mail/libverify/api/VerificationFactory;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/api/ad;

    invoke-static {p0}, Lru/mail/libverify/api/k;->j(Landroid/content/Context;)Lru/mail/libverify/storage/m;

    move-result-object v2

    new-instance v3, Lru/mail/libverify/statistics/d;

    invoke-static {p0}, Lru/mail/libverify/api/k;->j(Landroid/content/Context;)Lru/mail/libverify/storage/m;

    move-result-object v4

    invoke-direct {v3, v4}, Lru/mail/libverify/statistics/d;-><init>(Lru/mail/libverify/storage/k;)V

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v0, v2, v3, v4, v5}, Lru/mail/libverify/api/ad;-><init>(Lru/mail/libverify/storage/l;Ljava/util/List;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)V

    sput-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lru/mail/libverify/api/k;->a:Lru/mail/libverify/api/ad;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private static j(Landroid/content/Context;)Lru/mail/libverify/storage/m;
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    if-nez v0, :cond_1

    const-class v1, Lru/mail/libverify/api/VerificationFactory;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    if-nez v0, :cond_0

    sget v0, Lru/mail/libverify/R$string;->libverify_application_name:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget v2, Lru/mail/libverify/R$string;->libverify_application_key:I

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v2}, Lru/mail/libverify/api/k;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/m;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lru/mail/libverify/api/k;->b:Lru/mail/libverify/storage/m;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
