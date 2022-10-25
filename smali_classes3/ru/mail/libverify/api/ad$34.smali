.class final Lru/mail/libverify/api/ad$34;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/y;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/ad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad;

.field private b:Lru/mail/libverify/api/z;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    iget-object v0, v0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    return-object v0
.end method

.method public final a(Lru/mail/libverify/api/ae;)V
    .locals 3
    .param p1    # Lru/mail/libverify/api/ae;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    const/4 v1, 0x1

    const/16 v2, 0xd

    invoke-interface {v0, p1, v1, v2}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;ZI)V

    return-void
.end method

.method public final b()Lru/mail/libverify/api/z;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$34;->b:Lru/mail/libverify/api/z;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/api/ad$34$1;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/ad$34$1;-><init>(Lru/mail/libverify/api/ad$34;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad$34;->b:Lru/mail/libverify/api/z;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$34;->b:Lru/mail/libverify/api/z;

    return-object v0
.end method

.method public final b(Lru/mail/libverify/api/ae;)V
    .locals 1
    .param p1    # Lru/mail/libverify/api/ae;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0, p1}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;)V

    invoke-interface {p1}, Lru/mail/libverify/api/ae;->i()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->completedSuccessfully()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->useSafetyNet()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->e(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/e;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/e;->b()V

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->f(Lru/mail/libverify/api/ad;)Lru/mail/libverify/fetcher/d;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/fetcher/d;->d()V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->f(Lru/mail/libverify/api/ad;)Lru/mail/libverify/fetcher/d;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/fetcher/d;->a()V

    goto :goto_0
.end method

.method public final c()Lru/mail/libverify/storage/o;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->j(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/o;

    move-result-object v0

    return-object v0
.end method
