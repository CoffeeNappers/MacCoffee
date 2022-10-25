.class final Lru/mail/libverify/api/ad;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/VerificationApi;
.implements Lru/mail/libverify/api/aa;
.implements Lru/mail/libverify/api/ab;
.implements Lru/mail/libverify/api/ac;
.implements Lru/mail/libverify/api/i;
.implements Lru/mail/libverify/api/j;
.implements Lru/mail/libverify/api/l;
.implements Lru/mail/libverify/api/n;
.implements Lru/mail/libverify/api/o;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/api/ad$b;,
        Lru/mail/libverify/api/ad$c;,
        Lru/mail/libverify/api/ad$d;,
        Lru/mail/libverify/api/ad$a;,
        Lru/mail/libverify/api/ad$f;,
        Lru/mail/libverify/api/ad$g;,
        Lru/mail/libverify/api/ad$i;,
        Lru/mail/libverify/api/ad$e;,
        Lru/mail/libverify/api/ad$h;
    }
.end annotation


# static fields
.field private static final e:Ljava/util/concurrent/TimeUnit;


# instance fields
.field final a:Lru/mail/libverify/storage/l;

.field final b:Lru/mail/libverify/utils/b;

.field final c:Landroid/os/HandlerThread;

.field final d:Lru/mail/libverify/api/ad$d;

.field private final f:Lru/mail/libverify/api/w;

.field private final g:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Lru/mail/libverify/statistics/b;

.field private final j:Lru/mail/libverify/api/t;

.field private final k:Lru/mail/libverify/requests/b;

.field private final l:Lru/mail/libverify/fetcher/d;

.field private final m:Lru/mail/libverify/api/a;

.field private final n:Lru/mail/libverify/api/e;

.field private final o:Lru/mail/libverify/api/ad$h;

.field private final p:Lru/mail/libverify/api/ad$e;

.field private final q:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private r:Lru/mail/libverify/api/v;

.field private s:Lru/mail/libverify/storage/o;

.field private t:Ljava/util/concurrent/ThreadPoolExecutor;

.field private u:Lru/mail/libverify/notifications/c;

.field private v:Lru/mail/libverify/api/r;

.field private w:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sput-object v0, Lru/mail/libverify/api/ad;->e:Ljava/util/concurrent/TimeUnit;

    return-void
.end method

