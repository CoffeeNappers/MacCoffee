.class Lcom/google/firebase/database/connection/idl/RangeParcelable;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/firebase/database/connection/idl/RangeParcelable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final bbT:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final bbU:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final versionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/firebase/database/connection/idl/zzk;

    invoke-direct {v0}, Lcom/google/firebase/database/connection/idl/zzk;-><init>()V

    sput-object v0, Lcom/google/firebase/database/connection/idl/RangeParcelable;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/firebase/database/connection/idl/RangeParcelable;->versionCode:I

    iput-object p2, p0, Lcom/google/firebase/database/connection/idl/RangeParcelable;->bbT:Ljava/util/List;

    iput-object p3, p0, Lcom/google/firebase/database/connection/idl/RangeParcelable;->bbU:Ljava/util/List;

    return-void
.end method

.method public static zza(Lcom/google/firebase/database/connection/idl/RangeParcelable;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaja;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzaja;

    iget-object v1, p0, Lcom/google/firebase/database/connection/idl/RangeParcelable;->bbT:Ljava/util/List;

    iget-object v2, p0, Lcom/google/firebase/database/connection/idl/RangeParcelable;->bbU:Ljava/util/List;

    invoke-direct {v0, v1, v2, p1}, Lcom/google/android/gms/internal/zzaja;-><init>(Ljava/util/List;Ljava/util/List;Ljava/lang/Object;)V

    return-object v0
.end method

.method public static zza(Lcom/google/android/gms/internal/zzaja;)Lcom/google/firebase/database/connection/idl/RangeParcelable;
    .locals 4

    new-instance v0, Lcom/google/firebase/database/connection/idl/RangeParcelable;

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaja;->zzctm()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaja;->zzctn()Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firebase/database/connection/idl/RangeParcelable;-><init>(ILjava/util/List;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/firebase/database/connection/idl/zzk;->zza(Lcom/google/firebase/database/connection/idl/RangeParcelable;Landroid/os/Parcel;I)V

    return-void
.end method
