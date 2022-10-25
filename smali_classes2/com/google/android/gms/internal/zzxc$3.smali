.class Lcom/google/android/gms/internal/zzxc$3;
.super Lcom/google/android/gms/internal/zzxc$zzf;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzxc;->lookupUri(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;[I)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aCn:Lcom/google/android/gms/internal/zzxc;

.field final synthetic aCp:Ljava/lang/String;

.field final synthetic aCr:[I


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;[ILjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzxc$3;->aCn:Lcom/google/android/gms/internal/zzxc;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzxc$3;->aCr:[I

    iput-object p4, p0, Lcom/google/android/gms/internal/zzxc$3;->aCp:Ljava/lang/String;

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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxc$3;->zza(Lcom/google/android/gms/internal/zzxd;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzxd;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxc$3;->aCr:[I

    array-length v3, v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_0

    aget v4, v1, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxc$3;->aCu:Lcom/google/android/gms/internal/zzxa;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/google/android/gms/internal/zzxc$3;->aCp:Ljava/lang/String;

    const/4 v5, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/zzxd;->zza(Lcom/google/android/gms/internal/zzxa;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method
