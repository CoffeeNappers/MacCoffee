.class public Lcom/google/android/gms/internal/zzamn;
.super Lcom/google/android/gms/internal/zzamf;


# instance fields
.field private final bjh:Lcom/google/android/gms/internal/zzajq;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzajq;)V
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamf;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->zzczb()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t create PathIndex with \'.priority\' as key. Please use PriorityIndex instead!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzamn;->bjh:Lcom/google/android/gms/internal/zzajq;

    return-void
.end method


# virtual methods
.method public synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzamk;

    check-cast p2, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzamn;->zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    check-cast p1, Lcom/google/android/gms/internal/zzamn;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzamn;->bjh:Lcom/google/android/gms/internal/zzajq;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzamn;->bjh:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzajq;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamn;->bjh:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->hashCode()I

    move-result v0

    return v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;)I
    .locals 3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamn;->bjh:Lcom/google/android/gms/internal/zzajq;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaml;->zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzamn;->bjh:Lcom/google/android/gms/internal/zzajq;

    invoke-interface {v1, v2}, Lcom/google/android/gms/internal/zzaml;->zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaml;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalz;->zzi(Lcom/google/android/gms/internal/zzalz;)I

    move-result v0

    :cond_0
    return v0
.end method

.method public zzczs()Lcom/google/android/gms/internal/zzamk;
    .locals 3

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamn;->bjh:Lcom/google/android/gms/internal/zzajq;

    sget-object v2, Lcom/google/android/gms/internal/zzaml;->bjd:Lcom/google/android/gms/internal/zzama;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzame;->zzl(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzamk;

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyy()Lcom/google/android/gms/internal/zzalz;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    return-object v1
.end method

.method public zzczt()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamn;->bjh:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvh()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzg(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamk;
    .locals 2

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamn;->bjh:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0, v1, p2}, Lcom/google/android/gms/internal/zzame;->zzl(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzamk;

    invoke-direct {v1, p1, v0}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    return-object v1
.end method

.method public zzm(Lcom/google/android/gms/internal/zzaml;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamn;->bjh:Lcom/google/android/gms/internal/zzajq;

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/zzaml;->zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
