.class Lcom/google/android/gms/config/internal/zzc$zzc$1;
.super Lcom/google/android/gms/config/internal/zzc$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/config/internal/zzc$zzc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic Hb:Lcom/google/android/gms/config/internal/zzc$zzc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/config/internal/zzc$zzc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/config/internal/zzc$zzc$1;->Hb:Lcom/google/android/gms/config/internal/zzc$zzc;

    invoke-direct {p0}, Lcom/google/android/gms/config/internal/zzc$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;)V
    .locals 6

    invoke-virtual {p2}, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->getStatusCode()I

    move-result v0

    const/16 v1, 0x1966

    if-eq v0, v1, :cond_0

    invoke-virtual {p2}, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->getStatusCode()I

    move-result v0

    const/16 v1, 0x196b

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/config/internal/zzc$zzc$1;->Hb:Lcom/google/android/gms/config/internal/zzc$zzc;

    new-instance v1, Lcom/google/android/gms/config/internal/zzc$zzd;

    invoke-virtual {p2}, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->getStatusCode()I

    move-result v2

    invoke-static {v2}, Lcom/google/android/gms/config/internal/zzc;->zzhm(I)Lcom/google/android/gms/common/api/Status;

    move-result-object v2

    invoke-static {p2}, Lcom/google/android/gms/config/internal/zzc;->zzb(Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;)Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {p2}, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->getThrottleEndTimeMillis()J

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/gms/config/internal/zzc$zzd;-><init>(Lcom/google/android/gms/common/api/Status;Ljava/util/Map;J)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/config/internal/zzc$zzc;->zzc(Lcom/google/android/gms/common/api/Result;)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/config/internal/zzc$zzc$1;->Hb:Lcom/google/android/gms/config/internal/zzc$zzc;

    new-instance v1, Lcom/google/android/gms/config/internal/zzc$zzd;

    invoke-virtual {p2}, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->getStatusCode()I

    move-result v2

    invoke-static {v2}, Lcom/google/android/gms/config/internal/zzc;->zzhm(I)Lcom/google/android/gms/common/api/Status;

    move-result-object v2

    invoke-static {p2}, Lcom/google/android/gms/config/internal/zzc;->zzb(Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;)Ljava/util/HashMap;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/config/internal/zzc$zzd;-><init>(Lcom/google/android/gms/common/api/Status;Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/config/internal/zzc$zzc;->zzc(Lcom/google/android/gms/common/api/Result;)V

    goto :goto_0
.end method
