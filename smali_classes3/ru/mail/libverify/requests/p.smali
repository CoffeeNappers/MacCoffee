.class public final Lru/mail/libverify/requests/p;
.super Lru/mail/libverify/requests/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/requests/p$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lru/mail/libverify/requests/e",
        "<",
        "Lru/mail/libverify/requests/response/VerifyApiResponse;",
        ">;"
    }
.end annotation


# instance fields
.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private e:[Lru/mail/libverify/requests/p$a;

.field private f:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
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
    .param p4    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;-><init>(Lru/mail/libverify/storage/k;)V

    iput-object p2, p0, Lru/mail/libverify/requests/p;->b:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/requests/p;->c:Ljava/lang/String;

    iput-object p5, p0, Lru/mail/libverify/requests/p;->d:Ljava/lang/String;

    iput-object p4, p0, Lru/mail/libverify/requests/p;->f:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/requests/p;->e:[Lru/mail/libverify/requests/p$a;

    return-void
.end method

.method public constructor <init>(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lru/mail/libverify/requests/p$a;)V
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
    .param p4    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # [Lru/mail/libverify/requests/p$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct/range {p0 .. p5}, Lru/mail/libverify/requests/p;-><init>(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p6, p0, Lru/mail/libverify/requests/p;->e:[Lru/mail/libverify/requests/p$a;

    return-void
.end method


# virtual methods
.method protected final a()Lru/mail/libverify/requests/e$a;
    .locals 9

    const/4 v0, 0x0

    iget-object v1, p0, Lru/mail/libverify/requests/p;->f:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t prepare verification request without phone number"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-super {p0}, Lru/mail/libverify/requests/e;->a()Lru/mail/libverify/requests/e$a;

    move-result-object v4

    const-string/jumbo v1, "mode"

    const-string/jumbo v2, "manual"

    invoke-virtual {v4, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "session_id"

    iget-object v2, p0, Lru/mail/libverify/requests/p;->b:Ljava/lang/String;

    invoke-virtual {v4, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "service"

    iget-object v2, p0, Lru/mail/libverify/requests/p;->c:Ljava/lang/String;

    invoke-virtual {v4, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "language"

    iget-object v2, p0, Lru/mail/libverify/requests/p;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->t()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "capabilities"

    const-string/jumbo v2, "call_number_fragment,call_session_hash"

    invoke-virtual {v4, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lru/mail/libverify/requests/p;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->w()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v2, "device_name"

    invoke-virtual {v4, v2, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_1
    iget-object v1, p0, Lru/mail/libverify/requests/p;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->q()Lru/mail/libverify/accounts/b;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/accounts/b;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string/jumbo v2, "device_account"

    invoke-virtual {v4, v2, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_2
    iget-object v1, p0, Lru/mail/libverify/requests/p;->e:[Lru/mail/libverify/requests/p$a;

    if-nez v1, :cond_8

    const-string/jumbo v0, "checks"

    const-string/jumbo v1, "ivr,sms,call,push"

    invoke-virtual {v4, v0, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_3
    :goto_0
    iget-object v0, p0, Lru/mail/libverify/requests/p;->d:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "user_id"

    iget-object v1, p0, Lru/mail/libverify/requests/p;->d:Ljava/lang/String;

    invoke-virtual {v4, v0, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_4
    iget-object v0, p0, Lru/mail/libverify/requests/p;->f:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string/jumbo v0, "phone"

    iget-object v1, p0, Lru/mail/libverify/requests/p;->f:Ljava/lang/String;

    invoke-virtual {v4, v0, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_5
    iget-object v0, p0, Lru/mail/libverify/requests/p;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->o()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string/jumbo v1, "push_token"

    invoke-virtual {v4, v1, v0}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_6
    iget-object v0, p0, Lru/mail/libverify/requests/p;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->v()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string/jumbo v1, "server_key"

    invoke-virtual {v4, v1, v0}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_7
    invoke-virtual {p0, v4}, Lru/mail/libverify/requests/p;->a(Lru/mail/libverify/requests/e$a;)V

    return-object v4

    :cond_8
    iget-object v1, p0, Lru/mail/libverify/requests/p;->e:[Lru/mail/libverify/requests/p$a;

    array-length v1, v1

    if-nez v1, :cond_9

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Cheks param should either null or should contain any items"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    const-string/jumbo v1, ""

    iget-object v5, p0, Lru/mail/libverify/requests/p;->e:[Lru/mail/libverify/requests/p$a;

    array-length v6, v5

    move v2, v0

    move v8, v0

    move-object v0, v1

    move v1, v8

    :goto_1
    if-ge v2, v6, :cond_b

    aget-object v7, v5, v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_a

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, v7, Lru/mail/libverify/requests/p$a;->value:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v0, Lru/mail/libverify/requests/p$a;->CALL:Lru/mail/libverify/requests/p$a;

    if-ne v7, v0, :cond_c

    const/4 v0, 0x1

    :goto_2
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move v1, v0

    move-object v0, v3

    goto :goto_1

    :cond_b
    const-string/jumbo v2, "checks"

    invoke-virtual {v4, v2, v0}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v0, p0, Lru/mail/libverify/requests/p;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->x()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, "ext_info"

    invoke-static {v0}, Lru/mail/libverify/utils/m;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v1, v0}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_0

    :cond_c
    move v0, v1

    goto :goto_2
.end method

.method protected final bridge synthetic a(Ljava/lang/String;)Lru/mail/libverify/requests/response/ClientApiResponseBase;
    .locals 1

    const-class v0, Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-static {p1, v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/VerifyApiResponse;

    return-object v0
.end method

.method protected final b()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final c()Lru/mail/libverify/requests/m;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected final f()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "verify"

    return-object v0
.end method

.method protected final g()Lru/mail/libverify/requests/l;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
