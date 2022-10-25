.class public final Lru/mail/libverify/requests/j;
.super Lru/mail/libverify/requests/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lru/mail/libverify/requests/e",
        "<",
        "Lru/mail/libverify/requests/response/PhoneInfoResponse;",
        ">;"
    }
.end annotation


# instance fields
.field private final b:Lru/mail/libverify/storage/k;

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private final e:Ljava/lang/String;

.field private final f:Z


# direct methods
.method public constructor <init>(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;-><init>(Lru/mail/libverify/storage/k;)V

    iput-object p1, p0, Lru/mail/libverify/requests/j;->b:Lru/mail/libverify/storage/k;

    iput-object p2, p0, Lru/mail/libverify/requests/j;->c:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/requests/j;->d:Ljava/lang/String;

    iput-object p4, p0, Lru/mail/libverify/requests/j;->e:Ljava/lang/String;

    iput-boolean p5, p0, Lru/mail/libverify/requests/j;->f:Z

    return-void
.end method


# virtual methods
.method protected final a()Lru/mail/libverify/requests/e$a;
    .locals 3

    new-instance v0, Lru/mail/libverify/requests/e$a;

    invoke-direct {v0}, Lru/mail/libverify/requests/e$a;-><init>()V

    iget-object v1, p0, Lru/mail/libverify/requests/j;->e:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "id"

    iget-object v2, p0, Lru/mail/libverify/requests/j;->e:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_0
    const-string/jumbo v1, "lang"

    iget-object v2, p0, Lru/mail/libverify/requests/j;->b:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->t()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "service"

    iget-object v2, p0, Lru/mail/libverify/requests/j;->d:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "phone"

    iget-object v2, p0, Lru/mail/libverify/requests/j;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "platform"

    const-string/jumbo v2, "android"

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lru/mail/libverify/requests/j;->b:Lru/mail/libverify/storage/k;

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->p()Lru/mail/libverify/accounts/d;

    move-result-object v1

    invoke-virtual {v1}, Lru/mail/libverify/accounts/d;->k()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v2, "iso_country_code"

    invoke-virtual {v0, v2, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_1
    iget-boolean v1, p0, Lru/mail/libverify/requests/j;->f:Z

    if-eqz v1, :cond_2

    const-string/jumbo v1, "info"

    const-string/jumbo v2, "typing_check"

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_2
    return-object v0
.end method

.method protected final bridge synthetic a(Ljava/lang/String;)Lru/mail/libverify/requests/response/ClientApiResponseBase;
    .locals 1

    const-class v0, Lru/mail/libverify/requests/response/PhoneInfoResponse;

    invoke-static {p1, v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/PhoneInfoResponse;

    return-object v0
.end method

.method protected final b()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final c()Lru/mail/libverify/requests/m;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected final f()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "smsphoneinfo"

    return-object v0
.end method

.method protected final g()Lru/mail/libverify/requests/l;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected final n()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
