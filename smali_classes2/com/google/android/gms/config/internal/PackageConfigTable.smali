.class public Lcom/google/android/gms/config/internal/PackageConfigTable;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/config/internal/PackageConfigTable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final Hl:Landroid/os/Bundle;

.field private final mVersionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/config/internal/zzk;

    invoke-direct {v0}, Lcom/google/android/gms/config/internal/zzk;-><init>()V

    sput-object v0, Lcom/google/android/gms/config/internal/PackageConfigTable;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILandroid/os/Bundle;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/config/internal/PackageConfigTable;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/config/internal/PackageConfigTable;->Hl:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/config/internal/PackageConfigTable;->mVersionCode:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/config/internal/zzk;->zza(Lcom/google/android/gms/config/internal/PackageConfigTable;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzazt()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/config/internal/PackageConfigTable;->Hl:Landroid/os/Bundle;

    return-object v0
.end method
