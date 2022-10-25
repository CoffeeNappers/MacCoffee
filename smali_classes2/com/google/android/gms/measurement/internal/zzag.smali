.class public Lcom/google/android/gms/measurement/internal/zzag;
.super Lcom/google/android/gms/measurement/internal/zzaa;


# instance fields
.field protected avM:J

.field private final avN:Lcom/google/android/gms/measurement/internal/zzf;

.field private final avO:Lcom/google/android/gms/measurement/internal/zzf;

.field private mHandler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzx;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzaa;-><init>(Lcom/google/android/gms/measurement/internal/zzx;)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzag$1;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzag;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/measurement/internal/zzag$1;-><init>(Lcom/google/android/gms/measurement/internal/zzag;Lcom/google/android/gms/measurement/internal/zzx;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avN:Lcom/google/android/gms/measurement/internal/zzf;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzag$2;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzag;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/measurement/internal/zzag$2;-><init>(Lcom/google/android/gms/measurement/internal/zzag;Lcom/google/android/gms/measurement/internal/zzx;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avO:Lcom/google/android/gms/measurement/internal/zzf;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzag;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbzf()V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzag;J)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzag;->zzbn(J)V

    return-void
.end method

.method static synthetic zzb(Lcom/google/android/gms/measurement/internal/zzag;J)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzag;->zzbo(J)V

    return-void
.end method

.method private zzbn(J)V
    .locals 9
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const-wide/16 v6, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzzx()V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbzc()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avN:Lcom/google/android/gms/measurement/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzf;->cancel()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avO:Lcom/google/android/gms/measurement/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzf;->cancel()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Activity resumed, time"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzag;->avM:J

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzt;->atj:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzt;->atl:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->atk:Lcom/google/android/gms/measurement/internal/zzt$zza;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzt$zza;->set(Z)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->atm:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v0, v6, v7}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->atk:Lcom/google/android/gms/measurement/internal/zzt$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt$zza;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avN:Lcom/google/android/gms/measurement/internal/zzf;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v1

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzt;->ati:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v1

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzt;->atm:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzf;->zzx(J)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avO:Lcom/google/android/gms/measurement/internal/zzf;

    const-wide/32 v2, 0x36ee80

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v1

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzt;->atm:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzf;->zzx(J)V

    goto :goto_0
.end method

.method private zzbo(J)V
    .locals 7
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzzx()V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbzc()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avN:Lcom/google/android/gms/measurement/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzf;->cancel()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avO:Lcom/google/android/gms/measurement/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzf;->cancel()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Activity paused, time"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    iget-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avM:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->atm:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v1

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzt;->atm:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/gms/measurement/internal/zzag;->avM:J

    sub-long v4, p1, v4

    add-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->atl:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    return-void
.end method

.method private zzbzc()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->mHandler:Landroid/os/Handler;

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private zzbzf()V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzzx()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzag;->zzck(Z)Z

    return-void
.end method


# virtual methods
.method public bridge synthetic getContext()Landroid/content/Context;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
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

.method protected zzbzb()V
    .locals 4
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwa()Lcom/google/android/gms/measurement/internal/zzw;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/measurement/internal/zzag$3;

    invoke-direct {v3, p0, v0, v1}, Lcom/google/android/gms/measurement/internal/zzag$3;-><init>(Lcom/google/android/gms/measurement/internal/zzag;J)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzw;->zzm(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected zzbzd()V
    .locals 4
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwa()Lcom/google/android/gms/measurement/internal/zzw;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/measurement/internal/zzag$4;

    invoke-direct {v3, p0, v0, v1}, Lcom/google/android/gms/measurement/internal/zzag$4;-><init>(Lcom/google/android/gms/measurement/internal/zzag;J)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzw;->zzm(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected zzbze()V
    .locals 4
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Session started, time"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->atk:Lcom/google/android/gms/measurement/internal/zzt$zza;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzt$zza;->set(Z)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbvq()Lcom/google/android/gms/measurement/internal/zzac;

    move-result-object v0

    const-string/jumbo v1, "auto"

    const-string/jumbo v2, "_s"

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzac;->zzf(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public zzck(Z)Z
    .locals 12
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const-wide/32 v10, 0x36ee80

    const-wide/16 v8, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzacj()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzag;->avM:J

    cmp-long v2, v2, v8

    if-nez v2, :cond_0

    sub-long v2, v0, v10

    iput-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzag;->avM:J

    :cond_0
    iget-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzag;->avM:J

    sub-long v2, v0, v2

    if-nez p1, :cond_1

    const-wide/16 v4, 0x3e8

    cmp-long v4, v2, v4

    if-gez v4, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Screen exposed for less than 1000 ms. Event not sent. time"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/gms/measurement/internal/zzt;->atm:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v4, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v4

    const-string/jumbo v5, "Recording user engagement, ms"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v5, "_et"

    invoke-virtual {v4, v5, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbvu()Lcom/google/android/gms/measurement/internal/zzad;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzad;->zzbyt()Lcom/google/android/gms/measurement/internal/zzad$zza;

    move-result-object v2

    invoke-static {v2, v4}, Lcom/google/android/gms/measurement/internal/zzad;->zza(Lcom/google/android/gms/measurement/AppMeasurement$zzf;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbvq()Lcom/google/android/gms/measurement/internal/zzac;

    move-result-object v2

    const-string/jumbo v3, "auto"

    const-string/jumbo v5, "_e"

    invoke-virtual {v2, v3, v5, v4}, Lcom/google/android/gms/measurement/internal/zzac;->zzf(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avM:J

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avO:Lcom/google/android/gms/measurement/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzf;->cancel()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag;->avO:Lcom/google/android/gms/measurement/internal/zzf;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzag;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v1

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzt;->atm:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v2

    sub-long v2, v10, v2

    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzf;->zzx(J)V

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic zzzx()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzzx()V

    return-void
.end method

.method protected zzzy()V
    .locals 0

    return-void
.end method
