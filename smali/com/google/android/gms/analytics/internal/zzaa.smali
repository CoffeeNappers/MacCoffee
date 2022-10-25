.class public Lcom/google/android/gms/analytics/internal/zzaa;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/internal/zzp;


# instance fields
.field public bN:Ljava/lang/String;

.field public bO:Ljava/lang/String;

.field public ff:Ljava/lang/String;

.field public fg:I

.field public fh:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->fg:I

    iput v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->fh:I

    return-void
.end method


# virtual methods
.method public zzaae()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->bN:Ljava/lang/String;

    return-object v0
.end method

.method public zzaaf()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->bO:Ljava/lang/String;

    return-object v0
.end method

.method public zzafq()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->bN:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzafr()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->bO:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzafs()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->ff:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzaft()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->ff:Ljava/lang/String;

    return-object v0
.end method

.method public zzafu()Z
    .locals 1

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->fg:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzafv()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->fg:I

    return v0
.end method

.method public zzafw()Z
    .locals 2

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzaa;->fh:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzafx()Z
    .locals 2

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/analytics/internal/zzaa;->fh:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
