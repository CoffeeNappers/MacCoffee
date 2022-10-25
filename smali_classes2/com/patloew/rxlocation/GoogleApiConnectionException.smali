.class public Lcom/patloew/rxlocation/GoogleApiConnectionException;
.super Ljava/lang/RuntimeException;
.source "GoogleApiConnectionException.java"


# instance fields
.field private final connectionResult:Lcom/google/android/gms/common/ConnectionResult;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0
    .param p1, "detailMessage"    # Ljava/lang/String;
    .param p2, "connectionResult"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 24
    iput-object p2, p0, Lcom/patloew/rxlocation/GoogleApiConnectionException;->connectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 25
    return-void
.end method


# virtual methods
.method public getConnectionResult()Lcom/google/android/gms/common/ConnectionResult;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/patloew/rxlocation/GoogleApiConnectionException;->connectionResult:Lcom/google/android/gms/common/ConnectionResult;

    return-object v0
.end method

.method public wasResolutionUnsuccessful()Z
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/patloew/rxlocation/GoogleApiConnectionException;->connectionResult:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/patloew/rxlocation/GoogleApiConnectionException;->connectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v0

    .line 35
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
