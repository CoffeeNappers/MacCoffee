.class public Lcom/google/android/gms/internal/zzajj;
.super Ljava/lang/Object;


# instance fields
.field protected aZF:Lcom/google/firebase/FirebaseApp;

.field protected baR:Lcom/google/android/gms/internal/zzalx;

.field protected baS:Z

.field protected baU:Ljava/lang/String;

.field private bcW:Z

.field protected bdk:Lcom/google/android/gms/internal/zzajn;

.field protected bdl:Lcom/google/android/gms/internal/zzajf;

.field protected bdm:Lcom/google/android/gms/internal/zzajv;

.field protected bdn:Ljava/lang/String;

.field protected bdo:Lcom/google/android/gms/internal/zzalx$zza;

.field private bdp:Z

.field private bdq:Lcom/google/android/gms/internal/zzajr;

.field protected cacheSize:J


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/google/android/gms/internal/zzalx$zza;->bip:Lcom/google/android/gms/internal/zzalx$zza;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdo:Lcom/google/android/gms/internal/zzalx$zza;

    const-wide/32 v0, 0xa00000

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzajj;->cacheSize:J

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzajj;->bcW:Z

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzajj;->bdp:Z

    return-void
.end method

.method private static zza(Lcom/google/android/gms/internal/zzajf;)Lcom/google/android/gms/internal/zzait;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzajj$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzajj$1;-><init>(Lcom/google/android/gms/internal/zzajf;)V

    return-object v0
.end method

.method private zzcsj()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzajj;->zzcus()Lcom/google/android/gms/internal/zzajv;

    move-result-object v0

    instance-of v1, v0, Lcom/google/android/gms/internal/zzanh;

    if-nez v1, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Custom run loops are not supported!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    check-cast v0, Lcom/google/android/gms/internal/zzanh;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzanh;->zzcsj()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    return-object v0
.end method

.method private zzcui()Lcom/google/android/gms/internal/zzajr;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdq:Lcom/google/android/gms/internal/zzajr;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzanc;->x()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcuj()V

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdq:Lcom/google/android/gms/internal/zzajr;

    return-object v0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/zzajo;->isActive()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/google/android/gms/internal/zzajo;->bdx:Lcom/google/android/gms/internal/zzajo;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajo;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdq:Lcom/google/android/gms/internal/zzajr;

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/google/android/gms/internal/zzajp;->bdC:Lcom/google/android/gms/internal/zzajp;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdq:Lcom/google/android/gms/internal/zzajr;

    goto :goto_0
.end method

