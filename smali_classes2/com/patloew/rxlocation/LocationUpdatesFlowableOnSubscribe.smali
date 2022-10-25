.class Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;
.super Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;
.source "LocationUpdatesFlowableOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe",
        "<",
        "Landroid/location/Location;",
        ">;"
    }
.end annotation


# instance fields
.field locationListener:Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;

.field final locationRequest:Lcom/google/android/gms/location/LocationRequest;

.field final looper:Landroid/os/Looper;


# direct methods
.method protected constructor <init>(Lcom/patloew/rxlocation/RxLocation;Lcom/google/android/gms/location/LocationRequest;Landroid/os/Looper;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
    .param p3, "looper"    # Landroid/os/Looper;
    .param p4, "timeout"    # Ljava/lang/Long;
    .param p5, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 36
    invoke-direct {p0, p1, p4, p5}, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    .line 37
    iput-object p2, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;->locationRequest:Lcom/google/android/gms/location/LocationRequest;

    .line 38
    iput-object p3, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;->looper:Landroid/os/Looper;

    .line 39
    return-void
.end method


# virtual methods
.method protected onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lio/reactivex/FlowableEmitter;)V
    .locals 4
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lio/reactivex/FlowableEmitter",
            "<",
            "Landroid/location/Location;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p2, "emitter":Lio/reactivex/FlowableEmitter;, "Lio/reactivex/FlowableEmitter<Landroid/location/Location;>;"
    new-instance v0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;

    invoke-direct {v0, p2}, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;-><init>(Lio/reactivex/FlowableEmitter;)V

    iput-object v0, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;->locationListener:Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;

    .line 46
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    iget-object v1, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;->locationRequest:Lcom/google/android/gms/location/LocationRequest;

    iget-object v2, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;->locationListener:Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;

    iget-object v3, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;->looper:Landroid/os/Looper;

    .line 47
    invoke-interface {v0, p1, v1, v2, v3}, Lcom/google/android/gms/location/FusedLocationProviderApi;->requestLocationUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/LocationListener;Landroid/os/Looper;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    new-instance v1, Lcom/patloew/rxlocation/StatusErrorResultCallBack;

    invoke-direct {v1, p2}, Lcom/patloew/rxlocation/StatusErrorResultCallBack;-><init>(Lio/reactivex/FlowableEmitter;)V

    .line 46
    invoke-virtual {p0, v0, v1}, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;->setupLocationPendingResult(Lcom/google/android/gms/common/api/PendingResult;Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 50
    return-void
.end method

.method protected onUnsubscribed(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 2
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;

    .prologue
    .line 54
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    iget-object v1, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;->locationListener:Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;

    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/location/FusedLocationProviderApi;->removeLocationUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationListener;)Lcom/google/android/gms/common/api/PendingResult;

    .line 55
    iget-object v0, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;->locationListener:Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;

    invoke-virtual {v0}, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;->onUnsubscribed()V

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;->locationListener:Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;

    .line 57
    return-void
.end method
