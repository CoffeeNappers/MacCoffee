.class public Lcom/google/android/gms/internal/zzamb;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzamb$zza;,
        Lcom/google/android/gms/internal/zzamb$zzb;,
        Lcom/google/android/gms/internal/zzamb$zzc;
    }
.end annotation


# instance fields
.field private final baC:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajq;",
            ">;"
        }
    .end annotation
.end field

.field private final baD:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajq;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Number of posts need to be n-1 for n hashes in CompoundHash"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzamb;->baC:Ljava/util/List;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzamb;->baD:Ljava/util/List;

    return-void
.end method

.method public static zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamb$zzc;)Lcom/google/android/gms/internal/zzamb;
    .locals 3

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzamb;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzamb;-><init>(Ljava/util/List;Ljava/util/List;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/zzamb$zza;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzamb$zza;-><init>(Lcom/google/android/gms/internal/zzamb$zzc;)V

    invoke-static {p0, v1}, Lcom/google/android/gms/internal/zzamb;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamb$zza;)V

    invoke-static {v1}, Lcom/google/android/gms/internal/zzamb$zza;->zza(Lcom/google/android/gms/internal/zzamb$zza;)V

    new-instance v0, Lcom/google/android/gms/internal/zzamb;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzamb$zza;->zzb(Lcom/google/android/gms/internal/zzamb$zza;)Ljava/util/List;

    move-result-object v2

    invoke-static {v1}, Lcom/google/android/gms/internal/zzamb$zza;->zzc(Lcom/google/android/gms/internal/zzamb$zza;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/google/android/gms/internal/zzamb;-><init>(Ljava/util/List;Ljava/util/List;)V

    goto :goto_0
.end method

.method private static zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamb$zza;)V
    .locals 4

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v0

    if-eqz v0, :cond_0

    check-cast p0, Lcom/google/android/gms/internal/zzami;

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzamb$zza;->zza(Lcom/google/android/gms/internal/zzamb$zza;Lcom/google/android/gms/internal/zzami;)V

    :goto_0
    return-void

    :cond_0
    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t calculate hash on empty node!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    instance-of v0, p0, Lcom/google/android/gms/internal/zzama;

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x21

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Expected children node, but got: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    check-cast p0, Lcom/google/android/gms/internal/zzama;

    new-instance v0, Lcom/google/android/gms/internal/zzamb$1;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzamb$1;-><init>(Lcom/google/android/gms/internal/zzamb$zza;)V

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzama;->zza(Lcom/google/android/gms/internal/zzama$zza;Z)V

    goto :goto_0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamb$zza;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzamb;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamb$zza;)V

    return-void
.end method

.method public static zzi(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamb;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzamb$zzb;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzamb$zzb;-><init>(Lcom/google/android/gms/internal/zzaml;)V

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/zzamb;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamb$zzc;)Lcom/google/android/gms/internal/zzamb;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public zzcsf()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajq;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb;->baC:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zzcsg()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb;->baD:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
