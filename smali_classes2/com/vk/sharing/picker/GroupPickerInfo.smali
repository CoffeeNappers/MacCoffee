.class public Lcom/vk/sharing/picker/GroupPickerInfo;
.super Ljava/lang/Object;
.source "GroupPickerInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/sharing/picker/GroupPickerInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public adminedGroupId:I

.field public preselectedGroupId:I

.field public restrictToAdminedGroup:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    new-instance v0, Lcom/vk/sharing/picker/GroupPickerInfo$1;

    invoke-direct {v0}, Lcom/vk/sharing/picker/GroupPickerInfo$1;-><init>()V

    sput-object v0, Lcom/vk/sharing/picker/GroupPickerInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/vk/sharing/picker/GroupPickerInfo;->restrictToAdminedGroup:Z

    .line 24
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/sharing/picker/GroupPickerInfo;->preselectedGroupId:I

    .line 25
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/sharing/picker/GroupPickerInfo;->adminedGroupId:I

    .line 26
    return-void

    .line 23
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vk/sharing/picker/GroupPickerInfo$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vk/sharing/picker/GroupPickerInfo$1;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/vk/sharing/picker/GroupPickerInfo;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 30
    iget-boolean v0, p0, Lcom/vk/sharing/picker/GroupPickerInfo;->restrictToAdminedGroup:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 31
    iget v0, p0, Lcom/vk/sharing/picker/GroupPickerInfo;->preselectedGroupId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 32
    iget v0, p0, Lcom/vk/sharing/picker/GroupPickerInfo;->adminedGroupId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 33
    return-void

    .line 30
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
