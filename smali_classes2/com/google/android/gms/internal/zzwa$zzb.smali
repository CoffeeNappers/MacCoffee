.class public final Lcom/google/android/gms/internal/zzwa$zzb;
.super Lcom/google/android/gms/internal/zzasa;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzwa;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzb"
.end annotation


# static fields
.field private static volatile awc:[Lcom/google/android/gms/internal/zzwa$zzb;


# instance fields
.field public awd:Ljava/lang/Integer;

.field public awe:Ljava/lang/String;

.field public awf:[Lcom/google/android/gms/internal/zzwa$zzc;

.field public awg:Ljava/lang/Boolean;

.field public awh:Lcom/google/android/gms/internal/zzwa$zzd;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzasa;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzwa$zzb;->zzbzk()Lcom/google/android/gms/internal/zzwa$zzb;

    return-void
.end method

.method public static zzbzj()[Lcom/google/android/gms/internal/zzwa$zzb;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzwa$zzb;->awc:[Lcom/google/android/gms/internal/zzwa$zzb;

    if-nez v0, :cond_1

    sget-object v1, Lcom/google/android/gms/internal/zzary;->btO:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/android/gms/internal/zzwa$zzb;->awc:[Lcom/google/android/gms/internal/zzwa$zzb;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzwa$zzb;

    sput-object v0, Lcom/google/android/gms/internal/zzwa$zzb;->awc:[Lcom/google/android/gms/internal/zzwa$zzb;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/google/android/gms/internal/zzwa$zzb;->awc:[Lcom/google/android/gms/internal/zzwa$zzb;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    instance-of v2, p1, Lcom/google/android/gms/internal/zzwa$zzb;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    check-cast p1, Lcom/google/android/gms/internal/zzwa$zzb;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    if-nez v2, :cond_3

    iget-object v2, p1, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    if-nez v2, :cond_5

    iget-object v2, p1, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    if-eqz v2, :cond_6

    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    move v0, v1

    goto :goto_0

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzary;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    move v0, v1

    goto :goto_0

    :cond_7
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    if-nez v2, :cond_8

    iget-object v2, p1, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    if-eqz v2, :cond_9

    move v0, v1

    goto :goto_0

    :cond_8
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    move v0, v1

    goto :goto_0

    :cond_9
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    if-nez v2, :cond_a

    iget-object v2, p1, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0

    :cond_a
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzwa$zzd;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

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

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzary;->hashCode([Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    if-nez v0, :cond_2

    move v0, v1

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    if-nez v2, :cond_3

    :goto_3
    add-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->hashCode()I

    move-result v0

    goto :goto_2

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzwa$zzd;->hashCode()I

    move-result v1

    goto :goto_3
.end method

.method public zza(Lcom/google/android/gms/internal/zzart;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzq(ILjava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    array-length v0, v0

    if-lez v0, :cond_3

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    array-length v1, v1

    if-ge v0, v1, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    aget-object v1, v1, v0

    if-eqz v1, :cond_2

    const/4 v2, 0x3

    invoke-virtual {p1, v2, v1}, Lcom/google/android/gms/internal/zzart;->zza(ILcom/google/android/gms/internal/zzasa;)V

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    if-eqz v0, :cond_4

    const/4 v0, 0x4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzg(IZ)V

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    if-eqz v0, :cond_5

    const/4 v0, 0x5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zza(ILcom/google/android/gms/internal/zzasa;)V

    :cond_5
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzasa;->zza(Lcom/google/android/gms/internal/zzart;)V

    return-void
.end method

.method public zzah(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzwa$zzb;
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

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzasd;->zzb(Lcom/google/android/gms/internal/zzars;I)Z

    move-result v0

    if-nez v0, :cond_0

    :sswitch_0
    return-object p0

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    goto :goto_0

    :sswitch_3
    const/16 v0, 0x1a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzasd;->zzc(Lcom/google/android/gms/internal/zzars;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    if-nez v0, :cond_2

    move v0, v1

    :goto_1
    add-int/2addr v2, v0

    new-array v2, v2, [Lcom/google/android/gms/internal/zzwa$zzc;

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    :goto_2
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_3

    new-instance v3, Lcom/google/android/gms/internal/zzwa$zzc;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzwa$zzc;-><init>()V

    aput-object v3, v2, v0

    aget-object v3, v2, v0

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzars;->zza(Lcom/google/android/gms/internal/zzasa;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    array-length v0, v0

    goto :goto_1

    :cond_3
    new-instance v3, Lcom/google/android/gms/internal/zzwa$zzc;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzwa$zzc;-><init>()V

    aput-object v3, v2, v0

    aget-object v0, v2, v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zza(Lcom/google/android/gms/internal/zzasa;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->ca()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    goto :goto_0

    :sswitch_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    if-nez v0, :cond_4

    new-instance v0, Lcom/google/android/gms/internal/zzwa$zzd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzwa$zzd;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zza(Lcom/google/android/gms/internal/zzasa;)V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x12 -> :sswitch_2
        0x1a -> :sswitch_3
        0x20 -> :sswitch_4
        0x2a -> :sswitch_5
    .end sparse-switch
.end method

.method public synthetic zzb(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzasa;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzwa$zzb;->zzah(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzwa$zzb;

    move-result-object v0

    return-object v0
.end method

.method public zzbzk()Lcom/google/android/gms/internal/zzwa$zzb;
    .locals 2

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/internal/zzwa$zzc;->zzbzl()[Lcom/google/android/gms/internal/zzwa$zzc;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzwa$zzb;->btP:I

    return-object p0
.end method

.method protected zzx()I
    .locals 5

    invoke-super {p0}, Lcom/google/android/gms/internal/zzasa;->zzx()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzah(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzr(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    array-length v1, v1

    if-lez v1, :cond_4

    const/4 v1, 0x0

    move v4, v1

    move v1, v0

    move v0, v4

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    array-length v2, v2

    if-ge v0, v2, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    aget-object v2, v2, v0

    if-eqz v2, :cond_2

    const/4 v3, 0x3

    invoke-static {v3, v2}, Lcom/google/android/gms/internal/zzart;->zzc(ILcom/google/android/gms/internal/zzasa;)I

    move-result v2

    add-int/2addr v1, v2

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    move v0, v1

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    if-eqz v1, :cond_5

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awg:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzh(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    if-eqz v1, :cond_6

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzc(ILcom/google/android/gms/internal/zzasa;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_6
    return v0
.end method
