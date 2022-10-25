.class final Lru/mail/libverify/api/c$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/c;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/c;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/c;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget-object v0, p0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v0}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/c;)Lru/mail/libverify/requests/response/SmsInfo;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/api/c;->b(Lru/mail/libverify/requests/response/SmsInfo;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v0}, Lru/mail/libverify/api/c;->c(Lru/mail/libverify/api/c;)Lru/mail/libverify/api/b;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/b;->f()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/api/c$2$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/c$2$1;-><init>(Lru/mail/libverify/api/c$2;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v1}, Lru/mail/libverify/api/c;->c(Lru/mail/libverify/api/c;)Lru/mail/libverify/api/b;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/api/b;->b()V

    iget-object v1, p0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v1}, Lru/mail/libverify/api/c;->d(Lru/mail/libverify/api/c;)Lru/mail/libverify/storage/k;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->r()Lru/mail/libverify/sms/c;

    move-result-object v1

    new-instance v2, Lru/mail/libverify/api/c$a;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lru/mail/libverify/api/c$a;-><init>(B)V

    new-instance v3, Lru/mail/libverify/api/h$a;

    invoke-direct {v3}, Lru/mail/libverify/api/h$a;-><init>()V

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/SmsInfo;->getSmsTemplates()[Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    :try_start_0
    invoke-static {v0, v3, v2}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/requests/response/SmsInfo;Lru/mail/libverify/api/h$a;Lru/mail/libverify/api/c$a;)Lru/mail/libverify/sms/c$a;

    move-result-object v0

    invoke-interface {v1, v0}, Lru/mail/libverify/sms/c;->a(Lru/mail/libverify/sms/c$a;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v1}, Lru/mail/libverify/api/c;->c(Lru/mail/libverify/api/c;)Lru/mail/libverify/api/b;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/api/b;->f()Landroid/os/Handler;

    move-result-object v1

    new-instance v3, Lru/mail/libverify/api/c$2$2;

    invoke-direct {v3, p0, v0, v2}, Lru/mail/libverify/api/c$2$2;-><init>(Lru/mail/libverify/api/c$2;Ljava/util/List;Lru/mail/libverify/api/c$a;)V

    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "AccountChecker"

    const-string/jumbo v2, "query user sms messages interrupted"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string/jumbo v1, "AccountChecker"

    const-string/jumbo v2, "failed to query user sms messages"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lru/mail/libverify/api/c$2;->a:Lru/mail/libverify/api/c;

    invoke-static {v0}, Lru/mail/libverify/api/c;->c(Lru/mail/libverify/api/c;)Lru/mail/libverify/api/b;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/b;->f()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/api/c$2$3;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/c$2$3;-><init>(Lru/mail/libverify/api/c$2;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
