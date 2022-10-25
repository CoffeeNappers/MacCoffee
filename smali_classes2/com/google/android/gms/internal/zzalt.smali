.class public Lcom/google/android/gms/internal/zzalt;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzals;


# instance fields
.field private final bhC:Lcom/google/android/gms/internal/zzamf;

.field private final bii:Lcom/google/android/gms/internal/zzalq;

.field private final bij:Lcom/google/android/gms/internal/zzamk;

.field private final bik:Lcom/google/android/gms/internal/zzamk;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzalk;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzalq;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzalq;-><init>(Lcom/google/android/gms/internal/zzamf;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bii:Lcom/google/android/gms/internal/zzalq;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzalt;->zzd(Lcom/google/android/gms/internal/zzalk;)Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bij:Lcom/google/android/gms/internal/zzamk;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzalt;->zze(Lcom/google/android/gms/internal/zzalk;)Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bik:Lcom/google/android/gms/internal/zzamk;

    return-void
.end method

.method private static zzd(Lcom/google/android/gms/internal/zzalk;)Lcom/google/android/gms/internal/zzamk;
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxu()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxt()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzamf;->zzg(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamf;->zzczr()Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    goto :goto_0
.end method

.method private static zze(Lcom/google/android/gms/internal/zzalk;)Lcom/google/android/gms/internal/zzamk;
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxx()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxw()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzamf;->zzg(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamf;->zzczs()Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzals$zza;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;
    .locals 7

    new-instance v0, Lcom/google/android/gms/internal/zzamk;

    invoke-direct {v0, p2, p3}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzalt;->zza(Lcom/google/android/gms/internal/zzamk;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v3

    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bii:Lcom/google/android/gms/internal/zzalq;

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzalq;->zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzals$zza;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    return-object v0

    :cond_0
    move-object v3, p3

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;
    .locals 4

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalt;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzamg;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bii:Lcom/google/android/gms/internal/zzalq;

    invoke-virtual {v0, p1, v1, p3}, Lcom/google/android/gms/internal/zzalq;->zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/zzamg;->zzo(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamg;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzalt;->zza(Lcom/google/android/gms/internal/zzamk;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Lcom/google/android/gms/internal/zzamg;->zzh(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_1
.end method

.method public zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;
    .locals 0

    return-object p1
.end method

.method public zza(Lcom/google/android/gms/internal/zzamk;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalt;->zzcys()Lcom/google/android/gms/internal/zzamk;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/internal/zzamf;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalt;->zzcyt()Lcom/google/android/gms/internal/zzamk;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzamf;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcya()Lcom/google/android/gms/internal/zzamf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bhC:Lcom/google/android/gms/internal/zzamf;

    return-object v0
.end method

.method public zzcyq()Lcom/google/android/gms/internal/zzals;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bii:Lcom/google/android/gms/internal/zzalq;

    return-object v0
.end method

.method public zzcyr()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public zzcys()Lcom/google/android/gms/internal/zzamk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bij:Lcom/google/android/gms/internal/zzamk;

    return-object v0
.end method

.method public zzcyt()Lcom/google/android/gms/internal/zzamk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalt;->bik:Lcom/google/android/gms/internal/zzamk;

    return-object v0
.end method
