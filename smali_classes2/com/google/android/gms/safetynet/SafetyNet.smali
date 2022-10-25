.class public final Lcom/google/android/gms/safetynet/SafetyNet;
.super Ljava/lang/Object;


# static fields
.field public static final API:Lcom/google/android/gms/common/api/Api;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api",
            "<",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NoOptions;",
            ">;"
        }
    .end annotation
.end field

.field public static final SafetyNetApi:Lcom/google/android/gms/safetynet/SafetyNetApi;

.field public static final aCj:Lcom/google/android/gms/safetynet/zze;

.field public static final hg:Lcom/google/android/gms/common/api/Api$zzf;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zzf",
            "<",
            "Lcom/google/android/gms/internal/zzxd;",
            ">;"
        }
    .end annotation
.end field

.field public static final hh:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza",
            "<",
            "Lcom/google/android/gms/internal/zzxd;",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NoOptions;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/google/android/gms/common/api/Api$zzf;

    invoke-direct {v0}, Lcom/google/android/gms/common/api/Api$zzf;-><init>()V

    sput-object v0, Lcom/google/android/gms/safetynet/SafetyNet;->hg:Lcom/google/android/gms/common/api/Api$zzf;

    new-instance v0, Lcom/google/android/gms/safetynet/SafetyNet$1;

    invoke-direct {v0}, Lcom/google/android/gms/safetynet/SafetyNet$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/safetynet/SafetyNet;->hh:Lcom/google/android/gms/common/api/Api$zza;

    new-instance v0, Lcom/google/android/gms/common/api/Api;

    const-string/jumbo v1, "SafetyNet.API"

    sget-object v2, Lcom/google/android/gms/safetynet/SafetyNet;->hh:Lcom/google/android/gms/common/api/Api$zza;

    sget-object v3, Lcom/google/android/gms/safetynet/SafetyNet;->hg:Lcom/google/android/gms/common/api/Api$zzf;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/api/Api;-><init>(Ljava/lang/String;Lcom/google/android/gms/common/api/Api$zza;Lcom/google/android/gms/common/api/Api$zzf;)V

    sput-object v0, Lcom/google/android/gms/safetynet/SafetyNet;->API:Lcom/google/android/gms/common/api/Api;

    new-instance v0, Lcom/google/android/gms/internal/zzxc;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzxc;-><init>()V

    sput-object v0, Lcom/google/android/gms/safetynet/SafetyNet;->SafetyNetApi:Lcom/google/android/gms/safetynet/SafetyNetApi;

    new-instance v0, Lcom/google/android/gms/internal/zzxe;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzxe;-><init>()V

    sput-object v0, Lcom/google/android/gms/safetynet/SafetyNet;->aCj:Lcom/google/android/gms/safetynet/zze;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
