.class public final Lcom/vk/sharing/action/ActionsInfo;
.super Ljava/lang/Object;
.source "ActionsInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/sharing/action/ActionsInfo$Builder;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/sharing/action/ActionsInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static final FLAG_CAN_COPY_LINK:I = 0x4

.field private static final FLAG_CAN_POST_GROUP_WALL:I = 0x2

.field private static final FLAG_CAN_POST_USER_WALL:I = 0x1

.field private static final FLAG_CAN_SHARE_EXTERNAL:I = 0x8


# instance fields
.field private final comment:Ljava/lang/String;

.field private final flags:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 138
    new-instance v0, Lcom/vk/sharing/action/ActionsInfo$1;

    invoke-direct {v0}, Lcom/vk/sharing/action/ActionsInfo$1;-><init>()V

    sput-object v0, Lcom/vk/sharing/action/ActionsInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "flags"    # I
    .param p2, "comment"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput p1, p0, Lcom/vk/sharing/action/ActionsInfo;->flags:I

    .line 24
    if-nez p2, :cond_0

    const-string/jumbo p2, ""

    .end local p2    # "comment":Ljava/lang/String;
    :cond_0
    iput-object p2, p0, Lcom/vk/sharing/action/ActionsInfo;->comment:Ljava/lang/String;

    .line 25
    return-void
.end method

.method synthetic constructor <init>(ILjava/lang/String;Lcom/vk/sharing/action/ActionsInfo$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lcom/vk/sharing/action/ActionsInfo$1;

    .prologue
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/vk/sharing/action/ActionsInfo;-><init>(ILjava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/sharing/action/ActionsInfo;->flags:I

    .line 29
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/action/ActionsInfo;->comment:Ljava/lang/String;

    .line 30
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vk/sharing/action/ActionsInfo$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vk/sharing/action/ActionsInfo$1;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/vk/sharing/action/ActionsInfo;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public canAtLeastOneAction()Z
    .locals 1

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/vk/sharing/action/ActionsInfo;->canRepost()Z

    move-result v0

    if-nez v0, :cond_0

    .line 67
    invoke-virtual {p0}, Lcom/vk/sharing/action/ActionsInfo;->canPostGroup()Z

    move-result v0

    if-nez v0, :cond_0

    .line 68
    invoke-virtual {p0}, Lcom/vk/sharing/action/ActionsInfo;->canExtractLink()Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    invoke-virtual {p0}, Lcom/vk/sharing/action/ActionsInfo;->canShareExternal()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canExtractLink()Z
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lcom/vk/sharing/action/ActionsInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canPostGroup()Z
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/vk/sharing/action/ActionsInfo;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canRepost()Z
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lcom/vk/sharing/action/ActionsInfo;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canShareExternal()Z
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lcom/vk/sharing/action/ActionsInfo;->flags:I

    and-int/lit8 v0, v0, 0x8

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 40
    const/4 v0, 0x0

    return v0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vk/sharing/action/ActionsInfo;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public haveComment()Z
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vk/sharing/action/ActionsInfo;->comment:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/sharing/action/ActionsInfo;->comment:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 34
    iget v0, p0, Lcom/vk/sharing/action/ActionsInfo;->flags:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 35
    iget-object v0, p0, Lcom/vk/sharing/action/ActionsInfo;->comment:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 36
    return-void
.end method
