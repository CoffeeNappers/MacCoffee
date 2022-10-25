.class abstract Lcom/google/android/gms/internal/zzxc$zzf;
.super Lcom/google/android/gms/internal/zzwz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzxc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "zzf"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzwz",
        "<",
        "Lcom/google/android/gms/safetynet/SafetyNetApi$SafeBrowsingResult;",
        ">;"
    }
.end annotation


# instance fields
.field protected aCu:Lcom/google/android/gms/internal/zzxa;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzwz;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zzf$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzxc$zzf$1;-><init>(Lcom/google/android/gms/internal/zzxc$zzf;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxc$zzf;->aCu:Lcom/google/android/gms/internal/zzxa;

    return-void
.end method


# virtual methods
.method protected synthetic zzc(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxc$zzf;->zzeg(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/safetynet/SafetyNetApi$SafeBrowsingResult;

    move-result-object v0

    return-object v0
.end method

.method protected zzeg(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/safetynet/SafetyNetApi$SafeBrowsingResult;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zzi;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/zzxc$zzi;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/safetynet/SafeBrowsingData;)V

    return-object v0
.end method
