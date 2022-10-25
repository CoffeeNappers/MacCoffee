.class Lcom/google/android/gms/internal/zzxc$zzc$1;
.super Lcom/google/android/gms/internal/zzwy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzxc$zzc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aCw:Lcom/google/android/gms/internal/zzxc$zzc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzxc$zzc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzxc$zzc$1;->aCw:Lcom/google/android/gms/internal/zzxc$zzc;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzwy;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/common/api/Status;Z)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxc$zzc$1;->aCw:Lcom/google/android/gms/internal/zzxc$zzc;

    new-instance v1, Lcom/google/android/gms/internal/zzxc$zzj;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/internal/zzxc$zzj;-><init>(Lcom/google/android/gms/common/api/Status;Z)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzxc$zzc;->zzc(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method
