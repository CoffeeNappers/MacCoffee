.class abstract Lcom/google/android/gms/internal/zzxc$zzd;
.super Lcom/google/android/gms/internal/zzwz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzxc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "zzd"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzwz",
        "<",
        "Lcom/google/android/gms/safetynet/SafetyNetApi$zza;",
        ">;"
    }
.end annotation


# instance fields
.field protected final aCu:Lcom/google/android/gms/internal/zzxa;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzwz;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zzd$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzxc$zzd$1;-><init>(Lcom/google/android/gms/internal/zzxc$zzd;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxc$zzd;->aCu:Lcom/google/android/gms/internal/zzxa;

    return-void
.end method


# virtual methods
.method protected synthetic zzc(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxc$zzd;->zzee(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/safetynet/SafetyNetApi$zza;

    move-result-object v0

    return-object v0
.end method

.method protected zzee(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/safetynet/SafetyNetApi$zza;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zzg;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/zzxc$zzg;-><init>(Lcom/google/android/gms/common/api/Status;Ljava/util/List;)V

    return-object v0
.end method
