.class Lcom/patloew/rxlocation/LocationAvailabilitySingleOnSubscribe;
.super Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
.source "LocationAvailabilitySingleOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;)V
    .locals 1
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, v0, v0}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    .line 28
    return-void
.end method


# virtual methods
.method protected onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lio/reactivex/SingleEmitter;)V
    .locals 2
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lio/reactivex/SingleEmitter",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p2, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Ljava/lang/Boolean;>;"
    sget-object v1, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    invoke-interface {v1, p1}, Lcom/google/android/gms/location/FusedLocationProviderApi;->getLocationAvailability(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/location/LocationAvailability;

    move-result-object v0

    .line 35
    .local v0, "locationAvailability":Lcom/google/android/gms/location/LocationAvailability;
    if-eqz v0, :cond_0

    .line 36
    invoke-virtual {v0}, Lcom/google/android/gms/location/LocationAvailability;->isLocationAvailable()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p2, v1}, Lio/reactivex/SingleEmitter;->onSuccess(Ljava/lang/Object;)V

    .line 40
    :goto_0
    return-void

    .line 38
    :cond_0
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p2, v1}, Lio/reactivex/SingleEmitter;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0
.end method
