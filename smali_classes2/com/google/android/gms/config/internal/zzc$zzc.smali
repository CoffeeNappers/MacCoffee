.class abstract Lcom/google/android/gms/config/internal/zzc$zzc;
.super Lcom/google/android/gms/config/internal/zzc$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/config/internal/zzc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "zzc"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/config/internal/zzc$zzb",
        "<",
        "Lcom/google/android/gms/internal/zztb$zzb;",
        ">;"
    }
.end annotation


# instance fields
.field protected Ha:Lcom/google/android/gms/config/internal/zzi;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/config/internal/zzc$zzb;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    new-instance v0, Lcom/google/android/gms/config/internal/zzc$zzc$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/config/internal/zzc$zzc$1;-><init>(Lcom/google/android/gms/config/internal/zzc$zzc;)V

    iput-object v0, p0, Lcom/google/android/gms/config/internal/zzc$zzc;->Ha:Lcom/google/android/gms/config/internal/zzi;

    return-void
.end method
