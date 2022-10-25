.class final Lcom/vkontakte/android/upload/VideoStoryUploadTask$2;
.super Ljava/lang/Object;
.source "VideoStoryUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/upload/VideoStoryUploadTask;
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
        "Lcom/vkontakte/android/upload/VideoStoryUploadTask;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/upload/VideoStoryUploadTask;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 236
    new-instance v0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 233
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/VideoStoryUploadTask$2;->createFromParcel(Landroid/os/Parcel;)Lcom/vkontakte/android/upload/VideoStoryUploadTask;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/upload/VideoStoryUploadTask;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 241
    new-array v0, p1, [Lcom/vkontakte/android/upload/VideoStoryUploadTask;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 233
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/VideoStoryUploadTask$2;->newArray(I)[Lcom/vkontakte/android/upload/VideoStoryUploadTask;

    move-result-object v0

    return-object v0
.end method
