.class public final Lru/mail/libverify/requests/o;
.super Lru/mail/libverify/requests/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lru/mail/libverify/requests/e",
        "<",
        "Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;",
        ">;"
    }
.end annotation


# instance fields
.field public b:Ljava/lang/String;

.field private final c:Lru/mail/libverify/requests/UpdateSettingsData;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V
    .locals 0
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/requests/UpdateSettingsData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;-><init>(Lru/mail/libverify/storage/k;)V

    iput-object p2, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    return-void
.end method

.method constructor <init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/m;)V
    .locals 2
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/requests/m;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;-><init>(Lru/mail/libverify/storage/k;)V

    iget-object v0, p2, Lru/mail/libverify/requests/m;->a:Ljava/lang/String;

    const-class v1, Lru/mail/libverify/requests/UpdateSettingsData;

    invoke-static {v0, v1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/UpdateSettingsData;

    iput-object v0, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    return-void
.end method

.method public static a(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    invoke-static {}, Lru/mail/libverify/requests/UpdateSettingsData;->b()Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static a(Lru/mail/libverify/storage/k;Ljava/lang/String;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    invoke-static {p1}, Lru/mail/libverify/requests/UpdateSettingsData;->c(Ljava/lang/String;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static a(Lru/mail/libverify/storage/k;Ljava/lang/String;I)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    invoke-static {p1, p2}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Ljava/lang/String;I)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static a(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    invoke-static {p1, p2}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static b(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->REQUEST_SMS_INFO:Lru/mail/libverify/requests/n;

    invoke-static {v1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static b(Lru/mail/libverify/storage/k;Ljava/lang/String;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    invoke-static {p1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Ljava/lang/String;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static c(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->CHECK_SETTINGS_PACKAGES_CHANGED:Lru/mail/libverify/requests/n;

    invoke-static {v1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static c(Lru/mail/libverify/storage/k;Ljava/lang/String;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    invoke-static {p1}, Lru/mail/libverify/requests/UpdateSettingsData;->b(Ljava/lang/String;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static d(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->CHECK_SETTINGS_TIMER:Lru/mail/libverify/requests/n;

    invoke-static {v1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static e(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->CHECK_SETTINGS_RESTART:Lru/mail/libverify/requests/n;

    invoke-static {v1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static f(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->PING_RESPONSE_GCM:Lru/mail/libverify/requests/n;

    invoke-static {v1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static g(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->PING_RESPONSE_FETCHER:Lru/mail/libverify/requests/n;

    invoke-static {v1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static h(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->REPORT_NO_GCM_SERVICE:Lru/mail/libverify/requests/n;

    invoke-static {v1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static i(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->REQUEST_APP_CHECK_ID:Lru/mail/libverify/requests/n;

    invoke-static {v1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static j(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 3
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->REPORT_SIGNOUT:Lru/mail/libverify/requests/n;

    sget-object v2, Lru/mail/libverify/requests/g;->DEVICE:Lru/mail/libverify/requests/g;

    invoke-static {v1, v2}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static k(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 3
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->REPORT_SIGNOUT:Lru/mail/libverify/requests/n;

    sget-object v2, Lru/mail/libverify/requests/g;->PHONE:Lru/mail/libverify/requests/g;

    invoke-static {v1, v2}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static l(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->REPORT_SOFT_SIGNOUT:Lru/mail/libverify/requests/n;

    invoke-static {v1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method

.method public static m(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;
    .locals 2
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/o;

    sget-object v1, Lru/mail/libverify/requests/n;->REPORT_PHONE_NUMBER_REUSE:Lru/mail/libverify/requests/n;

    invoke-static {v1}, Lru/mail/libverify/requests/UpdateSettingsData;->a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/UpdateSettingsData;)V

    return-object v0
.end method


# virtual methods
.method protected final a()Lru/mail/libverify/requests/e$a;
    .locals 3

    invoke-super {p0}, Lru/mail/libverify/requests/e;->a()Lru/mail/libverify/requests/e$a;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/requests/o;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->o()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lru/mail/libverify/requests/o;->b:Ljava/lang/String;

    iget-object v1, p0, Lru/mail/libverify/requests/o;->b:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "push_token"

    iget-object v2, p0, Lru/mail/libverify/requests/o;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_0
    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget v1, v1, Lru/mail/libverify/requests/UpdateSettingsData;->blockTimeoutSec:I

    if-lez v1, :cond_1

    const-string/jumbo v1, "block_timeout"

    iget-object v2, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget v2, v2, Lru/mail/libverify/requests/UpdateSettingsData;->blockTimeoutSec:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_1
    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v1, v1, Lru/mail/libverify/requests/UpdateSettingsData;->from:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "from"

    iget-object v2, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v2, v2, Lru/mail/libverify/requests/UpdateSettingsData;->from:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_2
    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v1, v1, Lru/mail/libverify/requests/UpdateSettingsData;->action:Lru/mail/libverify/requests/n;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v1, v1, Lru/mail/libverify/requests/UpdateSettingsData;->action:Lru/mail/libverify/requests/n;

    sget-object v2, Lru/mail/libverify/requests/n;->NO_ACTION:Lru/mail/libverify/requests/n;

    if-eq v1, v2, :cond_3

    const-string/jumbo v1, "action_type"

    iget-object v2, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v2, v2, Lru/mail/libverify/requests/UpdateSettingsData;->action:Lru/mail/libverify/requests/n;

    invoke-virtual {v2}, Lru/mail/libverify/requests/n;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_3
    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v1, v1, Lru/mail/libverify/requests/UpdateSettingsData;->checkParams:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string/jumbo v1, "checkparams"

    iget-object v2, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v2, v2, Lru/mail/libverify/requests/UpdateSettingsData;->checkParams:Ljava/lang/String;

    invoke-static {v2}, Lru/mail/libverify/utils/m;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_4
    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v1, v1, Lru/mail/libverify/requests/UpdateSettingsData;->smsParams:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string/jumbo v1, "smsparams"

    iget-object v2, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v2, v2, Lru/mail/libverify/requests/UpdateSettingsData;->smsParams:Ljava/lang/String;

    invoke-static {v2}, Lru/mail/libverify/utils/m;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_5
    const-string/jumbo v1, "language"

    iget-object v2, p0, Lru/mail/libverify/requests/o;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->t()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v1, v1, Lru/mail/libverify/requests/UpdateSettingsData;->policy:Lru/mail/libverify/requests/g;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v1, v1, Lru/mail/libverify/requests/UpdateSettingsData;->policy:Lru/mail/libverify/requests/g;

    sget-object v2, Lru/mail/libverify/requests/g;->NOTHING:Lru/mail/libverify/requests/g;

    if-eq v1, v2, :cond_6

    const-string/jumbo v1, "drop"

    iget-object v2, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v2, v2, Lru/mail/libverify/requests/UpdateSettingsData;->policy:Lru/mail/libverify/requests/g;

    invoke-virtual {v2}, Lru/mail/libverify/requests/g;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_6
    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v1, v1, Lru/mail/libverify/requests/UpdateSettingsData;->appCheckParams:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string/jumbo v1, "jws"

    iget-object v2, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v2, v2, Lru/mail/libverify/requests/UpdateSettingsData;->appCheckParams:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_7
    return-object v0
.end method

.method protected final synthetic a(Ljava/lang/String;)Lru/mail/libverify/requests/response/ClientApiResponseBase;
    .locals 4

    const-class v0, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;

    invoke-static {p1, v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v1, v1, Lru/mail/libverify/requests/UpdateSettingsData;->action:Lru/mail/libverify/requests/n;

    sget-object v2, Lru/mail/libverify/requests/n;->REQUEST_SMS_INFO:Lru/mail/libverify/requests/n;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->setHasSmsInfo(Z)V

    :cond_0
    invoke-virtual {v0}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getSmsInfo()Lru/mail/libverify/requests/response/SmsInfo;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getSmsInfo()Lru/mail/libverify/requests/response/SmsInfo;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lru/mail/libverify/requests/response/SmsInfo;->setTimestamp(J)V

    :cond_1
    invoke-virtual {v0}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lru/mail/libverify/requests/response/FetcherInfo;->setTimestamp(J)V

    :cond_2
    return-object v0
.end method

.method protected final b()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final c()Lru/mail/libverify/requests/m;
    .locals 2

    new-instance v0, Lru/mail/libverify/requests/m;

    iget-object v1, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    invoke-static {v1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/m;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method protected final f()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v0, v0, Lru/mail/libverify/requests/UpdateSettingsData;->action:Lru/mail/libverify/requests/n;

    sget-object v1, Lru/mail/libverify/requests/n;->CHECK_INTERCEPTED:Lru/mail/libverify/requests/n;

    if-ne v0, v1, :cond_0

    const-string/jumbo v0, "libverifyverificationcheck"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "libverifysettings"

    goto :goto_0
.end method

.method protected final g()Lru/mail/libverify/requests/l;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    return-object v0
.end method

.method protected final s()Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v0, v0, Lru/mail/libverify/requests/UpdateSettingsData;->appCheckParams:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final t()Z
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/requests/o;->c:Lru/mail/libverify/requests/UpdateSettingsData;

    iget-object v0, v0, Lru/mail/libverify/requests/UpdateSettingsData;->action:Lru/mail/libverify/requests/n;

    sget-object v1, Lru/mail/libverify/requests/n;->CHECK_INTERCEPTED:Lru/mail/libverify/requests/n;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
