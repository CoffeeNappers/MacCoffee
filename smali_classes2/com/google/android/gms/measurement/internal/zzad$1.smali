.class Lcom/google/android/gms/measurement/internal/zzad$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzad;->zza(Landroid/app/Activity;Lcom/google/android/gms/measurement/internal/zzad$zza;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic avn:Z

.field final synthetic avo:Lcom/google/android/gms/measurement/internal/zzad$zza;

.field final synthetic avp:Lcom/google/android/gms/measurement/internal/zzad;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzad;ZLcom/google/android/gms/measurement/internal/zzad$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avp:Lcom/google/android/gms/measurement/internal/zzad;

    iput-boolean p2, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avn:Z

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avo:Lcom/google/android/gms/measurement/internal/zzad$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avn:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avp:Lcom/google/android/gms/measurement/internal/zzad;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzad;->avd:Lcom/google/android/gms/measurement/internal/zzad$zza;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avp:Lcom/google/android/gms/measurement/internal/zzad;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avp:Lcom/google/android/gms/measurement/internal/zzad;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzad;->avd:Lcom/google/android/gms/measurement/internal/zzad$zza;

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzad;->zza(Lcom/google/android/gms/measurement/internal/zzad;Lcom/google/android/gms/measurement/internal/zzad$zza;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avp:Lcom/google/android/gms/measurement/internal/zzad;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avo:Lcom/google/android/gms/measurement/internal/zzad$zza;

    iput-object v1, v0, Lcom/google/android/gms/measurement/internal/zzad;->avd:Lcom/google/android/gms/measurement/internal/zzad$zza;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avp:Lcom/google/android/gms/measurement/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbvt()Lcom/google/android/gms/measurement/internal/zzae;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad$1;->avo:Lcom/google/android/gms/measurement/internal/zzad$zza;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzae;->zza(Lcom/google/android/gms/measurement/AppMeasurement$zzf;)V

    return-void
.end method
