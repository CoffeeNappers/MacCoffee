.class final Lcom/google/android/gms/ads/internal/zzn$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzfe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/zzn;->zza(Lcom/google/android/gms/internal/zzhd;Lcom/google/android/gms/internal/zzhe;Lcom/google/android/gms/ads/internal/zzf$zza;)Lcom/google/android/gms/internal/zzfe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaou:Lcom/google/android/gms/internal/zzhd;

.field final synthetic zzaov:Lcom/google/android/gms/ads/internal/zzf$zza;

.field final synthetic zzaow:Lcom/google/android/gms/internal/zzhe;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzhd;Lcom/google/android/gms/ads/internal/zzf$zza;Lcom/google/android/gms/internal/zzhe;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaou:Lcom/google/android/gms/internal/zzhd;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaov:Lcom/google/android/gms/ads/internal/zzf$zza;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaow:Lcom/google/android/gms/internal/zzhe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzmd;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzmd;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzmd;->getView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaou:Lcom/google/android/gms/internal/zzhd;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaou:Lcom/google/android/gms/internal/zzhd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzhd;->getOverrideClickHandling()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaou:Lcom/google/android/gms/internal/zzhd;

    invoke-static {v0}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzhd;->zzk(Lcom/google/android/gms/dynamic/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaov:Lcom/google/android/gms/ads/internal/zzf$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzf$zza;->onClick()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Unable to call handleClick on mapper"

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    :try_start_1
    invoke-static {p1}, Lcom/google/android/gms/ads/internal/zzn;->zzb(Lcom/google/android/gms/internal/zzmd;)V

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaow:Lcom/google/android/gms/internal/zzhe;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaow:Lcom/google/android/gms/internal/zzhe;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzhe;->getOverrideClickHandling()Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaow:Lcom/google/android/gms/internal/zzhe;

    invoke-static {v0}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzhe;->zzk(Lcom/google/android/gms/dynamic/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzn$5;->zzaov:Lcom/google/android/gms/ads/internal/zzf$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzf$zza;->onClick()V

    goto :goto_0

    :cond_4
    invoke-static {p1}, Lcom/google/android/gms/ads/internal/zzn;->zzb(Lcom/google/android/gms/internal/zzmd;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
