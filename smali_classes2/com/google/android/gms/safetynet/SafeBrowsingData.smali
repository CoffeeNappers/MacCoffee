.class public Lcom/google/android/gms/safetynet/SafeBrowsingData;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/safetynet/SafeBrowsingData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private aCg:Ljava/lang/String;

.field private aCh:Lcom/google/android/gms/common/data/DataHolder;

.field public final mVersionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/safetynet/zzd;

    invoke-direct {v0}, Lcom/google/android/gms/safetynet/zzd;-><init>()V

    sput-object v0, Lcom/google/android/gms/safetynet/SafeBrowsingData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/safetynet/SafeBrowsingData;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/safetynet/SafeBrowsingData;->aCg:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/safetynet/SafeBrowsingData;->aCh:Lcom/google/android/gms/common/data/DataHolder;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/google/android/gms/safetynet/SafeBrowsingData;-><init>(ILjava/lang/String;Lcom/google/android/gms/common/data/DataHolder;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/gms/safetynet/SafeBrowsingData;-><init>(ILjava/lang/String;Lcom/google/android/gms/common/data/DataHolder;)V

    return-void
.end method


# virtual methods
.method public getBlacklistsDataHolder()Lcom/google/android/gms/common/data/DataHolder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/safetynet/SafeBrowsingData;->aCh:Lcom/google/android/gms/common/data/DataHolder;

    return-object v0
.end method

.method public getMetadata()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/safetynet/SafeBrowsingData;->aCg:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/safetynet/zzd;->zza(Lcom/google/android/gms/safetynet/SafeBrowsingData;Landroid/os/Parcel;I)V

    return-void
.end method
