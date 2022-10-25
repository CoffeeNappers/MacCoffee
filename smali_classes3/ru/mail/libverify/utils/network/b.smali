.class final Lru/mail/libverify/utils/network/b;
.super Ljava/lang/Object;


# static fields
.field private static final c:Lru/mail/libverify/utils/network/b;

.field private static final d:Lru/mail/libverify/utils/network/b;

.field private static final e:Lru/mail/libverify/utils/network/b;

.field private static final f:Lru/mail/libverify/utils/network/b;

.field private static final g:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Lru/mail/libverify/utils/network/b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final a:Lru/mail/libverify/utils/network/a;

.field final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lru/mail/libverify/utils/network/b;

    sget-object v1, Lru/mail/libverify/utils/network/a;->NONE:Lru/mail/libverify/utils/network/a;

    invoke-direct {v0, v1}, Lru/mail/libverify/utils/network/b;-><init>(Lru/mail/libverify/utils/network/a;)V

    sput-object v0, Lru/mail/libverify/utils/network/b;->c:Lru/mail/libverify/utils/network/b;

    new-instance v0, Lru/mail/libverify/utils/network/b;

    sget-object v1, Lru/mail/libverify/utils/network/a;->CELLULAR:Lru/mail/libverify/utils/network/a;

    invoke-direct {v0, v1}, Lru/mail/libverify/utils/network/b;-><init>(Lru/mail/libverify/utils/network/a;)V

    sput-object v0, Lru/mail/libverify/utils/network/b;->d:Lru/mail/libverify/utils/network/b;

    new-instance v0, Lru/mail/libverify/utils/network/b;

    sget-object v1, Lru/mail/libverify/utils/network/a;->ROAMING:Lru/mail/libverify/utils/network/a;

    invoke-direct {v0, v1}, Lru/mail/libverify/utils/network/b;-><init>(Lru/mail/libverify/utils/network/a;)V

    sput-object v0, Lru/mail/libverify/utils/network/b;->e:Lru/mail/libverify/utils/network/b;

    new-instance v0, Lru/mail/libverify/utils/network/b;

    sget-object v1, Lru/mail/libverify/utils/network/a;->CONNECTING:Lru/mail/libverify/utils/network/a;

    invoke-direct {v0, v1}, Lru/mail/libverify/utils/network/b;-><init>(Lru/mail/libverify/utils/network/a;)V

    sput-object v0, Lru/mail/libverify/utils/network/b;->f:Lru/mail/libverify/utils/network/b;

    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    sput-object v0, Lru/mail/libverify/utils/network/b;->g:Landroid/util/LruCache;

    return-void
.end method

.method private constructor <init>(Lru/mail/libverify/utils/network/a;)V
    .locals 1
    .param p1    # Lru/mail/libverify/utils/network/a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/utils/network/b;->a:Lru/mail/libverify/utils/network/a;

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/utils/network/b;->b:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lru/mail/libverify/utils/network/a;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lru/mail/libverify/utils/network/a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/utils/network/b;->a:Lru/mail/libverify/utils/network/a;

    iput-object p2, p0, Lru/mail/libverify/utils/network/b;->b:Ljava/lang/String;

    return-void
.end method

.method static a(Landroid/content/Context;Lru/mail/libverify/utils/network/a;)Lru/mail/libverify/utils/network/b;
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lru/mail/libverify/utils/network/b$1;->a:[I

    invoke-virtual {p1}, Lru/mail/libverify/utils/network/a;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const-string/jumbo v0, "DebugUtils"

    const-string/jumbo v1, "failed to get connection type"

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "unknown connection type"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    sget-object v0, Lru/mail/libverify/utils/network/b;->c:Lru/mail/libverify/utils/network/b;

    :goto_0
    return-object v0

    :pswitch_0
    sget-object v0, Lru/mail/libverify/utils/network/b;->c:Lru/mail/libverify/utils/network/b;

    goto :goto_0

    :pswitch_1
    sget-object v0, Lru/mail/libverify/utils/network/a;->WIFI:Lru/mail/libverify/utils/network/a;

    invoke-static {p0, v0}, Lru/mail/libverify/utils/network/b;->b(Landroid/content/Context;Lru/mail/libverify/utils/network/a;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lru/mail/libverify/utils/network/b;->g:Landroid/util/LruCache;

    monitor-enter v2

    :try_start_0
    sget-object v0, Lru/mail/libverify/utils/network/b;->g:Landroid/util/LruCache;

    invoke-virtual {v0, v1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/utils/network/b;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/utils/network/b;

    sget-object v3, Lru/mail/libverify/utils/network/a;->WIFI:Lru/mail/libverify/utils/network/a;

    invoke-direct {v0, v3, v1}, Lru/mail/libverify/utils/network/b;-><init>(Lru/mail/libverify/utils/network/a;Ljava/lang/String;)V

    sget-object v3, Lru/mail/libverify/utils/network/b;->g:Landroid/util/LruCache;

    invoke-virtual {v3, v1, v0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :pswitch_2
    sget-object v0, Lru/mail/libverify/utils/network/b;->d:Lru/mail/libverify/utils/network/b;

    goto :goto_0

    :pswitch_3
    sget-object v0, Lru/mail/libverify/utils/network/b;->e:Lru/mail/libverify/utils/network/b;

    goto :goto_0

    :pswitch_4
    sget-object v0, Lru/mail/libverify/utils/network/b;->f:Lru/mail/libverify/utils/network/b;

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private static b(Landroid/content/Context;Lru/mail/libverify/utils/network/a;)Ljava/lang/String;
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lru/mail/libverify/utils/network/b$1;->a:[I

    invoke-virtual {p1}, Lru/mail/libverify/utils/network/a;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const-string/jumbo v0, "DebugUtils"

    const-string/jumbo v1, "failed to get connection name"

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "unknown connection type"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string/jumbo v0, "No network"

    :cond_0
    :goto_0
    return-object v0

    :pswitch_0
    const-string/jumbo v0, "No network"

    goto :goto_0

    :pswitch_1
    const-string/jumbo v0, "android.permission.ACCESS_WIFI_STATE"

    invoke-static {p0, v0}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    :try_start_0
    const-string/jumbo v0, "wifi"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    if-nez v0, :cond_1

    const-string/jumbo v0, "Unknown Wi-Fi network"

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v0, "Unknown Wi-Fi network"
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_2
    const-string/jumbo v0, "Unknown Wi-Fi network"

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v0, "Unknown Wi-Fi network"

    goto :goto_0

    :cond_3
    const-string/jumbo v0, "Unknown Wi-Fi network"

    goto :goto_0

    :pswitch_2
    const-string/jumbo v0, "Cellular network"

    goto :goto_0

    :pswitch_3
    const-string/jumbo v0, "In roaming"

    goto :goto_0

    :pswitch_4
    const-string/jumbo v0, "Connecting"

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "NetworkStateDescriptor{state="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/utils/network/b;->a:Lru/mail/libverify/utils/network/a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", name=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/utils/network/b;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
