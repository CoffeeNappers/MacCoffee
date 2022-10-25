.class public Lcom/google/firebase/database/connection/idl/ConnectionConfig;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/firebase/database/connection/idl/ConnectionConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final baS:Z

.field final baU:Ljava/lang/String;

.field final bcl:Lcom/google/firebase/database/connection/idl/HostInfoParcelable;

.field final bcm:I

.field final bcn:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final bco:Ljava/lang/String;

.field final versionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/firebase/database/connection/idl/zzb;

    invoke-direct {v0}, Lcom/google/firebase/database/connection/idl/zzb;-><init>()V

    sput-object v0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILcom/google/firebase/database/connection/idl/HostInfoParcelable;ILjava/util/List;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/firebase/database/connection/idl/HostInfoParcelable;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->versionCode:I

    iput-object p2, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->bcl:Lcom/google/firebase/database/connection/idl/HostInfoParcelable;

    iput p3, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->bcm:I

    iput-object p4, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->bcn:Ljava/util/List;

    iput-boolean p5, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->baS:Z

    iput-object p6, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->bco:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->baU:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzaiw;Lcom/google/android/gms/internal/zzalx$zza;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaiw;",
            "Lcom/google/android/gms/internal/zzalx$zza;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v1, 0x1

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    sget-object v0, Lcom/google/firebase/database/connection/idl/ConnectionConfig$1;->bcp:[I

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzalx$zza;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    :goto_0
    iput v1, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->versionCode:I

    invoke-static {p1}, Lcom/google/firebase/database/connection/idl/HostInfoParcelable;->zza(Lcom/google/android/gms/internal/zzaiw;)Lcom/google/firebase/database/connection/idl/HostInfoParcelable;

    move-result-object v1

    iput-object v1, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->bcl:Lcom/google/firebase/database/connection/idl/HostInfoParcelable;

    iput v0, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->bcm:I

    iput-object p3, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->bcn:Ljava/util/List;

    iput-boolean p4, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->baS:Z

    iput-object p5, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->bco:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->baU:Ljava/lang/String;

    return-void

    :pswitch_0
    move v0, v1

    goto :goto_0

    :pswitch_1
    const/4 v0, 0x2

    goto :goto_0

    :pswitch_2
    const/4 v0, 0x3

    goto :goto_0

    :pswitch_3
    const/4 v0, 0x4

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/firebase/database/connection/idl/zzb;->zza(Lcom/google/firebase/database/connection/idl/ConnectionConfig;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzctu()Lcom/google/android/gms/internal/zzalx$zza;
    .locals 1

    iget v0, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->bcm:I

    packed-switch v0, :pswitch_data_0

    sget-object v0, Lcom/google/android/gms/internal/zzalx$zza;->bis:Lcom/google/android/gms/internal/zzalx$zza;

    :goto_0
    return-object v0

    :pswitch_0
    sget-object v0, Lcom/google/android/gms/internal/zzalx$zza;->bis:Lcom/google/android/gms/internal/zzalx$zza;

    goto :goto_0

    :pswitch_1
    sget-object v0, Lcom/google/android/gms/internal/zzalx$zza;->bio:Lcom/google/android/gms/internal/zzalx$zza;

    goto :goto_0

    :pswitch_2
    sget-object v0, Lcom/google/android/gms/internal/zzalx$zza;->bip:Lcom/google/android/gms/internal/zzalx$zza;

    goto :goto_0

    :pswitch_3
    sget-object v0, Lcom/google/android/gms/internal/zzalx$zza;->biq:Lcom/google/android/gms/internal/zzalx$zza;

    goto :goto_0

    :pswitch_4
    sget-object v0, Lcom/google/android/gms/internal/zzalx$zza;->bir:Lcom/google/android/gms/internal/zzalx$zza;

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public zzctv()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;->bcn:Ljava/util/List;

    return-object v0
.end method
