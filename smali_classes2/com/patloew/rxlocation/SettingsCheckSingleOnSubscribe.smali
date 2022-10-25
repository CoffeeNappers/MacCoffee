.class Lcom/patloew/rxlocation/SettingsCheckSingleOnSubscribe;
.super Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
.source "SettingsCheckSingleOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe",
        "<",
        "Lcom/google/android/gms/location/LocationSettingsResult;",
        ">;"
    }
.end annotation


# instance fields
.field final locationSettingsRequest:Lcom/google/android/gms/location/LocationSettingsRequest;


# direct methods
.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;
    .param p2, "locationSettingsRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
    .param p3, "timeoutTime"    # Ljava/lang/Long;
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 30
    invoke-direct {p0, p1, p3, p4}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    .line 31
    iput-object p2, p0, Lcom/patloew/rxlocation/SettingsCheckSingleOnSubscribe;->locationSettingsRequest:Lcom/google/android/gms/location/LocationSettingsRequest;

    .line 32
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
            "Lcom/google/android/gms/location/LocationSettingsResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p2, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Lcom/google/android/gms/location/LocationSettingsResult;>;"
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->SettingsApi:Lcom/google/android/gms/location/SettingsApi;

    iget-object v1, p0, Lcom/patloew/rxlocation/SettingsCheckSingleOnSubscribe;->locationSettingsRequest:Lcom/google/android/gms/location/LocationSettingsRequest;

    .line 37
    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/location/SettingsApi;->checkLocationSettings(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationSettingsRequest;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    .line 38
    invoke-static {p2}, Lcom/patloew/rxlocation/SingleResultCallBack;->get(Lio/reactivex/SingleEmitter;)Lcom/google/android/gms/common/api/ResultCallback;

    move-result-object v1

    .line 36
    invoke-virtual {p0, v0, v1}, Lcom/patloew/rxlocation/SettingsCheckSingleOnSubscribe;->setupLocationPendingResult(Lcom/google/android/gms/common/api/PendingResult;Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 40
    return-void
.end method
