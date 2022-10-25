.class final Lru/mail/libverify/api/ad$39;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->checkAccountVerificationBySms(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lru/mail/libverify/api/VerificationApi$AccountCheckListener;

.field final synthetic c:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckListener;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$39;->c:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$39;->a:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/api/ad$39;->b:Lru/mail/libverify/api/VerificationApi$AccountCheckListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "check verification with data %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/ad$39;->a:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$39;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->Check_Account_Started:Lru/mail/libverify/statistics/a;

    invoke-interface {v0, v2}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$39;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->accountCheckWithSms()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/ad$39;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->d(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/a;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$39;->a:Ljava/lang/String;

    iget-object v2, p0, Lru/mail/libverify/api/ad$39;->b:Lru/mail/libverify/api/VerificationApi$AccountCheckListener;

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/a;->a(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckListener;)V

    :goto_1
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$39;->c:Lru/mail/libverify/api/ad;

    iget-object v1, p0, Lru/mail/libverify/api/ad$39;->c:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v1

    iget-object v2, p0, Lru/mail/libverify/api/ad$39;->a:Ljava/lang/String;

    invoke-static {v1, v2}, Lru/mail/libverify/requests/o;->b(Lru/mail/libverify/storage/k;Ljava/lang/String;)Lru/mail/libverify/requests/o;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;)V

    goto :goto_1
.end method
