.class public final Lcom/google/android/gms/ads/VideoController;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/VideoController$VideoLifecycleCallbacks;
    }
.end annotation


# instance fields
.field private final zzako:Ljava/lang/Object;

.field private zzakp:Lcom/google/android/gms/ads/internal/client/zzab;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private zzakq:Lcom/google/android/gms/ads/VideoController$VideoLifecycleCallbacks;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/VideoController;->zzako:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getAspectRatio()F
    .locals 4

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/google/android/gms/ads/VideoController;->zzako:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/ads/VideoController;->zzakp:Lcom/google/android/gms/ads/internal/client/zzab;

    if-nez v1, :cond_0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    return v0

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/ads/VideoController;->zzakp:Lcom/google/android/gms/ads/internal/client/zzab;

    invoke-interface {v1}, Lcom/google/android/gms/ads/internal/client/zzab;->getAspectRatio()F
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    :try_start_2
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catch_0
    move-exception v1

    :try_start_3
    const-string/jumbo v3, "Unable to call getAspectRatio on video controller."

    invoke-static {v3, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method public getVideoLifecycleCallbacks()Lcom/google/android/gms/ads/VideoController$VideoLifecycleCallbacks;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/ads/VideoController;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/VideoController;->zzakq:Lcom/google/android/gms/ads/VideoController$VideoLifecycleCallbacks;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public hasVideoContent()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/ads/VideoController;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/VideoController;->zzakp:Lcom/google/android/gms/ads/internal/client/zzab;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setVideoLifecycleCallbacks(Lcom/google/android/gms/ads/VideoController$VideoLifecycleCallbacks;)V
    .locals 3

    const-string/jumbo v0, "VideoLifecycleCallbacks may not be null."

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/zzaa;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/ads/VideoController;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/ads/VideoController;->zzakq:Lcom/google/android/gms/ads/VideoController$VideoLifecycleCallbacks;

    iget-object v0, p0, Lcom/google/android/gms/ads/VideoController;->zzakp:Lcom/google/android/gms/ads/internal/client/zzab;

    if-nez v0, :cond_0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/ads/VideoController;->zzakp:Lcom/google/android/gms/ads/internal/client/zzab;

    new-instance v2, Lcom/google/android/gms/ads/internal/client/zzap;

    invoke-direct {v2, p1}, Lcom/google/android/gms/ads/internal/client/zzap;-><init>(Lcom/google/android/gms/ads/VideoController$VideoLifecycleCallbacks;)V

    invoke-interface {v0, v2}, Lcom/google/android/gms/ads/internal/client/zzab;->zza(Lcom/google/android/gms/ads/internal/client/zzac;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    :try_start_2
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catch_0
    move-exception v0

    :try_start_3
    const-string/jumbo v2, "Unable to call setVideoLifecycleCallbacks on video controller."

    invoke-static {v2, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzab;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/ads/VideoController;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/ads/VideoController;->zzakp:Lcom/google/android/gms/ads/internal/client/zzab;

    iget-object v0, p0, Lcom/google/android/gms/ads/VideoController;->zzakq:Lcom/google/android/gms/ads/VideoController$VideoLifecycleCallbacks;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/VideoController;->zzakq:Lcom/google/android/gms/ads/VideoController$VideoLifecycleCallbacks;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/VideoController;->setVideoLifecycleCallbacks(Lcom/google/android/gms/ads/VideoController$VideoLifecycleCallbacks;)V

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

.method public zzdw()Lcom/google/android/gms/ads/internal/client/zzab;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/ads/VideoController;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/VideoController;->zzakp:Lcom/google/android/gms/ads/internal/client/zzab;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
