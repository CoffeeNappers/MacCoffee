.class public final Lru/mail/libverify/requests/i;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/requests/i$a;,
        Lru/mail/libverify/requests/i$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TW:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final a:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<TTW;>;"
        }
    .end annotation
.end field

.field final b:Lru/mail/libverify/requests/i$a;

.field final c:Lru/mail/libverify/requests/i$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lru/mail/libverify/requests/i$b",
            "<TTW;>;"
        }
    .end annotation
.end field

.field volatile d:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<TTW;>;"
        }
    .end annotation
.end field

.field private final e:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;Lru/mail/libverify/requests/i$a;Lru/mail/libverify/requests/i$b;)V
    .locals 0
    .param p1    # Ljava/util/concurrent/ExecutorService;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Callable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lru/mail/libverify/requests/i$a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lru/mail/libverify/requests/i$b;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ExecutorService;",
            "Ljava/util/concurrent/Callable",
            "<TTW;>;",
            "Lru/mail/libverify/requests/i$a;",
            "Lru/mail/libverify/requests/i$b",
            "<TTW;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/requests/i;->e:Ljava/util/concurrent/ExecutorService;

    iput-object p2, p0, Lru/mail/libverify/requests/i;->a:Ljava/util/concurrent/Callable;

    iput-object p3, p0, Lru/mail/libverify/requests/i;->b:Lru/mail/libverify/requests/i$a;

    iput-object p4, p0, Lru/mail/libverify/requests/i;->c:Lru/mail/libverify/requests/i$b;

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<TTW;>;"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/requests/i;->e:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lru/mail/libverify/requests/i$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/requests/i$1;-><init>(Lru/mail/libverify/requests/i;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/requests/i$2;

    invoke-direct {v1, p0, v0}, Lru/mail/libverify/requests/i$2;-><init>(Lru/mail/libverify/requests/i;Ljava/util/concurrent/Future;)V

    iput-object v1, p0, Lru/mail/libverify/requests/i;->d:Ljava/util/concurrent/Future;

    iget-object v0, p0, Lru/mail/libverify/requests/i;->d:Ljava/util/concurrent/Future;

    return-object v0
.end method
