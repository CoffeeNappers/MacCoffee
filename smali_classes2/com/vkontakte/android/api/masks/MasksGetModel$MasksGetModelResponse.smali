.class public Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;
.super Ljava/lang/Object;
.source "MasksGetModel.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/masks/MasksGetModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MasksGetModelResponse"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final modelVersion:I

.field public final url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "modelVersion"    # I
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput p1, p0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->modelVersion:I

    .line 32
    iput-object p2, p0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->url:Ljava/lang/String;

    .line 33
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->modelVersion:I

    .line 53
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->url:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const-string/jumbo v0, "model_version"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->modelVersion:I

    .line 37
    const-string/jumbo v0, "model_url"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->url:Ljava/lang/String;

    .line 38
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 47
    iget v0, p0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->modelVersion:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 49
    return-void
.end method
