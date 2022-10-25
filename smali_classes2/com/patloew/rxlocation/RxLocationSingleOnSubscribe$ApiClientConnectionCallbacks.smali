.class public Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;
.super Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;
.source "RxLocationSingleOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ApiClientConnectionCallbacks"
.end annotation


# instance fields
.field private apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

.field protected final emitter:Lio/reactivex/SingleEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleEmitter",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;


# direct methods
.method private constructor <init>(Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;Lio/reactivex/SingleEmitter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleEmitter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    .local p2, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<TT;>;"
    iput-object p1, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;->this$0:Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;

    invoke-direct {p0, p1}, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;-><init>(Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;)V

    .line 73
    iput-object p2, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/SingleEmitter;

    .line 74
    return-void
.end method

.method synthetic constructor <init>(Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;Lio/reactivex/SingleEmitter;Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
    .param p2, "x1"    # Lio/reactivex/SingleEmitter;
    .param p3, "x2"    # Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$1;

    .prologue
    .line 66
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    invoke-direct {p0, p1, p2}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;-><init>(Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;Lio/reactivex/SingleEmitter;)V

    return-void
.end method


# virtual methods
.method public onConnected(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 79
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    :try_start_0
    iget-object v1, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;->this$0:Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;

    iget-object v2, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;->apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    iget-object v3, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/SingleEmitter;

    invoke-virtual {v1, v2, v3}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;->onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lio/reactivex/SingleEmitter;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "ex":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/SingleEmitter;

    invoke-interface {v1, v0}, Lio/reactivex/SingleEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 3
    .param p1, "connectionResult"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .line 92
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/SingleEmitter;

    new-instance v1, Lcom/patloew/rxlocation/GoogleApiConnectionException;

    const-string/jumbo v2, "Error connecting to GoogleApiClient."

    invoke-direct {v1, v2, p1}, Lcom/patloew/rxlocation/GoogleApiConnectionException;-><init>(Ljava/lang/String;Lcom/google/android/gms/common/ConnectionResult;)V

    invoke-interface {v0, v1}, Lio/reactivex/SingleEmitter;->onError(Ljava/lang/Throwable;)V

    .line 93
    return-void
.end method

.method public onConnectionSuspended(I)V
    .locals 2
    .param p1, "cause"    # I

    .prologue
    .line 87
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/SingleEmitter;

    new-instance v1, Lcom/patloew/rxlocation/GoogleApiConnectionSuspendedException;

    invoke-direct {v1, p1}, Lcom/patloew/rxlocation/GoogleApiConnectionSuspendedException;-><init>(I)V

    invoke-interface {v0, v1}, Lio/reactivex/SingleEmitter;->onError(Ljava/lang/Throwable;)V

    .line 88
    return-void
.end method

.method public setClient(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0
    .param p1, "client"    # Lcom/google/android/gms/common/api/GoogleApiClient;

    .prologue
    .line 96
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iput-object p1, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;->apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 97
    return-void
.end method
