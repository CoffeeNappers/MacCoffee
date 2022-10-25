.class public final Lcom/vk/sharing/target/Target;
.super Ljava/lang/Object;
.source "Target.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/vkontakte/android/Indexable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public id:I

.field public insName:Ljava/lang/String;

.field private isPrivate:Z

.field private isUser:Z

.field public name:Ljava/lang/String;

.field public photoUrl:Ljava/lang/String;

.field public selected:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 97
    new-instance v0, Lcom/vk/sharing/target/Target$1;

    invoke-direct {v0}, Lcom/vk/sharing/target/Target$1;-><init>()V

    sput-object v0, Lcom/vk/sharing/target/Target;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/sharing/target/Target;->id:I

    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/target/Target;->insName:Ljava/lang/String;

    .line 75
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/target/Target;->photoUrl:Ljava/lang/String;

    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/sharing/target/Target;->selected:Z

    .line 77
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-ne v0, v1, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vk/sharing/target/Target;->isUser:Z

    .line 78
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-ne v0, v1, :cond_2

    :goto_2
    iput-boolean v1, p0, Lcom/vk/sharing/target/Target;->isPrivate:Z

    .line 79
    return-void

    :cond_0
    move v0, v2

    .line 76
    goto :goto_0

    :cond_1
    move v0, v2

    .line 77
    goto :goto_1

    :cond_2
    move v1, v2

    .line 78
    goto :goto_2
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vk/sharing/target/Target$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vk/sharing/target/Target$1;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/vk/sharing/target/Target;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/vk/sharing/target/Target;)V
    .locals 1
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iget v0, p1, Lcom/vk/sharing/target/Target;->id:I

    iput v0, p0, Lcom/vk/sharing/target/Target;->id:I

    .line 41
    iget-object v0, p1, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    .line 42
    iget-object v0, p1, Lcom/vk/sharing/target/Target;->insName:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/sharing/target/Target;->insName:Ljava/lang/String;

    .line 43
    iget-object v0, p1, Lcom/vk/sharing/target/Target;->photoUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/sharing/target/Target;->photoUrl:Ljava/lang/String;

    .line 44
    iget-boolean v0, p1, Lcom/vk/sharing/target/Target;->selected:Z

    iput-boolean v0, p0, Lcom/vk/sharing/target/Target;->selected:Z

    .line 45
    invoke-virtual {p1}, Lcom/vk/sharing/target/Target;->getIsUser()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/sharing/target/Target;->isUser:Z

    .line 46
    invoke-virtual {p1}, Lcom/vk/sharing/target/Target;->getIsPrivate()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/sharing/target/Target;->isPrivate:Z

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    iput v1, p0, Lcom/vk/sharing/target/Target;->id:I

    .line 51
    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iput-object v1, p0, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    .line 52
    const/4 v1, 0x4

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/UserProfile;->getNameInCase(I)Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "insName":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 54
    iput-object v0, p0, Lcom/vk/sharing/target/Target;->insName:Ljava/lang/String;

    .line 58
    :goto_0
    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v1, p0, Lcom/vk/sharing/target/Target;->photoUrl:Ljava/lang/String;

    .line 59
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vk/sharing/target/Target;->isUser:Z

    .line 60
    return-void

    .line 56
    :cond_0
    iget-object v1, p0, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    iput-object v1, p0, Lcom/vk/sharing/target/Target;->insName:Ljava/lang/String;

    goto :goto_0
.end method

.method public constructor <init>(Lcom/vkontakte/android/api/Group;)V
    .locals 3
    .param p1, "group"    # Lcom/vkontakte/android/api/Group;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iget v1, p1, Lcom/vkontakte/android/api/Group;->id:I

    iput v1, p0, Lcom/vk/sharing/target/Target;->id:I

    .line 64
    iget-object v1, p1, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    iput-object v1, p0, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    .line 65
    iget-object v1, p1, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    iput-object v1, p0, Lcom/vk/sharing/target/Target;->insName:Ljava/lang/String;

    .line 66
    iget-object v1, p1, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    iput-object v1, p0, Lcom/vk/sharing/target/Target;->photoUrl:Ljava/lang/String;

    .line 67
    iput-boolean v0, p0, Lcom/vk/sharing/target/Target;->isUser:Z

    .line 68
    iget v1, p1, Lcom/vkontakte/android/api/Group;->isClosed:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/vk/sharing/target/Target;->isPrivate:Z

    .line 69
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 143
    if-ne p0, p1, :cond_1

    .line 148
    :cond_0
    :goto_0
    return v1

    .line 144
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 146
    check-cast v0, Lcom/vk/sharing/target/Target;

    .line 148
    .local v0, "target":Lcom/vk/sharing/target/Target;
    iget v3, p0, Lcom/vk/sharing/target/Target;->id:I

    iget v4, v0, Lcom/vk/sharing/target/Target;->id:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getIndexChars()[C
    .locals 7

    .prologue
    const/16 v4, 0x20

    const/4 v6, 0x0

    .line 116
    iget-object v3, p0, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    if-nez v3, :cond_1

    .line 117
    const/4 v3, 0x1

    new-array v0, v3, [C

    aput-char v4, v0, v6

    .line 124
    :cond_0
    return-object v0

    .line 119
    :cond_1
    iget-object v3, p0, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    const-string/jumbo v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 120
    .local v2, "strings":[Ljava/lang/String;
    array-length v3, v2

    new-array v0, v3, [C

    .line 121
    .local v0, "chars":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 122
    aget-object v3, v2, v1

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v4

    :goto_1
    aput-char v3, v0, v1

    .line 121
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 122
    :cond_2
    aget-object v3, v2, v1

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    goto :goto_1
.end method

.method public getIsPrivate()Z
    .locals 1

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/vk/sharing/target/Target;->isPrivate:Z

    return v0
.end method

.method public getIsUser()Z
    .locals 1

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/vk/sharing/target/Target;->isUser:Z

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 153
    iget v0, p0, Lcom/vk/sharing/target/Target;->id:I

    return v0
.end method

.method public matches(Ljava/lang/String;)Z
    .locals 6
    .param p1, "q"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 130
    if-eqz p1, :cond_0

    .line 131
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 132
    .local v1, "strings":[Ljava/lang/String;
    array-length v4, v1

    move v3, v2

    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v0, v1, v3

    .line 133
    .local v0, "s1":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 134
    const/4 v2, 0x1

    .line 138
    .end local v0    # "s1":Ljava/lang/String;
    .end local v1    # "strings":[Ljava/lang/String;
    :cond_0
    return v2

    .line 132
    .restart local v0    # "s1":Ljava/lang/String;
    .restart local v1    # "strings":[Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 83
    iget v0, p0, Lcom/vk/sharing/target/Target;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 84
    iget-object v0, p0, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 85
    iget-object v0, p0, Lcom/vk/sharing/target/Target;->insName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lcom/vk/sharing/target/Target;->photoUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 87
    iget-boolean v0, p0, Lcom/vk/sharing/target/Target;->selected:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 88
    iget-boolean v0, p0, Lcom/vk/sharing/target/Target;->isUser:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 89
    iget-boolean v0, p0, Lcom/vk/sharing/target/Target;->isPrivate:Z

    if-eqz v0, :cond_2

    :goto_2
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 90
    return-void

    :cond_0
    move v0, v2

    .line 87
    goto :goto_0

    :cond_1
    move v0, v2

    .line 88
    goto :goto_1

    :cond_2
    move v1, v2

    .line 89
    goto :goto_2
.end method
