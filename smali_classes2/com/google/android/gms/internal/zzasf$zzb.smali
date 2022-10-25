.class public final Lcom/google/android/gms/internal/zzasf$zzb;
.super Lcom/google/android/gms/internal/zzaru;

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzasf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzb"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzaru",
        "<",
        "Lcom/google/android/gms/internal/zzasf$zzb;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# instance fields
.field public bud:[B

.field public bue:Ljava/lang/String;

.field public buf:[[B

.field public bug:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaru;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzasf$zzb;->cD()Lcom/google/android/gms/internal/zzasf$zzb;

    return-void
.end method


# virtual methods
.method public cD()Lcom/google/android/gms/internal/zzasf$zzb;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzasd;->btY:[B

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bud:[B

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzasd;->btX:[[B

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bug:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->btG:Lcom/google/android/gms/internal/zzarw;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->btP:I

    return-object p0
.end method

.method public cE()Lcom/google/android/gms/internal/zzasf$zzb;
    .locals 2

    :try_start_0
    invoke-super {p0}, Lcom/google/android/gms/internal/zzaru;->cn()Lcom/google/android/gms/internal/zzaru;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzasf$zzb;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    array-length v1, v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    invoke-virtual {v1}, [[B->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[B

    iput-object v1, v0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    :cond_0
    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzasf$zzb;->cE()Lcom/google/android/gms/internal/zzasf$zzb;

    move-result-object v0

    return-object v0
.end method

.method public synthetic cn()Lcom/google/android/gms/internal/zzaru;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzasf$zzb;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzasf$zzb;

    return-object v0
.end method

.method public synthetic co()Lcom/google/android/gms/internal/zzasa;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzasf$zzb;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzasf$zzb;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v0, 0x0

    if-ne p1, p0, :cond_1

    move v0, v1

    :cond_0
    :goto_0
    return v0

    :cond_1
    instance-of v2, p1, Lcom/google/android/gms/internal/zzasf$zzb;

    if-eqz v2, :cond_0

    check-cast p1, Lcom/google/android/gms/internal/zzasf$zzb;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bud:[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzb;->bud:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    if-nez v2, :cond_5

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    if-nez v2, :cond_0

    :cond_2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzary;->zza([[B[[B)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bug:Z

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzasf$zzb;->bug:Z

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_3
    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzb;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v2, :cond_4

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzb;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_4
    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->btG:Lcom/google/android/gms/internal/zzarw;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzasf$zzb;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzarw;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bud:[B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    invoke-static {v2}, Lcom/google/android/gms/internal/zzary;->zzb([[B)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bug:Z

    if-eqz v0, :cond_2

    const/16 v0, 0x4cf

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_0
    :goto_2
    add-int/2addr v0, v1

    return v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_2
    const/16 v0, 0x4d5

    goto :goto_1

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzarw;->hashCode()I

    move-result v1

    goto :goto_2
.end method

.method public zza(Lcom/google/android/gms/internal/zzart;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bud:[B

    sget-object v1, Lcom/google/android/gms/internal/zzasd;->btY:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bud:[B

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzb(I[B)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    array-length v0, v0

    if-lez v0, :cond_2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    array-length v1, v1

    if-ge v0, v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    const/4 v2, 0x2

    invoke-virtual {p1, v2, v1}, Lcom/google/android/gms/internal/zzart;->zzb(I[B)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bug:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x3

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bug:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzg(IZ)V

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const/4 v0, 0x4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzq(ILjava/lang/String;)V

    :cond_4
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzaru;->zza(Lcom/google/android/gms/internal/zzart;)V

    return-void
.end method

.method public synthetic zzb(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzasa;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzasf$zzb;->zzcp(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzasf$zzb;

    move-result-object v0

    return-object v0
.end method

.method public zzcp(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzasf$zzb;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1, v0}, Lcom/google/android/gms/internal/zzaru;->zza(Lcom/google/android/gms/internal/zzars;I)Z

    move-result v0

    if-nez v0, :cond_0

    :sswitch_0
    return-object p0

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bud:[B

    goto :goto_0

    :sswitch_2
    const/16 v0, 0x12

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzasd;->zzc(Lcom/google/android/gms/internal/zzars;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    if-nez v0, :cond_2

    move v0, v1

    :goto_1
    add-int/2addr v2, v0

    new-array v2, v2, [[B

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    :goto_2
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readBytes()[B

    move-result-object v3

    aput-object v3, v2, v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    array-length v0, v0

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readBytes()[B

    move-result-object v3

    aput-object v3, v2, v0

    iput-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->ca()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bug:Z

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_2
        0x18 -> :sswitch_3
        0x22 -> :sswitch_4
    .end sparse-switch
.end method

.method protected zzx()I
    .locals 5

    const/4 v1, 0x0

    invoke-super {p0}, Lcom/google/android/gms/internal/zzaru;->zzx()I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bud:[B

    sget-object v3, Lcom/google/android/gms/internal/zzasd;->btY:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bud:[B

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzc(I[B)I

    move-result v2

    add-int/2addr v0, v2

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    array-length v2, v2

    if-lez v2, :cond_3

    move v2, v1

    move v3, v1

    :goto_0
    iget-object v4, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    array-length v4, v4

    if-ge v1, v4, :cond_2

    iget-object v4, p0, Lcom/google/android/gms/internal/zzasf$zzb;->buf:[[B

    aget-object v4, v4, v1

    if-eqz v4, :cond_1

    add-int/lit8 v3, v3, 0x1

    invoke-static {v4}, Lcom/google/android/gms/internal/zzart;->zzbg([B)I

    move-result v4

    add-int/2addr v2, v4

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    add-int/2addr v0, v2

    mul-int/lit8 v1, v3, 0x1

    add-int/2addr v0, v1

    :cond_3
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bug:Z

    if-eqz v1, :cond_4

    const/4 v1, 0x3

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bug:Z

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzh(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzb;->bue:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzr(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_5
    return v0
.end method
