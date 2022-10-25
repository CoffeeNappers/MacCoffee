.class public Lcom/google/android/gms/measurement/internal/zzw;
.super Lcom/google/android/gms/measurement/internal/zzaa;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/measurement/internal/zzw$zza;,
        Lcom/google/android/gms/measurement/internal/zzw$zzb;,
        Lcom/google/android/gms/measurement/internal/zzw$zzc;,
        Lcom/google/android/gms/measurement/internal/zzw$zzd;
    }
.end annotation


# static fields
.field private static final atP:Ljava/util/concurrent/atomic/AtomicLong;


# instance fields
.field private atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

.field private atH:Lcom/google/android/gms/measurement/internal/zzw$zzd;

.field private final atI:Ljava/util/concurrent/PriorityBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/PriorityBlockingQueue",
            "<",
            "Ljava/util/concurrent/FutureTask",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final atJ:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/util/concurrent/FutureTask",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final atK:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private final atL:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private final atM:Ljava/lang/Object;

.field private final atN:Ljava/util/concurrent/Semaphore;

.field private volatile atO:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/high16 v2, -0x8000000000000000L

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    sput-object v0, Lcom/google/android/gms/measurement/internal/zzw;->atP:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzx;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzaa;-><init>(Lcom/google/android/gms/measurement/internal/zzx;)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atM:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atN:Ljava/util/concurrent/Semaphore;

    new-instance v0, Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atI:Ljava/util/concurrent/PriorityBlockingQueue;

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atJ:Ljava/util/concurrent/BlockingQueue;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzw$zzb;

    const-string/jumbo v1, "Thread death: Uncaught exception on worker thread"

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/measurement/internal/zzw$zzb;-><init>(Lcom/google/android/gms/measurement/internal/zzw;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atK:Ljava/lang/Thread$UncaughtExceptionHandler;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzw$zzb;

    const-string/jumbo v1, "Thread death: Uncaught exception on network thread"

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/measurement/internal/zzw$zzb;-><init>(Lcom/google/android/gms/measurement/internal/zzw;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atL:Ljava/lang/Thread$UncaughtExceptionHandler;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzw;Lcom/google/android/gms/measurement/internal/zzw$zzd;)Lcom/google/android/gms/measurement/internal/zzw$zzd;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzw;->atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    return-object p1
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzw;)Ljava/util/concurrent/Semaphore;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atN:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method private zza(Lcom/google/android/gms/measurement/internal/zzw$zzc;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/measurement/internal/zzw$zzc",
            "<*>;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzw;->atM:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atI:Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/PriorityBlockingQueue;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzw$zzd;

    const-string/jumbo v2, "Measurement Worker"

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzw;->atI:Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-direct {v0, p0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzw$zzd;-><init>(Lcom/google/android/gms/measurement/internal/zzw;Ljava/lang/String;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzw;->atK:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzw$zzd;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzw$zzd;->start()V

    :goto_0
    monitor-exit v1

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzw$zzd;->zzpi()V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private zza(Ljava/util/concurrent/FutureTask;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/FutureTask",
            "<*>;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzw;->atM:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atJ:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atH:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzw$zzd;

    const-string/jumbo v2, "Measurement Network"

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzw;->atJ:Ljava/util/concurrent/BlockingQueue;

    invoke-direct {v0, p0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzw$zzd;-><init>(Lcom/google/android/gms/measurement/internal/zzw;Ljava/lang/String;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atH:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atH:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzw;->atL:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzw$zzd;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atH:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzw$zzd;->start()V

    :goto_0
    monitor-exit v1

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atH:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzw$zzd;->zzpi()V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/measurement/internal/zzw;Lcom/google/android/gms/measurement/internal/zzw$zzd;)Lcom/google/android/gms/measurement/internal/zzw$zzd;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzw;->atH:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    return-object p1
.end method

.method static synthetic zzb(Lcom/google/android/gms/measurement/internal/zzw;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atO:Z

    return v0
.end method

.method static synthetic zzbxp()Ljava/util/concurrent/atomic/AtomicLong;
    .locals 1

    sget-object v0, Lcom/google/android/gms/measurement/internal/zzw;->atP:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/measurement/internal/zzw;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atM:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/measurement/internal/zzw;)Lcom/google/android/gms/measurement/internal/zzw$zzd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/measurement/internal/zzw;)Lcom/google/android/gms/measurement/internal/zzw$zzd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw;->atH:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    return-object v0
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

.method public zzbvo()V
    .locals 2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzw;->atH:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Call expected from network thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
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

.method public zzd(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TV;>;)",
            "Ljava/util/concurrent/Future",
            "<TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzw;->zzacj()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzw$zzc;

    const/4 v1, 0x0

    const-string/jumbo v2, "Task exception on worker thread"

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/google/android/gms/measurement/internal/zzw$zzc;-><init>(Lcom/google/android/gms/measurement/internal/zzw;Ljava/util/concurrent/Callable;ZLjava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzw;->atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    if-ne v1, v2, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzw$zzc;->run()V

    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzw;->zza(Lcom/google/android/gms/measurement/internal/zzw$zzc;)V

    goto :goto_0
.end method

.method public zzdg()Z
    .locals 2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zze(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TV;>;)",
            "Ljava/util/concurrent/Future",
            "<TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzw;->zzacj()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzw$zzc;

    const/4 v1, 0x1

    const-string/jumbo v2, "Task exception on worker thread"

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/google/android/gms/measurement/internal/zzw$zzc;-><init>(Lcom/google/android/gms/measurement/internal/zzw;Ljava/util/concurrent/Callable;ZLjava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzw;->atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    if-ne v1, v2, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzw$zzc;->run()V

    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzw;->zza(Lcom/google/android/gms/measurement/internal/zzw$zzc;)V

    goto :goto_0
.end method

.method public zzm(Ljava/lang/Runnable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzw;->zzacj()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzw$zzc;

    const/4 v1, 0x0

    const-string/jumbo v2, "Task exception on worker thread"

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/google/android/gms/measurement/internal/zzw$zzc;-><init>(Lcom/google/android/gms/measurement/internal/zzw;Ljava/lang/Runnable;ZLjava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzw;->zza(Lcom/google/android/gms/measurement/internal/zzw$zzc;)V

    return-void
.end method

.method public zzn(Ljava/lang/Runnable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzw;->zzacj()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzw$zzc;

    const/4 v1, 0x0

    const-string/jumbo v2, "Task exception on network thread"

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/google/android/gms/measurement/internal/zzw$zzc;-><init>(Lcom/google/android/gms/measurement/internal/zzw;Ljava/lang/Runnable;ZLjava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzw;->zza(Ljava/util/concurrent/FutureTask;)V

    return-void
.end method

.method public zzzx()V
    .locals 2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzw;->atG:Lcom/google/android/gms/measurement/internal/zzw$zzd;

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Call expected from worker thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method protected zzzy()V
    .locals 0

    return-void
.end method
