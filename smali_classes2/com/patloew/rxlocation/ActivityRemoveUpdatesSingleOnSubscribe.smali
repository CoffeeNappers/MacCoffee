.class Lcom/patloew/rxlocation/ActivityRemoveUpdatesSingleOnSubscribe;
.super Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
.source "ActivityRemoveUpdatesSingleOnSubscribe.java"


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
.field final pendingIntent:Landroid/app/PendingIntent;


# direct methods
.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p3, "timeout"    # Ljava/lang/Long;
    .param p4, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 32
    invoke-direct {p0, p1, p3, p4}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    .line 33
    iput-object p2, p0, Lcom/patloew/rxlocation/ActivityRemoveUpdatesSingleOnSubscribe;->pendingIntent:Landroid/app/PendingIntent;

    .line 34
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
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p2, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Lcom/google/android/gms/common/api/Status;>;"
    sget-object v0, Lcom/google/android/gms/location/ActivityRecognition;->ActivityRecognitionApi:Lcom/google/android/gms/location/ActivityRecognitionApi;

    iget-object v1, p0, Lcom/patloew/rxlocation/ActivityRemoveUpdatesSingleOnSubscribe;->pendingIntent:Landroid/app/PendingIntent;

    .line 40
    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/location/ActivityRecognitionApi;->removeActivityUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;Landroid/app/PendingIntent;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    .line 41
    invoke-static {p2}, Lcom/patloew/rxlocation/SingleResultCallBack;->get(Lio/reactivex/SingleEmitter;)Lcom/google/android/gms/common/api/ResultCallback;

    move-result-object v1

    .line 39
    invoke-virtual {p0, v0, v1}, Lcom/patloew/rxlocation/ActivityRemoveUpdatesSingleOnSubscribe;->setupLocationPendingResult(Lcom/google/android/gms/common/api/PendingResult;Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 43
    return-void
.end method
