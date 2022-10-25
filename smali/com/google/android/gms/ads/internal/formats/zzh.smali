.class public Lcom/google/android/gms/ads/internal/formats/zzh;
.super Lcom/google/android/gms/ads/internal/formats/zzj;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private zzako:Ljava/lang/Object;

.field private zzbnp:Lcom/google/android/gms/internal/zzhd;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private zzbnq:Lcom/google/android/gms/internal/zzhe;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final zzbnr:Lcom/google/android/gms/ads/internal/zzq;

.field private zzbns:Lcom/google/android/gms/ads/internal/formats/zzi;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private zzbnt:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzav;Lcom/google/android/gms/ads/internal/formats/zzi$zza;)V
    .locals 9

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, v3

    move-object v6, p4

    move-object v7, v3

    move-object v8, v3

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/ads/internal/formats/zzj;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzja;Lcom/google/android/gms/internal/zzav;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzi$zza;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnt:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzako:Ljava/lang/Object;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnr:Lcom/google/android/gms/ads/internal/zzq;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzav;Lcom/google/android/gms/internal/zzhd;Lcom/google/android/gms/ads/internal/formats/zzi$zza;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p5}, Lcom/google/android/gms/ads/internal/formats/zzh;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzav;Lcom/google/android/gms/ads/internal/formats/zzi$zza;)V

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzav;Lcom/google/android/gms/internal/zzhe;Lcom/google/android/gms/ads/internal/formats/zzi$zza;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p5}, Lcom/google/android/gms/ads/internal/formats/zzh;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzav;Lcom/google/android/gms/ads/internal/formats/zzi$zza;)V

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    return-void
.end method


# virtual methods
.method public zza(Landroid/view/View$OnClickListener;)Lcom/google/android/gms/ads/internal/formats/zzb;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public zza(Landroid/view/View;Ljava/util/Map;Landroid/view/View$OnTouchListener;Landroid/view/View$OnClickListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;>;",
            "Landroid/view/View$OnTouchListener;",
            "Landroid/view/View$OnClickListener;",
            ")V"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzako:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnt:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzhd;->zzl(Lcom/google/android/gms/dynamic/zzd;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :goto_0
    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnt:Z

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-void

    :cond_1
    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzhe;->zzl(Lcom/google/android/gms/dynamic/zzd;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_4
    const-string/jumbo v2, "Failed to call prepareAd"

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0
.end method

.method public zza(Landroid/view/View;Ljava/util/Map;Lorg/json/JSONObject;Landroid/view/View;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;>;",
            "Lorg/json/JSONObject;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    const-string/jumbo v0, "performClick must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzhs(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbns:Lcom/google/android/gms/ads/internal/formats/zzi;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbns:Lcom/google/android/gms/ads/internal/formats/zzi;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/google/android/gms/ads/internal/formats/zzi;->zza(Landroid/view/View;Ljava/util/Map;Lorg/json/JSONObject;Landroid/view/View;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnr:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->onAdClicked()V

    :cond_0
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzhd;->getOverrideClickHandling()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzhd;->zzk(Lcom/google/android/gms/dynamic/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnr:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->onAdClicked()V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzhe;->getOverrideClickHandling()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzhe;->zzk(Lcom/google/android/gms/dynamic/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnr:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->onAdClicked()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string/jumbo v2, "Failed to call performClick"

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public zzb(Landroid/view/View;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;>;)V"
        }
    .end annotation

    const-string/jumbo v0, "recordImpression must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzhs(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzako:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/formats/zzh;->zzr(Z)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbns:Lcom/google/android/gms/ads/internal/formats/zzi;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbns:Lcom/google/android/gms/ads/internal/formats/zzi;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/ads/internal/formats/zzi;->zzb(Landroid/view/View;Ljava/util/Map;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnr:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->recordImpression()V

    :cond_0
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzhd;->getOverrideImpressionRecording()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzhd;->recordImpression()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnr:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->recordImpression()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string/jumbo v2, "Failed to call recordImpression"

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_2
    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzhe;->getOverrideImpressionRecording()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzhe;->recordImpression()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnr:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->recordImpression()V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method public zzc(Landroid/view/View;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;>;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnp:Lcom/google/android/gms/internal/zzhd;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzhd;->zzm(Lcom/google/android/gms/dynamic/zzd;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :goto_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnq:Lcom/google/android/gms/internal/zzhe;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzhe;->zzm(Lcom/google/android/gms/dynamic/zzd;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_3
    const-string/jumbo v2, "Failed to call untrackView"

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method

.method public zzc(Lcom/google/android/gms/ads/internal/formats/zzi;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/ads/internal/formats/zzi;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbns:Lcom/google/android/gms/ads/internal/formats/zzi;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzmv()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbnt:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzmw()Lcom/google/android/gms/ads/internal/formats/zzi;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzbns:Lcom/google/android/gms/ads/internal/formats/zzi;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzmx()Lcom/google/android/gms/internal/zzmd;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method
