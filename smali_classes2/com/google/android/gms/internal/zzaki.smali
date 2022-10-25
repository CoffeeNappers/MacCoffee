.class public Lcom/google/android/gms/internal/zzaki;
.super Ljava/lang/Object;


# instance fields
.field private final bgb:Lcom/google/android/gms/internal/zzajq;

.field private final bgc:Lcom/google/android/gms/internal/zzakh;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakh;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaki;->bgb:Lcom/google/android/gms/internal/zzajq;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaki;->bgc:Lcom/google/android/gms/internal/zzakh;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamk;ZLcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamk;
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaki;->bgc:Lcom/google/android/gms/internal/zzakh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaki;->bgb:Lcom/google/android/gms/internal/zzajq;

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/zzakh;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamk;ZLcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaki;->bgc:Lcom/google/android/gms/internal/zzakh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaki;->bgb:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/google/android/gms/internal/zzakh;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzald;)Lcom/google/android/gms/internal/zzaml;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaki;->bgc:Lcom/google/android/gms/internal/zzakh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaki;->bgb:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/gms/internal/zzakh;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzald;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/List;)Lcom/google/android/gms/internal/zzaml;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaml;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/google/android/gms/internal/zzaml;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/gms/internal/zzaki;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/List;Z)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/List;Z)Lcom/google/android/gms/internal/zzaml;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaml;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;Z)",
            "Lcom/google/android/gms/internal/zzaml;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaki;->bgc:Lcom/google/android/gms/internal/zzakh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaki;->bgb:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/google/android/gms/internal/zzakh;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Ljava/util/List;Z)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaki;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzaki;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaki;->bgb:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzajq;->zza(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaki;->bgc:Lcom/google/android/gms/internal/zzakh;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzaki;-><init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakh;)V

    return-object v0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzaki;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/List;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method

.method public zzd(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaki;->bgc:Lcom/google/android/gms/internal/zzakh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaki;->bgb:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/internal/zzakh;->zzj(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method

.method public zzv(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaki;->bgc:Lcom/google/android/gms/internal/zzakh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaki;->bgb:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzajq;->zzh(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzakh;->zzv(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method
