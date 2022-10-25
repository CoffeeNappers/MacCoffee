.class Lcom/google/android/gms/internal/zzxc$2;
.super Lcom/google/android/gms/internal/zzxc$zzf;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzxc;->zza(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aCn:Lcom/google/android/gms/internal/zzxc;

.field final synthetic aCo:Ljava/util/List;

.field final synthetic aCp:Ljava/lang/String;

.field final synthetic aCq:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzxc$2;->aCn:Lcom/google/android/gms/internal/zzxc;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzxc$2;->aCo:Ljava/util/List;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzxc$2;->aCp:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzxc$2;->aCq:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzxc$zzf;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxc$2;->zza(Lcom/google/android/gms/internal/zzxd;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzxd;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxc$2;->aCu:Lcom/google/android/gms/internal/zzxa;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxc$2;->aCo:Ljava/util/List;

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/google/android/gms/internal/zzxc$2;->aCp:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzxc$2;->aCq:Ljava/lang/String;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/zzxd;->zza(Lcom/google/android/gms/internal/zzxa;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method
