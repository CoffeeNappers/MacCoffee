.class public Lcom/google/android/gms/internal/zzams;
.super Lcom/google/android/gms/internal/zzamf;


# static fields
.field private static final bjm:Lcom/google/android/gms/internal/zzams;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzams;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzams;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzams;->bjm:Lcom/google/android/gms/internal/zzams;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamf;-><init>()V

    return-void
.end method

.method public static d()Lcom/google/android/gms/internal/zzams;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzams;->bjm:Lcom/google/android/gms/internal/zzams;

    return-object v0
.end method


# virtual methods
.method public synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzamk;

    check-cast p2, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzams;->zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lcom/google/android/gms/internal/zzams;

    return v0
.end method

.method public hashCode()I
    .locals 1

    const/4 v0, 0x4

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "ValueIndex"

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;)I
    .locals 2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

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

    new-instance v0, Lcom/google/android/gms/internal/zzamk;

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyy()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/zzaml;->bjd:Lcom/google/android/gms/internal/zzama;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    return-object v0
.end method

.method public zzczt()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, ".value"

    return-object v0
.end method

.method public zzg(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamk;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzamk;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    return-object v0
.end method

.method public zzm(Lcom/google/android/gms/internal/zzaml;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
