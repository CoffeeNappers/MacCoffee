.class final Lru/mail/libverify/api/c$2$2;
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
.field final synthetic a:Ljava/util/List;

.field final synthetic b:Lru/mail/libverify/api/c$a;

.field final synthetic c:Lru/mail/libverify/api/c$2;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/c$2;Ljava/util/List;Lru/mail/libverify/api/c$a;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iput-object p2, p0, Lru/mail/libverify/api/c$2$2;->a:Ljava/util/List;

    iput-object p3, p0, Lru/mail/libverify/api/c$2$2;->b:Lru/mail/libverify/api/c$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/c$2$2;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lru/mail/libverify/api/c$2$2;->b:Lru/mail/libverify/api/c$a;

    iget-boolean v0, v0, Lru/mail/libverify/api/c$a;->b:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->NO_SMS_FOUND_HAS_CODE:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    invoke-static {v0, v1}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/c;Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    iget-object v0, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v0}, Lru/mail/libverify/api/c;->b(Lru/mail/libverify/api/c;)Ljava/util/concurrent/Future;

    iget-object v0, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v0}, Lru/mail/libverify/api/c;->c(Lru/mail/libverify/api/c;)Lru/mail/libverify/api/b;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/b;->c()V

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lru/mail/libverify/api/c$2$2;->b:Lru/mail/libverify/api/c$a;

    iget-boolean v0, v0, Lru/mail/libverify/api/c$a;->a:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->NO_SMS_FOUND_HAS_SOURCE_MATCH:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    invoke-static {v0, v1}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/c;Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iget-object v1, v1, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v1}, Lru/mail/libverify/api/c;->b(Lru/mail/libverify/api/c;)Ljava/util/concurrent/Future;

    iget-object v1, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iget-object v1, v1, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v1}, Lru/mail/libverify/api/c;->c(Lru/mail/libverify/api/c;)Lru/mail/libverify/api/b;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/api/b;->c()V

    throw v0

    :cond_1
    :try_start_2
    iget-object v0, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->NO_SMS_FOUND:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    invoke-static {v0, v1}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/c;Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    iget-object v1, p0, Lru/mail/libverify/api/c$2$2;->a:Ljava/util/List;

    invoke-static {v0, v1}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/c;Ljava/util/List;)Ljava/util/List;

    iget-object v0, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iget-object v0, v0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    iget-object v1, p0, Lru/mail/libverify/api/c$2$2;->c:Lru/mail/libverify/api/c$2;

    iget-object v1, v1, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v1}, Lru/mail/libverify/api/c;->e(Lru/mail/libverify/api/c;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/api/c;->b(Lru/mail/libverify/api/c;Ljava/util/List;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method
