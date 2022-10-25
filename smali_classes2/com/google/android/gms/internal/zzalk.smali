.class public Lcom/google/android/gms/internal/zzalk;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzalk$zza;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final bhG:Lcom/google/android/gms/internal/zzalk;


# instance fields
.field private bhC:Lcom/google/android/gms/internal/zzamf;

.field private bhH:Ljava/lang/Integer;

.field private bhI:Lcom/google/android/gms/internal/zzalk$zza;

.field private bhJ:Lcom/google/android/gms/internal/zzaml;

.field private bhK:Lcom/google/android/gms/internal/zzalz;

.field private bhL:Lcom/google/android/gms/internal/zzaml;

.field private bhM:Lcom/google/android/gms/internal/zzalz;

.field private bhN:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzalk;->$assertionsDisabled:Z

    new-instance v0, Lcom/google/android/gms/internal/zzalk;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzalk;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzalk;->bhG:Lcom/google/android/gms/internal/zzalk;

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    invoke-static {}, Lcom/google/android/gms/internal/zzamo;->b()Lcom/google/android/gms/internal/zzamo;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhN:Ljava/lang/String;

    return-void
.end method

.method public static zzcd(Ljava/util/Map;)Lcom/google/android/gms/internal/zzalk;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/internal/zzalk;"
        }
    .end annotation

    new-instance v1, Lcom/google/android/gms/internal/zzalk;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzalk;-><init>()V

    const-string/jumbo v0, "l"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, v1, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    const-string/jumbo v0, "sp"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "sp"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzalk;->zze(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    const-string/jumbo v0, "sn"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzalz;->zzsx(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    :cond_0
    const-string/jumbo v0, "ep"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "ep"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzalk;->zze(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    const-string/jumbo v0, "en"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-static {v0}, Lcom/google/android/gms/internal/zzalz;->zzsx(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    :cond_1
    const-string/jumbo v0, "vf"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_2

    const-string/jumbo v2, "l"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lcom/google/android/gms/internal/zzalk$zza;->bhP:Lcom/google/android/gms/internal/zzalk$zza;

    :goto_0
    iput-object v0, v1, Lcom/google/android/gms/internal/zzalk;->bhI:Lcom/google/android/gms/internal/zzalk$zza;

    :cond_2
    const-string/jumbo v0, "i"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_3

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamf;->zzsy(Ljava/lang/String;)Lcom/google/android/gms/internal/zzamf;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    :cond_3
    return-object v1

    :cond_4
    sget-object v0, Lcom/google/android/gms/internal/zzalk$zza;->bhQ:Lcom/google/android/gms/internal/zzalk$zza;

    goto :goto_0
.end method

.method private zzcyb()Lcom/google/android/gms/internal/zzalk;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzalk;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzalk;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhI:Lcom/google/android/gms/internal/zzalk$zza;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhI:Lcom/google/android/gms/internal/zzalk$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    return-object v0
.end method

.method private static zze(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 4

    instance-of v0, p0, Lcom/google/android/gms/internal/zzamr;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/google/android/gms/internal/zzaly;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/google/android/gms/internal/zzamd;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/google/android/gms/internal/zzame;

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    instance-of v0, p0, Lcom/google/android/gms/internal/zzamj;

    if-eqz v0, :cond_2

    new-instance v1, Lcom/google/android/gms/internal/zzamd;

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->doubleValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/internal/zzamd;-><init>(Ljava/lang/Double;Lcom/google/android/gms/internal/zzaml;)V

    move-object p0, v1

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x2b

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Unexpected value passed to normalizeValue: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
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
    check-cast p1, Lcom/google/android/gms/internal/zzalk;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    :cond_4
    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v2, p1, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    if-nez v2, :cond_4

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    :cond_7
    move v0, v1

    goto :goto_0

    :cond_8
    iget-object v2, p1, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    if-nez v2, :cond_7

    :cond_9
    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    if-eqz v2, :cond_b

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    :cond_a
    move v0, v1

    goto :goto_0

    :cond_b
    iget-object v2, p1, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    if-nez v2, :cond_a

    :cond_c
    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    if-eqz v2, :cond_e

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    :cond_d
    move v0, v1

    goto :goto_0

    :cond_e
    iget-object v2, p1, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    if-nez v2, :cond_d

    :cond_f
    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    if-eqz v2, :cond_11

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    :cond_10
    move v0, v1

    goto :goto_0

    :cond_11
    iget-object v2, p1, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    if-nez v2, :cond_10

    :cond_12
    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    if-eqz v2, :cond_14

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_15

    :cond_13
    move v0, v1

    goto/16 :goto_0

    :cond_14
    iget-object v2, p1, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    if-nez v2, :cond_13

    :cond_15
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcyc()Z

    move-result v2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcyc()Z

    move-result v3

    if-eq v2, v3, :cond_0

    move v0, v1

    goto/16 :goto_0
.end method

.method public getLimit()I
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxy()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Cannot get limit if limit has not been set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcyc()Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0x4cf

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->hashCode()I

    move-result v0

    :goto_3
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->hashCode()I

    move-result v0

    :goto_5
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_0
    add-int/2addr v0, v1

    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    const/16 v0, 0x4d5

    goto :goto_1

    :cond_3
    move v0, v1

    goto :goto_2

    :cond_4
    move v0, v1

    goto :goto_3

    :cond_5
    move v0, v1

    goto :goto_4

    :cond_6
    move v0, v1

    goto :goto_5
.end method

.method public isDefault()Z
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-static {}, Lcom/google/android/gms/internal/zzamo;->b()Lcom/google/android/gms/internal/zzamo;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isValid()Z
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxy()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxz()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcyd()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzalk;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzalk;->zzcyb()Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    iput-object p1, v0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzalk;
    .locals 1

    sget-boolean v0, Lcom/google/android/gms/internal/zzalk;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/zzamj;

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/internal/zzann;->zzcx(Z)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzalk;->zzcyb()Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    iput-object p1, v0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    iput-object p2, v0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzafy(I)Lcom/google/android/gms/internal/zzalk;
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzalk;->zzcyb()Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    sget-object v1, Lcom/google/android/gms/internal/zzalk$zza;->bhP:Lcom/google/android/gms/internal/zzalk$zza;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhI:Lcom/google/android/gms/internal/zzalk$zza;

    return-object v0
.end method

.method public zzafz(I)Lcom/google/android/gms/internal/zzalk;
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzalk;->zzcyb()Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    sget-object v1, Lcom/google/android/gms/internal/zzalk$zza;->bhQ:Lcom/google/android/gms/internal/zzalk$zza;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzalk;->bhI:Lcom/google/android/gms/internal/zzalk$zza;

    return-object v0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzalk;
    .locals 1

    sget-boolean v0, Lcom/google/android/gms/internal/zzalk;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/zzamj;

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/internal/zzann;->zzcx(Z)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzalk;->zzcyb()Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    iput-object p1, v0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    iput-object p2, v0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcxs()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcxt()Lcom/google/android/gms/internal/zzaml;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Cannot get index start value if start has not been set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    return-object v0
.end method

.method public zzcxu()Lcom/google/android/gms/internal/zzalz;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Cannot get index start name if start has not been set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    :goto_0
    return-object v0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyx()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    goto :goto_0
.end method

.method public zzcxv()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcxw()Lcom/google/android/gms/internal/zzaml;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Cannot get index end value if start has not been set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    return-object v0
.end method

.method public zzcxx()Lcom/google/android/gms/internal/zzalz;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Cannot get index end name if start has not been set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    :goto_0
    return-object v0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyy()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    goto :goto_0
.end method

.method public zzcxy()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcxz()Z
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxy()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhI:Lcom/google/android/gms/internal/zzalk$zza;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcya()Lcom/google/android/gms/internal/zzamf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    return-object v0
.end method

.method public zzcyc()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhI:Lcom/google/android/gms/internal/zzalk$zza;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhI:Lcom/google/android/gms/internal/zzalk$zza;

    sget-object v1, Lcom/google/android/gms/internal/zzalk$zza;->bhP:Lcom/google/android/gms/internal/zzalk$zza;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    goto :goto_0
.end method

.method public zzcyd()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "sp"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhJ:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "sn"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhK:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "ep"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhL:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "en"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhM:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    if-eqz v0, :cond_3

    const-string/jumbo v0, "l"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhH:Ljava/lang/Integer;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhI:Lcom/google/android/gms/internal/zzalk$zza;

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object v0, Lcom/google/android/gms/internal/zzalk$zza;->bhP:Lcom/google/android/gms/internal/zzalk$zza;

    :cond_2
    :goto_0
    sget-object v2, Lcom/google/android/gms/internal/zzalk$1;->bhO:[I

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk$zza;->ordinal()I

    move-result v0

    aget v0, v2, v0

    packed-switch v0, :pswitch_data_0

    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-static {}, Lcom/google/android/gms/internal/zzamo;->b()Lcom/google/android/gms/internal/zzamo;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "i"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalk;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzamf;->zzczt()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    return-object v1

    :cond_5
    sget-object v0, Lcom/google/android/gms/internal/zzalk$zza;->bhQ:Lcom/google/android/gms/internal/zzalk$zza;

    goto :goto_0

    :pswitch_0
    const-string/jumbo v0, "vf"

    const-string/jumbo v2, "l"

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :pswitch_1
    const-string/jumbo v0, "vf"

    const-string/jumbo v2, "r"

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public zzcye()Z
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxy()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcyf()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhN:Ljava/lang/String;

    if-nez v0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcyd()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzane;->zzce(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhN:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalk;->bhN:Ljava/lang/String;

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zzcyg()Lcom/google/android/gms/internal/zzals;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzalq;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzalq;-><init>(Lcom/google/android/gms/internal/zzamf;)V

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzalk;->zzcxy()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzalr;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzalr;-><init>(Lcom/google/android/gms/internal/zzalk;)V

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/zzalt;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzalt;-><init>(Lcom/google/android/gms/internal/zzalk;)V

    goto :goto_0
.end method
