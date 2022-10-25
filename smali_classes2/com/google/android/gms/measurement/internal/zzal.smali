.class public Lcom/google/android/gms/measurement/internal/zzal;
.super Lcom/google/android/gms/measurement/internal/zzz;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzx;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzz;-><init>(Lcom/google/android/gms/measurement/internal/zzx;)V

    return-void
.end method

.method private zza(ILjava/lang/Object;Z)Ljava/lang/Object;
    .locals 2

    const/4 v0, 0x0

    if-nez p2, :cond_1

    move-object p2, v0

    :cond_0
    :goto_0
    return-object p2

    :cond_1
    instance-of v1, p2, Ljava/lang/Long;

    if-nez v1, :cond_0

    instance-of v1, p2, Ljava/lang/Double;

    if-nez v1, :cond_0

    instance-of v1, p2, Ljava/lang/Integer;

    if-eqz v1, :cond_2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    goto :goto_0

    :cond_2
    instance-of v1, p2, Ljava/lang/Byte;

    if-eqz v1, :cond_3

    check-cast p2, Ljava/lang/Byte;

    invoke-virtual {p2}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    goto :goto_0

    :cond_3
    instance-of v1, p2, Ljava/lang/Short;

    if-eqz v1, :cond_4

    check-cast p2, Ljava/lang/Short;

    invoke-virtual {p2}, Ljava/lang/Short;->shortValue()S

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    goto :goto_0

    :cond_4
    instance-of v1, p2, Ljava/lang/Boolean;

    if-eqz v1, :cond_6

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_5

    const-wide/16 v0, 0x1

    :goto_1
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    goto :goto_0

    :cond_5
    const-wide/16 v0, 0x0

    goto :goto_1

    :cond_6
    instance-of v1, p2, Ljava/lang/Float;

    if-eqz v1, :cond_7

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    goto :goto_0

    :cond_7
    instance-of v1, p2, Ljava/lang/String;

    if-nez v1, :cond_8

    instance-of v1, p2, Ljava/lang/Character;

    if-nez v1, :cond_8

    instance-of v1, p2, Ljava/lang/CharSequence;

    if-eqz v1, :cond_9

    :cond_8
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p3}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_9
    move-object p2, v0

    goto :goto_0
.end method

