.class public Lcom/vk/attachpicker/util/LocationUtils;
.super Ljava/lang/Object;
.source "LocationUtils.java"


# static fields
.field public static final NO_LOCATION:Landroid/location/Location;

.field public static final NO_LOCATION_PROVIDER_NAME:Ljava/lang/String; = "NO_LOCATION"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 22
    new-instance v0, Landroid/location/Location;

    const-string/jumbo v1, "NO_LOCATION"

    invoke-direct {v0, v1}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vk/attachpicker/util/LocationUtils;->NO_LOCATION:Landroid/location/Location;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLastKnownLocation()Landroid/location/Location;
    .locals 2

    .prologue
    .line 54
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils;->isLocationEnabled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 55
    const/4 v0, 0x0

    .line 56
    .local v0, "result":Landroid/location/Location;
    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v1

    if-nez v1, :cond_0

    .line 57
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils;->getLastKnownLocation_GooglePlayServices()Landroid/location/Location;

    move-result-object v0

    .line 59
    :cond_0
    if-nez v0, :cond_1

    .line 60
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils;->getLastKnownLocation_LocationManager()Landroid/location/Location;

    move-result-object v0

    .line 64
    :cond_1
    :goto_0
    return-object v0

    .end local v0    # "result":Landroid/location/Location;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getLastKnownLocationRx()Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils$$Lambda$1;->lambdaFactory$()Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Observable;->fromCallable(Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Lcom/vk/attachpicker/util/LocationUtils;->NO_LOCATION:Landroid/location/Location;

    .line 48
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->onErrorReturnItem(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    .line 49
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 50
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method private static getLastKnownLocation_GooglePlayServices()Landroid/location/Location;
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 84
    new-instance v4, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    sget-object v5, Lcom/google/android/gms/location/LocationServices;->API:Lcom/google/android/gms/common/api/Api;

    .line 85
    invoke-virtual {v4, v5}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addApi(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v4

    .line 86
    invoke-virtual {v4}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->build()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v1

    .line 87
    .local v1, "googleApiClient":Lcom/google/android/gms/common/api/GoogleApiClient;
    invoke-virtual {v1}, Lcom/google/android/gms/common/api/GoogleApiClient;->blockingConnect()Lcom/google/android/gms/common/ConnectionResult;

    move-result-object v2

    .line 88
    .local v2, "result":Lcom/google/android/gms/common/ConnectionResult;
    invoke-virtual {v2}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 90
    :try_start_0
    sget-object v4, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    invoke-interface {v4, v1}, Lcom/google/android/gms/location/FusedLocationProviderApi;->getLastLocation(Lcom/google/android/gms/common/api/GoogleApiClient;)Landroid/location/Location;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 96
    invoke-virtual {v1}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    .line 99
    :cond_0
    :goto_0
    return-object v3

    .line 91
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/SecurityException;
    invoke-virtual {v1}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    goto :goto_0

    .line 93
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    throw v3
.end method

.method private static getLastKnownLocation_LocationManager()Landroid/location/Location;
    .locals 4

    .prologue
    .line 69
    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string/jumbo v3, "location"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    .line 70
    .local v1, "locationManager":Landroid/location/LocationManager;
    if-eqz v1, :cond_0

    .line 71
    const/4 v0, 0x0

    .line 73
    .local v0, "lastLocation":Landroid/location/Location;
    :try_start_0
    const-string/jumbo v2, "network"

    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 79
    .end local v0    # "lastLocation":Landroid/location/Location;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 74
    .restart local v0    # "lastLocation":Landroid/location/Location;
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static isLocationEnabled()Z
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 25
    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 27
    .local v0, "context":Landroid/content/Context;
    const/4 v1, 0x0

    .line 30
    .local v1, "locationMode":I
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x13

    if-lt v5, v6, :cond_2

    .line 32
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string/jumbo v6, "location_mode"

    invoke-static {v5, v6}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 36
    :goto_0
    if-eqz v1, :cond_1

    .line 39
    :cond_0
    :goto_1
    return v3

    :cond_1
    move v3, v4

    .line 36
    goto :goto_1

    .line 38
    :cond_2
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string/jumbo v6, "location_providers_allowed"

    invoke-static {v5, v6}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 39
    .local v2, "locationProviders":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string/jumbo v5, "0"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    :cond_3
    move v3, v4

    goto :goto_1

    .line 33
    .end local v2    # "locationProviders":Ljava/lang/String;
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method static synthetic lambda$getLastKnownLocationRx$0()Landroid/location/Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 47
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v0

    return-object v0
.end method
