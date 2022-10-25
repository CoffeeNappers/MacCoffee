.class public Lcom/google/android/gms/location/ActivityRecognitionRequest;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/location/ActivityRecognitionRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private ajA:[I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private ajB:Z
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final ajC:J

.field private ajx:J

.field private ajy:Z

.field private ajz:Landroid/os/WorkSource;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private hy:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mTag:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final mVersionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/location/zza;

    invoke-direct {v0}, Lcom/google/android/gms/location/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(IJZLandroid/os/WorkSource;Ljava/lang/String;[IZLjava/lang/String;J)V
    .locals 0
    .param p5    # Landroid/os/WorkSource;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # [I
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->mVersionCode:I

    iput-wide p2, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajx:J

    iput-boolean p4, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajy:Z

    iput-object p5, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajz:Landroid/os/WorkSource;

    iput-object p6, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->mTag:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajA:[I

    iput-boolean p8, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajB:Z

    iput-object p9, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->hy:Ljava/lang/String;

    iput-wide p10, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajC:J

    return-void
.end method


# virtual methods
.method public getAccountName()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->hy:Ljava/lang/String;

    return-object v0
.end method

.method public getIntervalMillis()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajx:J

    return-wide v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->mTag:Ljava/lang/String;

    return-object v0
.end method

.method getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->mVersionCode:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/location/zza;->zza(Lcom/google/android/gms/location/ActivityRecognitionRequest;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzbps()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajy:Z

    return v0
.end method

.method public zzbpt()Landroid/os/WorkSource;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajz:Landroid/os/WorkSource;

    return-object v0
.end method

.method public zzbpu()[I
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajA:[I

    return-object v0
.end method

.method public zzbpv()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajB:Z

    return v0
.end method

.method public zzbpw()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/location/ActivityRecognitionRequest;->ajC:J

    return-wide v0
.end method
