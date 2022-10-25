.class final Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$3;
.super Ljava/lang/Object;
.source "MessagesPhotoUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;
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
        "Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;
    .locals 2
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 118
    new-instance v0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;-><init>(Landroid/os/Parcel;Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 116
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$3;->createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 122
    new-array v0, p1, [Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 116
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$3;->newArray(I)[Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;

    move-result-object v0

    return-object v0
.end method
