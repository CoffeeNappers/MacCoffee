.class public Lcom/google/android/gms/analytics/internal/zzf;
.super Ljava/lang/Object;


# static fields
.field private static volatile cT:Lcom/google/android/gms/analytics/internal/zzf;


# instance fields
.field private final cU:Landroid/content/Context;

.field private final cV:Lcom/google/android/gms/analytics/internal/zzr;

.field private final cW:Lcom/google/android/gms/analytics/internal/zzaf;

.field private final cX:Lcom/google/android/gms/analytics/zzi;

.field private final cY:Lcom/google/android/gms/analytics/internal/zzb;

.field private final cZ:Lcom/google/android/gms/analytics/internal/zzv;

.field private final da:Lcom/google/android/gms/analytics/internal/zzap;

.field private final db:Lcom/google/android/gms/analytics/internal/zzai;

.field private final dc:Lcom/google/android/gms/analytics/GoogleAnalytics;

.field private final dd:Lcom/google/android/gms/analytics/internal/zzn;

.field private final de:Lcom/google/android/gms/analytics/internal/zza;

.field private final df:Lcom/google/android/gms/analytics/internal/zzk;

.field private final dg:Lcom/google/android/gms/analytics/internal/zzu;

.field private final mContext:Landroid/content/Context;

.field private final zzaql:Lcom/google/android/gms/common/util/zze;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/analytics/internal/zzg;)V
    .locals 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzg;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "Application context can\'t be null"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzaa;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzg;->zzacl()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->mContext:Landroid/content/Context;

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->cU:Landroid/content/Context;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzh(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzaql:Lcom/google/android/gms/common/util/zze;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzg(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->cV:Lcom/google/android/gms/analytics/internal/zzr;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzf(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzaf;->initialize()V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->cW:Lcom/google/android/gms/analytics/internal/zzaf;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzacb()Lcom/google/android/gms/analytics/internal/zzr;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzaca()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/analytics/internal/zze;->VERSION:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit16 v4, v4, 0x86

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "Google Analytics "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " is starting up. To enable debug logging on a device run:\n  adb shell setprop log.tag.GAv4 DEBUG\n  adb logcat -s GAv4"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zzeu(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzq(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzai;->initialize()V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->db:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zze(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzap;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzap;->initialize()V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->da:Lcom/google/android/gms/analytics/internal/zzap;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzl(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v1

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzd(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzn;

    move-result-object v2

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzc(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zza;

    move-result-object v3

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzb(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzk;

    move-result-object v4

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zza(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzu;

    move-result-object v5

    invoke-virtual {p1, v0}, Lcom/google/android/gms/analytics/internal/zzg;->zzax(Landroid/content/Context;)Lcom/google/android/gms/analytics/zzi;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzack()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/google/android/gms/analytics/zzi;->zza(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cX:Lcom/google/android/gms/analytics/zzi;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzi(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v0

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzn;->initialize()V

    iput-object v2, p0, Lcom/google/android/gms/analytics/internal/zzf;->dd:Lcom/google/android/gms/analytics/internal/zzn;

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/internal/zza;->initialize()V

    iput-object v3, p0, Lcom/google/android/gms/analytics/internal/zzf;->de:Lcom/google/android/gms/analytics/internal/zza;

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzk;->initialize()V

    iput-object v4, p0, Lcom/google/android/gms/analytics/internal/zzf;->df:Lcom/google/android/gms/analytics/internal/zzk;

    invoke-virtual {v5}, Lcom/google/android/gms/analytics/internal/zzu;->initialize()V

    iput-object v5, p0, Lcom/google/android/gms/analytics/internal/zzf;->dg:Lcom/google/android/gms/analytics/internal/zzu;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzp(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzv;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzv;->initialize()V

    iput-object v2, p0, Lcom/google/android/gms/analytics/internal/zzf;->cZ:Lcom/google/android/gms/analytics/internal/zzv;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzb;->initialize()V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->cY:Lcom/google/android/gms/analytics/internal/zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzacb()Lcom/google/android/gms/analytics/internal/zzr;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->dc:Lcom/google/android/gms/analytics/GoogleAnalytics;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzb;->start()V

    return-void
.end method

.method private zza(Lcom/google/android/gms/analytics/internal/zzd;)V
    .locals 2

    const-string/jumbo v0, "Analytics service not created/initialized"

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/zzaa;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzd;->isInitialized()Z

    move-result v0

    const-string/jumbo v1, "Analytics service not initialized"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzaa;->zzb(ZLjava/lang/Object;)V

    return-void
.end method

.method public static zzaw(Landroid/content/Context;)Lcom/google/android/gms/analytics/internal/zzf;
    .locals 8

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzf;->cT:Lcom/google/android/gms/analytics/internal/zzf;

    if-nez v0, :cond_1

    const-class v1, Lcom/google/android/gms/analytics/internal/zzf;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/android/gms/analytics/internal/zzf;->cT:Lcom/google/android/gms/analytics/internal/zzf;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/common/util/zzh;->zzayl()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v2

    new-instance v4, Lcom/google/android/gms/analytics/internal/zzg;

    invoke-direct {v4, p0}, Lcom/google/android/gms/analytics/internal/zzg;-><init>(Landroid/content/Context;)V

    new-instance v5, Lcom/google/android/gms/analytics/internal/zzf;

    invoke-direct {v5, v4}, Lcom/google/android/gms/analytics/internal/zzf;-><init>(Lcom/google/android/gms/analytics/internal/zzg;)V

    sput-object v5, Lcom/google/android/gms/analytics/internal/zzf;->cT:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-static {}, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzzd()V

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v6

    sub-long v2, v6, v2

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzy;->fb:Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzy$zza;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v0, v2, v6

    if-lez v0, :cond_0

    invoke-virtual {v5}, Lcom/google/android/gms/analytics/internal/zzf;->zzaca()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string/jumbo v4, "Slow initialization (ms)"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v4, v2, v3}, Lcom/google/android/gms/analytics/internal/zzaf;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/google/android/gms/analytics/internal/zzf;->cT:Lcom/google/android/gms/analytics/internal/zzf;

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
.method public getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public zzabz()Lcom/google/android/gms/common/util/zze;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzaql:Lcom/google/android/gms/common/util/zze;

    return-object v0
.end method

.method public zzaca()Lcom/google/android/gms/analytics/internal/zzaf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cW:Lcom/google/android/gms/analytics/internal/zzaf;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cW:Lcom/google/android/gms/analytics/internal/zzaf;

    return-object v0
.end method

.method public zzacb()Lcom/google/android/gms/analytics/internal/zzr;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cV:Lcom/google/android/gms/analytics/internal/zzr;

    return-object v0
.end method

.method public zzacc()Lcom/google/android/gms/analytics/zzi;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cX:Lcom/google/android/gms/analytics/zzi;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cX:Lcom/google/android/gms/analytics/zzi;

    return-object v0
.end method

.method public zzacd()Lcom/google/android/gms/analytics/internal/zzv;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cZ:Lcom/google/android/gms/analytics/internal/zzv;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cZ:Lcom/google/android/gms/analytics/internal/zzv;

    return-object v0
.end method

.method public zzace()Lcom/google/android/gms/analytics/internal/zzai;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->db:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->db:Lcom/google/android/gms/analytics/internal/zzai;

    return-object v0
.end method

.method public zzach()Lcom/google/android/gms/analytics/internal/zzk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->df:Lcom/google/android/gms/analytics/internal/zzk;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->df:Lcom/google/android/gms/analytics/internal/zzk;

    return-object v0
.end method

.method public zzaci()Lcom/google/android/gms/analytics/internal/zzu;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->dg:Lcom/google/android/gms/analytics/internal/zzu;

    return-object v0
.end method

.method protected zzack()Ljava/lang/Thread$UncaughtExceptionHandler;
    .locals 1

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzf$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/analytics/internal/zzf$1;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    return-object v0
.end method

.method public zzacl()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cU:Landroid/content/Context;

    return-object v0
.end method

.method public zzacm()Lcom/google/android/gms/analytics/internal/zzaf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cW:Lcom/google/android/gms/analytics/internal/zzaf;

    return-object v0
.end method

.method public zzacn()Lcom/google/android/gms/analytics/GoogleAnalytics;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->dc:Lcom/google/android/gms/analytics/GoogleAnalytics;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->dc:Lcom/google/android/gms/analytics/GoogleAnalytics;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->isInitialized()Z

    move-result v0

    const-string/jumbo v1, "Analytics instance not initialized"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzaa;->zzb(ZLjava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->dc:Lcom/google/android/gms/analytics/GoogleAnalytics;

    return-object v0
.end method

.method public zzaco()Lcom/google/android/gms/analytics/internal/zzai;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->db:Lcom/google/android/gms/analytics/internal/zzai;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->db:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->db:Lcom/google/android/gms/analytics/internal/zzai;

    goto :goto_0
.end method

.method public zzacp()Lcom/google/android/gms/analytics/internal/zza;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->de:Lcom/google/android/gms/analytics/internal/zza;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->de:Lcom/google/android/gms/analytics/internal/zza;

    return-object v0
.end method

.method public zzacq()Lcom/google/android/gms/analytics/internal/zzn;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->dd:Lcom/google/android/gms/analytics/internal/zzn;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->dd:Lcom/google/android/gms/analytics/internal/zzn;

    return-object v0
.end method

.method public zzzg()Lcom/google/android/gms/analytics/internal/zzb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cY:Lcom/google/android/gms/analytics/internal/zzb;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->cY:Lcom/google/android/gms/analytics/internal/zzb;

    return-object v0
.end method

.method public zzzh()Lcom/google/android/gms/analytics/internal/zzap;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->da:Lcom/google/android/gms/analytics/internal/zzap;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->da:Lcom/google/android/gms/analytics/internal/zzap;

    return-object v0
.end method

.method public zzzx()V
    .locals 0

    invoke-static {}, Lcom/google/android/gms/analytics/zzi;->zzzx()V

    return-void
.end method
