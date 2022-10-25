.class public Lcom/google/android/gms/internal/zzame;
.super Lcom/google/android/gms/internal/zzama;

# interfaces
.implements Lcom/google/android/gms/internal/zzaml;


# static fields
.field private static final biQ:Lcom/google/android/gms/internal/zzame;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzame;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzame;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzame;->biQ:Lcom/google/android/gms/internal/zzame;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzama;-><init>()V

    return-void
.end method

.method public static zzczq()Lcom/google/android/gms/internal/zzame;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzame;->biQ:Lcom/google/android/gms/internal/zzame;

    return-object v0
.end method


# virtual methods
.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzame;->zzh(Lcom/google/android/gms/internal/zzaml;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v1, 0x1

    instance-of v0, p1, Lcom/google/android/gms/internal/zzame;

    if-eqz v0, :cond_0

    :goto_0
    return v1

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/zzaml;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzame;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    check-cast p1, Lcom/google/android/gms/internal/zzaml;

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getChildCount()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getValue(Z)Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/google/android/gms/internal/zzamk;",
            ">;"
        }
    .end annotation

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "<Empty Node>"

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzaml$zza;)Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, ""

    return-object v0
.end method

.method public zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;
    .locals 0

    return-object p0
.end method

.method public zzcrl()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/google/android/gms/internal/zzamk;",
            ">;"
        }
    .end annotation

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public zzczd()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, ""

    return-object v0
.end method

.method public zzcze()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public zzczf()Lcom/google/android/gms/internal/zzaml;
    .locals 0

    return-object p0
.end method

.method public zze(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 1

    invoke-interface {p2}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalz;->zzczb()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzama;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzama;-><init>()V

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzama;->zze(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object p0

    goto :goto_0
.end method

.method public synthetic zzg(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzame;->zzl(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    return-object v0
.end method

.method public zzh(Lcom/google/android/gms/internal/zzaml;)I
    .locals 1

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public zzk(Lcom/google/android/gms/internal/zzalz;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public zzl(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzalz;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public zzl(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzame;
    .locals 0

    return-object p0
.end method

.method public zzl(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p2

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzame;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-interface {v1, v2, p2}, Lcom/google/android/gms/internal/zzaml;->zzl(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzame;->zze(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object p2

    goto :goto_0
.end method

.method public zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;
    .locals 0

    return-object p0
.end method
