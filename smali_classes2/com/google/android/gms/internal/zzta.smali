.class public final Lcom/google/android/gms/internal/zzta;
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

.field public static final GR:Lcom/google/android/gms/internal/zztb;

.field public static final hg:Lcom/google/android/gms/common/api/Api$zzf;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zzf",
            "<",
            "Lcom/google/android/gms/config/internal/zze;",
            ">;"
        }
    .end annotation
.end field

.field static final hh:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza",
            "<",
            "Lcom/google/android/gms/config/internal/zze;",
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

    sput-object v0, Lcom/google/android/gms/internal/zzta;->hg:Lcom/google/android/gms/common/api/Api$zzf;

    new-instance v0, Lcom/google/android/gms/internal/zzta$1;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzta$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzta;->hh:Lcom/google/android/gms/common/api/Api$zza;

    new-instance v0, Lcom/google/android/gms/common/api/Api;

    const-string/jumbo v1, "Config.API"

    sget-object v2, Lcom/google/android/gms/internal/zzta;->hh:Lcom/google/android/gms/common/api/Api$zza;

    sget-object v3, Lcom/google/android/gms/internal/zzta;->hg:Lcom/google/android/gms/common/api/Api$zzf;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/api/Api;-><init>(Ljava/lang/String;Lcom/google/android/gms/common/api/Api$zza;Lcom/google/android/gms/common/api/Api$zzf;)V

    sput-object v0, Lcom/google/android/gms/internal/zzta;->API:Lcom/google/android/gms/common/api/Api;

    new-instance v0, Lcom/google/android/gms/config/internal/zzc;

    invoke-direct {v0}, Lcom/google/android/gms/config/internal/zzc;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzta;->GR:Lcom/google/android/gms/internal/zztb;

    return-void
.end method
