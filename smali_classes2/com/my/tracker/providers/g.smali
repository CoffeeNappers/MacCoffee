.class public final Lcom/my/tracker/providers/g;
.super Lcom/my/tracker/providers/a;
.source "LocationDataProvider.java"


# instance fields
.field private a:Landroid/location/Location;

.field private b:Ljava/lang/String;

.field private c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/my/tracker/providers/a;-><init>()V

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/tracker/providers/g;->c:Z

    .line 44
    return-void
.end method


# virtual methods
.method public final a(Lcom/my/tracker/builders/a;)V
    .locals 2

    .prologue
    .line 112
    iget-object v0, p0, Lcom/my/tracker/providers/g;->a:Landroid/location/Location;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/providers/g;->a:Landroid/location/Location;

    iget-object v1, p0, Lcom/my/tracker/providers/g;->b:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/my/tracker/builders/a;->a(Landroid/location/Location;Ljava/lang/String;)V

    .line 113
    :cond_0
    return-void
.end method

.method public final a(Z)V
    .locals 0

    .prologue
    .line 117
    iput-boolean p1, p0, Lcom/my/tracker/providers/g;->c:Z

    .line 118
    return-void
.end method

.method public final b(Landroid/content/Context;)V
    .locals 13

    .prologue
    const/4 v2, 0x0

    .line 52
    const-string/jumbo v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, p1}, Lcom/my/tracker/utils/d;->a(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "android.permission.ACCESS_COARSE_LOCATION"

    .line 53
    invoke-static {v0, p1}, Lcom/my/tracker/utils/d;->a(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 108
    :cond_0
    :goto_0
    return-void

    .line 59
    :cond_1
    invoke-static {}, Lcom/my/tracker/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_2

    .line 63
    const-string/jumbo v0, "LocationDataProvider: You must not call collectData method from main thread"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 67
    :cond_2
    iput-object v2, p0, Lcom/my/tracker/providers/g;->a:Landroid/location/Location;

    .line 68
    iput-object v2, p0, Lcom/my/tracker/providers/g;->b:Ljava/lang/String;

    .line 70
    iget-boolean v0, p0, Lcom/my/tracker/providers/g;->c:Z

    if-eqz v0, :cond_0

    .line 72
    const v5, 0x7f7fffff    # Float.MAX_VALUE

    .line 73
    const-wide/16 v6, 0x0

    .line 76
    const-string/jumbo v0, "location"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    .line 77
    invoke-virtual {v0}, Landroid/location/LocationManager;->getAllProviders()Ljava/util/List;

    move-result-object v1

    .line 78
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    move-object v3, v2

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 82
    :try_start_0
    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v4

    .line 83
    if-eqz v4, :cond_5

    .line 85
    invoke-virtual {v4}, Landroid/location/Location;->getAccuracy()F

    move-result v10

    .line 86
    invoke-virtual {v4}, Landroid/location/Location;->getTime()J
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v8

    .line 88
    if-eqz v3, :cond_3

    cmp-long v12, v8, v6

    if-lez v12, :cond_5

    cmpg-float v12, v10, v5

    if-gez v12, :cond_5

    :cond_3
    move-object v2, v4

    move v3, v10

    move-wide v4, v8

    :goto_2
    move-wide v6, v4

    move v5, v3

    move-object v3, v2

    move-object v2, v1

    .line 101
    goto :goto_1

    .line 98
    :catch_0
    move-exception v1

    const-string/jumbo v1, "Permission android.permission.ACCESS_COARSE_LOCATION or android.permission.ACCESS_FINE_LOCATION check was positive, but still got security exception on the location provider"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_1

    .line 103
    :cond_4
    if-eqz v3, :cond_0

    .line 105
    iput-object v3, p0, Lcom/my/tracker/providers/g;->a:Landroid/location/Location;

    .line 106
    iput-object v2, p0, Lcom/my/tracker/providers/g;->b:Ljava/lang/String;

    goto :goto_0

    :cond_5
    move-object v1, v2

    move-object v2, v3

    move v3, v5

    move-wide v4, v6

    goto :goto_2
.end method
