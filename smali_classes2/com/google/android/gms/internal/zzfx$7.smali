.class Lcom/google/android/gms/internal/zzfx$7;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfx;->zza(Lcom/google/android/gms/internal/zzfy;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbrr:Lcom/google/android/gms/internal/zzfx;

.field final synthetic zzbsd:Lcom/google/android/gms/internal/zzfx$zza;

.field final synthetic zzbse:Lcom/google/android/gms/internal/zzfy;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfx;Lcom/google/android/gms/internal/zzfx$zza;Lcom/google/android/gms/internal/zzfy;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfx$7;->zzbrr:Lcom/google/android/gms/internal/zzfx;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfx$7;->zzbsd:Lcom/google/android/gms/internal/zzfx$zza;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzfx$7;->zzbse:Lcom/google/android/gms/internal/zzfy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfx$7;->zzbsd:Lcom/google/android/gms/internal/zzfx$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfx$7;->zzbse:Lcom/google/android/gms/internal/zzfy;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzfx$zza;->zzb(Lcom/google/android/gms/internal/zzfy;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Could not propagate interstitial ad event."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
