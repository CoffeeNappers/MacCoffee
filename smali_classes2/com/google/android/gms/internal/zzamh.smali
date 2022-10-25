.class public Lcom/google/android/gms/internal/zzamh;
.super Lcom/google/android/gms/internal/zzamf;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final biU:Lcom/google/android/gms/internal/zzamh;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzamh;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzamh;->$assertionsDisabled:Z

    new-instance v0, Lcom/google/android/gms/internal/zzamh;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzamh;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzamh;->biU:Lcom/google/android/gms/internal/zzamh;

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamf;-><init>()V

    return-void
.end method

.method public static zzczx()Lcom/google/android/gms/internal/zzamh;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzamh;->biU:Lcom/google/android/gms/internal/zzamh;

    return-object v0
.end method


# virtual methods
.method public synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzamk;

    check-cast p2, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzamh;->zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lcom/google/android/gms/internal/zzamh;

    return v0
.end method

.method public hashCode()I
    .locals 1

    const/16 v0, 0x25

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "KeyIndex"

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;)I
    .locals 2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalz;->zzi(Lcom/google/android/gms/internal/zzalz;)I

    move-result v0

    return v0
.end method

.method public zzczs()Lcom/google/android/gms/internal/zzamk;
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/zzamk;->zzczz()Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    return-object v0
.end method

.method public zzczt()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, ".key"

    return-object v0
.end method

.method public zzg(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamk;
    .locals 3

    sget-boolean v0, Lcom/google/android/gms/internal/zzamh;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    instance-of v0, p2, Lcom/google/android/gms/internal/zzamr;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/zzamk;

    invoke-interface {p2}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzalz;->zzsx(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    return-object v1
.end method

.method public zzm(Lcom/google/android/gms/internal/zzaml;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
