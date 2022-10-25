.class final Lcom/vk/masks/model/Mask$DisableReason$1;
.super Ljava/lang/Object;
.source "Mask.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/masks/model/Mask$DisableReason;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/vk/masks/model/Mask$DisableReason;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/vk/masks/model/Mask$DisableReason;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 174
    new-instance v0, Lcom/vk/masks/model/Mask$DisableReason;

    invoke-direct {v0, p1}, Lcom/vk/masks/model/Mask$DisableReason;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 171
    invoke-virtual {p0, p1}, Lcom/vk/masks/model/Mask$DisableReason$1;->createFromParcel(Landroid/os/Parcel;)Lcom/vk/masks/model/Mask$DisableReason;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vk/masks/model/Mask$DisableReason;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 179
    new-array v0, p1, [Lcom/vk/masks/model/Mask$DisableReason;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 171
    invoke-virtual {p0, p1}, Lcom/vk/masks/model/Mask$DisableReason$1;->newArray(I)[Lcom/vk/masks/model/Mask$DisableReason;

    move-result-object v0

    return-object v0
.end method
