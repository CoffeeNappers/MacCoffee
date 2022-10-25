.class Lcom/google/android/gms/internal/zzxc$1;
.super Lcom/google/android/gms/internal/zzxc$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzxc;->attest(Lcom/google/android/gms/common/api/GoogleApiClient;[B)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aCm:[B

.field final synthetic aCn:Lcom/google/android/gms/internal/zzxc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;[B)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzxc$1;->aCn:Lcom/google/android/gms/internal/zzxc;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzxc$1;->aCm:[B

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzxc$zzb;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxc$1;->zza(Lcom/google/android/gms/internal/zzxd;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzxd;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxc$1;->aCu:Lcom/google/android/gms/internal/zzxa;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxc$1;->aCm:[B

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzxd;->zza(Lcom/google/android/gms/internal/zzxa;[B)V

    return-void
.end method
