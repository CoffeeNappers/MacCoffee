.class public Lcom/patloew/rxlocation/LocationSettings;
.super Ljava/lang/Object;
.source "LocationSettings.java"


# static fields
.field private static final CHECK_SETTINGS_COMPLETABLE_FUNCTION:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<",
            "Ljava/lang/Boolean;",
            "Lio/reactivex/Completable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final rxLocation:Lcom/patloew/rxlocation/RxLocation;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    invoke-static {}, Lcom/patloew/rxlocation/LocationSettings$$Lambda$1;->lambdaFactory$()Lio/reactivex/functions/Function;

    move-result-object v0

    sput-object v0, Lcom/patloew/rxlocation/LocationSettings;->CHECK_SETTINGS_COMPLETABLE_FUNCTION:Lio/reactivex/functions/Function;

    return-void
.end method

.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/patloew/rxlocation/LocationSettings;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    .line 34
    return-void
.end method

.method private checkAndHandleResolutionInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "locationSettingsRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
    .param p2, "timeoutTime"    # Ljava/lang/Long;
    .param p3, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationSettingsRequest;",
            "Ljava/lang/Long;",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 105
    new-instance v0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/LocationSettings;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    invoke-direct {v0, v1, p1, p2, p3}, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method private checkInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "locationSettingsRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
    .param p2, "timeoutTime"    # Ljava/lang/Long;
    .param p3, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationSettingsRequest;",
            "Ljava/lang/Long;",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/location/LocationSettingsResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 60
    new-instance v0, Lcom/patloew/rxlocation/SettingsCheckSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/LocationSettings;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    invoke-direct {v0, v1, p1, p2, p3}, Lcom/patloew/rxlocation/SettingsCheckSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$static$0(Ljava/lang/Boolean;)Lio/reactivex/Completable;
    .locals 1
    .param p0, "success"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lio/reactivex/Completable;->complete()Lio/reactivex/Completable;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/patloew/rxlocation/LocationSettingsNotSatisfiedException;

    invoke-direct {v0}, Lcom/patloew/rxlocation/LocationSettingsNotSatisfiedException;-><init>()V

    invoke-static {v0}, Lio/reactivex/Completable;->error(Ljava/lang/Throwable;)Lio/reactivex/Completable;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public check(Lcom/google/android/gms/location/LocationRequest;)Lio/reactivex/Single;
    .locals 2
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/location/LocationSettingsResult;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 44
    invoke-virtual {p0}, Lcom/patloew/rxlocation/LocationSettings;->getLocationSettingsRequestBuilder()Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;->addLocationRequest(Lcom/google/android/gms/location/LocationRequest;)Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;->build()Lcom/google/android/gms/location/LocationSettingsRequest;

    move-result-object v0

    invoke-direct {p0, v0, v1, v1}, Lcom/patloew/rxlocation/LocationSettings;->checkInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public check(Lcom/google/android/gms/location/LocationRequest;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeoutTime"    # J
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/location/LocationSettingsResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p0}, Lcom/patloew/rxlocation/LocationSettings;->getLocationSettingsRequestBuilder()Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;->addLocationRequest(Lcom/google/android/gms/location/LocationRequest;)Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;->build()Lcom/google/android/gms/location/LocationSettingsRequest;

    move-result-object v0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v0, v1, p4}, Lcom/patloew/rxlocation/LocationSettings;->checkInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public check(Lcom/google/android/gms/location/LocationSettingsRequest;)Lio/reactivex/Single;
    .locals 1
    .param p1, "locationSettingsRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationSettingsRequest;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/location/LocationSettingsResult;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 52
    invoke-direct {p0, p1, v0, v0}, Lcom/patloew/rxlocation/LocationSettings;->checkInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public check(Lcom/google/android/gms/location/LocationSettingsRequest;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "locationSettingsRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeoutTime"    # J
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationSettingsRequest;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/location/LocationSettingsResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, p1, v0, p4}, Lcom/patloew/rxlocation/LocationSettings;->checkInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public checkAndHandleResolution(Lcom/google/android/gms/location/LocationRequest;)Lio/reactivex/Single;
    .locals 2
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 73
    invoke-virtual {p0}, Lcom/patloew/rxlocation/LocationSettings;->getLocationSettingsRequestBuilder()Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;->addLocationRequest(Lcom/google/android/gms/location/LocationRequest;)Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;->build()Lcom/google/android/gms/location/LocationSettingsRequest;

    move-result-object v0

    invoke-direct {p0, v0, v1, v1}, Lcom/patloew/rxlocation/LocationSettings;->checkAndHandleResolutionInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public checkAndHandleResolution(Lcom/google/android/gms/location/LocationRequest;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeoutTime"    # J
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/patloew/rxlocation/LocationSettings;->getLocationSettingsRequestBuilder()Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;->addLocationRequest(Lcom/google/android/gms/location/LocationRequest;)Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;->build()Lcom/google/android/gms/location/LocationSettingsRequest;

    move-result-object v0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v0, v1, p4}, Lcom/patloew/rxlocation/LocationSettings;->checkAndHandleResolutionInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public checkAndHandleResolution(Lcom/google/android/gms/location/LocationSettingsRequest;)Lio/reactivex/Single;
    .locals 1
    .param p1, "locationSettingsRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationSettingsRequest;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 91
    invoke-direct {p0, p1, v0, v0}, Lcom/patloew/rxlocation/LocationSettings;->checkAndHandleResolutionInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public checkAndHandleResolution(Lcom/google/android/gms/location/LocationSettingsRequest;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "locationSettingsRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeoutTime"    # J
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationSettingsRequest;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 100
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, p1, v0, p4}, Lcom/patloew/rxlocation/LocationSettings;->checkAndHandleResolutionInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public checkAndHandleResolutionCompletable(Lcom/google/android/gms/location/LocationRequest;)Lio/reactivex/Completable;
    .locals 2
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 69
    invoke-virtual {p0, p1}, Lcom/patloew/rxlocation/LocationSettings;->checkAndHandleResolution(Lcom/google/android/gms/location/LocationRequest;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/LocationSettings;->CHECK_SETTINGS_COMPLETABLE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapCompletable(Lio/reactivex/functions/Function;)Lio/reactivex/Completable;

    move-result-object v0

    return-object v0
.end method

.method public checkAndHandleResolutionCompletable(Lcom/google/android/gms/location/LocationRequest;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Completable;
    .locals 2
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeoutTime"    # J
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 78
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/patloew/rxlocation/LocationSettings;->checkAndHandleResolution(Lcom/google/android/gms/location/LocationRequest;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/LocationSettings;->CHECK_SETTINGS_COMPLETABLE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapCompletable(Lio/reactivex/functions/Function;)Lio/reactivex/Completable;

    move-result-object v0

    return-object v0
.end method

.method public checkAndHandleResolutionCompletable(Lcom/google/android/gms/location/LocationSettingsRequest;)Lio/reactivex/Completable;
    .locals 2
    .param p1, "locationSettingsRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 87
    invoke-direct {p0, p1, v0, v0}, Lcom/patloew/rxlocation/LocationSettings;->checkAndHandleResolutionInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/LocationSettings;->CHECK_SETTINGS_COMPLETABLE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapCompletable(Lio/reactivex/functions/Function;)Lio/reactivex/Completable;

    move-result-object v0

    return-object v0
.end method

.method public checkAndHandleResolutionCompletable(Lcom/google/android/gms/location/LocationSettingsRequest;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Completable;
    .locals 2
    .param p1, "locationSettingsRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "timeoutTime"    # J
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 96
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, p1, v0, p4}, Lcom/patloew/rxlocation/LocationSettings;->checkAndHandleResolutionInternal(Lcom/google/android/gms/location/LocationSettingsRequest;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/patloew/rxlocation/LocationSettings;->CHECK_SETTINGS_COMPLETABLE_FUNCTION:Lio/reactivex/functions/Function;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->flatMapCompletable(Lio/reactivex/functions/Function;)Lio/reactivex/Completable;

    move-result-object v0

    return-object v0
.end method

.method getLocationSettingsRequestBuilder()Lcom/google/android/gms/location/LocationSettingsRequest$Builder;
    .locals 1

    .prologue
    .line 38
    new-instance v0, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;-><init>()V

    return-object v0
.end method
