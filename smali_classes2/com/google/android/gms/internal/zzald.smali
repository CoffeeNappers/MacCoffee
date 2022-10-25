.class public Lcom/google/android/gms/internal/zzald;
.super Ljava/lang/Object;


# instance fields
.field private final bhk:Lcom/google/android/gms/internal/zzamg;

.field private final bhl:Z

.field private final bhm:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzamg;ZZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzald;->bhk:Lcom/google/android/gms/internal/zzamg;

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzald;->bhl:Z

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzald;->bhm:Z

    return-void
.end method


# virtual methods
.method public zzam(Lcom/google/android/gms/internal/zzajq;)Z
    .locals 1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzald;->zzcxh()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzald;->bhm:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzald;->zzf(Lcom/google/android/gms/internal/zzalz;)Z

    move-result v0

    goto :goto_0
.end method

.method public zzcqy()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzald;->bhk:Lcom/google/android/gms/internal/zzamg;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method

.method public zzcxh()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzald;->bhl:Z

    return v0
.end method

.method public zzcxi()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzald;->bhm:Z

    return v0
.end method

.method public zzcxj()Lcom/google/android/gms/internal/zzamg;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzald;->bhk:Lcom/google/android/gms/internal/zzamg;

    return-object v0
.end method

.method public zzf(Lcom/google/android/gms/internal/zzalz;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzald;->zzcxh()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzald;->bhm:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzald;->bhk:Lcom/google/android/gms/internal/zzamg;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzaml;->zzk(Lcom/google/android/gms/internal/zzalz;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method
