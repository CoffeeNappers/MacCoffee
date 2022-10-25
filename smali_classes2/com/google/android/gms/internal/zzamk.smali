.class public Lcom/google/android/gms/internal/zzamk;
.super Ljava/lang/Object;


# static fields
.field private static final bjb:Lcom/google/android/gms/internal/zzamk;

.field private static final bjc:Lcom/google/android/gms/internal/zzamk;


# instance fields
.field private final bhe:Lcom/google/android/gms/internal/zzalz;

.field private final biS:Lcom/google/android/gms/internal/zzaml;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzamk;

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyx()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    sput-object v0, Lcom/google/android/gms/internal/zzamk;->bjb:Lcom/google/android/gms/internal/zzamk;

    new-instance v0, Lcom/google/android/gms/internal/zzamk;

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyy()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/zzaml;->bjd:Lcom/google/android/gms/internal/zzama;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    sput-object v0, Lcom/google/android/gms/internal/zzamk;->bjc:Lcom/google/android/gms/internal/zzamk;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzamk;->bhe:Lcom/google/android/gms/internal/zzalz;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzamk;->biS:Lcom/google/android/gms/internal/zzaml;

    return-void
.end method

.method public static zzczy()Lcom/google/android/gms/internal/zzamk;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzamk;->bjb:Lcom/google/android/gms/internal/zzamk;

    return-object v0
.end method

.method public static zzczz()Lcom/google/android/gms/internal/zzamk;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzamk;->bjc:Lcom/google/android/gms/internal/zzamk;

    return-object v0
.end method


# virtual methods
.method public a()Lcom/google/android/gms/internal/zzalz;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamk;->bhe:Lcom/google/android/gms/internal/zzalz;

    return-object v0
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
    check-cast p1, Lcom/google/android/gms/internal/zzamk;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzamk;->bhe:Lcom/google/android/gms/internal/zzalz;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzamk;->bhe:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzamk;->biS:Lcom/google/android/gms/internal/zzaml;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzamk;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamk;->bhe:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamk;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamk;->bhe:Lcom/google/android/gms/internal/zzalz;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamk;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x17

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "NamedNode{name="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ", node="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzcqy()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamk;->biS:Lcom/google/android/gms/internal/zzaml;

    return-object v0
.end method
