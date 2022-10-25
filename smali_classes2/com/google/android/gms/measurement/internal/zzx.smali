.class public Lcom/google/android/gms/measurement/internal/zzx;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/measurement/internal/zzx$zza;
    }
.end annotation


# static fields
.field private static volatile atW:Lcom/google/android/gms/measurement/internal/zzx;


# instance fields
.field private final atX:Lcom/google/android/gms/measurement/internal/zzd;

.field private final atY:Lcom/google/android/gms/measurement/internal/zzt;

.field private final atZ:Lcom/google/android/gms/measurement/internal/zzq;

.field private final aua:Lcom/google/android/gms/measurement/internal/zzw;

.field private final aub:Lcom/google/android/gms/measurement/internal/zzag;

.field private final auc:Lcom/google/android/gms/measurement/internal/zzv;

.field private final aud:Lcom/google/android/gms/measurement/AppMeasurement;

.field private final aue:Lcom/google/firebase/analytics/FirebaseAnalytics;

.field private final auf:Lcom/google/android/gms/measurement/internal/zzal;

.field private final aug:Lcom/google/android/gms/measurement/internal/zze;

.field private final auh:Lcom/google/android/gms/measurement/internal/zzo;

.field private final aui:Lcom/google/android/gms/measurement/internal/zzr;

.field private final auj:Lcom/google/android/gms/measurement/internal/zzad;

.field private final auk:Lcom/google/android/gms/measurement/internal/zzae;

.field private final aul:Lcom/google/android/gms/measurement/internal/zzg;

.field private final aum:Lcom/google/android/gms/measurement/internal/zzac;

.field private final aun:Lcom/google/android/gms/measurement/internal/zzn;

.field private final auo:Lcom/google/android/gms/measurement/internal/zzs;

.field private final aup:Lcom/google/android/gms/measurement/internal/zzai;

.field private final auq:Lcom/google/android/gms/measurement/internal/zzc;

.field private aur:Z

.field private aus:Ljava/lang/Boolean;

.field private aut:J

.field private auu:Ljava/nio/channels/FileLock;

.field private auv:Ljava/nio/channels/FileChannel;

.field private auw:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private aux:I

.field private auy:I

.field private auz:J

.field private final cR:Z

.field private final mContext:Landroid/content/Context;

