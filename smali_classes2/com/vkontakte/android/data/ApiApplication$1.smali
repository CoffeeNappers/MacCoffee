.class final Lcom/vkontakte/android/data/ApiApplication$1;
.super Ljava/lang/Object;
.source "ApiApplication.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/ApiApplication;
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
        "Lcom/vkontakte/android/data/ApiApplication;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/data/ApiApplication;
    .locals 2
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 208
    new-instance v0, Lcom/vkontakte/android/data/ApiApplication;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/data/ApiApplication;-><init>(Landroid/os/Parcel;Lcom/vkontakte/android/data/ApiApplication$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 206
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/ApiApplication$1;->createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/data/ApiApplication;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 212
    new-array v0, p1, [Lcom/vkontakte/android/data/ApiApplication;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 206
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/ApiApplication$1;->newArray(I)[Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v0

    return-object v0
.end method
