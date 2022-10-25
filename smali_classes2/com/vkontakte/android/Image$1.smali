.class final Lcom/vkontakte/android/Image$1;
.super Ljava/lang/Object;
.source "Image.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/Image;
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
        "Lcom/vkontakte/android/Image;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/Image;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 52
    new-instance v0, Lcom/vkontakte/android/Image;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/Image;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/Image$1;->createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/Image;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/Image;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 56
    new-array v0, p1, [Lcom/vkontakte/android/Image;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/Image$1;->newArray(I)[Lcom/vkontakte/android/Image;

    move-result-object v0

    return-object v0
.end method
