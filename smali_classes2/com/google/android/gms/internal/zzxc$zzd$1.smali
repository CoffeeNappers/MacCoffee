.class Lcom/google/android/gms/internal/zzxc$zzd$1;
.super Lcom/google/android/gms/internal/zzwy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzxc$zzd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aCx:Lcom/google/android/gms/internal/zzxc$zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzxc$zzd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzxc$zzd$1;->aCx:Lcom/google/android/gms/internal/zzxc$zzd;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzwy;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/common/api/Status;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Status;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/safetynet/HarmfulAppsData;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxc$zzd$1;->aCx:Lcom/google/android/gms/internal/zzxc$zzd;

    new-instance v1, Lcom/google/android/gms/internal/zzxc$zzg;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/internal/zzxc$zzg;-><init>(Lcom/google/android/gms/common/api/Status;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzxc$zzd;->zzc(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method
