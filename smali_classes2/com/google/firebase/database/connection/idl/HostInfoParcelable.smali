.class Lcom/google/firebase/database/connection/idl/HostInfoParcelable;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/firebase/database/connection/idl/HostInfoParcelable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final EY:Ljava/lang/String;

.field final baV:Ljava/lang/String;

.field final baW:Z

.field final versionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/firebase/database/connection/idl/zzd;

    invoke-direct {v0}, Lcom/google/firebase/database/connection/idl/zzd;-><init>()V

    sput-object v0, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;->versionCode:I

    iput-object p2, p0, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;->baV:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;->EY:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;->baW:Z

    return-void
.end method

.method public static zza(Lcom/google/firebase/database/connection/idl/HostInfoParcelable;)Lcom/google/android/gms/internal/zzaiw;
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/zzaiw;

    iget-object v1, p0, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;->baV:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;->EY:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;->baW:Z

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzaiw;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v0
.end method

.method public static zza(Lcom/google/android/gms/internal/zzaiw;)Lcom/google/firebase/database/connection/idl/HostInfoParcelable;
    .locals 5

    new-instance v0, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaiw;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaiw;->getNamespace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaiw;->isSecure()Z

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V

    return-object v0
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/firebase/database/connection/idl/zzd;->zza(Lcom/google/firebase/database/connection/idl/HostInfoParcelable;Landroid/os/Parcel;I)V

    return-void
.end method
