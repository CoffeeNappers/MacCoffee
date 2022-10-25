.class final Lru/mail/libverify/api/c$2$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/c$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/c$2;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/c$2;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/c$2$3;->a:Lru/mail/libverify/api/c$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/c$2$3;->a:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v1}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/c;Ljava/util/List;)Ljava/util/List;

    iget-object v0, p0, Lru/mail/libverify/api/c$2$3;->a:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->GENERAL_ERROR:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    invoke-static {v0, v1}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/c;Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lru/mail/libverify/api/c$2$3;->a:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v0}, Lru/mail/libverify/api/c;->b(Lru/mail/libverify/api/c;)Ljava/util/concurrent/Future;

    iget-object v0, p0, Lru/mail/libverify/api/c$2$3;->a:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v0}, Lru/mail/libverify/api/c;->c(Lru/mail/libverify/api/c;)Lru/mail/libverify/api/b;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/b;->c()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lru/mail/libverify/api/c$2$3;->a:Lru/mail/libverify/api/c$2;

    iget-object v1, v1, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v1}, Lru/mail/libverify/api/c;->b(Lru/mail/libverify/api/c;)Ljava/util/concurrent/Future;

    iget-object v1, p0, Lru/mail/libverify/api/c$2$3;->a:Lru/mail/libverify/api/c$2;

    iget-object v1, v1, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v1}, Lru/mail/libverify/api/c;->c(Lru/mail/libverify/api/c;)Lru/mail/libverify/api/b;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/api/b;->c()V

    throw v0
.end method
