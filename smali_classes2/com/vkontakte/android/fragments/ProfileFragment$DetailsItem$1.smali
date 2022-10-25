.class final Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem$1;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
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
        "Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 4464
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 4466
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 4464
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem$1;->createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 4470
    new-array v0, p1, [Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 4464
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem$1;->newArray(I)[Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    move-result-object v0

    return-object v0
.end method
