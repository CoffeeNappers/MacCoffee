.class final Lru/mail/libverify/storage/p;
.super Ljava/lang/Object;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Ljava/util/List;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Landroid/location/LocationManager;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private d:I

.field private e:J

.field private f:Landroid/location/Location;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lru/mail/libverify/storage/p;->d:I

    iput-object p1, p0, Lru/mail/libverify/storage/p;->a:Landroid/content/Context;

    const-string/jumbo v0, "location"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p0, Lru/mail/libverify/storage/p;->c:Landroid/location/LocationManager;

    new-instance v0, Landroid/location/Criteria;

    invoke-direct {v0}, Landroid/location/Criteria;-><init>()V

    invoke-virtual {v0, v2}, Landroid/location/Criteria;->setCostAllowed(Z)V

    iget-object v1, p0, Lru/mail/libverify/storage/p;->c:Landroid/location/LocationManager;

    if-nez v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lru/mail/libverify/storage/p;->b:Ljava/util/List;

    return-void

    :cond_0
    iget-object v1, p0, Lru/mail/libverify/storage/p;->c:Landroid/location/LocationManager;

    invoke-virtual {v1, v0, v2}, Landroid/location/LocationManager;->getProviders(Landroid/location/Criteria;Z)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method private b()Landroid/location/Location;
    .locals 12

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v4, 0x0

    iget-object v0, p0, Lru/mail/libverify/storage/p;->c:Landroid/location/LocationManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/storage/p;->b:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/storage/p;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/storage/p;->a:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    move-object v3, v4

    :cond_1
    :goto_0
    return-object v3

    :cond_2
    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/p;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move-object v1, v4

    move-object v3, v4

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lru/mail/libverify/storage/p;->c:Landroid/location/LocationManager;

    invoke-virtual {v2, v0}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v2

    iget-object v5, p0, Lru/mail/libverify/storage/p;->c:Landroid/location/LocationManager;

    invoke-virtual {v5, v0}, Landroid/location/LocationManager;->getProvider(Ljava/lang/String;)Landroid/location/LocationProvider;

    move-result-object v5

    if-eqz v2, :cond_5

    if-eqz v5, :cond_5

    invoke-virtual {v5}, Landroid/location/LocationProvider;->getAccuracy()I

    move-result v9

    iget v5, p0, Lru/mail/libverify/storage/p;->d:I

    if-gt v5, v9, :cond_3

    move v5, v6

    :goto_2
    if-eqz v5, :cond_5

    iput v9, p0, Lru/mail/libverify/storage/p;->d:I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    iput-wide v10, p0, Lru/mail/libverify/storage/p;->e:J

    move-object v1, v2

    :goto_3
    move-object v3, v1

    move-object v1, v0

    goto :goto_1

    :cond_3
    move v5, v7

    goto :goto_2

    :cond_4
    const-string/jumbo v0, "LocationProvider"

    const-string/jumbo v2, "received new location %s using %s with accuracy %d"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    const/4 v6, 0x1

    aput-object v1, v5, v6

    const/4 v6, 0x2

    iget v8, p0, Lru/mail/libverify/storage/p;->d:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v6

    invoke-static {v0, v2, v5}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v1, :cond_1

    move-object v3, v4

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "LocationProvider"

    const-string/jumbo v2, "failed to updated current location"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v1, v0, v2, v3}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    move-object v3, v4

    goto :goto_0

    :cond_5
    move-object v0, v1

    move-object v1, v3

    goto :goto_3
.end method


# virtual methods
.method public final declared-synchronized a()Landroid/location/Location;
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/storage/p;->f:Landroid/location/Location;

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lru/mail/libverify/storage/p;->e:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    const-wide/32 v2, 0x927c0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    const-string/jumbo v0, "LocationProvider"

    const-string/jumbo v1, "use already existing location %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/storage/p;->f:Landroid/location/Location;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/storage/p;->f:Landroid/location/Location;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lru/mail/libverify/storage/p;->b()Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/storage/p;->f:Landroid/location/Location;

    iget-object v0, p0, Lru/mail/libverify/storage/p;->f:Landroid/location/Location;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
