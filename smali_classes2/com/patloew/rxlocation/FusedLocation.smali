.class public Lcom/patloew/rxlocation/FusedLocation;
.super Ljava/lang/Object;
.source "FusedLocation.java"


# instance fields
.field private final rxLocation:Lcom/patloew/rxlocation/RxLocation;


# direct methods
.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/patloew/rxlocation/FusedLocation;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    .line 40
    return-void
.end method

.method private flushInternal(Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "timeoutTime"    # Ljava/lang/Long;
    .param p2, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 54
    new-instance v0, Lcom/patloew/rxlocation/LocationFlushSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/FusedLocation;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    invoke-direct {v0, v1, p1, p2}, Lcom/patloew/rxlocation/LocationFlushSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method private removeUpdatesInternal(Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p2, "timeoutTime"    # Ljava/lang/Long;
    .param p3, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/PendingIntent;",
            "Ljava/lang/Long;",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 149
    new-instance v0, Lcom/patloew/rxlocation/LocationRemoveUpdatesSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/FusedLocation;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    invoke-direct {v0, v1, p1, p2, p3}, Lcom/patloew/rxlocation/LocationRemoveUpdatesSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method private requestUpdatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 6
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p3, "timeoutTime"    # Ljava/lang/Long;
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "Landroid/app/PendingIntent;",
            "Ljava/lang/Long;",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 134
    new-instance v0, Lcom/patloew/rxlocation/LocationRequestUpdatesSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/FusedLocation;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/LocationRequestUpdatesSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Lcom/google/android/gms/location/LocationRequest;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method private updatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;
    .locals 6
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
    .param p2, "looper"    # Landroid/os/Looper;
    .param p3, "timeoutTime"    # Ljava/lang/Long;
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "backpressureStrategy"    # Lio/reactivex/BackpressureStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "Landroid/os/Looper;",
            "Ljava/lang/Long;",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/BackpressureStrategy;",
            ")",
            "Lio/reactivex/Flowable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 117
    new-instance v0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/FusedLocation;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    invoke-static {v0, p5}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public flush()Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, v0, v0}, Lcom/patloew/rxlocation/FusedLocation;->flushInternal(Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public flush(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 1
    .param p1, "timeoutTime"    # J
    .param p3, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lcom/patloew/rxlocation/FusedLocation;->flushInternal(Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public isLocationAvailable()Lio/reactivex/Single;
    .locals 2
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    new-instance v0, Lcom/patloew/rxlocation/LocationAvailabilitySingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/FusedLocation;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    invoke-direct {v0, v1}, Lcom/patloew/rxlocation/LocationAvailabilitySingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public lastLocation()Lio/reactivex/Maybe;
    .locals 2
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Maybe",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Lcom/patloew/rxlocation/LocationLastMaybeOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/FusedLocation;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    invoke-direct {v0, v1}, Lcom/patloew/rxlocation/LocationLastMaybeOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;)V

    invoke-static {v0}, Lio/reactivex/Maybe;->create(Lio/reactivex/MaybeOnSubscribe;)Lio/reactivex/Maybe;

    move-result-object v0

    return-object v0
.end method

.method public removeUpdates(Landroid/app/PendingIntent;)Lio/reactivex/Single;
    .locals 1
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/PendingIntent;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 141
    invoke-direct {p0, p1, v0, v0}, Lcom/patloew/rxlocation/FusedLocation;->removeUpdatesInternal(Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public removeUpdates(Landroid/app/PendingIntent;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeoutTime"    # J
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/PendingIntent;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, p1, v0, p4}, Lcom/patloew/rxlocation/FusedLocation;->removeUpdatesInternal(Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public requestUpdates(Lcom/google/android/gms/location/LocationRequest;Landroid/app/PendingIntent;)Lio/reactivex/Single;
    .locals 1
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "Landroid/app/PendingIntent;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 125
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/patloew/rxlocation/FusedLocation;->requestUpdatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public requestUpdates(Lcom/google/android/gms/location/LocationRequest;Landroid/app/PendingIntent;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 1
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "timeoutTime"    # J
    .param p5, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "Landroid/app/PendingIntent;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, p5}, Lcom/patloew/rxlocation/FusedLocation;->requestUpdatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public updates(Lcom/google/android/gms/location/LocationRequest;JLjava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;
    .locals 6
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeoutTime"    # J
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "backpressureStrategy"    # Lio/reactivex/BackpressureStrategy;
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/BackpressureStrategy;",
            ")",
            "Lio/reactivex/Flowable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    const/4 v2, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object v0, p0

    move-object v1, p1

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/FusedLocation;->updatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method public updates(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;JLjava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;
    .locals 7
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "looper"    # Landroid/os/Looper;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "timeoutTime"    # J
    .param p5, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6, "backpressureStrategy"    # Lio/reactivex/BackpressureStrategy;
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "Landroid/os/Looper;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/BackpressureStrategy;",
            ")",
            "Lio/reactivex/Flowable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 113
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/FusedLocation;->updatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method public updates(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;
    .locals 6
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "looper"    # Landroid/os/Looper;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "backpressureStrategy"    # Lio/reactivex/BackpressureStrategy;
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "Landroid/os/Looper;",
            "Lio/reactivex/BackpressureStrategy;",
            ")",
            "Lio/reactivex/Flowable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 108
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, v3

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/FusedLocation;->updatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method public updates(Lcom/google/android/gms/location/LocationRequest;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;
    .locals 6
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "backpressureStrategy"    # Lio/reactivex/BackpressureStrategy;
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "Lio/reactivex/BackpressureStrategy;",
            ")",
            "Lio/reactivex/Flowable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 98
    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v4, v2

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/FusedLocation;->updatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method public updates(Lcom/google/android/gms/location/LocationRequest;)Lio/reactivex/Observable;
    .locals 6
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 78
    sget-object v5, Lio/reactivex/BackpressureStrategy;->MISSING:Lio/reactivex/BackpressureStrategy;

    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/FusedLocation;->updatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Flowable;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public updates(Lcom/google/android/gms/location/LocationRequest;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 6
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeoutTime"    # J
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    const/4 v2, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    sget-object v5, Lio/reactivex/BackpressureStrategy;->MISSING:Lio/reactivex/BackpressureStrategy;

    move-object v0, p0

    move-object v1, p1

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/FusedLocation;->updatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Flowable;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public updates(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;)Lio/reactivex/Observable;
    .locals 6
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "looper"    # Landroid/os/Looper;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "Landroid/os/Looper;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 88
    sget-object v5, Lio/reactivex/BackpressureStrategy;->MISSING:Lio/reactivex/BackpressureStrategy;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/FusedLocation;->updatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Flowable;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public updates(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 7
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "looper"    # Landroid/os/Looper;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "timeoutTime"    # J
    .param p5, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "Landroid/os/Looper;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 93
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    sget-object v5, Lio/reactivex/BackpressureStrategy;->MISSING:Lio/reactivex/BackpressureStrategy;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p5

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/FusedLocation;->updatesInternal(Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Flowable;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method
