.class Lcom/patloew/rxlocation/LocationRequestUpdatesSingleOnSubscribe;
.super Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
.source "LocationRequestUpdatesSingleOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe",
        "<",
        "Lcom/google/android/gms/common/api/Status;",
        ">;"
    }
.end annotation


# instance fields
.field final locationRequest:Lcom/google/android/gms/location/LocationRequest;

.field final pendingIntent:Landroid/app/PendingIntent;


# direct methods
.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;Lcom/google/android/gms/location/LocationRequest;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
    .param p3, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p4, "timeout"    # Ljava/lang/Long;
    .param p5, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 34
    invoke-direct {p0, p1, p4, p5}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    .line 35
    iput-object p2, p0, Lcom/patloew/rxlocation/LocationRequestUpdatesSingleOnSubscribe;->locationRequest:Lcom/google/android/gms/location/LocationRequest;

    .line 36
    iput-object p3, p0, Lcom/patloew/rxlocation/LocationRequestUpdatesSingleOnSubscribe;->pendingIntent:Landroid/app/PendingIntent;

    .line 37
    return-void
.end method


# virtual methods
.method protected onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lio/reactivex/SingleEmitter;)V
    .locals 3
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lio/reactivex/SingleEmitter",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p2, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Lcom/google/android/gms/common/api/Status;>;"
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    iget-object v1, p0, Lcom/patloew/rxlocation/LocationRequestUpdatesSingleOnSubscribe;->locationRequest:Lcom/google/android/gms/location/LocationRequest;

    iget-object v2, p0, Lcom/patloew/rxlocation/LocationRequestUpdatesSingleOnSubscribe;->pendingIntent:Landroid/app/PendingIntent;

    .line 43
    invoke-interface {v0, p1, v1, v2}, Lcom/google/android/gms/location/FusedLocationProviderApi;->requestLocationUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationRequest;Landroid/app/PendingIntent;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    .line 44
    invoke-static {p2}, Lcom/patloew/rxlocation/SingleResultCallBack;->get(Lio/reactivex/SingleEmitter;)Lcom/google/android/gms/common/api/ResultCallback;

    move-result-object v1

    .line 42
    invoke-virtual {p0, v0, v1}, Lcom/patloew/rxlocation/LocationRequestUpdatesSingleOnSubscribe;->setupLocationPendingResult(Lcom/google/android/gms/common/api/PendingResult;Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 46
    return-void
.end method
