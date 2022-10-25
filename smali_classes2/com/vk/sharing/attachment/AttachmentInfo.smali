.class public final Lcom/vk/sharing/attachment/AttachmentInfo;
.super Ljava/lang/Object;
.source "AttachmentInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/sharing/attachment/AttachmentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final DATA_ARTIST:Ljava/lang/String; = "artist"

.field public static final DATA_AUTHOR_NAME:Ljava/lang/String; = "authorName"

.field public static final DATA_AUTHOR_PHOTO_URL:Ljava/lang/String; = "authorPhotoUrl"

.field public static final DATA_DURATION:Ljava/lang/String; = "duration"

.field public static final DATA_EXTENSION:Ljava/lang/String; = "extension"

.field public static final DATA_POST_ID:Ljava/lang/String; = "postId"

.field public static final DATA_PRICE:Ljava/lang/String; = "cost"

.field public static final DATA_SIZE:Ljava/lang/String; = "size"

.field public static final DATA_STATS:Ljava/lang/String; = "stats"

.field public static final DATA_THUMB:Ljava/lang/String; = "thumb"

.field public static final DATA_THUMBS:Ljava/lang/String; = "thumbs"

.field public static final DATA_THUMB_URL:Ljava/lang/String; = "thumbUrl"

.field public static final DATA_TITLE:Ljava/lang/String; = "title"

.field public static final DATA_TRACK_CODE:Ljava/lang/String; = "trackCode"


# instance fields
.field private final accessKey:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final data:Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final mediaId:I

.field private final ownerId:I

.field private final ref:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final type:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 175
    new-instance v0, Lcom/vk/sharing/attachment/AttachmentInfo$1;

    invoke-direct {v0}, Lcom/vk/sharing/attachment/AttachmentInfo$1;-><init>()V

    sput-object v0, Lcom/vk/sharing/attachment/AttachmentInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(IIILjava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "ownerId"    # I
    .param p3, "mediaId"    # I
    .param p4, "accessKey"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "data"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput p1, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->type:I

    .line 47
    iput p2, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->ownerId:I

    .line 48
    iput p3, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->mediaId:I

    .line 49
    iput-object p4, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->accessKey:Ljava/lang/String;

    .line 50
    iput-object p5, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->data:Landroid/os/Bundle;

    .line 51
    iput-object p6, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->ref:Ljava/lang/String;

    .line 52
    return-void
.end method

.method synthetic constructor <init>(IIILjava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Lcom/vk/sharing/attachment/AttachmentInfo$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Ljava/lang/String;
    .param p5, "x4"    # Landroid/os/Bundle;
    .param p6, "x5"    # Ljava/lang/String;
    .param p7, "x6"    # Lcom/vk/sharing/attachment/AttachmentInfo$1;

    .prologue
    .line 14
    invoke-direct/range {p0 .. p6}, Lcom/vk/sharing/attachment/AttachmentInfo;-><init>(IIILjava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->type:I

    .line 57
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->ownerId:I

    .line 58
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->mediaId:I

    .line 59
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->accessKey:Ljava/lang/String;

    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->data:Landroid/os/Bundle;

    .line 61
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->ref:Ljava/lang/String;

    .line 62
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vk/sharing/attachment/AttachmentInfo$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vk/sharing/attachment/AttachmentInfo$1;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/vk/sharing/attachment/AttachmentInfo;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    return v0
.end method

.method public getAccessKey()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->accessKey:Ljava/lang/String;

    return-object v0
.end method

.method public getData()Landroid/os/Bundle;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->data:Landroid/os/Bundle;

    return-object v0
.end method

.method public getMediaId()I
    .locals 1

    .prologue
    .line 94
    iget v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->mediaId:I

    return v0
.end method

.method public getOwnerId()I
    .locals 1

    .prologue
    .line 90
    iget v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->ownerId:I

    return v0
.end method

.method public getRef()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->ref:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 81
    iget v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->type:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 66
    iget v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->type:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 67
    iget v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->ownerId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 68
    iget v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->mediaId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 69
    iget-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->accessKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 70
    iget-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->data:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 71
    iget-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo;->ref:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 72
    return-void
.end method
