.class public Lcom/vk/stories/model/StoryUploadParams;
.super Ljava/lang/Object;
.source "StoryUploadParams.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/model/StoryUploadParams$CameraType;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/stories/model/StoryUploadParams;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private addToNews:Z

.field private cameraType:Lcom/vk/stories/model/StoryUploadParams$CameraType;

.field private location:Landroid/location/Location;

.field private maskId:Ljava/lang/String;

.field private sectionId:Ljava/lang/Integer;

.field private userIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 117
    new-instance v0, Lcom/vk/stories/model/StoryUploadParams$1;

    invoke-direct {v0}, Lcom/vk/stories/model/StoryUploadParams$1;-><init>()V

    sput-object v0, Lcom/vk/stories/model/StoryUploadParams;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/model/StoryUploadParams;->maskId:Ljava/lang/String;

    .line 108
    const-class v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    iput-object v1, p0, Lcom/vk/stories/model/StoryUploadParams;->sectionId:Ljava/lang/Integer;

    .line 109
    const-class v1, Landroid/location/Location;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/location/Location;

    iput-object v1, p0, Lcom/vk/stories/model/StoryUploadParams;->location:Landroid/location/Location;

    .line 110
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lcom/vk/stories/model/StoryUploadParams;->addToNews:Z

    .line 111
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vk/stories/model/StoryUploadParams;->userIds:Ljava/util/ArrayList;

    .line 112
    iget-object v1, p0, Lcom/vk/stories/model/StoryUploadParams;->userIds:Ljava/util/ArrayList;

    const-class v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 113
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 114
    .local v0, "tmpCameraType":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const/4 v1, 0x0

    :goto_1
    iput-object v1, p0, Lcom/vk/stories/model/StoryUploadParams;->cameraType:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    .line 115
    return-void

    .line 110
    .end local v0    # "tmpCameraType":I
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 114
    .restart local v0    # "tmpCameraType":I
    :cond_1
    invoke-static {}, Lcom/vk/stories/model/StoryUploadParams$CameraType;->values()[Lcom/vk/stories/model/StoryUploadParams$CameraType;

    move-result-object v1

    aget-object v1, v1, v0

    goto :goto_1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 90
    const/4 v0, 0x0

    return v0
.end method

.method public getCameraType()Lcom/vk/stories/model/StoryUploadParams$CameraType;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->cameraType:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    return-object v0
.end method

.method public getLocation()Landroid/location/Location;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->location:Landroid/location/Location;

    return-object v0
.end method

.method public getMaskId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->maskId:Ljava/lang/String;

    return-object v0
.end method

.method public getSectionId()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->sectionId:Ljava/lang/Integer;

    return-object v0
.end method

.method public getUserIds()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->userIds:Ljava/util/ArrayList;

    return-object v0
.end method

.method public isAddToNews()Z
    .locals 1

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/vk/stories/model/StoryUploadParams;->addToNews:Z

    return v0
.end method

.method public setAddToNews(Z)Lcom/vk/stories/model/StoryUploadParams;
    .locals 0
    .param p1, "addToNews"    # Z

    .prologue
    .line 57
    iput-boolean p1, p0, Lcom/vk/stories/model/StoryUploadParams;->addToNews:Z

    .line 58
    return-object p0
.end method

.method public setCameraType(Lcom/vk/stories/model/StoryUploadParams$CameraType;)Lcom/vk/stories/model/StoryUploadParams;
    .locals 0
    .param p1, "cameraType"    # Lcom/vk/stories/model/StoryUploadParams$CameraType;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/vk/stories/model/StoryUploadParams;->cameraType:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    .line 76
    return-object p0
.end method

.method public setLocation(Landroid/location/Location;)Lcom/vk/stories/model/StoryUploadParams;
    .locals 0
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/vk/stories/model/StoryUploadParams;->location:Landroid/location/Location;

    .line 49
    return-object p0
.end method

.method public setMaskId(Ljava/lang/String;)Lcom/vk/stories/model/StoryUploadParams;
    .locals 0
    .param p1, "maskId"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/vk/stories/model/StoryUploadParams;->maskId:Ljava/lang/String;

    .line 40
    return-object p0
.end method

.method public setSectionId(I)Lcom/vk/stories/model/StoryUploadParams;
    .locals 1
    .param p1, "sectionId"    # I

    .prologue
    .line 84
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->sectionId:Ljava/lang/Integer;

    .line 85
    return-object p0
.end method

.method public setUserIds(Ljava/util/ArrayList;)Lcom/vk/stories/model/StoryUploadParams;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/vk/stories/model/StoryUploadParams;"
        }
    .end annotation

    .prologue
    .line 66
    .local p1, "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/vk/stories/model/StoryUploadParams;->userIds:Ljava/util/ArrayList;

    .line 67
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 95
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->maskId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->sectionId:Ljava/lang/Integer;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 97
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->location:Landroid/location/Location;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 98
    iget-boolean v0, p0, Lcom/vk/stories/model/StoryUploadParams;->addToNews:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 99
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->userIds:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 100
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->cameraType:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    if-nez v0, :cond_1

    const/4 v0, -0x1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 101
    return-void

    .line 98
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 100
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams;->cameraType:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    invoke-virtual {v0}, Lcom/vk/stories/model/StoryUploadParams$CameraType;->ordinal()I

    move-result v0

    goto :goto_1
.end method
