.class public final Lcom/google/android/gms/internal/zzwc$zza;
.super Lcom/google/android/gms/internal/zzasa;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzwc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# static fields
.field private static volatile awI:[Lcom/google/android/gms/internal/zzwc$zza;


# instance fields
.field public avZ:Ljava/lang/Integer;

.field public awJ:Lcom/google/android/gms/internal/zzwc$zzf;

.field public awK:Lcom/google/android/gms/internal/zzwc$zzf;

.field public awL:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzasa;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzwc$zza;->zzbzx()Lcom/google/android/gms/internal/zzwc$zza;

    return-void
.end method

.method public static zzbzw()[Lcom/google/android/gms/internal/zzwc$zza;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzwc$zza;->awI:[Lcom/google/android/gms/internal/zzwc$zza;

    if-nez v0, :cond_1

    sget-object v1, Lcom/google/android/gms/internal/zzary;->btO:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/android/gms/internal/zzwc$zza;->awI:[Lcom/google/android/gms/internal/zzwc$zza;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzwc$zza;

    sput-object v0, Lcom/google/android/gms/internal/zzwc$zza;->awI:[Lcom/google/android/gms/internal/zzwc$zza;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/google/android/gms/internal/zzwc$zza;->awI:[Lcom/google/android/gms/internal/zzwc$zza;

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
    instance-of v2, p1, Lcom/google/android/gms/internal/zzwc$zza;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    check-cast p1, Lcom/google/android/gms/internal/zzwc$zza;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    if-nez v2, :cond_3

    iget-object v2, p1, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    if-nez v2, :cond_5

    iget-object v2, p1, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    if-eqz v2, :cond_6

    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzwc$zzf;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    move v0, v1

    goto :goto_0

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    if-nez v2, :cond_7

    iget-object v2, p1, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    if-eqz v2, :cond_8

    move v0, v1

    goto :goto_0

    :cond_7
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzwc$zzf;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    move v0, v1

    goto :goto_0

    :cond_8
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    if-nez v2, :cond_9

    iget-object v2, p1, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0

    :cond_9
    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    if-nez v0, :cond_2

    move v0, v1

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    if-nez v2, :cond_3

    :goto_3
    add-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzwc$zzf;->hashCode()I

    move-result v0

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzwc$zzf;->hashCode()I

    move-result v0

    goto :goto_2

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    move-result v1

    goto :goto_3
.end method

.method public zza(Lcom/google/android/gms/internal/zzart;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zza(ILcom/google/android/gms/internal/zzasa;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zza(ILcom/google/android/gms/internal/zzasa;)V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzg(IZ)V

    :cond_3
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzasa;->zza(Lcom/google/android/gms/internal/zzart;)V

    return-void
.end method

.method public zzap(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzwc$zza;
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

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzwc$zzf;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zza(Lcom/google/android/gms/internal/zzasa;)V

    goto :goto_0

    :sswitch_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    if-nez v0, :cond_2

    new-instance v0, Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzwc$zzf;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zza(Lcom/google/android/gms/internal/zzasa;)V

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->ca()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x12 -> :sswitch_2
        0x1a -> :sswitch_3
        0x20 -> :sswitch_4
    .end sparse-switch
.end method

.method public synthetic zzb(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzasa;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzwc$zza;->zzap(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzwc$zza;

    move-result-object v0

    return-object v0
.end method

.method public zzbzx()Lcom/google/android/gms/internal/zzwc$zza;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzwc$zza;->btP:I

    return-object p0
.end method

.method protected zzx()I
    .locals 3

    invoke-super {p0}, Lcom/google/android/gms/internal/zzasa;->zzx()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzah(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzc(ILcom/google/android/gms/internal/zzasa;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    if-eqz v1, :cond_2

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzc(ILcom/google/android/gms/internal/zzasa;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    if-eqz v1, :cond_3

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzh(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    return v0
.end method
