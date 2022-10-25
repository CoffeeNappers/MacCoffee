.class abstract Lcom/google/android/gms/internal/zzxc$zzc;
.super Lcom/google/android/gms/internal/zzwz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzxc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "zzc"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzwz",
        "<",
        "Lcom/google/android/gms/safetynet/SafetyNetApi$zzc;",
        ">;"
    }
.end annotation


# instance fields
.field protected aCu:Lcom/google/android/gms/internal/zzxa;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzwz;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zzc$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzxc$zzc$1;-><init>(Lcom/google/android/gms/internal/zzxc$zzc;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxc$zzc;->aCu:Lcom/google/android/gms/internal/zzxa;

    return-void
.end method


# virtual methods
.method protected synthetic zzc(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxc$zzc;->zzed(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/safetynet/SafetyNetApi$zzc;

    move-result-object v0

    return-object v0
.end method

.method protected zzed(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/safetynet/SafetyNetApi$zzc;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zzj;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/zzxc$zzj;-><init>(Lcom/google/android/gms/common/api/Status;Z)V

    return-object v0
.end method
