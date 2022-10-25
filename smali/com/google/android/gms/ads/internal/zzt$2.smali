.class Lcom/google/android/gms/ads/internal/zzt$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/zzt;->zzfz()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzapv:Lcom/google/android/gms/ads/internal/zzt;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/zzt;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzt$2;->zzapv:Lcom/google/android/gms/ads/internal/zzt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzt$2;->zzapv:Lcom/google/android/gms/ads/internal/zzt;

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/zzt;->zzb(Lcom/google/android/gms/ads/internal/zzt;)Lcom/google/android/gms/internal/zzcf;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzt$2;->zzapv:Lcom/google/android/gms/ads/internal/zzt;

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/zzt;->zzb(Lcom/google/android/gms/ads/internal/zzt;)Lcom/google/android/gms/internal/zzcf;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/zzcf;->zza(Landroid/view/MotionEvent;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    const/4 v0, 0x0

    return v0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Unable to process ad data"

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
