.class Lcom/google/android/gms/internal/zzjl$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjl;->zza(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/ads/internal/request/zzl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzcnp:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

.field final synthetic zzcnw:Lcom/google/android/gms/internal/zzjl;

.field final synthetic zzcnx:Lcom/google/android/gms/ads/internal/request/zzl;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjl;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/ads/internal/request/zzl;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjl$5;->zzcnw:Lcom/google/android/gms/internal/zzjl;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjl$5;->zzcnp:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzjl$5;->zzcnx:Lcom/google/android/gms/ads/internal/request/zzl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const/4 v1, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzjl$5;->zzcnw:Lcom/google/android/gms/internal/zzjl;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzjl$5;->zzcnp:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzjl;->zzd(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzjl$5;->zzcnx:Lcom/google/android/gms/ads/internal/request/zzl;

    invoke-interface {v1, v0}, Lcom/google/android/gms/ads/internal/request/zzl;->zzb(Lcom/google/android/gms/ads/internal/request/AdResponseParcel;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    return-void

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgq()Lcom/google/android/gms/internal/zzkr;

    move-result-object v2

    const-string/jumbo v3, "AdRequestServiceImpl.loadAdAsync"

    invoke-virtual {v2, v0, v3}, Lcom/google/android/gms/internal/zzkr;->zza(Ljava/lang/Throwable;Ljava/lang/String;)V

    const-string/jumbo v2, "Could not fetch ad response due to an Exception."

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception v0

    const-string/jumbo v1, "Fail to forward ad response."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
