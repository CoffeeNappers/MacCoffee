.class public Lcom/google/android/gms/internal/zzxr;
.super Ljava/lang/Object;


# static fields
.field private static DEBUG:Z

.field private static TAG:Ljava/lang/String;

.field private static aDy:Ljava/lang/String;


# instance fields
.field private final Gc:Ljava/lang/String;

.field private final Ge:Ljava/lang/String;

.field private final aDA:I

.field private final aDB:Ljava/lang/String;

.field private aDC:Z

.field private aDD:I

.field private aDE:I

.field private final aDz:Landroid/os/PowerManager$WakeLock;

.field private ajz:Landroid/os/WorkSource;

.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "WakeLock"

    sput-object v0, Lcom/google/android/gms/internal/zzxr;->TAG:Ljava/lang/String;

    const-string/jumbo v0, "*gcore*:"

    sput-object v0, Lcom/google/android/gms/internal/zzxr;->aDy:Ljava/lang/String;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/android/gms/internal/zzxr;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    if-nez p1, :cond_0

    move-object v5, v4

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzxr;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UnwrappedWakeLock"
        }
    .end annotation

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzxr;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UnwrappedWakeLock"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzxr;->aDC:Z

    const-string/jumbo v0, "Wake lock name can NOT be empty"

    invoke-static {p3, v0}, Lcom/google/android/gms/common/internal/zzaa;->zzh(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    iput p2, p0, Lcom/google/android/gms/internal/zzxr;->aDA:I

    iput-object p4, p0, Lcom/google/android/gms/internal/zzxr;->aDB:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzxr;->Ge:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxr;->mContext:Landroid/content/Context;

    const-string/jumbo v0, "com.google.android.gms"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    sget-object v0, Lcom/google/android/gms/internal/zzxr;->aDy:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/internal/zzxr;->Gc:Ljava/lang/String;

    :goto_1
    const-string/jumbo v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    invoke-virtual {v0, p2, p3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxr;->aDz:Landroid/os/PowerManager$WakeLock;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/common/util/zzy;->zzcm(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p5}, Lcom/google/android/gms/common/util/zzv;->zzij(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p5

    :cond_0
    invoke-static {p1, p5}, Lcom/google/android/gms/common/util/zzy;->zzy(Landroid/content/Context;Ljava/lang/String;)Landroid/os/WorkSource;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxr;->ajz:Landroid/os/WorkSource;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->ajz:Landroid/os/WorkSource;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzxr;->zzc(Landroid/os/WorkSource;)V

    :cond_1
    return-void

    :cond_2
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iput-object p3, p0, Lcom/google/android/gms/internal/zzxr;->Gc:Ljava/lang/String;

    goto :goto_1
.end method

.method private zzd(Landroid/os/WorkSource;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->aDz:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0, p1}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    sget-object v1, Lcom/google/android/gms/internal/zzxr;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private zzk(Ljava/lang/String;J)V
    .locals 12

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzxr;->zzoo(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzxr;->zzp(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzxr;->aDC:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/google/android/gms/internal/zzxr;->aDD:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/gms/internal/zzxr;->aDD:I

    if-eqz v1, :cond_1

    if-nez v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzxr;->aDC:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcom/google/android/gms/internal/zzxr;->aDE:I

    if-nez v0, :cond_2

    :cond_1
    invoke-static {}, Lcom/google/android/gms/common/stats/zzg;->zzayg()Lcom/google/android/gms/common/stats/zzg;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxr;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->aDz:Landroid/os/PowerManager$WakeLock;

    invoke-static {v0, v6}, Lcom/google/android/gms/common/stats/zze;->zza(Landroid/os/PowerManager$WakeLock;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x7

    iget-object v5, p0, Lcom/google/android/gms/internal/zzxr;->Gc:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/gms/internal/zzxr;->Ge:Ljava/lang/String;

    iget v8, p0, Lcom/google/android/gms/internal/zzxr;->aDA:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->ajz:Landroid/os/WorkSource;

    invoke-static {v0}, Lcom/google/android/gms/common/util/zzy;->zzb(Landroid/os/WorkSource;)Ljava/util/List;

    move-result-object v9

    move-wide v10, p2

    invoke-virtual/range {v1 .. v11}, Lcom/google/android/gms/common/stats/zzg;->zza(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/List;J)V

    iget v0, p0, Lcom/google/android/gms/internal/zzxr;->aDE:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzxr;->aDE:I

    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private zzon(Ljava/lang/String;)V
    .locals 9

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzxr;->zzoo(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzxr;->zzp(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzxr;->aDC:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/google/android/gms/internal/zzxr;->aDD:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/android/gms/internal/zzxr;->aDD:I

    if-eqz v1, :cond_1

    if-nez v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzxr;->aDC:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcom/google/android/gms/internal/zzxr;->aDE:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    :cond_1
    invoke-static {}, Lcom/google/android/gms/common/stats/zzg;->zzayg()Lcom/google/android/gms/common/stats/zzg;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxr;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxr;->aDz:Landroid/os/PowerManager$WakeLock;

    invoke-static {v2, v5}, Lcom/google/android/gms/common/stats/zze;->zza(Landroid/os/PowerManager$WakeLock;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x8

    iget-object v4, p0, Lcom/google/android/gms/internal/zzxr;->Gc:Ljava/lang/String;

    iget-object v6, p0, Lcom/google/android/gms/internal/zzxr;->Ge:Ljava/lang/String;

    iget v7, p0, Lcom/google/android/gms/internal/zzxr;->aDA:I

    iget-object v8, p0, Lcom/google/android/gms/internal/zzxr;->ajz:Landroid/os/WorkSource;

    invoke-static {v8}, Lcom/google/android/gms/common/util/zzy;->zzb(Landroid/os/WorkSource;)Ljava/util/List;

    move-result-object v8

    invoke-virtual/range {v0 .. v8}, Lcom/google/android/gms/common/stats/zzg;->zza(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/List;)V

    iget v0, p0, Lcom/google/android/gms/internal/zzxr;->aDE:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzxr;->aDE:I

    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private zzoo(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->aDB:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzp(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzxr;->aDC:Z

    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    :goto_0
    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/zzxr;->aDB:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/zzxr;->aDB:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public acquire(J)V
    .locals 5

    invoke-static {}, Lcom/google/android/gms/common/util/zzs;->zzayq()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzxr;->aDC:Z

    if-eqz v0, :cond_0

    sget-object v1, Lcom/google/android/gms/internal/zzxr;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Do not acquire with timeout on reference counted WakeLocks before ICS. wakelock: "

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->Gc:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/gms/internal/zzxr;->zzk(Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->aDz:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0, p1, p2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public isHeld()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->aDz:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    return v0
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzxr;->zzon(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->aDz:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    return-void
.end method

.method public setReferenceCounted(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->aDz:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0, p1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzxr;->aDC:Z

    return-void
.end method

.method public zzc(Landroid/os/WorkSource;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/common/util/zzy;->zzcm(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->ajz:Landroid/os/WorkSource;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->ajz:Landroid/os/WorkSource;

    invoke-virtual {v0, p1}, Landroid/os/WorkSource;->add(Landroid/os/WorkSource;)Z

    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->ajz:Landroid/os/WorkSource;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzxr;->zzd(Landroid/os/WorkSource;)V

    :cond_0
    return-void

    :cond_1
    iput-object p1, p0, Lcom/google/android/gms/internal/zzxr;->ajz:Landroid/os/WorkSource;

    goto :goto_0
.end method
