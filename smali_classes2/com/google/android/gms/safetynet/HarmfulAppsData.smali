.class public Lcom/google/android/gms/safetynet/HarmfulAppsData;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/safetynet/HarmfulAppsData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final aCe:[B

.field public final aCf:I

.field public final apkPackageName:Ljava/lang/String;

.field public final mVersionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/safetynet/zzb;

    invoke-direct {v0}, Lcom/google/android/gms/safetynet/zzb;-><init>()V

    sput-object v0, Lcom/google/android/gms/safetynet/HarmfulAppsData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;[BI)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/safetynet/HarmfulAppsData;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/safetynet/HarmfulAppsData;->apkPackageName:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/safetynet/HarmfulAppsData;->aCe:[B

    iput p4, p0, Lcom/google/android/gms/safetynet/HarmfulAppsData;->aCf:I

    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/safetynet/zzb;->zza(Lcom/google/android/gms/safetynet/HarmfulAppsData;Landroid/os/Parcel;I)V

    return-void
.end method
