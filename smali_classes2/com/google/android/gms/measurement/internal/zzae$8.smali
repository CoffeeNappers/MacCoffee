.class Lcom/google/android/gms/measurement/internal/zzae$8;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzae;->zza(Lcom/google/android/gms/measurement/AppMeasurement$zzf;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic avD:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

.field final synthetic avz:Lcom/google/android/gms/measurement/internal/zzae;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzae;Lcom/google/android/gms/measurement/AppMeasurement$zzf;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avD:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzc(Lcom/google/android/gms/measurement/internal/zzae;)Lcom/google/android/gms/measurement/internal/zzm;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Failed to send current screen to service"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avD:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    if-nez v0, :cond_1

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-interface/range {v1 .. v6}, Lcom/google/android/gms/measurement/internal/zzm;->zza(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzd(Lcom/google/android/gms/measurement/internal/zzae;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Failed to send current screen to the service"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avD:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    iget-wide v2, v0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqB:J

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avD:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    iget-object v4, v0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqz:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avD:Lcom/google/android/gms/measurement/AppMeasurement$zzf;

    iget-object v5, v0, Lcom/google/android/gms/measurement/AppMeasurement$zzf;->aqA:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$8;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-interface/range {v1 .. v6}, Lcom/google/android/gms/measurement/internal/zzm;->zza(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
