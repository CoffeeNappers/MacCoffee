.class Lcom/google/android/gms/internal/zzxc$zze$1;
.super Lcom/google/android/gms/internal/zzwy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzxc$zze;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aCy:Lcom/google/android/gms/internal/zzxc$zze;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzxc$zze;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzxc$zze$1;->aCy:Lcom/google/android/gms/internal/zzxc$zze;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzwy;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/safetynet/RecaptchaResultData;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxc$zze$1;->aCy:Lcom/google/android/gms/internal/zzxc$zze;

    new-instance v1, Lcom/google/android/gms/internal/zzxc$zzh;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/internal/zzxc$zzh;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/safetynet/RecaptchaResultData;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzxc$zze;->zzc(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method
