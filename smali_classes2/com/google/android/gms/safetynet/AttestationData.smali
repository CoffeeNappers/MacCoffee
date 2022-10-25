.class public Lcom/google/android/gms/safetynet/AttestationData;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/safetynet/AttestationData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private aCd:Ljava/lang/String;

.field public final mVersionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/safetynet/zza;

    invoke-direct {v0}, Lcom/google/android/gms/safetynet/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/safetynet/AttestationData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/safetynet/AttestationData;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/safetynet/AttestationData;->aCd:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getJwsResult()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/safetynet/AttestationData;->aCd:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/safetynet/zza;->zza(Lcom/google/android/gms/safetynet/AttestationData;Landroid/os/Parcel;I)V

    return-void
.end method
