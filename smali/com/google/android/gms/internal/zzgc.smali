.class public Lcom/google/android/gms/internal/zzgc;
.super Lcom/google/android/gms/ads/internal/client/zzu$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private final zzant:Ljava/lang/String;

.field private final zzbsn:Lcom/google/android/gms/internal/zzfw;

.field private zzbss:Lcom/google/android/gms/ads/internal/zzl;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final zzbsz:Lcom/google/android/gms/internal/zzfy;

.field private zzbta:Lcom/google/android/gms/internal/zzik;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private zzbtb:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzgz;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzfw;

    invoke-direct {v0, p1, p3, p4, p5}, Lcom/google/android/gms/internal/zzfw;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzgz;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V

    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/zzgc;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzfw;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzfw;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/client/zzu$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgc;->zzant:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgc;->zzbsn:Lcom/google/android/gms/internal/zzfw;

    new-instance v0, Lcom/google/android/gms/internal/zzfy;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzfy;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzhb()Lcom/google/android/gms/internal/zzfz;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/zzfz;->zza(Lcom/google/android/gms/internal/zzfw;)V

    return-void
.end method

.method private zznu()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbta:Lcom/google/android/gms/internal/zzik;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbta:Lcom/google/android/gms/internal/zzik;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgc;->zzbtb:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/internal/zzik;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method static zzq(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z
    .locals 2

    invoke-static {p0}, Lcom/google/android/gms/internal/zzfz;->zzk(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "gw"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static zzr(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z
    .locals 2

    invoke-static {p0}, Lcom/google/android/gms/internal/zzfz;->zzk(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "_ad"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method abort()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsn:Lcom/google/android/gms/internal/zzfw;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzant:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfw;->zzbj(Ljava/lang/String;)Lcom/google/android/gms/ads/internal/zzl;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfy;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgc;->zznu()V

    goto :goto_0
.end method

.method public destroy()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->destroy()V

    :cond_0
    return-void
.end method

.method public getMediationAdapterClassName()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->getMediationAdapterClassName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLoading()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isReady()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public pause()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->pause()V

    :cond_0
    return-void
.end method

.method public resume()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->resume()V

    :cond_0
    return-void
.end method

.method public setManualImpressionsEnabled(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgc;->abort()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzl;->setManualImpressionsEnabled(Z)V

    :cond_0
    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public showInterstitial()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->showInterstitial()V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "Interstitial ad must be loaded before showInterstitial()."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public stopLoading()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->stopLoading()V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/VideoOptionsParcel;)V
    .locals 2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "getVideoController not implemented for interstitials"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzp;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfy;->zzbsi:Lcom/google/android/gms/ads/internal/client/zzp;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfy;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzq;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfy;->zzanl:Lcom/google/android/gms/ads/internal/client/zzq;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfy;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzw;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfy;->zzbsf:Lcom/google/android/gms/ads/internal/client/zzw;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfy;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzy;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgc;->abort()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/ads/internal/client/zzy;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/reward/client/zzd;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfy;->zzbsj:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfy;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzed;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfy;->zzbsh:Lcom/google/android/gms/internal/zzed;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfy;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzig;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfy;->zzbsg:Lcom/google/android/gms/internal/zzig;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfy;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzik;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgc;->zzbta:Lcom/google/android/gms/internal/zzik;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgc;->zzbtb:Ljava/lang/String;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgc;->zznu()V

    return-void
.end method

.method public zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbge:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzj(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V

    :cond_0
    invoke-static {p1}, Lcom/google/android/gms/internal/zzgc;->zzq(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgc;->abort()V

    :cond_1
    invoke-static {p1}, Lcom/google/android/gms/internal/zzfz;->zzm(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgc;->abort()V

    :cond_2
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzays:Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgc;->abort()V

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzl;->zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v0

    :goto_0
    return v0

    :cond_4
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzhb()Lcom/google/android/gms/internal/zzfz;

    move-result-object v0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzgc;->zzr(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzant:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzfz;->zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;)V

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzant:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzfz;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;)Lcom/google/android/gms/internal/zzgb$zza;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-boolean v1, v0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsw:Z

    if-nez v1, :cond_6

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgb$zza;->zznt()V

    :cond_6
    iget-object v1, v0, Lcom/google/android/gms/internal/zzgb$zza;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    iget-object v1, v0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsu:Lcom/google/android/gms/internal/zzfx;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzfx;->zza(Lcom/google/android/gms/internal/zzfy;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbsz:Lcom/google/android/gms/internal/zzfy;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzfy;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgc;->zznu()V

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsx:Z

    goto :goto_0

    :cond_7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgc;->abort()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzl;->zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v0

    goto :goto_0
.end method

.method public zzef()Lcom/google/android/gms/dynamic/zzd;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->zzef()Lcom/google/android/gms/dynamic/zzd;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzeg()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->zzeg()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzei()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->zzei()V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "Interstitial ad must be loaded before pingManualTrackingUrl()."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public zzej()Lcom/google/android/gms/ads/internal/client/zzab;
    .locals 2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "getVideoController not implemented for interstitials"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
