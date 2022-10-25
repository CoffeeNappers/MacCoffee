.class public Lcom/google/android/gms/measurement/internal/zzae;
.super Lcom/google/android/gms/measurement/internal/zzaa;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/measurement/internal/zzae$zza;
    }
.end annotation


# instance fields
.field private final avs:Lcom/google/android/gms/measurement/internal/zzae$zza;

.field private avt:Lcom/google/android/gms/measurement/internal/zzm;

.field private avu:Ljava/lang/Boolean;

.field private final avv:Lcom/google/android/gms/measurement/internal/zzf;

.field private final avw:Lcom/google/android/gms/measurement/internal/zzah;

.field private final avx:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final avy:Lcom/google/android/gms/measurement/internal/zzf;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/measurement/internal/zzx;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzaa;-><init>(Lcom/google/android/gms/measurement/internal/zzx;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avx:Ljava/util/List;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzah;

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/measurement/internal/zzah;-><init>(Lcom/google/android/gms/common/util/zze;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avw:Lcom/google/android/gms/measurement/internal/zzah;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzae$zza;

    invoke-direct {v0, p0}, Lcom/google/android/gms/measurement/internal/zzae$zza;-><init>(Lcom/google/android/gms/measurement/internal/zzae;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avs:Lcom/google/android/gms/measurement/internal/zzae$zza;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzae$1;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzae$1;-><init>(Lcom/google/android/gms/measurement/internal/zzae;Lcom/google/android/gms/measurement/internal/zzx;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avv:Lcom/google/android/gms/measurement/internal/zzf;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzae$2;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzae$2;-><init>(Lcom/google/android/gms/measurement/internal/zzae;Lcom/google/android/gms/measurement/internal/zzx;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avy:Lcom/google/android/gms/measurement/internal/zzf;

    return-void
.end method

.method private onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avt:Lcom/google/android/gms/measurement/internal/zzm;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avt:Lcom/google/android/gms/measurement/internal/zzm;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Disconnected from device MeasurementService"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbyy()V

    :cond_0
    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzae;)Lcom/google/android/gms/measurement/internal/zzae$zza;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avs:Lcom/google/android/gms/measurement/internal/zzae$zza;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzae;Landroid/content/ComponentName;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzae;->onServiceDisconnected(Landroid/content/ComponentName;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzae;Lcom/google/android/gms/measurement/internal/zzm;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzae;->zza(Lcom/google/android/gms/measurement/internal/zzm;)V

    return-void
.end method

.method private zza(Lcom/google/android/gms/measurement/internal/zzm;)V
    .locals 0
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzae;->avt:Lcom/google/android/gms/measurement/internal/zzm;

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacw()V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbyz()V

    return-void
.end method

.method private zzacw()V
    .locals 4
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avw:Lcom/google/android/gms/measurement/internal/zzah;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzah;->start()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avv:Lcom/google/android/gms/measurement/internal/zzf;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzaez()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzf;->zzx(J)V

    return-void
.end method

.method private zzacx()V
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Inactivity, disconnecting from the service"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->disconnect()V

    goto :goto_0
.end method

.method static synthetic zzb(Lcom/google/android/gms/measurement/internal/zzae;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacx()V

    return-void
.end method

.method private zzbyw()Z
    .locals 4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string/jumbo v3, "com.google.android.gms.measurement.AppMeasurementService"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x10000

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzbyy()V
    .locals 0
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzadl()V

    return-void
.end method

.method private zzbyz()V
    .locals 3
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Processing queued up service tasks"

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae;->avx:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avx:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwa()Lcom/google/android/gms/measurement/internal/zzw;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zzw;->zzm(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avx:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avy:Lcom/google/android/gms/measurement/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzf;->cancel()V

    return-void
.end method

.method static synthetic zzc(Lcom/google/android/gms/measurement/internal/zzae;)Lcom/google/android/gms/measurement/internal/zzm;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avt:Lcom/google/android/gms/measurement/internal/zzm;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/measurement/internal/zzae;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacw()V

    return-void
.end method

.method private zzo(Ljava/lang/Runnable;)V
    .locals 4
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avx:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuy()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Discarding data. Max runnable queue size reached"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avx:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avy:Lcom/google/android/gms/measurement/internal/zzf;

    const-wide/32 v2, 0xea60

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzf;->zzx(J)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzadl()V

    goto :goto_0
.end method


# virtual methods
.method public disconnect()V
    .locals 3
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    :try_start_0
    invoke-static {}, Lcom/google/android/gms/common/stats/zza;->zzaxr()Lcom/google/android/gms/common/stats/zza;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae;->avs:Lcom/google/android/gms/measurement/internal/zzae$zza;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/stats/zza;->zza(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avt:Lcom/google/android/gms/measurement/internal/zzm;

    return-void

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public bridge synthetic getContext()Landroid/content/Context;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public isConnected()Z
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avt:Lcom/google/android/gms/measurement/internal/zzm;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected zza(Lcom/google/android/gms/measurement/AppMeasurement$zzf;)V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzae$8;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzae$8;-><init>(Lcom/google/android/gms/measurement/internal/zzae;Lcom/google/android/gms/measurement/AppMeasurement$zzf;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzo(Ljava/lang/Runnable;)V

    return-void
.end method

.method zza(Lcom/google/android/gms/measurement/internal/zzm;Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;)V
    .locals 10
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v2, 0x0

    const/16 v5, 0x64

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzaby()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    move v1, v0

    :goto_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvb()I

    move v4, v2

    move v3, v5

    :goto_1
    const/16 v0, 0x3e9

    if-ge v4, v0, :cond_5

    if-ne v3, v5, :cond_5

    if-eqz v1, :cond_6

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbvv()Lcom/google/android/gms/measurement/internal/zzo;

    move-result-object v0

    invoke-virtual {v0, v5}, Lcom/google/android/gms/measurement/internal/zzo;->zzxe(I)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-interface {v6, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    move v3, v0

    :goto_2
    if-eqz p2, :cond_0

    if-ge v3, v5, :cond_0

    invoke-interface {v6, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;

    instance-of v8, v0, Lcom/google/android/gms/measurement/internal/EventParcel;

    if-eqz v8, :cond_2

    :try_start_0
    check-cast v0, Lcom/google/android/gms/measurement/internal/EventParcel;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v8

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxf()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzn;->zzmi(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/AppMetadata;

    move-result-object v8

    invoke-interface {p1, v0, v8}, Lcom/google/android/gms/measurement/internal/zzm;->zza(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v8

    const-string/jumbo v9, "Failed to send event to the service"

    invoke-virtual {v8, v9, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    :cond_1
    move v1, v2

    goto :goto_0

    :cond_2
    instance-of v8, v0, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;

    if-eqz v8, :cond_3

    :try_start_1
    check-cast v0, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v8

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxf()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/google/android/gms/measurement/internal/zzn;->zzmi(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/AppMetadata;

    move-result-object v8

    invoke-interface {p1, v0, v8}, Lcom/google/android/gms/measurement/internal/zzm;->zza(Lcom/google/android/gms/measurement/internal/UserAttributeParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v8

    const-string/jumbo v9, "Failed to send attribute to the service"

    invoke-virtual {v8, v9, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v8, "Discarding data. Unrecognized parcel type."

    invoke-virtual {v0, v8}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_3

    :cond_4
    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto/16 :goto_1

    :cond_5
    return-void

    :cond_6
    move v3, v2

    goto/16 :goto_2
.end method

.method protected zza(Ljava/util/concurrent/atomic/AtomicReference;Z)V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/measurement/internal/UserAttributeParcel;",
            ">;>;Z)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzae$6;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzae$6;-><init>(Lcom/google/android/gms/measurement/internal/zzae;Ljava/util/concurrent/atomic/AtomicReference;Z)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzo(Ljava/lang/Runnable;)V

    return-void
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

.method zzadl()V
    .locals 4
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avu:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt;->zzbxl()Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avu:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avu:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "State of service unknown"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbyx()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avu:Ljava/lang/Boolean;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzae;->avu:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzt;->zzcg(Z)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avu:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Using measurement service"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->avs:Lcom/google/android/gms/measurement/internal/zzae$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae$zza;->zzbza()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbyw()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Using local app measurement service"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.google.android.gms.measurement.START"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    const-string/jumbo v3, "com.google.android.gms.measurement.AppMeasurementService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzae;->avs:Lcom/google/android/gms/measurement/internal/zzae$zza;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zzae$zza;->zzac(Landroid/content/Intent;)V

    goto/16 :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Unable to use remote or local measurement implementation. Please register the AppMeasurementService service in the app manifest"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method protected zzb(Lcom/google/android/gms/measurement/internal/UserAttributeParcel;)V
    .locals 4
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v2

    if-nez v2, :cond_0

    move v2, v0

    :goto_0
    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbvv()Lcom/google/android/gms/measurement/internal/zzo;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/google/android/gms/measurement/internal/zzo;->zza(Lcom/google/android/gms/measurement/internal/UserAttributeParcel;)Z

    move-result v2

    if-eqz v2, :cond_1

    :goto_1
    new-instance v1, Lcom/google/android/gms/measurement/internal/zzae$5;

    invoke-direct {v1, p0, v0, p1}, Lcom/google/android/gms/measurement/internal/zzae$5;-><init>(Lcom/google/android/gms/measurement/internal/zzae;ZLcom/google/android/gms/measurement/internal/UserAttributeParcel;)V

    invoke-direct {p0, v1}, Lcom/google/android/gms/measurement/internal/zzae;->zzo(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    move v2, v1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method public bridge synthetic zzbvo()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzbvo()V

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

.method protected zzbyq()V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzae$7;

    invoke-direct {v0, p0}, Lcom/google/android/gms/measurement/internal/zzae$7;-><init>(Lcom/google/android/gms/measurement/internal/zzae;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzo(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected zzbyv()V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzae$3;

    invoke-direct {v0, p0}, Lcom/google/android/gms/measurement/internal/zzae$3;-><init>(Lcom/google/android/gms/measurement/internal/zzae;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzo(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected zzbyx()Z
    .locals 4
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Checking service availability"

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/common/zzc;->zzaql()Lcom/google/android/gms/common/zzc;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/common/zzc;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    move v0, v1

    :goto_0
    return v0

    :sswitch_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Service available"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :sswitch_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Service missing"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    move v0, v1

    goto :goto_0

    :sswitch_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Service updating"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :sswitch_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Service container out of date"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :sswitch_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Service disabled"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    move v0, v1

    goto :goto_0

    :sswitch_5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Service invalid"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    move v0, v1

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_3
        0x3 -> :sswitch_4
        0x9 -> :sswitch_5
        0x12 -> :sswitch_2
    .end sparse-switch
.end method

.method protected zzc(Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)V
    .locals 6
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v3, 0x1

    const/4 v0, 0x0

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzacj()V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v1

    if-nez v1, :cond_0

    move v2, v3

    :goto_0
    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbvv()Lcom/google/android/gms/measurement/internal/zzo;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/android/gms/measurement/internal/zzo;->zza(Lcom/google/android/gms/measurement/internal/EventParcel;)Z

    move-result v1

    if-eqz v1, :cond_1

    :goto_1
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzae$4;

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/zzae$4;-><init>(Lcom/google/android/gms/measurement/internal/zzae;ZZLcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzo(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    move v2, v0

    goto :goto_0

    :cond_1
    move v3, v0

    goto :goto_1
.end method

.method public bridge synthetic zzzx()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzaa;->zzzx()V

    return-void
.end method

.method protected zzzy()V
    .locals 0

    return-void
.end method
