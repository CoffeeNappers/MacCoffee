.class abstract Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
.super Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;
.source "RxLocationSingleOnSubscribe.java"

# interfaces
.implements Lio/reactivex/SingleOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe",
        "<TT;>;",
        "Lio/reactivex/SingleOnSubscribe",
        "<TT;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;[Lcom/google/android/gms/common/api/Scope;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Lcom/google/android/gms/common/api/Api;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "scopes"    # [Lcom/google/android/gms/common/api/Scope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Lcom/google/android/gms/common/api/Api",
            "<+",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;",
            ">;[",
            "Lcom/google/android/gms/common/api/Scope;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;, "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe<TT;>;"
    .local p2, "services":[Lcom/google/android/gms/common/api/Api;, "[Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;-><init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;[Lcom/google/android/gms/common/api/Scope;)V

    .line 43
    return-void
.end method

.method protected constructor <init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeout"    # Ljava/lang/Long;
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 38
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;, "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    .line 39
    return-void
.end method

.method static synthetic lambda$subscribe$0(Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 1
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;, "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe<TT;>;"
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    invoke-virtual {p0, p1}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;->onUnsubscribed(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 60
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    .line 61
    return-void
.end method


# virtual methods
.method protected abstract onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lio/reactivex/SingleEmitter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lio/reactivex/SingleEmitter",
            "<TT;>;)V"
        }
    .end annotation
.end method

.method public final subscribe(Lio/reactivex/SingleEmitter;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleEmitter",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;, "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe<TT;>;"
    .local p1, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<TT;>;"
    new-instance v2, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v3}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$ApiClientConnectionCallbacks;-><init>(Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;Lio/reactivex/SingleEmitter;Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$1;)V

    invoke-virtual {p0, v2}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;->createApiClient(Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;)Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v0

    .line 50
    .local v0, "apiClient":Lcom/google/android/gms/common/api/GoogleApiClient;
    :try_start_0
    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    :goto_0
    invoke-static {p0, v0}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$$Lambda$1;->lambdaFactory$(Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;Lcom/google/android/gms/common/api/GoogleApiClient;)Lio/reactivex/functions/Cancellable;

    move-result-object v2

    invoke-interface {p1, v2}, Lio/reactivex/SingleEmitter;->setCancellable(Lio/reactivex/functions/Cancellable;)V

    .line 62
    return-void

    .line 51
    :catch_0
    move-exception v1

    .line 52
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-interface {p1, v1}, Lio/reactivex/SingleEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
