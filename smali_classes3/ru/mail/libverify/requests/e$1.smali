.class final Lru/mail/libverify/requests/e$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/requests/e;->a(Ljava/util/concurrent/ExecutorService;Lru/mail/libverify/requests/i$b;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/requests/e;


# direct methods
.method constructor <init>(Lru/mail/libverify/requests/e;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/requests/e$1;->a:Lru/mail/libverify/requests/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic call()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/e$1;->a:Lru/mail/libverify/requests/e;

    invoke-virtual {v0}, Lru/mail/libverify/requests/e;->k()Lru/mail/libverify/requests/response/ClientApiResponseBase;

    move-result-object v0

    return-object v0
.end method
