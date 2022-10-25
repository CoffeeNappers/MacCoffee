.class public final Lcom/google/android/gms/internal/zzgs;
.super Lcom/google/android/gms/internal/zzhb$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private final zzako:Ljava/lang/Object;

.field private zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

.field private zzbvz:Lcom/google/android/gms/internal/zzgr;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhb$zza;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onAdClicked()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzgr;->zzes()V

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

.method public onAdClosed()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzgr;->zzet()V

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

.method public onAdFailedToLoad(I)V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgs;->zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

    invoke-interface {v2, v0}, Lcom/google/android/gms/internal/zzgu$zza;->zzad(I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

    :cond_0
    monitor-exit v1

    return-void

    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onAdImpression()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzgr;->zzex()V

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

.method public onAdLeftApplication()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzgr;->zzeu()V

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

.method public onAdLoaded()V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzgu$zza;->zzad(I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

    monitor-exit v1

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzgr;->zzew()V

    :cond_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onAdOpened()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzgr;->zzev()V

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

.method public zza(Lcom/google/android/gms/internal/zzgr;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/internal/zzgr;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzgu$zza;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzgs;->zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzhc;)V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

    const/4 v2, 0x0

    invoke-interface {v0, v2, p1}, Lcom/google/android/gms/internal/zzgu$zza;->zza(ILcom/google/android/gms/internal/zzhc;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvy:Lcom/google/android/gms/internal/zzgu$zza;

    monitor-exit v1

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzbvz:Lcom/google/android/gms/internal/zzgr;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzgr;->zzew()V

    :cond_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
