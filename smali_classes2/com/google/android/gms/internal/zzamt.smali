.class Lcom/google/android/gms/internal/zzamt;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzamt$zzc;,
        Lcom/google/android/gms/internal/zzamt$zza;,
        Lcom/google/android/gms/internal/zzamt$zzb;
    }
.end annotation


# direct methods
.method static zzb(B)Lcom/google/android/gms/internal/zzamt$zzb;
    .locals 1

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzamt$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzamt$zza;-><init>()V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzamt$zzc;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzamt$zzc;-><init>()V

    goto :goto_0
.end method
