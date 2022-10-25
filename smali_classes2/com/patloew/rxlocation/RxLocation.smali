.class public Lcom/patloew/rxlocation/RxLocation;
.super Ljava/lang/Object;
.source "RxLocation.java"


# instance fields
.field private final activityRecognition:Lcom/patloew/rxlocation/ActivityRecognition;

.field final ctx:Landroid/content/Context;

.field private final fusedLocation:Lcom/patloew/rxlocation/FusedLocation;

.field private final geocoding:Lcom/patloew/rxlocation/Geocoding;

.field private final geofencing:Lcom/patloew/rxlocation/Geofencing;

.field private final locationSettings:Lcom/patloew/rxlocation/LocationSettings;

.field timeoutTime:Ljava/lang/Long;

.field timeoutUnit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lcom/patloew/rxlocation/ActivityRecognition;

    invoke-direct {v0, p0}, Lcom/patloew/rxlocation/ActivityRecognition;-><init>(Lcom/patloew/rxlocation/RxLocation;)V

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->activityRecognition:Lcom/patloew/rxlocation/ActivityRecognition;

    .line 31
    new-instance v0, Lcom/patloew/rxlocation/FusedLocation;

    invoke-direct {v0, p0}, Lcom/patloew/rxlocation/FusedLocation;-><init>(Lcom/patloew/rxlocation/RxLocation;)V

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->fusedLocation:Lcom/patloew/rxlocation/FusedLocation;

    .line 33
    new-instance v0, Lcom/patloew/rxlocation/Geofencing;

    invoke-direct {v0, p0}, Lcom/patloew/rxlocation/Geofencing;-><init>(Lcom/patloew/rxlocation/RxLocation;)V

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->geofencing:Lcom/patloew/rxlocation/Geofencing;

    .line 34
    new-instance v0, Lcom/patloew/rxlocation/LocationSettings;

    invoke-direct {v0, p0}, Lcom/patloew/rxlocation/LocationSettings;-><init>(Lcom/patloew/rxlocation/RxLocation;)V

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->locationSettings:Lcom/patloew/rxlocation/LocationSettings;

    .line 35
    iput-object v1, p0, Lcom/patloew/rxlocation/RxLocation;->timeoutTime:Ljava/lang/Long;

    .line 36
    iput-object v1, p0, Lcom/patloew/rxlocation/RxLocation;->timeoutUnit:Ljava/util/concurrent/TimeUnit;

    .line 44
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->ctx:Landroid/content/Context;

    .line 45
    new-instance v0, Lcom/patloew/rxlocation/Geocoding;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/patloew/rxlocation/Geocoding;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->geocoding:Lcom/patloew/rxlocation/Geocoding;

    .line 46
    return-void
.end method


# virtual methods
.method public activity()Lcom/patloew/rxlocation/ActivityRecognition;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->activityRecognition:Lcom/patloew/rxlocation/ActivityRecognition;

    return-object v0
.end method

.method public geocoding()Lcom/patloew/rxlocation/Geocoding;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->geocoding:Lcom/patloew/rxlocation/Geocoding;

    return-object v0
.end method

.method public geofencing()Lcom/patloew/rxlocation/Geofencing;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->geofencing:Lcom/patloew/rxlocation/Geofencing;

    return-object v0
.end method

.method public location()Lcom/patloew/rxlocation/FusedLocation;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->fusedLocation:Lcom/patloew/rxlocation/FusedLocation;

    return-object v0
.end method

.method public resetDefaultTimeout()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->timeoutTime:Ljava/lang/Long;

    .line 64
    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->timeoutUnit:Ljava/util/concurrent/TimeUnit;

    .line 65
    return-void
.end method

.method public setDefaultTimeout(JLjava/util/concurrent/TimeUnit;)V
    .locals 3
    .param p1, "time"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 52
    if-eqz p3, :cond_0

    .line 53
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->timeoutTime:Ljava/lang/Long;

    .line 54
    iput-object p3, p0, Lcom/patloew/rxlocation/RxLocation;->timeoutUnit:Ljava/util/concurrent/TimeUnit;

    .line 58
    return-void

    .line 56
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "timeUnit parameter must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public settings()Lcom/patloew/rxlocation/LocationSettings;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocation;->locationSettings:Lcom/patloew/rxlocation/LocationSettings;

    return-object v0
.end method
