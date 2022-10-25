.class public Lcom/google/android/gms/internal/zzakp;
.super Lcom/google/android/gms/internal/zzakn;


# instance fields
.field private final bgx:Lcom/google/android/gms/internal/zzaml;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzakn$zza;->bgk:Lcom/google/android/gms/internal/zzakn$zza;

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/gms/internal/zzakn;-><init>(Lcom/google/android/gms/internal/zzakn$zza;Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/zzakp;->bgx:Lcom/google/android/gms/internal/zzaml;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "Overwrite { path=%s, source=%s, snapshot=%s }"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzakp;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzakp;->zzcwp()Lcom/google/android/gms/internal/zzako;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakp;->bgx:Lcom/google/android/gms/internal/zzaml;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakn;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakp;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzakp;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakp;->bgj:Lcom/google/android/gms/internal/zzako;

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakp;->bgx:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v3, p1}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzakp;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzakp;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakp;->bgj:Lcom/google/android/gms/internal/zzako;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakp;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakp;->bgx:Lcom/google/android/gms/internal/zzaml;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzakp;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    goto :goto_0
.end method

.method public zzcwv()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakp;->bgx:Lcom/google/android/gms/internal/zzaml;

    return-object v0
.end method
