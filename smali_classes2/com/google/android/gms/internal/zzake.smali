.class public Lcom/google/android/gms/internal/zzake;
.super Ljava/lang/Object;


# instance fields
.field private final aZr:Lcom/google/android/gms/internal/zzajq;

.field private final bfM:J

.field private final bfN:Lcom/google/android/gms/internal/zzaml;

.field private final bfO:Lcom/google/android/gms/internal/zzajh;

.field private final bfP:Z


# direct methods
.method public constructor <init>(JLcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzake;->bfM:J

    iput-object p3, p0, Lcom/google/android/gms/internal/zzake;->aZr:Lcom/google/android/gms/internal/zzajq;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzake;->bfP:Z

    return-void
.end method

.method public constructor <init>(JLcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzake;->bfM:J

    iput-object p3, p0, Lcom/google/android/gms/internal/zzake;->aZr:Lcom/google/android/gms/internal/zzajq;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    iput-boolean p5, p0, Lcom/google/android/gms/internal/zzake;->bfP:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

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
    check-cast p1, Lcom/google/android/gms/internal/zzake;

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzake;->bfM:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzake;->bfM:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzake;->aZr:Lcom/google/android/gms/internal/zzajq;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzake;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzajq;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    move v0, v1

    goto :goto_0

    :cond_5
    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzake;->bfP:Z

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzake;->bfP:Z

    if-eq v2, v3, :cond_6

    move v0, v1

    goto :goto_0

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_7
    iget-object v2, p0, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzajh;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :goto_1
    move v0, v1

    goto :goto_0

    :cond_8
    iget-object v2, p1, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    if-eqz v2, :cond_7

    :cond_9
    move v0, v1

    goto :goto_0

    :cond_a
    iget-object v2, p1, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    if-eqz v2, :cond_0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 4

    const/4 v1, 0x0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzake;->bfM:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzake;->bfP:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzake;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajq;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajh;->hashCode()I

    move-result v1

    :cond_0
    add-int/2addr v0, v1

    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public isVisible()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzake;->bfP:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzake;->bfM:J

    iget-object v2, p0, Lcom/google/android/gms/internal/zzake;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzake;->bfP:Z

    iget-object v4, p0, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x4e

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v7, "UserWriteRecord{id="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " path="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " visible="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " overwrite="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " merge="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzcrc()Lcom/google/android/gms/internal/zzajq;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzake;->aZr:Lcom/google/android/gms/internal/zzajq;

    return-object v0
.end method

.method public zzcwd()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzake;->bfM:J

    return-wide v0
.end method

.method public zzcwe()Lcom/google/android/gms/internal/zzaml;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t access overwrite when write is a merge!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    return-object v0
.end method

.method public zzcwf()Lcom/google/android/gms/internal/zzajh;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t access merge when write is an overwrite!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzake;->bfO:Lcom/google/android/gms/internal/zzajh;

    return-object v0
.end method

.method public zzcwg()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzake;->bfN:Lcom/google/android/gms/internal/zzaml;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
