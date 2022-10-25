.class public Lcom/patloew/rxlocation/ActivityRecognition;
.super Ljava/lang/Object;
.source "ActivityRecognition.java"


# instance fields
.field private final rxLocation:Lcom/patloew/rxlocation/RxLocation;


# direct methods
.method constructor <init>(Lcom/patloew/rxlocation/RxLocation;)V
    .locals 0
    .param p1, "rxLocation"    # Lcom/patloew/rxlocation/RxLocation;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/patloew/rxlocation/ActivityRecognition;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    .line 32
    return-void
.end method

.method private removeUpdatesInternal(Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 2
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p2, "timeout"    # Ljava/lang/Long;
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 64
    new-instance v0, Lcom/patloew/rxlocation/ActivityRemoveUpdatesSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/ActivityRecognition;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    invoke-direct {v0, v1, p1, p2, p3}, Lcom/patloew/rxlocation/ActivityRemoveUpdatesSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method private requestUpdatesInternal(JLandroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 7
    .param p1, "detectionIntervalMillis"    # J
    .param p3, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p4, "timeout"    # Ljava/lang/Long;
    .param p5, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
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
    .line 48
    new-instance v0, Lcom/patloew/rxlocation/ActivityRequestUpdatesSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/ActivityRecognition;->rxLocation:Lcom/patloew/rxlocation/RxLocation;

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/patloew/rxlocation/ActivityRequestUpdatesSingleOnSubscribe;-><init>(Lcom/patloew/rxlocation/RxLocation;JLandroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public removeUpdates(Landroid/app/PendingIntent;)Lio/reactivex/Single;
    .locals 1
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        value = "com.google.android.gms.permission.ACTIVITY_RECOGNITION"
    .end annotation

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

    .line 55
    invoke-direct {p0, p1, v0, v0}, Lcom/patloew/rxlocation/ActivityRecognition;->removeUpdatesInternal(Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public removeUpdates(Landroid/app/PendingIntent;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
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
    .annotation build Landroid/support/annotation/RequiresPermission;
        value = "com.google.android.gms.permission.ACTIVITY_RECOGNITION"
    .end annotation

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
    .line 60
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, p1, v0, p4}, Lcom/patloew/rxlocation/ActivityRecognition;->removeUpdatesInternal(Landroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public requestUpdates(JLandroid/app/PendingIntent;)Lio/reactivex/Single;
    .locals 7
    .param p1, "detectionIntervalMillis"    # J
    .param p3, "pendingIntent"    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        value = "com.google.android.gms.permission.ACTIVITY_RECOGNITION"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Landroid/app/PendingIntent;",
            ")",
            "Lio/reactivex/Single",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 39
    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v6, v5

    invoke-direct/range {v1 .. v6}, Lcom/patloew/rxlocation/ActivityRecognition;->requestUpdatesInternal(JLandroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public requestUpdates(JLandroid/app/PendingIntent;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;
    .locals 7
    .param p1, "detectionIntervalMillis"    # J
    .param p3, "pendingIntent"    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "timeoutTime"    # J
    .param p6, "timeoutUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        value = "com.google.android.gms.permission.ACTIVITY_RECOGNITION"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
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
    .line 44
    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v6, p6

    invoke-direct/range {v1 .. v6}, Lcom/patloew/rxlocation/ActivityRecognition;->requestUpdatesInternal(JLandroid/app/PendingIntent;Ljava/lang/Long;Ljava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method
