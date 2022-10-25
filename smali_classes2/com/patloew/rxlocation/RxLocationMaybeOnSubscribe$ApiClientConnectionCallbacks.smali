.class public Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;
.super Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;
.source "RxLocationMaybeOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ApiClientConnectionCallbacks"
.end annotation


# instance fields
.field private apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

.field protected final emitter:Lio/reactivex/MaybeEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeEmitter",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;


# direct methods
.method private constructor <init>(Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;Lio/reactivex/MaybeEmitter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeEmitter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    .local p2, "emitter":Lio/reactivex/MaybeEmitter;, "Lio/reactivex/MaybeEmitter<TT;>;"
    iput-object p1, p0, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;->this$0:Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;

    invoke-direct {p0, p1}, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;-><init>(Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;)V

    .line 73
    iput-object p2, p0, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/MaybeEmitter;

    .line 74
    return-void
.end method

.method synthetic constructor <init>(Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;Lio/reactivex/MaybeEmitter;Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;
    .param p2, "x1"    # Lio/reactivex/MaybeEmitter;
    .param p3, "x2"    # Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$1;

    .prologue
    .line 66
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    invoke-direct {p0, p1, p2}, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;-><init>(Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;Lio/reactivex/MaybeEmitter;)V

    return-void
.end method


# virtual methods
.method public onConnected(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 79
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    :try_start_0
    iget-object v1, p0, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;->this$0:Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;

    iget-object v2, p0, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;->apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    iget-object v3, p0, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/MaybeEmitter;

    invoke-virtual {v1, v2, v3}, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe;->onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lio/reactivex/MaybeEmitter;)V
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
    iget-object v1, p0, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/MaybeEmitter;

    invoke-interface {v1, v0}, Lio/reactivex/MaybeEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 3
    .param p1, "connectionResult"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .line 92
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/MaybeEmitter;

    new-instance v1, Lcom/patloew/rxlocation/GoogleApiConnectionException;

    const-string/jumbo v2, "Error connecting to GoogleApiClient."

    invoke-direct {v1, v2, p1}, Lcom/patloew/rxlocation/GoogleApiConnectionException;-><init>(Ljava/lang/String;Lcom/google/android/gms/common/ConnectionResult;)V

    invoke-interface {v0, v1}, Lio/reactivex/MaybeEmitter;->onError(Ljava/lang/Throwable;)V

    .line 93
    return-void
.end method

.method public onConnectionSuspended(I)V
    .locals 2
    .param p1, "cause"    # I

    .prologue
    .line 87
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/MaybeEmitter;

    new-instance v1, Lcom/patloew/rxlocation/GoogleApiConnectionSuspendedException;

    invoke-direct {v1, p1}, Lcom/patloew/rxlocation/GoogleApiConnectionSuspendedException;-><init>(I)V

    invoke-interface {v0, v1}, Lio/reactivex/MaybeEmitter;->onError(Ljava/lang/Throwable;)V

    .line 88
    return-void
.end method

.method public setClient(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0
    .param p1, "client"    # Lcom/google/android/gms/common/api/GoogleApiClient;

    .prologue
    .line 96
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iput-object p1, p0, Lcom/patloew/rxlocation/RxLocationMaybeOnSubscribe$ApiClientConnectionCallbacks;->apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 97
    return-void
.end method
