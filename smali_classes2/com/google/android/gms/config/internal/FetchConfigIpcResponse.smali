.class public Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final Hd:J

.field private final Hk:Lcom/google/android/gms/common/data/DataHolder;

.field private final mVersionCode:I

.field private final uo:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/config/internal/zzh;

    invoke-direct {v0}, Lcom/google/android/gms/config/internal/zzh;-><init>()V

    sput-object v0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(IILcom/google/android/gms/common/data/DataHolder;J)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->mVersionCode:I

    iput p2, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->uo:I

    iput-object p3, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->Hk:Lcom/google/android/gms/common/data/DataHolder;

    iput-wide p4, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->Hd:J

    return-void
.end method


# virtual methods
.method public getStatusCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->uo:I

    return v0
.end method

.method public getThrottleEndTimeMillis()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->Hd:J

    return-wide v0
.end method

.method public getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->mVersionCode:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/config/internal/zzh;->zza(Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzazr()Lcom/google/android/gms/common/data/DataHolder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->Hk:Lcom/google/android/gms/common/data/DataHolder;

    return-object v0
.end method

.method public zzazs()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->Hk:Lcom/google/android/gms/common/data/DataHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->Hk:Lcom/google/android/gms/common/data/DataHolder;

    invoke-virtual {v0}, Lcom/google/android/gms/common/data/DataHolder;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/config/internal/FetchConfigIpcResponse;->Hk:Lcom/google/android/gms/common/data/DataHolder;

    invoke-virtual {v0}, Lcom/google/android/gms/common/data/DataHolder;->close()V

    :cond_0
    return-void
.end method
