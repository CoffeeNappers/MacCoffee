.class public Lcom/google/android/gms/internal/zzafw;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzafw$zzc;,
        Lcom/google/android/gms/internal/zzafw$zzd;,
        Lcom/google/android/gms/internal/zzafw$zze;,
        Lcom/google/android/gms/internal/zzafw$zzf;,
        Lcom/google/android/gms/internal/zzafw$zza;,
        Lcom/google/android/gms/internal/zzafw$zzb;,
        Lcom/google/android/gms/internal/zzafw$zzg;
    }
.end annotation


# direct methods
.method private static zza(Lcom/google/android/gms/internal/zzai$zzb;Lcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;I)Lcom/google/android/gms/internal/zzafw$zza;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzafw$zzg;
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/zzafw$zza;->zzcku()Lcom/google/android/gms/internal/zzafw$zzb;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzb;->zzvu:[I

    array-length v5, v4

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v5, :cond_1

    aget v0, v4, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/internal/zzai$zzf;->zzwk:[Lcom/google/android/gms/internal/zzai$zze;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const-string/jumbo v6, "properties"

    invoke-static {v1, v0, v6}, Lcom/google/android/gms/internal/zzafw;->zza([Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzai$zze;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzai$zzf;->zzwi:[Ljava/lang/String;

    iget v6, v0, Lcom/google/android/gms/internal/zzai$zze;->key:I

    const-string/jumbo v7, "keys"

    invoke-static {v1, v6, v7}, Lcom/google/android/gms/internal/zzafw;->zza([Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget v0, v0, Lcom/google/android/gms/internal/zzai$zze;->value:I

    const-string/jumbo v6, "values"

    invoke-static {p2, v0, v6}, Lcom/google/android/gms/internal/zzafw;->zza([Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaj$zza;

    sget-object v6, Lcom/google/android/gms/internal/zzah;->zzst:Lcom/google/android/gms/internal/zzah;

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzah;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzafw$zzb;->zzq(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzafw$zzb;

    :goto_1
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_0
    invoke-virtual {v3, v1, v0}, Lcom/google/android/gms/internal/zzafw$zzb;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzafw$zzb;

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzafw$zzb;->zzckv()Lcom/google/android/gms/internal/zzafw$zza;

    move-result-object v0

    return-object v0
.end method

.method private static zza(Lcom/google/android/gms/internal/zzai$zzg;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/google/android/gms/internal/zzai$zzf;)Lcom/google/android/gms/internal/zzafw$zze;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzai$zzg;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzafw$zza;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzafw$zza;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzafw$zza;",
            ">;",
            "Lcom/google/android/gms/internal/zzai$zzf;",
            ")",
            "Lcom/google/android/gms/internal/zzafw$zze;"
        }
    .end annotation

    const/4 v1, 0x0

    invoke-static {}, Lcom/google/android/gms/internal/zzafw$zze;->zzckz()Lcom/google/android/gms/internal/zzafw$zzf;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzg;->zzwy:[I

    array-length v5, v4

    move v2, v1

    :goto_0
    if-ge v2, v5, :cond_0

    aget v0, v4, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzafw$zza;

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzafw$zzf;->zzd(Lcom/google/android/gms/internal/zzafw$zza;)Lcom/google/android/gms/internal/zzafw$zzf;

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzg;->zzwz:[I

    array-length v5, v4

    move v2, v1

    :goto_1
    if-ge v2, v5, :cond_1

    aget v0, v4, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzafw$zza;

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzafw$zzf;->zze(Lcom/google/android/gms/internal/zzafw$zza;)Lcom/google/android/gms/internal/zzafw$zzf;

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1

    :cond_1
    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzg;->zzxa:[I

    array-length v5, v4

    move v2, v1

    :goto_2
    if-ge v2, v5, :cond_2

    aget v0, v4, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzafw$zza;

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzafw$zzf;->zzf(Lcom/google/android/gms/internal/zzafw$zza;)Lcom/google/android/gms/internal/zzafw$zzf;

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_2

    :cond_2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzg;->zzxc:[I

    array-length v4, v2

    move v0, v1

    :goto_3
    if-ge v0, v4, :cond_3

    aget v5, v2, v0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v6, p4, Lcom/google/android/gms/internal/zzai$zzf;->zzwj:[Lcom/google/android/gms/internal/zzaj$zza;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-object v5, v6, v5

    iget-object v5, v5, Lcom/google/android/gms/internal/zzaj$zza;->string:Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/google/android/gms/internal/zzafw$zzf;->zzrj(Ljava/lang/String;)Lcom/google/android/gms/internal/zzafw$zzf;

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_3
    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzg;->zzxb:[I

    array-length v5, v4

    move v2, v1

    :goto_4
    if-ge v2, v5, :cond_4

    aget v0, v4, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzafw$zza;

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzafw$zzf;->zzg(Lcom/google/android/gms/internal/zzafw$zza;)Lcom/google/android/gms/internal/zzafw$zzf;

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_4

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzg;->zzxd:[I

    array-length v4, v2

    move v0, v1

    :goto_5
    if-ge v0, v4, :cond_5

    aget v5, v2, v0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v6, p4, Lcom/google/android/gms/internal/zzai$zzf;->zzwj:[Lcom/google/android/gms/internal/zzaj$zza;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-object v5, v6, v5

    iget-object v5, v5, Lcom/google/android/gms/internal/zzaj$zza;->string:Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/google/android/gms/internal/zzafw$zzf;->zzrk(Ljava/lang/String;)Lcom/google/android/gms/internal/zzafw$zzf;

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_5
    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzg;->zzxe:[I

    array-length v5, v4

    move v2, v1

    :goto_6
    if-ge v2, v5, :cond_6

    aget v0, v4, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzafw$zza;

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzafw$zzf;->zzh(Lcom/google/android/gms/internal/zzafw$zza;)Lcom/google/android/gms/internal/zzafw$zzf;

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_6

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzg;->zzxg:[I

    array-length v4, v2

    move v0, v1

    :goto_7
    if-ge v0, v4, :cond_7

    aget v5, v2, v0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v6, p4, Lcom/google/android/gms/internal/zzai$zzf;->zzwj:[Lcom/google/android/gms/internal/zzaj$zza;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-object v5, v6, v5

    iget-object v5, v5, Lcom/google/android/gms/internal/zzaj$zza;->string:Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/google/android/gms/internal/zzafw$zzf;->zzrl(Ljava/lang/String;)Lcom/google/android/gms/internal/zzafw$zzf;

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_7
    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzg;->zzxf:[I

    array-length v5, v4

    move v2, v1

    :goto_8
    if-ge v2, v5, :cond_8

    aget v0, v4, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzafw$zza;

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzafw$zzf;->zzi(Lcom/google/android/gms/internal/zzafw$zza;)Lcom/google/android/gms/internal/zzafw$zzf;

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_8

    :cond_8
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzg;->zzxh:[I

    array-length v4, v2

    move v0, v1

    :goto_9
    if-ge v0, v4, :cond_9

    aget v1, v2, v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v5, p4, Lcom/google/android/gms/internal/zzai$zzf;->zzwj:[Lcom/google/android/gms/internal/zzaj$zza;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v1, v5, v1

    iget-object v1, v1, Lcom/google/android/gms/internal/zzaj$zza;->string:Ljava/lang/String;

    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/zzafw$zzf;->zzrm(Ljava/lang/String;)Lcom/google/android/gms/internal/zzafw$zzf;

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_9
    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzafw$zzf;->zzcle()Lcom/google/android/gms/internal/zzafw$zze;

    move-result-object v0

    return-object v0
.end method

.method private static zza(ILcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzaj$zza;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/internal/zzai$zzf;",
            "[",
            "Lcom/google/android/gms/internal/zzaj$zza;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/google/android/gms/internal/zzaj$zza;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzafw$zzg;
        }
    .end annotation

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x5a

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Value cycle detected.  Current value reference: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, ".  Previous value references: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzqt(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p1, Lcom/google/android/gms/internal/zzai$zzf;->zzwj:[Lcom/google/android/gms/internal/zzaj$zza;

    const-string/jumbo v1, "values"

    invoke-static {v0, p0, v1}, Lcom/google/android/gms/internal/zzafw;->zza([Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaj$zza;

    aget-object v1, p2, p0

    if-eqz v1, :cond_1

    aget-object v0, p2, p0

    :goto_0
    return-object v0

    :cond_1
    const/4 v1, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget v3, v0, Lcom/google/android/gms/internal/zzaj$zza;->type:I

    packed-switch v3, :pswitch_data_0

    :cond_2
    :goto_1
    if-nez v1, :cond_3

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0xf

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Invalid value: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzqt(Ljava/lang/String;)V

    :cond_3
    aput-object v1, p2, p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p3, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-object v0, v1

    goto :goto_0

    :pswitch_0
    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzp(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzai$zzh;

    move-result-object v3

    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzo(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v1

    iget-object v4, v3, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    array-length v4, v4

    new-array v4, v4, [Lcom/google/android/gms/internal/zzaj$zza;

    iput-object v4, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzxy:[Lcom/google/android/gms/internal/zzaj$zza;

    iget-object v5, v3, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    array-length v6, v5

    move v3, v2

    :goto_2
    if-ge v2, v6, :cond_2

    aget v7, v5, v2

    iget-object v8, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzxy:[Lcom/google/android/gms/internal/zzaj$zza;

    add-int/lit8 v4, v3, 0x1

    invoke-static {v7, p1, p2, p3}, Lcom/google/android/gms/internal/zzafw;->zza(ILcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v7

    aput-object v7, v8, v3

    add-int/lit8 v2, v2, 0x1

    move v3, v4

    goto :goto_2

    :pswitch_1
    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzo(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v1

    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzp(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzai$zzh;

    move-result-object v6

    iget-object v3, v6, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v3, v3

    iget-object v4, v6, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    array-length v4, v4

    if-eq v3, v4, :cond_4

    iget-object v3, v6, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v3, v3

    iget-object v4, v6, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    array-length v4, v4

    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v7, 0x3a

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v7, "Uneven map keys ("

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, ") and map values ("

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/internal/zzafw;->zzqt(Ljava/lang/String;)V

    :cond_4
    iget-object v3, v6, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v3, v3

    new-array v3, v3, [Lcom/google/android/gms/internal/zzaj$zza;

    iput-object v3, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzxz:[Lcom/google/android/gms/internal/zzaj$zza;

    iget-object v3, v6, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v3, v3

    new-array v3, v3, [Lcom/google/android/gms/internal/zzaj$zza;

    iput-object v3, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzya:[Lcom/google/android/gms/internal/zzaj$zza;

    iget-object v7, v6, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v8, v7

    move v3, v2

    move v4, v2

    :goto_3
    if-ge v3, v8, :cond_5

    aget v9, v7, v3

    iget-object v10, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzxz:[Lcom/google/android/gms/internal/zzaj$zza;

    add-int/lit8 v5, v4, 0x1

    invoke-static {v9, p1, p2, p3}, Lcom/google/android/gms/internal/zzafw;->zza(ILcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v9

    aput-object v9, v10, v4

    add-int/lit8 v3, v3, 0x1

    move v4, v5

    goto :goto_3

    :cond_5
    iget-object v5, v6, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    array-length v6, v5

    move v3, v2

    :goto_4
    if-ge v2, v6, :cond_2

    aget v7, v5, v2

    iget-object v8, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzya:[Lcom/google/android/gms/internal/zzaj$zza;

    add-int/lit8 v4, v3, 0x1

    invoke-static {v7, p1, p2, p3}, Lcom/google/android/gms/internal/zzafw;->zza(ILcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v7

    aput-object v7, v8, v3

    add-int/lit8 v2, v2, 0x1

    move v3, v4

    goto :goto_4

    :pswitch_2
    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzo(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v1

    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzp(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzai$zzh;

    move-result-object v2

    iget v2, v2, Lcom/google/android/gms/internal/zzai$zzh;->zzxp:I

    invoke-static {v2, p1, p2, p3}, Lcom/google/android/gms/internal/zzafw;->zza(ILcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzdm;->zzg(Lcom/google/android/gms/internal/zzaj$zza;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzyb:Ljava/lang/String;

    goto/16 :goto_1

    :pswitch_3
    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzo(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v1

    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzp(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzai$zzh;

    move-result-object v3

    iget-object v4, v3, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    array-length v4, v4

    new-array v4, v4, [Lcom/google/android/gms/internal/zzaj$zza;

    iput-object v4, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzyf:[Lcom/google/android/gms/internal/zzaj$zza;

    iget-object v5, v3, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    array-length v6, v5

    move v3, v2

    :goto_5
    if-ge v2, v6, :cond_2

    aget v7, v5, v2

    iget-object v8, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzyf:[Lcom/google/android/gms/internal/zzaj$zza;

    add-int/lit8 v4, v3, 0x1

    invoke-static {v7, p1, p2, p3}, Lcom/google/android/gms/internal/zzafw;->zza(ILcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v7

    aput-object v7, v8, v3

    add-int/lit8 v2, v2, 0x1

    move v3, v4

    goto :goto_5

    :pswitch_4
    move-object v1, v0

    goto/16 :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private static zza([Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzafw$zzg;
        }
    .end annotation

    if-ltz p1, :cond_0

    array-length v0, p0

    if-lt p1, v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x2d

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v1, "Index out of bounds detected: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzqt(Ljava/lang/String;)V

    :cond_1
    aget-object v0, p0, p1

    return-object v0
.end method

.method public static zzb(Lcom/google/android/gms/internal/zzai$zzf;)Lcom/google/android/gms/internal/zzafw$zzc;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzafw$zzg;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzf;->zzwj:[Lcom/google/android/gms/internal/zzaj$zza;

    array-length v0, v0

    new-array v2, v0, [Lcom/google/android/gms/internal/zzaj$zza;

    move v0, v1

    :goto_0
    iget-object v3, p0, Lcom/google/android/gms/internal/zzai$zzf;->zzwj:[Lcom/google/android/gms/internal/zzaj$zza;

    array-length v3, v3

    if-ge v0, v3, :cond_0

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v1}, Ljava/util/HashSet;-><init>(I)V

    invoke-static {v0, p0, v2, v3}, Lcom/google/android/gms/internal/zzafw;->zza(ILcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzaj$zza;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/zzafw$zzc;->zzckw()Lcom/google/android/gms/internal/zzafw$zzd;

    move-result-object v3

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move v0, v1

    :goto_1
    iget-object v5, p0, Lcom/google/android/gms/internal/zzai$zzf;->zzwm:[Lcom/google/android/gms/internal/zzai$zzb;

    array-length v5, v5

    if-ge v0, v5, :cond_1

    iget-object v5, p0, Lcom/google/android/gms/internal/zzai$zzf;->zzwm:[Lcom/google/android/gms/internal/zzai$zzb;

    aget-object v5, v5, v0

    invoke-static {v5, p0, v2, v0}, Lcom/google/android/gms/internal/zzafw;->zza(Lcom/google/android/gms/internal/zzai$zzb;Lcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;I)Lcom/google/android/gms/internal/zzafw$zza;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move v0, v1

    :goto_2
    iget-object v6, p0, Lcom/google/android/gms/internal/zzai$zzf;->zzwn:[Lcom/google/android/gms/internal/zzai$zzb;

    array-length v6, v6

    if-ge v0, v6, :cond_2

    iget-object v6, p0, Lcom/google/android/gms/internal/zzai$zzf;->zzwn:[Lcom/google/android/gms/internal/zzai$zzb;

    aget-object v6, v6, v0

    invoke-static {v6, p0, v2, v0}, Lcom/google/android/gms/internal/zzafw;->zza(Lcom/google/android/gms/internal/zzai$zzb;Lcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;I)Lcom/google/android/gms/internal/zzafw$zza;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move v0, v1

    :goto_3
    iget-object v7, p0, Lcom/google/android/gms/internal/zzai$zzf;->zzwl:[Lcom/google/android/gms/internal/zzai$zzb;

    array-length v7, v7

    if-ge v0, v7, :cond_3

    iget-object v7, p0, Lcom/google/android/gms/internal/zzai$zzf;->zzwl:[Lcom/google/android/gms/internal/zzai$zzb;

    aget-object v7, v7, v0

    invoke-static {v7, p0, v2, v0}, Lcom/google/android/gms/internal/zzafw;->zza(Lcom/google/android/gms/internal/zzai$zzb;Lcom/google/android/gms/internal/zzai$zzf;[Lcom/google/android/gms/internal/zzaj$zza;I)Lcom/google/android/gms/internal/zzafw$zza;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/google/android/gms/internal/zzafw$zzd;->zzc(Lcom/google/android/gms/internal/zzafw$zza;)Lcom/google/android/gms/internal/zzafw$zzd;

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzf;->zzwo:[Lcom/google/android/gms/internal/zzai$zzg;

    array-length v2, v0

    :goto_4
    if-ge v1, v2, :cond_4

    aget-object v7, v0, v1

    invoke-static {v7, v4, v6, v5, p0}, Lcom/google/android/gms/internal/zzafw;->zza(Lcom/google/android/gms/internal/zzai$zzg;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/google/android/gms/internal/zzai$zzf;)Lcom/google/android/gms/internal/zzafw$zze;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/google/android/gms/internal/zzafw$zzd;->zzb(Lcom/google/android/gms/internal/zzafw$zze;)Lcom/google/android/gms/internal/zzafw$zzd;

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzf;->version:Ljava/lang/String;

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzafw$zzd;->zzri(Ljava/lang/String;)Lcom/google/android/gms/internal/zzafw$zzd;

    iget v0, p0, Lcom/google/android/gms/internal/zzai$zzf;->zzww:I

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzafw$zzd;->zzaao(I)Lcom/google/android/gms/internal/zzafw$zzd;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzafw$zzd;->zzcky()Lcom/google/android/gms/internal/zzafw$zzc;

    move-result-object v0

    return-object v0
.end method

.method public static zzc(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x400

    new-array v0, v0, [B

    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    return-void

    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public static zzo(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzaj$zza;
    .locals 2

    new-instance v1, Lcom/google/android/gms/internal/zzaj$zza;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzaj$zza;-><init>()V

    iget v0, p0, Lcom/google/android/gms/internal/zzaj$zza;->type:I

    iput v0, v1, Lcom/google/android/gms/internal/zzaj$zza;->type:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaj$zza;->zzyg:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iput-object v0, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzyg:[I

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaj$zza;->zzyh:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaj$zza;->zzyh:Z

    iput-boolean v0, v1, Lcom/google/android/gms/internal/zzaj$zza;->zzyh:Z

    :cond_0
    return-object v1
.end method

.method private static zzp(Lcom/google/android/gms/internal/zzaj$zza;)Lcom/google/android/gms/internal/zzai$zzh;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzafw$zzg;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/zzai$zzh;->zzxi:Lcom/google/android/gms/internal/zzarv;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaj$zza;->zza(Lcom/google/android/gms/internal/zzarv;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzai$zzh;

    if-nez v0, :cond_0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x36

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "Expected a ServingValue and didn\'t get one. Value is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzafw;->zzqt(Ljava/lang/String;)V

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzai$zzh;->zzxi:Lcom/google/android/gms/internal/zzarv;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaj$zza;->zza(Lcom/google/android/gms/internal/zzarv;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzai$zzh;

    return-object v0
.end method

.method private static zzqt(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzafw$zzg;
        }
    .end annotation

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzbo;->e(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/zzafw$zzg;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzafw$zzg;-><init>(Ljava/lang/String;)V

    throw v0
.end method
