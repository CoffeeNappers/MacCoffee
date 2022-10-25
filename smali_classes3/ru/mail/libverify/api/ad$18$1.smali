.class final Lru/mail/libverify/api/ad$18$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad$18;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad$18;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad$18;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$18$1;->a:Lru/mail/libverify/api/ad$18;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    iget-object v0, p0, Lru/mail/libverify/api/ad$18$1;->a:Lru/mail/libverify/api/ad$18;

    iget-object v0, v0, Lru/mail/libverify/api/ad$18;->a:Lru/mail/libverify/api/ae;

    invoke-interface {v0}, Lru/mail/libverify/api/ae;->a()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$18$1;->a:Lru/mail/libverify/api/ad$18;

    iget-object v0, v0, Lru/mail/libverify/api/ad$18;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$18$1;->a:Lru/mail/libverify/api/ad$18;

    iget-object v1, v1, Lru/mail/libverify/api/ad$18;->a:Lru/mail/libverify/api/ae;

    if-eqz v1, :cond_0

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v3, Lru/mail/libverify/statistics/a;->Verification_Started:Lru/mail/libverify/statistics/a;

    new-instance v4, Lru/mail/libverify/statistics/b$a;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v5, "ServiceName"

    invoke-interface {v1}, Lru/mail/libverify/api/ae;->k()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v4

    iget-object v4, v4, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v3, v4}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    return-void
.end method
