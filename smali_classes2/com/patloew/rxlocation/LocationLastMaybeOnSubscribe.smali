.class Lcom/patloew/rxlocation/LocationLastMaybeOnSubscribe;
.super Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;
.source "LocationLastMaybeOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe",
        "<",
        "Landroid/location/Location;",
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
    invoke-direct {p0, p1, v0, v0}, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    .line 28
    return-void
.end method


# virtual methods
.method protected onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lio/reactivex/MaybeEmitter;)V
    .locals 2
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lio/reactivex/MaybeEmitter",
            "<",
            "Landroid/location/Location;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p2, "emitter":Lio/reactivex/MaybeEmitter;, "Lio/reactivex/MaybeEmitter<Landroid/location/Location;>;"
    sget-object v1, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    invoke-interface {v1, p1}, Lcom/google/android/gms/location/FusedLocationProviderApi;->getLastLocation(Lcom/google/android/gms/common/api/GoogleApiClient;)Landroid/location/Location;

    move-result-object v0

    .line 35
    .local v0, "location":Landroid/location/Location;
    if-eqz v0, :cond_0

    .line 36
    invoke-interface {p2, v0}, Lio/reactivex/MaybeEmitter;->onSuccess(Ljava/lang/Object;)V

    .line 40
    :goto_0
    return-void

    .line 38
    :cond_0
    invoke-interface {p2}, Lio/reactivex/MaybeEmitter;->onComplete()V

    goto :goto_0
.end method
