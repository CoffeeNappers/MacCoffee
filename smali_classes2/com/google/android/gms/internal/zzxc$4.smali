.class Lcom/google/android/gms/internal/zzxc$4;
.super Lcom/google/android/gms/internal/zzxc$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzxc;->enableVerifyApps(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aCn:Lcom/google/android/gms/internal/zzxc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzxc$4;->aCn:Lcom/google/android/gms/internal/zzxc;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzxc$zzc;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic zza(Lcom/google/android/gms/common/api/Api$zzb;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    check-cast p1, Lcom/google/android/gms/internal/zzxd;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxc$4;->zza(Lcom/google/android/gms/internal/zzxd;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzxd;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxc$4;->aCu:Lcom/google/android/gms/internal/zzxa;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzxd;->zzb(Lcom/google/android/gms/internal/zzxa;)V

    return-void
.end method