.method public static zza(Lcom/google/android/gms/internal/zzwa$zzb;)Ljava/lang/String;
    .locals 7

    const/4 v6, 0x1

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string/jumbo v0, "null"

    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "\nevent_filter {\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v2, "filter_id"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awd:Ljava/lang/Integer;

    invoke-static {v1, v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v2, "event_name"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awe:Ljava/lang/String;

    invoke-static {v1, v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v2, "event_count_filter"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awh:Lcom/google/android/gms/internal/zzwa$zzd;

    invoke-static {v1, v6, v2, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/zzwa$zzd;)V

    const-string/jumbo v2, "  filters {\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zzb;->awf:[Lcom/google/android/gms/internal/zzwa$zzc;

    array-length v3, v2

    :goto_1
    if-ge v0, v3, :cond_1

    aget-object v4, v2, v0

    const/4 v5, 0x2

    invoke-static {v1, v5, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILcom/google/android/gms/internal/zzwa$zzc;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    invoke-static {v1, v6}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, "}\n}\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static zza(Lcom/google/android/gms/internal/zzwa$zze;)Ljava/lang/String;
    .locals 4

    const/4 v3, 0x0

    if-nez p0, :cond_0

    const-string/jumbo v0, "null"

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "\nproperty_filter {\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "filter_id"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zze;->awd:Ljava/lang/Integer;

    invoke-static {v0, v3, v1, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v1, "property_name"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zze;->awt:Ljava/lang/String;

    invoke-static {v0, v3, v1, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwa$zze;->awu:Lcom/google/android/gms/internal/zzwa$zzc;

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILcom/google/android/gms/internal/zzwa$zzc;)V

    const-string/jumbo v1, "}\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static zza(Ljava/lang/StringBuilder;I)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    const-string/jumbo v1, "  "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static zza(Ljava/lang/StringBuilder;ILcom/google/android/gms/internal/zzwa$zzc;)V
    .locals 3

    if-nez p2, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, "filter {\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "complement"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwa$zzc;->awl:Ljava/lang/Boolean;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "param_name"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwa$zzc;->awm:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    add-int/lit8 v0, p1, 0x1

    const-string/jumbo v1, "string_filter"

    iget-object v2, p2, Lcom/google/android/gms/internal/zzwa$zzc;->awj:Lcom/google/android/gms/internal/zzwa$zzf;

    invoke-static {p0, v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/zzwa$zzf;)V

    add-int/lit8 v0, p1, 0x1

    const-string/jumbo v1, "number_filter"

    iget-object v2, p2, Lcom/google/android/gms/internal/zzwa$zzc;->awk:Lcom/google/android/gms/internal/zzwa$zzd;

    invoke-static {p0, v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/zzwa$zzd;)V

    invoke-static {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, "}\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private static zza(Ljava/lang/StringBuilder;ILcom/google/android/gms/internal/zzwc$zze;)V
    .locals 2

    if-nez p2, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, "bundle {\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "protocol_version"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->awU:Ljava/lang/Integer;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "platform"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axc:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "gmp_version"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axg:Ljava/lang/Long;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "uploading_gmp_version"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axh:Ljava/lang/Long;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "config_version"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axt:Ljava/lang/Long;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "gmp_app_id"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->aqZ:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "app_id"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "app_version"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->aii:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "app_version_major"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axp:Ljava/lang/Integer;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "firebase_instance_id"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->arh:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "dev_cert_hash"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axl:Ljava/lang/Long;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "app_store"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->ara:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "upload_timestamp_millis"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->awX:Ljava/lang/Long;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "start_timestamp_millis"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->awY:Ljava/lang/Long;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "end_timestamp_millis"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->awZ:Ljava/lang/Long;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "previous_bundle_start_timestamp_millis"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axa:Ljava/lang/Long;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "previous_bundle_end_timestamp_millis"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axb:Ljava/lang/Long;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "app_instance_id"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axk:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "resettable_device_id"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axi:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "device_id"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axs:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "limited_ad_tracking"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axj:Ljava/lang/Boolean;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "os_version"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->zzdb:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "device_model"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axd:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "user_default_language"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axe:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "time_zone_offset_minutes"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axf:Ljava/lang/Integer;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "bundle_sequential_index"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axm:Ljava/lang/Integer;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "service_upload"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->axn:Ljava/lang/Boolean;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "health_monitor"

    iget-object v1, p2, Lcom/google/android/gms/internal/zzwc$zze;->ard:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p2, Lcom/google/android/gms/internal/zzwc$zze;->awW:[Lcom/google/android/gms/internal/zzwc$zzg;

    invoke-static {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I[Lcom/google/android/gms/internal/zzwc$zzg;)V

    iget-object v0, p2, Lcom/google/android/gms/internal/zzwc$zze;->axo:[Lcom/google/android/gms/internal/zzwc$zza;

    invoke-static {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I[Lcom/google/android/gms/internal/zzwc$zza;)V

    iget-object v0, p2, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    invoke-static {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I[Lcom/google/android/gms/internal/zzwc$zzb;)V

    invoke-static {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, "}\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0
.end method

.method private static zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/zzwa$zzd;)V
    .locals 2

    if-nez p3, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, " {\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p3, Lcom/google/android/gms/internal/zzwa$zzd;->awn:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "UNKNOWN_COMPARISON_TYPE"

    iget-object v1, p3, Lcom/google/android/gms/internal/zzwa$zzd;->awn:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :goto_1
    const-string/jumbo v1, "comparison_type"

    invoke-static {p0, p1, v1, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    :cond_1
    const-string/jumbo v0, "match_as_float"

    iget-object v1, p3, Lcom/google/android/gms/internal/zzwa$zzd;->awo:Ljava/lang/Boolean;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "comparison_value"

    iget-object v1, p3, Lcom/google/android/gms/internal/zzwa$zzd;->awp:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "min_comparison_value"

    iget-object v1, p3, Lcom/google/android/gms/internal/zzwa$zzd;->awq:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "max_comparison_value"

    iget-object v1, p3, Lcom/google/android/gms/internal/zzwa$zzd;->awr:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    invoke-static {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, "}\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_0
    const-string/jumbo v0, "LESS_THAN"

    goto :goto_1

    :pswitch_1
    const-string/jumbo v0, "GREATER_THAN"

    goto :goto_1

    :pswitch_2
    const-string/jumbo v0, "EQUAL"

    goto :goto_1

    :pswitch_3
    const-string/jumbo v0, "BETWEEN"

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/zzwa$zzf;)V
    .locals 5

    if-nez p3, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, " {\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p3, Lcom/google/android/gms/internal/zzwa$zzf;->awv:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "UNKNOWN_MATCH_TYPE"

    iget-object v1, p3, Lcom/google/android/gms/internal/zzwa$zzf;->awv:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :goto_1
    const-string/jumbo v1, "match_type"

    invoke-static {p0, p1, v1, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    :cond_1
    const-string/jumbo v0, "expression"

    iget-object v1, p3, Lcom/google/android/gms/internal/zzwa$zzf;->aww:Ljava/lang/String;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v0, "case_sensitive"

    iget-object v1, p3, Lcom/google/android/gms/internal/zzwa$zzf;->awx:Ljava/lang/Boolean;

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p3, Lcom/google/android/gms/internal/zzwa$zzf;->awy:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_3

    add-int/lit8 v0, p1, 0x1

    invoke-static {p0, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, "expression_list {\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p3, Lcom/google/android/gms/internal/zzwa$zzf;->awy:[Ljava/lang/String;

    array-length v2, v1

    const/4 v0, 0x0

    :goto_2
    if-ge v0, v2, :cond_2

    aget-object v3, v1, v0

    add-int/lit8 v4, p1, 0x2

    invoke-static {p0, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\n"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :pswitch_0
    const-string/jumbo v0, "REGEXP"

    goto :goto_1

    :pswitch_1
    const-string/jumbo v0, "BEGINS_WITH"

    goto :goto_1

    :pswitch_2
    const-string/jumbo v0, "ENDS_WITH"

    goto :goto_1

    :pswitch_3
    const-string/jumbo v0, "PARTIAL"

    goto :goto_1

    :pswitch_4
    const-string/jumbo v0, "EXACT"

    goto :goto_1

    :pswitch_5
    const-string/jumbo v0, "IN_LIST"

    goto :goto_1

    :cond_2
    const-string/jumbo v0, "}\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-static {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, "}\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private static zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/zzwc$zzf;)V
    .locals 11

    const/16 v10, 0xa

    const/4 v0, 0x0

    if-nez p3, :cond_0

    :goto_0
    return-void

    :cond_0
    add-int/lit8 v4, p1, 0x1

    invoke-static {p0, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v1, " {\n"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p3, Lcom/google/android/gms/internal/zzwc$zzf;->axv:[J

    if-eqz v1, :cond_3

    add-int/lit8 v1, v4, 0x1

    invoke-static {p0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v1, "results: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p3, Lcom/google/android/gms/internal/zzwc$zzf;->axv:[J

    array-length v6, v5

    move v1, v0

    move v2, v0

    :goto_1
    if-ge v1, v6, :cond_2

    aget-wide v8, v5, v1

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    add-int/lit8 v3, v2, 0x1

    if-eqz v2, :cond_1

    const-string/jumbo v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    move v2, v3

    goto :goto_1

    :cond_2
    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_3
    iget-object v1, p3, Lcom/google/android/gms/internal/zzwc$zzf;->axu:[J

    if-eqz v1, :cond_6

    add-int/lit8 v1, v4, 0x1

    invoke-static {p0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v1, "status: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p3, Lcom/google/android/gms/internal/zzwc$zzf;->axu:[J

    array-length v5, v3

    move v1, v0

    :goto_2
    if-ge v0, v5, :cond_5

    aget-wide v6, v3, v0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    add-int/lit8 v2, v1, 0x1

    if-eqz v1, :cond_4

    const-string/jumbo v1, ", "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    move v1, v2

    goto :goto_2

    :cond_5
    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_6
    invoke-static {p0, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, "}\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private static zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V
    .locals 1

    if-nez p3, :cond_0

    :goto_0
    return-void

    :cond_0
    add-int/lit8 v0, p1, 0x1

    invoke-static {p0, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, ": "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private static zza(Ljava/lang/StringBuilder;I[Lcom/google/android/gms/internal/zzwc$zza;)V
    .locals 6

    if-nez p2, :cond_1

    :cond_0
    return-void

    :cond_1
    add-int/lit8 v1, p1, 0x1

    array-length v2, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p2, v0

    if-nez v3, :cond_2

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    invoke-static {p0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v4, "audience_membership {\n"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v4, "audience_id"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zza;->avZ:Ljava/lang/Integer;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "new_audience"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zza;->awL:Ljava/lang/Boolean;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "current_data"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zza;->awJ:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/zzwc$zzf;)V

    const-string/jumbo v4, "previous_data"

    iget-object v3, v3, Lcom/google/android/gms/internal/zzwc$zza;->awK:Lcom/google/android/gms/internal/zzwc$zzf;

    invoke-static {p0, v1, v4, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/zzwc$zzf;)V

    invoke-static {p0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v3, "}\n"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method private static zza(Ljava/lang/StringBuilder;I[Lcom/google/android/gms/internal/zzwc$zzb;)V
    .locals 6

    if-nez p2, :cond_1

    :cond_0
    return-void

    :cond_1
    add-int/lit8 v1, p1, 0x1

    array-length v2, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p2, v0

    if-nez v3, :cond_2

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    invoke-static {p0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v4, "event {\n"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v4, "name"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzb;->name:Ljava/lang/String;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "timestamp_millis"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzb;->awO:Ljava/lang/Long;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "previous_timestamp_millis"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzb;->awP:Ljava/lang/Long;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "count"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzb;->count:Ljava/lang/Integer;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v3, v3, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    invoke-static {p0, v1, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I[Lcom/google/android/gms/internal/zzwc$zzc;)V

    invoke-static {p0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v3, "}\n"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method private static zza(Ljava/lang/StringBuilder;I[Lcom/google/android/gms/internal/zzwc$zzc;)V
    .locals 6

    if-nez p2, :cond_1

    :cond_0
    return-void

    :cond_1
    add-int/lit8 v1, p1, 0x1

    array-length v2, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p2, v0

    if-nez v3, :cond_2

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    invoke-static {p0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v4, "param {\n"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v4, "name"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzc;->name:Ljava/lang/String;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "string_value"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzc;->Fe:Ljava/lang/String;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "int_value"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzc;->awR:Ljava/lang/Long;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "double_value"

    iget-object v3, v3, Lcom/google/android/gms/internal/zzwc$zzc;->avW:Ljava/lang/Double;

    invoke-static {p0, v1, v4, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    invoke-static {p0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v3, "}\n"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method private static zza(Ljava/lang/StringBuilder;I[Lcom/google/android/gms/internal/zzwc$zzg;)V
    .locals 6

    if-nez p2, :cond_1

    :cond_0
    return-void

    :cond_1
    add-int/lit8 v1, p1, 0x1

    array-length v2, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p2, v0

    if-nez v3, :cond_2

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    invoke-static {p0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v4, "user_property {\n"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v4, "set_timestamp_millis"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzg;->axx:Ljava/lang/Long;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "name"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzg;->name:Ljava/lang/String;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "string_value"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzg;->Fe:Ljava/lang/String;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "int_value"

    iget-object v5, v3, Lcom/google/android/gms/internal/zzwc$zzg;->awR:Ljava/lang/Long;

    invoke-static {p0, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v4, "double_value"

    iget-object v3, v3, Lcom/google/android/gms/internal/zzwc$zzg;->avW:Ljava/lang/Double;

    invoke-static {p0, v1, v4, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    invoke-static {p0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v3, "}\n"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method public static zza(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    new-instance v2, Landroid/content/ComponentName;

    invoke-direct {v2, p0, p1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-boolean v2, v1, Landroid/content/pm/ActivityInfo;->enabled:Z

    if-eqz v2, :cond_0

    if-eqz p2, :cond_2

    iget-boolean v1, v1, Landroid/content/pm/ActivityInfo;->exported:Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static zza([JI)Z
    .locals 6

    const/4 v0, 0x0

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x40

    if-lt p1, v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    div-int/lit8 v1, p1, 0x40

    aget-wide v2, p0, v1

    const-wide/16 v4, 0x1

    rem-int/lit8 v1, p1, 0x40

    shl-long/2addr v4, v1

    and-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static zza(Ljava/util/BitSet;)[J
    .locals 10

    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/util/BitSet;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x3f

    div-int/lit8 v3, v0, 0x40

    new-array v4, v3, [J

    move v2, v1

    :goto_0
    if-ge v2, v3, :cond_3

    const-wide/16 v6, 0x0

    aput-wide v6, v4, v2

    move v0, v1

    :goto_1
    const/16 v5, 0x40

    if-ge v0, v5, :cond_0

    mul-int/lit8 v5, v2, 0x40

    add-int/2addr v5, v0

    invoke-virtual {p0}, Ljava/util/BitSet;->length()I

    move-result v6

    if-lt v5, v6, :cond_1

    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    mul-int/lit8 v5, v2, 0x40

    add-int/2addr v5, v0

    invoke-virtual {p0, v5}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-eqz v5, :cond_2

    aget-wide v6, v4, v2

    const-wide/16 v8, 0x1

    shl-long/2addr v8, v0

    or-long/2addr v6, v8

    aput-wide v6, v4, v2

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    return-object v4
.end method

.method public static zzb(Lcom/google/android/gms/internal/zzwc$zzd;)Ljava/lang/String;
    .locals 6

    if-nez p0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v0, "\nbatch {\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    array-length v3, v2

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v3, :cond_2

    aget-object v4, v2, v0

    if-nez v4, :cond_1

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v5, 0x1

    invoke-static {v1, v5, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/StringBuilder;ILcom/google/android/gms/internal/zzwc$zze;)V

    goto :goto_2

    :cond_2
    const-string/jumbo v0, "}\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static zzbb(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    if-nez p0, :cond_0

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    if-nez p0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method static zzc(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)Z
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->aqZ:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "_in"

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static zzfl(Ljava/lang/String;)Ljava/security/MessageDigest;
    .locals 2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v0, 0x2

    if-ge v1, v0, :cond_1

    :try_start_0
    invoke-static {p0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    if-eqz v0, :cond_0

    :goto_1
    return-object v0

    :catch_0
    move-exception v0

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method static zzmu(Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzaa;->zzib(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x5f

    if-eq v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private zznd(Ljava/lang/String;)I
    .locals 1

    const-string/jumbo v0, "_ldl"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuj()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbui()I

    move-result v0

    goto :goto_0
.end method

.method public static zzne(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static zzng(Ljava/lang/String;)Z
    .locals 2

    if-eqz p0, :cond_0

    const-string/jumbo v0, "(\\+|-)?([0-9]+\\.?[0-9]*|[0-9]*\\.?[0-9]+)"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x136

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static zzr(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    new-instance v2, Landroid/content/ComponentName;

    invoke-direct {v2, p0, p1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-boolean v1, v1, Landroid/content/pm/ServiceInfo;->enabled:Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static zzy([B)J
    .locals 8

    const/4 v1, 0x0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    array-length v0, p0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzbs(Z)V

    const-wide/16 v2, 0x0

    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-ltz v0, :cond_1

    array-length v4, p0

    add-int/lit8 v4, v4, -0x8

    if-lt v0, v4, :cond_1

    aget-byte v4, p0, v0

    int-to-long v4, v4

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    shl-long/2addr v4, v1

    add-long/2addr v2, v4

    add-int/lit8 v1, v1, 0x8

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    return-wide v2
.end method


# virtual methods
.method public bridge synthetic getContext()Landroid/content/Context;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public zza(Ljava/lang/String;Landroid/os/Bundle;Ljava/util/List;Z)Landroid/os/Bundle;
    .locals 10
    .param p3    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;Z)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    const/16 v9, 0x19

    const/4 v8, 0x1

    const/4 v2, 0x0

    const/4 v0, 0x0

    if-eqz p2, :cond_8

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3, p2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuc()I

    invoke-virtual {p2}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v1, v2

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz p3, :cond_0

    invoke-interface {p3, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    :cond_0
    if-eqz p4, :cond_9

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zzmz(Ljava/lang/String;)I

    move-result v4

    :goto_1
    if-nez v4, :cond_1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zzna(Ljava/lang/String;)I

    move-result v4

    :cond_1
    :goto_2
    if-eqz v4, :cond_3

    invoke-virtual {p0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zzd(Landroid/os/Bundle;I)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuf()I

    move-result v6

    invoke-virtual {p0, v0, v6, v8}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "_ev"

    invoke-virtual {v3, v7, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v6, 0x3

    if-ne v4, v6, :cond_2

    invoke-virtual {p0, v3, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zzb(Landroid/os/Bundle;Ljava/lang/Object;)V

    :cond_2
    invoke-virtual {v3, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v0, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zzk(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string/jumbo v4, "_ev"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zzd(Landroid/os/Bundle;I)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuf()I

    move-result v4

    invoke-virtual {p0, v0, v4, v8}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v6, "_ev"

    invoke-virtual {v3, v6, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zzb(Landroid/os/Bundle;Ljava/lang/Object;)V

    :cond_4
    invoke-virtual {v3, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzal;->zzmu(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    add-int/lit8 v1, v1, 0x1

    if-le v1, v9, :cond_6

    new-instance v4, Ljava/lang/StringBuilder;

    const/16 v6, 0x30

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v6, "Event can\'t contain more then "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, " params"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v6

    invoke-virtual {v6, v4, p1, p2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v4, 0x5

    invoke-virtual {p0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zzd(Landroid/os/Bundle;I)Z

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_6
    move v0, v1

    move v1, v0

    goto/16 :goto_0

    :cond_7
    move-object v0, v3

    :cond_8
    return-object v0

    :cond_9
    move v4, v2

    goto/16 :goto_1

    :cond_a
    move v4, v2

    goto/16 :goto_2
.end method

.method public zza(Ljava/lang/String;IZ)Ljava/lang/String;
    .locals 2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, p2, :cond_0

    if-eqz p3, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    :goto_0
    return-object p1

    :cond_1
    const/4 p1, 0x0

    goto :goto_0
.end method

.method public zza(ILjava/lang/String;Ljava/lang/String;I)V
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzd(Landroid/os/Bundle;I)Z

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0, p2, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 v1, 0x6

    if-eq p1, v1, :cond_1

    const/4 v1, 0x7

    if-eq p1, v1, :cond_1

    const/4 v1, 0x2

    if-ne p1, v1, :cond_2

    :cond_1
    const-string/jumbo v1, "_el"

    int-to-long v2, p4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzal;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvq()Lcom/google/android/gms/measurement/internal/zzac;

    move-result-object v1

    const-string/jumbo v2, "auto"

    const-string/jumbo v3, "_err"

    invoke-virtual {v1, v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzac;->zzf(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public zza(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    instance-of v0, p3, Ljava/lang/Long;

    if-eqz v0, :cond_2

    check-cast p3, Ljava/lang/Long;

    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto :goto_0

    :cond_2
    instance-of v0, p3, Ljava/lang/String;

    if-eqz v0, :cond_3

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    instance-of v0, p3, Ljava/lang/Double;

    if-eqz v0, :cond_4

    check-cast p3, Ljava/lang/Double;

    invoke-virtual {p3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    goto :goto_0

    :cond_4
    if-eqz p2, :cond_0

    if-eqz p3, :cond_5

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxb()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Not putting event parameter. Invalid value type. name, type"

    invoke-virtual {v1, v2, p2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_5
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public zza(Lcom/google/android/gms/internal/zzwc$zzc;Ljava/lang/Object;)V
    .locals 2

    const/4 v0, 0x0

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, p1, Lcom/google/android/gms/internal/zzwc$zzc;->Fe:Ljava/lang/String;

    iput-object v0, p1, Lcom/google/android/gms/internal/zzwc$zzc;->awR:Ljava/lang/Long;

    iput-object v0, p1, Lcom/google/android/gms/internal/zzwc$zzc;->avW:Ljava/lang/Double;

    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_0

    check-cast p2, Ljava/lang/String;

    iput-object p2, p1, Lcom/google/android/gms/internal/zzwc$zzc;->Fe:Ljava/lang/String;

    :goto_0
    return-void

    :cond_0
    instance-of v0, p2, Ljava/lang/Long;

    if-eqz v0, :cond_1

    check-cast p2, Ljava/lang/Long;

    iput-object p2, p1, Lcom/google/android/gms/internal/zzwc$zzc;->awR:Ljava/lang/Long;

    goto :goto_0

    :cond_1
    instance-of v0, p2, Ljava/lang/Double;

    if-eqz v0, :cond_2

    check-cast p2, Ljava/lang/Double;

    iput-object p2, p1, Lcom/google/android/gms/internal/zzwc$zzc;->avW:Ljava/lang/Double;

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Ignoring invalid (type) event param value"

    invoke-virtual {v0, v1, p2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzwc$zzg;Ljava/lang/Object;)V
    .locals 2

    const/4 v0, 0x0

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, p1, Lcom/google/android/gms/internal/zzwc$zzg;->Fe:Ljava/lang/String;

    iput-object v0, p1, Lcom/google/android/gms/internal/zzwc$zzg;->awR:Ljava/lang/Long;

    iput-object v0, p1, Lcom/google/android/gms/internal/zzwc$zzg;->avW:Ljava/lang/Double;

    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_0

    check-cast p2, Ljava/lang/String;

    iput-object p2, p1, Lcom/google/android/gms/internal/zzwc$zzg;->Fe:Ljava/lang/String;

    :goto_0
    return-void

    :cond_0
    instance-of v0, p2, Ljava/lang/Long;

    if-eqz v0, :cond_1

    check-cast p2, Ljava/lang/Long;

    iput-object p2, p1, Lcom/google/android/gms/internal/zzwc$zzg;->awR:Ljava/lang/Long;

    goto :goto_0

    :cond_1
    instance-of v0, p2, Ljava/lang/Double;

    if-eqz v0, :cond_2

    check-cast p2, Ljava/lang/Double;

    iput-object p2, p1, Lcom/google/android/gms/internal/zzwc$zzg;->avW:Ljava/lang/Double;

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Ignoring invalid (type) user attribute value"

    invoke-virtual {v0, v1, p2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method zza(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Z
    .locals 4

    const/4 v1, 0x0

    const/4 v0, 0x1

    if-nez p4, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    instance-of v2, p4, Ljava/lang/Long;

    if-nez v2, :cond_0

    instance-of v2, p4, Ljava/lang/Float;

    if-nez v2, :cond_0

    instance-of v2, p4, Ljava/lang/Integer;

    if-nez v2, :cond_0

    instance-of v2, p4, Ljava/lang/Byte;

    if-nez v2, :cond_0

    instance-of v2, p4, Ljava/lang/Short;

    if-nez v2, :cond_0

    instance-of v2, p4, Ljava/lang/Boolean;

    if-nez v2, :cond_0

    instance-of v2, p4, Ljava/lang/Double;

    if-nez v2, :cond_0

    instance-of v2, p4, Ljava/lang/String;

    if-nez v2, :cond_2

    instance-of v2, p4, Ljava/lang/Character;

    if-nez v2, :cond_2

    instance-of v2, p4, Ljava/lang/CharSequence;

    if-eqz v2, :cond_3

    :cond_2
    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, p3, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v3, "Value is too long; discarded. Value kind, name, value length"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v3, p1, p2, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    move v0, v1

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzwc$zzd;)[B
    .locals 3

    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwc$zzd;->cz()I

    move-result v0

    new-array v0, v0, [B

    invoke-static {v0}, Lcom/google/android/gms/internal/zzart;->zzbe([B)Lcom/google/android/gms/internal/zzart;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzwc$zzd;->zza(Lcom/google/android/gms/internal/zzart;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzart;->cm()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Data loss. Failed to serialize batch"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic zzaby()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzaby()V

    return-void
.end method

.method public bridge synthetic zzabz()Lcom/google/android/gms/common/util/zze;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    return-object v0
.end method

.method zzad(Landroid/content/Context;Ljava/lang/String;)J
    .locals 8
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const-wide/16 v0, -0x1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzzx()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzaa;->zzib(Ljava/lang/String;)Ljava/lang/String;

    const-wide/16 v2, 0x0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string/jumbo v5, "MD5"

    invoke-static {v5}, Lcom/google/android/gms/measurement/internal/zzal;->zzfl(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    if-nez v5, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Could not get MD5 instance"

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :goto_0
    return-wide v0

    :cond_0
    if-eqz v4, :cond_2

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzal;->zzae(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x40

    invoke-virtual {v4, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    iget-object v6, v4, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz v6, :cond_1

    iget-object v6, v4, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v6, v6

    if-lez v6, :cond_1

    iget-object v0, v4, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzal;->zzy([B)J

    move-result-wide v0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v4

    const-string/jumbo v5, "Could not get signatures"

    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v4, "Package name not found"

    invoke-virtual {v1, v4, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    move-wide v0, v2

    goto :goto_0
.end method

.method zzae(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4

    new-instance v1, Ljavax/security/auth/x500/X500Principal;

    const-string/jumbo v0, "CN=Android Debug,O=Android,C=US"

    invoke-direct {v1, v0}, Ljavax/security/auth/x500/X500Principal;-><init>(Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/16 v2, 0x40

    invoke-virtual {v0, p2, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz v2, :cond_0

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v2, v2

    if-lez v2, :cond_0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v2, 0x0

    aget-object v0, v0, v2

    const-string/jumbo v2, "X.509"

    invoke-static {v2}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v2

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v2, v3}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Error obtaining certificate"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Package name not found"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1
.end method

.method zzaz(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Name is required and can\'t be null. Type"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    move v1, v2

    :cond_0
    :goto_0
    return v1

    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Name is required and can\'t be empty. Type"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    move v1, v2

    goto :goto_0

    :cond_2
    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Name must start with a letter. Type, name"

    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move v1, v2

    goto :goto_0

    :cond_3
    move v0, v1

    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_0

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5f

    if-eq v3, v4, :cond_4

    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Name must consist of letters, digits or _ (underscores). Type, name"

    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move v1, v2

    goto :goto_0

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public zzb(Landroid/os/Bundle;Ljava/lang/Object;)V
    .locals 4

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_1

    instance-of v0, p2, Ljava/lang/String;

    if-nez v0, :cond_0

    instance-of v0, p2, Ljava/lang/CharSequence;

    if-eqz v0, :cond_1

    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "_el"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    int-to-long v2, v0

    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_1
    return-void
.end method

.method zzba(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    const/16 v4, 0x5f

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Name is required and can\'t be null. Type"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    move v1, v2

    :cond_0
    :goto_0
    return v1

    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Name is required and can\'t be empty. Type"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    move v1, v2

    goto :goto_0

    :cond_2
    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v3

    if-nez v3, :cond_3

    if-eq v0, v4, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Name must start with a letter or _ (underscores). Type, name"

    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move v1, v2

    goto :goto_0

    :cond_3
    move v0, v1

    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_0

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v4, :cond_4

    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Name must consist of letters, digits or _ (underscores). Type, name"

    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move v1, v2

    goto :goto_0

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public bridge synthetic zzbvo()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvo()V

    return-void
.end method

.method public bridge synthetic zzbvp()Lcom/google/android/gms/measurement/internal/zzc;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvp()Lcom/google/android/gms/measurement/internal/zzc;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvq()Lcom/google/android/gms/measurement/internal/zzac;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvq()Lcom/google/android/gms/measurement/internal/zzac;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvr()Lcom/google/android/gms/measurement/internal/zzn;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvs()Lcom/google/android/gms/measurement/internal/zzg;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvt()Lcom/google/android/gms/measurement/internal/zzae;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvt()Lcom/google/android/gms/measurement/internal/zzae;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvu()Lcom/google/android/gms/measurement/internal/zzad;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvu()Lcom/google/android/gms/measurement/internal/zzad;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvv()Lcom/google/android/gms/measurement/internal/zzo;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvv()Lcom/google/android/gms/measurement/internal/zzo;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvw()Lcom/google/android/gms/measurement/internal/zze;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvx()Lcom/google/android/gms/measurement/internal/zzal;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvy()Lcom/google/android/gms/measurement/internal/zzv;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvz()Lcom/google/android/gms/measurement/internal/zzag;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbvz()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbwa()Lcom/google/android/gms/measurement/internal/zzw;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbwa()Lcom/google/android/gms/measurement/internal/zzw;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbwb()Lcom/google/android/gms/measurement/internal/zzq;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbwc()Lcom/google/android/gms/measurement/internal/zzt;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbwd()Lcom/google/android/gms/measurement/internal/zzd;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    return-object v0
.end method

.method zzc(Ljava/lang/String;ILjava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p3, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Name is required and can\'t be null. Type"

    invoke-virtual {v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, p2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Name is too long. Type, maximum supported length, name"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, p1, v3, p3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method zzc(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p3, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Name is required and can\'t be null. Type"

    invoke-virtual {v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return v0

    :cond_0
    const-string/jumbo v1, "firebase_"

    invoke-virtual {p3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Name starts with reserved prefix. Type, name"

    invoke-virtual {v1, v2, p1, p3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    invoke-interface {p2, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Name is reserved. Type, name"

    invoke-virtual {v1, v2, p1, p3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public zzd(Landroid/os/Bundle;I)Z
    .locals 6

    const/4 v0, 0x0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-string/jumbo v1, "_err"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    const-string/jumbo v0, "_err"

    int-to-long v2, p2

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public zzez(Ljava/lang/String;)Z
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Permission not granted"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzf(JJ)Z
    .locals 5

    const-wide/16 v2, 0x0

    const/4 v0, 0x1

    cmp-long v1, p1, v2

    if-eqz v1, :cond_0

    cmp-long v1, p3, v2

    if-gtz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    cmp-long v1, v2, p3

    if-gtz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzk(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 2

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzne(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "param"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuh()I

    move-result v1

    invoke-virtual {p0, v0, p1, v1, p2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const-string/jumbo v0, "param"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzbug()I

    move-result v1

    invoke-virtual {p0, v0, p1, v1, p2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public zzk([B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v1, p1}, Ljava/util/zip/GZIPOutputStream;->write([B)V

    invoke-virtual {v1}, Ljava/util/zip/GZIPOutputStream;->close()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Failed to gzip content"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public zzl(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    const-string/jumbo v0, "_ev"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuh()I

    move-result v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzne(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuh()I

    move-result v0

    :goto_1
    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbug()I

    move-result v0

    goto :goto_1
.end method

.method public zzm(Ljava/lang/String;Ljava/lang/Object;)I
    .locals 2

    const-string/jumbo v0, "_ldl"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "user property referrer"

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zznd(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v0, p1, v1, p2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Z

    move-result v0

    :goto_0
    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_1
    return v0

    :cond_0
    const-string/jumbo v0, "user property"

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zznd(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v0, p1, v1, p2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x7

    goto :goto_1
.end method

.method public zzmv(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x2

    const-string/jumbo v1, "event"

    invoke-virtual {p0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzaz(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-string/jumbo v1, "event"

    sget-object v2, Lcom/google/android/gms/measurement/AppMeasurement$zza;->aqx:Ljava/util/Map;

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const/16 v0, 0xd

    goto :goto_0

    :cond_2
    const-string/jumbo v1, "event"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbud()I

    move-result v2

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzmw(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x2

    const-string/jumbo v1, "event"

    invoke-virtual {p0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzba(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-string/jumbo v1, "event"

    sget-object v2, Lcom/google/android/gms/measurement/AppMeasurement$zza;->aqx:Ljava/util/Map;

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const/16 v0, 0xd

    goto :goto_0

    :cond_2
    const-string/jumbo v1, "event"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbud()I

    move-result v2

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzmx(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x6

    const-string/jumbo v1, "user property"

    invoke-virtual {p0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzaz(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-string/jumbo v1, "user property"

    sget-object v2, Lcom/google/android/gms/measurement/AppMeasurement$zzg;->aqC:Ljava/util/Map;

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const/16 v0, 0xf

    goto :goto_0

    :cond_2
    const-string/jumbo v1, "user property"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbue()I

    move-result v2

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzmy(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x6

    const-string/jumbo v1, "user property"

    invoke-virtual {p0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzba(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-string/jumbo v1, "user property"

    sget-object v2, Lcom/google/android/gms/measurement/AppMeasurement$zzg;->aqC:Ljava/util/Map;

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const/16 v0, 0xf

    goto :goto_0

    :cond_2
    const-string/jumbo v1, "user property"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbue()I

    move-result v2

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzmz(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x3

    const-string/jumbo v1, "event param"

    invoke-virtual {p0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzaz(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-string/jumbo v1, "event param"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const/16 v0, 0xe

    goto :goto_0

    :cond_2
    const-string/jumbo v1, "event param"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuf()I

    move-result v2

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzn(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    const-string/jumbo v0, "_ldl"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zznd(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zznd(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public zzna(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x3

    const-string/jumbo v1, "event param"

    invoke-virtual {p0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzba(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-string/jumbo v1, "event param"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const/16 v0, 0xe

    goto :goto_0

    :cond_2
    const-string/jumbo v1, "event param"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuf()I

    move-result v2

    invoke-virtual {p0, v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zznb(Ljava/lang/String;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Measurement Service called without google_app_id"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :goto_0
    return v0

    :cond_0
    const-string/jumbo v2, "^\\d+:.*"

    invoke-virtual {p1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Measurement Service called with invalid id version"

    invoke-virtual {v1, v2, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const-string/jumbo v2, "1:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Measurement Service called with unknown id version"

    invoke-virtual {v0, v2, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    move v0, v1

    goto :goto_0

    :cond_2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/measurement/internal/zzal;->zznc(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Invalid google_app_id. Firebase Analytics disabled. See"

    const-string/jumbo v3, "https://goo.gl/FZRIUV"

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method zznc(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "^1:\\d+:android:[a-f0-9]+$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public zznf(Ljava/lang/String;)Z
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvn()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method zznh(Ljava/lang/String;)Z
    .locals 3

    const-string/jumbo v0, "1"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v1

    const-string/jumbo v2, "measurement.upload.blacklist_internal"

    invoke-virtual {v1, p1, v2}, Lcom/google/android/gms/measurement/internal/zzv;->zzaw(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method zzni(Ljava/lang/String;)Z
    .locals 3

    const-string/jumbo v0, "1"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v1

    const-string/jumbo v2, "measurement.upload.blacklist_public"

    invoke-virtual {v1, p1, v2}, Lcom/google/android/gms/measurement/internal/zzv;->zzaw(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public zzu(Landroid/net/Uri;)Landroid/os/Bundle;
    .locals 6
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-object v1

    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->isHierarchical()Z

    move-result v0

    if-eqz v0, :cond_b

    const-string/jumbo v0, "utm_campaign"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v0, "utm_source"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v0, "utm_medium"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v0, "gclid"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_1
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    :cond_2
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string/jumbo v5, "campaign"

    invoke-virtual {v1, v5, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string/jumbo v4, "source"

    invoke-virtual {v1, v4, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string/jumbo v3, "medium"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    const-string/jumbo v2, "gclid"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    const-string/jumbo v0, "utm_term"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string/jumbo v2, "term"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    const-string/jumbo v0, "utm_content"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string/jumbo v2, "content"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    const-string/jumbo v0, "aclid"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9

    const-string/jumbo v2, "aclid"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    const-string/jumbo v0, "cp1"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a

    const-string/jumbo v2, "cp1"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_a
    const-string/jumbo v0, "anid"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "anid"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Install referrer url isn\'t a hierarchical URI"

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    :cond_b
    move-object v0, v1

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    goto/16 :goto_1
.end method

.method public zzx([B)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    new-instance v1, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v3, 0x400

    new-array v3, v3, [B

    :goto_0
    invoke-virtual {v1, v3}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v4

    if-gtz v4, :cond_0

    invoke-virtual {v1}, Ljava/util/zip/GZIPInputStream;->close()V

    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Failed to ungzip content"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public zzz([B)J
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzzx()V

    const-string/jumbo v0, "MD5"

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzal;->zzfl(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzal;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Failed to get MD5"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzal;->zzy([B)J

    move-result-wide v0

    goto :goto_0
.end method

.method public bridge synthetic zzzx()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzz;->zzzx()V

    return-void
.end method
