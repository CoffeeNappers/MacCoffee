.class Lcom/google/android/gms/measurement/internal/zzae$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzae;->zzc(Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic alm:Ljava/lang/String;

.field final synthetic auI:Lcom/google/android/gms/measurement/internal/EventParcel;

.field final synthetic avA:Z

.field final synthetic avB:Z

.field final synthetic avz:Lcom/google/android/gms/measurement/internal/zzae;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzae;ZZLcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    iput-boolean p2, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avA:Z

    iput-boolean p3, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avB:Z

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->auI:Lcom/google/android/gms/measurement/internal/EventParcel;

    iput-object p5, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->alm:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzc(Lcom/google/android/gms/measurement/internal/zzae;)Lcom/google/android/gms/measurement/internal/zzm;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Discarding data. Failed to send event to service"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avA:Z

    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avB:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v2, v1, v0}, Lcom/google/android/gms/measurement/internal/zzae;->zza(Lcom/google/android/gms/measurement/internal/zzm;Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;)V

    :goto_2
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzd(Lcom/google/android/gms/measurement/internal/zzae;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->auI:Lcom/google/android/gms/measurement/internal/EventParcel;

    goto :goto_1

    :cond_2
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->alm:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->auI:Lcom/google/android/gms/measurement/internal/EventParcel;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzae;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxf()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/measurement/internal/zzn;->zzmi(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/AppMetadata;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/google/android/gms/measurement/internal/zzm;->zza(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v1

    const-string/jumbo v2, "Failed to send event to the service"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->auI:Lcom/google/android/gms/measurement/internal/EventParcel;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->alm:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzae$4;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxf()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzm;->zza(Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method
