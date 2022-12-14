.class public abstract Lcom/google/android/gms/ads/internal/request/zzd;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/ads/internal/request/zzc$zza;
.implements Lcom/google/android/gms/internal/zzld;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/internal/request/zzd$zzb;,
        Lcom/google/android/gms/ads/internal/request/zzd$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/ads/internal/request/zzc$zza;",
        "Lcom/google/android/gms/internal/zzld",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzako:Ljava/lang/Object;

.field private final zzcjm:Lcom/google/android/gms/internal/zzlw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzlw",
            "<",
            "Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;",
            ">;"
        }
    .end annotation
.end field

.field private final zzcjn:Lcom/google/android/gms/ads/internal/request/zzc$zza;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzlw;Lcom/google/android/gms/ads/internal/request/zzc$zza;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzlw",
            "<",
            "Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;",
            ">;",
            "Lcom/google/android/gms/ads/internal/request/zzc$zza;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/zzd;->zzako:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/request/zzd;->zzcjm:Lcom/google/android/gms/internal/zzlw;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/request/zzd;->zzcjn:Lcom/google/android/gms/ads/internal/request/zzc$zza;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/request/zzd;->zztb()V

    return-void
.end method

.method zza(Lcom/google/android/gms/ads/internal/request/zzk;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Z
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lcom/google/android/gms/ads/internal/request/zzg;

    invoke-direct {v1, p0}, Lcom/google/android/gms/ads/internal/request/zzg;-><init>(Lcom/google/android/gms/ads/internal/request/zzc$zza;)V

    invoke-interface {p1, p2, v1}, Lcom/google/android/gms/ads/internal/request/zzk;->zza(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/ads/internal/request/zzl;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    const/4 v0, 0x1

    :goto_0
    return v0

    :catch_0
    move-exception v1

    const-string/jumbo v2, "Could not fetch ad response from ad request service."

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgq()Lcom/google/android/gms/internal/zzkr;

    move-result-object v2

    const-string/jumbo v3, "AdRequestClientTask.getAdResponseFromService"

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/internal/zzkr;->zza(Ljava/lang/Throwable;Ljava/lang/String;)V

    :goto_1
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/request/zzd;->zzcjn:Lcom/google/android/gms/ads/internal/request/zzc$zza;

    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    invoke-direct {v2, v0}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    invoke-interface {v1, v2}, Lcom/google/android/gms/ads/internal/request/zzc$zza;->zzb(Lcom/google/android/gms/ads/internal/request/AdResponseParcel;)V

    goto :goto_0

    :catch_1
    move-exception v1

    const-string/jumbo v2, "Could not fetch ad response from ad request service due to an Exception."

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgq()Lcom/google/android/gms/internal/zzkr;

    move-result-object v2

    const-string/jumbo v3, "AdRequestClientTask.getAdResponseFromService"

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/internal/zzkr;->zza(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_1

    :catch_2
    move-exception v1

    const-string/jumbo v2, "Could not fetch ad response from ad request service due to an Exception."

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgq()Lcom/google/android/gms/internal/zzkr;

    move-result-object v2

    const-string/jumbo v3, "AdRequestClientTask.getAdResponseFromService"

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/internal/zzkr;->zza(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_1

    :catch_3
    move-exception v1

    const-string/jumbo v2, "Could not fetch ad response from ad request service due to an Exception."

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgq()Lcom/google/android/gms/internal/zzkr;

    move-result-object v2

    const-string/jumbo v3, "AdRequestClientTask.getAdResponseFromService"

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/internal/zzkr;->zza(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public zzb(Lcom/google/android/gms/ads/internal/request/AdResponseParcel;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/request/zzd;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/zzd;->zzcjn:Lcom/google/android/gms/ads/internal/request/zzc$zza;

    invoke-interface {v0, p1}, Lcom/google/android/gms/ads/internal/request/zzc$zza;->zzb(Lcom/google/android/gms/ads/internal/request/AdResponseParcel;)V

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/request/zzd;->zztb()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzrw()Ljava/lang/Void;
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/request/zzd;->zztc()Lcom/google/android/gms/ads/internal/request/zzk;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/zzd;->zzcjn:Lcom/google/android/gms/ads/internal/request/zzc$zza;

    new-instance v1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/request/zzc$zza;->zzb(Lcom/google/android/gms/ads/internal/request/AdResponseParcel;)V

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/request/zzd;->zztb()V

    :goto_0
    return-object v3

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/request/zzd;->zzcjm:Lcom/google/android/gms/internal/zzlw;

    new-instance v2, Lcom/google/android/gms/ads/internal/request/zzd$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/ads/internal/request/zzd$1;-><init>(Lcom/google/android/gms/ads/internal/request/zzd;Lcom/google/android/gms/ads/internal/request/zzk;)V

    new-instance v0, Lcom/google/android/gms/ads/internal/request/zzd$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/ads/internal/request/zzd$2;-><init>(Lcom/google/android/gms/ads/internal/request/zzd;)V

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/internal/zzlw;->zza(Lcom/google/android/gms/internal/zzlw$zzc;Lcom/google/android/gms/internal/zzlw$zza;)V

    goto :goto_0
.end method

.method public synthetic zzrz()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/request/zzd;->zzrw()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public abstract zztb()V
.end method

.method public abstract zztc()Lcom/google/android/gms/ads/internal/request/zzk;
.end method
