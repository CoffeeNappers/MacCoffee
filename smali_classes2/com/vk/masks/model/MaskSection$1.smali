.class final Lcom/vk/masks/model/MaskSection$1;
.super Ljava/lang/Object;
.source "MaskSection.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/masks/model/MaskSection;
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
        "Lcom/vk/masks/model/MaskSection;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/vk/masks/model/MaskSection;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 71
    new-instance v0, Lcom/vk/masks/model/MaskSection;

    invoke-direct {v0, p1}, Lcom/vk/masks/model/MaskSection;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 68
    invoke-virtual {p0, p1}, Lcom/vk/masks/model/MaskSection$1;->createFromParcel(Landroid/os/Parcel;)Lcom/vk/masks/model/MaskSection;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vk/masks/model/MaskSection;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 76
    new-array v0, p1, [Lcom/vk/masks/model/MaskSection;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 68
    invoke-virtual {p0, p1}, Lcom/vk/masks/model/MaskSection$1;->newArray(I)[Lcom/vk/masks/model/MaskSection;

    move-result-object v0

    return-object v0
.end method
