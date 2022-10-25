.class Lcom/google/android/gms/internal/zznq$2;
.super Lcom/google/android/gms/internal/zzqo$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zznq;->addWorkAccount(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzqo$zza",
        "<",
        "Lcom/google/android/gms/auth/account/WorkAccountApi$AddAccountResult;",
        "Lcom/google/android/gms/internal/zznr;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic hI:Ljava/lang/String;

.field final synthetic hU:Lcom/google/android/gms/internal/zznq;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zznq;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zznq$2;->hU:Lcom/google/android/gms/internal/zznq;

    iput-object p4, p0, Lcom/google/android/gms/internal/zznq$2;->hI:Ljava/lang/String;

    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/internal/zzqo$zza;-><init>(Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/GoogleApiClient;)V

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

    check-cast p1, Lcom/google/android/gms/internal/zznr;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zznq$2;->zza(Lcom/google/android/gms/internal/zznr;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zznr;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zznr;->zzavg()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/auth/account/zzb;

    new-instance v1, Lcom/google/android/gms/internal/zznq$2$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zznq$2$1;-><init>(Lcom/google/android/gms/internal/zznq$2;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zznq$2;->hI:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/auth/account/zzb;->zza(Lcom/google/android/gms/auth/account/zza;Ljava/lang/String;)V

    return-void
.end method

.method protected synthetic zzc(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zznq$2;->zzf(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/auth/account/WorkAccountApi$AddAccountResult;

    move-result-object v0

    return-object v0
.end method

.method protected zzf(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/auth/account/WorkAccountApi$AddAccountResult;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zznq$zzb;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/zznq$zzb;-><init>(Lcom/google/android/gms/common/api/Status;Landroid/accounts/Account;)V

    return-object v0
.end method
