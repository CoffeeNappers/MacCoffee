.class final Lru/mail/libverify/api/ad$d$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad$d;->b()Ljava/util/concurrent/ExecutorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad$d;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad$d;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$d$1;->a:Lru/mail/libverify/api/ad$d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 2
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    const-string/jumbo v1, "libverify_fetcher_connection"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad$d$1;->a:Lru/mail/libverify/api/ad$d;

    iget-object v1, v1, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->k(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/ad$h;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    return-object v0
.end method
