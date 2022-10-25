.class public Lcom/google/android/gms/analytics/internal/zzan;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/internal/zzp;


# instance fields
.field public at:Ljava/lang/String;

.field public fQ:D

.field public fR:I

.field public fS:I

.field public fT:I

.field public fU:I

.field public fV:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v2, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->fQ:D

    iput v2, p0, Lcom/google/android/gms/analytics/internal/zzan;->fR:I

    iput v2, p0, Lcom/google/android/gms/analytics/internal/zzan;->fS:I

    iput v2, p0, Lcom/google/android/gms/analytics/internal/zzan;->fT:I

    iput v2, p0, Lcom/google/android/gms/analytics/internal/zzan;->fU:I

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->fV:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getSessionTimeout()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->fR:I

    return v0
.end method

.method public getTrackingId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->at:Ljava/lang/String;

    return-object v0
.end method

.method public zzahc()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->at:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzahd()Z
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->fQ:D

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzahe()D
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->fQ:D

    return-wide v0
.end method

.method public zzahf()Z
    .locals 1

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->fR:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzahg()Z
    .locals 2

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->fS:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzahh()Z
    .locals 2

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/analytics/internal/zzan;->fS:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzahi()Z
    .locals 2

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->fT:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzahj()Z
    .locals 2

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/analytics/internal/zzan;->fT:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzahk()Z
    .locals 2

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/analytics/internal/zzan;->fU:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzfh(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzan;->fV:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    move-object v0, p1

    goto :goto_0
.end method

.method public zzr(Landroid/app/Activity;)Ljava/lang/String;
    .locals 1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzan;->zzfh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
