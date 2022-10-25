.class Lcom/google/android/gms/internal/zzoc$1;
.super Lcom/google/android/gms/internal/zzob;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzoc;->performProxyRequest(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/auth/api/proxy/ProxyRequest;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic jb:Lcom/google/android/gms/auth/api/proxy/ProxyRequest;

.field final synthetic jc:Lcom/google/android/gms/internal/zzoc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzoc;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/auth/api/proxy/ProxyRequest;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzoc$1;->jc:Lcom/google/android/gms/internal/zzoc;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzoc$1;->jb:Lcom/google/android/gms/auth/api/proxy/ProxyRequest;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzob;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-void
.end method


# virtual methods
.method protected zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzoa;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzoc$1$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzoc$1$1;-><init>(Lcom/google/android/gms/internal/zzoc$1;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzoc$1;->jb:Lcom/google/android/gms/auth/api/proxy/ProxyRequest;

    invoke-interface {p2, v0, v1}, Lcom/google/android/gms/internal/zzoa;->zza(Lcom/google/android/gms/internal/zznz;Lcom/google/android/gms/auth/api/proxy/ProxyRequest;)V

    return-void
.end method