.method private declared-synchronized zzcuj()V
    .locals 2

    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/google/android/gms/internal/zzaie;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajj;->aZF:Lcom/google/firebase/FirebaseApp;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzaie;-><init>(Lcom/google/firebase/FirebaseApp;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdq:Lcom/google/android/gms/internal/zzajr;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private zzcul()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcuv()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcui()Lcom/google/android/gms/internal/zzajr;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcuy()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcux()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcuw()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcva()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcuz()V

    return-void
.end method

.method private zzcum()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdk:Lcom/google/android/gms/internal/zzajn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzajn;->restart()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdm:Lcom/google/android/gms/internal/zzajv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzajv;->restart()V

    return-void
.end method

.method private zzcuv()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->baR:Lcom/google/android/gms/internal/zzalx;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcui()Lcom/google/android/gms/internal/zzajr;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajj;->bdo:Lcom/google/android/gms/internal/zzalx$zza;

    const/4 v2, 0x0

    invoke-interface {v0, p0, v1, v2}, Lcom/google/android/gms/internal/zzajr;->zza(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzalx$zza;Ljava/util/List;)Lcom/google/android/gms/internal/zzalx;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajj;->baR:Lcom/google/android/gms/internal/zzalx;

    :cond_0
    return-void
.end method

.method private zzcuw()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdm:Lcom/google/android/gms/internal/zzajv;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdq:Lcom/google/android/gms/internal/zzajr;

    invoke-interface {v0, p0}, Lcom/google/android/gms/internal/zzajr;->zzb(Lcom/google/android/gms/internal/zzajj;)Lcom/google/android/gms/internal/zzajv;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdm:Lcom/google/android/gms/internal/zzajv;

    :cond_0
    return-void
.end method

.method private zzcux()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdk:Lcom/google/android/gms/internal/zzajn;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcui()Lcom/google/android/gms/internal/zzajr;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/google/android/gms/internal/zzajr;->zza(Lcom/google/android/gms/internal/zzajj;)Lcom/google/android/gms/internal/zzajn;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdk:Lcom/google/android/gms/internal/zzajn;

    :cond_0
    return-void
.end method

.method private zzcuy()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->baU:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcui()Lcom/google/android/gms/internal/zzajr;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/google/android/gms/internal/zzajr;->zzc(Lcom/google/android/gms/internal/zzajj;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajj;->zzsu(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajj;->baU:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private zzcuz()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdl:Lcom/google/android/gms/internal/zzajf;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcui()Lcom/google/android/gms/internal/zzajr;

    move-result-object v0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcsj()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzajr;->zza(Ljava/util/concurrent/ScheduledExecutorService;)Lcom/google/android/gms/internal/zzajf;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdl:Lcom/google/android/gms/internal/zzajf;

    :cond_0
    return-void
.end method

.method private zzcva()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdn:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string/jumbo v0, "default"

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdn:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private zzsu(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Firebase/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "5"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/google/firebase/database/FirebaseDatabase;->getSdkVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public isFrozen()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzajj;->bcW:Z

    return v0
.end method

.method stop()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzajj;->bdp:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdk:Lcom/google/android/gms/internal/zzajn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzajn;->shutdown()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdm:Lcom/google/android/gms/internal/zzajv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzajv;->shutdown()V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzaiw;Lcom/google/android/gms/internal/zzaiy$zza;)Lcom/google/android/gms/internal/zzaiy;
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcui()Lcom/google/android/gms/internal/zzajr;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzajj;->zzcup()Lcom/google/android/gms/internal/zzaiu;

    move-result-object v1

    invoke-interface {v0, p0, v1, p1, p2}, Lcom/google/android/gms/internal/zzajr;->zza(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzaiu;Lcom/google/android/gms/internal/zzaiw;Lcom/google/android/gms/internal/zzaiy$zza;)Lcom/google/android/gms/internal/zzaiy;

    move-result-object v0

    return-object v0
.end method

.method public zzcsh()Lcom/google/android/gms/internal/zzalx;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->baR:Lcom/google/android/gms/internal/zzalx;

    return-object v0
.end method

.method public zzcsk()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzajj;->baS:Z

    return v0
.end method

.method public zzctu()Lcom/google/android/gms/internal/zzalx$zza;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdo:Lcom/google/android/gms/internal/zzalx$zza;

    return-object v0
.end method

.method declared-synchronized zzctz()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzajj;->bcW:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzajj;->bcW:Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcul()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public zzcuk()V
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzajj;->bdp:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcum()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzajj;->bdp:Z

    :cond_0
    return-void
.end method

.method protected zzcun()V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzajj;->isFrozen()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/firebase/database/DatabaseException;

    const-string/jumbo v1, "Modifications to DatabaseConfig objects must occur before they are in use"

    invoke-direct {v0, v1}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method public zzcuo()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public zzcup()Lcom/google/android/gms/internal/zzaiu;
    .locals 7

    new-instance v0, Lcom/google/android/gms/internal/zzaiu;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzajj;->zzcsh()Lcom/google/android/gms/internal/zzalx;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzajj;->zzcuu()Lcom/google/android/gms/internal/zzajf;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzajj;->zza(Lcom/google/android/gms/internal/zzajf;)Lcom/google/android/gms/internal/zzait;

    move-result-object v2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajj;->zzcsj()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzajj;->zzcsk()Z

    move-result v4

    invoke-static {}, Lcom/google/firebase/database/FirebaseDatabase;->getSdkVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzajj;->zzux()Ljava/lang/String;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzaiu;-><init>(Lcom/google/android/gms/internal/zzalx;Lcom/google/android/gms/internal/zzait;Ljava/util/concurrent/ScheduledExecutorService;ZLjava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public zzcuq()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzajj;->cacheSize:J

    return-wide v0
.end method

.method public zzcur()Lcom/google/android/gms/internal/zzajn;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdk:Lcom/google/android/gms/internal/zzajn;

    return-object v0
.end method

.method public zzcus()Lcom/google/android/gms/internal/zzajv;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdm:Lcom/google/android/gms/internal/zzajv;

    return-object v0
.end method

.method public zzcut()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdn:Ljava/lang/String;

    return-object v0
.end method

.method public zzcuu()Lcom/google/android/gms/internal/zzajf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdl:Lcom/google/android/gms/internal/zzajf;

    return-object v0
.end method

.method public zzss(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalw;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzalw;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajj;->baR:Lcom/google/android/gms/internal/zzalx;

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/zzalw;-><init>(Lcom/google/android/gms/internal/zzalx;Ljava/lang/String;)V

    return-object v0
.end method

.method zzst(Ljava/lang/String;)Lcom/google/android/gms/internal/zzaku;
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzajj;->baS:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->bdq:Lcom/google/android/gms/internal/zzajr;

    invoke-interface {v0, p0, p1}, Lcom/google/android/gms/internal/zzajr;->zza(Lcom/google/android/gms/internal/zzajj;Ljava/lang/String;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "You have enabled persistence, but persistence is not supported on this platform."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzakt;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzakt;-><init>()V

    :cond_1
    return-object v0
.end method

.method public zzux()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj;->baU:Ljava/lang/String;

    return-object v0
.end method
