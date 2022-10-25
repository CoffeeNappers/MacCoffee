.class final Lru/mail/libverify/api/ad$25$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad$25;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad$25;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad$25;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$25$1;->a:Lru/mail/libverify/api/ad$25;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$25$1;->a:Lru/mail/libverify/api/ad$25;

    iget-object v0, v0, Lru/mail/libverify/api/ad$25;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->p()Lru/mail/libverify/accounts/d;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/accounts/d;->a()Lru/mail/libverify/accounts/a;

    move-result-object v0

    iget-object v2, p0, Lru/mail/libverify/api/ad$25$1;->a:Lru/mail/libverify/api/ad$25;

    iget-boolean v2, v2, Lru/mail/libverify/api/ad$25;->a:Z

    if-eqz v2, :cond_2

    if-eqz v0, :cond_1

    new-instance v2, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;

    iget-object v3, v0, Lru/mail/libverify/accounts/a;->b:Ljava/lang/String;

    iget-object v0, v0, Lru/mail/libverify/accounts/a;->a:Ljava/lang/String;

    invoke-direct {v2, v3, v0}, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    :goto_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$25$1;->a:Lru/mail/libverify/api/ad$25;

    iget-object v0, v0, Lru/mail/libverify/api/ad$25;->b:Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;->onComplete(Ljava/util/List;)V

    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$25$1;->a:Lru/mail/libverify/api/ad$25;

    iget-object v0, v0, Lru/mail/libverify/api/ad$25;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->q()Lru/mail/libverify/accounts/b;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/accounts/b;->a()Lru/mail/libverify/accounts/a;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v2, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;

    iget-object v3, v0, Lru/mail/libverify/accounts/a;->b:Ljava/lang/String;

    iget-object v0, v0, Lru/mail/libverify/accounts/a;->a:Ljava/lang/String;

    invoke-direct {v2, v3, v0}, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lru/mail/libverify/api/ad$25$1;->a:Lru/mail/libverify/api/ad$25;

    iget-object v2, v2, Lru/mail/libverify/api/ad$25;->c:Lru/mail/libverify/api/ad;

    invoke-static {v2}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v2

    invoke-interface {v2}, Lru/mail/libverify/storage/l;->q()Lru/mail/libverify/accounts/b;

    move-result-object v2

    invoke-interface {v2}, Lru/mail/libverify/accounts/b;->c()Ljava/util/List;

    move-result-object v2

    if-eqz v0, :cond_3

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/accounts/a;

    if-eqz v0, :cond_4

    iget-object v4, v0, Lru/mail/libverify/accounts/a;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    iget-object v4, v0, Lru/mail/libverify/accounts/a;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v4, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;

    iget-object v5, v0, Lru/mail/libverify/accounts/a;->b:Ljava/lang/String;

    iget-object v0, v0, Lru/mail/libverify/accounts/a;->a:Ljava/lang/String;

    invoke-direct {v4, v5, v0}, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method
