.class final Lru/mail/libverify/api/ad$41;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->checkPhoneNumber(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLru/mail/libverify/api/VerificationApi$PhoneCheckListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Z

.field final synthetic e:Lru/mail/libverify/api/VerificationApi$PhoneCheckListener;

.field final synthetic f:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLru/mail/libverify/api/VerificationApi$PhoneCheckListener;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$41;->f:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$41;->a:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/api/ad$41;->b:Ljava/lang/String;

    iput-object p4, p0, Lru/mail/libverify/api/ad$41;->c:Ljava/lang/String;

    iput-boolean p5, p0, Lru/mail/libverify/api/ad$41;->d:Z

    iput-object p6, p0, Lru/mail/libverify/api/ad$41;->e:Lru/mail/libverify/api/VerificationApi$PhoneCheckListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 12

    const/4 v6, 0x1

    const/4 v7, 0x0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "check phone %s"

    new-array v2, v6, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/api/ad$41;->a:Ljava/lang/String;

    aput-object v3, v2, v7

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$41;->f:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->s(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/r;

    move-result-object v8

    iget-object v1, p0, Lru/mail/libverify/api/ad$41;->b:Ljava/lang/String;

    iget-object v2, p0, Lru/mail/libverify/api/ad$41;->c:Ljava/lang/String;

    iget-object v3, p0, Lru/mail/libverify/api/ad$41;->a:Ljava/lang/String;

    iget-boolean v4, p0, Lru/mail/libverify/api/ad$41;->d:Z

    iget-object v5, p0, Lru/mail/libverify/api/ad$41;->e:Lru/mail/libverify/api/VerificationApi$PhoneCheckListener;

    const-string/jumbo v0, "PhoneNumberChecker"

    const-string/jumbo v9, "Check %s %s %s"

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v1, v10, v7

    aput-object v2, v10, v6

    const/4 v11, 0x2

    aput-object v3, v10, v11

    invoke-static {v0, v9, v10}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    invoke-static {}, Lru/mail/libverify/api/p;->a()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    if-eqz v5, :cond_1

    invoke-interface {v5, v3, v0}, Lru/mail/libverify/api/VerificationApi$PhoneCheckListener;->onCompleted(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-static {v1}, Lru/mail/libverify/api/r$a;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, v8, Lru/mail/libverify/api/r;->c:Lru/mail/libverify/api/q;

    invoke-interface {v0}, Lru/mail/libverify/api/q;->c()V

    :cond_3
    new-instance v0, Lru/mail/libverify/api/r$a;

    invoke-direct/range {v0 .. v5}, Lru/mail/libverify/api/r$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLru/mail/libverify/api/VerificationApi$PhoneCheckListener;)V

    iget-object v1, v0, Lru/mail/libverify/api/r$a;->f:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x2b

    if-ne v4, v5, :cond_4

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_1
    const/4 v4, 0x4

    if-ge v1, v4, :cond_5

    invoke-static {}, Lru/mail/libverify/api/p;->d()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/api/r;->a(Lru/mail/libverify/api/r$a;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V

    goto :goto_0

    :cond_4
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_1

    :cond_5
    const/16 v4, 0x14

    if-le v1, v4, :cond_6

    invoke-static {}, Lru/mail/libverify/api/p;->d()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/api/r;->a(Lru/mail/libverify/api/r$a;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V

    goto :goto_0

    :cond_6
    iget-object v1, v8, Lru/mail/libverify/api/r;->b:Landroid/util/LruCache;

    iget-object v4, v0, Lru/mail/libverify/api/r$a;->h:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    if-eqz v1, :cond_7

    invoke-interface {v1}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;->getReason()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v4

    sget-object v5, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    if-ne v4, v5, :cond_7

    const-string/jumbo v2, "PhoneNumberChecker"

    const-string/jumbo v4, "Check %s found in the cache"

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v3, v5, v7

    invoke-static {v2, v4, v5}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v0, v1}, Lru/mail/libverify/api/r;->a(Lru/mail/libverify/api/r$a;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V

    invoke-interface {v1}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;->isApproximate()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v8, v0, v6}, Lru/mail/libverify/api/r;->a(Lru/mail/libverify/api/r$a;Z)V

    goto :goto_0

    :cond_7
    const-string/jumbo v1, "PhoneNumberChecker"

    const-string/jumbo v4, "Check %s not found in the cache"

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v3, v5, v7

    invoke-static {v1, v4, v5}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, v0, Lru/mail/libverify/api/r$a;->f:Ljava/lang/String;

    :goto_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x5

    if-le v3, v4, :cond_9

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v7, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iget-object v1, v8, Lru/mail/libverify/api/r;->b:Landroid/util/LruCache;

    invoke-static {v2, v3}, Lru/mail/libverify/api/r;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    if-eqz v1, :cond_8

    invoke-static {v1}, Lru/mail/libverify/api/p;->a(Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v1

    if-eqz v1, :cond_9

    const-string/jumbo v2, "PhoneNumberChecker"

    const-string/jumbo v4, "Check %s found reduced number in the cache"

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v3, v5, v7

    invoke-static {v2, v4, v5}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, v8, Lru/mail/libverify/api/r;->b:Landroid/util/LruCache;

    iget-object v3, v0, Lru/mail/libverify/api/r$a;->h:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0, v1}, Lru/mail/libverify/api/r;->a(Lru/mail/libverify/api/r$a;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V

    move v1, v6

    :goto_3
    invoke-virtual {v8, v0, v1}, Lru/mail/libverify/api/r;->a(Lru/mail/libverify/api/r$a;Z)V

    goto/16 :goto_0

    :cond_8
    move-object v1, v3

    goto :goto_2

    :cond_9
    move v1, v7

    goto :goto_3
.end method
