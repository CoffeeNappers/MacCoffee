.class public Lcom/google/android/gms/analytics/internal/zzi;
.super Lcom/google/android/gms/analytics/internal/zzd;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/analytics/internal/zzi$zza;
    }
.end annotation


# instance fields
.field private final dn:Lcom/google/android/gms/analytics/internal/zzi$zza;

.field private do:Lcom/google/android/gms/analytics/internal/zzac;

.field private final dp:Lcom/google/android/gms/analytics/internal/zzt;

.field private dq:Lcom/google/android/gms/analytics/internal/zzal;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzd;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzal;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzf;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/analytics/internal/zzal;-><init>(Lcom/google/android/gms/common/util/zze;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->dq:Lcom/google/android/gms/analytics/internal/zzal;

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzi$zza;

    invoke-direct {v0, p0}, Lcom/google/android/gms/analytics/internal/zzi$zza;-><init>(Lcom/google/android/gms/analytics/internal/zzi;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->dn:Lcom/google/android/gms/analytics/internal/zzi$zza;

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzi$1;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/analytics/internal/zzi$1;-><init>(Lcom/google/android/gms/analytics/internal/zzi;Lcom/google/android/gms/analytics/internal/zzf;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->dp:Lcom/google/android/gms/analytics/internal/zzt;

    return-void
.end method

.method private onDisconnect()V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzzg()Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzb;->zzabu()V

    return-void
.end method

.method private onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzzx()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->do:Lcom/google/android/gms/analytics/internal/zzac;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->do:Lcom/google/android/gms/analytics/internal/zzac;

    const-string/jumbo v0, "Disconnected from device AnalyticsService"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/internal/zzi;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzi;->onDisconnect()V

    :cond_0
    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/analytics/internal/zzi;)Lcom/google/android/gms/analytics/internal/zzi$zza;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->dn:Lcom/google/android/gms/analytics/internal/zzi$zza;

    return-object v0
.end method

.method private zza(Lcom/google/android/gms/analytics/internal/zzac;)V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzzx()V

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzi;->do:Lcom/google/android/gms/analytics/internal/zzac;

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacw()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzzg()Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzb;->onServiceConnected()V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/analytics/internal/zzi;Landroid/content/ComponentName;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzi;->onServiceDisconnected(Landroid/content/ComponentName;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/analytics/internal/zzi;Lcom/google/android/gms/analytics/internal/zzac;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzi;->zza(Lcom/google/android/gms/analytics/internal/zzac;)V

    return-void
.end method

.method private zzacw()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->dq:Lcom/google/android/gms/analytics/internal/zzal;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzal;->start()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->dp:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacb()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzaez()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzt;->zzx(J)V

    return-void
.end method

.method private zzacx()V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "Inactivity, disconnecting from device AnalyticsService"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzi;->zzes(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->disconnect()V

    goto :goto_0
.end method

.method static synthetic zzb(Lcom/google/android/gms/analytics/internal/zzi;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacx()V

    return-void
.end method


# virtual methods
.method public connect()Z
    .locals 2

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacj()V

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi;->do:Lcom/google/android/gms/analytics/internal/zzac;

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi;->dn:Lcom/google/android/gms/analytics/internal/zzi$zza;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzacy()Lcom/google/android/gms/analytics/internal/zzac;

    move-result-object v1

    if-eqz v1, :cond_1

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi;->do:Lcom/google/android/gms/analytics/internal/zzac;

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacw()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public disconnect()V
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacj()V

    :try_start_0
    invoke-static {}, Lcom/google/android/gms/common/stats/zza;->zzaxr()Lcom/google/android/gms/common/stats/zza;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzi;->dn:Lcom/google/android/gms/analytics/internal/zzi$zza;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/stats/zza;->zza(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->do:Lcom/google/android/gms/analytics/internal/zzac;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->do:Lcom/google/android/gms/analytics/internal/zzac;

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzi;->onDisconnect()V

    :cond_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public isConnected()Z
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacj()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->do:Lcom/google/android/gms/analytics/internal/zzac;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzacv()Z
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacj()V

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi;->do:Lcom/google/android/gms/analytics/internal/zzac;

    if-nez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    :try_start_0
    invoke-interface {v1}, Lcom/google/android/gms/analytics/internal/zzac;->zzabr()V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacw()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    const-string/jumbo v1, "Failed to clear hits from AnalyticsService"

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/internal/zzi;->zzes(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public zzb(Lcom/google/android/gms/analytics/internal/zzab;)Z
    .locals 7

    const/4 v6, 0x0

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacj()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi;->do:Lcom/google/android/gms/analytics/internal/zzac;

    if-nez v0, :cond_0

    move v0, v6

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzagc()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacb()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzaes()Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzmc()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzaga()J

    move-result-wide v2

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzac;->zza(Ljava/util/Map;JLjava/lang/String;Ljava/util/List;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacw()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzi;->zzacb()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzaet()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v0, "Failed to send hits to AnalyticsService"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzi;->zzes(Ljava/lang/String;)V

    move v0, v6

    goto :goto_0
.end method

.method protected zzzy()V
    .locals 0

    return-void
.end method
