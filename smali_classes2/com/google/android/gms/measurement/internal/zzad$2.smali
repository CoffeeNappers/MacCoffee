.class Lcom/google/android/gms/measurement/internal/zzad$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzad;->onActivityPaused(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic avp:Lcom/google/android/gms/measurement/internal/zzad;

.field final synthetic avq:Lcom/google/android/gms/measurement/internal/zzad$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzad;Lcom/google/android/gms/measurement/internal/zzad$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzad$2;->avp:Lcom/google/android/gms/measurement/internal/zzad;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzad$2;->avq:Lcom/google/android/gms/measurement/internal/zzad$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad$2;->avp:Lcom/google/android/gms/measurement/internal/zzad;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzad$2;->avq:Lcom/google/android/gms/measurement/internal/zzad$zza;

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzad;->zza(Lcom/google/android/gms/measurement/internal/zzad;Lcom/google/android/gms/measurement/internal/zzad$zza;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad$2;->avp:Lcom/google/android/gms/measurement/internal/zzad;

    iput-object v2, v0, Lcom/google/android/gms/measurement/internal/zzad;->avd:Lcom/google/android/gms/measurement/internal/zzad$zza;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzad$2;->avp:Lcom/google/android/gms/measurement/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzad;->zzbvt()Lcom/google/android/gms/measurement/internal/zzae;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzae;->zza(Lcom/google/android/gms/measurement/AppMeasurement$zzf;)V

    return-void
.end method
