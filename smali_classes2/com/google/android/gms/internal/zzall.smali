.class public Lcom/google/android/gms/internal/zzall;
.super Ljava/lang/Object;


# instance fields
.field private final aZr:Lcom/google/android/gms/internal/zzajq;

.field private final aZv:Lcom/google/android/gms/internal/zzalk;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzall;->aZr:Lcom/google/android/gms/internal/zzajq;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzall;->aZv:Lcom/google/android/gms/internal/zzalk;

    return-void
.end method

.method public static zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzall;

    sget-object v1, Lcom/google/android/gms/internal/zzalk;->bhG:Lcom/google/android/gms/internal/zzalk;

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/zzall;-><init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;)V

    return-object v0
.end method

.method public static zzb(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;)Lcom/google/android/gms/internal/zzall;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/internal/zzall;"
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/internal/zzalk;->zzcd(Ljava/util/Map;)Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzall;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzall;-><init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;)V

    return-object v1
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
    check-cast p1, Lcom/google/android/gms/internal/zzall;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzall;->aZr:Lcom/google/android/gms/internal/zzajq;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzall;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzajq;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzall;->aZv:Lcom/google/android/gms/internal/zzalk;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzall;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzalk;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzall;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzall;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalk;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isDefault()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzall;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk;->isDefault()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzall;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzall;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzcrc()Lcom/google/android/gms/internal/zzajq;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzall;->aZr:Lcom/google/android/gms/internal/zzajq;

    return-object v0
.end method

.method public zzcya()Lcom/google/android/gms/internal/zzamf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzall;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v0

    return-object v0
.end method

.method public zzcye()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzall;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk;->zzcye()Z

    move-result v0

    return v0
.end method

.method public zzcyh()Lcom/google/android/gms/internal/zzalk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzall;->aZv:Lcom/google/android/gms/internal/zzalk;

    return-object v0
.end method
