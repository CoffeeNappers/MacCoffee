.class Lru/mail/libverify/requests/UpdateSettingsData;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/requests/l;
.implements Lru/mail/libverify/utils/Gsonable;


# instance fields
.field public final action:Lru/mail/libverify/requests/n;

.field public final appCheckParams:Ljava/lang/String;

.field public final blockTimeoutSec:I

.field public final checkParams:Ljava/lang/String;

.field public final from:Ljava/lang/String;

.field public final policy:Lru/mail/libverify/requests/g;

.field public final smsParams:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->action:Lru/mail/libverify/requests/n;

    iput-object v1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->policy:Lru/mail/libverify/requests/g;

    iput-object v1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->from:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lru/mail/libverify/requests/UpdateSettingsData;->blockTimeoutSec:I

    iput-object v1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->checkParams:Ljava/lang/String;

    iput-object v1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->smsParams:Ljava/lang/String;

    iput-object v1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->appCheckParams:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;)V
    .locals 2
    .param p1    # Lru/mail/libverify/requests/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/requests/g;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->action:Lru/mail/libverify/requests/n;

    iput-object p2, p0, Lru/mail/libverify/requests/UpdateSettingsData;->policy:Lru/mail/libverify/requests/g;

    iput-object v1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->from:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lru/mail/libverify/requests/UpdateSettingsData;->blockTimeoutSec:I

    iput-object v1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->checkParams:Ljava/lang/String;

    iput-object v1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->smsParams:Ljava/lang/String;

    iput-object v1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->appCheckParams:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lru/mail/libverify/requests/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/requests/g;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/requests/UpdateSettingsData;->action:Lru/mail/libverify/requests/n;

    iput-object p2, p0, Lru/mail/libverify/requests/UpdateSettingsData;->policy:Lru/mail/libverify/requests/g;

    iput-object p3, p0, Lru/mail/libverify/requests/UpdateSettingsData;->from:Ljava/lang/String;

    iput p4, p0, Lru/mail/libverify/requests/UpdateSettingsData;->blockTimeoutSec:I

    iput-object p5, p0, Lru/mail/libverify/requests/UpdateSettingsData;->checkParams:Ljava/lang/String;

    iput-object p6, p0, Lru/mail/libverify/requests/UpdateSettingsData;->smsParams:Ljava/lang/String;

    iput-object p7, p0, Lru/mail/libverify/requests/UpdateSettingsData;->appCheckParams:Ljava/lang/String;

    return-void
.end method

