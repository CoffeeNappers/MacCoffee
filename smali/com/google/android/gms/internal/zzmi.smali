.class public Lcom/google/android/gms/internal/zzmi;
.super Lcom/google/android/gms/ads/internal/client/zzab$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private A:Lcom/google/android/gms/ads/internal/client/zzac;

.field private B:Z

.field private C:Z

.field private D:F

.field private E:F

.field private final w:F

.field private z:I

.field private final zzako:Ljava/lang/Object;

.field private zzakr:Z

.field private final zzbnz:Lcom/google/android/gms/internal/zzmd;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzmd;F)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/client/zzab$zza;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzmi;->zzako:Ljava/lang/Object;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzmi;->zzakr:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/zzmi;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    iput p2, p0, Lcom/google/android/gms/internal/zzmi;->w:F

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzmi;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzmi;->B:Z

    return p1
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzmi;)Lcom/google/android/gms/internal/zzmd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzmi;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzmi;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzmi;->zzako:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzmi;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzmi;->B:Z

    return v0
.end method

.method private zzdo(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzmi;->zze(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/zzmi;)Lcom/google/android/gms/ads/internal/client/zzac;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzmi;->A:Lcom/google/android/gms/ads/internal/client/zzac;

    return-object v0
.end method

.method private zze(Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .param p2    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-nez p2, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_0
    const-string/jumbo v1, "action"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzmi$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzmi$1;-><init>(Lcom/google/android/gms/internal/zzmi;Ljava/util/Map;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzlb;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    goto :goto_0
.end method

.method private zzk(II)V
    .locals 2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzmi$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/gms/internal/zzmi$2;-><init>(Lcom/google/android/gms/internal/zzmi;II)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzlb;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public getAspectRatio()F
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzmi;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzmi;->E:F

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getPlaybackState()I
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzmi;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzmi;->z:I

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isMuted()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzmi;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzmi;->C:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public pause()V
    .locals 1

    const-string/jumbo v0, "pause"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzmi;->zzdo(Ljava/lang/String;)V

    return-void
.end method

.method public play()V
    .locals 1

    const-string/jumbo v0, "play"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzmi;->zzdo(Ljava/lang/String;)V

    return-void
.end method

.method public zza(FIZF)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzmi;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput p1, p0, Lcom/google/android/gms/internal/zzmi;->D:F

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzmi;->C:Z

    iget v0, p0, Lcom/google/android/gms/internal/zzmi;->z:I

    iput p2, p0, Lcom/google/android/gms/internal/zzmi;->z:I

    iput p4, p0, Lcom/google/android/gms/internal/zzmi;->E:F

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/internal/zzmi;->zzk(II)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzac;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzmi;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzmi;->A:Lcom/google/android/gms/ads/internal/client/zzac;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzaq(Z)V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzmi;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzmi;->zzakr:Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string/jumbo v1, "initialState"

    const-string/jumbo v2, "muteStart"

    if-eqz p1, :cond_0

    const-string/jumbo v0, "1"

    :goto_0
    invoke-static {v2, v0}, Lcom/google/android/gms/common/util/zzf;->zze(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/google/android/gms/internal/zzmi;->zze(Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_0
    const-string/jumbo v0, "0"

    goto :goto_0
.end method

.method public zzku()F
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzmi;->w:F

    return v0
.end method

.method public zzkv()F
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzmi;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzmi;->D:F

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzn(Z)V
    .locals 1

    if-eqz p1, :cond_0

    const-string/jumbo v0, "mute"

    :goto_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzmi;->zzdo(Ljava/lang/String;)V

    return-void

    :cond_0
    const-string/jumbo v0, "unmute"

    goto :goto_0
.end method