.method constructor <init>(Lru/mail/libverify/storage/l;Ljava/util/List;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)V
    .locals 5
    .param p1    # Lru/mail/libverify/storage/l;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
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
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lru/mail/libverify/storage/l;",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/statistics/c;",
            ">;",
            "Lru/mail/libverify/utils/LogReceiver;",
            "Lru/mail/libverify/api/UncaughtExceptionListener;",
            ")V"
        }
    .end annotation

    const/4 v4, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->g:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->h:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->q:Ljava/util/HashSet;

    new-instance v0, Lru/mail/libverify/api/ad$d;

    invoke-direct {v0, p0, v4}, Lru/mail/libverify/api/ad$d;-><init>(Lru/mail/libverify/api/ad;B)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->d:Lru/mail/libverify/api/ad$d;

    invoke-interface {p1}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    invoke-static {p3}, Lru/mail/libverify/utils/d;->a(Lru/mail/libverify/utils/LogReceiver;)V

    invoke-interface {p1}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/api/m;->a(Landroid/content/Context;)V

    iput-object p1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    new-instance v1, Lru/mail/libverify/api/ad$i;

    invoke-direct {v1, p0, v4}, Lru/mail/libverify/api/ad$i;-><init>(Lru/mail/libverify/api/ad;B)V

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/l;->a(Lru/mail/libverify/storage/u;)V

    new-instance v0, Lru/mail/libverify/statistics/b;

    invoke-direct {v0}, Lru/mail/libverify/statistics/b;-><init>()V

    iget-object v1, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iput-object v0, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    new-instance v0, Lru/mail/libverify/api/ad$h;

    invoke-direct {v0, p0, p4, v4}, Lru/mail/libverify/api/ad$h;-><init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/api/UncaughtExceptionListener;B)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->o:Lru/mail/libverify/api/ad$h;

    new-instance v0, Lru/mail/libverify/api/ad$e;

    invoke-direct {v0, p0, p4, v4}, Lru/mail/libverify/api/ad$e;-><init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/api/UncaughtExceptionListener;B)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->p:Lru/mail/libverify/api/ad$e;

    new-instance v0, Lru/mail/libverify/api/ad$g;

    invoke-direct {v0, p0, v4}, Lru/mail/libverify/api/ad$g;-><init>(Lru/mail/libverify/api/ad;B)V

    sput-object v0, Lru/mail/libverify/utils/c;->a:Lru/mail/libverify/utils/c$a;

    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "libverify_worker"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad;->o:Lru/mail/libverify/api/ad$h;

    invoke-virtual {v0, v1}, Landroid/os/HandlerThread;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->c:Landroid/os/HandlerThread;

    new-instance v0, Lru/mail/libverify/utils/b;

    iget-object v1, p0, Lru/mail/libverify/api/ad;->c:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lru/mail/libverify/utils/b;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v0, Lru/mail/libverify/api/u;

    new-instance v1, Lru/mail/libverify/api/ad$23;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$23;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-direct {v0, v1}, Lru/mail/libverify/api/u;-><init>(Lru/mail/libverify/api/s;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->j:Lru/mail/libverify/api/t;

    new-instance v0, Lru/mail/libverify/api/x;

    new-instance v1, Lru/mail/libverify/api/ad$34;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$34;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-direct {v0, v1}, Lru/mail/libverify/api/x;-><init>(Lru/mail/libverify/api/y;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->f:Lru/mail/libverify/api/w;

    new-instance v0, Lru/mail/libverify/requests/c;

    new-instance v1, Lru/mail/libverify/api/ad$b;

    invoke-direct {v1, p0, v4}, Lru/mail/libverify/api/ad$b;-><init>(Lru/mail/libverify/api/ad;B)V

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/c;-><init>(Lru/mail/libverify/requests/a;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->k:Lru/mail/libverify/requests/b;

    new-instance v0, Lru/mail/libverify/api/c;

    iget-object v1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    new-instance v2, Lru/mail/libverify/api/ad$a;

    invoke-direct {v2, p0, v4}, Lru/mail/libverify/api/ad$a;-><init>(Lru/mail/libverify/api/ad;B)V

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/api/c;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/api/b;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->m:Lru/mail/libverify/api/a;

    new-instance v0, Lru/mail/libverify/fetcher/f;

    iget-object v1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    iget-object v2, p0, Lru/mail/libverify/api/ad;->d:Lru/mail/libverify/api/ad$d;

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/fetcher/f;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/fetcher/e;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->l:Lru/mail/libverify/fetcher/d;

    new-instance v0, Lru/mail/libverify/api/g;

    iget-object v1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    new-instance v2, Lru/mail/libverify/api/ad$c;

    invoke-direct {v2, p0, v4}, Lru/mail/libverify/api/ad$c;-><init>(Lru/mail/libverify/api/ad;B)V

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/api/g;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/api/f;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->n:Lru/mail/libverify/api/e;

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "prepare internal members %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->i()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->prestartAllCoreThreads()I

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->i()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/api/ad$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$1;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$12;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$12;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    return-object v0
.end method

.method private a(Ljava/util/List;Lru/mail/libverify/gcm/ServerNotificationMessage;Ljava/lang/String;)V
    .locals 10
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/requests/k$c;",
            ">;",
            "Lru/mail/libverify/gcm/ServerNotificationMessage;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    iget-object v1, p2, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    if-eqz v1, :cond_0

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->PushNotification_Completed:Lru/mail/libverify/statistics/a;

    new-instance v3, Lru/mail/libverify/statistics/b$a;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v4, "PushSender"

    iget-object v5, p2, Lru/mail/libverify/gcm/ServerNotificationMessage;->sender:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    const-string/jumbo v4, "PushCompletion"

    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    const-string/jumbo v4, "PushDelivery"

    iget-object v5, p2, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    invoke-virtual {v5}, Lru/mail/libverify/requests/k$b;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    iget-object v3, v3, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v2, v3}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    new-instance v1, Lru/mail/libverify/requests/k;

    iget-object v2, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    iget-object v0, p2, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-object v4, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    iget-object v5, p2, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    sget-object v6, Lru/mail/libverify/requests/k$a;->SMS_CODE:Lru/mail/libverify/requests/k$a;

    iget-wide v8, p2, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    move-object v3, p1

    move-object v7, p3

    invoke-direct/range {v1 .. v9}, Lru/mail/libverify/requests/k;-><init>(Lru/mail/libverify/storage/k;Ljava/util/List;Ljava/lang/String;Lru/mail/libverify/requests/k$b;Lru/mail/libverify/requests/k$a;Ljava/lang/String;J)V

    invoke-direct {p0, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/requests/e;)V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;Ljava/lang/Runnable;)V
    .locals 7

    iget-object v1, p0, Lru/mail/libverify/api/ad;->w:[Ljava/lang/String;

    if-eqz v1, :cond_0

    array-length v0, v1

    if-nez v0, :cond_1

    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :goto_0
    return-void

    :cond_1
    new-instance v2, Ljava/util/HashSet;

    invoke-static {}, Lru/mail/libverify/api/ad;->h()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v3, Ljava/util/ArrayList;

    array-length v0, v1

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    array-length v4, v1

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v4, :cond_3

    aget-object v5, v1, v0

    invoke-virtual {v2, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lru/mail/libverify/api/ad;->q:Ljava/util/HashSet;

    invoke-virtual {v6, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v6, p0, Lru/mail/libverify/api/ad;->q:Ljava/util/HashSet;

    invoke-virtual {v6, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/api/ad;->w:[Ljava/lang/String;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iget-object v1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v1}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lru/mail/libverify/api/ad$52;

    invoke-direct {v2, p0, v0, p1}, Lru/mail/libverify/api/ad$52;-><init>(Lru/mail/libverify/api/ad;[Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-static {v1, v0, v2}, Lru/mail/libverify/utils/permissions/a;->a(Landroid/content/Context;[Ljava/lang/String;Lru/mail/libverify/utils/permissions/a$a;)V

    goto :goto_0
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;Ljava/lang/String;)V
    .locals 5

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "received fetcher info %s"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    const-class v0, Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-static {p1, v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/FetcherInfo;
    :try_end_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "received fetcher info %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad;->l:Lru/mail/libverify/fetcher/d;

    invoke-interface {v1, v0}, Lru/mail/libverify/fetcher/d;->a(Lru/mail/libverify/requests/response/FetcherInfo;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    return-void

    :catch_0
    move-exception v0

    :try_start_2
    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "failed to process fetcher info"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "failed to parse fetcher info json"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;Ljava/lang/String;I)V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-static {v0, p1, p2}, Lru/mail/libverify/requests/o;->a(Lru/mail/libverify/storage/k;Ljava/lang/String;I)Lru/mail/libverify/requests/o;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/requests/e;)V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;Ljava/lang/String;Lru/mail/libverify/requests/k$b;)V
    .locals 4

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "received server info %s from %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    const-class v0, Lru/mail/libverify/gcm/ServerInfo;

    invoke-static {p1, v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/gcm/ServerInfo;

    invoke-direct {p0, v0, p2}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/gcm/ServerInfo;Lru/mail/libverify/requests/k$b;)V
    :try_end_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "failed to parse server info json"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;Ljava/util/List;Lru/mail/libverify/gcm/ServerNotificationMessage;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lru/mail/libverify/api/ad;->a(Ljava/util/List;Lru/mail/libverify/gcm/ServerNotificationMessage;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerInfo;Lru/mail/libverify/requests/k$b;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/gcm/ServerInfo;Lru/mail/libverify/requests/k$b;)V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerNotificationMessage;)V
    .locals 10

    const/4 v2, 0x0

    const/4 v1, 0x1

    const/4 v6, 0x0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v3, "process message %s"

    new-array v4, v1, [Ljava/lang/Object;

    aput-object p1, v4, v6

    invoke-static {v0, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    iget-object v0, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    iget-object v4, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    if-eqz v4, :cond_2

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v7, Lru/mail/libverify/statistics/a;->PushNotification_Received:Lru/mail/libverify/statistics/a;

    new-instance v3, Lru/mail/libverify/statistics/b$a;

    const/4 v8, 0x0

    invoke-direct {v3, v8}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v8, "PushSender"

    iget-object v9, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->sender:Ljava/lang/String;

    invoke-virtual {v3, v8, v9}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    const-string/jumbo v8, "PushType"

    iget-object v9, v4, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->type:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;

    invoke-virtual {v9}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v8

    const-string/jumbo v9, "PushFlags"

    iget-object v3, v4, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    if-eqz v3, :cond_1

    iget-object v3, v4, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-virtual {v8, v9, v3}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    const-string/jumbo v8, "PushDelivery"

    iget-object v9, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    invoke-virtual {v9}, Lru/mail/libverify/requests/k$b;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    const-string/jumbo v8, "PushWithConfirm"

    invoke-virtual {v4}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->a()Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    iget-object v3, v3, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v7, v3}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "failed to process server notification"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v1, v0, v2, v3}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    :goto_2
    return-void

    :cond_1
    move-object v3, v2

    goto :goto_1

    :cond_2
    :try_start_1
    iget-object v0, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v4}, Lru/mail/libverify/storage/l;->p()Lru/mail/libverify/accounts/d;

    move-result-object v4

    invoke-virtual {v4}, Lru/mail/libverify/accounts/d;->g()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imsi:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string/jumbo v4, "VerificationApi"

    const-string/jumbo v5, "%s provided imsis are not equal to local imsi"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v4, v5, v7}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v4, Lru/mail/libverify/requests/k$c;->IMSI_NOT_MATCH:Lru/mail/libverify/requests/k$c;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    iget-object v4, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v4}, Lru/mail/libverify/storage/l;->p()Lru/mail/libverify/accounts/d;

    move-result-object v4

    invoke-virtual {v4}, Lru/mail/libverify/accounts/d;->h()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->imei:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string/jumbo v4, "VerificationApi"

    const-string/jumbo v5, "%s provided imeis are not equal to local imeis"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v4, v5, v7}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v4, Lru/mail/libverify/requests/k$c;->IMEI_NOT_MATCH:Lru/mail/libverify/requests/k$c;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    iget-object v4, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v4}, Lru/mail/libverify/storage/l;->e()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lru/mail/libverify/utils/m;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->application_id:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_f

    const-string/jumbo v2, "VerificationApi"

    const-string/jumbo v4, "%s provided id is not equal to local id"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-static {v2, v4, v5}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v2, Lru/mail/libverify/requests/k$c;->APPLICATION_ID_NOT_MATCH:Lru/mail/libverify/requests/k$c;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->application_id:Ljava/lang/String;

    :goto_3
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_5

    move v0, v1

    :goto_4
    if-eqz v0, :cond_0

    iget-object v0, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    sget-object v2, Lru/mail/libverify/api/ad$58;->a:[I

    iget-object v3, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->type:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;

    invoke-virtual {v3}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "unexpected message type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->type:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$b;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_5
    invoke-direct {p0, v3, p1, v0}, Lru/mail/libverify/api/ad;->a(Ljava/util/List;Lru/mail/libverify/gcm/ServerNotificationMessage;Ljava/lang/String;)V

    move v0, v6

    goto :goto_4

    :pswitch_0
    iget-object v0, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-object v2, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_6
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "ether text or from field is undefined"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_7
    iget-object v2, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    sget-object v3, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->IPC:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v2, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    move v2, v1

    :goto_5
    iget-object v3, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    sget-object v4, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->SMS:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    iget-object v0, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->delivery_flags:Ljava/util/Set;

    sget-object v3, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;->POPUP:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$a;

    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/utils/h;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_9

    move v3, v1

    :goto_6
    if-nez v2, :cond_a

    if-nez v3, :cond_a

    if-nez v5, :cond_a

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "all notifications blocked by flags"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x2

    new-array v0, v0, [Lru/mail/libverify/requests/k$c;

    const/4 v1, 0x0

    sget-object v2, Lru/mail/libverify/requests/k$c;->SMS_ACCESS_ERROR:Lru/mail/libverify/requests/k$c;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lru/mail/libverify/requests/k$c;->IPC_ACCESS_ERROR:Lru/mail/libverify/requests/k$c;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lru/mail/libverify/api/ad;->a(Ljava/util/List;Lru/mail/libverify/gcm/ServerNotificationMessage;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_8
    move v2, v6

    goto :goto_5

    :cond_9
    move v3, v6

    goto :goto_6

    :cond_a
    iget-object v0, p0, Lru/mail/libverify/api/ad;->j:Lru/mail/libverify/api/t;

    invoke-virtual {p1}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lru/mail/libverify/api/t;->b(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;

    move-result-object v0

    invoke-virtual {p1, v0}, Lru/mail/libverify/gcm/ServerNotificationMessage;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    iget-object v1, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    invoke-virtual {v1, v0, p1}, Lru/mail/libverify/statistics/b;->a(Lru/mail/libverify/gcm/ServerNotificationMessage;Lru/mail/libverify/gcm/ServerNotificationMessage;)V

    move v0, v6

    :goto_7
    if-nez v0, :cond_c

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "message %s has been already registered"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_2

    :cond_b
    iget-object v0, p0, Lru/mail/libverify/api/ad;->j:Lru/mail/libverify/api/t;

    invoke-virtual {p1}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4, p1}, Lru/mail/libverify/api/t;->a(Ljava/lang/String;Lru/mail/libverify/gcm/ServerNotificationMessage;)Lru/mail/libverify/gcm/ServerNotificationMessage;

    move v0, v1

    goto :goto_7

    :cond_c
    if-eqz v2, :cond_d

    iget-object v2, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "post ipc message to session %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, v2, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    aput-object v8, v4, v7

    invoke-static {v0, v1, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v7, Lru/mail/libverify/ipc/f;

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v8

    new-instance v0, Lru/mail/libverify/api/ad$4;

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lru/mail/libverify/api/ad$4;-><init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerNotificationMessage$Message;ZLru/mail/libverify/gcm/ServerNotificationMessage;Z)V

    invoke-direct {v7, v8, p0, v0}, Lru/mail/libverify/ipc/f;-><init>(Landroid/content/Context;Lru/mail/libverify/api/l;Lru/mail/libverify/ipc/f$b;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    const/4 v1, 0x1

    const/4 v3, 0x0

    invoke-interface {v0, p0, v1, v3}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;ZI)V

    iget-object v0, v2, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    iget-object v1, v2, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    iget-object v2, v2, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->requester_package_name:Ljava/lang/String;

    new-instance v3, Lru/mail/libverify/ipc/h$a;

    iget-object v4, v7, Lru/mail/libverify/ipc/f;->b:Lru/mail/libverify/api/l;

    invoke-direct {v3, v4, v0, v1}, Lru/mail/libverify/ipc/h$a;-><init>(Lru/mail/libverify/api/l;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v3, v2}, Lru/mail/libverify/ipc/f;->a(Lru/mail/libverify/ipc/d;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_d
    if-eqz v3, :cond_e

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/gcm/ServerNotificationMessage;Z)Z

    sget-object v0, Lru/mail/libverify/requests/k$c;->DELIVERED:Lru/mail/libverify/requests/k$c;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lru/mail/libverify/api/ad;->a(Ljava/util/List;Lru/mail/libverify/gcm/ServerNotificationMessage;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_e
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "failed to write sms"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lru/mail/libverify/requests/k$c;->SMS_ACCESS_ERROR:Lru/mail/libverify/requests/k$c;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lru/mail/libverify/api/ad;->a(Ljava/util/List;Lru/mail/libverify/gcm/ServerNotificationMessage;Ljava/lang/String;)V

    goto/16 :goto_2

    :pswitch_1
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "ping message %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lru/mail/libverify/api/ad$58;->c:[I

    iget-object v1, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    invoke-virtual {v1}, Lru/mail/libverify/requests/k$b;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :pswitch_2
    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-static {v0}, Lru/mail/libverify/requests/o;->f(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/requests/e;)V

    goto/16 :goto_2

    :pswitch_3
    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-static {v0}, Lru/mail/libverify/requests/o;->g(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/requests/e;)V

    goto/16 :goto_2

    :pswitch_4
    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-static {v0}, Lru/mail/libverify/requests/o;->a(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/requests/e;)V

    goto/16 :goto_2

    :pswitch_5
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "verified message %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->f:Lru/mail/libverify/api/w;

    iget-object v1, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-object v1, v1, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    sget v2, Lru/mail/libverify/api/w$a;->a:I

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/w;->a(Ljava/lang/String;I)Lru/mail/libverify/api/ae;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lru/mail/libverify/api/ae;->e()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    :cond_f
    move-object v0, v2

    goto/16 :goto_3

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_5
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/requests/e;)V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V
    .locals 7

    :try_start_0
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "handle server failure"

    invoke-static {v0, v1, p2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    instance-of v0, p2, Lru/mail/libverify/utils/ServerException;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    check-cast p2, Lru/mail/libverify/utils/ServerException;

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->Server_Failure:Lru/mail/libverify/statistics/a;

    new-instance v3, Lru/mail/libverify/statistics/b$a;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v4, "Code"

    iget v5, p2, Lru/mail/libverify/utils/ServerException;->a:I

    iget-object v6, v3, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v6, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v4, "Method"

    invoke-virtual {p1}, Lru/mail/libverify/requests/e;->l()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    iget-object v3, v3, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v2, v3}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "failed to process server failure"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    :try_start_1
    instance-of v0, p2, Ljava/io/IOException;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lru/mail/libverify/requests/e;->h()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "switched to the next api url"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    check-cast p2, Ljava/io/IOException;

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->Server_Switched_To_Next_Api_Host:Lru/mail/libverify/statistics/a;

    new-instance v3, Lru/mail/libverify/statistics/b$a;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v4, "Code"

    invoke-virtual {p2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    const-string/jumbo v4, "Method"

    invoke-virtual {p1}, Lru/mail/libverify/requests/e;->l()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    iget-object v3, v3, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v2, v3}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_2

    :cond_2
    instance-of v0, p2, Lru/mail/libverify/utils/ClientException;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    check-cast p2, Lru/mail/libverify/utils/ClientException;

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->Server_Failure:Lru/mail/libverify/statistics/a;

    new-instance v3, Lru/mail/libverify/statistics/b$a;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v4, "Code"

    invoke-virtual {p2}, Lru/mail/libverify/utils/ClientException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    const-string/jumbo v4, "Method"

    invoke-virtual {p1}, Lru/mail/libverify/requests/e;->l()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    iget-object v3, v3, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v2, v3}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lru/mail/libverify/statistics/b;->a(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;Z)V
    .locals 5

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "instance reset started (drop installation = %s)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->y()V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "api_last_sent_push_token"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "api_settings_timestamp"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    iget-object v0, p0, Lru/mail/libverify/api/ad;->m:Lru/mail/libverify/api/a;

    invoke-interface {v0}, Lru/mail/libverify/api/a;->b()V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->n:Lru/mail/libverify/api/e;

    invoke-interface {v0}, Lru/mail/libverify/api/e;->c()V

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->f:Lru/mail/libverify/api/w;

    invoke-interface {v0}, Lru/mail/libverify/api/w;->c()V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->j:Lru/mail/libverify/api/t;

    invoke-interface {v0}, Lru/mail/libverify/api/t;->c()V

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->j()Lru/mail/libverify/notifications/c;

    move-result-object v0

    iget-object v1, v0, Lru/mail/libverify/notifications/c;->b:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    :try_start_0
    const-string/jumbo v1, "NotificationBarManager"

    const-string/jumbo v2, "cancel all"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v0, Lru/mail/libverify/notifications/c;->a:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->k:Lru/mail/libverify/requests/b;

    invoke-interface {v0}, Lru/mail/libverify/requests/b;->b()V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->B()V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->l:Lru/mail/libverify/fetcher/d;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/d;->a()V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "instance reset completed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catch_0
    move-exception v0

    :goto_1
    const-string/jumbo v1, "NotificationBarManager"

    const-string/jumbo v2, "cancel all"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method private a(Lru/mail/libverify/gcm/ServerInfo;Lru/mail/libverify/requests/k$b;)V
    .locals 12
    .param p1    # Lru/mail/libverify/gcm/ServerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    :try_start_0
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "received server info %s from %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p1, Lru/mail/libverify/gcm/ServerInfo;->call_info:Lru/mail/libverify/requests/response/CallInfo;

    if-eqz v0, :cond_2

    iget-object v2, p1, Lru/mail/libverify/gcm/ServerInfo;->call_info:Lru/mail/libverify/requests/response/CallInfo;

    iget-object v0, p0, Lru/mail/libverify/api/ad;->f:Lru/mail/libverify/api/w;

    sget v1, Lru/mail/libverify/api/w$a;->a:I

    invoke-interface {v0, v1}, Lru/mail/libverify/api/w;->a(I)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/ae;

    invoke-interface {v0, v2}, Lru/mail/libverify/api/ae;->a(Lru/mail/libverify/requests/response/CallInfo;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    iget-object v1, v1, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru/mail/libverify/statistics/c;

    sget-object v5, Lru/mail/libverify/statistics/a;->Session_Call_Info_Received:Lru/mail/libverify/statistics/a;

    new-instance v6, Lru/mail/libverify/statistics/b$a;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v7, "PushDelivery"

    invoke-virtual {p2}, Lru/mail/libverify/requests/k$b;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v6

    const-string/jumbo v7, "PushTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-interface {v0}, Lru/mail/libverify/api/ae;->j()J

    move-result-wide v10

    sub-long/2addr v8, v10

    invoke-static {v8, v9}, Lru/mail/libverify/statistics/b;->b(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v6

    iget-object v6, v6, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v1, v5, v6}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "failed to process server info"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    :try_start_1
    iget-object v0, p1, Lru/mail/libverify/gcm/ServerInfo;->notification_info:Lru/mail/libverify/gcm/NotificationInfo;

    if-eqz v0, :cond_4

    iget-object v1, p1, Lru/mail/libverify/gcm/ServerInfo;->notification_info:Lru/mail/libverify/gcm/NotificationInfo;

    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lru/mail/libverify/api/ad;->j:Lru/mail/libverify/api/t;

    invoke-interface {v2}, Lru/mail/libverify/api/t;->b()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sget-object v2, Lru/mail/libverify/api/ad$58;->e:[I

    iget-object v3, v1, Lru/mail/libverify/gcm/NotificationInfo;->action:Lru/mail/libverify/gcm/NotificationInfo$a;

    invoke-virtual {v3}, Lru/mail/libverify/gcm/NotificationInfo$a;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Action = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, v1, Lru/mail/libverify/gcm/NotificationInfo;->action:Lru/mail/libverify/gcm/NotificationInfo$a;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-object v3, v0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    if-eqz v3, :cond_3

    iget-object v3, v0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-object v3, v3, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    invoke-static {v3}, Lru/mail/libverify/utils/m;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, v1, Lru/mail/libverify/gcm/NotificationInfo;->session_id:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lru/mail/libverify/api/ad;->j:Lru/mail/libverify/api/t;

    invoke-virtual {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lru/mail/libverify/api/t;->a(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->j()Lru/mail/libverify/notifications/c;

    move-result-object v3

    invoke-virtual {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lru/mail/libverify/notifications/c;->a(Ljava/lang/String;)V

    iget-object v3, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    invoke-virtual {v3, v0}, Lru/mail/libverify/statistics/b;->a(Lru/mail/libverify/gcm/ServerNotificationMessage;)V

    const-string/jumbo v3, "VerificationApi"

    const-string/jumbo v4, "removed message %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v6

    invoke-static {v3, v4, v5}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    :cond_4
    iget v0, p1, Lru/mail/libverify/gcm/ServerInfo;->confirm_required:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    const/4 v0, 0x1

    :goto_3
    if-eqz v0, :cond_1

    const/4 v4, 0x0

    iget-object v0, p1, Lru/mail/libverify/gcm/ServerInfo;->call_info:Lru/mail/libverify/requests/response/CallInfo;

    if-eqz v0, :cond_7

    iget-object v0, p1, Lru/mail/libverify/gcm/ServerInfo;->call_info:Lru/mail/libverify/requests/response/CallInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/CallInfo;->getHashedSessionId()Ljava/lang/String;

    move-result-object v4

    :cond_5
    :goto_4
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v1, Lru/mail/libverify/requests/k;

    iget-object v2, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    sget-object v0, Lru/mail/libverify/requests/k$c;->DELIVERED:Lru/mail/libverify/requests/k$c;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    sget-object v6, Lru/mail/libverify/requests/k$a;->SERVER_INFO:Lru/mail/libverify/requests/k$a;

    const/4 v7, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    move-object v5, p2

    invoke-direct/range {v1 .. v9}, Lru/mail/libverify/requests/k;-><init>(Lru/mail/libverify/storage/k;Ljava/util/List;Ljava/lang/String;Lru/mail/libverify/requests/k$b;Lru/mail/libverify/requests/k$a;Ljava/lang/String;J)V

    invoke-direct {p0, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/requests/e;)V

    goto/16 :goto_1

    :cond_6
    const/4 v0, 0x0

    goto :goto_3

    :cond_7
    iget-object v0, p1, Lru/mail/libverify/gcm/ServerInfo;->notification_info:Lru/mail/libverify/gcm/NotificationInfo;

    if-eqz v0, :cond_5

    iget-object v0, p1, Lru/mail/libverify/gcm/ServerInfo;->notification_info:Lru/mail/libverify/gcm/NotificationInfo;

    iget-object v4, v0, Lru/mail/libverify/gcm/NotificationInfo;->session_id:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private a(Lru/mail/libverify/requests/e;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lru/mail/libverify/requests/response/ClientApiResponseBase;",
            ">(",
            "Lru/mail/libverify/requests/e",
            "<TT;>;)V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->k:Lru/mail/libverify/requests/b;

    invoke-interface {v0, p1}, Lru/mail/libverify/requests/b;->a(Lru/mail/libverify/requests/e;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "failed to create %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v1, v0, v2, v3}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private a(Lru/mail/libverify/gcm/ServerNotificationMessage;Z)Z
    .locals 8
    .param p1    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x1

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    iget-object v2, p0, Lru/mail/libverify/api/ad;->j:Lru/mail/libverify/api/t;

    invoke-virtual {p1}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lru/mail/libverify/api/t;->b(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;

    move-result-object v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "VerificationApi"

    const-string/jumbo v3, "notification with id %s doesn\'t exist"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v0

    invoke-static {v2, v3, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return v0

    :cond_0
    const-string/jumbo v2, "VerificationApi"

    const-string/jumbo v3, "show popup %s"

    new-array v4, v1, [Ljava/lang/Object;

    aput-object p1, v4, v0

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->j()Lru/mail/libverify/notifications/c;

    move-result-object v2

    invoke-virtual {v2, p1, v0}, Lru/mail/libverify/notifications/c;->a(Lru/mail/libverify/gcm/ServerNotificationMessage;Z)V

    new-instance v2, Lru/mail/libverify/ipc/f;

    iget-object v3, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v3}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lru/mail/libverify/api/ad$5;

    invoke-direct {v4, p0, p1}, Lru/mail/libverify/api/ad$5;-><init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerNotificationMessage;)V

    invoke-direct {v2, v3, p0, v4}, Lru/mail/libverify/ipc/f;-><init>(Landroid/content/Context;Lru/mail/libverify/api/l;Lru/mail/libverify/ipc/f$b;)V

    invoke-virtual {p1}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v3

    iget-wide v4, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    new-instance v6, Lru/mail/libverify/ipc/c$a;

    iget-object v7, v2, Lru/mail/libverify/ipc/f;->b:Lru/mail/libverify/api/l;

    invoke-direct {v6, v7, v3, v4, v5}, Lru/mail/libverify/ipc/c$a;-><init>(Lru/mail/libverify/api/l;Ljava/lang/String;J)V

    const/4 v3, 0x0

    invoke-virtual {v2, v6, v3}, Lru/mail/libverify/ipc/f;->a(Lru/mail/libverify/ipc/d;Ljava/lang/String;)V

    monitor-enter p0

    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lru/mail/libverify/api/ad;->h:Ljava/util/HashSet;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string/jumbo v3, "VerificationApi"

    const-string/jumbo v4, "notify sms listeners count %d"

    new-array v5, v1, [Ljava/lang/Object;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v0

    invoke-static {v3, v4, v5}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;

    iget-object v3, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-object v3, v3, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    invoke-interface {v0, v3}, Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;->onNotification(Ljava/lang/String;)V

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method static synthetic a(Lru/mail/libverify/api/ad;[Ljava/lang/String;)[Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad;->w:[Ljava/lang/String;

    return-object p1
.end method

.method static synthetic b(Lru/mail/libverify/api/ad;)I
    .locals 5

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "api_settings_timeout"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->c(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->m()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-le v2, v3, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :cond_0
    :goto_0
    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "timeout for the next settings check %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_1
    const v0, 0x5265c00

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0
.end method

.method static synthetic b(Lru/mail/libverify/api/ad;Z)V
    .locals 6

    const/4 v5, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->singleFetcher()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "fetcher started result %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lru/mail/libverify/ipc/f;

    iget-object v1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v1}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lru/mail/libverify/api/ad$17;

    invoke-direct {v2, p0, p1}, Lru/mail/libverify/api/ad$17;-><init>(Lru/mail/libverify/api/ad;Z)V

    invoke-direct {v0, v1, p0, v2}, Lru/mail/libverify/ipc/f;-><init>(Landroid/content/Context;Lru/mail/libverify/api/l;Lru/mail/libverify/ipc/f$b;)V

    if-eqz p1, :cond_0

    new-instance v1, Lru/mail/libverify/ipc/e$a;

    iget-object v2, v0, Lru/mail/libverify/ipc/f;->b:Lru/mail/libverify/api/l;

    iget-object v3, v0, Lru/mail/libverify/ipc/f;->a:Landroid/content/Context;

    sget v4, Lru/mail/libverify/ipc/e$b;->a:I

    invoke-direct {v1, v2, v3, v4}, Lru/mail/libverify/ipc/e$a;-><init>(Lru/mail/libverify/api/l;Landroid/content/Context;I)V

    invoke-virtual {v0, v1, v5}, Lru/mail/libverify/ipc/f;->a(Lru/mail/libverify/ipc/d;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    new-instance v1, Lru/mail/libverify/ipc/e$a;

    iget-object v2, v0, Lru/mail/libverify/ipc/f;->b:Lru/mail/libverify/api/l;

    iget-object v3, v0, Lru/mail/libverify/ipc/f;->a:Landroid/content/Context;

    sget v4, Lru/mail/libverify/ipc/e$b;->b:I

    invoke-direct {v1, v2, v3, v4}, Lru/mail/libverify/ipc/e$a;-><init>(Lru/mail/libverify/api/l;Landroid/content/Context;I)V

    invoke-virtual {v0, v1, v5}, Lru/mail/libverify/ipc/f;->a(Lru/mail/libverify/ipc/d;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "fetcher communication disabled"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static synthetic b(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerNotificationMessage;)Z
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/gcm/ServerNotificationMessage;Z)Z

    move-result v0

    return v0
.end method

.method static synthetic c(Lru/mail/libverify/api/ad;)Lru/mail/libverify/requests/b;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->k:Lru/mail/libverify/requests/b;

    return-object v0
.end method

.method static synthetic c(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerNotificationMessage;)V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad;->j:Lru/mail/libverify/api/t;

    invoke-virtual {p1}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/t;->a(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;

    return-void
.end method

.method static synthetic d(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/a;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->m:Lru/mail/libverify/api/a;

    return-object v0
.end method

.method static synthetic e(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/e;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->n:Lru/mail/libverify/api/e;

    return-object v0
.end method

.method static synthetic f(Lru/mail/libverify/api/ad;)Lru/mail/libverify/fetcher/d;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->l:Lru/mail/libverify/fetcher/d;

    return-object v0
.end method

.method static synthetic g(Lru/mail/libverify/api/ad;)V
    .locals 8

    const/4 v0, 0x1

    const/4 v2, 0x0

    iget-object v1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v1}, Lru/mail/libverify/storage/l;->o()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v3}, Lru/mail/libverify/storage/l;->z()Lru/mail/libverify/storage/o;

    move-result-object v3

    const-string/jumbo v4, "api_last_sent_push_token"

    invoke-interface {v3, v4}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "VerificationApi"

    const-string/jumbo v5, "update push token %s -> %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v3, v6, v2

    aput-object v1, v6, v0

    invoke-static {v4, v5, v6}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->C()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "api_no_gcm_service_sent"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-static {v0}, Lru/mail/libverify/requests/o;->h(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/requests/e;)V

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->k()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "api_no_gcm_service_sent"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    :cond_0
    return-void

    :cond_1
    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-static {v1}, Lru/mail/libverify/requests/o;->a(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;

    move-result-object v1

    invoke-direct {p0, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/requests/e;)V

    iget-object v4, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    move v1, v0

    :goto_0
    iget-object v0, v4, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v4, Lru/mail/libverify/statistics/a;->PushToken_Received:Lru/mail/libverify/statistics/a;

    new-instance v5, Lru/mail/libverify/statistics/b$a;

    invoke-direct {v5, v2}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v6, "PushTokenRenewed"

    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v5

    iget-object v5, v5, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v4, v5}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_1

    :cond_2
    move v1, v2

    goto :goto_0
.end method

.method static synthetic h(Lru/mail/libverify/api/ad;)V
    .locals 5

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "session processing started (count = %d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/ad;->f:Lru/mail/libverify/api/w;

    invoke-interface {v4}, Lru/mail/libverify/api/w;->b()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->f:Lru/mail/libverify/api/w;

    sget v1, Lru/mail/libverify/api/w$a;->a:I

    invoke-interface {v0, v1}, Lru/mail/libverify/api/w;->a(I)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/ae;

    invoke-interface {v0}, Lru/mail/libverify/api/ae;->a()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method static h()[Ljava/lang/String;
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "android.permission.READ_SMS"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "android.permission.RECEIVE_SMS"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "android.permission.READ_CALL_LOG"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "android.permission.CALL_PHONE"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "android.permission.READ_PHONE_STATE"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "android.permission.GET_ACCOUNTS"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "android.permission.READ_CONTACTS"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "android.permission.ACCESS_COARSE_LOCATION"

    aput-object v2, v0, v1

    return-object v0
.end method

.method private i()Ljava/util/concurrent/ThreadPoolExecutor;
    .locals 8

    const/4 v2, 0x3

    iget-object v0, p0, Lru/mail/libverify/api/ad;->t:Ljava/util/concurrent/ThreadPoolExecutor;

    if-nez v0, :cond_0

    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v4, 0x78

    sget-object v6, Lru/mail/libverify/api/ad;->e:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    move v3, v2

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v1, p0, Lru/mail/libverify/api/ad;->t:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v0, p0, Lru/mail/libverify/api/ad;->t:Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->t:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v1, p0, Lru/mail/libverify/api/ad;->p:Lru/mail/libverify/api/ad$e;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->setRejectedExecutionHandler(Ljava/util/concurrent/RejectedExecutionHandler;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->t:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lru/mail/libverify/api/ad$44;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$44;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->setThreadFactory(Ljava/util/concurrent/ThreadFactory;)V

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->t:Ljava/util/concurrent/ThreadPoolExecutor;

    return-object v0
.end method

.method static synthetic i(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/v;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->l()Lru/mail/libverify/api/v;

    move-result-object v0

    return-object v0
.end method

.method private j()Lru/mail/libverify/notifications/c;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad;->u:Lru/mail/libverify/notifications/c;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/notifications/c;

    new-instance v1, Lru/mail/libverify/api/ad$59;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$59;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-direct {v0, v1}, Lru/mail/libverify/notifications/c;-><init>(Lru/mail/libverify/notifications/d;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->u:Lru/mail/libverify/notifications/c;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->u:Lru/mail/libverify/notifications/c;

    return-object v0
.end method

.method static synthetic j(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/o;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->k()Lru/mail/libverify/storage/o;

    move-result-object v0

    return-object v0
.end method

.method static synthetic k(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/ad$h;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->o:Lru/mail/libverify/api/ad$h;

    return-object v0
.end method

.method private k()Lru/mail/libverify/storage/o;
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/api/ad;->s:Lru/mail/libverify/storage/o;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/storage/d;

    iget-object v1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v1}, Lru/mail/libverify/storage/l;->z()Lru/mail/libverify/storage/o;

    move-result-object v1

    iget-object v2, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/storage/d;-><init>(Lru/mail/libverify/storage/o;Landroid/os/Handler;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->s:Lru/mail/libverify/storage/o;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->s:Lru/mail/libverify/storage/o;

    return-object v0
.end method

.method static synthetic l(Lru/mail/libverify/api/ad;)Ljava/util/concurrent/ThreadPoolExecutor;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->i()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    return-object v0
.end method

.method private l()Lru/mail/libverify/api/v;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad;->r:Lru/mail/libverify/api/v;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/api/ad$f;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/api/ad$f;-><init>(Lru/mail/libverify/api/ad;B)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->r:Lru/mail/libverify/api/v;

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->i()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/api/ad$60;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$60;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->r:Lru/mail/libverify/api/v;

    return-object v0
.end method

.method private m()Ljava/lang/Integer;
    .locals 6

    const/4 v0, 0x0

    iget-object v1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v1}, Lru/mail/libverify/storage/l;->z()Lru/mail/libverify/storage/o;

    move-result-object v1

    const-string/jumbo v2, "api_settings_timestamp"

    invoke-interface {v1, v2}, Lru/mail/libverify/storage/o;->b(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    long-to-int v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0
.end method

.method static synthetic m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->i:Lru/mail/libverify/statistics/b;

    return-object v0
.end method

.method static synthetic n(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/t;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->j:Lru/mail/libverify/api/t;

    return-object v0
.end method

.method static synthetic o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->f:Lru/mail/libverify/api/w;

    return-object v0
.end method

.method static synthetic p(Lru/mail/libverify/api/ad;)Lru/mail/libverify/notifications/c;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->j()Lru/mail/libverify/notifications/c;

    move-result-object v0

    return-object v0
.end method

.method static synthetic q(Lru/mail/libverify/api/ad;)V
    .locals 2

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->i()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/api/ad$19;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$19;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method static synthetic r(Lru/mail/libverify/api/ad;)V
    .locals 5

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "sessions notified (count = %d) network available"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/ad;->f:Lru/mail/libverify/api/w;

    invoke-interface {v4}, Lru/mail/libverify/api/w;->b()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->f:Lru/mail/libverify/api/w;

    sget v1, Lru/mail/libverify/api/w$a;->a:I

    invoke-interface {v0, v1}, Lru/mail/libverify/api/w;->a(I)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/ae;

    invoke-interface {v0}, Lru/mail/libverify/api/ae;->f()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method static synthetic s(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/r;
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/api/ad;->v:Lru/mail/libverify/api/r;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/api/r;

    iget-object v1, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    new-instance v2, Lru/mail/libverify/api/ad$54;

    invoke-direct {v2, p0}, Lru/mail/libverify/api/ad$54;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/api/r;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/api/q;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad;->v:Lru/mail/libverify/api/r;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->v:Lru/mail/libverify/api/r;

    return-object v0
.end method

.method static synthetic t(Lru/mail/libverify/api/ad;)V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-static {v0}, Lru/mail/libverify/requests/o;->m(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/requests/e;)V

    return-void
.end method

.method static synthetic u(Lru/mail/libverify/api/ad;)Z
    .locals 6

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->m()Ljava/lang/Integer;

    move-result-object v2

    const-string/jumbo v3, "VerificationApi"

    const-string/jumbo v4, "elapsed time since the last settings check %s"

    new-array v5, v1, [Ljava/lang/Object;

    aput-object v2, v5, v0

    invoke-static {v3, v4, v5}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const v3, 0x5265c00

    if-ge v2, v3, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method static synthetic v(Lru/mail/libverify/api/ad;)Ljava/util/HashSet;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->g:Ljava/util/HashSet;

    return-object v0
.end method

.method static synthetic w(Lru/mail/libverify/api/ad;)V
    .locals 2

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "cancel started"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lru/mail/libverify/api/ad;->g()V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->H()V

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "cancel completed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "execute check fetcher state"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$53;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$53;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Ljava/lang/Exception;)V
    .locals 2
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "failed to obtain push token"

    invoke-static {v0, v1, p1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$14;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$14;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$61;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$61;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final a(Ljava/lang/String;I)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$47;

    invoke-direct {v1, p0, p1, p2}, Lru/mail/libverify/api/ad$47;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Ljava/lang/String;J)V
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "cancel notification id %s timestamp %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$9;

    invoke-direct {v1, p0, p1, p2, p3}, Lru/mail/libverify/api/ad$9;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;J)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "sms from %s message %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$6;

    invoke-direct {v1, p0, p2, p1}, Lru/mail/libverify/api/ad$6;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final a(Ljava/lang/String;Lru/mail/libverify/api/ac$b;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/ac$b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$48;

    invoke-direct {v1, p0, p1, p2}, Lru/mail/libverify/api/ad$48;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Lru/mail/libverify/api/ac$b;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Lru/mail/libverify/api/aa$a;)V
    .locals 4

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "execute check settings request %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$57;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$57;-><init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/api/aa$a;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final a(Z)V
    .locals 5

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "network available = %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$28;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$28;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$29;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$29;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public final a_(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "incoming call %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$7;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$7;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final declared-synchronized addSmsCodeNotificationListener(Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;)V
    .locals 1
    .param p1    # Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->h:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized addVerificationStateChangedListener(Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V
    .locals 1
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->g:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final b()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$13;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$13;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$2;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$2;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "ipc message %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$8;

    invoke-direct {v1, p0, p1, p2}, Lru/mail/libverify/api/ad$8;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final b(Z)V
    .locals 5

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "battery status low = %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$55;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$55;-><init>(Lru/mail/libverify/api/ad;Z)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c()V
    .locals 2

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "failed to obtain push token after all attempts"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$15;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$15;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$3;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$3;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final cancelVerification(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "session id must be not null"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$20;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$20;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public final checkAccountVerification(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$38;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$38;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final checkAccountVerificationBySms(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckListener;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/VerificationApi$AccountCheckListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$39;

    invoke-direct {v1, p0, p1, p2}, Lru/mail/libverify/api/ad$39;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckListener;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final checkPhoneNumber(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLru/mail/libverify/api/VerificationApi$PhoneCheckListener;)V
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lru/mail/libverify/api/VerificationApi$PhoneCheckListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v7, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v0, Lru/mail/libverify/api/ad$41;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p1

    move-object v4, p2

    move v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lru/mail/libverify/api/ad$41;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLru/mail/libverify/api/VerificationApi$PhoneCheckListener;)V

    invoke-virtual {v7, v0}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final completeVerification(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "sessionId must be not null"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$21;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$21;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public final d()V
    .locals 2

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "push token refresh requested"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$16;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$16;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final d(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$10;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$10;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final e()Lru/mail/libverify/storage/o;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->k()Lru/mail/libverify/storage/o;

    move-result-object v0

    return-object v0
.end method

.method public final e(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$11;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$11;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final f()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/api/ad;->f:Lru/mail/libverify/api/w;

    sget v1, Lru/mail/libverify/api/w$a;->a:I

    invoke-interface {v0, v1}, Lru/mail/libverify/api/w;->b(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final f(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$50;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$50;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method final g()V
    .locals 4

    iget-object v0, p0, Lru/mail/libverify/api/ad;->t:Ljava/util/concurrent/ThreadPoolExecutor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/ad;->t:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->t:Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v2, 0x1388

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "wait for shutdown failure"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/api/ad;->t:Ljava/util/concurrent/ThreadPoolExecutor;

    :cond_1
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "shutdown failure"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final g(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$51;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$51;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final h(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "notification %s should be unblocked"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$56;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$56;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$45;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$45;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final j(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$46;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$46;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final k(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$49;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$49;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final declared-synchronized removeSmsCodeNotificationListener(Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;)V
    .locals 1
    .param p1    # Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->h:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized removeVerificationStateChangedListener(Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V
    .locals 1
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->g:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final reportNetworkStateChange(Z)V
    .locals 5

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "reportNetworkStateChange network available = %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$30;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$30;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public final requestIvrPhoneCall(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$IvrStateListener;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$40;

    invoke-direct {v1, p0, p1, p2}, Lru/mail/libverify/api/ad$40;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$IvrStateListener;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final requestNewSmsCode(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "sessionId must be not null"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$24;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$24;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public final requestVerificationState(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$32;

    invoke-direct {v1, p0, p1, p2}, Lru/mail/libverify/api/ad$32;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final requestVerificationStates(Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;)V
    .locals 2
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$31;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$31;-><init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final reset()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$35;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$35;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final resetVerificationCodeError(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$33;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$33;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final searchPhoneAccounts(Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;Z)V
    .locals 2
    .param p1    # Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "search accounts requested"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$25;

    invoke-direct {v1, p0, p2, p1}, Lru/mail/libverify/api/ad$25;-><init>(Lru/mail/libverify/api/ad;ZLru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final setAllowedPermissions([Ljava/lang/String;)V
    .locals 2
    .param p1    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$26;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$26;-><init>(Lru/mail/libverify/api/ad;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final setApiEndpoints(Ljava/util/Map;)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$27;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$27;-><init>(Lru/mail/libverify/api/ad;Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final setCustomLocale(Ljava/util/Locale;)V
    .locals 2
    .param p1    # Ljava/util/Locale;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$42;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$42;-><init>(Lru/mail/libverify/api/ad;Ljava/util/Locale;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final setLocationUsage(Z)V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$43;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$43;-><init>(Lru/mail/libverify/api/ad;Z)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final signOut(Z)V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$36;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$36;-><init>(Lru/mail/libverify/api/ad;Z)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final softSignOut()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$37;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$37;-><init>(Lru/mail/libverify/api/ad;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final startVerification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Provided arguments can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Lru/mail/libverify/api/af;

    invoke-direct {p0}, Lru/mail/libverify/api/ad;->l()Lru/mail/libverify/api/v;

    move-result-object v1

    iget-object v2, p0, Lru/mail/libverify/api/ad;->a:Lru/mail/libverify/storage/l;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lru/mail/libverify/api/af;-><init>(Lru/mail/libverify/api/v;Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v2, Lru/mail/libverify/api/ad$18;

    invoke-direct {v2, p0, v0}, Lru/mail/libverify/api/ad$18;-><init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/api/ae;)V

    invoke-virtual {v1, v2}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    invoke-interface {v0}, Lru/mail/libverify/api/ae;->g()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final verifySmsCode(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "sessionId and smsCode must be not null"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$22;

    invoke-direct {v1, p0, p2, p1}, Lru/mail/libverify/api/ad$22;-><init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
