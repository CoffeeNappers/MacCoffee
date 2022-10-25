.class public final Lcom/google/android/gms/internal/zzaob$zzc;
.super Lcom/google/android/gms/internal/zzaru;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzc"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzaru",
        "<",
        "Lcom/google/android/gms/internal/zzaob$zzc;",
        ">;"
    }
.end annotation


# instance fields
.field public blF:I

.field public blG:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaru;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaob$zzc;->ad()Lcom/google/android/gms/internal/zzaob$zzc;

    return-void
.end method


# virtual methods
.method public ad()Lcom/google/android/gms/internal/zzaob$zzc;
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blF:I

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blG:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->btP:I

    return-object p0
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
    instance-of v2, p1, Lcom/google/android/gms/internal/zzaob$zzc;

    if-eqz v2, :cond_0

    check-cast p1, Lcom/google/android/gms/internal/zzaob$zzc;

    iget v2, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blF:I

    iget v3, p1, Lcom/google/android/gms/internal/zzaob$zzc;->blF:I

    if-ne v2, v3, :cond_0

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blG:Z

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzaob$zzc;->blG:Z

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaob$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaob$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p1, Lcom/google/android/gms/internal/zzaob$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v2, :cond_3

    iget-object v2, p1, Lcom/google/android/gms/internal/zzaob$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzaob$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzarw;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blF:I

    add-int/2addr v0, v1

    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blG:Z

    if-eqz v0, :cond_1

    const/16 v0, 0x4cf

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v1, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    const/4 v0, 0x0

    :goto_1
    add-int/2addr v0, v1

    return v0

    :cond_1
    const/16 v0, 0x4d5

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzarw;->hashCode()I

    move-result v0

    goto :goto_1
.end method

.method public zza(Lcom/google/android/gms/internal/zzart;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blF:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blF:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    :cond_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blG:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blG:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzg(IZ)V

    :cond_1
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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaob$zzc;->zzbe(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzaob$zzc;

    move-result-object v0

    return-object v0
.end method

.method public zzbe(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzaob$zzc;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

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
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blF:I

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->ca()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blG:Z

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
    .end sparse-switch
.end method

.method protected zzx()I
    .locals 3

    invoke-super {p0}, Lcom/google/android/gms/internal/zzaru;->zzx()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blF:I

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    iget v2, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blF:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzah(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blG:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzaob$zzc;->blG:Z

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzh(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    return v0
.end method
