.class public Lcom/patloew/rxlocation/Geofencing;
.super Ljava/lang/Object;
.source "Geofencing.java"


# instance fields
.field private final rxLocation:Lcom/patloew/rxlocation/RxLocation;


# direct methods
.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/patloew/rxlocation/Geofencing;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    .line 35
    return-void
.end method

.method private addInternal(Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 6
    .param p1, "geofencingRequest"    # Lcom/google/android/gms/location/GeofencingRequest;
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p3, "timeoutTime"    # Ljava/lang/Long;
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/GeofencingRequest;",
            "Landroid/app/PendingIntent;",
            "Ljava/lang/Long;",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    new-instance v0, Lcom/patloew/rxlocation/GeofencingAddSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/Geofencing;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/GeofencingAddSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method private removeInternal(Ljava/util/List;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 6
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p3, "timeoutTime"    # Ljava/lang/Long;
    .param p4, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/app/PendingIntent;",
            "Ljava/lang/Long;",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    .local p1, "geofenceRequestIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/patloew/rxlocation/GeofencingRemoveSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/Geofencing;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/patloew/rxlocation/GeofencingRemoveSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Ljava/util/List;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;)Lio/reactivex/Single;
    .locals 1
    .param p1, "geofencingRequest"    # Lcom/google/android/gms/location/GeofencingRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        value = "android.permission.ACCESS_FINE_LOCATION"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/GeofencingRequest;",
            "Landroid/app/PendingIntent;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/patloew/rxlocation/Geofencing;->addInternal(Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public add(Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 1
    .param p1, "geofencingRequest"    # Lcom/google/android/gms/location/GeofencingRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "timeoutTime"    # J
    .param p5, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        value = "android.permission.ACCESS_FINE_LOCATION"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/GeofencingRequest;",
            "Landroid/app/PendingIntent;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, p5}, Lcom/patloew/rxlocation/Geofencing;->addInternal(Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public remove(Landroid/app/PendingIntent;)Lio/reactivex/Single;
    .locals 1
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/PendingIntent;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 66
    invoke-direct {p0, v0, p1, v0, v0}, Lcom/patloew/rxlocation/Geofencing;->removeInternal(Ljava/util/List;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public remove(Landroid/app/PendingIntent;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
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
            "Landroid/app/PendingIntent;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    const/4 v0, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1, p4}, Lcom/patloew/rxlocation/Geofencing;->removeInternal(Ljava/util/List;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/util/List;)Lio/reactivex/Single;
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "geofenceRequestIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 58
    invoke-direct {p0, p1, v0, v0, v0}, Lcom/patloew/rxlocation/Geofencing;->removeInternal(Ljava/util/List;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/util/List;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1    # Ljava/util/List;
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
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "geofenceRequestIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1, p4}, Lcom/patloew/rxlocation/Geofencing;->removeInternal(Ljava/util/List;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method
