.class final Lru/mail/libverify/api/ad$e;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/RejectedExecutionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/ad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "e"
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad;

.field private final b:Lru/mail/libverify/api/UncaughtExceptionListener;


# direct methods
.method private constructor <init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/api/UncaughtExceptionListener;)V
    .locals 0
    .param p2    # Lru/mail/libverify/api/UncaughtExceptionListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lru/mail/libverify/api/ad$e;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lru/mail/libverify/api/ad$e;->b:Lru/mail/libverify/api/UncaughtExceptionListener;

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/api/UncaughtExceptionListener;B)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lru/mail/libverify/api/ad$e;-><init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/api/UncaughtExceptionListener;)V

    return-void
.end method


# virtual methods
.method public final rejectedExecution(Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 6

    const/4 v5, 0x0

    const/4 v2, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p2}, Ljava/util/concurrent/ThreadPoolExecutor;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "discard runnable %s on executor %s as it was shut down"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    aput-object p2, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "discard runnable %s on executor %s as it was shut down"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    aput-object p2, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "wrong libverify instance object state"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad$e;->a:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v1

    invoke-virtual {v1, v5, v0}, Lru/mail/libverify/statistics/b;->a(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad$e;->b:Lru/mail/libverify/api/UncaughtExceptionListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/ad$e;->b:Lru/mail/libverify/api/UncaughtExceptionListener;

    invoke-interface {v1, v5, v0}, Lru/mail/libverify/api/UncaughtExceptionListener;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
