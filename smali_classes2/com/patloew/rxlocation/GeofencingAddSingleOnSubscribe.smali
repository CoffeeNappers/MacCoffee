.class Lcom/patloew/rxlocation/GeofencingAddSingleOnSubscribe;
.super Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
.source "GeofencingAddSingleOnSubscribe.java"


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
.field final geofencingRequest:Lcom/google/android/gms/location/GeofencingRequest;

.field final pendingIntent:Landroid/app/PendingIntent;


# direct methods
.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;
    .param p2, "geofencingRequest"    # Lcom/google/android/gms/location/GeofencingRequest;
    .param p3, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p4, "timeoutTime"    # Ljava/lang/Long;
    .param p5, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 33
    invoke-direct {p0, p1, p4, p5}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    .line 34
    iput-object p2, p0, Lcom/patloew/rxlocation/GeofencingAddSingleOnSubscribe;->geofencingRequest:Lcom/google/android/gms/location/GeofencingRequest;

    .line 35
    iput-object p3, p0, Lcom/patloew/rxlocation/GeofencingAddSingleOnSubscribe;->pendingIntent:Landroid/app/PendingIntent;

    .line 36
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
    .line 41
    .local p2, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Lcom/google/android/gms/common/api/Status;>;"
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->GeofencingApi:Lcom/google/android/gms/location/GeofencingApi;

    iget-object v1, p0, Lcom/patloew/rxlocation/GeofencingAddSingleOnSubscribe;->geofencingRequest:Lcom/google/android/gms/location/GeofencingRequest;

    iget-object v2, p0, Lcom/patloew/rxlocation/GeofencingAddSingleOnSubscribe;->pendingIntent:Landroid/app/PendingIntent;

    .line 42
    invoke-interface {v0, p1, v1, v2}, Lcom/google/android/gms/location/GeofencingApi;->addGeofences(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    .line 43
    invoke-static {p2}, Lcom/patloew/rxlocation/SingleResultCallBack;->get(Lio/reactivex/SingleEmitter;)Lcom/google/android/gms/common/api/ResultCallback;

    move-result-object v1

    .line 41
    invoke-virtual {p0, v0, v1}, Lcom/patloew/rxlocation/GeofencingAddSingleOnSubscribe;->setupLocationPendingResult(Lcom/google/android/gms/common/api/PendingResult;Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 45
    return-void
.end method
