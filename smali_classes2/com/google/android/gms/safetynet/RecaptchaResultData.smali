.class public Lcom/google/android/gms/safetynet/RecaptchaResultData;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/safetynet/RecaptchaResultData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final hN:Ljava/lang/String;

.field public final mVersionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/safetynet/zzc;

    invoke-direct {v0}, Lcom/google/android/gms/safetynet/zzc;-><init>()V

    sput-object v0, Lcom/google/android/gms/safetynet/RecaptchaResultData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/safetynet/RecaptchaResultData;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/safetynet/RecaptchaResultData;->hN:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/safetynet/zzc;->zza(Lcom/google/android/gms/safetynet/RecaptchaResultData;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzccq()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/safetynet/RecaptchaResultData;->hN:Ljava/lang/String;

    return-object v0
.end method
