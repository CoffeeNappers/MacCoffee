.class Lcom/patloew/rxlocation/GeofencingRemoveSingleOnSubscribe;
.super Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
.source "GeofencingRemoveSingleOnSubscribe.java"


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
.field final geofenceRequestIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final pendingIntent:Landroid/app/PendingIntent;


# direct methods
.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;Ljava/util/List;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;
    .param p3, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p4, "timeoutTime"    # Ljava/lang/Long;
    .param p5, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/patloew/rxlocation/RxLocation;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/app/PendingIntent;",
            "Ljava/lang/Long;",
            "Ljava/util/concurrent/TimeUnit;",
            ")V"
        }
    .end annotation

    .prologue
    .line 34
    .local p2, "geofenceRequestIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0, p1, p4, p5}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    .line 35
    iput-object p2, p0, Lcom/patloew/rxlocation/GeofencingRemoveSingleOnSubscribe;->geofenceRequestIds:Ljava/util/List;

    .line 36
    iput-object p3, p0, Lcom/patloew/rxlocation/GeofencingRemoveSingleOnSubscribe;->pendingIntent:Landroid/app/PendingIntent;

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
    .line 41
    .local p2, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Lcom/google/android/gms/common/api/Status;>;"
    invoke-static {p2}, Lcom/patloew/rxlocation/SingleResultCallBack;->get(Lio/reactivex/SingleEmitter;)Lcom/google/android/gms/common/api/ResultCallback;

    move-result-object v0

    .line 43
    .local v0, "resultCallback":Lcom/google/android/gms/common/api/ResultCallback;, "Lcom/google/android/gms/common/api/ResultCallback<Lcom/google/android/gms/common/api/Status;>;"
    iget-object v1, p0, Lcom/patloew/rxlocation/GeofencingRemoveSingleOnSubscribe;->geofenceRequestIds:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 44
    sget-object v1, Lcom/google/android/gms/location/LocationServices;->GeofencingApi:Lcom/google/android/gms/location/GeofencingApi;

    iget-object v2, p0, Lcom/patloew/rxlocation/GeofencingRemoveSingleOnSubscribe;->geofenceRequestIds:Ljava/util/List;

    invoke-interface {v1, p1, v2}, Lcom/google/android/gms/location/GeofencingApi;->removeGeofences(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/util/List;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/patloew/rxlocation/GeofencingRemoveSingleOnSubscribe;->setupLocationPendingResult(Lcom/google/android/gms/common/api/PendingResult;Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 48
    :goto_0
    return-void

    .line 46
    :cond_0
    sget-object v1, Lcom/google/android/gms/location/LocationServices;->GeofencingApi:Lcom/google/android/gms/location/GeofencingApi;

    iget-object v2, p0, Lcom/patloew/rxlocation/GeofencingRemoveSingleOnSubscribe;->pendingIntent:Landroid/app/PendingIntent;

    invoke-interface {v1, p1, v2}, Lcom/google/android/gms/location/GeofencingApi;->removeGeofences(Lcom/google/android/gms/common/api/GoogleApiClient;Landroid/app/PendingIntent;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/patloew/rxlocation/GeofencingRemoveSingleOnSubscribe;->setupLocationPendingResult(Lcom/google/android/gms/common/api/PendingResult;Lcom/google/android/gms/common/api/ResultCallback;)V

    goto :goto_0
.end method
