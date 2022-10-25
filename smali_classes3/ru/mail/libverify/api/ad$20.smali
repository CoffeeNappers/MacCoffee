.class final Lru/mail/libverify/api/ad$20;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->cancelVerification(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$20;->b:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$20;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    const/4 v8, 0x0

    new-instance v1, Lru/mail/libverify/api/ad$20$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$20$1;-><init>(Lru/mail/libverify/api/ad$20;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$20;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->backgroundVerify()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/api/ad$20;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v2, "android.permission.READ_PHONE_STATE"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$20;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v2, "android.permission.RECEIVE_SMS"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$20;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    iget-object v2, p0, Lru/mail/libverify/api/ad$20;->a:Ljava/lang/String;

    invoke-interface {v0, v2}, Lru/mail/libverify/api/w;->a(Ljava/lang/String;)Lru/mail/libverify/api/ae;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-interface {v2}, Lru/mail/libverify/api/ae;->i()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->completedSuccessfully()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/api/ad$20;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    iget-object v3, p0, Lru/mail/libverify/api/ad$20;->a:Ljava/lang/String;

    invoke-interface {v0, v3}, Lru/mail/libverify/api/w;->e(Ljava/lang/String;)Lru/mail/libverify/api/ae;

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v3, "cancel verification for session %s has been delayed for %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lru/mail/libverify/api/ad$20;->a:Ljava/lang/String;

    aput-object v5, v4, v8

    const/4 v5, 0x1

    const v6, 0x927c0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v0, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$20;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    if-eqz v2, :cond_1

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v4, Lru/mail/libverify/statistics/a;->Verification_Switched_Background:Lru/mail/libverify/statistics/a;

    new-instance v5, Lru/mail/libverify/statistics/b$a;

    invoke-direct {v5, v8}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v6, "ServiceName"

    invoke-interface {v2}, Lru/mail/libverify/api/ae;->k()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v5

    iget-object v5, v5, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v4, v5}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$20;->b:Lru/mail/libverify/api/ad;

    iget-object v0, v0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    const-wide/32 v2, 0x927c0

    invoke-virtual {v0, v1, v2, v3}, Lru/mail/libverify/utils/b;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    :goto_1
    return-void

    :cond_3
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_1
.end method
