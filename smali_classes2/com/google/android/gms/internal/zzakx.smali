.class public Lcom/google/android/gms/internal/zzakx;
.super Ljava/lang/Object;


# instance fields
.field public final bgL:Lcom/google/android/gms/internal/zzall;

.field public final bgM:J

.field public final bgN:Z

.field public final bgO:Z

.field public final id:J


# direct methods
.method public constructor <init>(JLcom/google/android/gms/internal/zzall;JZZ)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzakx;->id:J

    invoke-virtual {p3}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p3}, Lcom/google/android/gms/internal/zzall;->isDefault()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t create TrackedQuery for a non-default query that loads all data"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p3, p0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    iput-wide p4, p0, Lcom/google/android/gms/internal/zzakx;->bgM:J

    iput-boolean p6, p0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    iput-boolean p7, p0, Lcom/google/android/gms/internal/zzakx;->bgO:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    check-cast p1, Lcom/google/android/gms/internal/zzakx;

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzakx;->id:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzakx;->id:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzall;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzakx;->bgM:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzakx;->bgM:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_4

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    if-ne v2, v3, :cond_4

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzakx;->bgO:Z

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzakx;->bgO:Z

    if-eq v2, v3, :cond_0

    :cond_4
    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzakx;->id:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzakx;->bgM:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzakx;->bgO:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzakx;->id:J

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzakx;->bgM:J

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    iget-boolean v6, p0, Lcom/google/android/gms/internal/zzakx;->bgO:Z

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x6d

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v8, "TrackedQuery{id="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", querySpec="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lastUse="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", complete="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", active="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzcm(J)Lcom/google/android/gms/internal/zzakx;
    .locals 9

    new-instance v0, Lcom/google/android/gms/internal/zzakx;

    iget-wide v1, p0, Lcom/google/android/gms/internal/zzakx;->id:J

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    iget-boolean v6, p0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    iget-boolean v7, p0, Lcom/google/android/gms/internal/zzakx;->bgO:Z

    move-wide v4, p1

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzakx;-><init>(JLcom/google/android/gms/internal/zzall;JZZ)V

    return-object v0
.end method

.method public zzcxa()Lcom/google/android/gms/internal/zzakx;
    .locals 8

    new-instance v0, Lcom/google/android/gms/internal/zzakx;

    iget-wide v1, p0, Lcom/google/android/gms/internal/zzakx;->id:J

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzakx;->bgM:J

    const/4 v6, 0x1

    iget-boolean v7, p0, Lcom/google/android/gms/internal/zzakx;->bgO:Z

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzakx;-><init>(JLcom/google/android/gms/internal/zzall;JZZ)V

    return-object v0
.end method

.method public zzdc(Z)Lcom/google/android/gms/internal/zzakx;
    .locals 8

    new-instance v0, Lcom/google/android/gms/internal/zzakx;

    iget-wide v1, p0, Lcom/google/android/gms/internal/zzakx;->id:J

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzakx;->bgM:J

    iget-boolean v6, p0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    move v7, p1

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzakx;-><init>(JLcom/google/android/gms/internal/zzall;JZZ)V

    return-object v0
.end method
