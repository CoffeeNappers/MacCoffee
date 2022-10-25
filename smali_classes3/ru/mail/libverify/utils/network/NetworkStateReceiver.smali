.class public Lru/mail/libverify/utils/network/NetworkStateReceiver;
.super Landroid/content/BroadcastReceiver;


# static fields
.field private static final a:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lru/mail/libverify/utils/network/b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    sget-object v2, Lru/mail/libverify/utils/network/a;->NONE:Lru/mail/libverify/utils/network/a;

    invoke-static {v1, v2}, Lru/mail/libverify/utils/network/b;->a(Landroid/content/Context;Lru/mail/libverify/utils/network/a;)Lru/mail/libverify/utils/network/b;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lru/mail/libverify/utils/network/NetworkStateReceiver;->a:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private static a(Landroid/content/Context;Z)V
    .locals 8
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v7, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    const-string/jumbo v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-nez v0, :cond_1

    const-string/jumbo v0, "NetworkStateReceiver"

    const-string/jumbo v1, "no available network found (ConnectivityManager is null)"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lru/mail/libverify/utils/network/a;->NONE:Lru/mail/libverify/utils/network/a;

    invoke-static {p0, v0}, Lru/mail/libverify/utils/network/b;->a(Landroid/content/Context;Lru/mail/libverify/utils/network/a;)Lru/mail/libverify/utils/network/b;

    move-result-object v0

    :goto_0
    const-string/jumbo v1, "NetworkStateReceiver"

    const-string/jumbo v2, "check network %s (fire event %s)"

    new-array v3, v7, [Ljava/lang/Object;

    aput-object v0, v3, v6

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v1, Lru/mail/libverify/utils/network/NetworkStateReceiver;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_0

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_6

    :cond_0
    :goto_1
    return-void

    :cond_1
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    if-ne v1, v5, :cond_2

    sget-object v0, Lru/mail/libverify/utils/network/a;->WIFI:Lru/mail/libverify/utils/network/a;

    invoke-static {p0, v0}, Lru/mail/libverify/utils/network/b;->a(Landroid/content/Context;Lru/mail/libverify/utils/network/a;)Lru/mail/libverify/utils/network/b;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lru/mail/libverify/utils/network/a;->ROAMING:Lru/mail/libverify/utils/network/a;

    invoke-static {p0, v0}, Lru/mail/libverify/utils/network/b;->a(Landroid/content/Context;Lru/mail/libverify/utils/network/a;)Lru/mail/libverify/utils/network/b;

    move-result-object v0

    goto :goto_0

    :cond_3
    sget-object v0, Lru/mail/libverify/utils/network/a;->CELLULAR:Lru/mail/libverify/utils/network/a;

    invoke-static {p0, v0}, Lru/mail/libverify/utils/network/b;->a(Landroid/content/Context;Lru/mail/libverify/utils/network/a;)Lru/mail/libverify/utils/network/b;

    move-result-object v0

    goto :goto_0

    :cond_4
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v1

    if-eqz v1, :cond_5

    sget-object v0, Lru/mail/libverify/utils/network/a;->CONNECTING:Lru/mail/libverify/utils/network/a;

    invoke-static {p0, v0}, Lru/mail/libverify/utils/network/b;->a(Landroid/content/Context;Lru/mail/libverify/utils/network/a;)Lru/mail/libverify/utils/network/b;

    move-result-object v0

    goto :goto_0

    :cond_5
    const-string/jumbo v1, "NetworkStateReceiver"

    const-string/jumbo v2, "no available network found (%s)"

    new-array v3, v5, [Ljava/lang/Object;

    aput-object v0, v3, v6

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lru/mail/libverify/utils/network/a;->NONE:Lru/mail/libverify/utils/network/a;

    invoke-static {p0, v0}, Lru/mail/libverify/utils/network/b;->a(Landroid/content/Context;Lru/mail/libverify/utils/network/a;)Lru/mail/libverify/utils/network/b;

    move-result-object v0

    goto :goto_0

    :cond_6
    const-string/jumbo v1, "NetworkStateReceiver"

    const-string/jumbo v2, "state changed to %s on %s"

    new-array v3, v7, [Ljava/lang/Object;

    iget-object v4, v0, Lru/mail/libverify/utils/network/b;->a:Lru/mail/libverify/utils/network/a;

    aput-object v4, v3, v6

    iget-object v0, v0, Lru/mail/libverify/utils/network/b;->b:Ljava/lang/String;

    aput-object v0, v3, v5

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    :try_start_0
    invoke-static {p0}, Lru/mail/libverify/api/k;->h(Landroid/content/Context;)Lru/mail/libverify/api/n;

    move-result-object v0

    invoke-static {p0}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->a(Landroid/content/Context;)Z

    move-result v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/n;->a(Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v1, "NetworkStateReceiver"

    const-string/jumbo v2, "failed to process network state change"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static a()Z
    .locals 2

    sget-object v0, Lru/mail/libverify/utils/network/NetworkStateReceiver;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/utils/network/b;

    iget-object v0, v0, Lru/mail/libverify/utils/network/b;->a:Lru/mail/libverify/utils/network/a;

    sget-object v1, Lru/mail/libverify/utils/network/a;->NONE:Lru/mail/libverify/utils/network/a;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->a(Landroid/content/Context;Z)V

    invoke-static {}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->a()Z

    move-result v0

    return v0
.end method

.method public static b(Landroid/content/Context;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->a(Landroid/content/Context;Z)V

    return-void
.end method

.method public static c(Landroid/content/Context;)V
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    :try_start_0
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lru/mail/libverify/utils/network/NetworkStateReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    const-string/jumbo v0, "NetworkStateReceiver"

    const-string/jumbo v1, "enabled"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "NetworkStateReceiver"

    const-string/jumbo v2, "failed to enable"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static d(Landroid/content/Context;)V
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    :try_start_0
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lru/mail/libverify/utils/network/NetworkStateReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    const-string/jumbo v0, "NetworkStateReceiver"

    const-string/jumbo v1, "disabled"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "NetworkStateReceiver"

    const-string/jumbo v2, "failed to disable"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const-string/jumbo v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->a(Landroid/content/Context;Z)V

    goto :goto_0
.end method
