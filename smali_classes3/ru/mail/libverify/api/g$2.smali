.class final Lru/mail/libverify/api/g$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lru/mail/libverify/api/d;

.field final synthetic c:Lru/mail/libverify/api/g;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/g;Ljava/lang/String;Lru/mail/libverify/api/d;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/g$2;->c:Lru/mail/libverify/api/g;

    iput-object p2, p0, Lru/mail/libverify/api/g$2;->a:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/api/g$2;->b:Lru/mail/libverify/api/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    const/4 v5, 0x0

    const-string/jumbo v0, "ApplicationChecker"

    const-string/jumbo v1, "application check completed jws %s, result %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/g$2;->a:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lru/mail/libverify/api/g$2;->b:Lru/mail/libverify/api/d;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/g$2;->c:Lru/mail/libverify/api/g;

    iput-object v5, v0, Lru/mail/libverify/api/g;->c:Ljava/util/concurrent/Future;

    iget-object v0, p0, Lru/mail/libverify/api/g$2;->c:Lru/mail/libverify/api/g;

    iput-object v5, v0, Lru/mail/libverify/api/g;->d:Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/api/g$2;->c:Lru/mail/libverify/api/g;

    iget-object v0, v0, Lru/mail/libverify/api/g;->b:Lru/mail/libverify/api/f;

    invoke-interface {v0}, Lru/mail/libverify/api/f;->b()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "app_check_started"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/g$2;->b:Lru/mail/libverify/api/d;

    sget-object v2, Lru/mail/libverify/api/d;->SUCCESS:Lru/mail/libverify/api/d;

    if-ne v1, v2, :cond_0

    const-string/jumbo v1, "app_check_completed"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    :cond_0
    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    iget-object v0, p0, Lru/mail/libverify/api/g$2;->c:Lru/mail/libverify/api/g;

    iget-object v0, v0, Lru/mail/libverify/api/g;->b:Lru/mail/libverify/api/f;

    iget-object v1, p0, Lru/mail/libverify/api/g$2;->a:Ljava/lang/String;

    iget-object v2, p0, Lru/mail/libverify/api/g$2;->b:Lru/mail/libverify/api/d;

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/f;->a(Ljava/lang/String;Lru/mail/libverify/api/d;)V

    return-void
.end method
