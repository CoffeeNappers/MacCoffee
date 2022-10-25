.class public Lcom/google/android/gms/internal/zzaln;
.super Ljava/lang/Object;


# instance fields
.field private final bhY:Lcom/google/android/gms/internal/zzald;

.field private final bhZ:Lcom/google/android/gms/internal/zzald;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzald;Lcom/google/android/gms/internal/zzald;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaln;->bhY:Lcom/google/android/gms/internal/zzald;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaln;->bhZ:Lcom/google/android/gms/internal/zzald;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzamg;ZZ)Lcom/google/android/gms/internal/zzaln;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzaln;

    new-instance v1, Lcom/google/android/gms/internal/zzald;

    invoke-direct {v1, p1, p2, p3}, Lcom/google/android/gms/internal/zzald;-><init>(Lcom/google/android/gms/internal/zzamg;ZZ)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaln;->bhZ:Lcom/google/android/gms/internal/zzald;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzaln;-><init>(Lcom/google/android/gms/internal/zzald;Lcom/google/android/gms/internal/zzald;)V

    return-object v0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzamg;ZZ)Lcom/google/android/gms/internal/zzaln;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzaln;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaln;->bhY:Lcom/google/android/gms/internal/zzald;

    new-instance v2, Lcom/google/android/gms/internal/zzald;

    invoke-direct {v2, p1, p2, p3}, Lcom/google/android/gms/internal/zzald;-><init>(Lcom/google/android/gms/internal/zzamg;ZZ)V

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzaln;-><init>(Lcom/google/android/gms/internal/zzald;Lcom/google/android/gms/internal/zzald;)V

    return-object v0
.end method

.method public zzcyl()Lcom/google/android/gms/internal/zzald;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaln;->bhY:Lcom/google/android/gms/internal/zzald;

    return-object v0
.end method

.method public zzcym()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaln;->bhY:Lcom/google/android/gms/internal/zzald;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzald;->zzcxh()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaln;->bhY:Lcom/google/android/gms/internal/zzald;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzald;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcyn()Lcom/google/android/gms/internal/zzald;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaln;->bhZ:Lcom/google/android/gms/internal/zzald;

    return-object v0
.end method

.method public zzcyo()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaln;->bhZ:Lcom/google/android/gms/internal/zzald;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzald;->zzcxh()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaln;->bhZ:Lcom/google/android/gms/internal/zzald;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzald;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