.field private final zzaql:Lcom/google/android/gms/common/util/zze;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzab;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->mContext:Landroid/content/Context;

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->mContext:Landroid/content/Context;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auz:J

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzn(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->zzaql:Lcom/google/android/gms/common/util/zze;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zza(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atX:Lcom/google/android/gms/measurement/internal/zzd;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzb(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atY:Lcom/google/android/gms/measurement/internal/zzt;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzc(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atZ:Lcom/google/android/gms/measurement/internal/zzq;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxc()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "App measurement is starting up, version"

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbto()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxc()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "To enable debug logging run: adb shell setprop log.tag.FA VERBOSE"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Debug-level message logging enabled"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "AppMeasurement singleton hash"

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzj(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auf:Lcom/google/android/gms/measurement/internal/zzal;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzq(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzg;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aul:Lcom/google/android/gms/measurement/internal/zzg;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzr(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzn;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aun:Lcom/google/android/gms/measurement/internal/zzn;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzn;->zzup()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zznf(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxc()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Faster debug mode event logging enabled. To disable, run:\n  adb shell setprop firebase.analytics.debug-mode .none."

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_0
    :goto_0
    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzk(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aug:Lcom/google/android/gms/measurement/internal/zze;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzl(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzo;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auh:Lcom/google/android/gms/measurement/internal/zzo;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzu(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzc;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auq:Lcom/google/android/gms/measurement/internal/zzc;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzm(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzr;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aui:Lcom/google/android/gms/measurement/internal/zzr;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzo(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzad;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auj:Lcom/google/android/gms/measurement/internal/zzad;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzp(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzae;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auk:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzi(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzac;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzac;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aum:Lcom/google/android/gms/measurement/internal/zzac;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzt(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzai;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aup:Lcom/google/android/gms/measurement/internal/zzai;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzs(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzs;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auo:Lcom/google/android/gms/measurement/internal/zzs;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzh(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/AppMeasurement;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aud:Lcom/google/android/gms/measurement/AppMeasurement;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzg(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aue:Lcom/google/firebase/analytics/FirebaseAnalytics;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zze(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzag;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aub:Lcom/google/android/gms/measurement/internal/zzag;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzf(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzv;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auc:Lcom/google/android/gms/measurement/internal/zzv;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzd(Lcom/google/android/gms/measurement/internal/zzx;)Lcom/google/android/gms/measurement/internal/zzw;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzw;->initialize()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aua:Lcom/google/android/gms/measurement/internal/zzw;

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aux:I

    iget v1, p0, Lcom/google/android/gms/measurement/internal/zzx;->auy:I

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Not all components initialized"

    iget v2, p0, Lcom/google/android/gms/measurement/internal/zzx;->aux:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lcom/google/android/gms/measurement/internal/zzx;->auy:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->cR:Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atX:Lcom/google/android/gms/measurement/internal/zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Application;

    if-eqz v0, :cond_6

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_5

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvq()Lcom/google/android/gms/measurement/internal/zzac;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzac;->zzbyp()V

    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aua:Lcom/google/android/gms/measurement/internal/zzw;

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzx$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/measurement/internal/zzx$1;-><init>(Lcom/google/android/gms/measurement/internal/zzx;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzw;->zzm(Ljava/lang/Runnable;)V

    return-void

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxc()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "To enable faster debug mode event logging run:\n  adb shell setprop firebase.analytics.debug-mode "

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_4
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Not tracking deep linking pre-ICS"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_1

    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Application context is not an Application"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private zza(Lcom/google/android/gms/measurement/internal/zzaa;)V
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Component not created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzaa;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Component not initialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method

.method private zza(Lcom/google/android/gms/measurement/internal/zzz;)V
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Component not created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method private zza(Lcom/google/android/gms/measurement/internal/zzh;)Z
    .locals 11

    const/4 v10, 0x1

    const/4 v5, 0x0

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzh;->arC:Lcom/google/android/gms/measurement/internal/EventParams;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return v5

    :cond_1
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzh;->arC:Lcom/google/android/gms/measurement/internal/EventParams;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/EventParams;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string/jumbo v2, "_r"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v5, v10

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzh;->zzctj:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzh;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzv;->zzay(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyb()J

    move-result-wide v2

    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzh;->zzctj:Ljava/lang/String;

    move v6, v5

    move v7, v5

    move v8, v5

    move v9, v5

    invoke-virtual/range {v1 .. v9}, Lcom/google/android/gms/measurement/internal/zze;->zza(JLjava/lang/String;ZZZZZ)Lcom/google/android/gms/measurement/internal/zze$zza;

    move-result-object v1

    if-eqz v0, :cond_0

    iget-wide v0, v1, Lcom/google/android/gms/measurement/internal/zze$zza;->art:J

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/zzh;->zzctj:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzd;->zzlq(Ljava/lang/String;)I

    move-result v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    move v5, v10

    goto :goto_0
.end method

.method private zza(Ljava/lang/String;[Lcom/google/android/gms/internal/zzwc$zzg;[Lcom/google/android/gms/internal/zzwc$zzb;)[Lcom/google/android/gms/internal/zzwc$zza;
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzib(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvp()Lcom/google/android/gms/measurement/internal/zzc;

    move-result-object v0

    invoke-virtual {v0, p1, p3, p2}, Lcom/google/android/gms/measurement/internal/zzc;->zza(Ljava/lang/String;[Lcom/google/android/gms/internal/zzwc$zzb;[Lcom/google/android/gms/internal/zzwc$zzg;)[Lcom/google/android/gms/internal/zzwc$zza;

    move-result-object v0

    return-object v0
.end method

.method private zzbyf()Z
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->zzbwk()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->zzbwe()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzbyg()V
    .locals 10
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const-wide/16 v8, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyk()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxq()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyf()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxw()Lcom/google/android/gms/measurement/internal/zzs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzs;->unregister()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxx()Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzai;->cancel()V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyh()J

    move-result-wide v0

    cmp-long v2, v0, v8

    if-nez v2, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxw()Lcom/google/android/gms/measurement/internal/zzs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzs;->unregister()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxx()Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzai;->cancel()V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxv()Lcom/google/android/gms/measurement/internal/zzr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzr;->zzagk()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxw()Lcom/google/android/gms/measurement/internal/zzs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzs;->zzagh()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxx()Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzai;->cancel()V

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzt;->atb:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzd;->zzbve()J

    move-result-wide v4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v6

    invoke-virtual {v6, v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zzf(JJ)Z

    move-result v6

    if-nez v6, :cond_5

    add-long/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxw()Lcom/google/android/gms/measurement/internal/zzs;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzs;->unregister()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v0, v2

    cmp-long v2, v0, v8

    if-gtz v2, :cond_6

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvh()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzt;->asZ:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Upload scheduled in approximately ms"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxx()Lcom/google/android/gms/measurement/internal/zzai;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/google/android/gms/measurement/internal/zzai;->zzx(J)V

    goto/16 :goto_0
.end method

.method private zzbyh()J
    .locals 16

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvk()J

    move-result-wide v6

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->zzbwl()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->zzbwf()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    const/4 v0, 0x1

    move v4, v0

    :goto_0
    if-eqz v4, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvg()J

    move-result-wide v0

    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v5

    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzt;->asZ:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v8

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v5

    iget-object v5, v5, Lcom/google/android/gms/measurement/internal/zzt;->ata:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v10

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zze;->zzbwi()J

    move-result-wide v12

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zze;->zzbwj()J

    move-result-wide v14

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    const-wide/16 v14, 0x0

    cmp-long v5, v12, v14

    if-nez v5, :cond_4

    const-wide/16 v2, 0x0

    :cond_1
    :goto_2
    return-wide v2

    :cond_2
    const/4 v0, 0x0

    move v4, v0

    goto :goto_0

    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvf()J

    move-result-wide v0

    goto :goto_1

    :cond_4
    sub-long/2addr v12, v2

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(J)J

    move-result-wide v12

    sub-long v12, v2, v12

    sub-long/2addr v8, v2

    invoke-static {v8, v9}, Ljava/lang/Math;->abs(J)J

    move-result-wide v8

    sub-long v8, v2, v8

    sub-long/2addr v10, v2

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(J)J

    move-result-wide v10

    sub-long v10, v2, v10

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    add-long v2, v12, v6

    if-eqz v4, :cond_5

    const-wide/16 v4, 0x0

    cmp-long v4, v8, v4

    if-lez v4, :cond_5

    invoke-static {v12, v13, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    add-long/2addr v2, v0

    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v4

    invoke-virtual {v4, v8, v9, v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zzf(JJ)Z

    move-result v4

    if-nez v4, :cond_6

    add-long v2, v8, v0

    :cond_6
    const-wide/16 v0, 0x0

    cmp-long v0, v10, v0

    if-eqz v0, :cond_1

    cmp-long v0, v10, v12

    if-ltz v0, :cond_1

    const/4 v0, 0x0

    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvm()I

    move-result v1

    if-ge v0, v1, :cond_7

    const/4 v1, 0x1

    shl-int/2addr v1, v0

    int-to-long v4, v1

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvl()J

    move-result-wide v6

    mul-long/2addr v4, v6

    add-long/2addr v2, v4

    cmp-long v1, v2, v10

    if-gtz v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_7
    const-wide/16 v2, 0x0

    goto :goto_2
.end method

.method public static zzdq(Landroid/content/Context;)Lcom/google/android/gms/measurement/internal/zzx;
    .locals 2

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/google/android/gms/measurement/internal/zzx;->atW:Lcom/google/android/gms/measurement/internal/zzx;

    if-nez v0, :cond_1

    const-class v1, Lcom/google/android/gms/measurement/internal/zzx;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/android/gms/measurement/internal/zzx;->atW:Lcom/google/android/gms/measurement/internal/zzx;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzab;

    invoke-direct {v0, p0}, Lcom/google/android/gms/measurement/internal/zzab;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzab;->zzbyo()Lcom/google/android/gms/measurement/internal/zzx;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/measurement/internal/zzx;->atW:Lcom/google/android/gms/measurement/internal/zzx;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/google/android/gms/measurement/internal/zzx;->atW:Lcom/google/android/gms/measurement/internal/zzx;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private zze(Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    .locals 8
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzib(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zze;->zzlz(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zzt;->zzml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x0

    if-nez v2, :cond_9

    new-instance v0, Lcom/google/android/gms/measurement/internal/zza;

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-direct {v0, p0, v2}, Lcom/google/android/gms/measurement/internal/zza;-><init>(Lcom/google/android/gms/measurement/internal/zzx;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzt;->zzbxh()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zza;->zzlj(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zza;->zzll(Ljava/lang/String;)V

    move-object v2, v0

    move v0, v1

    :cond_0
    :goto_0
    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->aqZ:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->aqZ:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbth()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->aqZ:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zza;->zzlk(Ljava/lang/String;)V

    move v0, v1

    :cond_1
    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arh:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arh:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtj()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arh:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zza;->zzlm(Ljava/lang/String;)V

    move v0, v1

    :cond_2
    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arb:J

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-eqz v3, :cond_3

    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arb:J

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbto()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-eqz v3, :cond_3

    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arb:J

    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/measurement/internal/zza;->zzay(J)V

    move v0, v1

    :cond_3
    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->aii:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->aii:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzaaf()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->aii:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zza;->setAppVersion(Ljava/lang/String;)V

    move v0, v1

    :cond_4
    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arg:J

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtm()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-eqz v3, :cond_5

    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arg:J

    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/measurement/internal/zza;->zzax(J)V

    move v0, v1

    :cond_5
    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->ara:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_6

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->ara:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtn()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->ara:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zza;->zzln(Ljava/lang/String;)V

    move v0, v1

    :cond_6
    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arc:J

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtp()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-eqz v3, :cond_7

    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arc:J

    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/measurement/internal/zza;->zzaz(J)V

    move v0, v1

    :cond_7
    iget-boolean v3, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->are:Z

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtq()Z

    move-result v4

    if-eq v3, v4, :cond_a

    iget-boolean v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->are:Z

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zza;->setMeasurementEnabled(Z)V

    :goto_1
    if-eqz v1, :cond_8

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zza;)V

    :cond_8
    return-void

    :cond_9
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbti()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zza;->zzll(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt;->zzbxh()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zza;->zzlj(Ljava/lang/String;)V

    move v0, v1

    goto/16 :goto_0

    :cond_a
    move v1, v0

    goto :goto_1
.end method

.method private zzh(Ljava/lang/String;J)Z
    .locals 22

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->beginTransaction()V

    :try_start_0
    new-instance v8, Lcom/google/android/gms/measurement/internal/zzx$zza;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v8, v0, v2}, Lcom/google/android/gms/measurement/internal/zzx$zza;-><init>(Lcom/google/android/gms/measurement/internal/zzx;Lcom/google/android/gms/measurement/internal/zzx$1;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/gms/measurement/internal/zzx;->auz:J

    move-object/from16 v3, p1

    move-wide/from16 v4, p2

    invoke-virtual/range {v2 .. v8}, Lcom/google/android/gms/measurement/internal/zze;->zza(Ljava/lang/String;JJLcom/google/android/gms/measurement/internal/zze$zzb;)V

    invoke-virtual {v8}, Lcom/google/android/gms/measurement/internal/zzx$zza;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_20

    const/4 v5, 0x0

    iget-object v0, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    move-object/from16 v19, v0

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/google/android/gms/internal/zzwc$zzb;

    move-object/from16 v0, v19

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    const/4 v6, 0x0

    const/4 v2, 0x0

    move/from16 v18, v2

    :goto_0
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    move/from16 v0, v18

    if-ge v0, v2, :cond_13

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v3

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v4, v2, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->name:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzv;->zzax(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v4, "Dropping blacklisted raw event"

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->name:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    iget-object v3, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zznh(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    iget-object v3, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zzni(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v2, 0x1

    :goto_1
    if-nez v2, :cond_26

    const-string/jumbo v3, "_err"

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->name:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_26

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v3

    const/16 v4, 0xb

    const-string/jumbo v7, "_ev"

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->name:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-virtual {v3, v4, v7, v2, v9}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/String;Ljava/lang/String;I)V

    move v2, v6

    move v3, v5

    :goto_2
    add-int/lit8 v4, v18, 0x1

    move/from16 v18, v4

    move v6, v2

    move v5, v3

    goto/16 :goto_0

    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v3

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v4, v2, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->name:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzv;->zzay(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_25

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    if-nez v2, :cond_3

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    const/4 v7, 0x0

    new-array v7, v7, [Lcom/google/android/gms/internal/zzwc$zzc;

    iput-object v7, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    :cond_3
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v9, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    array-length v10, v9

    const/4 v2, 0x0

    move v7, v2

    :goto_3
    if-ge v7, v10, :cond_5

    aget-object v2, v9, v7

    const-string/jumbo v11, "_c"

    iget-object v12, v2, Lcom/google/android/gms/internal/zzwc$zzc;->name:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    const-wide/16 v12, 0x1

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/google/android/gms/internal/zzwc$zzc;->awR:Ljava/lang/Long;

    const/4 v2, 0x1

    move v3, v2

    move v2, v4

    :goto_4
    add-int/lit8 v4, v7, 0x1

    move v7, v4

    move v4, v2

    goto :goto_3

    :cond_4
    const-string/jumbo v11, "_r"

    iget-object v12, v2, Lcom/google/android/gms/internal/zzwc$zzc;->name:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_24

    const-wide/16 v12, 0x1

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, v2, Lcom/google/android/gms/internal/zzwc$zzc;->awR:Ljava/lang/Long;

    const/4 v2, 0x1

    goto :goto_4

    :cond_5
    if-nez v3, :cond_6

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v7, "Marking event as conversion"

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->name:Ljava/lang/String;

    invoke-virtual {v3, v7, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v3, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    array-length v2, v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v3, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/google/android/gms/internal/zzwc$zzc;

    new-instance v3, Lcom/google/android/gms/internal/zzwc$zzc;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzwc$zzc;-><init>()V

    const-string/jumbo v7, "_c"

    iput-object v7, v3, Lcom/google/android/gms/internal/zzwc$zzc;->name:Ljava/lang/String;

    const-wide/16 v10, 0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    iput-object v7, v3, Lcom/google/android/gms/internal/zzwc$zzc;->awR:Ljava/lang/Long;

    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    aput-object v3, v2, v7

    iget-object v3, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/zzwc$zzb;

    iput-object v2, v3, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    :cond_6
    if-nez v4, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v4, "Marking event as real-time"

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->name:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v3, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    array-length v2, v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v3, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/google/android/gms/internal/zzwc$zzc;

    new-instance v3, Lcom/google/android/gms/internal/zzwc$zzc;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzwc$zzc;-><init>()V

    const-string/jumbo v4, "_r"

    iput-object v4, v3, Lcom/google/android/gms/internal/zzwc$zzc;->name:Ljava/lang/String;

    const-wide/16 v10, 0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, v3, Lcom/google/android/gms/internal/zzwc$zzc;->awR:Ljava/lang/Long;

    array-length v4, v2

    add-int/lit8 v4, v4, -0x1

    aput-object v3, v2, v4

    iget-object v3, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/zzwc$zzb;

    iput-object v2, v3, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    :cond_7
    const/4 v7, 0x1

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zzb;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzal;->zzmu(Ljava/lang/String;)Z

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v9

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyb()J

    move-result-wide v10

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v12, v2, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    invoke-virtual/range {v9 .. v17}, Lcom/google/android/gms/measurement/internal/zze;->zza(JLjava/lang/String;ZZZZZ)Lcom/google/android/gms/measurement/internal/zze$zza;

    move-result-object v2

    iget-wide v2, v2, Lcom/google/android/gms/measurement/internal/zze$zza;->art:J

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v9

    iget-object v10, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v10, v10, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzd;->zzlq(Ljava/lang/String;)I

    move-result v9

    int-to-long v10, v9

    cmp-long v2, v2, v10

    if-lez v2, :cond_b

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    const/4 v3, 0x0

    :goto_5
    iget-object v7, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    array-length v7, v7

    if-ge v3, v7, :cond_a

    const-string/jumbo v7, "_r"

    iget-object v9, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    aget-object v9, v9, v3

    iget-object v9, v9, Lcom/google/android/gms/internal/zzwc$zzc;->name:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c

    iget-object v7, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    array-length v7, v7

    add-int/lit8 v7, v7, -0x1

    new-array v7, v7, [Lcom/google/android/gms/internal/zzwc$zzc;

    if-lez v3, :cond_8

    iget-object v9, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v9, v10, v7, v11, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_8
    array-length v9, v7

    if-ge v3, v9, :cond_9

    iget-object v9, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    add-int/lit8 v10, v3, 0x1

    array-length v11, v7

    sub-int/2addr v11, v3

    invoke-static {v9, v10, v7, v3, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_9
    iput-object v7, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    :cond_a
    move v7, v5

    :cond_b
    if-eqz v4, :cond_12

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v9

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyb()J

    move-result-wide v10

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v12, v2, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-virtual/range {v9 .. v17}, Lcom/google/android/gms/measurement/internal/zze;->zza(JLjava/lang/String;ZZZZZ)Lcom/google/android/gms/measurement/internal/zze$zza;

    move-result-object v2

    iget-wide v2, v2, Lcom/google/android/gms/measurement/internal/zze$zza;->arr:J

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v4

    iget-object v5, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v5, v5, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzd;->zzlp(Ljava/lang/String;)I

    move-result v4

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_12

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Too many conversions. Not logging as conversion."

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    const/4 v5, 0x0

    const/4 v4, 0x0

    iget-object v10, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    array-length v11, v10

    const/4 v3, 0x0

    move v9, v3

    :goto_6
    if-ge v9, v11, :cond_e

    aget-object v3, v10, v9

    const-string/jumbo v12, "_c"

    iget-object v13, v3, Lcom/google/android/gms/internal/zzwc$zzc;->name:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_d

    move v4, v5

    :goto_7
    add-int/lit8 v5, v9, 0x1

    move v9, v5

    move v5, v4

    move-object v4, v3

    goto :goto_6

    :cond_c
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_5

    :cond_d
    const-string/jumbo v12, "_err"

    iget-object v3, v3, Lcom/google/android/gms/internal/zzwc$zzc;->name:Ljava/lang/String;

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_23

    const/4 v3, 0x1

    move-object/from16 v20, v4

    move v4, v3

    move-object/from16 v3, v20

    goto :goto_7

    :cond_e
    if-eqz v5, :cond_10

    if-eqz v4, :cond_10

    iget-object v3, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    new-array v10, v3, [Lcom/google/android/gms/internal/zzwc$zzc;

    const/4 v5, 0x0

    iget-object v11, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    array-length v12, v11

    const/4 v3, 0x0

    move v9, v3

    :goto_8
    if-ge v9, v12, :cond_f

    aget-object v13, v11, v9

    if-eq v13, v4, :cond_22

    add-int/lit8 v3, v5, 0x1

    aput-object v13, v10, v5

    :goto_9
    add-int/lit8 v5, v9, 0x1

    move v9, v5

    move v5, v3

    goto :goto_8

    :cond_f
    iput-object v10, v2, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    move v4, v7

    :goto_a
    move-object/from16 v0, v19

    iget-object v5, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    add-int/lit8 v3, v6, 0x1

    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzwc$zzb;

    aput-object v2, v5, v6

    move v2, v3

    move v3, v4

    goto/16 :goto_2

    :cond_10
    if-eqz v4, :cond_11

    const-string/jumbo v2, "_err"

    iput-object v2, v4, Lcom/google/android/gms/internal/zzwc$zzc;->name:Ljava/lang/String;

    const-wide/16 v2, 0xa

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, v4, Lcom/google/android/gms/internal/zzwc$zzc;->awR:Ljava/lang/Long;

    move v4, v7

    goto :goto_a

    :cond_11
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Did not find conversion parameter. Error not tracked"

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_12
    move v4, v7

    goto :goto_a

    :cond_13
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->zzani:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v6, v2, :cond_14

    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    invoke-static {v2, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/google/android/gms/internal/zzwc$zzb;

    move-object/from16 v0, v19

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    :cond_14
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    iget-object v3, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzwc$zze;->awW:[Lcom/google/android/gms/internal/zzwc$zzg;

    move-object/from16 v0, v19

    iget-object v4, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Ljava/lang/String;[Lcom/google/android/gms/internal/zzwc$zzg;[Lcom/google/android/gms/internal/zzwc$zzb;)[Lcom/google/android/gms/internal/zzwc$zza;

    move-result-object v2

    move-object/from16 v0, v19

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axo:[Lcom/google/android/gms/internal/zzwc$zza;

    const-wide v2, 0x7fffffffffffffffL

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, v19

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awY:Ljava/lang/Long;

    const-wide/high16 v2, -0x8000000000000000L

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, v19

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awZ:Ljava/lang/Long;

    const/4 v2, 0x0

    :goto_b
    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    array-length v3, v3

    if-ge v2, v3, :cond_17

    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    aget-object v3, v3, v2

    iget-object v4, v3, Lcom/google/android/gms/internal/zzwc$zzb;->awO:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    move-object/from16 v0, v19

    iget-object v4, v0, Lcom/google/android/gms/internal/zzwc$zze;->awY:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    cmp-long v4, v6, v10

    if-gez v4, :cond_15

    iget-object v4, v3, Lcom/google/android/gms/internal/zzwc$zzb;->awO:Ljava/lang/Long;

    move-object/from16 v0, v19

    iput-object v4, v0, Lcom/google/android/gms/internal/zzwc$zze;->awY:Ljava/lang/Long;

    :cond_15
    iget-object v4, v3, Lcom/google/android/gms/internal/zzwc$zzb;->awO:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    move-object/from16 v0, v19

    iget-object v4, v0, Lcom/google/android/gms/internal/zzwc$zze;->awZ:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    cmp-long v4, v6, v10

    if-lez v4, :cond_16

    iget-object v3, v3, Lcom/google/android/gms/internal/zzwc$zzb;->awO:Ljava/lang/Long;

    move-object/from16 v0, v19

    iput-object v3, v0, Lcom/google/android/gms/internal/zzwc$zze;->awZ:Ljava/lang/Long;

    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_17
    iget-object v2, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v9, v2, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v9}, Lcom/google/android/gms/measurement/internal/zze;->zzlz(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;

    move-result-object v10

    if-nez v10, :cond_1b

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Bundling raw events w/o app info"

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_18
    :goto_c
    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    array-length v2, v2

    if-lez v2, :cond_1a

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxf()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v19

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->ard:Ljava/lang/String;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v2

    iget-object v3, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auB:Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzv;->zzmo(Ljava/lang/String;)Lcom/google/android/gms/internal/zzwb$zzb;

    move-result-object v2

    if-eqz v2, :cond_19

    iget-object v3, v2, Lcom/google/android/gms/internal/zzwb$zzb;->awC:Ljava/lang/Long;

    if-nez v3, :cond_1e

    :cond_19
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Did not find measurement config or missing version info"

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :goto_d
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0, v5}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/internal/zzwc$zze;Z)V

    :cond_1a
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    iget-object v3, v8, Lcom/google/android/gms/measurement/internal/zzx$zza;->auC:Ljava/util/List;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zze;->zzaf(Ljava/util/List;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v9}, Lcom/google/android/gms/measurement/internal/zze;->zzmg(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V

    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    array-length v2, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez v2, :cond_1f

    const/4 v2, 0x1

    :goto_e
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    :goto_f
    return v2

    :cond_1b
    :try_start_1
    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    array-length v2, v2

    if-lez v2, :cond_18

    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zza;->zzbtl()J

    move-result-wide v2

    const-wide/16 v6, 0x0

    cmp-long v4, v2, v6

    if-eqz v4, :cond_1c

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    :goto_10
    move-object/from16 v0, v19

    iput-object v4, v0, Lcom/google/android/gms/internal/zzwc$zze;->axb:Ljava/lang/Long;

    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zza;->zzbtk()J

    move-result-wide v6

    const-wide/16 v12, 0x0

    cmp-long v4, v6, v12

    if-nez v4, :cond_21

    :goto_11
    const-wide/16 v6, 0x0

    cmp-long v4, v2, v6

    if-eqz v4, :cond_1d

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    :goto_12
    move-object/from16 v0, v19

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axa:Ljava/lang/Long;

    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zza;->zzbtu()V

    invoke-virtual {v10}, Lcom/google/android/gms/measurement/internal/zza;->zzbtr()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v19

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axm:Ljava/lang/Integer;

    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awY:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v10, v2, v3}, Lcom/google/android/gms/measurement/internal/zza;->zzav(J)V

    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awZ:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v10, v2, v3}, Lcom/google/android/gms/measurement/internal/zza;->zzaw(J)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v10}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zza;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_c

    :catchall_0
    move-exception v2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    throw v2

    :cond_1c
    const/4 v4, 0x0

    goto :goto_10

    :cond_1d
    const/4 v2, 0x0

    goto :goto_12

    :cond_1e
    :try_start_2
    iget-object v2, v2, Lcom/google/android/gms/internal/zzwb$zzb;->awC:Ljava/lang/Long;

    move-object/from16 v0, v19

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axt:Ljava/lang/Long;

    goto/16 :goto_d

    :cond_1f
    const/4 v2, 0x0

    goto :goto_e

    :cond_20
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    const/4 v2, 0x0

    goto/16 :goto_f

    :cond_21
    move-wide v2, v6

    goto :goto_11

    :cond_22
    move v3, v5

    goto/16 :goto_9

    :cond_23
    move-object v3, v4

    move v4, v5

    goto/16 :goto_7

    :cond_24
    move v2, v4

    goto/16 :goto_4

    :cond_25
    move v4, v5

    goto/16 :goto_a

    :cond_26
    move v2, v6

    move v3, v5

    goto/16 :goto_2
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public isEnabled()Z
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzbut()Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuu()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zzt;->zzch(Z)Z

    move-result v0

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzatu()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v0, 0x1

    goto :goto_1
.end method

.method protected start()V
    .locals 5
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->zzbwg()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->asZ:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->asZ:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxq()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v0

    const-string/jumbo v1, "android.permission.INTERNET"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zzez(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "App is missing INTERNET permission"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v0

    const-string/jumbo v1, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zzez(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "App is missing ACCESS_NETWORK_STATE permission"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/google/android/gms/measurement/internal/zzu;->zzh(Landroid/content/Context;Z)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "AppMeasurementReceiver not registered/enabled"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/google/android/gms/measurement/internal/zzaf;->zzi(Landroid/content/Context;Z)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "AppMeasurementService not registered/enabled"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Uploading is not possible. App measurement disabled"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_5
    :goto_0
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyg()V

    return-void

    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzn;->zzbth()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt;->zzbxk()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzn;->zzbth()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzt;->zzmm(Ljava/lang/String;)V

    :cond_7
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzn;->zzbth()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvq()Lcom/google/android/gms/measurement/internal/zzac;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzac;->zzbyq()V

    goto :goto_0

    :cond_8
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzn;->zzbth()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxc()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Rechecking which service to use due to a GMP App Id change"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt;->zzbxm()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auk:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->disconnect()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auk:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzadl()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzn;->zzbth()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzt;->zzmm(Ljava/lang/String;)V

    goto :goto_1
.end method

.method zza(Ljava/nio/channels/FileChannel;)I
    .locals 5
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v4, 0x4

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Bad chanel to read from"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return v0

    :cond_2
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    const-wide/16 v2, 0x0

    :try_start_0
    invoke-virtual {p1, v2, v3}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    invoke-virtual {p1, v1}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v2

    if-eq v2, v4, :cond_3

    const/4 v1, -0x1

    if-eq v2, v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v3, "Unexpected data length. Bytes read"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Failed to read from channel"

    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    :try_start_1
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v0

    goto :goto_0
.end method

.method protected zza(ILjava/lang/Throwable;[B)V
    .locals 6
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    if-nez p3, :cond_0

    new-array p3, v0, [B

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzx;->auw:Ljava/util/List;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/gms/measurement/internal/zzx;->auw:Ljava/util/List;

    const/16 v2, 0xc8

    if-eq p1, v2, :cond_1

    const/16 v2, 0xcc

    if-ne p1, v2, :cond_4

    :cond_1
    if-nez p2, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->asZ:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->ata:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyg()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Successful upload. Got network response. code, size"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    array-length v4, p3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->beginTransaction()V

    :try_start_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/measurement/internal/zze;->zzbj(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    throw v0

    :cond_2
    :try_start_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxv()Lcom/google/android/gms/measurement/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzr;->zzagk()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyf()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbye()V

    :goto_1
    return-void

    :cond_3
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auz:J

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyg()V

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Network upload failed. Will retry later. code, error"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3, p2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v1

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzt;->ata:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    const/16 v1, 0x1f7

    if-eq p1, v1, :cond_5

    const/16 v1, 0x1ad

    if-ne p1, v1, :cond_6

    :cond_5
    const/4 v0, 0x1

    :cond_6
    if-eqz v0, :cond_7

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->atb:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    :cond_7
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyg()V

    goto :goto_1
.end method

.method zza(Lcom/google/android/gms/measurement/internal/AppMetadata;J)V
    .locals 6
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zze;->zzlz(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zza;->zzbth()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zza;->zzbth()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->aqZ:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "New GMP App Id passed in. Removing cached database data."

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zza;->zzup()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zze;->zzme(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zza;->zzaaf()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zza;->zzaaf()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->aii:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "_pv"

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zza;->zzaaf()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/EventParcel;

    const-string/jumbo v1, "_au"

    new-instance v2, Lcom/google/android/gms/measurement/internal/EventParams;

    invoke-direct {v2, v3}, Lcom/google/android/gms/measurement/internal/EventParams;-><init>(Landroid/os/Bundle;)V

    const-string/jumbo v3, "auto"

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/EventParcel;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/EventParams;Ljava/lang/String;J)V

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/measurement/internal/zzx;->zzb(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    :cond_1
    return-void
.end method

.method zza(Lcom/google/android/gms/measurement/internal/zzh;Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    .locals 8

    const-wide/16 v6, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzh;->zzctj:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzib(Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzh;->zzctj:Ljava/lang/String;

    iget-object v2, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzbt(Z)V

    new-instance v2, Lcom/google/android/gms/internal/zzwc$zze;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzwc$zze;-><init>()V

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->awU:Ljava/lang/Integer;

    const-string/jumbo v0, "android"

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->axc:Ljava/lang/String;

    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->ara:Ljava/lang/String;

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->ara:Ljava/lang/String;

    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->aii:Ljava/lang/String;

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->aii:Ljava/lang/String;

    iget-wide v4, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->arg:J

    long-to-int v0, v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->axp:Ljava/lang/Integer;

    iget-wide v4, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->arb:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->axg:Ljava/lang/Long;

    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->aqZ:Ljava/lang/String;

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->aqZ:Ljava/lang/String;

    iget-wide v4, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->arc:J

    cmp-long v0, v4, v6

    if-nez v0, :cond_2

    move-object v0, v1

    :goto_0
    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->axl:Ljava/lang/Long;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v3, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zzt;->zzmk(Ljava/lang/String;)Landroid/util/Pair;

    move-result-object v3

    if-eqz v3, :cond_3

    iget-object v0, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->axi:Ljava/lang/String;

    iget-object v0, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->axj:Ljava/lang/Boolean;

    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzg;->zzvt()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->axd:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzg;->zzbws()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->zzdb:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzg;->zzbwt()J

    move-result-wide v4

    long-to-int v0, v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->axf:Ljava/lang/Integer;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzg;->zzbwu()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->axe:Ljava/lang/String;

    iput-object v1, v2, Lcom/google/android/gms/internal/zzwc$zze;->axh:Ljava/lang/Long;

    iput-object v1, v2, Lcom/google/android/gms/internal/zzwc$zze;->awX:Ljava/lang/Long;

    iput-object v1, v2, Lcom/google/android/gms/internal/zzwc$zze;->awY:Ljava/lang/Long;

    iput-object v1, v2, Lcom/google/android/gms/internal/zzwc$zze;->awZ:Ljava/lang/Long;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zze;->zzlz(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;

    move-result-object v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/measurement/internal/zza;

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/measurement/internal/zza;-><init>(Lcom/google/android/gms/measurement/internal/zzx;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzt;->zzbxh()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zza;->zzlj(Ljava/lang/String;)V

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->arh:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zza;->zzlm(Ljava/lang/String;)V

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->aqZ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zza;->zzlk(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v1

    iget-object v3, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/measurement/internal/zzt;->zzml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zza;->zzll(Ljava/lang/String;)V

    invoke-virtual {v0, v6, v7}, Lcom/google/android/gms/measurement/internal/zza;->zzba(J)V

    invoke-virtual {v0, v6, v7}, Lcom/google/android/gms/measurement/internal/zza;->zzav(J)V

    invoke-virtual {v0, v6, v7}, Lcom/google/android/gms/measurement/internal/zza;->zzaw(J)V

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->aii:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zza;->setAppVersion(Ljava/lang/String;)V

    iget-wide v4, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->arg:J

    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/measurement/internal/zza;->zzax(J)V

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->ara:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zza;->zzln(Ljava/lang/String;)V

    iget-wide v4, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->arb:J

    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/measurement/internal/zza;->zzay(J)V

    iget-wide v4, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->arc:J

    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/measurement/internal/zza;->zzaz(J)V

    iget-boolean v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->are:Z

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zza;->setMeasurementEnabled(Z)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zza;)V

    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zza;->zzazn()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v2, Lcom/google/android/gms/internal/zzwc$zze;->axk:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zza;->zzbtj()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->arh:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zze;->zzly(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzwc$zzg;

    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->awW:[Lcom/google/android/gms/internal/zzwc$zzg;

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_6

    new-instance v4, Lcom/google/android/gms/internal/zzwc$zzg;

    invoke-direct {v4}, Lcom/google/android/gms/internal/zzwc$zzg;-><init>()V

    iget-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->awW:[Lcom/google/android/gms/internal/zzwc$zzg;

    aput-object v4, v0, v1

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzak;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzak;->mName:Ljava/lang/String;

    iput-object v0, v4, Lcom/google/android/gms/internal/zzwc$zzg;->name:Ljava/lang/String;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzak;

    iget-wide v6, v0, Lcom/google/android/gms/measurement/internal/zzak;->avX:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, v4, Lcom/google/android/gms/internal/zzwc$zzg;->axx:Ljava/lang/Long;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v5

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzak;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzak;->zzcyd:Ljava/lang/Object;

    invoke-virtual {v5, v4, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Lcom/google/android/gms/internal/zzwc$zzg;Ljava/lang/Object;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    :cond_2
    iget-wide v4, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->arc:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto/16 :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v0

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzx;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zzg;->zzdp(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v3, "android_id"

    invoke-static {v0, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v3, "null secure ID"

    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    const-string/jumbo v0, "null"

    :cond_4
    :goto_3
    iput-object v0, v2, Lcom/google/android/gms/internal/zzwc$zze;->axs:Ljava/lang/String;

    goto/16 :goto_1

    :cond_5
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v4, "empty secure ID"

    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_3

    :cond_6
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/internal/zzwc$zze;)J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzh;)Z

    move-result v3

    invoke-virtual {v2, p1, v0, v1, v3}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zzh;JZ)V

    :goto_4
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Data loss. Failed to insert raw event metadata"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_4
.end method

.method zza(ILjava/nio/channels/FileChannel;)Z
    .locals 6
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v2

    if-nez v2, :cond_2

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Bad chanel to read from"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    move v0, v1

    :cond_1
    :goto_0
    return v0

    :cond_2
    const/4 v2, 0x4

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    const-wide/16 v4, 0x0

    :try_start_0
    invoke-virtual {p2, v4, v5}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;

    invoke-virtual {p2, v2}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    const/4 v2, 0x1

    invoke-virtual {p2, v2}, Ljava/nio/channels/FileChannel;->force(Z)V

    invoke-virtual {p2}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Error writing to channel. Bytes written"

    invoke-virtual {p2}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Failed to write to channel"

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    move v0, v1

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)[B
    .locals 18
    .param p1    # Lcom/google/android/gms/measurement/internal/EventParcel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Size;
            min = 0x1L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyc()V

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static/range {p2 .. p2}, Lcom/google/android/gms/common/internal/zzaa;->zzib(Ljava/lang/String;)Ljava/lang/String;

    new-instance v13, Lcom/google/android/gms/internal/zzwc$zzd;

    invoke-direct {v13}, Lcom/google/android/gms/internal/zzwc$zzd;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->beginTransaction()V

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zze;->zzlz(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;

    move-result-object v16

    if-nez v16, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Log and bundle not available. package_name"

    move-object/from16 v0, p2

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v2, 0x0

    new-array v2, v2, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    :goto_0
    return-object v2

    :cond_0
    :try_start_1
    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbtq()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Log and bundle disabled. package_name"

    move-object/from16 v0, p2

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v2, 0x0

    new-array v2, v2, [B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto :goto_0

    :cond_1
    :try_start_2
    new-instance v17, Lcom/google/android/gms/internal/zzwc$zze;

    invoke-direct/range {v17 .. v17}, Lcom/google/android/gms/internal/zzwc$zze;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/google/android/gms/internal/zzwc$zze;

    const/4 v3, 0x0

    aput-object v17, v2, v3

    iput-object v2, v13, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awU:Ljava/lang/Integer;

    const-string/jumbo v2, "android"

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axc:Ljava/lang/String;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzup()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbtn()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->ara:Ljava/lang/String;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzaaf()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->aii:Ljava/lang/String;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbtm()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axp:Ljava/lang/Integer;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbto()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axg:Ljava/lang/Long;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbth()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->aqZ:Ljava/lang/String;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbtp()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axl:Ljava/lang/Long;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v2

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzup()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzt;->zzmk(Ljava/lang/String;)Landroid/util/Pair;

    move-result-object v3

    if-eqz v3, :cond_2

    iget-object v2, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axi:Ljava/lang/String;

    iget-object v2, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Boolean;

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axj:Ljava/lang/Boolean;

    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzvt()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axd:Ljava/lang/String;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzbws()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->zzdb:Ljava/lang/String;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzbwt()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axf:Ljava/lang/Integer;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvs()Lcom/google/android/gms/measurement/internal/zzg;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzg;->zzbwu()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axe:Ljava/lang/String;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzazn()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axk:Ljava/lang/String;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbtj()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->arh:Ljava/lang/String;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzup()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zze;->zzly(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/google/android/gms/internal/zzwc$zzg;

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awW:[Lcom/google/android/gms/internal/zzwc$zzg;

    const/4 v2, 0x0

    move v3, v2

    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v2

    if-ge v3, v2, :cond_3

    new-instance v5, Lcom/google/android/gms/internal/zzwc$zzg;

    invoke-direct {v5}, Lcom/google/android/gms/internal/zzwc$zzg;-><init>()V

    move-object/from16 v0, v17

    iget-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awW:[Lcom/google/android/gms/internal/zzwc$zzg;

    aput-object v5, v2, v3

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/measurement/internal/zzak;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzak;->mName:Ljava/lang/String;

    iput-object v2, v5, Lcom/google/android/gms/internal/zzwc$zzg;->name:Ljava/lang/String;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/measurement/internal/zzak;

    iget-wide v6, v2, Lcom/google/android/gms/measurement/internal/zzak;->avX:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, v5, Lcom/google/android/gms/internal/zzwc$zzg;->axx:Ljava/lang/Long;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v6

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/measurement/internal/zzak;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzak;->zzcyd:Ljava/lang/Object;

    invoke-virtual {v6, v5, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Lcom/google/android/gms/internal/zzwc$zzg;Ljava/lang/Object;)V

    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_1

    :cond_3
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->arJ:Lcom/google/android/gms/measurement/internal/EventParams;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/EventParams;->zzbww()Landroid/os/Bundle;

    move-result-object v12

    const-string/jumbo v2, "_iap"

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string/jumbo v2, "_c"

    const-wide/16 v4, 0x1

    invoke-virtual {v12, v2, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Marking in-app purchase as real-time"

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    const-string/jumbo v2, "_r"

    const-wide/16 v4, 0x1

    invoke-virtual {v12, v2, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_4
    const-string/jumbo v2, "_o"

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->arK:Ljava/lang/String;

    invoke-virtual {v12, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    move-object/from16 v0, v17

    iget-object v3, v0, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zznf(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    const-string/jumbo v3, "_dbg"

    const-wide/16 v4, 0x1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v12, v3, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    const-string/jumbo v3, "_r"

    const-wide/16 v4, 0x1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v12, v3, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v2, v0, v3}, Lcom/google/android/gms/measurement/internal/zze;->zzap(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzi;

    move-result-object v2

    if-nez v2, :cond_6

    const-wide/16 v14, 0x0

    new-instance v3, Lcom/google/android/gms/measurement/internal/zzi;

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    const-wide/16 v6, 0x1

    const-wide/16 v8, 0x0

    move-object/from16 v0, p1

    iget-wide v10, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->arL:J

    move-object/from16 v4, p2

    invoke-direct/range {v3 .. v11}, Lcom/google/android/gms/measurement/internal/zzi;-><init>(Ljava/lang/String;Ljava/lang/String;JJJ)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zzi;)V

    move-wide v10, v14

    :goto_2
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzh;

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->arK:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-wide v8, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->arL:J

    move-object/from16 v4, p0

    move-object/from16 v6, p2

    invoke-direct/range {v3 .. v12}, Lcom/google/android/gms/measurement/internal/zzh;-><init>(Lcom/google/android/gms/measurement/internal/zzx;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;)V

    new-instance v6, Lcom/google/android/gms/internal/zzwc$zzb;

    invoke-direct {v6}, Lcom/google/android/gms/internal/zzwc$zzb;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/google/android/gms/internal/zzwc$zzb;

    const/4 v4, 0x0

    aput-object v6, v2, v4

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    iget-wide v4, v3, Lcom/google/android/gms/measurement/internal/zzh;->vO:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, v6, Lcom/google/android/gms/internal/zzwc$zzb;->awO:Ljava/lang/Long;

    iget-object v2, v3, Lcom/google/android/gms/measurement/internal/zzh;->mName:Ljava/lang/String;

    iput-object v2, v6, Lcom/google/android/gms/internal/zzwc$zzb;->name:Ljava/lang/String;

    iget-wide v4, v3, Lcom/google/android/gms/measurement/internal/zzh;->arB:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, v6, Lcom/google/android/gms/internal/zzwc$zzb;->awP:Ljava/lang/Long;

    iget-object v2, v3, Lcom/google/android/gms/measurement/internal/zzh;->arC:Lcom/google/android/gms/measurement/internal/EventParams;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/EventParams;->size()I

    move-result v2

    new-array v2, v2, [Lcom/google/android/gms/internal/zzwc$zzc;

    iput-object v2, v6, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    const/4 v2, 0x0

    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzh;->arC:Lcom/google/android/gms/measurement/internal/EventParams;

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/EventParams;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v4, v2

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v8, Lcom/google/android/gms/internal/zzwc$zzc;

    invoke-direct {v8}, Lcom/google/android/gms/internal/zzwc$zzc;-><init>()V

    iget-object v9, v6, Lcom/google/android/gms/internal/zzwc$zzb;->awN:[Lcom/google/android/gms/internal/zzwc$zzc;

    add-int/lit8 v5, v4, 0x1

    aput-object v8, v9, v4

    iput-object v2, v8, Lcom/google/android/gms/internal/zzwc$zzc;->name:Ljava/lang/String;

    iget-object v4, v3, Lcom/google/android/gms/measurement/internal/zzh;->arC:Lcom/google/android/gms/measurement/internal/EventParams;

    invoke-virtual {v4, v2}, Lcom/google/android/gms/measurement/internal/EventParams;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v4

    invoke-virtual {v4, v8, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Lcom/google/android/gms/internal/zzwc$zzc;Ljava/lang/Object;)V

    move v4, v5

    goto :goto_3

    :cond_6
    iget-wide v10, v2, Lcom/google/android/gms/measurement/internal/zzi;->arF:J

    move-object/from16 v0, p1

    iget-wide v4, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->arL:J

    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/measurement/internal/zzi;->zzbl(J)Lcom/google/android/gms/measurement/internal/zzi;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzi;->zzbwv()Lcom/google/android/gms/measurement/internal/zzi;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zzi;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_2

    :catchall_0
    move-exception v2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    throw v2

    :cond_7
    :try_start_3
    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzup()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    iget-object v3, v0, Lcom/google/android/gms/internal/zzwc$zze;->awW:[Lcom/google/android/gms/internal/zzwc$zzg;

    move-object/from16 v0, v17

    iget-object v4, v0, Lcom/google/android/gms/internal/zzwc$zze;->awV:[Lcom/google/android/gms/internal/zzwc$zzb;

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Ljava/lang/String;[Lcom/google/android/gms/internal/zzwc$zzg;[Lcom/google/android/gms/internal/zzwc$zzb;)[Lcom/google/android/gms/internal/zzwc$zza;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axo:[Lcom/google/android/gms/internal/zzwc$zza;

    iget-object v2, v6, Lcom/google/android/gms/internal/zzwc$zzb;->awO:Ljava/lang/Long;

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awY:Ljava/lang/Long;

    iget-object v2, v6, Lcom/google/android/gms/internal/zzwc$zzb;->awO:Ljava/lang/Long;

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awZ:Ljava/lang/Long;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbtl()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-eqz v4, :cond_8

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    :goto_4
    move-object/from16 v0, v17

    iput-object v4, v0, Lcom/google/android/gms/internal/zzwc$zze;->axb:Ljava/lang/Long;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbtk()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-nez v6, :cond_a

    :goto_5
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-eqz v4, :cond_9

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    :goto_6
    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axa:Ljava/lang/Long;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbtu()V

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/measurement/internal/zza;->zzbtr()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axm:Ljava/lang/Integer;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbto()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axh:Ljava/lang/Long;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awX:Ljava/lang/Long;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->axn:Ljava/lang/Boolean;

    move-object/from16 v0, v17

    iget-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awY:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zza;->zzav(J)V

    move-object/from16 v0, v17

    iget-object v2, v0, Lcom/google/android/gms/internal/zzwc$zze;->awZ:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zza;->zzaw(J)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zza;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    :try_start_4
    invoke-virtual {v13}, Lcom/google/android/gms/internal/zzwc$zzd;->cz()I

    move-result v2

    new-array v2, v2, [B

    invoke-static {v2}, Lcom/google/android/gms/internal/zzart;->zzbe([B)Lcom/google/android/gms/internal/zzart;

    move-result-object v3

    invoke-virtual {v13, v3}, Lcom/google/android/gms/internal/zzwc$zzd;->zza(Lcom/google/android/gms/internal/zzart;)V

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzart;->cm()V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zzk([B)[B
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    move-result-object v2

    goto/16 :goto_0

    :cond_8
    const/4 v4, 0x0

    goto/16 :goto_4

    :cond_9
    const/4 v2, 0x0

    goto/16 :goto_6

    :catch_0
    move-exception v2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v4, "Data loss. Failed to bundle and serialize"

    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v2, 0x0

    goto/16 :goto_0

    :cond_a
    move-wide v2, v4

    goto/16 :goto_5
.end method

.method zzaby()V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    return-void
.end method

.method public zzabz()Lcom/google/android/gms/common/util/zze;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->zzaql:Lcom/google/android/gms/common/util/zze;

    return-object v0
.end method

.method zzacj()V
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->cR:Z

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "AppMeasurement is not initialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method protected zzag(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzbt(Z)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auw:Ljava/util/List;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Set uploading progress before finishing the previous upload"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auw:Ljava/util/List;

    goto :goto_1
.end method

.method public zzaw(Z)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyg()V

    return-void
.end method

.method zzb(Lcom/google/android/gms/measurement/internal/AppMetadata;J)V
    .locals 12
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v1, 0x0

    const-wide/16 v10, 0x1

    const-wide/16 v8, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v0, "_c"

    invoke-virtual {v3, v0, v10, v11}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string/jumbo v0, "_r"

    invoke-virtual {v3, v0, v10, v11}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string/jumbo v0, "_uwa"

    invoke-virtual {v3, v0, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string/jumbo v0, "_pfo"

    invoke-virtual {v3, v0, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string/jumbo v0, "_sys"

    invoke-virtual {v3, v0, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string/jumbo v0, "_sysu"

    invoke-virtual {v3, v0, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "PackageManager is null, first open report might be inaccurate"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zze;->zzmf(Ljava/lang/String;)J

    move-result-wide v0

    cmp-long v2, v0, v8

    if-ltz v2, :cond_1

    const-string/jumbo v2, "_pfo"

    invoke-virtual {v3, v2, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_1
    new-instance v0, Lcom/google/android/gms/measurement/internal/EventParcel;

    const-string/jumbo v1, "_f"

    new-instance v2, Lcom/google/android/gms/measurement/internal/EventParams;

    invoke-direct {v2, v3}, Lcom/google/android/gms/measurement/internal/EventParams;-><init>(Landroid/os/Bundle;)V

    const-string/jumbo v3, "auto"

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/EventParcel;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/EventParams;Ljava/lang/String;J)V

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/measurement/internal/zzx;->zzb(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    return-void

    :cond_2
    :try_start_0
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_1
    if-eqz v0, :cond_3

    iget-wide v4, v0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    cmp-long v4, v4, v8

    if-eqz v4, :cond_3

    iget-wide v4, v0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    iget-wide v6, v0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    cmp-long v0, v4, v6

    if-eqz v0, :cond_3

    const-string/jumbo v0, "_uwa"

    invoke-virtual {v3, v0, v10, v11}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_3
    :try_start_1
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    :goto_2
    if-eqz v0, :cond_0

    iget v1, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_4

    const-string/jumbo v1, "_sys"

    invoke-virtual {v3, v1, v10, v11}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_4
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    const-string/jumbo v0, "_sysu"

    invoke-virtual {v3, v0, v10, v11}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v4

    const-string/jumbo v5, "Package info is null, first open report might be inaccurate"

    invoke-virtual {v4, v5, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v4, "Application info is null, first open report might be inaccurate"

    invoke-virtual {v2, v4, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v1

    goto :goto_2
.end method

.method zzb(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    .locals 18
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v16

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    move-object/from16 v0, p2

    iget-object v4, v0, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-static {v4}, Lcom/google/android/gms/common/internal/zzaa;->zzib(Ljava/lang/String;)Ljava/lang/String;

    invoke-static/range {p1 .. p2}, Lcom/google/android/gms/measurement/internal/zzal;->zzc(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object/from16 v0, p2

    iget-boolean v2, v0, Lcom/google/android/gms/measurement/internal/AppMetadata;->are:Z

    if-nez v2, :cond_2

    const-string/jumbo v2, "_in"

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/google/android/gms/measurement/internal/zzx;->zze(Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    goto :goto_0

    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v2

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v2, v4, v3}, Lcom/google/android/gms/measurement/internal/zzv;->zzax(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Dropping blacklisted event"

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v2, v3, v5}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zznh(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zzni(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    const/4 v2, 0x1

    :goto_1
    if-nez v2, :cond_4

    const-string/jumbo v3, "_err"

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v3

    const/16 v5, 0xb

    const-string/jumbo v6, "_ev"

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual {v3, v5, v6, v7, v8}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/String;Ljava/lang/String;I)V

    :cond_4
    if-eqz v2, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zze;->zzlz(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtt()J

    move-result-wide v4

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbts()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v6

    sub-long v4, v6, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzd;->zzbux()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-lez v3, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v4, "Fetching config for blacklisted app"

    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzx;->zzb(Lcom/google/android/gms/measurement/internal/zza;)V

    goto/16 :goto_0

    :cond_5
    const/4 v2, 0x0

    goto :goto_1

    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbi(I)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Logging event"

    move-object/from16 v0, p1

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->beginTransaction()V

    :try_start_0
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->arJ:Lcom/google/android/gms/measurement/internal/EventParams;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/EventParams;->zzbww()Landroid/os/Bundle;

    move-result-object v14

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/google/android/gms/measurement/internal/zzx;->zze(Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    const-string/jumbo v2, "_iap"

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string/jumbo v2, "ecommerce_purchase"

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_8
    const-string/jumbo v2, "currency"

    invoke-virtual {v14, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v2, "ecommerce_purchase"

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    const-string/jumbo v2, "value"

    invoke-virtual {v14, v2}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    const-wide v6, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v2, v6

    const-wide/16 v6, 0x0

    cmpl-double v6, v2, v6

    if-nez v6, :cond_9

    const-string/jumbo v2, "value"

    invoke-virtual {v14, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v6, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v2, v6

    :cond_9
    const-wide/high16 v6, 0x43e0000000000000L    # 9.223372036854776E18

    cmpg-double v6, v2, v6

    if-gtz v6, :cond_d

    const-wide/high16 v6, -0x3c20000000000000L    # -9.223372036854776E18

    cmpl-double v6, v2, v6

    if-ltz v6, :cond_d

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    move-wide v8, v2

    :goto_2
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v5, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "[A-Z]{3}"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    const-string/jumbo v3, "_ltv_"

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_f

    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/measurement/internal/zze;->zzar(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzak;

    move-result-object v2

    if-eqz v2, :cond_a

    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzak;->zzcyd:Ljava/lang/Object;

    instance-of v3, v3, Ljava/lang/Long;

    if-nez v3, :cond_10

    :cond_a
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzd;->zzls(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v4, v3}, Lcom/google/android/gms/measurement/internal/zze;->zzz(Ljava/lang/String;I)V

    new-instance v3, Lcom/google/android/gms/measurement/internal/zzak;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-direct/range {v3 .. v8}, Lcom/google/android/gms/measurement/internal/zzak;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zzak;)Z

    move-result v2

    if-nez v2, :cond_b

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v5, "Too many unique user properties are set. Ignoring user property."

    iget-object v6, v3, Lcom/google/android/gms/measurement/internal/zzak;->mName:Ljava/lang/String;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzak;->zzcyd:Ljava/lang/Object;

    invoke-virtual {v2, v5, v6, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    const/16 v3, 0x9

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v2, v3, v5, v6, v7}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/String;Ljava/lang/String;I)V

    :cond_b
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/android/gms/measurement/internal/zzal;->zzmu(Ljava/lang/String;)Z

    move-result v10

    const-string/jumbo v2, "_err"

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyb()J

    move-result-wide v6

    const/4 v9, 0x1

    const/4 v11, 0x0

    const/4 v13, 0x0

    move-object v8, v4

    invoke-virtual/range {v5 .. v13}, Lcom/google/android/gms/measurement/internal/zze;->zza(JLjava/lang/String;ZZZZZ)Lcom/google/android/gms/measurement/internal/zze$zza;

    move-result-object v2

    iget-wide v6, v2, Lcom/google/android/gms/measurement/internal/zze$zza;->arq:J

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzd;->zzbul()J

    move-result-wide v8

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-lez v3, :cond_11

    const-wide/16 v4, 0x3e8

    rem-long v4, v6, v4

    const-wide/16 v6, 0x1

    cmp-long v3, v4, v6

    if-nez v3, :cond_c

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v4, "Data loss. Too many events logged. count"

    iget-wide v6, v2, Lcom/google/android/gms/measurement/internal/zze$zza;->arq:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_c
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    const/16 v3, 0x10

    const-string/jumbo v4, "_ev"

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto/16 :goto_0

    :cond_d
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v4

    const-string/jumbo v5, "Data lost. Currency value is too big"

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v4, v5, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto/16 :goto_0

    :cond_e
    :try_start_2
    const-string/jumbo v2, "value"

    invoke-virtual {v14, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    move-wide v8, v2

    goto/16 :goto_2

    :cond_f
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_3

    :catchall_0
    move-exception v2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    throw v2

    :cond_10
    :try_start_3
    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzak;->zzcyd:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    new-instance v3, Lcom/google/android/gms/measurement/internal/zzak;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v6

    add-long/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-direct/range {v3 .. v8}, Lcom/google/android/gms/measurement/internal/zzak;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    goto/16 :goto_4

    :cond_11
    if-eqz v10, :cond_13

    iget-wide v6, v2, Lcom/google/android/gms/measurement/internal/zze$zza;->arp:J

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzd;->zzbum()J

    move-result-wide v8

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-lez v3, :cond_13

    const-wide/16 v4, 0x3e8

    rem-long v4, v6, v4

    const-wide/16 v6, 0x1

    cmp-long v3, v4, v6

    if-nez v3, :cond_12

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v4, "Data loss. Too many public events logged. count"

    iget-wide v6, v2, Lcom/google/android/gms/measurement/internal/zze$zza;->arp:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_12
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    const/16 v3, 0x10

    const-string/jumbo v4, "_ev"

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto/16 :goto_0

    :cond_13
    if-eqz v12, :cond_15

    :try_start_4
    iget-wide v6, v2, Lcom/google/android/gms/measurement/internal/zze$zza;->ars:J

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v3

    move-object/from16 v0, p2

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/google/android/gms/measurement/internal/zzd;->zzlo(Ljava/lang/String;)I

    move-result v3

    int-to-long v8, v3

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-lez v3, :cond_15

    const-wide/16 v4, 0x1

    cmp-long v3, v6, v4

    if-nez v3, :cond_14

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v4, "Too many error events logged. count"

    iget-wide v6, v2, Lcom/google/android/gms/measurement/internal/zze$zza;->ars:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_14
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto/16 :goto_0

    :cond_15
    :try_start_5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    const-string/jumbo v3, "_o"

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->arK:Ljava/lang/String;

    invoke-virtual {v2, v14, v3, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zznf(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    const-string/jumbo v3, "_dbg"

    const-wide/16 v6, 0x1

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v2, v14, v3, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    const-string/jumbo v3, "_r"

    const-wide/16 v6, 0x1

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v2, v14, v3, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_16
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zze;->zzma(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v6, 0x0

    cmp-long v5, v2, v6

    if-lez v5, :cond_17

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v5

    const-string/jumbo v6, "Data lost. Too many events stored on disk, deleted"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v5, v6, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_17
    new-instance v5, Lcom/google/android/gms/measurement/internal/zzh;

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->arK:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-wide v10, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->arL:J

    const-wide/16 v12, 0x0

    move-object/from16 v6, p0

    move-object v8, v4

    invoke-direct/range {v5 .. v14}, Lcom/google/android/gms/measurement/internal/zzh;-><init>(Lcom/google/android/gms/measurement/internal/zzx;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    iget-object v3, v5, Lcom/google/android/gms/measurement/internal/zzh;->mName:Ljava/lang/String;

    invoke-virtual {v2, v4, v3}, Lcom/google/android/gms/measurement/internal/zze;->zzap(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzi;

    move-result-object v2

    if-nez v2, :cond_1a

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zze;->zzmh(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuk()I

    const-wide/16 v6, 0x1f4

    cmp-long v2, v2, v6

    if-ltz v2, :cond_18

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Too many event names used, ignoring event. name, supported count"

    iget-object v4, v5, Lcom/google/android/gms/measurement/internal/zzh;->mName:Ljava/lang/String;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzd;->zzbuk()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    const/16 v3, 0x8

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/String;Ljava/lang/String;I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto/16 :goto_0

    :cond_18
    :try_start_6
    new-instance v7, Lcom/google/android/gms/measurement/internal/zzi;

    iget-object v9, v5, Lcom/google/android/gms/measurement/internal/zzh;->mName:Ljava/lang/String;

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    iget-wide v14, v5, Lcom/google/android/gms/measurement/internal/zzh;->vO:J

    move-object v8, v4

    invoke-direct/range {v7 .. v15}, Lcom/google/android/gms/measurement/internal/zzi;-><init>(Ljava/lang/String;Ljava/lang/String;JJJ)V

    :goto_5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v7}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zzi;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v5, v1}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzh;Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbi(I)Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Event recorded"

    invoke-virtual {v2, v3, v5}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :cond_19
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyg()V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Background event processing time, ms"

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long v4, v4, v16

    const-wide/32 v6, 0x7a120

    add-long/2addr v4, v6

    const-wide/32 v6, 0xf4240

    div-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    :cond_1a
    :try_start_7
    iget-wide v6, v2, Lcom/google/android/gms/measurement/internal/zzi;->arF:J

    move-object/from16 v0, p0

    invoke-virtual {v5, v0, v6, v7}, Lcom/google/android/gms/measurement/internal/zzh;->zza(Lcom/google/android/gms/measurement/internal/zzx;J)Lcom/google/android/gms/measurement/internal/zzh;

    move-result-object v5

    iget-wide v6, v5, Lcom/google/android/gms/measurement/internal/zzh;->vO:J

    invoke-virtual {v2, v6, v7}, Lcom/google/android/gms/measurement/internal/zzi;->zzbl(J)Lcom/google/android/gms/measurement/internal/zzi;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result-object v7

    goto :goto_5
.end method

.method zzb(Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)V
    .locals 18
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zze;->zzlz(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzaaf()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "No app data available; dropping event"

    move-object/from16 v0, p2

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_1
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v3, v0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzaaf()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzaaf()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v4, "App version does not match; dropping event"

    move-object/from16 v0, p2

    invoke-virtual {v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    const-string/jumbo v3, "_ui"

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/google/android/gms/measurement/internal/EventParcel;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v3

    const-string/jumbo v4, "Could not find package"

    move-object/from16 v0, p2

    invoke-virtual {v3, v4, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    new-instance v3, Lcom/google/android/gms/measurement/internal/AppMetadata;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbth()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzaaf()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtm()J

    move-result-wide v7

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtn()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbto()J

    move-result-wide v10

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtp()J

    move-result-wide v12

    const/4 v14, 0x0

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtq()Z

    move-result v15

    const/16 v16, 0x0

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zza;->zzbtj()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v4, p2

    invoke-direct/range {v3 .. v17}, Lcom/google/android/gms/measurement/internal/AppMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JJLjava/lang/String;ZZLjava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v3}, Lcom/google/android/gms/measurement/internal/zzx;->zzb(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    goto/16 :goto_0
.end method

.method zzb(Lcom/google/android/gms/measurement/internal/UserAttributeParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    .locals 7
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v5, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->aqZ:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->are:Z

    if-nez v1, :cond_2

    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzx;->zze(Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v1

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zzmy(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzd;->zzbue()I

    move-result v4

    invoke-virtual {v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    if-eqz v3, :cond_3

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v3

    const-string/jumbo v4, "_ev"

    invoke-virtual {v3, v1, v4, v2, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v1

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzal;->zzm(Ljava/lang/String;Ljava/lang/Object;)I

    move-result v1

    if-eqz v1, :cond_7

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzd;->zzbue()I

    move-result v4

    invoke-virtual {v2, v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_6

    instance-of v4, v3, Ljava/lang/String;

    if-nez v4, :cond_5

    instance-of v4, v3, Ljava/lang/CharSequence;

    if-eqz v4, :cond_6

    :cond_5
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v3

    const-string/jumbo v4, "_ev"

    invoke-virtual {v3, v1, v4, v2, v0}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    :cond_7
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zzn(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_0

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzak;

    iget-object v2, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    iget-wide v4, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->avT:J

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/measurement/internal/zzak;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Setting user property"

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzak;->mName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3, v6}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->beginTransaction()V

    :try_start_0
    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzx;->zze(Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zzak;)Z

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "User property set"

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzak;->mName:Ljava/lang/String;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzak;->zzcyd:Ljava/lang/Object;

    invoke-virtual {v0, v2, v3, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto/16 :goto_0

    :cond_8
    :try_start_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Too many unique user properties are set. Ignoring user property."

    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzak;->mName:Ljava/lang/String;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzak;->zzcyd:Ljava/lang/Object;

    invoke-virtual {v0, v2, v3, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v0

    const/16 v1, 0x9

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzal;->zza(ILjava/lang/String;Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    throw v0
.end method

.method zzb(Lcom/google/android/gms/measurement/internal/zza;)V
    .locals 6

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zza;->zzbth()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zza;->zzazn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzao(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v3, "Fetching remote configuration"

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zza;->zzup()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zza;->zzup()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/gms/measurement/internal/zzv;->zzmo(Ljava/lang/String;)Lcom/google/android/gms/internal/zzwb$zzb;

    move-result-object v3

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v4

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zza;->zzup()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzv;->zzmp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v3, :cond_0

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    const-string/jumbo v3, "If-Modified-Since"

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxv()Lcom/google/android/gms/measurement/internal/zzr;

    move-result-object v3

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zza;->zzup()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/google/android/gms/measurement/internal/zzx$3;

    invoke-direct {v5, p0}, Lcom/google/android/gms/measurement/internal/zzx$3;-><init>(Lcom/google/android/gms/measurement/internal/zzx;)V

    invoke-virtual {v3, v4, v2, v0, v5}, Lcom/google/android/gms/measurement/internal/zzr;->zza(Ljava/lang/String;Ljava/net/URL;Ljava/util/Map;Lcom/google/android/gms/measurement/internal/zzr$zza;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Failed to parse config URL. Not fetching"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method zzb(Lcom/google/android/gms/measurement/internal/zzaa;)V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aux:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aux:I

    return-void
.end method

.method zzb(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V
    .locals 7
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Throwable;",
            "[B",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    const/16 v6, 0x130

    const/4 v1, 0x1

    const/16 v5, 0x194

    const/4 v2, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzib(Ljava/lang/String;)Ljava/lang/String;

    if-nez p4, :cond_0

    new-array p4, v0, [B

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zze;->beginTransaction()V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/google/android/gms/measurement/internal/zze;->zzlz(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;

    move-result-object v4

    const/16 v3, 0xc8

    if-eq p2, v3, :cond_1

    const/16 v3, 0xcc

    if-eq p2, v3, :cond_1

    if-ne p2, v6, :cond_2

    :cond_1
    if-nez p3, :cond_2

    move v3, v1

    :goto_0
    if-nez v4, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "App does not exist in onConfigFetched"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    :goto_2
    return-void

    :cond_2
    move v3, v0

    goto :goto_0

    :cond_3
    if-nez v3, :cond_4

    if-ne p2, v5, :cond_c

    :cond_4
    if-eqz p5, :cond_6

    :try_start_1
    const-string/jumbo v0, "Last-Modified"

    invoke-interface {p5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    :goto_3
    if-eqz v0, :cond_7

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_7

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_4
    if-eq p2, v5, :cond_5

    if-ne p2, v6, :cond_8

    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/measurement/internal/zzv;->zzmo(Ljava/lang/String;)Lcom/google/android/gms/internal/zzwb$zzb;

    move-result-object v0

    if-nez v0, :cond_9

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lcom/google/android/gms/measurement/internal/zzv;->zzb(Ljava/lang/String;[BLjava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    if-nez v0, :cond_9

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto :goto_2

    :cond_6
    move-object v0, v2

    goto :goto_3

    :cond_7
    move-object v0, v2

    goto :goto_4

    :cond_8
    :try_start_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v1

    invoke-virtual {v1, p1, p4, v0}, Lcom/google/android/gms/measurement/internal/zzv;->zzb(Ljava/lang/String;[BLjava/lang/String;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v0

    if-nez v0, :cond_9

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto :goto_2

    :cond_9
    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {v4, v0, v1}, Lcom/google/android/gms/measurement/internal/zza;->zzbb(J)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zza;)V

    if-ne p2, v5, :cond_a

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Config not found. Using empty config"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :goto_5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxv()Lcom/google/android/gms/measurement/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzr;->zzagk()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyf()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbye()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    throw v0

    :cond_a
    :try_start_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Successfully fetched config. Got network response. code, size"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    array-length v3, p4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_5

    :cond_b
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyg()V

    goto/16 :goto_1

    :cond_c
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v4, v2, v3}, Lcom/google/android/gms/measurement/internal/zza;->zzbc(J)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/google/android/gms/measurement/internal/zze;->zza(Lcom/google/android/gms/measurement/internal/zza;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Fetching config failed. code, error"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4, p3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvy()Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/google/android/gms/measurement/internal/zzv;->zzmq(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzt;->ata:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    const/16 v2, 0x1f7

    if-eq p2, v2, :cond_d

    const/16 v2, 0x1ad

    if-ne p2, v2, :cond_e

    :cond_d
    move v0, v1

    :cond_e
    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->atb:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    :cond_f
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyg()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_1
.end method

.method zzbm(J)Z
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzx;->zzh(Ljava/lang/String;J)Z

    move-result v0

    return v0
.end method

.method public zzbvp()Lcom/google/android/gms/measurement/internal/zzc;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auq:Lcom/google/android/gms/measurement/internal/zzc;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auq:Lcom/google/android/gms/measurement/internal/zzc;

    return-object v0
.end method

.method public zzbvq()Lcom/google/android/gms/measurement/internal/zzac;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aum:Lcom/google/android/gms/measurement/internal/zzac;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aum:Lcom/google/android/gms/measurement/internal/zzac;

    return-object v0
.end method

.method public zzbvr()Lcom/google/android/gms/measurement/internal/zzn;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aun:Lcom/google/android/gms/measurement/internal/zzn;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aun:Lcom/google/android/gms/measurement/internal/zzn;

    return-object v0
.end method

.method public zzbvs()Lcom/google/android/gms/measurement/internal/zzg;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aul:Lcom/google/android/gms/measurement/internal/zzg;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aul:Lcom/google/android/gms/measurement/internal/zzg;

    return-object v0
.end method

.method public zzbvt()Lcom/google/android/gms/measurement/internal/zzae;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auk:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auk:Lcom/google/android/gms/measurement/internal/zzae;

    return-object v0
.end method

.method public zzbvu()Lcom/google/android/gms/measurement/internal/zzad;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auj:Lcom/google/android/gms/measurement/internal/zzad;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auj:Lcom/google/android/gms/measurement/internal/zzad;

    return-object v0
.end method

.method public zzbvv()Lcom/google/android/gms/measurement/internal/zzo;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auh:Lcom/google/android/gms/measurement/internal/zzo;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auh:Lcom/google/android/gms/measurement/internal/zzo;

    return-object v0
.end method

.method public zzbvw()Lcom/google/android/gms/measurement/internal/zze;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aug:Lcom/google/android/gms/measurement/internal/zze;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aug:Lcom/google/android/gms/measurement/internal/zze;

    return-object v0
.end method

.method public zzbvx()Lcom/google/android/gms/measurement/internal/zzal;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auf:Lcom/google/android/gms/measurement/internal/zzal;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzz;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auf:Lcom/google/android/gms/measurement/internal/zzal;

    return-object v0
.end method

.method public zzbvy()Lcom/google/android/gms/measurement/internal/zzv;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auc:Lcom/google/android/gms/measurement/internal/zzv;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auc:Lcom/google/android/gms/measurement/internal/zzv;

    return-object v0
.end method

.method public zzbvz()Lcom/google/android/gms/measurement/internal/zzag;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aub:Lcom/google/android/gms/measurement/internal/zzag;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aub:Lcom/google/android/gms/measurement/internal/zzag;

    return-object v0
.end method

.method public zzbwa()Lcom/google/android/gms/measurement/internal/zzw;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aua:Lcom/google/android/gms/measurement/internal/zzw;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aua:Lcom/google/android/gms/measurement/internal/zzw;

    return-object v0
.end method

.method public zzbwb()Lcom/google/android/gms/measurement/internal/zzq;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atZ:Lcom/google/android/gms/measurement/internal/zzq;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atZ:Lcom/google/android/gms/measurement/internal/zzq;

    return-object v0
.end method

.method public zzbwc()Lcom/google/android/gms/measurement/internal/zzt;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atY:Lcom/google/android/gms/measurement/internal/zzt;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzz;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atY:Lcom/google/android/gms/measurement/internal/zzt;

    return-object v0
.end method

.method public zzbwd()Lcom/google/android/gms/measurement/internal/zzd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atX:Lcom/google/android/gms/measurement/internal/zzd;

    return-object v0
.end method

.method protected zzbxq()Z
    .locals 6
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzx;->aus:Ljava/lang/Boolean;

    if-eqz v1, :cond_0

    iget-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzx;->aut:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzx;->aus:Ljava/lang/Boolean;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzx;->aus:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/gms/measurement/internal/zzx;->aut:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    cmp-long v1, v2, v4

    if-lez v1, :cond_2

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzx;->aut:J

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v1

    const-string/jumbo v2, "android.permission.INTERNET"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zzez(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v1

    const-string/jumbo v2, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzal;->zzez(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/google/android/gms/measurement/internal/zzu;->zzh(Landroid/content/Context;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/google/android/gms/measurement/internal/zzaf;->zzi(Landroid/content/Context;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aus:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aus:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzn;->zzbth()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzal;->zznb(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aus:Ljava/lang/Boolean;

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aus:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public zzbxr()Lcom/google/android/gms/measurement/internal/zzq;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atZ:Lcom/google/android/gms/measurement/internal/zzq;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atZ:Lcom/google/android/gms/measurement/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->atZ:Lcom/google/android/gms/measurement/internal/zzq;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method zzbxs()Lcom/google/android/gms/measurement/internal/zzw;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aua:Lcom/google/android/gms/measurement/internal/zzw;

    return-object v0
.end method

.method public zzbxt()Lcom/google/android/gms/measurement/AppMeasurement;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aud:Lcom/google/android/gms/measurement/AppMeasurement;

    return-object v0
.end method

.method public zzbxu()Lcom/google/firebase/analytics/FirebaseAnalytics;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aue:Lcom/google/firebase/analytics/FirebaseAnalytics;

    return-object v0
.end method

.method public zzbxv()Lcom/google/android/gms/measurement/internal/zzr;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aui:Lcom/google/android/gms/measurement/internal/zzr;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aui:Lcom/google/android/gms/measurement/internal/zzr;

    return-object v0
.end method

.method public zzbxw()Lcom/google/android/gms/measurement/internal/zzs;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auo:Lcom/google/android/gms/measurement/internal/zzs;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Network broadcast receiver not created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auo:Lcom/google/android/gms/measurement/internal/zzs;

    return-object v0
.end method

.method public zzbxx()Lcom/google/android/gms/measurement/internal/zzai;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aup:Lcom/google/android/gms/measurement/internal/zzai;

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/zzaa;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aup:Lcom/google/android/gms/measurement/internal/zzai;

    return-object v0
.end method

.method zzbxy()Ljava/nio/channels/FileChannel;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auv:Ljava/nio/channels/FileChannel;

    return-object v0
.end method

.method zzbxz()V
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyk()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbya()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxy()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Ljava/nio/channels/FileChannel;)I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzn;->zzbwx()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/measurement/internal/zzx;->zzv(II)Z

    :cond_0
    return-void
.end method

.method zzbya()Z
    .locals 3
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aug:Lcom/google/android/gms/measurement/internal/zze;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->zzade()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_0
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string/jumbo v1, "rw"

    invoke-direct {v0, v2, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auv:Ljava/nio/channels/FileChannel;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auv:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->tryLock()Ljava/nio/channels/FileLock;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auu:Ljava/nio/channels/FileLock;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auu:Ljava/nio/channels/FileLock;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Storage concurrent access okay"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Storage concurrent data access panic"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Failed to acquire storage lock"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Failed to access storage lock file"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1
.end method

.method zzbyb()J
    .locals 6

    const-wide/16 v4, 0x3c

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzt;->zzbxi()J

    move-result-wide v2

    add-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    div-long/2addr v0, v4

    div-long/2addr v0, v4

    const-wide/16 v2, 0x18

    div-long/2addr v0, v2

    return-wide v0
.end method

.method zzbyc()V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Unexpected call on client side"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method protected zzbyd()Z
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auw:Ljava/util/List;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzbye()V
    .locals 12
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const-wide/16 v10, -0x1

    const/4 v5, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt;->zzbxl()Ljava/lang/Boolean;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Upload data called on the client side before use of service was decided"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Upload called in the client side when service should be used"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyd()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Uploading requested multiple times"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxv()Lcom/google/android/gms/measurement/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzr;->zzagk()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxa()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Network not connected, ignoring upload request"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyg()V

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvd()J

    move-result-wide v0

    sub-long v0, v8, v0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/measurement/internal/zzx;->zzbm(J)Z

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->asZ:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->get()J

    move-result-wide v0

    const-wide/16 v6, 0x0

    cmp-long v2, v0, v6

    if-eqz v2, :cond_5

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v4, "Uploading events. Elapsed time since last upload attempt (ms)"

    sub-long v0, v8, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v4, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->zzbwe()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    iget-wide v6, p0, Lcom/google/android/gms/measurement/internal/zzx;->auz:J

    cmp-long v0, v6, v10

    if-nez v0, :cond_6

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->zzbwm()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/google/android/gms/measurement/internal/zzx;->auz:J

    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzlv(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzlw(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v4

    invoke-virtual {v4, v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zze;->zzn(Ljava/lang/String;II)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v6, v0, Lcom/google/android/gms/internal/zzwc$zze;->axi:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_7

    iget-object v0, v0, Lcom/google/android/gms/internal/zzwc$zze;->axi:Ljava/lang/String;

    move-object v6, v0

    :goto_1
    if-eqz v6, :cond_e

    move v2, v3

    :goto_2
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    if-ge v2, v0, :cond_e

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/gms/internal/zzwc$zze;

    iget-object v7, v0, Lcom/google/android/gms/internal/zzwc$zze;->axi:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_9

    :cond_8
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_2

    :cond_9
    iget-object v0, v0, Lcom/google/android/gms/internal/zzwc$zze;->axi:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    invoke-interface {v4, v3, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    move-object v2, v0

    :goto_3
    new-instance v6, Lcom/google/android/gms/internal/zzwc$zzd;

    invoke-direct {v6}, Lcom/google/android/gms/internal/zzwc$zzd;-><init>()V

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzwc$zze;

    iput-object v0, v6, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(I)V

    :goto_4
    iget-object v0, v6, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    array-length v0, v0

    if-ge v3, v0, :cond_a

    iget-object v7, v6, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/gms/internal/zzwc$zze;

    aput-object v0, v7, v3

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, v6, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    aget-object v0, v0, v3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzd;->zzbto()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/gms/internal/zzwc$zze;->axh:Ljava/lang/Long;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    aget-object v0, v0, v3

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/gms/internal/zzwc$zze;->awX:Ljava/lang/Long;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    aget-object v0, v0, v3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/gms/internal/zzwc$zze;->axn:Ljava/lang/Boolean;

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_a
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbi(I)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-static {v6}, Lcom/google/android/gms/measurement/internal/zzal;->zzb(Lcom/google/android/gms/internal/zzwc$zzd;)Ljava/lang/String;

    move-result-object v0

    :goto_5
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvx()Lcom/google/android/gms/measurement/internal/zzal;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/google/android/gms/measurement/internal/zzal;->zza(Lcom/google/android/gms/internal/zzwc$zzd;)[B

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvc()Ljava/lang/String;

    move-result-object v7

    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Lcom/google/android/gms/measurement/internal/zzx;->zzag(Ljava/util/List;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/gms/measurement/internal/zzt;->ata:Lcom/google/android/gms/measurement/internal/zzt$zzb;

    invoke-virtual {v4, v8, v9}, Lcom/google/android/gms/measurement/internal/zzt$zzb;->set(J)V

    const-string/jumbo v4, "?"

    iget-object v5, v6, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    array-length v5, v5

    if-lez v5, :cond_b

    iget-object v4, v6, Lcom/google/android/gms/internal/zzwc$zzd;->awS:[Lcom/google/android/gms/internal/zzwc$zze;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    iget-object v4, v4, Lcom/google/android/gms/internal/zzwc$zze;->zzcs:Ljava/lang/String;

    :cond_b
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v5

    const-string/jumbo v6, "Uploading data. app, uncompressed size, data"

    array-length v8, v3

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v6, v4, v8, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxv()Lcom/google/android/gms/measurement/internal/zzr;

    move-result-object v0

    const/4 v4, 0x0

    new-instance v5, Lcom/google/android/gms/measurement/internal/zzx$2;

    invoke-direct {v5, p0}, Lcom/google/android/gms/measurement/internal/zzx$2;-><init>(Lcom/google/android/gms/measurement/internal/zzx;)V

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/zzr;->zza(Ljava/lang/String;Ljava/net/URL;[BLjava/util/Map;Lcom/google/android/gms/measurement/internal/zzr$zza;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Failed to parse upload URL. Not uploading"

    invoke-virtual {v0, v1, v7}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    :cond_c
    iput-wide v10, p0, Lcom/google/android/gms/measurement/internal/zzx;->auz:J

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzd;->zzbvd()J

    move-result-wide v2

    sub-long v2, v8, v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zze;->zzbk(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zze;->zzlz(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzx;->zzb(Lcom/google/android/gms/measurement/internal/zza;)V

    goto/16 :goto_0

    :cond_d
    move-object v0, v5

    goto/16 :goto_5

    :cond_e
    move-object v2, v4

    goto/16 :goto_3

    :cond_f
    move-object v6, v5

    goto/16 :goto_1
.end method

.method zzbyi()V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auy:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->auy:I

    return-void
.end method

.method zzbyj()V
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aur:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxc()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "This instance being marked as an uploader"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxz()V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aur:Z

    return-void
.end method

.method zzbyk()Z
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzx;->aur:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method zzc(Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzib(Ljava/lang/String;)Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzx;->zze(Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    return-void
.end method

.method zzc(Lcom/google/android/gms/measurement/internal/AppMetadata;J)V
    .locals 6
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v0, "_et"

    const-wide/16 v4, 0x1

    invoke-virtual {v3, v0, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/EventParcel;

    const-string/jumbo v1, "_e"

    new-instance v2, Lcom/google/android/gms/measurement/internal/EventParams;

    invoke-direct {v2, v3}, Lcom/google/android/gms/measurement/internal/EventParams;-><init>(Landroid/os/Bundle;)V

    const-string/jumbo v3, "auto"

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/EventParcel;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/EventParams;Ljava/lang/String;J)V

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/measurement/internal/zzx;->zzb(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    return-void
.end method

.method zzc(Lcom/google/android/gms/measurement/internal/UserAttributeParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    .locals 3
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    iget-object v0, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->aqZ:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-boolean v0, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->are:Z

    if-nez v0, :cond_1

    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzx;->zze(Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Removing user property"

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->beginTransaction()V

    :try_start_0
    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzx;->zze(Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zze;->zzaq(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxd()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "User property removed"

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    throw v0
.end method

.method public zzd(Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    .locals 8
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const-wide/32 v6, 0x36ee80

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzacj()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzaa;->zzib(Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->aqZ:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-boolean v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->are:Z

    if-nez v0, :cond_1

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzx;->zze(Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzabz()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->beginTransaction()V

    :try_start_0
    invoke-virtual {p0, p1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/AppMetadata;J)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzx;->zze(Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->packageName:Ljava/lang/String;

    const-string/jumbo v4, "_f"

    invoke-virtual {v0, v1, v4}, Lcom/google/android/gms/measurement/internal/zze;->zzap(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzi;

    move-result-object v0

    if-nez v0, :cond_3

    const-wide/16 v0, 0x1

    const-wide/32 v4, 0x36ee80

    div-long v4, v2, v4

    add-long/2addr v0, v4

    mul-long v4, v0, v6

    new-instance v0, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;

    const-string/jumbo v1, "_fot"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const-string/jumbo v5, "auto"

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/UserAttributeParcel;-><init>(Ljava/lang/String;JLjava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/measurement/internal/zzx;->zzb(Lcom/google/android/gms/measurement/internal/UserAttributeParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    invoke-virtual {p0, p1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzx;->zzb(Lcom/google/android/gms/measurement/internal/AppMetadata;J)V

    invoke-virtual {p0, p1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzx;->zzc(Lcom/google/android/gms/measurement/internal/AppMetadata;J)V

    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    goto :goto_0

    :cond_3
    :try_start_1
    iget-boolean v0, p1, Lcom/google/android/gms/measurement/internal/AppMetadata;->arf:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzx;->zzd(Lcom/google/android/gms/measurement/internal/AppMetadata;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbvw()Lcom/google/android/gms/measurement/internal/zze;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zze;->endTransaction()V

    throw v0
.end method

.method zzd(Lcom/google/android/gms/measurement/internal/AppMetadata;J)V
    .locals 6
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    new-instance v0, Lcom/google/android/gms/measurement/internal/EventParcel;

    const-string/jumbo v1, "_cd"

    new-instance v2, Lcom/google/android/gms/measurement/internal/EventParams;

    invoke-direct {v2, v3}, Lcom/google/android/gms/measurement/internal/EventParams;-><init>(Landroid/os/Bundle;)V

    const-string/jumbo v3, "auto"

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/EventParcel;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/EventParams;Ljava/lang/String;J)V

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/measurement/internal/zzx;->zzb(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    return-void
.end method

.method zzv(II)Z
    .locals 5
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzzx()V

    if-le p1, p2, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Panic: can\'t downgrade version. Previous, current version"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return v0

    :cond_0
    if-ge p1, p2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbxy()Ljava/nio/channels/FileChannel;

    move-result-object v1

    invoke-virtual {p0, p2, v1}, Lcom/google/android/gms/measurement/internal/zzx;->zza(ILjava/nio/channels/FileChannel;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Storage version upgraded. Previous, current version"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Storage version upgrade failed. Previous, current version"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zze(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public zzzx()V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwa()Lcom/google/android/gms/measurement/internal/zzw;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzw;->zzzx()V

    return-void
.end method
