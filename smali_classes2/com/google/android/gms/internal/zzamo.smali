.class public Lcom/google/android/gms/internal/zzamo;
.super Lcom/google/android/gms/internal/zzamf;


# static fields
.field private static final bji:Lcom/google/android/gms/internal/zzamo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzamo;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzamo;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzamo;->bji:Lcom/google/android/gms/internal/zzamo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamf;-><init>()V

    return-void
.end method

.method public static b()Lcom/google/android/gms/internal/zzamo;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzamo;->bji:Lcom/google/android/gms/internal/zzamo;

    return-object v0
.end method


# virtual methods
.method public synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzamk;

    check-cast p2, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzamo;->zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lcom/google/android/gms/internal/zzamo;

    return v0
.end method

.method public hashCode()I
    .locals 1

    const v0, 0x302679

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "PriorityIndex"

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;)I
    .locals 4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaml;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v2

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v3

    invoke-static {v2, v0, v3, v1}, Lcom/google/android/gms/internal/zzamm;->zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)I

    move-result v0

    return v0
.end method

.method public zzczs()Lcom/google/android/gms/internal/zzamk;
    .locals 2

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyy()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/zzaml;->bjd:Lcom/google/android/gms/internal/zzama;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzamo;->zzg(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    return-object v0
.end method

.method public zzczt()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t get query definition on priority index!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public zzg(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamk;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzamk;

    new-instance v1, Lcom/google/android/gms/internal/zzamr;

    const-string/jumbo v2, "[PRIORITY-POST]"

    invoke-direct {v1, v2, p2}, Lcom/google/android/gms/internal/zzamr;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzaml;)V

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    return-object v0
.end method

.method public zzm(Lcom/google/android/gms/internal/zzaml;)Z
    .locals 1

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->zzczf()Lcom/google/android/gms/internal/zzaml;

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