.method static a(Ljava/lang/String;)Lru/mail/libverify/requests/UpdateSettingsData;
    .locals 8
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v3, 0x0

    new-instance v0, Lru/mail/libverify/requests/UpdateSettingsData;

    sget-object v1, Lru/mail/libverify/requests/n;->CHECK:Lru/mail/libverify/requests/n;

    sget-object v2, Lru/mail/libverify/requests/g;->NOTHING:Lru/mail/libverify/requests/g;

    const/4 v4, 0x0

    move-object v5, p0

    move-object v6, v3

    move-object v7, v3

    invoke-direct/range {v0 .. v7}, Lru/mail/libverify/requests/UpdateSettingsData;-><init>(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method static a(Ljava/lang/String;I)Lru/mail/libverify/requests/UpdateSettingsData;
    .locals 8
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v5, 0x0

    new-instance v0, Lru/mail/libverify/requests/UpdateSettingsData;

    sget-object v1, Lru/mail/libverify/requests/n;->BLOCK:Lru/mail/libverify/requests/n;

    sget-object v2, Lru/mail/libverify/requests/g;->NOTHING:Lru/mail/libverify/requests/g;

    move-object v3, p0

    move v4, p1

    move-object v6, v5

    move-object v7, v5

    invoke-direct/range {v0 .. v7}, Lru/mail/libverify/requests/UpdateSettingsData;-><init>(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method static a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/requests/UpdateSettingsData;
    .locals 8
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v3, 0x0

    new-instance v0, Lru/mail/libverify/requests/UpdateSettingsData;

    sget-object v1, Lru/mail/libverify/requests/n;->CHECK:Lru/mail/libverify/requests/n;

    sget-object v2, Lru/mail/libverify/requests/g;->NOTHING:Lru/mail/libverify/requests/g;

    const/4 v4, 0x0

    move-object v5, p0

    move-object v6, p1

    move-object v7, v3

    invoke-direct/range {v0 .. v7}, Lru/mail/libverify/requests/UpdateSettingsData;-><init>(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method static a(Lru/mail/libverify/requests/n;)Lru/mail/libverify/requests/UpdateSettingsData;
    .locals 2
    .param p0    # Lru/mail/libverify/requests/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/UpdateSettingsData;

    sget-object v1, Lru/mail/libverify/requests/g;->NOTHING:Lru/mail/libverify/requests/g;

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/requests/UpdateSettingsData;-><init>(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;)V

    return-object v0
.end method

.method static a(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;)Lru/mail/libverify/requests/UpdateSettingsData;
    .locals 1
    .param p0    # Lru/mail/libverify/requests/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lru/mail/libverify/requests/g;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/requests/UpdateSettingsData;

    invoke-direct {v0, p0, p1}, Lru/mail/libverify/requests/UpdateSettingsData;-><init>(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;)V

    return-object v0
.end method

.method static b()Lru/mail/libverify/requests/UpdateSettingsData;
    .locals 3

    new-instance v0, Lru/mail/libverify/requests/UpdateSettingsData;

    sget-object v1, Lru/mail/libverify/requests/n;->NO_ACTION:Lru/mail/libverify/requests/n;

    sget-object v2, Lru/mail/libverify/requests/g;->NOTHING:Lru/mail/libverify/requests/g;

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/UpdateSettingsData;-><init>(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;)V

    return-object v0
.end method

.method static b(Ljava/lang/String;)Lru/mail/libverify/requests/UpdateSettingsData;
    .locals 8
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v3, 0x0

    new-instance v0, Lru/mail/libverify/requests/UpdateSettingsData;

    sget-object v1, Lru/mail/libverify/requests/n;->CHECK_INTERCEPTED:Lru/mail/libverify/requests/n;

    sget-object v2, Lru/mail/libverify/requests/g;->NOTHING:Lru/mail/libverify/requests/g;

    const/4 v4, 0x0

    move-object v5, v3

    move-object v6, p0

    move-object v7, v3

    invoke-direct/range {v0 .. v7}, Lru/mail/libverify/requests/UpdateSettingsData;-><init>(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method static c(Ljava/lang/String;)Lru/mail/libverify/requests/UpdateSettingsData;
    .locals 8
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v3, 0x0

    new-instance v0, Lru/mail/libverify/requests/UpdateSettingsData;

    sget-object v1, Lru/mail/libverify/requests/n;->CONFIRM_APP_CHECK:Lru/mail/libverify/requests/n;

    sget-object v2, Lru/mail/libverify/requests/g;->NOTHING:Lru/mail/libverify/requests/g;

    const/4 v4, 0x0

    move-object v5, v3

    move-object v6, v3

    move-object v7, p0

    invoke-direct/range {v0 .. v7}, Lru/mail/libverify/requests/UpdateSettingsData;-><init>(Lru/mail/libverify/requests/n;Lru/mail/libverify/requests/g;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 5

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v2, "%s_%s_%d_%s_%s_%s_%s"

    const/4 v0, 0x7

    new-array v3, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    iget-object v4, p0, Lru/mail/libverify/requests/UpdateSettingsData;->action:Lru/mail/libverify/requests/n;

    aput-object v4, v3, v0

    const/4 v0, 0x1

    iget-object v4, p0, Lru/mail/libverify/requests/UpdateSettingsData;->from:Ljava/lang/String;

    aput-object v4, v3, v0

    const/4 v0, 0x2

    iget v4, p0, Lru/mail/libverify/requests/UpdateSettingsData;->blockTimeoutSec:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    const/4 v0, 0x3

    iget-object v4, p0, Lru/mail/libverify/requests/UpdateSettingsData;->checkParams:Ljava/lang/String;

    aput-object v4, v3, v0

    const/4 v0, 0x4

    iget-object v4, p0, Lru/mail/libverify/requests/UpdateSettingsData;->smsParams:Ljava/lang/String;

    aput-object v4, v3, v0

    const/4 v0, 0x5

    iget-object v4, p0, Lru/mail/libverify/requests/UpdateSettingsData;->policy:Lru/mail/libverify/requests/g;

    aput-object v4, v3, v0

    const/4 v4, 0x6

    iget-object v0, p0, Lru/mail/libverify/requests/UpdateSettingsData;->appCheckParams:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/requests/UpdateSettingsData;->appCheckParams:Ljava/lang/String;

    invoke-static {v0}, Lru/mail/libverify/utils/m;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
