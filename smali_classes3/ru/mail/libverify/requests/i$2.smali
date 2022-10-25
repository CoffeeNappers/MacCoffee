.class final Lru/mail/libverify/requests/i$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Future;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/requests/i;->a()Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Future",
        "<TTW;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Ljava/util/concurrent/Future;

.field final synthetic b:Lru/mail/libverify/requests/i;


# direct methods
.method constructor <init>(Lru/mail/libverify/requests/i;Ljava/util/concurrent/Future;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/requests/i$2;->b:Lru/mail/libverify/requests/i;

    iput-object p2, p0, Lru/mail/libverify/requests/i$2;->a:Ljava/util/concurrent/Future;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final cancel(Z)Z
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/requests/i$2;->a:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    move-result v0

    iget-object v1, p0, Lru/mail/libverify/requests/i$2;->b:Lru/mail/libverify/requests/i;

    iget-object v1, v1, Lru/mail/libverify/requests/i;->b:Lru/mail/libverify/requests/i$a;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/requests/i$2;->b:Lru/mail/libverify/requests/i;

    iget-object v1, v1, Lru/mail/libverify/requests/i;->b:Lru/mail/libverify/requests/i$a;

    invoke-interface {v1}, Lru/mail/libverify/requests/i$a;->a()V

    :cond_0
    return v0
.end method

.method public final get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TTW;"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/requests/i$2;->a:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .param p3    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TTW;"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/requests/i$2;->a:Ljava/util/concurrent/Future;

    invoke-interface {v0, p1, p2, p3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final isCancelled()Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/i$2;->a:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    return v0
.end method

.method public final isDone()Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/i$2;->a:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isDone()Z

    move-result v0

    return v0
.end method
