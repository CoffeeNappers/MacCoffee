.class public Lcom/google/android/gms/internal/zziy;
.super Lcom/google/android/gms/internal/zzit;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private final zzalt:Lcom/google/android/gms/internal/zzdz;

.field private zzamf:Lcom/google/android/gms/internal/zzgz;

.field private final zzbnz:Lcom/google/android/gms/internal/zzmd;

.field private zzbwc:Lcom/google/android/gms/internal/zzgq;

.field zzchc:Lcom/google/android/gms/internal/zzgo;

.field protected zzchd:Lcom/google/android/gms/internal/zzgu;

.field private zzche:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzko$zza;Lcom/google/android/gms/internal/zzgz;Lcom/google/android/gms/internal/zziu$zza;Lcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/internal/zzmd;)V
    .locals 1

    invoke-direct {p0, p1, p2, p4}, Lcom/google/android/gms/internal/zzit;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzko$zza;Lcom/google/android/gms/internal/zziu$zza;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/zziy;->zzamf:Lcom/google/android/gms/internal/zzgz;

    iget-object v0, p2, Lcom/google/android/gms/internal/zzko$zza;->zzcsk:Lcom/google/android/gms/internal/zzgq;

    iput-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    iput-object p5, p0, Lcom/google/android/gms/internal/zziy;->zzalt:Lcom/google/android/gms/internal/zzdz;

    iput-object p6, p0, Lcom/google/android/gms/internal/zziy;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zziy;)Lcom/google/android/gms/internal/zzmd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    return-object v0
.end method

.method private static zza(Lcom/google/android/gms/internal/zzgu;)Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgu;->zzbwm:Lcom/google/android/gms/internal/zzgp;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgp;->zzbuv:Ljava/lang/String;

    iget v1, p0, Lcom/google/android/gms/internal/zzgu;->zzbwl:I

    invoke-static {v1}, Lcom/google/android/gms/internal/zziy;->zzar(I)I

    move-result v1

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzgu;->zzbwr:J

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x21

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, "."

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zziy;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zziy;->zzche:Z

    return p1
.end method

.method private static zzar(I)I
    .locals 1

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    const/4 v0, 0x6

    :goto_0
    return v0

    :pswitch_1
    const/4 v0, 0x0

    goto :goto_0

    :pswitch_2
    const/4 v0, 0x1

    goto :goto_0

    :pswitch_3
    const/4 v0, 0x2

    goto :goto_0

    :pswitch_4
    const/4 v0, 0x3

    goto :goto_0

    :pswitch_5
    const/4 v0, 0x4

    goto :goto_0

    :pswitch_6
    const/4 v0, 0x5

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_5
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_6
    .end packed-switch
.end method

.method private static zzg(Ljava/util/List;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzgu;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const/4 v6, 0x0

    const-string/jumbo v0, ""

    if-nez p0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v1, v0

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgu;

    if-eqz v0, :cond_1

    iget-object v3, v0, Lcom/google/android/gms/internal/zzgu;->zzbwm:Lcom/google/android/gms/internal/zzgp;

    if-eqz v3, :cond_1

    iget-object v3, v0, Lcom/google/android/gms/internal/zzgu;->zzbwm:Lcom/google/android/gms/internal/zzgp;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzgp;->zzbuv:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/google/android/gms/internal/zziy;->zza(Lcom/google/android/gms/internal/zzgu;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_1

    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {v1, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private zzsg()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzit$zza;
        }
    .end annotation

    const/4 v4, 0x0

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    sget-object v1, Lcom/google/android/gms/internal/zzlb;->zzcvl:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/zziy$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zziy$1;-><init>(Lcom/google/android/gms/internal/zziy;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const-wide/16 v2, 0xa

    :try_start_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zziy;->zzcgi:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zziy;->zzche:Z

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzit$zza;

    const-string/jumbo v2, "View could not be prepared"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3}, Lcom/google/android/gms/internal/zzit$zza;-><init>(Ljava/lang/String;I)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/zzit$zza;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x26

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Interrupted while waiting for latch : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0, v4}, Lcom/google/android/gms/internal/zzit$zza;-><init>(Ljava/lang/String;I)V

    throw v1

    :cond_0
    :try_start_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzit$zza;

    const-string/jumbo v2, "Assets not loaded, web view is destroyed"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3}, Lcom/google/android/gms/internal/zzit$zza;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-void
