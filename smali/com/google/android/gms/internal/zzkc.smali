.class public Lcom/google/android/gms/internal/zzkc;
.super Lcom/google/android/gms/internal/zzkw;

# interfaces
.implements Lcom/google/android/gms/internal/zzke;
.implements Lcom/google/android/gms/internal/zzkh;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzako:Ljava/lang/Object;

.field private final zzbwa:Ljava/lang/String;

.field private final zzcgf:Lcom/google/android/gms/internal/zzko$zza;

.field private zzcgw:I

.field private final zzcre:Lcom/google/android/gms/internal/zzkj;

.field private final zzcrf:Lcom/google/android/gms/internal/zzkh;

.field private final zzcrg:Ljava/lang/String;

.field private final zzcrh:Lcom/google/android/gms/internal/zzgp;

.field private final zzcri:J

.field private zzcrj:I

.field private zzcrk:Lcom/google/android/gms/internal/zzkd;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzgp;Lcom/google/android/gms/internal/zzko$zza;Lcom/google/android/gms/internal/zzkj;Lcom/google/android/gms/internal/zzkh;J)V
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzkw;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrj:I

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcgw:I

    iput-object p1, p0, Lcom/google/android/gms/internal/zzkc;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzkc;->zzbwa:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzkc;->zzcrg:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzkc;->zzcrh:Lcom/google/android/gms/internal/zzgp;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzkc;->zzcgf:Lcom/google/android/gms/internal/zzko$zza;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzkc;->zzcre:Lcom/google/android/gms/internal/zzkj;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzako:Ljava/lang/Object;

    iput-object p7, p0, Lcom/google/android/gms/internal/zzkc;->zzcrf:Lcom/google/android/gms/internal/zzkh;

    iput-wide p8, p0, Lcom/google/android/gms/internal/zzkc;->zzcri:J

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzkc;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzha;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcre:Lcom/google/android/gms/internal/zzkj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkj;->zzud()Lcom/google/android/gms/internal/zzkg;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzkg;->zza(Lcom/google/android/gms/internal/zzkh;)V

    :try_start_0
    const-string/jumbo v0, "com.google.ads.mediation.admob.AdMobAdapter"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc;->zzbwa:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrg:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc;->zzcrh:Lcom/google/android/gms/internal/zzgp;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzgp;->zzbus:Ljava/lang/String;

    invoke-interface {p2, p1, v0, v1}, Lcom/google/android/gms/internal/zzha;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrg:Ljava/lang/String;

    invoke-interface {p2, p1, v0}, Lcom/google/android/gms/internal/zzha;->zzc(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Fail to load ad from adapter."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzbwa:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzkc;->zza(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzkc;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzha;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzkc;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzha;)V

    return-void
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzkc;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrg:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzkc;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzbwa:Ljava/lang/String;

    return-object v0
.end method

.method private zzk(J)V
    .locals 5

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrj:I

    if-eqz v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzkd$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzkd$zza;-><init>()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v2, p1

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzkd$zza;->zzl(J)Lcom/google/android/gms/internal/zzkd$zza;

    move-result-object v2

    const/4 v0, 0x1

    iget v3, p0, Lcom/google/android/gms/internal/zzkc;->zzcrj:I

    if-ne v0, v3, :cond_0

    const/4 v0, 0x6

    :goto_1
    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzkd$zza;->zzbc(I)Lcom/google/android/gms/internal/zzkd$zza;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkc;->zzbwa:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzkd$zza;->zzcr(Ljava/lang/String;)Lcom/google/android/gms/internal/zzkd$zza;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkc;->zzcrh:Lcom/google/android/gms/internal/zzgp;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzgp;->zzbuv:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzkd$zza;->zzcs(Ljava/lang/String;)Lcom/google/android/gms/internal/zzkd$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkd$zza;->zztz()Lcom/google/android/gms/internal/zzkd;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrk:Lcom/google/android/gms/internal/zzkd;

    monitor-exit v1

    :goto_2
    return-void

    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcgw:I

    goto :goto_1

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzkc;->zzf(J)Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Lcom/google/android/gms/internal/zzkd$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzkd$zza;-><init>()V

    iget v2, p0, Lcom/google/android/gms/internal/zzkc;->zzcgw:I

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzkd$zza;->zzbc(I)Lcom/google/android/gms/internal/zzkd$zza;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v2, p1

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzkd$zza;->zzl(J)Lcom/google/android/gms/internal/zzkd$zza;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkc;->zzbwa:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzkd$zza;->zzcr(Ljava/lang/String;)Lcom/google/android/gms/internal/zzkd$zza;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkc;->zzcrh:Lcom/google/android/gms/internal/zzgp;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzgp;->zzbuv:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzkd$zza;->zzcs(Ljava/lang/String;)Lcom/google/android/gms/internal/zzkd$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkd$zza;->zztz()Lcom/google/android/gms/internal/zzkd;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrk:Lcom/google/android/gms/internal/zzkd;

    monitor-exit v1

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method


# virtual methods
.method public onStop()V
    .locals 0

    return-void
.end method

.method public zza(Ljava/lang/String;I)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc;->zzako:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x2

    :try_start_0
    iput v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrj:I

    iput p2, p0, Lcom/google/android/gms/internal/zzkc;->zzcgw:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzako:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzbb(I)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzbwa:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzkc;->zza(Ljava/lang/String;I)V

    return-void
.end method

.method public zzcq(Ljava/lang/String;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc;->zzako:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrj:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzako:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected zzf(J)Z
    .locals 7

    const/4 v0, 0x0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzkc;->zzcri:J

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v4

    sub-long/2addr v4, p1

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-gtz v1, :cond_0

    const/4 v1, 0x4

    iput v1, p0, Lcom/google/android/gms/internal/zzkc;->zzcgw:I

    :goto_0
    return v0

    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc;->zzako:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    const/4 v1, 0x5

    iput v1, p0, Lcom/google/android/gms/internal/zzkc;->zzcgw:I

    goto :goto_0
.end method

.method public zzfp()V
    .locals 6

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcre:Lcom/google/android/gms/internal/zzkj;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcre:Lcom/google/android/gms/internal/zzkj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkj;->zzud()Lcom/google/android/gms/internal/zzkg;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcre:Lcom/google/android/gms/internal/zzkj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkj;->zzuc()Lcom/google/android/gms/internal/zzha;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcre:Lcom/google/android/gms/internal/zzkj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkj;->zzud()Lcom/google/android/gms/internal/zzkg;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/google/android/gms/internal/zzkg;->zza(Lcom/google/android/gms/internal/zzkh;)V

    invoke-virtual {v1, p0}, Lcom/google/android/gms/internal/zzkg;->zza(Lcom/google/android/gms/internal/zzke;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcgf:Lcom/google/android/gms/internal/zzko$zza;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzko$zza;->zzcmx:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcju:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkc;->zzcre:Lcom/google/android/gms/internal/zzkj;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzkj;->zzuc()Lcom/google/android/gms/internal/zzha;

    move-result-object v2

    :try_start_0
    invoke-interface {v2}, Lcom/google/android/gms/internal/zzha;->isInitialized()Z

    move-result v3

    if-eqz v3, :cond_2

    sget-object v3, Lcom/google/android/gms/ads/internal/util/client/zza;->zzcxr:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzkc$1;

    invoke-direct {v4, p0, v0, v2}, Lcom/google/android/gms/internal/zzkc$1;-><init>(Lcom/google/android/gms/internal/zzkc;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzha;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/gms/internal/zzkc;->zzk(J)V

    invoke-virtual {v1, v5}, Lcom/google/android/gms/internal/zzkg;->zza(Lcom/google/android/gms/internal/zzkh;)V

    invoke-virtual {v1, v5}, Lcom/google/android/gms/internal/zzkg;->zza(Lcom/google/android/gms/internal/zzke;)V

    iget v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrj:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrf:Lcom/google/android/gms/internal/zzkh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc;->zzbwa:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzkh;->zzcq(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    :try_start_1
    sget-object v3, Lcom/google/android/gms/ads/internal/util/client/zza;->zzcxr:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzkc$2;

    invoke-direct {v4, p0, v2, v0, v1}, Lcom/google/android/gms/internal/zzkc$2;-><init>(Lcom/google/android/gms/internal/zzkc;Lcom/google/android/gms/internal/zzha;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzkg;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v2, "Fail to check if adapter is initialized."

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzbwa:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/google/android/gms/internal/zzkc;->zza(Ljava/lang/String;I)V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrf:Lcom/google/android/gms/internal/zzkh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc;->zzbwa:Ljava/lang/String;

    iget v2, p0, Lcom/google/android/gms/internal/zzkc;->zzcgw:I

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzkh;->zza(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public zztw()Lcom/google/android/gms/internal/zzkd;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrk:Lcom/google/android/gms/internal/zzkd;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zztx()Lcom/google/android/gms/internal/zzgp;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcrh:Lcom/google/android/gms/internal/zzgp;

    return-object v0
.end method

.method public zzty()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc;->zzcgf:Lcom/google/android/gms/internal/zzko$zza;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzko$zza;->zzcmx:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcju:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc;->zzcre:Lcom/google/android/gms/internal/zzkj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzkj;->zzuc()Lcom/google/android/gms/internal/zzha;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzkc;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzha;)V

    return-void
.end method
