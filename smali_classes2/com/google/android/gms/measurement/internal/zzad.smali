.class public Lcom/google/android/gms/measurement/internal/zzad;
.super Lcom/google/android/gms/measurement/internal/zzaa;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/measurement/internal/zzad$zza;
    }
.end annotation


# instance fields
.field protected avd:Lcom/google/android/gms/measurement/internal/zzad$zza;

.field private ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

.field private avf:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

.field private avg:J

.field private final avh:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/measurement/internal/zzad$zza;",
            ">;"
        }
    .end annotation
.end field

.field private final avi:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Lcom/google/android/gms/measurement/AppMeasurement$zzd;",
            ">;"
        }
    .end annotation
.end field

.field private avj:Z

.field private final avk:Ljava/util/concurrent/atomic/AtomicLong;

.field private avl:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

.field private avm:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/zzx;)V
    .locals 4

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzaa;-><init>(Lcom/google/android/gms/measurement/internal/zzx;)V

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avh:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avi:Ljava/util/concurrent/CopyOnWriteArrayList;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avk:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method private zza(Landroid/app/Activity;Lcom/google/android/gms/measurement/internal/zzad$zza;Z)V
    .locals 9
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    const/4 v0, 0x0

    const/4 v2, 0x1

    const/4 v8, 0x0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    :goto_0
    if-eqz v1, :cond_4

    new-instance v0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    invoke-direct {v0, v1}, Lcom/google/android/gms/measurement/AppMeasurement$zzf;-><init>(Lcom/google/android/gms/measurement/AppMeasurement$zzf;)V

    move-object v1, v0

    :goto_1
    iput-boolean v2, p0, Lcom/google/android/gms/measurement/internal/zzad;->avj:Z

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avi:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/AppMeasurement$zzd;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/measurement/AppMeasurement$zzd;->zza(Lcom/google/android/gms/measurement/AppMeasurement$zzf;Lcom/google/android/gms/measurement/AppMeasurement$zzf;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    and-int/2addr v0, v2

    :goto_3
    move v2, v0

    goto :goto_2

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad;->avf:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    if-eqz v1, :cond_5

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/google/android/gms/measurement/internal/zzad;->avg:J

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    cmp-long v1, v4, v6

    if-gez v1, :cond_5

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad;->avf:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v4

    const-string/jumbo v5, "onScreenChangeCallback threw exception"

    invoke-virtual {v4, v5, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move v0, v2

    goto :goto_3

    :cond_1
    iput-boolean v8, p0, Lcom/google/android/gms/measurement/internal/zzad;->avj:Z

    :goto_4
    if-eqz v2, :cond_3

    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/zzad$zza;->aqA:Ljava/lang/String;

    if-nez v0, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzad;->zzmt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/google/android/gms/measurement/internal/zzad$zza;->aqA:Ljava/lang/String;

    :cond_2
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzad$zza;

    invoke-direct {v0, p2}, Lcom/google/android/gms/measurement/internal/zzad$zza;-><init>(Lcom/google/android/gms/measurement/internal/zzad$zza;)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    iput-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad;->avf:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzad;->avg:J

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwa()Lcom/google/android/gms/measurement/internal/zzw;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/measurement/internal/zzad$1;

    invoke-direct {v2, p0, p3, v0}, Lcom/google/android/gms/measurement/internal/zzad$1;-><init>(Lcom/google/android/gms/measurement/internal/zzad;ZLcom/google/android/gms/measurement/internal/zzad$zza;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzw;->zzm(Ljava/lang/Runnable;)V

    :cond_3
    return-void

    :catch_1
    move-exception v0

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v3, "onScreenChangeCallback loop threw exception"

    invoke-virtual {v1, v3, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    iput-boolean v8, p0, Lcom/google/android/gms/measurement/internal/zzad;->avj:Z

    goto :goto_4

    :catchall_0
    move-exception v0

    iput-boolean v8, p0, Lcom/google/android/gms/measurement/internal/zzad;->avj:Z

    throw v0

    :cond_4
    move-object v1, v0

    goto/16 :goto_1

    :cond_5
    move-object v1, v0

    goto/16 :goto_0
.end method

.method public static zza(Lcom/google/android/gms/measurement/AppMeasurement$zzf;Landroid/os/Bundle;)V
    .locals 4

    if-eqz p1, :cond_1

    if-eqz p0, :cond_1

    const-string/jumbo v0, "_sc"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqz:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "_sn"

    iget-object v1, p0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqz:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string/jumbo v0, "_sc"

    iget-object v1, p0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqA:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "_si"

    iget-wide v2, p0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqB:J

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_1
    return-void
.end method

.method private zza(Lcom/google/android/gms/measurement/internal/zzad$zza;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/measurement/internal/zzad$zza;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbvz()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    iget-boolean v1, p1, Lcom/google/android/gms/measurement/internal/zzad$zza;->avr:Z

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzag;->zzck(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/google/android/gms/measurement/internal/zzad$zza;->avr:Z

    :cond_0
    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzad;Lcom/google/android/gms/measurement/internal/zzad$zza;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzad;->zza(Lcom/google/android/gms/measurement/internal/zzad$zza;)V

    return-void
.end method

.method private zzbyu()J
    .locals 8
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    const-wide/16 v6, 0x1

    const-wide/16 v4, 0x0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avk:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v0

    cmp-long v2, v0, v4

    if-nez v2, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avk:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, v6, v7, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    new-instance v0, Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v4

    xor-long/2addr v2, v4

    invoke-direct {v0, v2, v3}, Ljava/util/Random;-><init>(J)V

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzad;->avk:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2, v4, v5, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    goto :goto_0
.end method

.method static zzmt(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const/4 v3, 0x0

    const/16 v2, 0x24

    const-string/jumbo v0, "\\."

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    if-nez v1, :cond_1

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v2, :cond_0

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic getContext()Landroid/content/Context;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 4
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    if-nez p2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string/jumbo v0, "com.google.firebase.analytics.screen_service"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/measurement/internal/zzad;->zzv(Landroid/app/Activity;)Lcom/google/android/gms/measurement/internal/zzad$zza;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/google/android/gms/measurement/internal/zzad$zza;->aqB:J

    const-string/jumbo v2, "name"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/google/android/gms/measurement/internal/zzad$zza;->aqz:Ljava/lang/String;

    const-string/jumbo v2, "referrer_name"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/gms/measurement/internal/zzad$zza;->aqA:Ljava/lang/String;

    goto :goto_0
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 1
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avh:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 4
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/measurement/internal/zzad;->zzv(Landroid/app/Activity;)Lcom/google/android/gms/measurement/internal/zzad$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    iput-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad;->avf:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzad;->avg:J

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwa()Lcom/google/android/gms/measurement/internal/zzw;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/measurement/internal/zzad$2;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/measurement/internal/zzad$2;-><init>(Lcom/google/android/gms/measurement/internal/zzad;Lcom/google/android/gms/measurement/internal/zzad$zza;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzw;->zzm(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 2
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/measurement/internal/zzad;->zzv(Landroid/app/Activity;)Lcom/google/android/gms/measurement/internal/zzad$zza;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzad;->zza(Landroid/app/Activity;Lcom/google/android/gms/measurement/internal/zzad$zza;Z)V

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 6
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    if-nez p2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avh:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzad$zza;

    if-eqz v0, :cond_0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v2, "id"

    iget-wide v4, v0, Lcom/google/android/gms/measurement/internal/zzad$zza;->aqB:J

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string/jumbo v2, "name"

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzad$zza;->aqz:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v2, "referrer_name"

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzad$zza;->aqA:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "com.google.firebase.analytics.screen_service"

    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method public registerOnScreenChangeCallback(Lcom/google/android/gms/measurement/AppMeasurement$zzd;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/measurement/AppMeasurement$zzd;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzaby()V

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Attempting to register null OnScreenChangeCallback"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avi:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avi:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public setCurrentScreen(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation

        .annotation build Landroid/support/annotation/Size;
            max = 0x24L
            min = 0x1L
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation

        .annotation build Landroid/support/annotation/Size;
            max = 0x24L
            min = 0x1L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    const/4 v1, 0x1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-ge v0, v2, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxb()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Screen engagement recording is only available at API level 14+"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "setCurrentScreen must be called with a non-null activity"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwa()Lcom/google/android/gms/measurement/internal/zzw;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzw;->zzdg()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "setCurrentScreen must be called from the main thread"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avj:Z

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Cannot call setCurrentScreen from onScreenChangeCallback"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "setCurrentScreen cannot be called while no activity active"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avh:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "setCurrentScreen must be called with an activity in the activity lifecycle"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    if-nez p3, :cond_6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzad;->zzmt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    iget-object v0, v0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqA:Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    iget-object v0, v0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqz:Ljava/lang/String;

    if-nez v0, :cond_7

    if-eqz p2, :cond_8

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    iget-object v0, v0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqz:Ljava/lang/String;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->ave:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    iget-object v0, v0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqz:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_8
    move v0, v1

    :goto_1
    if-eqz v2, :cond_a

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxb()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "setCurrentScreen cannot be called with the same class and name"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_9
    const/4 v0, 0x0

    goto :goto_1

    :cond_a
    if-eqz p2, :cond_c

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v1, :cond_b

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbug()I

    move-result v2

    if-le v0, v2, :cond_c

    :cond_b
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Invalid screen name length in setCurrentScreen. Length"

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    :cond_c
    if-eqz p3, :cond_e

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v1, :cond_d

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbug()I

    move-result v2

    if-le v0, v2, :cond_e

    :cond_d
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Invalid class name length in setCurrentScreen. Length"

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    :cond_e
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Setting current screen to name, class"

    if-nez p2, :cond_f

    const-string/jumbo v0, "null"

    :goto_2
    invoke-virtual {v2, v3, v0, p3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzad$zza;

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbyu()J

    move-result-wide v2

    invoke-direct {v0, p2, p3, v2, v3}, Lcom/google/android/gms/measurement/internal/zzad$zza;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzad;->avh:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzad;->zza(Landroid/app/Activity;Lcom/google/android/gms/measurement/internal/zzad$zza;Z)V

    goto/16 :goto_0

    :cond_f
    move-object v0, p2

    goto :goto_2
.end method

.method public unregisterOnScreenChangeCallback(Lcom/google/android/gms/measurement/AppMeasurement$zzd;)V
    .locals 1
    .param p1    # Lcom/google/android/gms/measurement/AppMeasurement$zzd;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzaby()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avi:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/measurement/AppMeasurement$zzf;)V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzzx()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avm:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avm:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p2, :cond_1

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzad;->avm:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzad;->avl:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    :cond_1
    return-void
.end method

.method public bridge synthetic zzaby()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzaby()V

    return-void
.end method

.method public bridge synthetic zzabz()Lcom/google/android/gms/common/util/zze;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvo()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvo()V

    return-void
.end method

.method public bridge synthetic zzbvp()Lcom/google/android/gms/measurement/internal/zzc;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvp()Lcom/google/android/gms/measurement/internal/zzc;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvq()Lcom/google/android/gms/measurement/internal/zzac;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvq()Lcom/google/android/gms/measurement/internal/zzac;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvr()Lcom/google/android/gms/measurement/internal/zzn;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvs()Lcom/google/android/gms/measurement/internal/zzg;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvt()Lcom/google/android/gms/measurement/internal/zzae;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvt()Lcom/google/android/gms/measurement/internal/zzae;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvu()Lcom/google/android/gms/measurement/internal/zzad;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvu()Lcom/google/android/gms/measurement/internal/zzad;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvv()Lcom/google/android/gms/measurement/internal/zzo;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvv()Lcom/google/android/gms/measurement/internal/zzo;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvw()Lcom/google/android/gms/measurement/internal/zze;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvx()Lcom/google/android/gms/measurement/internal/zzal;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvy()Lcom/google/android/gms/measurement/internal/zzv;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbvz()Lcom/google/android/gms/measurement/internal/zzag;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvz()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbwa()Lcom/google/android/gms/measurement/internal/zzw;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbwa()Lcom/google/android/gms/measurement/internal/zzw;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbwb()Lcom/google/android/gms/measurement/internal/zzq;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbwc()Lcom/google/android/gms/measurement/internal/zzt;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzbwd()Lcom/google/android/gms/measurement/internal/zzd;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    return-object v0
.end method

.method public zzbyt()Lcom/google/android/gms/measurement/internal/zzad$zza;
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzacj()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzzx()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avd:Lcom/google/android/gms/measurement/internal/zzad$zza;

    return-object v0
.end method

.method zzv(Landroid/app/Activity;)Lcom/google/android/gms/measurement/internal/zzad$zza;
    .locals 6
    .param p1    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad;->avh:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzad$zza;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzad;->zzmt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzad$zza;

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbyu()J

    move-result-wide v4

    invoke-direct {v0, v2, v1, v4, v5}, Lcom/google/android/gms/measurement/internal/zzad$zza;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad;->avh:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public bridge synthetic zzzx()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzzx()V

    return-void
.end method

.method protected zzzy()V
    .locals 8

    const-wide/16 v6, 0x1

    const-wide/16 v2, 0x0

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v4}, Ljava/security/SecureRandom;->nextLong()J

    move-result-wide v0

    cmp-long v5, v0, v2

    if-eqz v5, :cond_0

    cmp-long v5, v0, v6

    if-nez v5, :cond_2

    :cond_0
    invoke-virtual {v4}, Ljava/security/SecureRandom;->nextLong()J

    move-result-wide v0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    cmp-long v4, v0, v6

    if-nez v4, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "ScreenService falling back to Random for screen instance id"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    move-wide v0, v2

    :cond_2
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzad;->avk:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    return-void
.end method
