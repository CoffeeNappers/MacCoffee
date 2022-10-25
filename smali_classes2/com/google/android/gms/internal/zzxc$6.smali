.class Lcom/google/android/gms/internal/zzxc$6;
.super Lcom/google/android/gms/internal/zzxc$zze;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzxc;->verifyWithRecaptcha(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aCn:Lcom/google/android/gms/internal/zzxc;

.field final synthetic aCs:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzxc$6;->aCn:Lcom/google/android/gms/internal/zzxc;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzxc$6;->aCs:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzxc$zze;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxc$6;->zza(Lcom/google/android/gms/internal/zzxd;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzxd;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxc$6;->aCu:Lcom/google/android/gms/internal/zzxa;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxc$6;->aCs:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzxd;->zza(Lcom/google/android/gms/internal/zzxa;Ljava/lang/String;)V

    return-void
.end method
