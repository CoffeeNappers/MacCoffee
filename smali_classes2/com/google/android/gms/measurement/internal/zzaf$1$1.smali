.class Lcom/google/android/gms/measurement/internal/zzaf$1$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzaf$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic avL:Lcom/google/android/gms/measurement/internal/zzaf$1;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzaf$1;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzaf$1$1;->avL:Lcom/google/android/gms/measurement/internal/zzaf$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzaf$1$1;->avL:Lcom/google/android/gms/measurement/internal/zzaf$1;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzaf$1;->avK:Lcom/google/android/gms/measurement/internal/zzaf;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzaf;->zza(Lcom/google/android/gms/measurement/internal/zzaf;)Lcom/google/android/gms/measurement/internal/zzaf$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzaf$1$1;->avL:Lcom/google/android/gms/measurement/internal/zzaf$1;

    iget v1, v1, Lcom/google/android/gms/measurement/internal/zzaf$1;->aB:I

    invoke-interface {v0, v1}, Lcom/google/android/gms/measurement/internal/zzaf$zza;->callServiceStopSelfResult(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzaf$1$1;->avL:Lcom/google/android/gms/measurement/internal/zzaf$1;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzaf$1;->atw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzaf$1$1;->avL:Lcom/google/android/gms/measurement/internal/zzaf$1;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzaf$1;->atz:Lcom/google/android/gms/measurement/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Local AppMeasurementService processed last upload request"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
