.class Lcom/google/android/gms/measurement/internal/zzae$zza$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzae$zza;->onConnectionSuspended(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic avH:Lcom/google/android/gms/measurement/internal/zzae$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzae$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$4;->avH:Lcom/google/android/gms/measurement/internal/zzae$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$4;->avH:Lcom/google/android/gms/measurement/internal/zzae$zza;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzae$zza;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    new-instance v1, Landroid/content/ComponentName;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$4;->avH:Lcom/google/android/gms/measurement/internal/zzae$zza;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzae$zza;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzae;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$4;->avH:Lcom/google/android/gms/measurement/internal/zzae$zza;

    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzae$zza;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzd;->zzayi()Z

    const-string/jumbo v3, "com.google.android.gms.measurement.AppMeasurementService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzae;->zza(Lcom/google/android/gms/measurement/internal/zzae;Landroid/content/ComponentName;)V

    return-void
.end method
