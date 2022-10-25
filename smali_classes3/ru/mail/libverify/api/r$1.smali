.class final Lru/mail/libverify/api/r$1;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/requests/i$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lru/mail/libverify/requests/i$b",
        "<",
        "Lru/mail/libverify/requests/response/PhoneInfoResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/requests/j;

.field final synthetic b:Lru/mail/libverify/api/r$a;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lru/mail/libverify/api/r;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/r;Lru/mail/libverify/requests/j;Lru/mail/libverify/api/r$a;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/r$1;->d:Lru/mail/libverify/api/r;

    iput-object p2, p0, Lru/mail/libverify/api/r$1;->a:Lru/mail/libverify/requests/j;

    iput-object p3, p0, Lru/mail/libverify/api/r$1;->b:Lru/mail/libverify/api/r$a;

    iput-object p4, p0, Lru/mail/libverify/api/r$1;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/r$1;->d:Lru/mail/libverify/api/r;

    iget-object v0, v0, Lru/mail/libverify/api/r;->c:Lru/mail/libverify/api/q;

    invoke-interface {v0}, Lru/mail/libverify/api/q;->a()Landroid/os/Handler;

    move-result-object v0

    return-object v0
.end method

.method public final a(Ljava/util/concurrent/Future;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<",
            "Lru/mail/libverify/requests/response/PhoneInfoResponse;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/r$1;->d:Lru/mail/libverify/api/r;

    iget-object v1, p0, Lru/mail/libverify/api/r$1;->a:Lru/mail/libverify/requests/j;

    iget-object v2, p0, Lru/mail/libverify/api/r$1;->b:Lru/mail/libverify/api/r$a;

    invoke-virtual {v0, v1, p1, v2}, Lru/mail/libverify/api/r;->a(Lru/mail/libverify/requests/j;Ljava/util/concurrent/Future;Lru/mail/libverify/api/r$a;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/r$1;->d:Lru/mail/libverify/api/r;

    iget-object v1, v1, Lru/mail/libverify/api/r;->a:Ljava/util/HashMap;

    iget-object v2, p0, Lru/mail/libverify/api/r$1;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lru/mail/libverify/api/r$1;->b:Lru/mail/libverify/api/r$a;

    invoke-static {v1, v0}, Lru/mail/libverify/api/r;->a(Lru/mail/libverify/api/r$a;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V

    goto :goto_0
.end method
