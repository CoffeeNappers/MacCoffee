.class final Lcom/vkontakte/android/api/Group$1;
.super Ljava/lang/Object;
.source "Group.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/Group;
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
        "Lcom/vkontakte/android/api/Group;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/api/Group;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 193
    new-instance v0, Lcom/vkontakte/android/api/Group;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/Group;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 191
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/Group$1;->createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/api/Group;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/api/Group;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 197
    new-array v0, p1, [Lcom/vkontakte/android/api/Group;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 191
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/Group$1;->newArray(I)[Lcom/vkontakte/android/api/Group;

    move-result-object v0

    return-object v0
.end method