.end method


# virtual methods
.method public onStop()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zziy;->zzcgi:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-super {p0}, Lcom/google/android/gms/internal/zzit;->onStop()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzchc:Lcom/google/android/gms/internal/zzgo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzchc:Lcom/google/android/gms/internal/zzgo;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzgo;->cancel()V

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected zzap(I)Lcom/google/android/gms/internal/zzko;
    .locals 39

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zziy;->zzcgf:Lcom/google/android/gms/internal/zzko$zza;

    iget-object v6, v2, Lcom/google/android/gms/internal/zzko$zza;->zzcmx:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    new-instance v2, Lcom/google/android/gms/internal/zzko;

    iget-object v3, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcju:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/internal/zziy;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbvk:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v7, v7, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbvl:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v8, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcld:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget v9, v9, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->orientation:I

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v10, v10, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbvq:J

    iget-object v12, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcjx:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v13, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzclb:Z

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    if-eqz v6, :cond_0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    iget-object v14, v6, Lcom/google/android/gms/internal/zzgu;->zzbwm:Lcom/google/android/gms/internal/zzgp;

    :goto_0
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    if-eqz v6, :cond_1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    iget-object v15, v6, Lcom/google/android/gms/internal/zzgu;->zzbwn:Lcom/google/android/gms/internal/zzha;

    :goto_1
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    if-eqz v6, :cond_2

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzgu;->zzbwo:Ljava/lang/String;

    move-object/from16 v16, v0

    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zziy;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    if-eqz v6, :cond_3

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzgu;->zzbwp:Lcom/google/android/gms/internal/zzgs;

    move-object/from16 v18, v0

    :goto_3
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzclc:J

    move-wide/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgf:Lcom/google/android/gms/internal/zzko$zza;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzko$zza;->zzarm:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcla:J

    move-wide/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgf:Lcom/google/android/gms/internal/zzko$zza;

    iget-wide v0, v6, Lcom/google/android/gms/internal/zzko$zza;->zzcso:J

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzclf:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzclg:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgf:Lcom/google/android/gms/internal/zzko$zza;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzko$zza;->zzcsi:Lorg/json/JSONObject;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzclq:Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzclr:Ljava/util/List;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcls:Ljava/util/List;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    if-eqz v6, :cond_4

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    iget-boolean v0, v6, Lcom/google/android/gms/internal/zzgq;->zzbvv:Z

    move/from16 v34, v0

    :goto_4
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzclu:Lcom/google/android/gms/ads/internal/request/AutoClickProtectionConfigurationParcel;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzchc:Lcom/google/android/gms/internal/zzgo;

    if-eqz v6, :cond_5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzchc:Lcom/google/android/gms/internal/zzgo;

    invoke-interface {v6}, Lcom/google/android/gms/internal/zzgo;->zzoe()Ljava/util/List;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/internal/zziy;->zzg(Ljava/util/List;)Ljava/lang/String;

    move-result-object v36

    :goto_5
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbvn:Ljava/util/List;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzclx:Ljava/lang/String;

    move-object/from16 v38, v0

    move/from16 v6, p1

    invoke-direct/range {v2 .. v38}, Lcom/google/android/gms/internal/zzko;-><init>(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzmd;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/zzgp;Lcom/google/android/gms/internal/zzha;Ljava/lang/String;Lcom/google/android/gms/internal/zzgq;Lcom/google/android/gms/internal/zzgs;JLcom/google/android/gms/ads/internal/client/AdSizeParcel;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzi$zza;Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;Ljava/util/List;Ljava/util/List;ZLcom/google/android/gms/ads/internal/request/AutoClickProtectionConfigurationParcel;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    return-object v2

    :cond_0
    const/4 v14, 0x0

    goto/16 :goto_0

    :cond_1
    const/4 v15, 0x0

    goto/16 :goto_1

    :cond_2
    const-class v6, Lcom/google/ads/mediation/admob/AdMobAdapter;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_2

    :cond_3
    const/16 v18, 0x0

    goto/16 :goto_3

    :cond_4
    const/16 v34, 0x0

    goto :goto_4

    :cond_5
    const/16 v36, 0x0

    goto :goto_5
.end method

.method protected zzh(J)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzit$zza;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/internal/zziy;->zzcgi:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zziy;->zzi(J)Lcom/google/android/gms/internal/zzgo;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzchc:Lcom/google/android/gms/internal/zzgo;

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v2, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgq;->zzbvi:Ljava/util/List;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzcgf:Lcom/google/android/gms/internal/zzko$zza;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzko$zza;->zzcmx:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcju:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzayv:Landroid/os/Bundle;

    const-string/jumbo v3, "com.google.ads.mediation.admob.AdMobAdapter"

    if-eqz v0, :cond_3

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_3

    const-string/jumbo v4, "_skipMediation"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/ListIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v4}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgp;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgp;->zzbuu:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {v4}, Ljava/util/ListIterator;->remove()V

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzchc:Lcom/google/android/gms/internal/zzgo;

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzgo;->zzd(Ljava/util/List;)Lcom/google/android/gms/internal/zzgu;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    iget v0, v0, Lcom/google/android/gms/internal/zzgu;->zzbwl:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lcom/google/android/gms/internal/zzit$zza;

    iget-object v2, p0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    iget v2, v2, Lcom/google/android/gms/internal/zzgu;->zzbwl:I

    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x28

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "Unexpected mediation result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/google/android/gms/internal/zzit$zza;-><init>(Ljava/lang/String;I)V

    throw v0

    :pswitch_0
    new-instance v0, Lcom/google/android/gms/internal/zzit$zza;

    const-string/jumbo v1, "No fill from any mediation ad networks."

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzit$zza;-><init>(Ljava/lang/String;I)V

    throw v0

    :pswitch_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgu;->zzbwm:Lcom/google/android/gms/internal/zzgp;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgu;->zzbwm:Lcom/google/android/gms/internal/zzgp;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgp;->zzbvd:Ljava/lang/String;

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zziy;->zzsg()V

    :cond_2
    return-void

    :cond_3
    move v0, v1

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method zzi(J)Lcom/google/android/gms/internal/zzgo;
    .locals 13

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    iget v0, v0, Lcom/google/android/gms/internal/zzgq;->zzbvt:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/zzgw;

    iget-object v2, p0, Lcom/google/android/gms/internal/zziy;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzcgf:Lcom/google/android/gms/internal/zzko$zza;

    iget-object v3, v0, Lcom/google/android/gms/internal/zzko$zza;->zzcmx:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v4, p0, Lcom/google/android/gms/internal/zziy;->zzamf:Lcom/google/android/gms/internal/zzgz;

    iget-object v5, p0, Lcom/google/android/gms/internal/zziy;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v6, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzazt:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v7, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzazv:Z

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbhk:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    const/4 v12, 0x2

    move-wide v8, p1

    invoke-direct/range {v1 .. v12}, Lcom/google/android/gms/internal/zzgw;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzgz;Lcom/google/android/gms/internal/zzgq;ZZJJI)V

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/zzgx;

    iget-object v2, p0, Lcom/google/android/gms/internal/zziy;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzcgf:Lcom/google/android/gms/internal/zzko$zza;

    iget-object v3, v0, Lcom/google/android/gms/internal/zzko$zza;->zzcmx:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v4, p0, Lcom/google/android/gms/internal/zziy;->zzamf:Lcom/google/android/gms/internal/zzgz;

    iget-object v5, p0, Lcom/google/android/gms/internal/zziy;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v6, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzazt:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy;->zzcgg:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v7, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzazv:Z

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbhk:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    iget-object v12, p0, Lcom/google/android/gms/internal/zziy;->zzalt:Lcom/google/android/gms/internal/zzdz;

    move-wide v8, p1

    invoke-direct/range {v1 .. v12}, Lcom/google/android/gms/internal/zzgx;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzgz;Lcom/google/android/gms/internal/zzgq;ZZJJLcom/google/android/gms/internal/zzdz;)V

    goto :goto_0
.end method
