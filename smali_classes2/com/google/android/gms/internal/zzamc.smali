.class public Lcom/google/android/gms/internal/zzamc;
.super Lcom/google/android/gms/internal/zzami;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzami",
        "<",
        "Lcom/google/android/gms/internal/zzamc;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private biO:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzamc;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzamc;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/util/Map;Lcom/google/android/gms/internal/zzaml;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzaml;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzami;-><init>(Lcom/google/android/gms/internal/zzaml;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzamc;->biO:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    instance-of v1, p1, Lcom/google/android/gms/internal/zzamc;

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzamc;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamc;->biO:Ljava/util/Map;

    iget-object v2, p1, Lcom/google/android/gms/internal/zzamc;->biO:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamc;->biz:Lcom/google/android/gms/internal/zzaml;

    iget-object v2, p1, Lcom/google/android/gms/internal/zzamc;->biz:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamc;->biO:Ljava/util/Map;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamc;->biO:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamc;->biz:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method protected bridge synthetic zza(Lcom/google/android/gms/internal/zzami;)I
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzamc;

    const/4 v0, 0x0

    return v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzaml$zza;)Ljava/lang/String;
    .locals 5

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzamc;->zzb(Lcom/google/android/gms/internal/zzaml$zza;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamc;->biO:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0xe

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "deferredValue:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected zzcyw()Lcom/google/android/gms/internal/zzami$zza;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzami$zza;->biW:Lcom/google/android/gms/internal/zzami$zza;

    return-object v0
.end method

.method public synthetic zzg(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzamc;->zzj(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamc;

    move-result-object v0

    return-object v0
.end method

.method public zzj(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamc;
    .locals 2

    sget-boolean v0, Lcom/google/android/gms/internal/zzamc;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzamp;->zzq(Lcom/google/android/gms/internal/zzaml;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzamc;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamc;->biO:Ljava/util/Map;

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/zzamc;-><init>(Ljava/util/Map;Lcom/google/android/gms/internal/zzaml;)V

    return-object v0
.end method
