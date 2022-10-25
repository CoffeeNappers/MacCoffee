.class public Lcom/google/android/gms/internal/zzakm;
.super Lcom/google/android/gms/internal/zzakn;


# instance fields
.field private final bgh:Lcom/google/android/gms/internal/zzajh;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;)V
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzakn$zza;->bgl:Lcom/google/android/gms/internal/zzakn$zza;

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/gms/internal/zzakn;-><init>(Lcom/google/android/gms/internal/zzakn$zza;Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/zzakm;->bgh:Lcom/google/android/gms/internal/zzajh;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "Merge { path=%s, source=%s, children=%s }"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzakm;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzakm;->zzcwp()Lcom/google/android/gms/internal/zzako;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakm;->bgh:Lcom/google/android/gms/internal/zzajh;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakn;
    .locals 5

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakm;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakm;->bgh:Lcom/google/android/gms/internal/zzajh;

    new-instance v2, Lcom/google/android/gms/internal/zzajq;

    const/4 v3, 0x1

    new-array v3, v3, [Lcom/google/android/gms/internal/zzalz;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/zzajq;-><init>([Lcom/google/android/gms/internal/zzalz;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzajh;->zzg(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajh;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajh;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajh;->zzcuf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    if-eqz v0, :cond_2

    new-instance v0, Lcom/google/android/gms/internal/zzakp;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakm;->bgj:Lcom/google/android/gms/internal/zzako;

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajh;->zzcuf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-direct {v0, v2, v3, v1}, Lcom/google/android/gms/internal/zzakp;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    goto :goto_0

    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/zzakm;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakm;->bgj:Lcom/google/android/gms/internal/zzako;

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-direct {v0, v2, v3, v1}, Lcom/google/android/gms/internal/zzakm;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;)V

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzakm;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzakm;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakm;->bgj:Lcom/google/android/gms/internal/zzako;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakm;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakm;->bgh:Lcom/google/android/gms/internal/zzajh;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzakm;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;)V

    goto :goto_0
.end method

.method public zzcwo()Lcom/google/android/gms/internal/zzajh;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakm;->bgh:Lcom/google/android/gms/internal/zzajh;

    return-object v0
.end method
