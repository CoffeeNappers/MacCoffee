.class public Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;
.super Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;
.source "RxLocationFlowableOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ApiClientConnectionCallbacks"
.end annotation


# instance fields
.field private apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

.field protected final emitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;


# direct methods
.method private constructor <init>(Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;Lio/reactivex/FlowableEmitter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/FlowableEmitter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    .local p2, "emitter":Lio/reactivex/FlowableEmitter;, "Lio/reactivex/FlowableEmitter<TT;>;"
    iput-object p1, p0, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;->this$0:Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;

    invoke-direct {p0, p1}, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;-><init>(Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;)V

    .line 74
    iput-object p2, p0, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/FlowableEmitter;

    .line 75
    return-void
.end method

.method synthetic constructor <init>(Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;Lio/reactivex/FlowableEmitter;Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;
    .param p2, "x1"    # Lio/reactivex/FlowableEmitter;
    .param p3, "x2"    # Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$1;

    .prologue
    .line 67
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    invoke-direct {p0, p1, p2}, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;-><init>(Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;Lio/reactivex/FlowableEmitter;)V

    return-void
.end method


# virtual methods
.method public onConnected(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 80
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    :try_start_0
    iget-object v1, p0, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;->this$0:Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;

    iget-object v2, p0, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;->apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    iget-object v3, p0, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/FlowableEmitter;

    invoke-virtual {v1, v2, v3}, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;->onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lio/reactivex/FlowableEmitter;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    :goto_0
    return-void

    .line 81
    :catch_0
    move-exception v0

    .line 82
    .local v0, "ex":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v1, v0}, Lio/reactivex/FlowableEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 3
    .param p1, "connectionResult"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .line 93
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/FlowableEmitter;

    new-instance v1, Lcom/patloew/rxlocation/GoogleApiConnectionException;

    const-string/jumbo v2, "Error connecting to GoogleApiClient."

    invoke-direct {v1, v2, p1}, Lcom/patloew/rxlocation/GoogleApiConnectionException;-><init>(Ljava/lang/String;Lcom/google/android/gms/common/ConnectionResult;)V

    invoke-interface {v0, v1}, Lio/reactivex/FlowableEmitter;->onError(Ljava/lang/Throwable;)V

    .line 94
    return-void
.end method

.method public onConnectionSuspended(I)V
    .locals 2
    .param p1, "cause"    # I

    .prologue
    .line 88
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;->emitter:Lio/reactivex/FlowableEmitter;

    new-instance v1, Lcom/patloew/rxlocation/GoogleApiConnectionSuspendedException;

    invoke-direct {v1, p1}, Lcom/patloew/rxlocation/GoogleApiConnectionSuspendedException;-><init>(I)V

    invoke-interface {v0, v1}, Lio/reactivex/FlowableEmitter;->onError(Ljava/lang/Throwable;)V

    .line 89
    return-void
.end method

.method public setClient(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0
    .param p1, "client"    # Lcom/google/android/gms/common/api/GoogleApiClient;

    .prologue
    .line 97
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iput-object p1, p0, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe$ApiClientConnectionCallbacks;->apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 98
    return-void
.end method
