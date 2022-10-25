.class Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;
.super Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;
.source "SettingsCheckHandleSingleOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field static final observableMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field final context:Landroid/content/Context;

.field private emitterWeakRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lio/reactivex/SingleEmitter",
            "<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field final locationSettingsRequest:Lcom/google/android/gms/location/LocationSettingsRequest;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->observableMap:Ljava/util/Map;

    return-void
.end method

.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V
    .locals 1
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;
    .param p2, "locationSettingsRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
    .param p3, "timeoutTime"    # Ljava/lang/Long;
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 44
    invoke-direct {p0, p1, p3, p4}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    .line 45
    iget-object v0, p1, Lcom/patloew/rxlocation/RxLocation;->ctx:Landroid/content/Context;

    iput-object v0, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->context:Landroid/content/Context;

    .line 46
    iput-object p2, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->locationSettingsRequest:Lcom/google/android/gms/location/LocationSettingsRequest;

    .line 47
    return-void
.end method

.method static synthetic lambda$onGoogleApiClientReady$0(Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;Lio/reactivex/SingleEmitter;Lcom/google/android/gms/location/LocationSettingsResult;)V
    .locals 5
    .param p0, "this"    # Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;
    .param p1, "emitter"    # Lio/reactivex/SingleEmitter;
    .param p2, "result"    # Lcom/google/android/gms/location/LocationSettingsResult;

    .prologue
    const/4 v4, 0x0

    .line 85
    invoke-virtual {p2}, Lcom/google/android/gms/location/LocationSettingsResult;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v2

    .line 87
    .local v2, "status":Lcom/google/android/gms/common/api/Status;
    invoke-virtual {v2}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 121
    new-instance v3, Lcom/patloew/rxlocation/StatusException;

    invoke-direct {v3, p2}, Lcom/patloew/rxlocation/StatusException;-><init>(Lcom/google/android/gms/common/api/Result;)V

    invoke-interface {p1, v3}, Lio/reactivex/SingleEmitter;->onError(Ljava/lang/Throwable;)V

    .line 124
    :goto_0
    return-void

    .line 91
    :sswitch_0
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {p1, v3}, Lio/reactivex/SingleEmitter;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 98
    :sswitch_1
    iget-object v3, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->context:Landroid/content/Context;

    if-eqz v3, :cond_0

    .line 99
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    .line 100
    .local v1, "observableId":Ljava/lang/String;
    sget-object v3, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->observableMap:Ljava/util/Map;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v3, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    new-instance v0, Landroid/content/Intent;

    iget-object v3, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->context:Landroid/content/Context;

    const-class v4, Lcom/patloew/rxlocation/LocationSettingsActivity;

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 103
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "status"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 104
    const-string/jumbo v3, "id"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 105
    const/high16 v3, 0x10000000

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 106
    iget-object v3, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->context:Landroid/content/Context;

    invoke-virtual {v3, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 108
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "observableId":Ljava/lang/String;
    :cond_0
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {p1, v3}, Lio/reactivex/SingleEmitter;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 117
    :sswitch_2
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {p1, v3}, Lio/reactivex/SingleEmitter;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 87
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x6 -> :sswitch_1
        0x2136 -> :sswitch_2
    .end sparse-switch
.end method

.method static observableMapCleanup()V
    .locals 3

    .prologue
    .line 68
    sget-object v2, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->observableMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 69
    sget-object v2, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->observableMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 71
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/ref/WeakReference<Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;>;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 72
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 73
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/ref/WeakReference<Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 76
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/ref/WeakReference<Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;>;>;"
    :cond_1
    return-void
.end method

.method static onResolutionResult(Ljava/lang/String;I)V
    .locals 3
    .param p0, "observableId"    # Ljava/lang/String;
    .param p1, "resultCode"    # I

    .prologue
    .line 50
    sget-object v2, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->observableMap:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 51
    sget-object v2, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->observableMap:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;

    .line 53
    .local v0, "observable":Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;
    if-eqz v0, :cond_0

    iget-object v2, v0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->emitterWeakRef:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_0

    .line 54
    iget-object v2, v0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->emitterWeakRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/SingleEmitter;

    .line 56
    .local v1, "observer":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Ljava/lang/Boolean;>;"
    if-eqz v1, :cond_0

    .line 57
    const/4 v2, -0x1

    if-ne p1, v2, :cond_2

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v2}, Lio/reactivex/SingleEmitter;->onSuccess(Ljava/lang/Object;)V

    .line 61
    .end local v1    # "observer":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Ljava/lang/Boolean;>;"
    :cond_0
    sget-object v2, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->observableMap:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .end local v0    # "observable":Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;
    :cond_1
    invoke-static {}, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->observableMapCleanup()V

    .line 65
    return-void

    .line 57
    .restart local v0    # "observable":Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;
    .restart local v1    # "observer":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Ljava/lang/Boolean;>;"
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
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
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p2, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Ljava/lang/Boolean;>;"
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->emitterWeakRef:Ljava/lang/ref/WeakReference;

    .line 82
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->SettingsApi:Lcom/google/android/gms/location/SettingsApi;

    iget-object v1, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->locationSettingsRequest:Lcom/google/android/gms/location/LocationSettingsRequest;

    .line 83
    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/location/SettingsApi;->checkLocationSettings(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationSettingsRequest;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    invoke-static {p0, p2}, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe$$Lambda$1;->lambdaFactory$(Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;Lio/reactivex/SingleEmitter;)Lcom/google/android/gms/common/api/ResultCallback;

    move-result-object v1

    .line 82
    invoke-virtual {p0, v0, v1}, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->setupLocationPendingResult(Lcom/google/android/gms/common/api/PendingResult;Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 126
    return-void
.end method
