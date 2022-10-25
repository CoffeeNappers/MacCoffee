.class public Lcom/google/firebase/database/connection/idl/zzc;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzaiy;


# instance fields
.field private final bcq:Lcom/google/firebase/database/connection/idl/zzh;


# direct methods
.method private constructor <init>(Lcom/google/firebase/database/connection/idl/zzh;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    return-void
.end method

.method public static zza(Landroid/content/Context;Lcom/google/firebase/database/connection/idl/ConnectionConfig;Lcom/google/android/gms/internal/zzaiu;Lcom/google/android/gms/internal/zzaiy$zza;)Lcom/google/firebase/database/connection/idl/zzc;
    .locals 2

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzaiu;->zzcsi()Lcom/google/android/gms/internal/zzait;

    move-result-object v0

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzaiu;->zzcsj()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    invoke-static {p0, p1, v0, v1, p3}, Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl;->loadDynamic(Landroid/content/Context;Lcom/google/firebase/database/connection/idl/ConnectionConfig;Lcom/google/android/gms/internal/zzait;Ljava/util/concurrent/ScheduledExecutorService;Lcom/google/android/gms/internal/zzaiy$zza;)Lcom/google/firebase/database/connection/idl/zzh;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/database/connection/idl/zzc;

    invoke-direct {v1, v0}, Lcom/google/firebase/database/connection/idl/zzc;-><init>(Lcom/google/firebase/database/connection/idl/zzh;)V

    return-object v1
.end method

.method private static zza(Lcom/google/android/gms/internal/zzajb;)Lcom/google/firebase/database/connection/idl/zzj;
    .locals 1

    new-instance v0, Lcom/google/firebase/database/connection/idl/zzc$2;

    invoke-direct {v0, p0}, Lcom/google/firebase/database/connection/idl/zzc$2;-><init>(Lcom/google/android/gms/internal/zzajb;)V

    return-object v0
.end method


# virtual methods
.method public initialize()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-interface {v0}, Lcom/google/firebase/database/connection/idl/zzh;->initialize()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public interrupt(Ljava/lang/String;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-interface {v0, p1}, Lcom/google/firebase/database/connection/idl/zzh;->interrupt(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isInterrupted(Ljava/lang/String;)Z
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-interface {v0, p1}, Lcom/google/firebase/database/connection/idl/zzh;->isInterrupted(Ljava/lang/String;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public purgeOutstandingWrites()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-interface {v0}, Lcom/google/firebase/database/connection/idl/zzh;->purgeOutstandingWrites()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public refreshAuthToken()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-interface {v0}, Lcom/google/firebase/database/connection/idl/zzh;->refreshAuthToken()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public resume(Ljava/lang/String;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-interface {v0, p1}, Lcom/google/firebase/database/connection/idl/zzh;->resume(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public shutdown()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-interface {v0}, Lcom/google/firebase/database/connection/idl/zzh;->shutdown()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zza(Ljava/util/List;Lcom/google/android/gms/internal/zzajb;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-static {p2}, Lcom/google/firebase/database/connection/idl/zzc;->zza(Lcom/google/android/gms/internal/zzajb;)Lcom/google/firebase/database/connection/idl/zzj;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/google/firebase/database/connection/idl/zzh;->onDisconnectCancel(Ljava/util/List;Lcom/google/firebase/database/connection/idl/zzj;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zza(Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    invoke-static {p3}, Lcom/google/firebase/database/connection/idl/zzc;->zza(Lcom/google/android/gms/internal/zzajb;)Lcom/google/firebase/database/connection/idl/zzj;

    move-result-object v2

    invoke-interface {v0, p1, v1, v2}, Lcom/google/firebase/database/connection/idl/zzh;->put(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzj;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zza(Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;Lcom/google/android/gms/internal/zzajb;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    invoke-static {p4}, Lcom/google/firebase/database/connection/idl/zzc;->zza(Lcom/google/android/gms/internal/zzajb;)Lcom/google/firebase/database/connection/idl/zzj;

    move-result-object v2

    invoke-interface {v0, p1, v1, p3, v2}, Lcom/google/firebase/database/connection/idl/zzh;->compareAndPut(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Ljava/lang/String;Lcom/google/firebase/database/connection/idl/zzj;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zza(Ljava/util/List;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/google/firebase/database/connection/idl/zzh;->unlisten(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zza(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzaix;Ljava/lang/Long;Lcom/google/android/gms/internal/zzajb;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzaix;",
            "Ljava/lang/Long;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    new-instance v3, Lcom/google/firebase/database/connection/idl/zzc$1;

    invoke-direct {v3, p0, p3}, Lcom/google/firebase/database/connection/idl/zzc$1;-><init>(Lcom/google/firebase/database/connection/idl/zzc;Lcom/google/android/gms/internal/zzaix;)V

    if-eqz p4, :cond_0

    :try_start_0
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    :goto_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    invoke-static {p5}, Lcom/google/firebase/database/connection/idl/zzc;->zza(Lcom/google/android/gms/internal/zzajb;)Lcom/google/firebase/database/connection/idl/zzj;

    move-result-object v6

    move-object v1, p1

    invoke-interface/range {v0 .. v6}, Lcom/google/firebase/database/connection/idl/zzh;->listen(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzg;JLcom/google/firebase/database/connection/idl/zzj;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :cond_0
    const-wide/16 v4, -0x1

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zza(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    invoke-static {p3}, Lcom/google/firebase/database/connection/idl/zzc;->zza(Lcom/google/android/gms/internal/zzajb;)Lcom/google/firebase/database/connection/idl/zzj;

    move-result-object v2

    invoke-interface {v0, p1, v1, v2}, Lcom/google/firebase/database/connection/idl/zzh;->merge(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzj;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zzb(Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    invoke-static {p3}, Lcom/google/firebase/database/connection/idl/zzc;->zza(Lcom/google/android/gms/internal/zzajb;)Lcom/google/firebase/database/connection/idl/zzj;

    move-result-object v2

    invoke-interface {v0, p1, v1, v2}, Lcom/google/firebase/database/connection/idl/zzh;->onDisconnectPut(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzj;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zzb(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    invoke-static {p3}, Lcom/google/firebase/database/connection/idl/zzc;->zza(Lcom/google/android/gms/internal/zzajb;)Lcom/google/firebase/database/connection/idl/zzj;

    move-result-object v2

    invoke-interface {v0, p1, v1, v2}, Lcom/google/firebase/database/connection/idl/zzh;->onDisconnectMerge(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzj;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zzsk(Ljava/lang/String;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc;->bcq:Lcom/google/firebase/database/connection/idl/zzh;

    invoke-interface {v0, p1}, Lcom/google/firebase/database/connection/idl/zzh;->refreshAuthToken2(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
