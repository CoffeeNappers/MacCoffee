.class Lcom/google/android/gms/internal/zzho$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzho;->showInterstitial()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaoi:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

.field final synthetic zzbxw:Lcom/google/android/gms/internal/zzho;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzho;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzho$3;->zzbxw:Lcom/google/android/gms/internal/zzho;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzho$3;->zzaoi:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgk()Lcom/google/android/gms/ads/internal/overlay/zze;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzho$3;->zzbxw:Lcom/google/android/gms/internal/zzho;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzho;->zzb(Lcom/google/android/gms/internal/zzho;)Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzho$3;->zzaoi:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/overlay/zze;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    return-void
.end method
