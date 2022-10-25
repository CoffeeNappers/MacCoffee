.class abstract Lcom/google/android/gms/measurement/internal/zzf;
.super Ljava/lang/Object;


# static fields
.field private static volatile ef:Landroid/os/Handler;


# instance fields
.field private final aqw:Lcom/google/android/gms/measurement/internal/zzx;

.field private arv:Z

.field private volatile eg:J

.field private final zzw:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzx;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzf;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzf;->arv:Z

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzf$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/measurement/internal/zzf$1;-><init>(Lcom/google/android/gms/measurement/internal/zzf;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzf;->zzw:Ljava/lang/Runnable;

    return-void
.end method

.method private getHandler()Landroid/os/Handler;
    .locals 3

    sget-object v0, Lcom/google/android/gms/measurement/internal/zzf;->ef:Landroid/os/Handler;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/android/gms/measurement/internal/zzf;->ef:Landroid/os/Handler;

    :goto_0
    return-object v0

    :cond_0
    const-class v1, Lcom/google/android/gms/measurement/internal/zzf;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/android/gms/measurement/internal/zzf;->ef:Landroid/os/Handler;

    if-nez v0, :cond_1

    new-instance v0, Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzf;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzx;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/google/android/gms/measurement/internal/zzf;->ef:Landroid/os/Handler;

    :cond_1
    sget-object v0, Lcom/google/android/gms/measurement/internal/zzf;->ef:Landroid/os/Handler;

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzf;J)J
    .locals 1

    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzf;->eg:J

    return-wide p1
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzf;)Lcom/google/android/gms/measurement/internal/zzx;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzf;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/measurement/internal/zzf;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzf;->arv:Z

    return v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzf;->eg:J

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzf;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzf;->zzw:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public abstract run()V
.end method

.method public zzfy()Z
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzf;->eg:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzx(J)V
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzf;->cancel()V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzf;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzf;->eg:J

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzf;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzf;->zzw:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzf;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Failed to schedule delayed post. time"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
