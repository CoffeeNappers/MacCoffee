.class public Lcom/google/android/gms/internal/zzakk;
.super Lcom/google/android/gms/internal/zzakn;


# instance fields
.field private final bgf:Z

.field private final bgg:Lcom/google/android/gms/internal/zzakz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/zzakn$zza;->bgm:Lcom/google/android/gms/internal/zzakn$zza;

    sget-object v1, Lcom/google/android/gms/internal/zzako;->bgp:Lcom/google/android/gms/internal/zzako;

    invoke-direct {p0, v0, v1, p1}, Lcom/google/android/gms/internal/zzakn;-><init>(Lcom/google/android/gms/internal/zzakn$zza;Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;)V

    iput-object p2, p0, Lcom/google/android/gms/internal/zzakk;->bgg:Lcom/google/android/gms/internal/zzakz;

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzakk;->bgf:Z

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "AckUserWrite { path=%s, revert=%s, affectedTree=%s }"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzakk;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzakk;->bgf:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakk;->bgg:Lcom/google/android/gms/internal/zzakz;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakn;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakk;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakk;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string/jumbo v1, "operationForChild called for unrelated child."

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzann;->zzb(ZLjava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/zzakk;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakk;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakk;->bgg:Lcom/google/android/gms/internal/zzakz;

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzakk;->bgf:Z

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzakk;-><init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz;Z)V

    move-object p0, v0

    :goto_0
    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakk;->bgg:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakk;->bgg:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->zzcxf()Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->isEmpty()Z

    move-result v0

    const-string/jumbo v1, "affectedTree should not have overlapping affected paths."

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzann;->zzb(ZLjava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakk;->bgg:Lcom/google/android/gms/internal/zzakz;

    new-instance v1, Lcom/google/android/gms/internal/zzajq;

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/google/android/gms/internal/zzalz;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzajq;-><init>([Lcom/google/android/gms/internal/zzalz;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzakz;->zzai(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/internal/zzakk;

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzakk;->bgf:Z

    invoke-direct {v0, v2, v1, v3}, Lcom/google/android/gms/internal/zzakk;-><init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz;Z)V

    move-object p0, v0

    goto :goto_0
.end method

.method public zzcwm()Lcom/google/android/gms/internal/zzakz;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakk;->bgg:Lcom/google/android/gms/internal/zzakz;

    return-object v0
.end method

.method public zzcwn()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzakk;->bgf:Z

    return v0
.end method
