.class abstract Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;
.super Ljava/lang/Object;
.source "RxLocationBaseOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final ctx:Landroid/content/Context;

.field private final scopes:[Lcom/google/android/gms/common/api/Scope;

.field private final services:[Lcom/google/android/gms/common/api/Api;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/google/android/gms/common/api/Api",
            "<+",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;",
            ">;"
        }
    .end annotation
.end field

.field final timeoutTime:Ljava/lang/Long;

.field final timeoutUnit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method protected constructor <init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;[Lcom/google/android/gms/common/api/Scope;)V
    .locals 1
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
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;, "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe<TT;>;"
    .local p2, "services":[Lcom/google/android/gms/common/api/Api;, "[Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    const/4 v0, 0x0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->ctx:Landroid/content/Context;

    .line 59
    iput-object p2, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->services:[Lcom/google/android/gms/common/api/Api;

    .line 60
    iput-object p3, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->scopes:[Lcom/google/android/gms/common/api/Scope;

    .line 61
    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->timeoutTime:Ljava/lang/Long;

    .line 62
    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->timeoutUnit:Ljava/util/concurrent/TimeUnit;

    .line 63
    return-void
.end method

.method protected constructor <init>(Lcom/patloew/rxlocation/RxLocation;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V
    .locals 3
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeout"    # Ljava/lang/Long;
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 43
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;, "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iget-object v0, p1, Lcom/patloew/rxlocation/RxLocation;->ctx:Landroid/content/Context;

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->ctx:Landroid/content/Context;

    .line 45
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/android/gms/common/api/Api;

    const/4 v1, 0x0

    sget-object v2, Lcom/google/android/gms/location/LocationServices;->API:Lcom/google/android/gms/common/api/Api;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/google/android/gms/location/ActivityRecognition;->API:Lcom/google/android/gms/common/api/Api;

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->services:[Lcom/google/android/gms/common/api/Api;

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->scopes:[Lcom/google/android/gms/common/api/Scope;

    .line 48
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 49
    iput-object p2, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->timeoutTime:Ljava/lang/Long;

    .line 50
    iput-object p3, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->timeoutUnit:Ljava/util/concurrent/TimeUnit;

    .line 55
    :goto_0
    return-void

    .line 52
    :cond_0
    iget-object v0, p1, Lcom/patloew/rxlocation/RxLocation;->timeoutTime:Ljava/lang/Long;

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->timeoutTime:Ljava/lang/Long;

    .line 53
    iget-object v0, p1, Lcom/patloew/rxlocation/RxLocation;->timeoutUnit:Ljava/util/concurrent/TimeUnit;

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->timeoutUnit:Ljava/util/concurrent/TimeUnit;

    goto :goto_0
.end method


# virtual methods
.method protected createApiClient(Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;)Lcom/google/android/gms/common/api/GoogleApiClient;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe",
            "<TT;>.ApiClientConnectionCallbacks;)",
            "Lcom/google/android/gms/common/api/GoogleApiClient;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;, "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe<TT;>;"
    .local p1, "apiClientConnectionCallbacks":Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    const/4 v4, 0x0

    .line 79
    invoke-virtual {p0}, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->getApiClientBuilder()Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v1

    .line 82
    .local v1, "apiClientBuilder":Lcom/google/android/gms/common/api/GoogleApiClient$Builder;
    iget-object v6, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->services:[Lcom/google/android/gms/common/api/Api;

    array-length v7, v6

    move v5, v4

    :goto_0
    if-ge v5, v7, :cond_0

    aget-object v3, v6, v5

    .line 83
    .local v3, "service":Lcom/google/android/gms/common/api/Api;, "Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    invoke-virtual {v1, v3}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addApi(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    .line 82
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 86
    .end local v3    # "service":Lcom/google/android/gms/common/api/Api;, "Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    :cond_0
    iget-object v5, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->scopes:[Lcom/google/android/gms/common/api/Scope;

    if-eqz v5, :cond_1

    .line 87
    iget-object v5, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->scopes:[Lcom/google/android/gms/common/api/Scope;

    array-length v6, v5

    :goto_1
    if-ge v4, v6, :cond_1

    aget-object v2, v5, v4

    .line 88
    .local v2, "scope":Lcom/google/android/gms/common/api/Scope;
    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addScope(Lcom/google/android/gms/common/api/Scope;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    .line 87
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 92
    .end local v2    # "scope":Lcom/google/android/gms/common/api/Scope;
    :cond_1
    invoke-virtual {v1, p1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    .line 93
    invoke-virtual {v1, p1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addOnConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    .line 95
    invoke-virtual {v1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->build()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v0

    .line 97
    .local v0, "apiClient":Lcom/google/android/gms/common/api/GoogleApiClient;
    invoke-virtual {p1, v0}, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;->setClient(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 99
    return-object v0
.end method

.method protected getApiClientBuilder()Lcom/google/android/gms/common/api/GoogleApiClient$Builder;
    .locals 2

    .prologue
    .line 74
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;, "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe<TT;>;"
    new-instance v0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    iget-object v1, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected onUnsubscribed(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;

    .prologue
    .line 102
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;, "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe<TT;>;"
    return-void
.end method

.method protected final setupLocationPendingResult(Lcom/google/android/gms/common/api/PendingResult;Lcom/google/android/gms/common/api/ResultCallback;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/google/android/gms/common/api/Result;",
            ">(",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<TT;>;",
            "Lcom/google/android/gms/common/api/ResultCallback",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;, "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe<TT;>;"
    .local p1, "pendingResult":Lcom/google/android/gms/common/api/PendingResult;, "Lcom/google/android/gms/common/api/PendingResult<TT;>;"
    .local p2, "resultCallback":Lcom/google/android/gms/common/api/ResultCallback;, "Lcom/google/android/gms/common/api/ResultCallback<TT;>;"
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->timeoutTime:Ljava/lang/Long;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->timeoutUnit:Ljava/util/concurrent/TimeUnit;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->timeoutTime:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-object v2, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;->timeoutUnit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, p2, v0, v1, v2}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;JLjava/util/concurrent/TimeUnit;)V

    .line 71
    :goto_0
    return-void

    .line 69
    :cond_0
    invoke-virtual {p1, p2}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    goto :goto_0
.end method
