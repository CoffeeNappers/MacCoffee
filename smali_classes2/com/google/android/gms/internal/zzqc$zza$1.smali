.class Lcom/google/android/gms/internal/zzqc$zza$1;
.super Lcom/google/android/gms/internal/zzqf$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzqc$zza;->zza(Lcom/google/android/gms/internal/zzqd;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic wG:Lcom/google/android/gms/internal/zzqc$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzqc$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqc$zza$1;->wG:Lcom/google/android/gms/internal/zzqc$zza;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzqf$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zzv(Lcom/google/android/gms/common/api/Status;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqc$zza$1;->wG:Lcom/google/android/gms/internal/zzqc$zza;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzqc$zza;->zzc(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method

.method public zzw(Lcom/google/android/gms/common/api/Status;)V
    .locals 1

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
